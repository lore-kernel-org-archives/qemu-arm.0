Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1378795lfb;
        Thu, 21 May 2020 02:11:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsBFhbDTF8v5DDoknD3XGzPWzLLFs7SqWgJW1vuWOL75YcceTPTPpirWbPRRpVrGrICmYL
X-Received: by 2002:a37:6790:: with SMTP id b138mr9158923qkc.130.1590052315725;
        Thu, 21 May 2020 02:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590052315; cv=none;
        d=google.com; s=arc-20160816;
        b=uXNhx5TQCUW9Q6PllMldHBLVvC7TUVbINX0662AwU6FnnKnuRwgLqDGOhiHDyiiFIP
         BHx5VZQ9l/J8+ffpj8Z0yrykl+5RUKZ2jZKd7u3usyw0HvpEKGGFuVHqRvuEMyXDu+o9
         CatOcAIINh5qJHcDK8G6t94xtQbyLxiX8eJdHMziTenKOnPcHU/zYXXsdO/PcMJeEjAw
         7AFTg7XVe6uVBmoaoQYi2KusrM62jaAYUao70wQKtFd8hkVfAbrtBMpnLB7DGhqjmy+a
         CzXWHB2ssmlZeAA4A5yObs2x2qvGDjH9fU3T/ak2X9or3h2eqOVYX6JsRhANb5CtTld/
         6wBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xhpy5/KHWu7f7iBNn50umu1Z55N8FKEPXHzp1efxKzw=;
        b=lqOz68l7x+7NAO8L7hqi5/sGNRlCeeiyAz3sX08RrBlqzHGDYIFq8Pm/MjF+wfYN/6
         Fo5jaMwayCJ4ixiszfnl/PtNpbTvFBqx5mCJM2svegVCNt0NACLbo8u2qJQ0fciYo4s9
         r6nFZq3wbAyx14M7gDi8eK5UaRfD05HYQVj9Au/neXPpUz0l2aEFhqOdT1jIO3YnUsYd
         d1wLU72hfEnv+Bn2I/JotxfoivjLo1zCVCL43VSEB4i0bcYnJC3Amg6zpjpTM5dHcnt1
         d09XCnVVPzfzxZ5GNnNVLvfAspHLgxaHb0zAHP5xOgHD4KbWAI9ebfK0w5PULq3lFLG/
         3LVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QpOe7hYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si3292632qkm.156.2020.05.21.02.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 02:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QpOe7hYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbhF5-0004Zk-5b
	for alex.bennee@linaro.org; Thu, 21 May 2020 05:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhEx-0004X4-Aw
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:11:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32778
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhEv-0005Kv-T9
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590052304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xhpy5/KHWu7f7iBNn50umu1Z55N8FKEPXHzp1efxKzw=;
 b=QpOe7hYtdVQ8phZYlbIEKz4lEzFIZy/tfccJWzocNluPYyvC9dy61dFvbtj7P+7UP47kwJ
 6uT4huVXlfSJHjnE4+c4J5tGhCDh1dO4XgH+UoESU3oAXBjcC+le/LkYCh11lNRUoObRax
 qS34cwvl6kIgMt8S3CWJfK+p9fHfJlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-PCw5C86lNgSEPAipt1THbA-1; Thu, 21 May 2020 05:11:41 -0400
X-MC-Unique: PCw5C86lNgSEPAipt1THbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A52C6EC1AF;
 Thu, 21 May 2020 09:11:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E2A55D9C9;
 Thu, 21 May 2020 09:11:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH 3/9] hw/arm/smmu: Simplify the IOTLB key format
Date: Thu, 21 May 2020 11:10:53 +0200
Message-Id: <20200521091059.9453-4-eric.auger@redhat.com>
In-Reply-To: <20200521091059.9453-1-eric.auger@redhat.com>
References: <20200521091059.9453-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:47:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eim5gQoy9Pu/

Instead of using a Jenkins hash function to generate
the key let's just use a 64 bit unsigned integer that
contains the asid and the 40 upper bits of the iova.
A maximum of 52-bit IOVA is supported. This change in the
key format also prepares for the addition of new fields
in subsequent patches (granule and level).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-internal.h       |  4 +++
 include/hw/arm/smmu-common.h |  6 +---
 hw/arm/smmu-common.c         | 53 ++++++++++++++----------------------
 3 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 7794d6d394..2ecb6f1dc6 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -96,4 +96,8 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
             MAKE_64BIT_MASK(0, gsz - 3);
 }
 
+#define SMMU_IOTLB_ASID_SHIFT  40
+
+#define SMMU_IOTLB_ASID(key) (((key) >> SMMU_IOTLB_ASID_SHIFT) & 0xFFFF)
+#define SMMU_IOTLB_IOVA(key) (((key) & MAKE_64BIT_MASK(0, 40)) << 12)
 #endif
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 1dceec5cb1..7b9d2f0eb7 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -88,11 +88,6 @@ typedef struct SMMUPciBus {
     SMMUDevice   *pbdev[]; /* Parent array is sparse, so dynamically alloc */
 } SMMUPciBus;
 
-typedef struct SMMUIOTLBKey {
-    uint64_t iova;
-    uint16_t asid;
-} SMMUIOTLBKey;
-
 typedef struct SMMUState {
     /* <private> */
     SysBusDevice  dev;
@@ -155,6 +150,7 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, IOMMUTLBEntry *entry);
+uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
 void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 8409de052d..3101043540 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -32,10 +32,25 @@
 
 /* IOTLB Management */
 
+static guint smmu_iotlb_key_hash(gconstpointer v)
+{
+    return (guint)*(const uint64_t *)v;
+}
+
+static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
+{
+    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
+}
+
+uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova)
+{
+    return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT;
+}
+
 IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
                                  hwaddr iova)
 {
-    SMMUIOTLBKey key = {.asid = cfg->asid, .iova = iova};
+    uint64_t key = smmu_get_iotlb_key(cfg->asid, iova);
     IOMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
 
     if (entry) {
@@ -56,14 +71,13 @@ IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
 
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, IOMMUTLBEntry *entry)
 {
-    SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
+    uint64_t *key = g_new0(uint64_t, 1);
 
     if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
         smmu_iotlb_inv_all(bs);
     }
 
-    key->asid = cfg->asid;
-    key->iova = entry->iova;
+    *key = smmu_get_iotlb_key(cfg->asid, entry->iova);
     trace_smmu_iotlb_insert(cfg->asid, entry->iova);
     g_hash_table_insert(bs->iotlb, key, entry);
 }
@@ -78,14 +92,14 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
                                          gpointer user_data)
 {
     uint16_t asid = *(uint16_t *)user_data;
-    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
+    uint64_t *iotlb_key = (uint64_t *)key;
 
-    return iotlb_key->asid == asid;
+    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
 
 inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
 {
-    SMMUIOTLBKey key = {.asid = asid, .iova = iova};
+    uint64_t key = smmu_get_iotlb_key(asid, iova);
 
     trace_smmu_iotlb_inv_iova(asid, iova);
     g_hash_table_remove(s->iotlb, &key);
@@ -382,31 +396,6 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
     return NULL;
 }
 
-static guint smmu_iotlb_key_hash(gconstpointer v)
-{
-    SMMUIOTLBKey *key = (SMMUIOTLBKey *)v;
-    uint32_t a, b, c;
-
-    /* Jenkins hash */
-    a = b = c = JHASH_INITVAL + sizeof(*key);
-    a += key->asid;
-    b += extract64(key->iova, 0, 32);
-    c += extract64(key->iova, 32, 32);
-
-    __jhash_mix(a, b, c);
-    __jhash_final(a, b, c);
-
-    return c;
-}
-
-static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
-{
-    const SMMUIOTLBKey *k1 = v1;
-    const SMMUIOTLBKey *k2 = v2;
-
-    return (k1->asid == k2->asid) && (k1->iova == k2->iova);
-}
-
 /* Unmap the whole notifier's range */
 static void smmu_unmap_notifier_range(IOMMUNotifier *n)
 {
-- 
2.20.1

