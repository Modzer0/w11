// $Id: RparseUrl.ipp 983 2018-01-02 20:35:59Z mueller $
//
// Copyright 2013- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
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
// 2013-02-03   481   1.0    Initial version, extracted from RlinkPort
// ---------------------------------------------------------------------------

/*!
  \file
  \brief   Implemenation (inline) of RparseUrl.
*/

// all method definitions in namespace Retro
namespace Retro {

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline void RparseUrl::SetPath(const std::string& path)
{
  fPath = path;
  return;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const std::string& RparseUrl::Url() const
{
  return fUrl;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const std::string& RparseUrl::Scheme() const
{
  return fScheme;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const std::string& RparseUrl::Path() const
{
  return fPath;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const RparseUrl::omap_t& RparseUrl::Opts() const
{
  return fOptMap;
}


} // end namespace Retro
