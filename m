Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp623293wrd;
        Sat, 1 Sep 2018 07:30:44 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbfGI6Ztk8CFtOBfX2HkXBS9vRG7LENFqgjTHXxps1bbXDdduIBVHcvY6X9NuPVQsUrQ2BK
X-Received: by 2002:a0c:f78d:: with SMTP id s13-v6mr19590431qvn.194.1535812244571;
        Sat, 01 Sep 2018 07:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812244; cv=none;
        d=google.com; s=arc-20160816;
        b=f1qiXcSzwpaApTzlWJmLSE/fLW3pRUGYhXH5/bFG0p4HHso6qwBTv3bVElPD8GUKyM
         1SHmxreiXCV4keDW7GiH7ppaEq80ECY35kBfmNEsxGXOMyL1mR8QNv6b0ERdfNlhVfTP
         kCU4zxYMm8aytCpmY9QQtXj431JO7mHG/tB1ZFcz38JuL5DO4y8NpJy3xwv1elEtuwME
         TdIji+ok8GI3m1CYtH0eQkkvAyhwQxPE+H/QuxGWNuK8NUCVy4wcE4MjC/cJjKz/JDom
         kRI1I55WaNoWYIujak9JTa4FTP9xb6GeV1E+R/KE0Z4bk4gao9d8e6iRs7gsiH529zxR
         kQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kRawriv27Cgj3p8eE1aDqJqL2cnYD2z1/O1qaR6Xajo=;
        b=Lx2uPbKJJnIONBTA2BAzXGQQdlD/5XnodV6q2xz0DEzJu1LaF/7ra7oKdN27zb3GEK
         x7QCMXP8iWPJq8wyfR0BPdbxbfcEDRZFxr3RgXxMe7zmS6Lc/dC+7GU1uhoOB9MMObzC
         1HaQB87iXzozGkX7qWmjYbWPoVUXjM7JLm00u2mimNb/DlGtlW0Ru15Y2APFeF2bDLDw
         8xD+RJeSwkjRS9Z1RXplxKqY0qbP5RDzFTLFmNveytWDnGJhqgs+DCpTpl/MWdKNUnbv
         649CGRHK6cayf8mDbr9XoLFgv6kiHuRm8JlQBzRH06C7DP25oy2sUH0aYduWJBelQ9Bw
         M4aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m2-v6si1822531qtp.350.2018.09.01.07.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6vD-0001w8-W0
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:30:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qT-0006Tw-LG
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oJ-0005MR-Fp
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:23:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53256 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oH-0005K6-Gl; Sat, 01 Sep 2018 10:23:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E611E68802;
	Sat,  1 Sep 2018 14:23:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1790F2166B41;
	Sat,  1 Sep 2018 14:23:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:22:55 +0200
Message-Id: <20180901142312.11662-4-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Sat, 01 Sep 2018 14:23:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Sat, 01 Sep 2018 14:23:33 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 03/20] linux-headers: Partial header update
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5s0lZ0+0lM5h

This imports both the iommu.h and vfio.h headers found on branch
https://github.com/eauger/linux/tree/v4.18-2stage-rfc++

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 linux-headers/linux/iommu.h | 157 ++++++++++++++++++++++++++++++++++++
 linux-headers/linux/vfio.h  |  28 ++++++-
 2 files changed, 182 insertions(+), 3 deletions(-)
 create mode 100644 linux-headers/linux/iommu.h

diff --git a/linux-headers/linux/iommu.h b/linux-headers/linux/iommu.h
new file mode 100644
index 0000000000..72536cf412
--- /dev/null
+++ b/linux-headers/linux/iommu.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * IOMMU user API definitions
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _UAPI_IOMMU_H
+#define _UAPI_IOMMU_H
+
+#include <linux/types.h>
+
+/**
+ * PASID table data used to bind guest PASID table to the host IOMMU. This will
+ * enable guest managed first level page tables.
+ * @version: for future extensions and identification of the data format
+ * @bytes: size of this structure
+ * @base_ptr:	PASID table pointer
+ * @pasid_bits:	number of bits supported in the guest PASID table, must be less
+ *		or equal than the host supported PASID size.
+ */
+struct iommu_pasid_table_config {
+	__u32 version;
+#define PASID_TABLE_CFG_VERSION_1 1
+	__u32 bytes;
+	__u64 base_ptr;
+	__u8 pasid_bits;
+};
+
+/**
+ * Stream Table Entry stage info
+ * @flags: indicate the stage 1 state
+ * @cdptr_dma: GPA of the Context Descriptor
+ * @asid_bits: number of asid bits supported in the guest, must be less or
+ *             equal than the host asid size
+ */
+struct iommu_smmu_s1_config {
+#define IOMMU_SMMU_S1_DISABLED	(1 << 0)
+#define IOMMU_SMMU_S1_BYPASSED	(1 << 1)
+#define IOMMU_SMMU_S1_ABORTED	(1 << 2)
+	__u32 flags;
+	__u64 cdptr_dma;
+	__u8 asid_bits;
+};
+
+struct iommu_guest_stage_config {
+#define PASID_TABLE	(1 << 0)
+#define SMMUV3_S1_CFG	(1 << 1)
+	__u32 flags;
+	union {
+		struct iommu_pasid_table_config pasidt;
+		struct iommu_smmu_s1_config smmu_s1;
+	};
+};
+
+/**
+ * enum iommu_inv_granularity - Generic invalidation granularity
+ * @IOMMU_INV_GRANU_DOMAIN_ALL_PASID:	TLB entries or PASID caches of all
+ *					PASIDs associated with a domain ID
+ * @IOMMU_INV_GRANU_PASID_SEL:		TLB entries or PASID cache associated
+ *					with a PASID and a domain
+ * @IOMMU_INV_GRANU_PAGE_PASID:		TLB entries of selected page range
+ *					within a PASID
+ *
+ * When an invalidation request is passed down to IOMMU to flush translation
+ * caches, it may carry different granularity levels, which can be specific
+ * to certain types of translation caches.
+ * This enum is a collection of granularities for all types of translation
+ * caches. The idea is to make it easy for IOMMU model specific driver to
+ * convert from generic to model specific value. Each IOMMU driver
+ * can enforce check based on its own conversion table. The conversion is
+ * based on 2D look-up with inputs as follows:
+ * - translation cache types
+ * - granularity
+ *
+ *             type |   DTLB    |    TLB    |   PASID   |
+ *  granule         |           |           |   cache   |
+ * -----------------+-----------+-----------+-----------+
+ *  DN_ALL_PASID    |   Y       |   Y       |   Y       |
+ *  PASID_SEL       |   Y       |   Y       |   Y       |
+ *  PAGE_PASID      |   Y       |   Y       |   N/A     |
+ *
+ */
+enum iommu_inv_granularity {
+	IOMMU_INV_GRANU_DOMAIN_ALL_PASID,
+	IOMMU_INV_GRANU_PASID_SEL,
+	IOMMU_INV_GRANU_PAGE_PASID,
+	IOMMU_INV_NR_GRANU,
+};
+
+/**
+ * enum iommu_inv_type - Generic translation cache types for invalidation
+ *
+ * @IOMMU_INV_TYPE_DTLB:	device IOTLB
+ * @IOMMU_INV_TYPE_TLB:		IOMMU paging structure cache
+ * @IOMMU_INV_TYPE_PASID:	PASID cache
+ * Invalidation requests sent to IOMMU for a given device need to indicate
+ * which type of translation cache to be operated on. Combined with enum
+ * iommu_inv_granularity, model specific driver can do a simple lookup to
+ * convert from generic to model specific value.
+ */
+enum iommu_inv_type {
+	IOMMU_INV_TYPE_DTLB,
+	IOMMU_INV_TYPE_TLB,
+	IOMMU_INV_TYPE_PASID,
+	IOMMU_INV_NR_TYPE
+};
+
+/**
+ * Translation cache invalidation header that contains mandatory meta data.
+ * @version:	info format version, expecting future extesions
+ * @type:	type of translation cache to be invalidated
+ */
+struct iommu_tlb_invalidate_hdr {
+	__u32 version;
+#define TLB_INV_HDR_VERSION_1 1
+	enum iommu_inv_type type;
+};
+
+/**
+ * Translation cache invalidation information, contains generic IOMMU
+ * data which can be parsed based on model ID by model specific drivers.
+ * Since the invalidation of second level page tables are included in the
+ * unmap operation, this info is only applicable to the first level
+ * translation caches, i.e. DMA request with PASID.
+ *
+ * @granularity:	requested invalidation granularity, type dependent
+ * @size:		2^size of 4K pages, 0 for 4k, 9 for 2MB, etc.
+ * @nr_pages:		number of pages to invalidate
+ * @pasid:		processor address space ID value per PCI spec.
+ * @addr:		page address to be invalidated
+ * @flags		IOMMU_INVALIDATE_ADDR_LEAF: leaf paging entries
+ *			IOMMU_INVALIDATE_GLOBAL_PAGE: global pages
+ *
+ */
+struct iommu_tlb_invalidate_info {
+	struct iommu_tlb_invalidate_hdr	hdr;
+	enum iommu_inv_granularity	granularity;
+	__u32		flags;
+#define IOMMU_INVALIDATE_ADDR_LEAF	(1 << 0)
+#define IOMMU_INVALIDATE_GLOBAL_PAGE	(1 << 1)
+	__u8		size;
+	__u64		nr_pages;
+	__u32		pasid;
+	__u64		addr;
+};
+
+struct iommu_guest_msi_binding {
+	__u64		iova;
+	__u64		gpa;
+	__u32		granule;
+};
+#endif /* _UAPI_IOMMU_H */
+
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 3615a269d3..8b22565fba 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -9,11 +9,12 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef VFIO_H
-#define VFIO_H
+#ifndef _UAPIVFIO_H
+#define _UAPIVFIO_H
 
 #include <linux/types.h>
 #include <linux/ioctl.h>
+#include <linux/iommu.h>
 
 #define VFIO_API_VERSION	0
 
@@ -665,6 +666,27 @@ struct vfio_iommu_type1_dma_unmap {
 #define VFIO_IOMMU_ENABLE	_IO(VFIO_TYPE, VFIO_BASE + 15)
 #define VFIO_IOMMU_DISABLE	_IO(VFIO_TYPE, VFIO_BASE + 16)
 
+struct vfio_iommu_type1_bind_guest_stage {
+	__u32	argsz;
+	__u32	flags;
+	struct iommu_guest_stage_config config;
+};
+#define VFIO_IOMMU_BIND_GUEST_STAGE	_IO(VFIO_TYPE, VFIO_BASE + 22)
+
+struct vfio_iommu_type1_tlb_invalidate {
+	__u32   argsz;
+	__u32   flags;
+	struct iommu_tlb_invalidate_info info;
+};
+#define VFIO_IOMMU_TLB_INVALIDATE      _IO(VFIO_TYPE, VFIO_BASE + 23)
+
+struct vfio_iommu_type1_bind_guest_msi {
+	__u32   argsz;
+	__u32   flags;
+	struct iommu_guest_msi_binding binding;
+};
+#define VFIO_IOMMU_BIND_MSI      _IO(VFIO_TYPE, VFIO_BASE + 24)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
@@ -816,4 +838,4 @@ struct vfio_iommu_spapr_tce_remove {
 
 /* ***************************************************************** */
 
-#endif /* VFIO_H */
+#endif /* _UAPIVFIO_H */
-- 
2.17.1

