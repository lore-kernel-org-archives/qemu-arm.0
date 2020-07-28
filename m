Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp680038lfy;
        Tue, 28 Jul 2020 08:10:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxarrrp7A5xokLPREFDfLLaRHRiIQovKb0DIim0NHsYXknyYFY2ce31j3kH2Cl0qjhGLbcC
X-Received: by 2002:a25:3:: with SMTP id 3mr13620813yba.193.1595949043996;
        Tue, 28 Jul 2020 08:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595949043; cv=none;
        d=google.com; s=arc-20160816;
        b=nj5WXgwMCENILgqEKdrJeSxl/iUFl5Ti2vWYEToaABqcvSkSAQgAJW+SCTkHIzMXs3
         RJBjPbC4tKq81V26nYxkLc+mCBhafl+qFXw+LSryhkdlY25eRYhTpKDNQ4xxUUodsXu2
         hnI/QD15lMiQmzvwaH6+8TtbEFVh0/Sb14zr+nl1U5DBIK+yWbAQbmu2mBV2YDttmRO3
         yYbUwb9nS9aInGu814kOIk31nPzmiCssYpDnMk0XiIrIVGhNVMAFPMPgM/eM1gRVG2hm
         dongvfSzE6puRI1Br4DczmqZSCJ33eg2Z9bRNOgOZUnvj/CqiuWlZzNhU4m8tDs7MJiX
         l8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CoJx7zHW47wSTdDjw41njAUitgfj9BGECJJQWkAXqV0=;
        b=APVNUe7uD9L1UsPQAJBDDdqt27GWnKwe601iXJUA+ptU1DzwMefiWP57hAhK4gP0WL
         0zFbhDLgyZ5xi58Xw4KA2MifQRDNoIEM4Z3pa5ndzIuTh3mEXY0yc/+S8oxqrsPuw6IX
         i0G9injdjc/rbsqB0m34OjvnM22p/Qx1Hos9Nad85SwFZJMfjyrB7kcdcp3jDqVZ5+tv
         R0l6OgvBMvNDTUe9KlJEasYeLRHalrDQT8BqRR2ziPFrpSad5rcestWf7j9PiS3kznPT
         lx2LaE8ey2HaXWDbVTz9txl4ItVsP1v57Banyu0iuqNWUfpbJQAlhzf4qLjpJ+9Wg4Fs
         Uinw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TJ6zhTiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si12401940ybq.420.2020.07.28.08.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:10:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TJ6zhTiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RFb-0008N4-8f
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0REM-00069G-FO
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:09:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52177
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0REJ-0007da-Oi
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595948962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoJx7zHW47wSTdDjw41njAUitgfj9BGECJJQWkAXqV0=;
 b=TJ6zhTizWUwbCKR9I0goLrzXxcCyfrKQh/qc5xzYAgTRronI2b2PSzXqFcbtRzJ1TFuNKN
 tmTx4k1zfEZhH8fhrB53TNKktj0jQ65nMVE8BTC3nSavi5xK4+u7RfzKMWVhqWQkTcTkM8
 3/H8jaTDRaN9ojDf2aJMZf3Lt2gf4xg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-uaUTxJO6O9qzXUsd5tFZ2g-1; Tue, 28 Jul 2020 11:09:19 -0400
X-MC-Unique: uaUTxJO6O9qzXUsd5tFZ2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4840E18C63C9;
 Tue, 28 Jul 2020 15:09:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0493F5C1BD;
 Tue, 28 Jul 2020 15:08:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 03/11] hw/arm/smmu: Introduce smmu_get_iotlb_key()
Date: Tue, 28 Jul 2020 17:08:07 +0200
Message-Id: <20200728150815.11446-4-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zLKU9PjDyMl+

Introduce the smmu_get_iotlb_key() helper and the
SMMU_IOTLB_ASID() macro. Also move smmu_get_iotlb_key and
smmu_iotlb_key_hash in the IOTLB related code section.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v1 -> v2:
- creation
---
 hw/arm/smmu-internal.h       |  1 +
 include/hw/arm/smmu-common.h |  1 +
 hw/arm/smmu-common.c         | 66 ++++++++++++++++++++----------------
 3 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 7794d6d394..3104f768cd 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -96,4 +96,5 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
             MAKE_64BIT_MASK(0, gsz - 3);
 }
 
+#define SMMU_IOTLB_ASID(key) ((key).asid)
 #endif
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 1dceec5cb1..5f9f3535d2 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -155,6 +155,7 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, IOMMUTLBEntry *entry);
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
 void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index f3aa581f80..7dc8541e8b 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -32,10 +32,42 @@
 
 /* IOTLB Management */
 
+static guint smmu_iotlb_key_hash(gconstpointer v)
+{
+    SMMUIOTLBKey *key = (SMMUIOTLBKey *)v;
+    uint32_t a, b, c;
+
+    /* Jenkins hash */
+    a = b = c = JHASH_INITVAL + sizeof(*key);
+    a += key->asid;
+    b += extract64(key->iova, 0, 32);
+    c += extract64(key->iova, 32, 32);
+
+    __jhash_mix(a, b, c);
+    __jhash_final(a, b, c);
+
+    return c;
+}
+
+static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
+{
+    const SMMUIOTLBKey *k1 = v1;
+    const SMMUIOTLBKey *k2 = v2;
+
+    return (k1->asid == k2->asid) && (k1->iova == k2->iova);
+}
+
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova)
+{
+    SMMUIOTLBKey key = {.asid = asid, .iova = iova};
+
+    return key;
+}
+
 IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
                                  hwaddr iova)
 {
-    SMMUIOTLBKey key = {.asid = cfg->asid, .iova = iova};
+    SMMUIOTLBKey key = smmu_get_iotlb_key(cfg->asid, iova);
     IOMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
 
     if (entry) {
@@ -62,8 +94,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, IOMMUTLBEntry *entry)
         smmu_iotlb_inv_all(bs);
     }
 
-    key->asid = cfg->asid;
-    key->iova = entry->iova;
+    *key = smmu_get_iotlb_key(cfg->asid, entry->iova);
     trace_smmu_iotlb_insert(cfg->asid, entry->iova);
     g_hash_table_insert(bs->iotlb, key, entry);
 }
@@ -80,12 +111,12 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
     uint16_t asid = *(uint16_t *)user_data;
     SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
 
-    return iotlb_key->asid == asid;
+    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
 
 inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
 {
-    SMMUIOTLBKey key = {.asid = asid, .iova = iova};
+    SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova);
 
     trace_smmu_iotlb_inv_iova(asid, iova);
     g_hash_table_remove(s->iotlb, &key);
@@ -383,31 +414,6 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
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
2.21.3

