Received: by 10.25.21.96 with SMTP id l93csp755503lfi;
        Wed, 6 Jul 2016 02:52:44 -0700 (PDT)
X-Received: by 10.55.210.7 with SMTP id f7mr30235457qkj.50.1467798764149;
        Wed, 06 Jul 2016 02:52:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y202si2344551qkb.170.2016.07.06.02.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jul 2016 02:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKjVb-0007VV-HK
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 05:52:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPh-0000Po-9s
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 05:46:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPg-00072t-2l
	for qemu-devel@nongnu.org; Wed, 06 Jul 2016 05:46:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bKjPZ-0006y3-3N; Wed, 06 Jul 2016 05:46:29 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06F3565425;
	Wed,  6 Jul 2016 09:46:28 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-81.ams2.redhat.com
	[10.36.6.81])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u669kPEF013861; Wed, 6 Jul 2016 05:46:25 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Wed,  6 Jul 2016 11:45:58 +0200
Message-Id: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 06 Jul 2016 09:46:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 0/6] vITS support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: diana.craciun@freescale.com, shlomopongratz@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pz+SCJSk5ebj

This series introduces support for in-kernel GICv3 ITS emulation.
It is based on a kernel API which is not yet released.

Tested on Cavium ThunderX with virtio-net-pci and vhost-net.

Kernel dependencies:
- [PATCH v8 00/12] KVM: arm64: GICv3 ITS emulation
   http://www.spinics.net/lists/kvm/msg135048.html
- [PATCH v6 0/6] KVM: arm/arm64: gsi routing support

Those kernel series can be found at:
https://github.com/eauger/linux/tree/v4.7-rc6-its-emul-v8-gsi-routing-v6

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/v2.6.0-vITS-v4

Previous version originally written by Pavel:
- [RFC PATCH v3 0/5] vITS support
  https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg05197.html

History:

v3 => v4:
- Took into account Peter's comments (at the exception of sub-class
  operation changes, at the moment)
- rebase on Andre's kernel ITS emulation series v8
- rework KVM init sequence and KVM device creation/settings overall.
  I do not use kvm_arm_register_device due to the way the kernel
  API is devises (see discussion on the kernel ML)
- change the computation of the GITS_TRANSLATER base address
- fix compilation issues
- new "target-arm: move gicv3_class_name from machine to kvm_arm.h"

v2 => v3:
- Really added unmigratable flag, was overlooked in v2
- Fixed checkpatch issue with initializing static variable to zero

v1 => v2:
- Added registers and reset method
- Added unmigratable flag
- Rebased on top of current master, use kvm_arch_fixup_msi_route() now


Eric Auger (1):
  target-arm: move gicv3_class_name from machine to kvm_arm.h

Pavel Fedin (5):
  hw/intc/arm_gicv3_its: Implement ITS base class
  linux-headers: update to 4.7-rc6 + ITS emulation and GSI routing
  target-arm/kvm: Pass requester ID to MSI routing functions
  hw/intc/arm_gicv3_its: Implement support for in-kernel ITS emulation
  arm/virt: Add ITS to the virt board

 hw/arm/virt.c                                      |  47 ++++++-
 hw/intc/Makefile.objs                              |   2 +
 hw/intc/arm_gicv3_its_common.c                     | 155 +++++++++++++++++++++
 hw/intc/arm_gicv3_its_kvm.c                        | 145 +++++++++++++++++++
 include/hw/intc/arm_gicv3_its_common.h             |  75 ++++++++++
 include/standard-headers/linux/input-event-codes.h |  31 +++++
 include/standard-headers/linux/input.h             |   1 +
 linux-headers/asm-arm64/kvm.h                      |   2 +
 linux-headers/linux/kvm.h                          |  12 +-
 target-arm/kvm.c                                   |   6 +
 target-arm/kvm_arm.h                               |  38 ++++-
 target-arm/machine.c                               |  16 ---
 12 files changed, 505 insertions(+), 25 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its_common.c
 create mode 100644 hw/intc/arm_gicv3_its_kvm.c
 create mode 100644 include/hw/intc/arm_gicv3_its_common.h

-- 
2.5.5

