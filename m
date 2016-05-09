Received: by 10.25.208.137 with SMTP id h131csp1683150lfg;
        Mon, 9 May 2016 10:30:23 -0700 (PDT)
X-Received: by 10.141.5.197 with SMTP id h188mr19287197qhd.97.1462815022948;
        Mon, 09 May 2016 10:30:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a31si19400621qga.41.2016.05.09.10.30.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp0g-00040i-Fg
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:30:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0c-0003x4-V1
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0b-0000GE-8s
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:18 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0a-00005k-QR; Mon, 09 May 2016 13:30:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0A-0001Qd-Mg; Mon, 09 May 2016 18:29:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:26 +0100
Message-Id: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/23] GICv3 emulation
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
X-TUID: UIexYOwVHDEV


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

I have included the "support KVM save/restore" patches from Pavel,
reworked to use the new data structures, but they are only RFC
status because the kernel API is not yet final (there are a couple
of loose threads there to be followed up). Those patches are at the
end of the series; I think everything else is in a commitable state
(give or take code review).

Testing: I have confirmed that we can boot a Linux guest kernel,
but not tried any other GIC-using guest code. I've done some light
stress-testing using 'stress', and checked an SMP (2-cpu) boot.

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

I include a workaround for a Linux kernel bug which otherwise
prevents booting on the virt board. I've reported the bug to
Marc Zyngier and he should post a kernel patch to fix it shortly,
but I think we'll need to retain the workaround for the benefit
of older kernels (an ugly but pragmatic choice).


Code review, testing, attempts to run guests other than Linux
welcome (UEFI, anybody?)

thanks
-- PMM

Pavel Fedin (5):
  target-arm: Add mp-affinity property for ARM CPU class
  hw/intc/arm_gicv3: Add state information
  hw/intc/arm_gicv3: Add vmstate descriptors
  NOT-FOR-UPSTREAM: kernel: Add definitions for GICv3 attributes
  RFC: hw/intc/arm_gicv3_kvm: Implement get/put functions

Peter Maydell (15):
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
  hw/intc/arm_gicv3: Work around Linux assuming interrupts are group 1

Shlomo Pongratz (3):
  hw/intc/arm_gicv3: ARM GICv3 device framework
  hw/intc/arm_gicv3: Implement GICv3 distributor registers
  hw/intc/arm_gicv3: Implement GICv3 redistributor registers

 hw/intc/Makefile.objs              |    4 +
 hw/intc/arm_gicv3.c                |  397 +++++++++++
 hw/intc/arm_gicv3_common.c         |  213 +++++-
 hw/intc/arm_gicv3_cpuif.c          | 1345 ++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_dist.c           |  862 +++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            |  447 +++++++++++-
 hw/intc/arm_gicv3_redist.c         |  556 +++++++++++++++
 hw/intc/gicv3_internal.h           |  331 +++++++++
 include/hw/intc/arm_gicv3.h        |   32 +
 include/hw/intc/arm_gicv3_common.h |  212 +++++-
 include/migration/vmstate.h        |    6 +
 include/qemu/bitops.h              |  108 +++
 linux-headers/asm-arm64/kvm.h      |   17 +-
 target-arm/cpu-qom.h               |   40 +-
 target-arm/cpu.c                   |   10 +
 target-arm/cpu.h                   |   13 +-
 target-arm/helper.c                |    2 +
 target-arm/internals.h             |    8 +
 target-arm/machine.c               |    3 +-
 target-arm/monitor.c               |    3 +-
 target-arm/op_helper.c             |    4 +
 tests/test-bitops.c                |   68 ++
 trace-events                       |   41 ++
 23 files changed, 4692 insertions(+), 30 deletions(-)
 create mode 100644 hw/intc/arm_gicv3.c
 create mode 100644 hw/intc/arm_gicv3_cpuif.c
 create mode 100644 hw/intc/arm_gicv3_dist.c
 create mode 100644 hw/intc/arm_gicv3_redist.c
 create mode 100644 hw/intc/gicv3_internal.h
 create mode 100644 include/hw/intc/arm_gicv3.h

-- 
1.9.1

