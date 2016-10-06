Received: by 10.80.163.71 with SMTP id 65csp3117758edn;
        Thu, 6 Oct 2016 02:51:01 -0700 (PDT)
X-Received: by 10.200.55.59 with SMTP id o56mr13187665qtb.65.1475747461106;
        Thu, 06 Oct 2016 02:51:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r200si7408511qke.99.2016.10.06.02.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 02:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs5KO-0006om-KJ
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 05:51:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KK-0006of-5U
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KF-000774-WD
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:50:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs5KF-00076Z-PX; Thu, 06 Oct 2016 05:50:51 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32429624A9;
	Thu,  6 Oct 2016 09:50:50 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u969okRx016130; Thu, 6 Oct 2016 05:50:47 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 09:50:36 +0000
Message-Id: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 06 Oct 2016 09:50:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 0/8] KVM PCI/MSI passthrough with mach-virt
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
	drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ooHR+J2tR6jU

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
[PATCH v13 00/15] KVM PCIe/MSI passthrough on ARM/ARM64
http://www.spinics.net/lists/arm-kernel/msg535168.html

Git:
https://github.com/eauger/qemu/tree/v2.7.0-vITS-v7-passthrough-rfc-v3

History:

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
  hw: vfio: common: Introduce vfio_register_msi_iova
  memory: Add reserved_iova region type
  memory: memory_region_find_by_name
  hw: platform-bus: Enable to map any memory region onto the
    platform-bus
  hw: vfio: common: vfio_prepare_msi_mapping
  hw: vfio: common: Adapt vfio_listeners for reserved_iova region

 hw/core/platform-bus.c     |  27 ++++---
 hw/vfio/common.c           | 175 +++++++++++++++++++++++++++++++++++++++------
 include/exec/memory.h      |  40 +++++++++++
 include/hw/platform-bus.h  |   7 ++
 linux-headers/linux/vfio.h |  48 +++++++++++--
 memory.c                   |  27 +++++++
 6 files changed, 288 insertions(+), 36 deletions(-)

-- 
1.9.1

