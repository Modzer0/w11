// $Id: RtclRw11CntlRHRP.hpp 887 2017-04-28 19:32:52Z mueller $
//
// Copyright 2015-2017 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
//
// This program is free software; you may redistribute and/or modify it under
// the terms of the GNU General Public License as published by the Free
// Software Foundation, either version 2, or at your option any later version.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTABILITY
// or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for complete details.
// 
// Revision History: 
// Date         Rev Version  Comment
// 2017-04-16   878   1.1    derive from RtclRw11CntlDiskBase
// 2015-05-14   680   1.0    Initial version
// 2015-03-21   659   0.1    First draft
// ---------------------------------------------------------------------------


/*!
  \file
  \brief   Declaration of class RtclRw11CntlRHRP.
*/

#ifndef included_Retro_RtclRw11CntlRHRP
#define included_Retro_RtclRw11CntlRHRP 1

#include "RtclRw11CntlDiskBase.hpp"
#include "librw11/Rw11CntlRHRP.hpp"

namespace Retro {

  class RtclRw11CntlRHRP : public RtclRw11CntlDiskBase<Rw11CntlRHRP> {
    public:
                    RtclRw11CntlRHRP();
                   ~RtclRw11CntlRHRP();

      virtual int   FactoryCmdConfig(RtclArgs& args, RtclRw11Cpu& cpu);

    protected:
      virtual int   M_stats(RtclArgs& args);
  };
  
} // end namespace Retro

//#include "RtclRw11CntlRHRP.ipp"

#endif
