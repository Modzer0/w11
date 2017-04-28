// $Id: Rw11Cpu.ipp 887 2017-04-28 19:32:52Z mueller $
//
// Copyright 2013-2017 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
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
// 2017-02-17   851   1.2.2  probe/setup auxilliary devices: kw11l,kw11p,iist
// 2015-07-12   700   1.2.1  use ..CpuAct instead ..CpuGo (new active based lam)
// 2015-03-21   659   1.2    add RAddrMap
// 2014-12-25   621   1.1    Adopt for 4k word ibus window; add IAddrMap
// 2013-04-12   504   1.0    Initial version
// 2013-01-27   478   0.1    First draft
// ---------------------------------------------------------------------------

/*!
  \file
  \brief   Implemenation (inline) of Rw11Cpu.
*/

// all method definitions in namespace Retro
namespace Retro {

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline Rw11& Rw11Cpu::W11() const
{
  return *fpW11;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline RlinkServer& Rw11Cpu::Server() const
{
  return fpW11->Server();
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline RlinkConnect& Rw11Cpu::Connect() const
{
  return fpW11->Connect();
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline RlogFile& Rw11Cpu::LogFile() const
{
  return fpW11->LogFile();
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const std::string& Rw11Cpu::Type() const
{
  return fType;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline size_t Rw11Cpu::Index() const
{
  return fIndex;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline uint16_t Rw11Cpu::Base() const
{
  return fBase;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline uint16_t Rw11Cpu::IBase() const
{
  return fIBase;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::HasScnt() const
{
  return fHasScnt;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::HasCmon() const
{
  return fHasCmon;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline uint16_t Rw11Cpu::HasHbpt() const
{
  return fHasHbpt;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::HasIbmon() const
{
  return fHasIbmon;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::HasKw11l() const
{
  return fHasKw11l;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::HasKw11p() const
{
  return fHasKw11p;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::HasIist() const
{
  return fHasIist;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline uint16_t Rw11Cpu::CpuStat() const
{
  return fCpuStat;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::CpuAct() const
{
  return fCpuAct;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline uint16_t Rw11Cpu::IbusRemoteAddr(uint16_t ibaddr) const
{
  return fIBase + (ibaddr & 017777)/2;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::IAddrMapInsert(const std::string& name, uint16_t ibaddr)
{
  return fIAddrMap.Insert(name, ibaddr);
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::IAddrMapErase(const std::string& name)
{
  return fIAddrMap.Erase(name);
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::IAddrMapErase(uint16_t ibaddr)
{
  return fIAddrMap.Erase(ibaddr);
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline void Rw11Cpu::IAddrMapClear()
{
  return fIAddrMap.Clear();
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const RlinkAddrMap& Rw11Cpu::IAddrMap() const
{
  return fIAddrMap;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::RAddrMapInsert(const std::string& name, uint16_t ibaddr)
{
  return fRAddrMap.Insert(name, ibaddr);
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::RAddrMapErase(const std::string& name)
{
  return fRAddrMap.Erase(name);
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline bool Rw11Cpu::RAddrMapErase(uint16_t ibaddr)
{
  return fRAddrMap.Erase(ibaddr);
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline void Rw11Cpu::RAddrMapClear()
{
  return fRAddrMap.Clear();
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const RlinkAddrMap& Rw11Cpu::RAddrMap() const
{
  return fRAddrMap;
}

//------------------------------------------+-----------------------------------
//! FIXME_docs

inline const Rstats& Rw11Cpu::Stats() const
{
  return fStats;
}

} // end namespace Retro
