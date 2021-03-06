// copyright and includes {{{1
// Contributed by David Munday
//                Jose Renau
//
// The ESESC/BSD License
//
// Copyright (c) 2005-2013, Regents of the University of California and 
// the ESESC Project.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//   - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//
//   - Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the distribution.
//
//   - Neither the name of the University of California, Santa Cruz nor the
//   names of its contributors may be used to endorse or promote products
//   derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#include "SescConf.h"
#include "MemorySystem.h"
#include "MemXBar.h"

/* }}} */

MemXBar::MemXBar(MemorySystem* current ,const char *section ,const char *name)
  /* constructor {{{1 */
  : GXBar(section, name)
  ,readHit          ("%s:readHit",         name)
  ,writeHit         ("%s:writeHit",         name)

{
  char * tmp;
  printf("building a memXbar named:%s\n",name);  
  Xbar_unXbar_balance++; //increment balance of XBars
  lower_level_banks = NULL; 

  SescConf->isInt(section, "lowerLevelBanks");
  SescConf->isInt(section, "LineSize");
  SescConf->isInt(section, "Modfactor");

  numLowerLevelBanks = SescConf->getInt(section, "lowerLevelBanks");
  LineSize           = SescConf->getInt(section, "LineSize");
  Modfactor          = SescConf->getInt(section, "Modfactor");

  SescConf->isPower2(section,"lowerLevelBanks");
  SescConf->isGT(section,"lowerLevelBanks",0);

  if(Modfactor < numLowerLevelBanks){
    printf("ERROR: XBAR: %s does not have a Modfactor(%d) bigger than the number of structures(%d) below it!\n",name,Modfactor,numLowerLevelBanks);
    exit(1);
  }

  lower_level_banks = new MemObj*[numLowerLevelBanks];

  std::vector<char *> vPars = SescConf->getSplitCharPtr(section, "lowerLevel");
  //size_t size = strlen(vPars[0]);

  for(size_t i=0;i<numLowerLevelBanks;i++) {    
    //lower_level_banks[i] = current->declareMemoryObj(section, "lowerLevel");   
    tmp = (char*)malloc(255);
    sprintf(tmp,"%s(%lu)",vPars[0],i);
    lower_level_banks[i] = current->declareMemoryObj_uniqueName(tmp,vPars[0]);         
    addLowerLevel(lower_level_banks[i]);
  }

  if(Xbar_unXbar_balance !=0){
    printf("ERROR: Crossbars and UnCrossbars are unbalanced: %d\n",Xbar_unXbar_balance);
    exit(1);
  }
    
  //free(tmp);
  I(current);
}
/* }}} */

void MemXBar::doReq(MemRequest *mreq)
  /* read if splitter above L1 (down) {{{1 */
{
  if(mreq->getAddr() == 0) {
    mreq->ack();
    return;
  } 
  readHit.inc(mreq->getStatsFlag());
  uint32_t pos = addrHash(mreq->getAddr(),LineSize,Modfactor,numLowerLevelBanks);  
  router->scheduleReqPos(pos, mreq);
}
/* }}} */

void MemXBar::doReqAck(MemRequest *mreq)
  /* req ack (up) {{{1 */
{
  if(mreq->isHomeNode()) {
    mreq->ack();
    return;
  }
  router->scheduleReqAck(mreq); 
}
/* }}} */

void MemXBar::doSetState(MemRequest *mreq)
  /* setState (up) {{{1 */
{  
  router->sendSetStateAll(mreq, mreq->getAction());
}
/* }}} */

void MemXBar::doSetStateAck(MemRequest *mreq)
  /* setStateAck (down) {{{1 */
{
  uint32_t pos = addrHash(mreq->getAddr(),LineSize, Modfactor,numLowerLevelBanks);
  router->scheduleSetStateAckPos(pos, mreq);
	I(0); 
	// FIXME: use dinst->getPE() to decide who to send up if GPU mode
}
/* }}} */

void MemXBar::doDisp(MemRequest *mreq)
  /* disp (down) {{{1 */
{
  uint32_t pos = addrHash(mreq->getAddr(),LineSize, Modfactor,numLowerLevelBanks);
  router->scheduleDispPos(pos, mreq);
	I(0); 
	// FIXME: use dinst->getPE() to decide who to send up if GPU mode
}
/* }}} */

bool MemXBar::isBusy(AddrType addr) const
/* always can accept writes {{{1 */
{
  uint32_t pos = addrHash(addr,LineSize,Modfactor,numLowerLevelBanks);
  return router->isBusyPos(pos, addr);
}
/* }}} */

TimeDelta_t MemXBar::ffread(AddrType addr)
  /* fast forward reads {{{1 */
{ 
  uint32_t pos = addrHash(addr,LineSize, Modfactor,numLowerLevelBanks);
  return router->ffreadPos(pos, addr);
}
/* }}} */

TimeDelta_t MemXBar::ffwrite(AddrType addr)
  /* fast forward writes {{{1 */
{ 
  uint32_t pos = addrHash(addr,LineSize, Modfactor,numLowerLevelBanks);
  return router->ffwritePos(pos, addr);
}
/* }}} */

