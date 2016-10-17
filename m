Received: by 10.80.166.35 with SMTP id d32csp635692edc;
        Mon, 17 Oct 2016 12:40:46 -0700 (PDT)
X-Received: by 10.55.191.132 with SMTP id p126mr29856219qkf.295.1476733246201;
        Mon, 17 Oct 2016 12:40:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e16si7327314qkj.151.2016.10.17.12.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwDm7-0002KU-PG
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:40:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDkD-0001Bs-KG
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 15:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDkC-0007kP-EN
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 15:38:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1bwDk9-0007h1-OQ; Mon, 17 Oct 2016 15:38:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D29D84E4F2;
	Mon, 17 Oct 2016 19:38:40 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-5-170.ams2.redhat.com [10.36.5.170])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9HJcVFU009529; Mon, 17 Oct 2016 15:38:36 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Mon, 17 Oct 2016 19:38:23 +0000
Message-Id: <1476733110-14293-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
References: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 17 Oct 2016 19:38:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 1/8] linux-headers: Partial update for MSI
 IOVA handling
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org, fkan@apm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: miNkIzdaMNPE

This is a partial update aiming at enhancing the VFIO user API
with IOMMU info capability chain, msi_resv reporting and
MSI IOVA window registration.

The kernel code is not yet upstreamed. It is available at
https://github.com/eauger/linux/tree/generic-v7-passthrough-v14
[PATCH v14 00/16] KVM PCIe/MSI passthrough on ARM/ARM64,
https://lkml.org/lkml/2016/10/12/347

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- update according to kernel v14 series

v2 -> v3:
- features VFIO_IOMMU_TYPE1_INFO_CAP_MSI_GEOMETRY
---
 linux-headers/linux/vfio.h | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 759b850..74c8f02 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -488,7 +488,23 @@ struct vfio_iommu_type1_info {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
-	__u64	iova_pgsizes;		/* Bitmap of supported page sizes */
+#define VFIO_IOMMU_INFO_CAPS	(1 << 1)	/* Info supports caps */
+	__u64	iova_pgsizes;	/* Bitmap of supported page sizes */
+	__u32   cap_offset;	/* Offset within info struct of first cap */
+	__u32	__resv;
+};
+
+/*
+ * The MSI_RESV capability allows to report the MSI reserved IOVA requirements:
+ * In case this capability is supported, the userspace must provide an IOVA
+ * window characterized by @size and @alignment using VFIO_IOMMU_MAP_DMA with
+ * RESERVED_MSI_IOVA flag.
+ */
+#define VFIO_IOMMU_TYPE1_INFO_CAP_MSI_RESV  1
+struct vfio_iommu_type1_info_cap_msi_resv {
+	struct vfio_info_cap_header header;
+	__u64 size;		/* requested IOVA aperture size in bytes */
+	__u64 alignment;	/* requested byte alignment of the window */
 };
 
 #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
@@ -498,12 +514,21 @@ struct vfio_iommu_type1_info {
  *
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required.
+ *
+ * In case RESERVED_MSI_IOVA flag is set, the API only aims at registering an
+ * IOVA region that will be used on some platforms to map the host MSI frames.
+ * In that specific case, vaddr is ignored. Once registered, an MSI reserved
+ * IOVA region stays until the container is closed.
+ * The requirement for provisioning such reserved IOVA range can be checked by
+ * checking the VFIO_IOMMU_TYPE1_INFO_CAP_MSI_RESV capability.
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
@@ -519,7 +544,8 @@ struct vfio_iommu_type1_dma_map {
  * Caller sets argsz.  The actual unmapped size is returned in the size
  * field.  No guarantee is made to the user that arbitrary unmaps of iova
  * or size different from those used in the original mapping call will
- * succeed.
+ * succeed. Once registered, an MSI region cannot be unmapped and stays
+ * until the container is closed.
  */
 struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
-- 
1.9.1

