// $Id: RosFill.hpp 983 2018-01-02 20:35:59Z mueller $
//
// Copyright 2000-2011 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
//
// This program is free software; you may redistribute and/or modify it under
// the terms of the GNU General Public License as published by the Free
// Software Foundation, either version 3, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTABILITY
// or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for complete details.
// 
// Revision History: 
// Date         Rev Version  Comment
// 2011-02-25   364   1.1    Support << also to string
// 2011-01-30   359   1.0    Adopted from CTBosFill
// 2000-02-06     -   -      Last change on CTBosFill
// ---------------------------------------------------------------------------

/*!
  \file
  \brief   Declaration of class RosFill .
*/

#ifndef included_Retro_RosFill
#define included_Retro_RosFill 1

#include <ostream>
#include <string>

namespace Retro {
  
  class RosFill {
    public: 
		    RosFill(int count=0, char fill=' ');

      int           Count() const;
      char          Fill() const;

  private:
      int           fCount;		    //!< blank count
      char	    fFill;		    //!< fill character

  };

  std::ostream&	    operator<<(std::ostream& os, const RosFill& obj);
  std::string& 	    operator<<(std::string&  os, const RosFill& obj);

} // end namespace Retro

#include "RosFill.ipp"

#endif
