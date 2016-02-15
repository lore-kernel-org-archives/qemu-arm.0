Received: by 10.25.208.211 with SMTP id h202csp850183lfg;
        Mon, 15 Feb 2016 09:25:35 -0800 (PST)
X-Received: by 10.140.254.9 with SMTP id z9mr22992456qhc.5.1455557131447;
        Mon, 15 Feb 2016 09:25:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j69si35304916qga.6.2016.02.15.09.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMtu-0004QO-Pz
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:25:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrc-0000Ym-L9
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrb-0007oX-FC
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:08 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrb-0007mW-8M; Mon, 15 Feb 2016 12:23:07 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrR-0000xK-Nu; Mon, 15 Feb 2016 17:22:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:46 +0000
Message-Id: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 00/11] target-arm: clean up cpsr_write mode
	changing
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SARIQ6LF6AyO

This patchset cleans up our usage of cpsr_write() somewhat, and in
particular its handling of attempts to change the MODE bits.
Currently we use cpsr_write() for multiple purposes:
 * writes on inbound migration and sync with KVM, where we want
   a raw "just write these bits" and have to actively mess with
   uncached_cpsr before the write to avoid it doing a register bank
   switch
 * writes caused by guest instructions MSR and CPS
 * writes caused by guest 32-bit exception returns
 * a few other things like the gdb stub

However the required handling differs for these different cases;
in particular the set of conditions which are architecturally
defined to be an illegal mode switch is different for writes due
to MSR/CPS versus writes due to exception returns.
To fix this we add an extra argument to cpsr_write() which is an
enum indicating what kind of write is being performed.

This allows us to drop the irritating "manually write the mode
bits before the call" code in KVM/migration (and fix a bug where
we missed this out in 32-bit KVM!). We can also add the various
missing conditions:
 * changes to hyp mode
 * changes from hyp mode by MSR/CPS
 * changes to Mon from Secure EL1
 * changes from Mon to NS PL1 when HCR.TGE is set

Finally we can implement the v8 behaviour of setting PSTATE.IL
for illegal mode changes.

The series also fixes the behaviour of attempted illegal mode
changes from the gdb stub -- we ignore them, but don't set PSTATE.IL.
(Previously we had a slightly weird setup where we would permit
changes from User to the PL1 modes but not to Mon.) Not permitting
illegal changes from the debugger:
 * means we don't have to consider weird "transition is possible
   but only for the debugger" corner cases
 * matches the behaviour of a JTAG debugger doing external debug
   on real ARM hardware, where architecturally the illegal state
   transitions are enforced

PS: we don't currently implement the PSTATE.IL "any attempt to
execute an insn will UNDEF" behaviour, but it would not be hard
to add.

thanks
-- PMM


Peter Maydell (11):
  target-arm: Give CPSR setting on 32-bit exception return its own
    helper
  target-arm: Add write_type argument to cpsr_write()
  target-arm: Raw CPSR writes should skip checks and bank switching
  linux-user: Use restrictive mask when calling cpsr_write()
  target-arm: In cpsr_write() ignore mode switches from User mode
  target-arm: Add comment about not implementing NSACR.RFR
  target-arm: Add Hyp mode checks to bad_mode_switch()
  target-arm: Forbid mode switch to Mon from Secure EL1
  target-arm: In v8, make illegal AArch32 mode changes set PSTATE.IL
  target-arm: Make mode switches from Hyp via CPS and MRS illegal
  target-arm: Make Monitor->NS PL1 mode changes illegal if HCR.TGE is 1

 linux-user/arm/nwfpe/fpa11.h |  2 +-
 linux-user/main.c            |  7 +++---
 linux-user/signal.c          |  4 ++--
 target-arm/cpu.h             | 13 +++++++++--
 target-arm/gdbstub.c         |  2 +-
 target-arm/helper.c          | 54 ++++++++++++++++++++++++++++++++++++--------
 target-arm/helper.h          |  1 +
 target-arm/kvm32.c           |  2 +-
 target-arm/kvm64.c           |  3 +--
 target-arm/machine.c         |  4 +---
 target-arm/op_helper.c       | 15 +++++++++---
 target-arm/translate.c       |  6 ++---
 12 files changed, 83 insertions(+), 30 deletions(-)

-- 
1.9.1

