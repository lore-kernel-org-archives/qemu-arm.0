Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2858128wrd;
        Fri, 21 Sep 2018 01:26:34 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY5/OHnNrt3Z7gV4Lmsd//tihh3ydZ8IT7nNLE9ubVXYIvZchdWI3sjuFguLrDgk0j7ODVy
X-Received: by 2002:a0c:8485:: with SMTP id m5-v6mr29926856qva.222.1537518393987;
        Fri, 21 Sep 2018 01:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518393; cv=none;
        d=google.com; s=arc-20160816;
        b=IjKggmbqUsVLgGmAn6nIy+FAiJ2ZT5C4SJnmNvdsWsBtIHN3maeK/+uD+uU7KsTAVl
         QXLAp8Icgyw9nC297Uv4V8FfpnUtfQBb2tGzz6GSjk0xcLyeSWpsI9tDO3nV71nm0Awv
         vpQvpwjcrhWRDs59B3Ffm0i5bAUrpsDOXftygeiW1cDXw0tnYYXCFZIK7h2y4j4XfRS5
         gMcbOHwKOoRYzeD5tHnrflXdunIaa1fXoGF6x5o2d5wUrIe/rpHxMBPSL7uzw10stY8O
         VH+JyZXfhZ6IprLPVrie/FG6s35g5C6Y4D/c7TUMP3bRBnQcSKTj5mikMvj+vXT7FZup
         89hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=wrVbdBXzH5VYV6GIRmaNsa1tpeecQGbCfShcY44Eydc=;
        b=V8RumiHMPAJMi7+qkbTr/rEBl6CruGp8qYF7O7qnrMO50oxSQ/RF/7NF1Yjuyi4BV0
         0hm0VBvFE5isd+n+25RuLmqDMEUD6EWBlTSofZv+lxnYTlYuKoVC9iw7yChXN6KoQr4G
         EZDCRmLefta/0RGM0L/0SCsgYsYHQnOt1ffRGPf/tOi7/iQG4f4enSvQVOhfCJhAmVNJ
         N8mJu7+bjf6lXILNDBXE2l7X00m4N20NYClm5VxyThafFy/hp8saVA6i5BwHtO33GthC
         88wTjj6PKB+bMfj15f509/K9iXGIXeAPt4svOxpHhCU9DivCBxtJLPB0HV/4gZ1FeJkU
         ns6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t19-v6si7560576qvc.208.2018.09.21.01.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gll-0002BD-EF
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:26:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gej-0003ri-F8
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Geg-0002Sa-Fb
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Geg-0002HF-6B; Fri, 21 Sep 2018 04:19:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B27E6308FBA9;
	Fri, 21 Sep 2018 08:19:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 656497D904;
	Fri, 21 Sep 2018 08:19:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:55 +0200
Message-Id: <20180921081819.9203-5-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 21 Sep 2018 08:19:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 04/28] linux-headers: Partial header update
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: duh7xJTZ6sDp

This imports both the iommu.h and vfio.h headers found on branch
https://github.com/eauger/linux/tree/v4.19-rc4-2stage-rfc-v2
([RFC v2 00/20] SMMUv3 Nested Stage Setup)

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- addition of the default reporting API
- renamings
- CD removal from iommu_pasid_smmuv3
---
 linux-headers/linux/iommu.h | 237 ++++++++++++++++++++++++++++++++++++
 linux-headers/linux/vfio.h  |  48 ++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 linux-headers/linux/iommu.h

diff --git a/linux-headers/linux/iommu.h b/linux-headers/linux/iommu.h
new file mode 100644
index 0000000000..9d55e7d053
--- /dev/null
+++ b/linux-headers/linux/iommu.h
@@ -0,0 +1,237 @@
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
+#ifndef _IOMMU_H
+#define _IOMMU_H
+
+#include <linux/types.h>
+
+/**
+ * SMMUv3 Stream Table Entry stage 1 related information
+ * @s1contextptr: Context Descriptor Table GPA
+ * @abort: shall the STE lead to abort
+ * @s1fmt: STE s1fmt field as set by the guest
+ * @s1cdmax: STE s1cdmax as set by the guest
+ * @s1dss: STE s1dss as set by the guest
+ * All field names match the smmu 3.0/3.1 spec (ARM IHI 0070A)
+ */
+struct iommu_pasid_smmuv3 {
+	__u64 s1contextptr;
+	__u8 bypass;
+	__u8 abort;
+	__u8 s1fmt;
+	__u8 s1cdmax;
+	__u8 s1dss;
+};
+
+/**
+ * PASID table data used to bind guest PASID table to the host IOMMU
+ * Note PASID table corresponds to the Context Table on ARM SMMUv3.
+ *
+ * @version: API version to prepare for future extensions
+ * @format: format of the PASID table
+ *
+ */
+struct iommu_pasid_table_config {
+#define PASID_TABLE_CFG_VERSION_1 1
+	__u32 version;
+#define IOMMU_PASID_FORMAT_SMMUV3	(1 << 0)
+	__u32 format;
+	union {
+		struct iommu_pasid_smmuv3 smmuv3;
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
+struct iommu_cache_invalidate_hdr {
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
+ * @arch_id:		architecture dependent id characterizing a context
+ *			and tagging the caches, ie. domain Identfier on VTD,
+ *			asid on ARM SMMU
+ * @addr:		page address to be invalidated
+ * @flags		IOMMU_INVALIDATE_ADDR_LEAF: leaf paging entries
+ *			IOMMU_INVALIDATE_GLOBAL_PAGE: global pages
+ *
+ */
+struct iommu_cache_invalidate_info {
+	struct iommu_cache_invalidate_hdr	hdr;
+	enum iommu_inv_granularity	granularity;
+	__u32		flags;
+#define IOMMU_INVALIDATE_ADDR_LEAF	(1 << 0)
+#define IOMMU_INVALIDATE_GLOBAL_PAGE	(1 << 1)
+	__u8		size;
+	__u64		nr_pages;
+	__u32		pasid;
+	__u64		arch_id;
+	__u64		addr;
+};
+
+struct iommu_guest_msi_binding {
+	__u64		iova;
+	__u64		gpa;
+	__u32		granule;
+};
+
+/*  Generic fault types, can be expanded IRQ remapping fault */
+enum iommu_fault_type {
+	IOMMU_FAULT_DMA_UNRECOV = 1,	/* unrecoverable fault */
+	IOMMU_FAULT_PAGE_REQ,		/* page request fault */
+};
+
+enum iommu_fault_reason {
+	IOMMU_FAULT_REASON_UNKNOWN = 0,
+
+	/* IOMMU internal error, no specific reason to report out */
+	IOMMU_FAULT_REASON_INTERNAL,
+
+	/* Could not access the PASID table (fetch caused external abort) */
+	IOMMU_FAULT_REASON_PASID_FETCH,
+
+	/* could not access the device context (fetch caused external abort) */
+	IOMMU_FAULT_REASON_DEVICE_CONTEXT_FETCH,
+
+	/* pasid entry is invalid or has configuration errors */
+	IOMMU_FAULT_REASON_BAD_PASID_ENTRY,
+
+	/* device context entry is invalid or has configuration errors */
+	IOMMU_FAULT_REASON_BAD_DEVICE_CONTEXT_ENTRY,
+	/*
+	 * PASID is out of range (e.g. exceeds the maximum PASID
+	 * supported by the IOMMU) or disabled.
+	 */
+	IOMMU_FAULT_REASON_PASID_INVALID,
+
+	/* source id is out of range */
+	IOMMU_FAULT_REASON_SOURCEID_INVALID,
+
+	/*
+	 * An external abort occurred fetching (or updating) a translation
+	 * table descriptor
+	 */
+	IOMMU_FAULT_REASON_WALK_EABT,
+
+	/*
+	 * Could not access the page table entry (Bad address),
+	 * actual translation fault
+	 */
+	IOMMU_FAULT_REASON_PTE_FETCH,
+
+	/* Protection flag check failed */
+	IOMMU_FAULT_REASON_PERMISSION,
+
+	/* access flag check failed */
+	IOMMU_FAULT_REASON_ACCESS,
+
+	/* Output address of a translation stage caused Address Size fault */
+	IOMMU_FAULT_REASON_OOR_ADDRESS
+};
+
+/**
+ * struct iommu_fault - Generic fault data
+ *
+ * @type contains fault type
+ * @reason fault reasons if relevant outside IOMMU driver.
+ * IOMMU driver internal faults are not reported.
+ * @addr: tells the offending page address
+ * @fetch_addr: tells the address that caused an abort, if any
+ * @pasid: contains process address space ID, used in shared virtual memory
+ * @page_req_group_id: page request group index
+ * @last_req: last request in a page request group
+ * @pasid_valid: indicates if the PRQ has a valid PASID
+ * @prot: page access protection flag:
+ *	IOMMU_FAULT_READ, IOMMU_FAULT_WRITE
+ */
+
+struct iommu_fault {
+	__u32	type;   /* enum iommu_fault_type */
+	__u32	reason; /* enum iommu_fault_reason */
+	__u64	addr;
+	__u64	fetch_addr;
+	__u32	pasid;
+	__u32	page_req_group_id;
+	__u32	last_req;
+	__u32	pasid_valid;
+	__u32	prot;
+	__u32	access;
+};
+#endif /* _IOMMU_H */
+
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 3615a269d3..250c09f3cf 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -14,6 +14,7 @@
 
 #include <linux/types.h>
 #include <linux/ioctl.h>
+#include <linux/iommu.h>
 
 #define VFIO_API_VERSION	0
 
@@ -665,6 +666,53 @@ struct vfio_iommu_type1_dma_unmap {
 #define VFIO_IOMMU_ENABLE	_IO(VFIO_TYPE, VFIO_BASE + 15)
 #define VFIO_IOMMU_DISABLE	_IO(VFIO_TYPE, VFIO_BASE + 16)
 
+struct vfio_iommu_type1_bind_pasid_table {
+	__u32	argsz;
+	__u32	flags;
+	struct iommu_pasid_table_config config;
+};
+#define VFIO_IOMMU_BIND_PASID_TABLE	_IO(VFIO_TYPE, VFIO_BASE + 22)
+
+struct vfio_iommu_type1_cache_invalidate {
+	__u32   argsz;
+	__u32   flags;
+	struct iommu_cache_invalidate_info info;
+};
+#define VFIO_IOMMU_CACHE_INVALIDATE      _IO(VFIO_TYPE, VFIO_BASE + 23)
+
+struct vfio_iommu_type1_bind_guest_msi {
+	__u32   argsz;
+	__u32   flags;
+	struct iommu_guest_msi_binding binding;
+};
+#define VFIO_IOMMU_BIND_MSI      _IO(VFIO_TYPE, VFIO_BASE + 24)
+
+struct vfio_iommu_type1_guest_fault_config {
+#define VFIO_IOMMU_FAULT_UNRECOVERABLE	(1 << 0)
+	__u32	flags;
+	union {
+		__u8	qs; /* queue size, log2(entries) */
+	};
+};
+
+struct vfio_iommu_type1_set_fault_eventfd {
+	__u32   argsz;
+	__u32   flags;
+	__u32   eventfd;
+	struct vfio_iommu_type1_guest_fault_config config;
+};
+#define VFIO_IOMMU_SET_FAULT_EVENTFD      _IO(VFIO_TYPE, VFIO_BASE + 25)
+
+struct vfio_iommu_type1_get_fault_events {
+	__u32	argsz;
+	__u32   flags;
+	__u32	count; /* number of faults returned */
+	__u32   reserved;
+	struct iommu_fault events[];
+};
+
+#define VFIO_IOMMU_GET_FAULT_EVENTS	_IO(VFIO_TYPE, VFIO_BASE + 26)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
-- 
2.17.1

