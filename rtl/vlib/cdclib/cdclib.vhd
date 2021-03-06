-- $Id: cdclib.vhd 984 2018-01-02 20:56:27Z mueller $
--
-- Copyright 2016- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
-- This program is free software; you may redistribute and/or modify it under
-- the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 3, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for complete details.
--
------------------------------------------------------------------------------
-- Package Name:   cdclib
-- Description:    clock domain crossing components
--
-- Dependencies:   -
-- Tool versions:  viv 2016.1-2016.2; ghdl 0.33
-- Revision History: 
-- Date         Rev Version  Comment
-- 2016-06-11   774   1.0.1  add cdc_signal_s1_as; add INIT generic
-- 2016-04-02   757   1.0    Initial version 
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.slvtypes.all;

package cdclib is

component cdc_signal_s1 is              -- cdc for signal (2 stage)
  generic (
    INIT : slbit := '0');               -- initial state
  port (
    CLKO : in slbit;                    -- O|output clock
    DI   : in slbit;                    -- I|input data
    DO   : out slbit                    -- O|output data
  );
end component;

component cdc_signal_s1_as is           -- cdc for signal (2 stage), asyn input
  generic (
    INIT : slbit := '0');               -- initial state
  port (
    CLKO : in slbit;                    -- O|output clock
    DI   : in slbit;                    -- I|input data
    DO   : out slbit                    -- O|output data
  );
end component;

component cdc_vector_s0 is              -- cdc for vector (1 stage)
  generic (
    DWIDTH : positive := 16);           -- data port width
  port (
    CLKO : in slbit;                    -- O|output clock
    DI   : in slv(DWIDTH-1 downto 0);   -- I|input data
    DO   : out slv(DWIDTH-1 downto 0)   -- O|output data
  );
end component;

component cdc_vector_s1 is              -- cdc for vector (2 stage)
  generic (
    DWIDTH : positive := 16);           -- data port width
  port (
    CLKO : in slbit;                    -- O|output clock
    DI   : in slv(DWIDTH-1 downto 0);   -- I|input data
    DO   : out slv(DWIDTH-1 downto 0)   -- O|output data
  );
end component;

component cdc_pulse is                  -- clock domain crossing for a pulse
  generic (
    POUT_SINGLE : boolean := false;     -- if true: single cycle pout
    BUSY_WACK : boolean := false;       -- if true: busy waits for ack
    INIT : slbit := '0');               -- initial state
  port (
    CLKM : in slbit;                    -- M|clock master
    RESET : in slbit := '0';            -- M|reset
    CLKS : in slbit;                    -- S|clock slave
    PIN : in slbit;                     -- M|pulse in
    BUSY : out slbit;                   -- M|busy
    POUT : out slbit                    -- S|pulse out
  );
end component;

component cdc_value is                  -- cdc for value (slow change)
  generic (
    DWIDTH : positive := 16);           -- data port width
  port (
    CLKO : in slbit;                    -- O|output clock
    DI   : in slv(DWIDTH-1 downto 0);   -- I|input data
    DO   : out slv(DWIDTH-1 downto 0);  -- O|output data
    DFIX : out slbit                    -- O|output data frozen
  );
end component;

end package cdclib;
