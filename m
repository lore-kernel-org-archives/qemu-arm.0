Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1175379lfi;
        Mon, 23 Mar 2020 01:46:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuEeaKzOyMYLlIBy2l3ZylSTazyVXFJVtn+9yR6QDAn2hZb8Ydne9xf58SzY/MpAw6boKnu
X-Received: by 2002:a0c:bec8:: with SMTP id f8mr20067172qvj.0.1584953218701;
        Mon, 23 Mar 2020 01:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953218; cv=none;
        d=google.com; s=arc-20160816;
        b=psXPvo1m3G/C4Uw+eX4qjh7RP+8HKakcFs3Bfe2bd3xFzmLGPmxAZNr14ngOQ3OXA3
         R27VIfJUkScGn7Pju/R7S92fu7Who1uBvrAEPa1jFzjJfal/BZvoMFWyISM+a/2VZhiT
         YRkn6apcL3FjQUUCSoWmiv/UrvaIJKD+Ddmq1qRBG8TuxI5hfUhN4UIW5w5B4sdULAXS
         UCvwtipwBevepE2Az6RXFrx27NITw/IkZoEGcVyTDop4Z3zR9M/8uPLFujW/6VGPIY+H
         8uw61KUZKhTxrcjpd5hnFbPymcr6lQJSeFP0mv5gy3926b6+uIAakptRzH24jSt5MN/T
         w6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=Yu7U+IO1rJyPwcaDXc5BvMtX+sxoPo9svPD67aq7oOo=;
        b=gpUQvbrYYWMUDSc3MCzKfJQbKEPyffKmYXKBi+YhTK9sSYziAWOgELP4n5jr+0Pe31
         BWbZARBs5Spm9xbyJe/zRhoX05sKWeXPDOau4Jvncql3TNuxvaLQrqafRvtHQQptsr/Y
         g0usbcepR8Pyi08DXBxmDfYm5m2GidF9EIA/Rs0on4Ul+eFpPJ3+XEqdZWw+0AlheeY6
         DLIyzwRkU/nDNuJCPgmFn7ekV5lKPO7SAwg8m4aKQziH/OhVGsLNIgL5+e1awrnrUkBQ
         CfVINJIuCrgJp881K5nACkUK6nqu2rVyxl29fSUo8E0P147GEBQFMA3b5xuqap8BKsi8
         CM0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="KYp/SFJ7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si889051qtq.379.2020.03.23.01.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="KYp/SFJ7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIja-0008BV-4o
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjM-00083j-Kv
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjL-00035K-DC
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:46:44 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:43406
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjL-00034t-4u; Mon, 23 Mar 2020 04:46:43 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8eAKB010842; Mon, 23 Mar 2020 01:46:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=Yu7U+IO1rJyPwcaDXc5BvMtX+sxoPo9svPD67aq7oOo=;
 b=KYp/SFJ7rH3N7EY41c2vYIa4JUd5vnIaAOIvT4t+SLgMOkw4a9k7PmU/vHcjb/lOOYXk
 4C+m3p3yTil04bUb8aD2CaySpJ8h7hqGWBTs4LGXA8529f5Lh4f1gRyyTaioQViMWxqi
 OHmLO7S2aK5Il6WL3hLknKThibQAWIv2CN36wWUOOLi1WooVpK5VbTE/9Ik2KdI+eM8t
 FVFfm74EwMWSaMydvZmberdPZwKSZh+Yra15ucpN5pCWQtAaFHRdyohEv7GSQDGQqACQ
 3BzO7ODlNfUj/Gh1j7cYrbEw3PXVjC2ARK0xWToXbmTfGr5wvGmrUNAkruC6WQvrn6j9 iA== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0a-0016f401.pphosted.com with ESMTP id 2ywg9ndrvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:46:40 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 23 Mar 2020 01:46:38 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 23 Mar 2020 01:46:38 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:46:33 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 2/9] memory: Add interface to set iommu page size mask
Date: Mon, 23 Mar 2020 14:16:10 +0530
Message-ID: <20200323084617.1782-3-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4/Gwlt+d7Z4

Allow to set page size mask to be supported by iommu.
This is required to expose page size mask compatible with
host with virtio-iommu.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 include/exec/memory.h | 20 ++++++++++++++++++++
 memory.c              | 10 ++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e85b7de99a..063c424854 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -355,6 +355,16 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      */
     int (*num_indexes)(IOMMUMemoryRegion *iommu);
+
+    /*
+     * Set supported IOMMU page size
+     *
+     * Optional method: if this is supported then set page size that
+     * can be supported by IOMMU. This is called to set supported page
+     * size as per host Linux.
+     */
+     void (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
+                                      uint64_t page_size_mask);
 } IOMMUMemoryRegionClass;
 
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1363,6 +1373,16 @@ int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
  */
 int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
 
+/**
+ * memory_region_iommu_set_page_size_mask: set the supported pages
+ * size by iommu.
+ *
+ * @iommu_mr: the memory region
+ * @page_size_mask: supported page size mask
+ */
+void memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
+                                            uint64_t page_size_mask);
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/memory.c b/memory.c
index aeaa8dcc9e..14c8783084 100644
--- a/memory.c
+++ b/memory.c
@@ -1833,6 +1833,16 @@ static int memory_region_update_iommu_notify_flags(IOMMUMemoryRegion *iommu_mr,
     return ret;
 }
 
+void memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
+                                            uint64_t page_size_mask)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
+
+    if (imrc->iommu_set_page_size_mask) {
+        imrc->iommu_set_page_size_mask(iommu_mr, page_size_mask);
+    }
+}
+
 int memory_region_register_iommu_notifier(MemoryRegion *mr,
                                           IOMMUNotifier *n, Error **errp)
 {
-- 
2.17.1

