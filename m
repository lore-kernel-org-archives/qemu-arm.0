Received: by 10.25.30.65 with SMTP id e62csp533590lfe;
        Thu, 26 May 2016 07:56:05 -0700 (PDT)
X-Received: by 10.55.178.6 with SMTP id b6mr9810214qkf.70.1464274565506;
        Thu, 26 May 2016 07:56:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si13295110qtd.67.2016.05.26.07.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5whg-0007ay-RE
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whS-0007OO-23
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whQ-00056Z-NU
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:50 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whQ-00056O-4h; Thu, 26 May 2016 10:55:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whJ-000459-BA; Thu, 26 May 2016 15:55:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:18 +0100
Message-Id: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 00/22] GICv3 emulation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kca0UxjBZuwE

This series implements emulation of the GICv3 interrupt controller.
It is based to some extent on previous patches from Shlomo and
Pavel, but the bulk of it has turned out to be new code. (The
combination of changing the underlying data structures, adding
support for TrustZone and implementing proper GICv3 behaviour rather
than borrowing fragments of GICv2 emulation code meant there wasn't
much left to reuse.) I've tried to reflect this in the various
authorship credits on the patches, but please let me know if you
feel I got anything miscredited one way or the other.

Key points about the GICv3 emulated here:
 * "non-legacy" only, ie system registers and affinity routing
 * TrustZone is implemented
 * no virtualization support
 * only the "core" GICv3, so no LPI support (via ITS or otherwise)
 * no attempt to work around the Linux guest kernel bug fixed
   in commit 7c9b973061b0 (so you need that fix for your guest to
   boot with this GICv3)

I have included the "support KVM save/restore" patches from Pavel,
reworked to use the new data structures, but they are only RFC
status because the kernel API is not yet final (there are a couple
of loose threads there to be followed up). Those patches are at the
end of the series; I think everything else is in a commitable state
(give or take code review).

Testing: I have confirmed that we can boot a Linux guest kernel,
but not tried any other GIC-using guest code. I've done some light
stress-testing using 'stress', and checked an SMP (2-cpu) boot.
I've also tested booting a guest kernel via UEFI.

Design: all the code here is in hw/intc/, split into several
files to avoid them being huge. The interface between the CPU
proper and the CPU interface is a bit ad-hoc (you can see the
awkward seams that result from the choice to think of the cpu
i/f as part of the GIC device rather than part of the CPU itself),
but I think that if you put the cpu i/f in the CPU you'd end up
with an ad-hoc interface and awkward seams in the other direction.
The GICv3 device currently assumes it is always connected to all
CPUs; we can change that later to allow some kind of QOM link
property to specify the CPUs explicitly, but I think this is OK
for now (and it's already a pretty huge set of code changes to
have to review).

Code review, testing, attempts to run guests other than Linux
welcome.

Changes v1->v2:
 * I have dropped the kernel bug workaround, since it didn't work for
   boots via UEFI anyway. This means that you will need kernel commit
   7c9b973061b0 (or its equivalent backports to stable) to boot a Linux
   guest with this emulated GICv3
 * make bitmaps and arrays be GIC_MAXIRQS in size rather than
   GIC_MAXSPIS in size; this uses an extra 512 bytes or so per
   vcpu, but makes bugs of the "forgot to add/subtract GIC_INTERNAL"
   variety less likely to happen (and indeed a few were found and fixed
   in making this change...)
 * fixed GICD_CTLR NS read to use correct bitmask
 * moved ARMELChangeHook related prototypes etc into cpu.h from cpu-qom.h
   (needed after Paolo's recent header reshuffles)
 * added missing 'inline' qualifier to arm_is_el3_or_mon()
 * fixed missing reset of GICD_NSACR
 * fixed icc_activate_irq() to call gicv3_redist_update() rather than
   gicv3_update() when it changes redistributor state
 * make sure (and assert) gicv3_update() isn't called for out of range irqs
 * add missing "bad num_irqs values" checks from gicv2 code

thanks
-- PMM



Pavel Fedin (5):
  target-arm: Add mp-affinity property for ARM CPU class
  hw/intc/arm_gicv3: Add state information
  hw/intc/arm_gicv3: Add vmstate descriptors
  NOT-FOR-UPSTREAM: kernel: Add definitions for GICv3 attributes
  RFC: hw/intc/arm_gicv3_kvm: Implement get/put functions

Peter Maydell (14):
  migration: Define VMSTATE_UINT64_2DARRAY
  bitops.h: Implement half-shuffle and half-unshuffle ops
  target-arm: Define new arm_is_el3_or_mon() function
  target-arm: Provide hook to tell GICv3 about changes of security state
  hw/intc/arm_gicv3: Move irq lines into GICv3CPUState structure
  hw/intc/arm_gicv3: Implement functions to identify next pending irq
  hw/intc/arm_gicv3: Wire up distributor and redistributor MMIO regions
  hw/intc/arm_gicv3: Implement gicv3_set_irq()
  hw/intc/arm_gicv3: Implement GICv3 CPU interface registers
  hw/intc/arm_gicv3: Implement gicv3_cpuif_update()
  hw/intc/arm_gicv3: Implement CPU i/f SGI generation registers
  hw/intc/arm_gicv3: Add IRQ handling CPU interface registers
  target-arm/machine.c: Allow user to request GICv3 emulation
  target-arm/monitor.c: Advertise emulated GICv3 in capabilities

Shlomo Pongratz (3):
  hw/intc/arm_gicv3: ARM GICv3 device framework
  hw/intc/arm_gicv3: Implement GICv3 distributor registers
  hw/intc/arm_gicv3: Implement GICv3 redistributor registers

 hw/intc/Makefile.objs              |    4 +
 hw/intc/arm_gicv3.c                |  400 +++++++++++
 hw/intc/arm_gicv3_common.c         |  225 +++++-
 hw/intc/arm_gicv3_cpuif.c          | 1346 ++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_dist.c           |  873 +++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            |  447 +++++++++++-
 hw/intc/arm_gicv3_redist.c         |  556 +++++++++++++++
 hw/intc/gicv3_internal.h           |  331 +++++++++
 include/hw/intc/arm_gicv3.h        |   32 +
 include/hw/intc/arm_gicv3_common.h |  216 +++++-
 include/migration/vmstate.h        |    6 +
 include/qemu/bitops.h              |  108 +++
 linux-headers/asm-arm64/kvm.h      |   17 +-
 target-arm/cpu.c                   |   10 +
 target-arm/cpu.h                   |   47 +-
 target-arm/helper.c                |    2 +
 target-arm/internals.h             |    8 +
 target-arm/machine.c               |    3 +-
 target-arm/monitor.c               |    3 +-
 target-arm/op_helper.c             |    4 +
 tests/test-bitops.c                |   68 ++
 trace-events                       |   41 ++
 22 files changed, 4719 insertions(+), 28 deletions(-)
 create mode 100644 hw/intc/arm_gicv3.c
 create mode 100644 hw/intc/arm_gicv3_cpuif.c
 create mode 100644 hw/intc/arm_gicv3_dist.c
 create mode 100644 hw/intc/arm_gicv3_redist.c
 create mode 100644 hw/intc/gicv3_internal.h
 create mode 100644 include/hw/intc/arm_gicv3.h

-- 
1.9.1

