Received: by 10.80.166.35 with SMTP id d32csp641054edc;
        Mon, 17 Oct 2016 12:55:37 -0700 (PDT)
X-Received: by 10.55.65.22 with SMTP id o22mr23931815qka.136.1476734137769;
        Mon, 17 Oct 2016 12:55:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si18786186qkg.244.2016.10.17.12.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwE0X-00075r-41
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:55:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDk8-00017C-Bj
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDk4-0007dn-Qh
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:38:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1bwDk4-0007dL-LP; Mon, 17 Oct 2016 15:38:36 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B73E03F1F0;
	Mon, 17 Oct 2016 19:38:35 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-5-170.ams2.redhat.com [10.36.5.170])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9HJcVFT009529; Mon, 17 Oct 2016 15:38:32 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Mon, 17 Oct 2016 19:38:22 +0000
Message-Id: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 17 Oct 2016 19:38:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 0/8] KVM PCI/MSI passthrough with mach-virt
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org, fkan@apm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TbSfXknIvvaB

On ARM, MSI transactions emitted by passthrough'ed devices are translated
by the IOMMU.  So the host must allocate IOVAs and map them to the host
MSI frame physical addresses. Those IOVAs must be allocated within safe
GPA slots, unused by the guest.

The QEMU VFIO device retrieves the size if the IOVA window needed by the
host using a new VFIO IOMMU type capability chain API. This window is
allocated on guest address space withing the platform bus memory container.
This latter acts as a pool of usable GPA and comes with its own GPA allocator.
The memory region is tagged as "reserved_iova". The vfio_listener_region_add
callback is in charge of passing the window characteristics to the kernel
through an extended VFIO_IOMMU_MAP_DMA ioctl.

Best Regards

Eric

Dependencies:
The series depends on the not yet upstream kernel series:
[PATCH v14 00/16] KVM PCIe/MSI passthrough on ARM/ARM64,
https://lkml.org/lkml/2016/10/12/347

Git:
https://github.com/eauger/qemu/tree/v2.7.0-passthrough-rfc-v5

History:

RFC v4 -> RFC v5:
- update linux header according to last user API changes introduced in
  [PATCH v14 00/16] KVM PCIe/MSI passthrough on ARM/ARM64
- fix compilation issue on platforms not setting CONFIG_PLATFORM_BUS
- squash [RFC v4 3/8] hw: vfio: common: Introduce vfio_register_msi_iova
  into the last patch to avoid compilation warning

RFCv3 -> RFC v4:
- initialize err to NULL in vfio_connect_container and fix hint

RFCv2 -> RFC v3:
- IOVA aperture size is not arbitrary anymore. It is retrieved from the host
  usig VFIO IOMMU type capability chain API
- GPEX related patches removed since the warning is not seen anymore

RFC v1 -> RFC v2:
- now uses platform bus MMIO for mapping reserved IOVA region; hence the
  new patch file:
  "hw: platform-bus: enable to map any memory region onto the platform-bus"

Eric Auger (8):
  linux-headers: Partial update for MSI IOVA handling
  hw: vfio: common: vfio_get_iommu_type1_info
  memory: Add reserved_iova region type
  memory: memory_region_find_by_name
  hw: platform-bus: Enable to map any memory region onto the
    platform-bus
  hw: platform-bus: Add platform bus stub
  hw: vfio: common: vfio_prepare_msi_mapping
  hw: vfio: common: Adapt vfio_listeners for reserved_iova region

 hw/core/Makefile.objs       |   2 +-
 hw/core/platform-bus-stub.c |  27 +++++++
 hw/core/platform-bus.c      |  27 ++++---
 hw/vfio/common.c            | 169 ++++++++++++++++++++++++++++++++++++++------
 include/exec/memory.h       |  40 +++++++++++
 include/hw/platform-bus.h   |   7 ++
 linux-headers/linux/vfio.h  |  30 +++++++-
 memory.c                    |  27 +++++++
 8 files changed, 295 insertions(+), 34 deletions(-)
 create mode 100644 hw/core/platform-bus-stub.c

-- 
1.9.1

