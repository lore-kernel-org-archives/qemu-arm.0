Received: by 10.182.105.169 with SMTP id gn9csp901309obb;
        Sun, 8 Nov 2015 17:16:14 -0800 (PST)
X-Received: by 10.141.23.82 with SMTP id z79mr28183390qhd.39.1447031774232;
        Sun, 08 Nov 2015 17:16:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z85si9309505qka.78.2015.11.08.17.16.14
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:16:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb49-000601-Ru
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:16:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0001KZ-4p
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1J-0007ts-Kp
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:22 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:33212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1J-0007re-Hw; Sun, 08 Nov 2015 20:13:17 -0500
Received: by qkas77 with SMTP id s77so61962149qka.0;
	Sun, 08 Nov 2015 17:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=R6sdd8VzGvyLT6ykX6gaj3KhJY5hoiCVqLYdtvDU3+w=;
	b=O4fw/Qbm1q1VRfAzYEM2qYiZyL2b//FqajOwzCCOyAyZZQ2cRI0g6UrplCgI5AbUAY
	GjYhC5w0N5vuJhsbjqiCiZqupZe71+48eI+bW8Nn+ff9zDkV2025jZ2/DoeS4Q/CrK++
	lBB1TLhbEzbs/4kbFkf66hp6wuvmlkS2orCJCHD/lzb+pFoC02nORu+8wL9dndOrykkl
	CWsPEfTYQYcZz3rpxzhi8Jvk7D/Odi4C0qYqumaWYOV8CzWnDEZ2jdFQOKShj2regRXA
	WWi3kkmoZ2ACOjDzavkau42eYU5V3ZQXnmH17Xg26jThpgP5P0X+TPMvutuI4wnJH1rD
	ejIA==
X-Received: by 10.55.19.213 with SMTP id 82mr27115669qkt.51.1447031595806;
	Sun, 08 Nov 2015 17:13:15 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:15 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:27 -0500
Message-Id: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 00/18] Fix exception handling and msr/mrs access
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
X-TUID: xa3+qS3lYGgq

This series grew from a previous incorrect patch attempting to fix some incorrect behavior.  After spending some time going through the arch. ref. manual for v7-M I think I understand better how this should work and have made a number of changes which actually improve the situation.

These changes have not yet been cross checked against real hardware, and I therefore don't consider them mergeable.  It's gotten big enough though that I'd like to get some feedback.

I think the changes in this series effect only ARMv7-M specific code with the exception of removing references to NVIC from the GIC code.

* Add unprivileged access case for MRS/MSR instructions
* Priority based exception masking with PRIMASK, FAULTMASK, and BASEPRI.
* Auto-clear FAULTMASK on exception return (except NMI)
* Validation and consistency checking on exception return
* Exception priorities using PRIGROUP
* Exception escalation to HardFault when priority permits
* Escalation to unrecoverable exception otherwise (though the action is not correct, see below)
* Correct calculation of the RETTOBASE field of ICSR
* Remove the need for the armv7m.hack MemoryRegion to catch exception returns
* Fill in previously unimplemented HFSR, CFSR, and CCR registers

This series removes the dependence of the NVIC code on the GIC.  The GIC doesn't have the concept of PRIGROUP to change the size of the group priority field.  Also, there are a lot of cases in this code which I don't understand and worry about breaking.  Now that I have things working (I think), I could look at recombining them if this is desired.

Some additional state is also added to v7m in struct CPUARMState so that all the information needed
in arm_v7m_cpu_exec_interrupt() is found in one place.  I started by having this state split between CPU and struct nvic_state, but found this confusing.  Some guidance would be helpful.

I add a pointer to ARMCPU* in struct nvic_state which is populated in armv7m_nvic_realize().  I think this is reasonable given the tight coupling between NVIC and CPU, but it does look ugly.

At the moment I've left the action of an unrecoverable exception to call cpu_abort().  I'm not sure of the value of implementing the actual defined behavior in the context of QEMU.

I've tried to add VMState as appropriate, but have not tested it.

I looked briefly at qtest, but can't quite see how to use it given the need to execute code to test most of the exception behavior.  Is something like this feasible at present?

Regards,
Michael


Michael Davidsaver (18):
  armv7m: MRS/MSR handle unprivileged access
  armv7m: Undo armv7m.hack
  armv7m: Complain about incorrect exception table entries.
  armv7m: Explicit error for bad vector table
  armv7m: expand NVIC state
  armv7m: new NVIC utility functions
  armv7m: Update NVIC registers
  armv7m: fix RETTOBASE
  armv7m: NVIC update vmstate
  armv7m: NVIC initialization
  armv7m: fix I and F flag handling
  armv7m: simpler/faster exception start
  armv7m: implement CFSR and HFSR
  armv7m: auto-clear FAULTMASK
  arm: gic: Remove references to NVIC
  armv7m: check exception return consistency
  armv7m: implement CCR
  armv7m: prevent unprivileged write to STIR

 hw/arm/armv7m.c          |   8 -
 hw/intc/arm_gic.c        |  14 +-
 hw/intc/arm_gic_common.c |  23 +-
 hw/intc/armv7m_nvic.c    | 777 ++++++++++++++++++++++++++++++++++++-----------
 hw/intc/gic_internal.h   |   7 +-
 target-arm/cpu.c         |  44 +--
 target-arm/cpu.h         |  35 ++-
 target-arm/helper.c      | 222 ++++++++++----
 target-arm/machine.c     |   7 +-
 9 files changed, 843 insertions(+), 294 deletions(-)

-- 
2.1.4

