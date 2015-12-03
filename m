Received: by 10.182.158.201 with SMTP id ww9csp3413428obb;
        Wed, 2 Dec 2015 16:22:00 -0800 (PST)
X-Received: by 10.140.106.201 with SMTP id e67mr7749700qgf.80.1449102120577;
        Wed, 02 Dec 2015 16:22:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si1714578qka.23.2015.12.02.16.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Heq-0000la-7Z
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:22:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc0-00049A-AE
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hbw-0001vp-9t
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:04 -0500
Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236]:34945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hbw-0001vh-5Y; Wed, 02 Dec 2015 19:19:00 -0500
Received: by qgec40 with SMTP id c40so48205991qge.2;
	Wed, 02 Dec 2015 16:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=R4OrXqk0ifkdLSGkFpRVFvfGCjNfX+/OF/mNxeoW6lA=;
	b=unMDqv0VS657ifN4+vnalAgDV84gR97VpbSYED0WrZ9V8VCEOx4cckuW66QaF2PKy9
	Y8XC6hl3ydhD0ubgVH4bWbES0XGmVBdRYPPvfyKXLv6zF39uxAOdkbGrnAPAcdwcN/Ej
	ZfPcETtHOnRkKjreVMlHZyqsu5axO+PxlC2jkIaYlL+mxMaRq9vtZy9fFhzPdVkOtqcV
	ASG3GlRMVm4c8Urk5HwZ4jIA91CWe8qqHJ+yRtFdpW+V0evIY48xerQZPYJfiLsFCmKq
	8XJ8MxtymZn4O9F6hrM8ifaAHduGPDC9skWb47dYmrvoF8MWZAlEtqrq8yQdm1noU+bi
	688w==
X-Received: by 10.140.95.2 with SMTP id h2mr7554392qge.91.1449101939677;
	Wed, 02 Dec 2015 16:18:59 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.18.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:18:59 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:27 -0500
Message-Id: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::236
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 00/26] armv7m: exception handling, MPU,
	and more
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
X-TUID: vHlz3fdU9ncb

All,

Second revision of ARMv7-M exception handling patchset, which now adds MPU support (as well as can be done).

Parts of this series are informed by the previous work of Alex Zuepke.

This time I have access to a EK-TM4C1294XL eval board (cortex-m4f), and have done some cross-checks using test programs of my own[1].  There are differences in some corner cases, but mostly agreement (certainly better than before).

This series attempts to fix the exception masking and priority escalation behavour, and in the process removes the dependence of the NVIC on the shared GIC code.  It also fills out some of the missing fault reporting registers.

The CCR register is also added, mainly to implement the STACKALIGN bit.  I've also made an attempt on USERSETMPEND.  BFHFNMIGN, DIV_0_TRP, UNALIGN_TRP remain unimplemnted.

Additional checks are added to do_v7m_exception_exit() to capture the faults which should arise when the guest stack gets out of sync with the CPU's state.

In cross-checking with a real device I also found that the behavour of CONTROL bit 1 wasn't as spec'd in exception handlers.

I also "discovered" that many v7-M targets don't implement all 8 bits of the priority registers (the TM4C1294 only has 3).  So I've added a Property to allow this to be set appropriately.

This led me to make some changes to allow board code to actually set this Property, which entailed splitting armv7m_init() in two parts, and associated changes to the stellaris and stm32f205 boards.

I'm not completely happy with the level of compatibility with the MPU.  For my own purposes it's good enough as I can make special builds.  However, the additional alignment and size restrictions imposed by the common TLB and 1024 page size will probably break most unmodified guests using the MPU.  I can't see any way around this short of changes to the TLB code, or a seperate build with TARGET_PAGE_BITS==5.  I'm not inclined to undertake either.

Should this part of the series be dropped?

Michael


[1] https://github.com/mdavidsaver/baremetal/tree/qemutest


Michael Davidsaver (26):
  armv7m: MRS/MSR handle unprivileged access
  armv7m: Undo armv7m.hack
  armv7m: Explicit error for bad vector table
  armv7m: additional cpu state for exception handling
  armv7m: add armv7m_excp_running_prio()
  armv7m: fix I and F flag handling
  armv7m: simpler/faster exception start
  armv7m: rewrite NVIC
  armv7m: implement CFSR, HFSR, BFAR, and MMFAR
  armv7m: auto-clear FAULTMASK
  arm: gic: Remove references to NVIC
  armv7m: check exception return consistency
  armv7m: implement CCR
  armv7m: prevent unprivileged write to STIR
  armv7m: add MPU to cortex-m3 and cortex-m4
  armv7m: add some mpu debugging prints
  armv7m: mpu background miss is perm fault
  armv7m: update base region policy
  armv7m: mpu not allowed to map exception return codes
  armv7m: observable initial register state
  armv7m: CONTROL<1> handling
  armv7m: priority field mask
  qom: add cpu_generic_init_unrealized()
  armv7m: split armv7m_init in two parts
  armv7m: remove extra cpu_reset()
  armv7m: decide whether faults are MemManage or BusFault

 hw/arm/armv7m.c          |   60 ++-
 hw/arm/stellaris.c       |    7 +-
 hw/arm/stm32f205_soc.c   |    6 +-
 hw/intc/arm_gic.c        |   14 +-
 hw/intc/arm_gic_common.c |   23 +-
 hw/intc/armv7m_nvic.c    | 1037 +++++++++++++++++++++++++++++++++++++---------
 hw/intc/gic_internal.h   |    7 +-
 include/hw/arm/arm.h     |    4 +-
 include/qom/cpu.h        |   12 +
 qom/cpu.c                |   23 +-
 target-arm/cpu-qom.h     |    6 +
 target-arm/cpu.c         |   61 ++-
 target-arm/cpu.h         |   17 +-
 target-arm/helper.c      |  346 ++++++++++++----
 target-arm/machine.c     |   11 +-
 15 files changed, 1252 insertions(+), 382 deletions(-)

-- 
2.1.4

