-- $Id: tb_tst_sram_n2.vhd 984 2018-01-02 20:56:27Z mueller $
--
-- Copyright 2010- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
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
-- Module Name:    tb_tst_sram_n2
-- Description:    Configuration for tb_tst_sram_s2 for tb_nexys2
--
-- Dependencies:   sys_tst_sram_n2
--
-- To test:        sys_tst_sram_n2
--
-- Verified:
-- Date         Rev  Code  ghdl  ise          Target     Comment
-- 2010-05-24   294  -     0.26  11.4   L68   xc3s1200e  u:ok
-- 
-- Revision History: 
-- Date         Rev Version  Comment
-- 2010-05-24   294   1.0    Initial version 
------------------------------------------------------------------------------

configuration tb_tst_sram_n2 of tb_nexys2 is

  for sim
    for all : nexys2_aif
      use entity work.sys_tst_sram_n2;
    end for;
  end for;

end tb_tst_sram_n2;
