# $Id: util.tcl 985 2018-01-03 08:59:40Z mueller $
#
# Copyright 2011-2017 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
#
# This program is free software; you may redistribute and/or modify it under
# the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for complete details.
#
#  Revision History:
# Date         Rev Version  Comment
# 2017-04-22   883   2.0.1  setup: now idempotent
# 2014-11-09   603   2.0    use rlink v4 address layout
# 2011-03-19   372   1.0    Initial version
#

package provide rbbram 1.0

namespace eval rbbram {
  #
  # setup register descriptions for rbd_bram
  #
  regdsc CNTL {nbusy 15 6} {addr 9 10}
  #
  # setup: amap definitions for rbd_bram
  # 
  proc setup {base} {
    if {[rlc amap -testname br.cntl $base]} {return}
    rlc amap -insert br.cntl [expr {$base + 0x00}]
    rlc amap -insert br.data [expr {$base + 0x01}]
  }
  #
  # init: reset rbd_bram (clear cntl register)
  # 
  proc init {} {
    rlc exec -wreg br.cntl 0x0000
  }
}
