Received: by 10.25.159.19 with SMTP id i19csp2423640lfe;
        Wed, 27 Jan 2016 05:52:09 -0800 (PST)
X-Received: by 10.140.239.79 with SMTP id k76mr7857195qhc.87.1453902729829;
        Wed, 27 Jan 2016 05:52:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d138si6036736qhd.108.2016.01.27.05.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:52:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQW1-0002hf-D0
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:52:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVy-0002gF-9C
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVt-00026X-Tx
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:06 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:36384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVt-000265-Nr
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:01 -0500
Received: by mail-wm0-x22f.google.com with SMTP id l65so145787416wmf.1
	for <qemu-arm@nongnu.org>; Wed, 27 Jan 2016 05:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=KjTaU4NM11HNLCMA4lsu9lzxtUeVWnwJYW8+UILFCpU=;
	b=KqHW4xQkIrf1EP2Ig2nmQHN+uIDUvsL6wuKZ3BaYW8PQqyvv0DMjnTYJIw9621gcCf
	pLjrkrIHvPPXLEd++RMAZe7RMj5Vh7xXYT2XS0clETyUKQJUS77BWzLtzQ12N3zxeVtH
	SC29lhjlscVcUoLrluhWSWXsFDY6MA8ZRP9to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KjTaU4NM11HNLCMA4lsu9lzxtUeVWnwJYW8+UILFCpU=;
	b=VEKsefIovVS5V50nweLvBePVwV+5cYsbnvhR7dflOs2wbOpjr3YhQ/gRi8bTgx64td
	fMZTNTakqtAJOkEc/ATqTqxyI9wXARcewYumK56AVK8zAJGHSTpZViqQ2bpA3v8dxRFM
	QyyZ5t7UCMDFI6S1NR92hKtlzqgB9sJRNEBKNuDuAk0Fb0DCOeiLu2vAIlL1u9QhFkch
	3um0z9F5X61+z6a5WLnjVJXrG6HgDD9Ag7y0PFqzz4e916mrtuPojBrLH+l6nvabAkir
	gG4IpHU/ytr3XTV1Xo29wRrUEHHM2PsWdKEdwKxFVHd5Kg9KGM4TdYz7m2T8QFgxs5R8
	RodA==
X-Gm-Message-State: AG10YOQ2ekjMupWEHN9bZC9F5nn+INxXZDzjNB421EvoZ1JRkGJw7QA+5yvVNoXK1eMIHh2n
X-Received: by 10.194.19.101 with SMTP id d5mr15862020wje.72.1453902719774;
	Wed, 27 Jan 2016 05:51:59 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.51.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:51:58 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:48 +0000
Message-Id: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC 0/7] KVM PCI/MSI passthrough with mach-virt
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
X-TUID: 9JNiMnyCKBeI

This series enables KVM PCI/MSI passthrough with mach-virt.

A new memory region type is introduced (reserved iova). On
vfio_listener_region_add this IOVA region is registered to the kernel with
VFIO_IOMMU_MAP_DMA (using the new VFIO_DMA_MAP_FLAG_MSI_RESERVED_IOVA flag).

The host VFIO PCI driver then can use this IOVA window to map some host
physical addresses, accessed by passthrough'ed PCI devices, through the IOMMU.
The first goal is to map host MSI controller frames (GICv2M, GITS_TRANSLATER).

mach-virt currently instantiates a 16x64kB reserved IOVA window. This
provisions for future usage. Most probably this exceeds MSI binding needs.

The series includes Pranav/Tushar' series:
QEMU, [v2 0/2] Generic PCIe host bridge INTx determination for INTx routing
((https://lists.nongnu.org/archive/html/qemu-devel/2015-04/msg04361.html))

Those patches are not mandated for PCI/MSI passthrough to work but without
those, the following warning is observed and can puzzle the end-user:
"qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)"

If prefered, this series can be maintained separately. I just put them here
for consistency.

Best Regards

Eric

Dependencies:
The series depends on kernel series: "[PATCH 00/10] KVM PCIe/MSI passthrough on
ARM/ARM64", (https://lkml.org/lkml/2016/1/26/371)

Git:
QEMU:
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-pci-passthrough-rfc

Kernel:
https://git.linaro.org/people/eric.auger/linux.git/shortlog/refs/heads/v4.5-rc1-pcie-passthrough-v1

Testing:
- on ARM64 AMD Overdrive HW with one e1000e PCIe card.

Eric Auger (7):
  linux-headers: partial update for VFIO reserved IOVA registration
  Add a function to determine interrupt number for INTx routing
  Generic PCIe host bridge INTx determination for INTx routing
  hw: vfio: common: introduce vfio_register_reserved_iova
  memory: add reserved_iova region type
  hw: arm: virt: register reserved IOVA region
  hw: vfio: common: adapt vfio_listeners for reserved_iova region

 hw/arm/virt.c              | 14 ++++++++++
 hw/pci-host/gpex.c         | 12 ++++++++
 hw/vfio/common.c           | 68 ++++++++++++++++++++++++++++++++++++----------
 include/exec/memory.h      | 29 ++++++++++++++++++++
 include/hw/arm/virt.h      |  1 +
 include/hw/pci-host/gpex.h |  1 +
 linux-headers/linux/vfio.h | 15 ++++++++--
 memory.c                   | 11 ++++++++
 8 files changed, 134 insertions(+), 17 deletions(-)

-- 
1.9.1

