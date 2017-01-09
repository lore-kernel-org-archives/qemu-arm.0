Received: by 10.25.205.13 with SMTP id d13csp11568588lfg;
        Mon, 9 Jan 2017 08:19:01 -0800 (PST)
X-Received: by 10.237.62.68 with SMTP id m4mr22062201qtf.171.1483978741696;
        Mon, 09 Jan 2017 08:19:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h67si45614459qkh.135.2017.01.09.08.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcex-0003F5-3O
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:18:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS9-0007xK-Qp
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS8-0003o9-NP
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:45 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcS8-0003hC-3K; Mon, 09 Jan 2017 11:05:44 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRp-0001iA-CW; Mon, 09 Jan 2017 16:05:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:06 +0000
Message-Id: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 00/18] arm: Add virtualization to GICv3,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IVFyc6m0a5PF

This patchset adds support for the Virtualization extensions to QEMU's
GICv3 emulation. This was the last missing piece that was stopping
us from turning on the EL2 support in the CPU model, so the patchset
also adds support for enabling it all on the virt board via the
'-machine virtualization=on' option.

The result works well enough to allow booting a KVM outer guest kernel
and then running QEMU + an inner guest under KVM inside it. The outer
guest KVM also passes the kvm-unit-tests GIC tests.

Changes v1->v2:
 * rebased on master; some of the earlier patches in v1
   have now gone into master, as has Drew's ACPI cleanup set
 * new patch "psci.c: If EL2 implemented, start CPUs in EL2"
   fixes the problems with SMP configs not starting properly
 * includes Drew's changes to report SMC vs HVC in ACPI
   (slightly tweaked by me)

Patches 1, 4-13, 15, 16 still need review.

Git branch for this:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git gicv3-virt

thanks
-- PMM

Andrew Jones (1):
  hw/arm/virt-acpi-build: use SMC if booting in EL2

Peter Maydell (17):
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
  target/arm/psci.c: If EL2 implemented, start CPUs in EL2
  target-arm: Enable EL2 feature bit on A53 and A57
  hw/arm/virt: Add board property to enable EL2

 hw/intc/gicv3_internal.h           |   79 +++
 include/hw/arm/virt.h              |    5 +-
 include/hw/intc/arm_gic_common.h   |    2 +
 include/hw/intc/arm_gicv3_common.h |   21 +
 target/arm/cpu.h                   |    9 +
 hw/arm/virt-acpi-build.c           |   29 +-
 hw/arm/virt.c                      |   87 ++-
 hw/arm/xlnx-zynqmp.c               |    2 +
 hw/intc/arm_gic_common.c           |    6 +
 hw/intc/arm_gicv3_common.c         |   31 +
 hw/intc/arm_gicv3_cpuif.c          | 1351 +++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c                   |   15 +
 target/arm/cpu64.c                 |    8 +
 target/arm/psci.c                  |   25 +-
 hw/intc/trace-events               |   33 +
 15 files changed, 1642 insertions(+), 61 deletions(-)

-- 
2.7.4

