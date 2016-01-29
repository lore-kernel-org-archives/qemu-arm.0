Received: by 10.25.159.19 with SMTP id i19csp1054349lfe;
        Fri, 29 Jan 2016 08:56:05 -0800 (PST)
X-Received: by 10.140.151.4 with SMTP id 4mr12291689qhx.16.1454086562438;
        Fri, 29 Jan 2016 08:56:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c108si18482627qgf.117.2016.01.29.08.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:56:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCL3-00056X-UB
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:56:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJA-0001iV-VP
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ6-0003vn-70
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:04 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:33768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJ6-0003vb-0S
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:00 -0500
Received: by mail-wm0-x236.google.com with SMTP id l66so75257914wml.0
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 08:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SQiVRgyRE5YBEufwQNdwJMCFDkzRgeA46exBv8mBUE8=;
	b=Bqy8+TYC8RVm91vhv/zWeZINnRvVX8iRdpOruqlcM84kSdN+XHFMIy/kE1fvFy/Eca
	yuGjFiU+XbZMS7MucPrKisiTHhsCJe0VyAAGs62BAqU4d9Y8e9lh+KdQEnLvSbnTsDft
	OBVL/tKKSglcTyeOxR+FKFkKhtftyBu/xIxj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SQiVRgyRE5YBEufwQNdwJMCFDkzRgeA46exBv8mBUE8=;
	b=X+RwpNDSEAFXy7UgCdE8p1Tp/xHNmLsoaGa6MJBaYEYVtMN8wz8gGqc2kVxuQnIIlQ
	Kc72i7KvwjOzswwrE4XNVQArld1yDCWKer25Qr7mU9v3fB4WOX1mexfE7Ibn66f5/TbY
	3qc67rQ01sHBGW7meBrmpUTApOHufRx39nza8K9w67e0ALFl3ugjl8EvExdLidXDb/l5
	W2cn4UlpQW1rFFnRsSiTX2OzbV6U+HXGh/QebPenTcVeWvRrEdKfkhE2RtgDKRDaL6eI
	qAoErAoN/9cgQcX1ighPXq0uff50CndayjVm8yROkF/o+JxsNkulYRobZ6HDp13mfcqo
	BdEw==
X-Gm-Message-State: AG10YOQCQBETwn9S405WRQeFzao26jsCzcuIWIkcpbbkpVrIKMLg2+mFBnmtmbSTzui1ojcN
X-Received: by 10.194.112.41 with SMTP id in9mr9852269wjb.139.1454086439231;
	Fri, 29 Jan 2016 08:53:59 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.53.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:53:58 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:42 +0000
Message-Id: <1454086429-4373-2-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC v2 1/8] linux-headers: partial update for VFIO
	reserved IOVA registration
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
X-TUID: YxYRJyta7I5O

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

