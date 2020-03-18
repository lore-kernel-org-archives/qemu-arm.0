Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp614597lfe;
        Wed, 18 Mar 2020 03:14:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtE5h/tUMx0cT6usUgAz655iTtqWjFOtuPjjCr2w8YtZpyO40urqMiEPX2nCwd825kFl8xg
X-Received: by 2002:a37:8847:: with SMTP id k68mr1744108qkd.474.1584526445653;
        Wed, 18 Mar 2020 03:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526445; cv=none;
        d=google.com; s=arc-20160816;
        b=T8jBGMZzdPy7I/WUnnPnXgdgoMxPKsLfaLBr79TiE8+CBGjkNotbVdf0KJKyOIGsKo
         t3/YHyq/znlEnfbHpgt5VxSXlrTRKdOtTusMsL/eI7WQp+yw+j1RWVtXl5RGQs5bff5t
         425g+7mVeluVeDgc+XJiEqvszGMHHIWFZyBq9wGqVh64KEm/X6kb0km8ka/GHH8/lnvH
         zomcukEQ4ctGFF5ggqVMifQNrN8Zi0IsLjfLjo7TUVWinmNUojBDYkwEndd9G+iGIAma
         sXcSsQV2aj/nMi1aF4LuZf8VvQVkholBmI3rtAVD2LlzTh59j9TJoQ7oWqI13kqR3Urp
         H6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=vF13sRjgV2iwHWGieK2LuMmHy7/+wnZoyF7KV4TjITI=;
        b=jzegcjDJbXUngdwW1hzhSumN46XECF7+gdZppuUEQIN/tVMUMwmRgFQrbs10N3Javr
         e7ePJC19YhxJ69NJvLxiMck6JL7m7oe0mEEUG2qQKzV44MdHn188l/wEew5wneu0RL1H
         sFT2eMS/9K1sAO2bzmirhksq1mF16RlfK/XIhKdXOvPW254c9r/wK8pFWvEf0b2YW8C0
         I0nDT3QXb49lNGnkI1Gt2C1d+Xer3KzSx3zL7iCHNAvq2Ielq3IXVb94sqNXhzqcbL25
         IYVhNc4FawfLf/HQTuIOSN9Py3cpHnvOpUHp0WjP/R8sHPk3GedFrnFbbw71RCbmNwpg
         SsZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="ip71e/3D";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n60si3713721qtd.1.2020.03.18.03.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:14:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b="ip71e/3D";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVi9-0004WK-27
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgW-0001qG-La
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgV-0004XH-Eh
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:24 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:37546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgV-0004Ww-9u; Wed, 18 Mar 2020 06:12:23 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IABn5X030628; Wed, 18 Mar 2020 03:12:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=vF13sRjgV2iwHWGieK2LuMmHy7/+wnZoyF7KV4TjITI=;
 b=ip71e/3DsV06eWrfRqBaWDDVw5Aqlz6vlDOLTe/TVRXp26o3h3Jl/IHfayLbtM/UmECX
 wmAMf10H6RDrgU8cMbwAgaycDfAVErWJBpUcXKjYE+6YE3jWYkp+oDKNuNLw0ti5Vl9F
 1pzQD8jF9oDgSwprrgkItBeE3K4D+yZCdNiyEkVOvDzwFMQag7uWyatpGaTt1uailz7y
 8NDQWhx2ImXePtdKFLfSvmc38f7CHghOwfnbSXYFeuWSy2h6cLQnQ9tiBKOmtFEWQ8v9
 rnBZoMhOsbkCMedDQkCFTyYeBXmRHlJMr5YuivMAfEw6VVqnZGtjFJzHDD4NAUINJgA/ Vw== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yu9rp9tug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:20 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Mar
 2020 03:12:18 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:13 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 2/8] memory: Add interface to set iommu page size mask
Date: Wed, 18 Mar 2020 15:41:53 +0530
Message-ID: <20200318101159.8767-3-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318101159.8767-1-bbhushan2@marvell.com>
References: <20200318101159.8767-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qSxLlZ7n85eV

Allow to set page size mask to be supported by iommu.
This is required to expose page size mask compatible with
host with virtio-iommu.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
v7->v8:
 - new patch

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

