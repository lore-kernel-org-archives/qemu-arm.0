Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1590866lfm;
        Thu, 2 Jul 2020 08:33:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzheUL1L6eVDNs/GxlX+/f/2kxt/h+1CFMiJUNEG8xVAcDxrgm8/2mjWv//p5C/4RpNntGY
X-Received: by 2002:ac8:44d6:: with SMTP id b22mr31635990qto.391.1593703984170;
        Thu, 02 Jul 2020 08:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593703984; cv=none;
        d=google.com; s=arc-20160816;
        b=AA5NI+8hyimuMB/IEy4v+il3dXHNJioP5Z5uQODQSDYi+msuqmwubWk205Qoe1v2H2
         WpY/8tKch2oo162cf95UOxuzrS5/UbKMA6StpKJWQ+KcZu3BFigdIC56npLDkoPe3+ij
         IyH9kvwMDf2yE9sqm8W56J0G9KLWHBfxh6pYHBmQ5SvwFyaM90bkiaDMx/I6T0v2we7r
         7rgaxtDEUCoK0wFUwjNMiu/VRxwEEtFxD0NeQSjZn3qWbgaRVHTUvGGAEj+ldxSIdFLS
         cy1FnDHDuByGP8tlSmWe/8Smh1ceq+GHXN+TgE06gEMRCgvtqaS9nWAzUm1SheVT5iDD
         ZWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S3NFNYSrX7syMo104tWcXIgZ34cLFK5JYwxiQJRSUHU=;
        b=GROIVA1bSx3R980HX331WmOLcTBD0A/Km4q+jA4/k1uh2amrtBh/+emsrB3w76zhIC
         +zMRAEcWfU4j4wBU0VKY+eKUbZZeH+8RPDfV7pEz16QqqSONSQ/goWJmu1GPkTfcWgYF
         uI7eXQ/cMZjep8vnKS7BPqNC2K9XHbxgYUP8SWfS8tQ2ouL1NbnSINEGHvtTGr10ikwP
         QHrUJek8bSr8orX4/v3JXgE9oAzzKmmkzQVsRFH85OmhGCufhJPgMUaOSQMEXa1D07j4
         GPyyKZ0sfCkZvEigQqJMRsdDfJY3HyCwy2d/3BoK1cNhanxtZFZcdQ1Hm8YCSKzeH1uD
         FP0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+lRJs8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m50si4591891qtk.218.2020.07.02.08.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 08:33:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+lRJs8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr1Cx-0001Id-Bh
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 11:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17o-0001EH-N2
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27213
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17m-0006OX-SX
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593703662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3NFNYSrX7syMo104tWcXIgZ34cLFK5JYwxiQJRSUHU=;
 b=b+lRJs8A7L0QFNZLab0v7olaqFPPNv0UWuEg6DfEU1GEKAfHQd7/E1xg2KdK+dg31j3mcz
 hep0ZmHMNKfQ+xBj0ApW5a8L/gUhRjIIESgk4UP/oePVuzXnN9ECvaMUjz1fLGI5RTqkKi
 +stRuw/hattmbtwKaj0ETC/YrJYi//I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-XpmiJm--NoWvDCE3vSfOoA-1; Thu, 02 Jul 2020 11:27:38 -0400
X-MC-Unique: XpmiJm--NoWvDCE3vSfOoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7C1C10059B4;
 Thu,  2 Jul 2020 15:27:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2070F5DD61;
 Thu,  2 Jul 2020 15:27:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH v2 3/9] hw/arm/smmu: Introduce smmu_get_iotlb_key()
Date: Thu,  2 Jul 2020 17:26:53 +0200
Message-Id: <20200702152659.8522-4-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-1-eric.auger@redhat.com>
References: <20200702152659.8522-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: b/HmOGUiG181

Introduce the smmu_get_iotlb_key() helper and the
SMMU_IOTLB_ASID() macro. Also move smmu_get_iotlb_key and
smmu_iotlb_key_hash in the IOTLB related code section.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

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

