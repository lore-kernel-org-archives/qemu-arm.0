Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp249399lfg;
        Thu, 25 Feb 2021 03:09:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCJAxbDW3ty4dH7d9Q/RFPT1BFdZ3hYwE/ji+ZCf/+3dy264icG2DM93GTXFly5/1Ox1l0
X-Received: by 2002:a6b:c997:: with SMTP id z145mr2182111iof.36.1614251369324;
        Thu, 25 Feb 2021 03:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251369; cv=none;
        d=google.com; s=arc-20160816;
        b=Nb5kR7qbkwBH/yeB0mygmySLsUjxLsFqhL0K5sgUW96p0nhpq5O13xPYCN2rlaK9Zp
         D9kUs5Fi8snq6MjpCnovnU+F2oguM776x++X+7PwI0JvFzqTAeVWnRPCmvJuH6W+5vkH
         ar4m0/8djjhZqpFW2vDIcfKs7SFL+jVCwFdg0dNmWeGGKfd6KRddC618jMTkeRE5uTzG
         OgRKXtmV+N+KkDLkjYR68DMmmW+4fi07lcYTxaJnFuC76jquYZVLqKKLCRRYjVyp+HCD
         mjKtsPrb4OM0agCpKoUx9KhqFauDqb0XFRN1XX7u3m2ZUQJ+Y2s0iwEiMFJEErn6Mjoy
         ZjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PI/H2lV6bb09C81tWdfgp+CTkXAgWag50xZZFzSVd48=;
        b=SH04wEay4qRjAqK1csJIPMexySplghlRHMQiO2D8YusDYrNy/ehIizfhRjtmWe+xlU
         +C1ZFLph57Cb2RFRVsORpWf1TDhrApLksNhw9RoKF1nV/aSoVumUXHEDsb+cpDLJE7ki
         z1204FX2buVwBa6AB4f/K6DkY7DTZkA7c9vfDGF9v5/eYDas4WhoPSEXQ+ehMS5vMouH
         aPRQD2CWYLJu54nP+DtLu0OB07BrQbYUZ/nGI/T3BIOkw4paNiE939grxV7W45oxqWzW
         Af72gZBYk8uofY2SDkn8+2nsXUwGVksLB+17aa7WqBHOxd/dgIfMwIT9qF9G0r2ofHER
         6iwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d39Shzx+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si4836954ilu.26.2021.02.25.03.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:09:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d39Shzx+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEWO-0003il-Ke
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEI2-00075I-3w
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:54:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEI0-0005Ly-HI
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PI/H2lV6bb09C81tWdfgp+CTkXAgWag50xZZFzSVd48=;
 b=d39Shzx+xdVcj3+8NfjEVisSG0dNeSIhjBZKFQ6RJh3SafPt+G83VKhEZ4pIhuZAsMA0P4
 KcLfvEaCXRYFdJ4OhwJpGDgNemfOS132ssAVRB4WXmuzK0yeg1+HQ7/k49fEJ2yajUqzNZ
 Ju6jj23401uXITQgf7Zcyyhdz3g4rsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-Ot5u8t7tPLyzx-sc7mKbuw-1; Thu, 25 Feb 2021 05:54:34 -0500
X-MC-Unique: Ot5u8t7tPLyzx-sc7mKbuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281B018B6141;
 Thu, 25 Feb 2021 10:54:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C5EF5D9D7;
 Thu, 25 Feb 2021 10:54:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 08/28] memory: Introduce IOMMU Memory Region inject_faults API
Date: Thu, 25 Feb 2021 11:52:13 +0100
Message-Id: <20210225105233.650545-9-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mg9Xgp7g5nnq

This new API allows to inject @count iommu_faults into
the IOMMU memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 24 ++++++++++++++++++++++++
 softmmu/memory.c      | 10 ++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index ad6c807262..0c4389c383 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -65,6 +65,8 @@ struct ReservedRegion {
     unsigned type;
 };
 
+struct iommu_fault;
+
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
 
 /* See address_space_translate: bit 0 is read, bit 1 is write.  */
@@ -475,6 +477,19 @@ struct IOMMUMemoryRegionClass {
      int (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
                                      uint64_t page_size_mask,
                                      Error **errp);
+
+    /*
+     * Inject @count faults into the IOMMU memory region
+     *
+     * Optional method: if this method is not provided, then
+     * memory_region_injection_faults() will return -ENOENT
+     *
+     * @iommu: the IOMMU memory region to inject the faults in
+     * @count: number of faults to inject
+     * @buf: fault buffer
+     */
+    int (*inject_faults)(IOMMUMemoryRegion *iommu, int count,
+                         struct iommu_fault *buf);
 };
 
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1496,6 +1511,15 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
 int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
                                            uint64_t page_size_mask,
                                            Error **errp);
+/**
+ * memory_region_inject_faults : inject @count faults stored in @buf
+ *
+ * @iommu_mr: the IOMMU memory region
+ * @count: number of faults to be injected
+ * @buf: buffer containing the faults
+ */
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf);
 
 /**
  * memory_region_name: get a memory region's name
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccde..c3f2c562f7 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2029,6 +2029,16 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
 
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
+    if (!imrc->inject_faults) {
+        return -ENOENT;
+    }
+    return imrc->inject_faults(iommu_mr, count, buf);
+}
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask = 1 << client;
-- 
2.26.2

