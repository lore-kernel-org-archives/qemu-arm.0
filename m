Received: by 10.25.159.19 with SMTP id i19csp1053510lfe;
        Fri, 29 Jan 2016 08:54:06 -0800 (PST)
X-Received: by 10.55.81.2 with SMTP id f2mr11833435qkb.87.1454086446761;
        Fri, 29 Jan 2016 08:54:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n69si16017808qki.30.2016.01.29.08.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:54:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCJC-0001j1-Am
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:54:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ8-0001iB-OC
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ4-0003vP-DM
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:02 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:36548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ4-0003vE-4b
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:53:58 -0500
Received: by mail-wm0-x22c.google.com with SMTP id p63so76818488wmp.1
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 08:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=iGdcJsGjg3/fEE5ZhCylCJv64oxNi5sDPDp6Dyb0cbU=;
	b=B+ts0gQjv5NvAnnwIOecuyXaVe2WZVs6kYV3TBcSjlBx9h0L6NKed8o1PI8dgjR0iB
	TuoSMCJIx2F0EYof71UE89XHC/4cgiS58KVRJAkqUKp6+axXLxxTM+nkFnV2enu1RIgl
	D1AKAwvsWf5yBs8ynNSrDzmyLqxJBWIeD8sVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iGdcJsGjg3/fEE5ZhCylCJv64oxNi5sDPDp6Dyb0cbU=;
	b=QTqWdnopOb76nV0GlOWly8GQZXVUw95xO8c2P5hlpMfEer+mogITFB1zWTr9envppe
	u/UkCYOtaPItBCselpJJjjNkTUX9h3GrThCsWK71XNP1JDGOV0+k5DW3D/YW4bYAV4qP
	+AR0om8OeGfv8HLCL+PEtG9gM/+V96aQlKaOnIfNIxJhoSOVpXiVsVu3MoXx0jd1GweY
	y3QWlNorj1dnTA2UJ6Y7GKuG0fZBL/m+0i3ePIMtCz/VtIVhNVCiNMJZ2KIRT+3OEL3m
	bHRgpOFa+7Y/nVzhJzFrkc7VHlC1fNzK/tEDiOMcxlscOLqlcUJa1RtP/PA4+/wS+qER
	p90A==
X-Gm-Message-State: AG10YOQoi3YRtHHjcJz8dMX9MlShktCZDU5UdCRIFk9nsadtZU2RR0NaaiTtjfBKbvL8LwTD
X-Received: by 10.28.68.214 with SMTP id r205mr10404527wma.23.1454086436982;
	Fri, 29 Jan 2016 08:53:56 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.53.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:53:55 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:41 +0000
Message-Id: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC v2 0/8] KVM PCI/MSI passthrough with mach-virt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6IchWtCzkiAX

This series enables KVM PCI/MSI passthrough with mach-virt.

A new memory region type is introduced (reserved iova). On
vfio_listener_region_add this IOVA region is registered to the kernel with
VFIO_IOMMU_MAP_DMA (using the new VFIO_DMA_MAP_FLAG_MSI_RESERVED_IOVA flag).

The host VFIO PCI driver then can use this IOVA window to map some host
physical addresses, accessed by passthrough'ed PCI devices, through the IOMMU.
The first goal is to map host MSI controller frames (GICv2M, GITS_TRANSLATER).

mach-virt currently instantiates a 16x64kB reserved IOVA window. This
provisions for future usage. Most probably this exceeds MSI binding needs.
To avoid wasting guest PA, we now map the reserved region onto the
platform bus MMIO.

The series includes Pranav/Tushar' series:
QEMU, [v2 0/2] Generic PCIe host bridge INTx determination for INTx routing
((https://lists.nongnu.org/archive/html/qemu-devel/2015-04/msg04361.html))

Those patches are not mandated for PCI/MSI passthrough to work but without
those, the following warning is observed and can puzzle the end-user:
"qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)"

Best Regards

Eric

Dependencies:
The series depends on kernel series: "[PATCH 00/10] KVM PCIe/MSI passthrough on
ARM/ARM64", (https://lkml.org/lkml/2016/1/26/371)

Git:
QEMU:
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-pci-passthrough-rfc-v2

Kernel:
https://git.linaro.org/people/eric.auger/linux.git/shortlog/refs/heads/v4.5-rc1-pcie-passthrough-v1

Testing:
- on ARM64 AMD Overdrive HW with one e1000e PCIe card.

History:
RFC v1 -> RFC v2:
- now uses platform bus MMIO for mapping reserved IOVA region; hence the
  new patch file:
  "hw: platform-bus: enable to map any memory region onto the platform-bus"

Eric Auger (8):
  linux-headers: partial update for VFIO reserved IOVA registration
  Add a function to determine interrupt number for INTx routing
  Generic PCIe host bridge INTx determination for INTx routing
  hw: vfio: common: introduce vfio_register_reserved_iova
  memory: add reserved_iova region type
  hw: platform-bus: enable to map any memory region onto the
    platform-bus
  hw: arm: virt: register reserved IOVA region
  hw: vfio: common: adapt vfio_listeners for reserved_iova region

 hw/arm/virt.c              | 23 ++++++++++++----
 hw/core/platform-bus.c     | 26 +++++++++++-------
 hw/pci-host/gpex.c         | 12 ++++++++
 hw/vfio/common.c           | 68 ++++++++++++++++++++++++++++++++++++----------
 include/exec/memory.h      | 29 ++++++++++++++++++++
 include/hw/pci-host/gpex.h |  1 +
 include/hw/platform-bus.h  |  7 +++++
 linux-headers/linux/vfio.h | 15 ++++++++--
 memory.c                   | 11 ++++++++
 9 files changed, 160 insertions(+), 32 deletions(-)

-- 
1.9.1

