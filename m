Received: by 10.80.163.71 with SMTP id 65csp212077edn;
        Fri, 9 Sep 2016 10:31:02 -0700 (PDT)
X-Received: by 10.55.212.77 with SMTP id l74mr5449021qki.231.1473442261936;
        Fri, 09 Sep 2016 10:31:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v125si2702341qkc.280.2016.09.09.10.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 10:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biPdl-0001P2-9R
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 13:31:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdh-0001OT-3j
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdc-0005MU-St
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:30:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1biPdc-0005MQ-KF; Fri, 09 Sep 2016 13:30:52 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D77752777;
	Fri,  9 Sep 2016 17:30:51 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-170.ams2.redhat.com
	[10.36.7.170])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u89HUlQo024546; Fri, 9 Sep 2016 13:30:47 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri,  9 Sep 2016 19:30:29 +0200
Message-Id: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Sep 2016 17:30:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 0/8] vITS support
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
X-TUID: JbzxeQy+m4ZH

This series introduces support for in-kernel GICv3 ITS emulation.

On dt guest the functionality is complete and was tested on Cavium ThunderX
with virtio-net-pci and vhost-net.

On ACPI guest the series was tested with virtio-net-pci only. For vhost-net,
using MSIX we currently miss the ACPI IORT table generation linking the
PCIe host controller with the ITS. The work is ongoing and will be submitted
separately. Anyway the kernel ACPI IORT ITS node support is not upstreamed
yet.

The first patch is not really related to virtual ITS but advertises the KVM
GSI routing support which goes along with MSI injection.

For ACPI ITS and PCIe support, use in-flight Tomasz' series:
- [PATCH V10 0/8] Introduce ACPI world to ITS,
  https://lkml.org/lkml/2016/9/6/153
- Support for ARM64 ACPI based PCI host controller,
  https://lwn.net/Articles/690995/

Git Information:
v6: https://github.com/eauger/qemu/tree/v2.7.0-vITS-v6
v5: https://github.com/eauger/qemu/tree/v2.6.0-vITS-v5
v4: https://github.com/eauger/qemu/tree/v2.6.0-vITS-v4
v3: https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg05197.html

History:
v5 => v6:
- moved from RFC to PATCH since all the host kernel dependencies now are
  fixed
- use Shannon's MADT patches I was not aware of
- smoother integration since the kernet ITS init sequence has now been
  updated in 4.8
- kvm_msi_use_devid flag handled in non archutecture specific code
- vmstate_its fields removed and migration_blocker added

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

v1 => v2:
- Added registers and reset method
- Added unmigratable flag
- Rebased on top of current master, use kvm_arch_fixup_msi_route() now

Pavel Fedin (5):
  hw/intc: Implement ITS base class
  kernel: Add vGICv3 ITS definitions
  kvm_arm: Pass requester ID to MSI routing functions
  kvm_arm: Implement support for ITS emulation by KVM
  arm/virt: Add ITS to the virt board


Eric Auger (2):
  hw/intc/arm_gic(v3)_kvm: Initialize gsi routing
  target-arm: move gicv3_class_name from machine to kvm_arm.h

Pavel Fedin (4):
  hw/intc/arm_gicv3_its: Implement ITS base class
  kvm-all: Pass requester ID to MSI routing functions
  hw/intc/arm_gicv3_its: Implement support for in-kernel ITS emulation
  arm/virt: Add ITS to the virt board

Shannon Zhao (2):
  ACPI: Add GIC Interrupt Translation Service Structure definition
  ARM: Virt: ACPI: Add GIC ITS description in ACPI MADT table

 hw/arm/virt-acpi-build.c               |  12 +++
 hw/arm/virt.c                          |  47 +++++++++--
 hw/intc/Makefile.objs                  |   2 +
 hw/intc/arm_gic_kvm.c                  |  12 +++
 hw/intc/arm_gicv3_its_common.c         | 148 +++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_kvm.c            | 136 ++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c                |  13 +++
 include/hw/acpi/acpi-defs.h            |  13 ++-
 include/hw/intc/arm_gicv3_its_common.h |  77 +++++++++++++++++
 include/sysemu/kvm.h                   |   1 +
 kvm-all.c                              |   9 ++
 kvm-stub.c                             |   1 +
 target-arm/kvm_arm.h                   |  35 +++++++-
 target-arm/machine.c                   |  15 ----
 14 files changed, 498 insertions(+), 23 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its_common.c
 create mode 100644 hw/intc/arm_gicv3_its_kvm.c
 create mode 100644 include/hw/intc/arm_gicv3_its_common.h

-- 
2.5.5

