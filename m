Received: by 10.25.21.156 with SMTP id 28csp336052lfv;
        Tue, 2 Aug 2016 11:07:50 -0700 (PDT)
X-Received: by 10.37.47.85 with SMTP id v82mr38518954ybv.75.1470161268803;
        Tue, 02 Aug 2016 11:07:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d194si476891ybc.225.2016.08.02.11.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 11:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUe6W-0003Ru-2t
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 14:07:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6O-0003Om-69
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6J-0000rx-SA
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:07:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44368)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bUe6J-0000rS-Jm; Tue, 02 Aug 2016 14:07:35 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6719AC05678E;
	Tue,  2 Aug 2016 18:07:34 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-58.ams2.redhat.com
	[10.36.7.58])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u72I7UL3024790; Tue, 2 Aug 2016 14:07:31 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Tue,  2 Aug 2016 20:07:20 +0200
Message-Id: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 02 Aug 2016 18:07:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 0/7] vITS support
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x1bnxasIpwXP

This series introduces support for in-kernel GICv3 ITS emulation.
It is based on a kernel API which is not yet released.

Tested on Cavium ThunderX with virtio-net-pci and vhost-net with both dt
and ACPI guests

Host Kernel dependencies:
- [PATCH v10 00/17] KVM: arm64: GICv3 ITS emulation
  http://www.spinics.net/lists/kvm/msg135687.html
- [RFC v9 0/6] KVM: arm/arm64: gsi routing support
  http://www.spinics.net/lists/kvm/msg136083.html

Guest Kernel dependencies for resp. ACPI ITS and PCIe support:
- [PATCH V7 0/8] Introduce ACPI world to ITS,
  https://lkml.org/lkml/2016/6/20/321
- Support for ARM64 ACPI based PCI host controller,
  https://lwn.net/Articles/690995/

Host kernel series can be found at:
https://github.com/eauger/linux/tree/v4.7-its-emul-v10-gsi-routing-v9

This QEMU series can be found at:

v5: https://github.com/eauger/qemu/tree/v2.6.0-vITS-v5

Previous versions are available at:
v4: https://github.com/eauger/qemu/tree/v2.6.0-vITS-v4
v3: https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg05197.html

History:
v4 => v5:
- fix compilation issue with arm-softmmu target
- rebase on target-arm: Fix unreachable code in gicv3_class_name()
- add ACPI support
- kernel ITS init sequence is not yet similar to GICv2/V3 ones. This will
  be addressed in a subsequent respin.

v3 => v4:
- Took into account Peter's comments (at the exception of sub-class
  operation changes)
- rebase on Andre's kernel ITS emulation series v8
- rework KVM init sequence and KVM device creation/settings overall.
  I do not use kvm_arm_register_device due to the way the kernel
  API is devises (see discussion on the kernel ML)
- change the computation of the GITS_TRANSLATER base address
- fix compilation issues
- new "arget-arm: move gicv3_class_name from machine to kvm_arm.h"

v2 => v3:
- Really added unmigratable flag, was overlooked in v2
- Fixed checkpatch issue with initializing static variable to zero

	/bin/bash: indent : commande introuvabledded registers and reset method
- Added unmigratable flag
- Rebased on top of current master, use kvm_arch_fixup_msi_route() now

Pavel Fedin (5):
  hw/intc: Implement ITS base class
  kernel: Add vGICv3 ITS definitions
  kvm_arm: Pass requester ID to MSI routing functions
  kvm_arm: Implement support for ITS emulation by KVM
  arm/virt: Add ITS to the virt board

Eric Auger (2):
  target-arm: move gicv3_class_name from machine to kvm_arm.h
  hw/arm/virt-acpi-build: Add ITS description in ACPI MADT table

Pavel Fedin (5):
  hw/intc/arm_gicv3_its: Implement ITS base class
  linux-headers: update to 4.7-rc6 + ITS emulation and GSI routing
  target-arm/kvm: Pass requester ID to MSI routing functions
  hw/intc/arm_gicv3_its: Implement support for in-kernel ITS emulation
  arm/virt: Add ITS to the virt board

 hw/arm/virt-acpi-build.c                           |   7 +
 hw/arm/virt.c                                      |  47 ++++++-
 hw/intc/Makefile.objs                              |   2 +
 hw/intc/arm_gicv3_its_common.c                     | 155 +++++++++++++++++++++
 hw/intc/arm_gicv3_its_kvm.c                        | 145 +++++++++++++++++++
 include/hw/acpi/acpi-defs.h                        |  13 +-
 include/hw/intc/arm_gicv3_its_common.h             |  75 ++++++++++
 include/standard-headers/linux/input-event-codes.h |  31 +++++
 include/standard-headers/linux/input.h             |   1 +
 linux-headers/asm-arm64/kvm.h                      |   2 +
 linux-headers/linux/kvm.h                          |  12 +-
 target-arm/kvm.c                                   |   6 +
 target-arm/kvm_arm.h                               |  38 ++++-
 target-arm/machine.c                               |  15 --
 14 files changed, 524 insertions(+), 25 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its_common.c
 create mode 100644 hw/intc/arm_gicv3_its_kvm.c
 create mode 100644 include/hw/intc/arm_gicv3_its_common.h

-- 
2.5.5

