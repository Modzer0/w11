// $Id: RtclRw11CntlStreamBase.hpp 887 2017-04-28 19:32:52Z mueller $
//
// Copyright 2017- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
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
// 2017-04-16   878   1.0    Initial version
// ---------------------------------------------------------------------------


/*!
  \file
  \brief   Declaration of class RtclRw11CntlStreamBase.
*/

#ifndef included_Retro_RtclRw11CntlStreamBase
#define included_Retro_RtclRw11CntlStreamBase 1

#include "boost/shared_ptr.hpp"

#include "RtclRw11CntlBase.hpp"

namespace Retro {

  template <class TC>
  class RtclRw11CntlStreamBase : public RtclRw11CntlBase<TC> {
    public:
      explicit      RtclRw11CntlStreamBase(const std::string& type,
                                         const std::string& cclass);
                   ~RtclRw11CntlStreamBase();

    protected:
      virtual int   M_default(RtclArgs& args);
  };
  
} // end namespace Retro

// implementation is all inline
#include "RtclRw11CntlStreamBase.ipp"

#endif
