-- $Id: tb_arty.vhd 740 2016-03-06 20:56:56Z mueller $
--
-- Copyright 2016- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
-- This program is free software; you may redistribute and/or modify it under
-- the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2, or at your option any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for complete details.
-- 
------------------------------------------------------------------------------
-- Module Name:    tb_arty - sim
-- Description:    Test bench for arty (base)
--
-- Dependencies:   simlib/simclk
--                 simlib/simclkcnt
--                 rlink/tbcore/tbcore_rlink
--                 xlib/tb/s7_cmt_sfs_tb
--                 tb_basys3_core
--                 serport/tb/serport_master_tb
--                 arty_aif [UUT]
--
-- To test:        generic, any arty_aif target
--
-- Target Devices: generic
-- Tool versions:  viv 2015.4; ghdl 0.33
--
-- Revision History: 
-- Date         Rev Version  Comment
-- 2016-03-06   740   1.1    add A_VPWRN/P to baseline config
-- 2016-02-20   734   1.0.2  use s7_cmt_sfs_tb to avoid xsim conflict
-- 2016-02-13   730   1.0.1  direct instantiation of tbcore_rlink
-- 2016-01-31   726   1.0    Initial version (derived from tb_basys3)
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.slvtypes.all;
use work.rlinklib.all;
use work.xlib.all;
use work.artylib.all;
use work.simlib.all;
use work.simbus.all;
use work.sys_conf.all;

entity tb_arty is
end tb_arty;

architecture sim of tb_arty is
  
  signal CLKOSC : slbit := '0';         -- board clock (100 Mhz)
  signal CLKCOM : slbit := '0';         -- communication clock

  signal CLK_STOP : slbit := '0';
  signal CLKCOM_CYCLE : integer := 0;

  signal RESET : slbit := '0';
  signal CLKDIV : slv2 := "00";         -- run with 1 clocks / bit !!
  signal RXDATA : slv8 := (others=>'0');
  signal RXVAL : slbit := '0';
  signal RXERR : slbit := '0';
  signal RXACT : slbit := '0';
  signal TXDATA : slv8 := (others=>'0');
  signal TXENA : slbit := '0';
  signal TXBUSY : slbit := '0';

  signal I_RXD : slbit := '1';
  signal O_TXD : slbit := '1';
  signal I_SWI : slv4 := (others=>'0');
  signal I_BTN : slv4 := (others=>'0');
  signal O_LED : slv4 := (others=>'0');
  signal O_RGBLED0 : slv3 := (others=>'0');
  signal O_RGBLED1 : slv3 := (others=>'0');
  signal O_RGBLED2 : slv3 := (others=>'0');
  signal O_RGBLED3 : slv3 := (others=>'0');

  constant clock_period : time :=  10 ns;
  constant clock_offset : time := 200 ns;

begin
  
  CLKGEN : simclk
    generic map (
      PERIOD => clock_period,
      OFFSET => clock_offset)
    port map (
      CLK      => CLKOSC,
      CLK_STOP => CLK_STOP
    );
  
  CLKGEN_COM : entity work.s7_cmt_sfs_tb
    generic map (
      VCO_DIVIDE   => sys_conf_clkser_vcodivide,
      VCO_MULTIPLY => sys_conf_clkser_vcomultiply,
      OUT_DIVIDE   => sys_conf_clkser_outdivide,
      CLKIN_PERIOD => 10.0,
      CLKIN_JITTER => 0.01,
      STARTUP_WAIT => false,
      GEN_TYPE     => sys_conf_clkser_gentype)
    port map (
      CLKIN   => CLKOSC,
      CLKFX   => CLKCOM,
      LOCKED  => open
    );

  CLKCNT : simclkcnt port map (CLK => CLKCOM, CLK_CYCLE => CLKCOM_CYCLE);

  TBCORE : entity work.tbcore_rlink
    port map (
      CLK      => CLKCOM,
      CLK_STOP => CLK_STOP,
      RX_DATA  => TXDATA,
      RX_VAL   => TXENA,
      RX_HOLD  => TXBUSY,
      TX_DATA  => RXDATA,
      TX_ENA   => RXVAL
    );

  ARTYCORE : entity work.tb_arty_core
    port map (
      I_SWI       => I_SWI,
      I_BTN       => I_BTN
    );

  UUT : arty_aif
    port map (
      I_CLK100    => CLKOSC,
      I_RXD       => I_RXD,
      O_TXD       => O_TXD,
      I_SWI       => I_SWI,
      I_BTN       => I_BTN,
      O_LED       => O_LED,
      O_RGBLED0   => O_RGBLED0,
      O_RGBLED1   => O_RGBLED1,
      O_RGBLED2   => O_RGBLED2,
      O_RGBLED3   => O_RGBLED3,
      A_VPWRN     => (others=>'0'),
      A_VPWRP     => (others=>'0')
    );
  
  SERMSTR : entity work.serport_master_tb
    generic map (
      CDWIDTH => CLKDIV'length)
    port map (
      CLK     => CLKCOM,
      RESET   => RESET,
      CLKDIV  => CLKDIV,
      ENAXON  => '0',                   -- FIXME:  or 1 ???
      ENAESC  => '0',
      RXDATA  => RXDATA,
      RXVAL   => RXVAL,
      RXERR   => RXERR,
      RXOK    => '1',
      TXDATA  => TXDATA,
      TXENA   => TXENA,
      TXBUSY  => TXBUSY,
      RXSD    => O_TXD,
      TXSD    => I_RXD,
      RXRTS_N => open,
      TXCTS_N => '0'
    );

  proc_moni: process
    variable oline : line;
  begin
    
    loop
      wait until rising_edge(CLKCOM);

      if RXERR = '1' then
        writetimestamp(oline, CLKCOM_CYCLE, " : seen RXERR=1");
        writeline(output, oline);
      end if;
      
    end loop;
    
  end process proc_moni;

end sim;
