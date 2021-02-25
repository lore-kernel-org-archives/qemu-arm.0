Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp241196lfg;
        Thu, 25 Feb 2021 02:58:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/YPAeitIW881PmBgBTdQdTbQN4ftXfEr0zMWqQnyW27Z+f9uat0zXkLv4dZiBK06Jhx3A
X-Received: by 2002:a5b:751:: with SMTP id s17mr3157697ybq.111.1614250701200;
        Thu, 25 Feb 2021 02:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614250701; cv=none;
        d=google.com; s=arc-20160816;
        b=YMc5+hmUT4DuvAmLdQQvjrNCT7NgBv03ReBlxFMk8s1fyTZ45hnu5ADOVydqc+tQPo
         jKP2nBoSoay95fhsZ3MIg9W7vulaod2cVnq/Xvc5IVLhq1D8sNMOibCLLer8StKH503H
         m65tT79S2WqyWrjxiSGe2Av8z3v082jk0juLr/jBoW0zI11oiaf9V4+B7XobICsxSz9Q
         zKYpFkfG5kzmWM2AB95CsWe0SkhkSau83YSImjBYQfNwWkQXKQsb/FNgsAx34W6eFrx+
         rS6o/lBPAKMgQowNW2PkDzZ1OykERlk9/ncPS9lSZp3tYOPxoV7JSc6+s5aEmSRQw1px
         TLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d41k2UyBqzMOxmJRmBDLkgBIN5G4Kt/2cKnwetT3u2c=;
        b=QzHkJ7hnNmXXNsjOvO8Y1nX+CNUOOzeakmcHO3ZbEaLHDfyw9WdMZj7cVxpJ52BSdh
         GxcLiXZBN8octuLILTVinhKtfhlgPL6t9l+iuzLmbsFNXClsgJvHZaDF6ujz44iEYSq1
         DJ3f/+4J54vsKCmG5G2vd7++dX3STwM6pdgqZO4UTBkFAOZHjnIE9A7tEXC22hHVHJHR
         jeL9neLs+zviFRcAXcDqp2jo4GjmhGv84menkeTtEKeDTQ/C5F7fKS2vTUYSwvv/jiNB
         CH/w4Qkz7nLCSQFX6UwVFoWhM09KCL4K1/pIsSwuN6SSLcXj5KJJQBUSI5PZLmDY5Ftc
         VyiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZKb7WpdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l62si5116622ybc.87.2021.02.25.02.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 02:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZKb7WpdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFELc-0004Nt-ER
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 05:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEHL-00063P-1L
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEHJ-00055b-1p
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d41k2UyBqzMOxmJRmBDLkgBIN5G4Kt/2cKnwetT3u2c=;
 b=ZKb7WpdEMOKFc7lT97CGw0YJYYsZx8EO7K4ABIKtrjgprs4Iuhw5EatczKkGbp1W7ca+uM
 fjK0KEss5Ujlj4/bjasm1D9xgSCZe+Hc7tcyFgazjRPV/qyqWQtSNeBhtGEvbLEDsOY/Kh
 pymlIya7Nnp5zkIqLbJm1mOjOf8NR58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-saJhS8_BNfuiENgyhPgDbA-1; Thu, 25 Feb 2021 05:53:48 -0500
X-MC-Unique: saJhS8_BNfuiENgyhPgDbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F3CD107ACF8;
 Thu, 25 Feb 2021 10:53:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11C6C5D9D7;
 Thu, 25 Feb 2021 10:53:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 04/28] memory: Add new fields in IOTLBEntry
Date: Thu, 25 Feb 2021 11:52:09 +0100
Message-Id: <20210225105233.650545-5-eric.auger@redhat.com>
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hkpNhfSDbnip

The current IOTLBEntry becomes too simple to interact with
some physical IOMMUs. IOTLBs can be invalidated with different
granularities: domain, pasid, addr. Current IOTLB entry only offers
page selective invalidation. Let's add a granularity field
that conveys this information.

Also TLB entries are usually tagged with some ids such as the asid
or pasid. When propagating an invalidation command from the
guest to the host, we need to pass those IDs.

Also we add a leaf field which indicates, in case of invalidation
notification, whether only cache entries for the last level of
translation are required to be invalidated.

A flag field is introduced to inform whether those fields are set.

To enforce all existing users do not user those new fields,
initialize the IOMMUTLBEvents when needed.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- add pasid, granularity and flags
---
 hw/arm/smmu-common.c     |  2 +-
 hw/arm/smmuv3.c          |  2 +-
 hw/i386/intel_iommu.c    |  6 +++---
 hw/ppc/spapr_iommu.c     |  2 +-
 hw/virtio/virtio-iommu.c |  4 ++--
 include/exec/memory.h    | 36 +++++++++++++++++++++++++++++++++++-
 6 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 84d2c62c26..0ba3dca3b8 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -471,7 +471,7 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
 /* Unmap the whole notifier's range */
 static void smmu_unmap_notifier_range(IOMMUNotifier *n)
 {
-    IOMMUTLBEvent event;
+    IOMMUTLBEvent event = {};
 
     event.type = IOMMU_NOTIFIER_UNMAP;
     event.entry.target_as = &address_space_memory;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b87324ce2..d037d6df5b 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                uint8_t tg, uint64_t num_pages)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
-    IOMMUTLBEvent event;
+    IOMMUTLBEvent event = {};
     uint8_t granule;
 
     if (!tg) {
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6be8f32918..1c5b43f902 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1195,7 +1195,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
     uint32_t offset;
     uint64_t slpte;
     uint64_t subpage_size, subpage_mask;
-    IOMMUTLBEvent event;
+    IOMMUTLBEvent event = {};
     uint64_t iova = start;
     uint64_t iova_next;
     int ret = 0;
@@ -2427,7 +2427,7 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
                                           VTDInvDesc *inv_desc)
 {
     VTDAddressSpace *vtd_dev_as;
-    IOMMUTLBEvent event;
+    IOMMUTLBEvent event = {};
     struct VTDBus *vtd_bus;
     hwaddr addr;
     uint64_t sz;
@@ -3483,7 +3483,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
     size = remain = end - start + 1;
 
     while (remain >= VTD_PAGE_SIZE) {
-        IOMMUTLBEvent event;
+        IOMMUTLBEvent event = {};
         uint64_t mask = dma_aligned_pow2_mask(start, end, s->aw_bits);
         uint64_t size = mask + 1;
 
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index f2d460db5f..dda5ba52bf 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -450,7 +450,7 @@ static void spapr_tce_reset(DeviceState *dev)
 static target_ulong put_tce_emu(SpaprTceTable *tcet, target_ulong ioba,
                                 target_ulong tce)
 {
-    IOMMUTLBEvent event;
+    IOMMUTLBEvent event = {};
     hwaddr page_mask = IOMMU_PAGE_MASK(tcet->page_shift);
     unsigned long index = (ioba - tcet->bus_offset) >> tcet->page_shift;
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e18c..83ed2b82e6 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -129,7 +129,7 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                     hwaddr virt_end, hwaddr paddr,
                                     uint32_t flags)
 {
-    IOMMUTLBEvent event;
+    IOMMUTLBEvent event = {};
     IOMMUAccessFlags perm = IOMMU_ACCESS_FLAG(flags & VIRTIO_IOMMU_MAP_F_READ,
                                               flags & VIRTIO_IOMMU_MAP_F_WRITE);
 
@@ -154,7 +154,7 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
 static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                       hwaddr virt_end)
 {
-    IOMMUTLBEvent event;
+    IOMMUTLBEvent event = {};
     uint64_t delta = virt_end - virt_start;
 
     if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c6fb714e49..f2c9bd5fcc 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -75,14 +75,48 @@ typedef enum {
     IOMMU_RW   = 3,
 } IOMMUAccessFlags;
 
+/* Granularity of the cache invalidation */
+typedef enum {
+    IOMMU_INV_GRAN_ADDR = 0,
+    IOMMU_INV_GRAN_PASID,
+    IOMMU_INV_GRAN_DOMAIN,
+} IOMMUInvGranularity;
+
 #define IOMMU_ACCESS_FLAG(r, w) (((r) ? IOMMU_RO : 0) | ((w) ? IOMMU_WO : 0))
 
+/**
+ * IOMMUTLBEntry - IOMMU TLB entry
+ *
+ * Structure used when performing a translation or when notifying MAP or
+ * UNMAP (invalidation) events
+ *
+ * @target_as: target address space
+ * @iova: IO virtual address (input)
+ * @translated_addr: translated address (output)
+ * @addr_mask: address mask (0xfff means 4K binding), must be multiple of 2
+ * @perm: permission flag of the mapping (NONE encodes no mapping or
+ * invalidation notification)
+ * @granularity: granularity of the invalidation
+ * @flags: informs whether the following fields are set
+ * @arch_id: architecture specific ID tagging the TLB
+ * @pasid: PASID tagging the TLB
+ * @leaf: when @perm is NONE, indicates whether only caches for the last
+ * level of translation need to be invalidated.
+ */
 struct IOMMUTLBEntry {
     AddressSpace    *target_as;
     hwaddr           iova;
     hwaddr           translated_addr;
-    hwaddr           addr_mask;  /* 0xfff = 4k translation */
+    hwaddr           addr_mask;
     IOMMUAccessFlags perm;
+    IOMMUInvGranularity granularity;
+#define IOMMU_INV_FLAGS_PASID  (1 << 0)
+#define IOMMU_INV_FLAGS_ARCHID (1 << 1)
+#define IOMMU_INV_FLAGS_LEAF   (1 << 2)
+    uint32_t         flags;
+    uint32_t         arch_id;
+    uint32_t         pasid;
+    bool             leaf;
 };
 
 /*
-- 
2.26.2

