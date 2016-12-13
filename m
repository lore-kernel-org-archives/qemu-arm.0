Received: by 10.25.205.13 with SMTP id d13csp2116816lfg;
        Tue, 13 Dec 2016 02:36:45 -0800 (PST)
X-Received: by 10.237.41.129 with SMTP id o1mr27672676qtd.10.1481625405321;
        Tue, 13 Dec 2016 02:36:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 42si27860865qtq.288.2016.12.13.02.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkRu-0004eJ-AG
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:36:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkRo-0004aZ-V5
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:36:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkRn-00088z-IT
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:36:37 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkRn-00085R-7E; Tue, 13 Dec 2016 05:36:35 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRd-0002Fw-KP; Tue, 13 Dec 2016 10:36:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:01 +0000
Message-Id: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/23] arm: Add virtualization to GICv3,
 and enable EL2 on 64-bit CPUs
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
Cc: Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dRsWWFd2AUd2

This patchset adds support for the Virtualization extensions to QEMU's
GICv3 emulation. This was the last missing piece that was stopping
us from turning on the EL2 support in the CPU model, so the patchset
also adds support for enabling it all on the virt board via the
'-machine virtualization=on' option.

The result works well enough to allow booting a KVM outer guest kernel
and then running QEMU + an inner guest under KVM inside it. The outer
guest KVM also passes the kvm-unit-tests GIC tests.

Patches 1-7 have already appeared on list, and 1-5 + 7 have been
reviewed. The rest are new.

As per mailing list discussion, there is a new CPU property
for enabling EL2 which defaults to 'true' (named 'has_el2' to
parallel the existing 'has_el3'). There is also a board property
on 'virt' which defaults to 'false' (named 'virtualization' to
parallel the existing 'secure'). The only other 64-bit board
is the ZynqMP -- this patchset makes it always set has_el2 to false,
so no change in behaviour. (I imagine the Xilinx folk will want to
enable it at some point.)

There is no property on the GIC device object to enable virtualization,
because this only affects the CPU interface, which in real hardware
is part of the CPU itself and which in QEMU we enable and configure
via a close coupling between the cpuif code and the CPU code.

These patches include changes to the reported device tree info
to (a) report the GICv3 maintenance IRQ binding and (b) report
use of SMC as the PSCI conduit. I haven't tried to make the
equivalent changes to the ACPI tables because Drew said on
Monday that he had a cleanup to make in that area, which would
change all that code anyway. I'm guessing there'll be a v2 of
this series, so we can fix that dependency up properly then.

The new state in the GICv3 for the virtualization should not
cause a migration compat break because we put it in a subsection
which is only sent if virtualization is enabled.

Unfortunately to enable EL2 on the 32-bit CPU models we need
to do this all over again for the GICv2 emulation :-)

Git branch for this:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git gicv3-virt


thanks
-- PMM

Peter Maydell (23):
  target-arm: Log AArch64 exception returns
  hw/intc/arm_gicv3: Remove incorrect usage of fieldoffset
  hw/intc/arm_gicv3: Don't signal Pending+Active interrupts to CPU
  hw/arm/virt: add 2.9 machine type
  hw/arm/virt: Merge VirtBoardInfo and VirtMachineState
  hw/arm/virt: Rename 'vbi' variables to 'vms'
  hw/arm/virt: Don't incorrectly claim architectural timer to be
    edge-triggered
  hw/intc/arm_gicv3: Add external IRQ lines for VIRQ and VFIQ
  hw/intc/arm_gic: Add external IRQ lines for VIRQ and VFIQ
  target-arm: Expose output GPIO line for VCPU maintenance interrupt
  hw/arm/virt: Wire VIRQ, VFIQ, maintenance irq lines from GIC to CPU
  target-arm: Add ARMCPU fields for GIC CPU i/f config
  hw/intc/gicv3: Add defines for ICH system register fields
  hw/intc/gicv3: Add data fields for virtualization support
  hw/intc/arm_gicv3: Add accessors for ICH_ system registers
  hw/intc/arm_gicv3: Implement ICV_ registers which are just accessors
  hw/intc/arm_gicv3: Implement ICV_ HPPIR, DIR and RPR registers
  hw/intc/arm_gicv3: Implement ICV_ registers EOIR and IAR
  hw/intc/arm_gicv3: Implement gicv3_cpuif_virt_update()
  hw/intc/arm_gicv3: Implement EL2 traps for CPU i/f regs
  hw/arm/virt: Support using SMC for PSCI
  target-arm: Enable EL2 feature bit on A53 and A57
  hw/arm/virt: Add board property to enable EL2

 hw/intc/gicv3_internal.h           |   79 +++
 include/hw/arm/virt.h              |    2 +
 include/hw/compat.h                |    3 +
 include/hw/intc/arm_gic_common.h   |    2 +
 include/hw/intc/arm_gicv3_common.h |   21 +
 target-arm/cpu.h                   |    9 +
 hw/arm/virt.c                      |  696 +++++++++++--------
 hw/arm/xlnx-zynqmp.c               |    2 +
 hw/intc/arm_gic_common.c           |    6 +
 hw/intc/arm_gicv3.c                |    5 +
 hw/intc/arm_gicv3_common.c         |   31 +
 hw/intc/arm_gicv3_cpuif.c          | 1336 +++++++++++++++++++++++++++++++++++-
 target-arm/cpu.c                   |   15 +
 target-arm/cpu64.c                 |    8 +
 target-arm/op_helper.c             |    9 +
 hw/intc/trace-events               |   33 +
 16 files changed, 1925 insertions(+), 332 deletions(-)

-- 
2.7.4

