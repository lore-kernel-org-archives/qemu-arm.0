Received: by 10.80.163.71 with SMTP id 65csp3117768edn;
        Thu, 6 Oct 2016 02:51:03 -0700 (PDT)
X-Received: by 10.55.42.163 with SMTP id q35mr13112764qkq.283.1475747463360;
        Thu, 06 Oct 2016 02:51:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si5071103qka.196.2016.10.06.02.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 02:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs5KQ-0006pV-Mq
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 05:51:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KK-0006og-D3
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KH-00078E-Rq
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:50:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs5KH-000782-Ht; Thu, 06 Oct 2016 05:50:53 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC3EE1555E;
	Thu,  6 Oct 2016 09:50:52 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u969okS0016130; Thu, 6 Oct 2016 05:50:50 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 09:50:37 +0000
Message-Id: <1475747444-12552-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
References: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 06 Oct 2016 09:50:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 1/8] linux-headers: Partial update for MSI IOVA
 handling
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
X-TUID: A1j5ThZXI7Ha

This is a partial update aiming at enhancing the VFIO user API
with IOMMU info capability chain, msi_geometry reporting and
MSI IOVA window registration.

The kernel code is not yet upstreamed. It is available at
https://github.com/eauger/linux/tree/generic-v7-passthrough-v13
([PATCH v13 00/15] KVM PCIe/MSI passthrough on ARM/ARM64)

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- features VFIO_IOMMU_TYPE1_INFO_CAP_MSI_GEOMETRY
---
 linux-headers/linux/vfio.h | 48 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 759b850..8dae013 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -8,8 +8,8 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef VFIO_H
-#define VFIO_H
+#ifndef _UAPIVFIO_H
+#define _UAPIVFIO_H
 
 #include <linux/types.h>
 #include <linux/ioctl.h>
@@ -488,7 +488,35 @@ struct vfio_iommu_type1_info {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
-	__u64	iova_pgsizes;		/* Bitmap of supported page sizes */
+#define VFIO_IOMMU_INFO_CAPS	(1 << 1)	/* Info supports caps */
+	__u64	iova_pgsizes;	/* Bitmap of supported page sizes */
+	__u32	__resv;
+	__u32   cap_offset;	/* Offset within info struct of first cap */
+};
+
+#define VFIO_IOMMU_TYPE1_INFO_CAP_MSI_GEOMETRY	1
+
+/*
+ * The MSI geometry capability allows to report the MSI IOVA geometry:
+ * - either the MSI IOVAs are constrained within a reserved IOVA aperture
+ *   whose boundaries are given by [@aperture_start, @aperture_end].
+ *   this is typically the case on x86 host. The userspace is not allowed
+ *   to map userspace memory at IOVAs intersecting this range using
+ *   VFIO_IOMMU_MAP_DMA.
+ * - or the MSI IOVAs are not requested to belong to any reserved range;
+ *   in that case the userspace must provide an IOVA window characterized by
+ *   @size and @alignment using VFIO_IOMMU_MAP_DMA with RESERVED_MSI_IOVA flag.
+ */
+struct vfio_iommu_type1_info_cap_msi_geometry {
+	struct vfio_info_cap_header header;
+	__u32 flags;
+#define VFIO_IOMMU_MSI_GEOMETRY_RESERVED (1 << 0) /* reserved geometry */
+	/* not reserved */
+	__u32 order; /* iommu page order used for aperture alignment*/
+	__u64 size; /* IOVA aperture size (bytes) the userspace must provide */
+	/* reserved */
+	__u64 aperture_start;
+	__u64 aperture_end;
 };
 
 #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
@@ -498,12 +526,21 @@ struct vfio_iommu_type1_info {
  *
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required.
+ *
+ * In case RESERVED_MSI_IOVA flag is set, the API only aims at registering an
+ * IOVA region that will be used on some platforms to map the host MSI frames.
+ * In that specific case, vaddr is ignored. Once registered, an MSI reserved
+ * IOVA region stays until the container is closed.
+ * The requirement for provisioning such reserved IOVA range can be checked by
+ * checking the VFIO_IOMMU_TYPE1_INFO_CAP_MSI_GEOMETRY capability.
  */
 struct vfio_iommu_type1_dma_map {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_MAP_FLAG_READ (1 << 0)		/* readable from device */
 #define VFIO_DMA_MAP_FLAG_WRITE (1 << 1)	/* writable from device */
+/* reserved iova for MSI vectors*/
+#define VFIO_DMA_MAP_FLAG_RESERVED_MSI_IOVA (1 << 2)
 	__u64	vaddr;				/* Process virtual address */
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
@@ -519,7 +556,8 @@ struct vfio_iommu_type1_dma_map {
  * Caller sets argsz.  The actual unmapped size is returned in the size
  * field.  No guarantee is made to the user that arbitrary unmaps of iova
  * or size different from those used in the original mapping call will
- * succeed.
+ * succeed. Once registered, an MSI region cannot be unmapped and stays
+ * until the container is closed.
  */
 struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
@@ -688,4 +726,4 @@ struct vfio_iommu_spapr_tce_remove {
 
 /* ***************************************************************** */
 
-#endif /* VFIO_H */
+#endif /* _UAPIVFIO_H */
-- 
1.9.1

