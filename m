Received: by 10.25.159.19 with SMTP id i19csp2423928lfe;
        Wed, 27 Jan 2016 05:52:47 -0800 (PST)
X-Received: by 10.55.78.70 with SMTP id c67mr34936180qkb.37.1453902766975;
        Wed, 27 Jan 2016 05:52:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si6092548qha.63.2016.01.27.05.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:52:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQWc-0003Vj-GJ
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:52:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVy-0002gG-9m
	for qemu-devel@nongnu.org; Wed, 27 Jan 2016 08:52:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVv-00028X-PT
	for qemu-devel@nongnu.org; Wed, 27 Jan 2016 08:52:06 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:33129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQVv-00028F-IZ
	for qemu-devel@nongnu.org; Wed, 27 Jan 2016 08:52:03 -0500
Received: by mail-wm0-x229.google.com with SMTP id l66so3565358wml.0
	for <qemu-devel@nongnu.org>; Wed, 27 Jan 2016 05:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SQiVRgyRE5YBEufwQNdwJMCFDkzRgeA46exBv8mBUE8=;
	b=UkuMJg24R0HE5QcaN3zzJ2aKxVBgWx7M+RTtslh1IHaaYn8pFdgZpFR3pGAy+4AGfN
	Vu7RbaqXAijkmfr4X33SMtQApEI0pMzW7jTJRWBEx6XWsjFgdQ+XJHFiQLS2UChZxtHL
	qOGIoMeTR2zZRRFV2HjEeZ48j1ETyln6BetA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SQiVRgyRE5YBEufwQNdwJMCFDkzRgeA46exBv8mBUE8=;
	b=TsT67E8zG8f5G/Nj15Z/VfqFgCc1VcLQRqD3DHWvbWJDug4ffq0uFS73kkVBEg6Eeg
	EDOjZ32keRrm/7VKllOJIibL2zXb7fA6Wpc7i2DmZz/BD1I5+0OTQtle9yQzXx36WAmV
	BFmvm2y3JnyLVetcCbWcikeCtC+wUOD3wHzXl5d3zWQdvHrOQLsiP3c8ATKbHEB40kFw
	hCQ+zE73mLSgCNZQ9h1lvVj305wGmHtL3fauXzBV7L+cIC9ZWHF3FwxTe2m5llqdgAqN
	Mc5S8a13aEuZ//I3z0eTNcQrc5FsVwWpvMLeZpt/js2YdRyy8cgVuFolDunH3YGgPtK0
	aH+g==
X-Gm-Message-State: AG10YOTkoRolmPWX29k/ntQacN5h4y6KJCK3y6fhWTSf0/p1XtOfrp6yup5zKpf041w5ihMY
X-Received: by 10.28.3.131 with SMTP id 125mr32356043wmd.14.1453902722807;
	Wed, 27 Jan 2016 05:52:02 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.51.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:52:01 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:49 +0000
Message-Id: <1453902715-25304-2-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-devel] [RFC 1/7] linux-headers: partial update for VFIO
	reserved IOVA registration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9tIGP3etdEm6

This is a partial update aiming at enhancing the VFIO user API
according to not yet upstreamed kernel developments available at:

https://git.linaro.org/people/eric.auger/linux.git/shortlog/refs/heads/v4.5-rc1-pcie-passthrough-v1

See https://lkml.org/lkml/2016/1/26/371 for more details.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 linux-headers/linux/vfio.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index aa276bc..ac6032e 100644
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
@@ -393,6 +393,7 @@ struct vfio_iommu_type1_info {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
+#define VFIO_IOMMU_INFO_REQUIRE_MSI_MAP (1 << 1)/* MSI must be mapped */
 	__u64	iova_pgsizes;		/* Bitmap of supported page sizes */
 };
 
@@ -403,12 +404,20 @@ struct vfio_iommu_type1_info {
  *
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required.
+ *
+ * In case MSI_RESERVED_IOVA is set, the API only aims at registering an IOVA
+ * region which will be used on some platforms to map the host MSI frame.
+ * in that specific case, vaddr is ignored. The requirement for provisioning
+ * such IOVA range can be checked by calling VFIO_IOMMU_GET_INFO with the
+ * VFIO_IOMMU_INFO_REQUIRE_MSI_MAP attribute.
  */
 struct vfio_iommu_type1_dma_map {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_MAP_FLAG_READ (1 << 0)		/* readable from device */
 #define VFIO_DMA_MAP_FLAG_WRITE (1 << 1)	/* writable from device */
+/* reserved iova for MSI vectors*/
+#define VFIO_DMA_MAP_FLAG_MSI_RESERVED_IOVA (1 << 2)
 	__u64	vaddr;				/* Process virtual address */
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
@@ -591,4 +600,4 @@ struct vfio_iommu_spapr_tce_remove {
 
 /* ***************************************************************** */
 
-#endif /* VFIO_H */
+#endif /* _UAPIVFIO_H */
-- 
1.9.1

