Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213669ejb;
        Sat, 1 Apr 2023 03:51:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350a0H9xFbbVD6ZisPoJOE5+XDWQntwAtnTtA12pgkBFpUaTb86ndt87OTxxYgK8zc7RkkTfV
X-Received: by 2002:a05:6214:dcc:b0:5df:4d3e:b8e0 with SMTP id 12-20020a0562140dcc00b005df4d3eb8e0mr25480299qvt.4.1680346306102;
        Sat, 01 Apr 2023 03:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346306; cv=none;
        d=google.com; s=arc-20160816;
        b=hRS0qBq9F7RWnjoDVCYuABdIlYbePoJlbLFoDF74WvLLDnj5T7ULH3ukGs6egG4QiK
         EU3CEp5V9yntfnh35WMrBgaQrx8mhp0qD2DrQv47BDyTIb/36XNkM5waZ7TphftEmyWd
         g2vUT47UpuTEDNG8nnNOOctRgdefPXMBoVhH5guZbE7nXNB2HBuaoSPDHKeIUEIUpZ70
         CV+z0UqIJUe6hGQqoZiDcK5JlRWvP6DKZ5mCeWu2b6/4IchfTM0dHh1KQ9yuQ6EsVEqj
         ltVUxSBx3eW2sH5DUTgNjPh/tcb0g8R94BMXVDJ+uF8TaZIB+9/EoqJw0W5uuIae/xWe
         LwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=zVDAZMhAgBT9TXpgUYUZSHvHWpJ2ghy01UMwDbx0Zp8=;
        b=GkDMb4NYLLyGZYZOE2lVKm2Gutdck4Cd5hDfYRJ2sbi6HKfMhzr03IMyF5+2UjLaoZ
         3LLExPrg2ZfeU+TwFZnWo8AUYu1EO85uV2X0RrseSjOirxpQ/9jCFq3zk9178Uf+ME3E
         kKX1Z8rKKT7aEeAizhRbvnnMEF4afMAfnK7SwmAYSaVQNHU8mdr1T45W9122opPhFtLT
         ena1M3gfVG30lerITXiOFOTaoRpkETRcaX7i9bMadnnEBMbhOEqrIxPLxUaHb+B9HcXZ
         bsIezEJUwRmMnDQWX4DKbCBgTFZ7Ln7zvtld87P7AbXgMJ7t6cNYNCeEj95LnPVddvWA
         TAXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=qACRRSc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a056214202900b005aadd326f60si2801070qvf.516.2023.04.01.03.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=qACRRSc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piYoW-0000qI-HC; Sat, 01 Apr 2023 06:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZAwoZAgKCEUztvz0hmhnvvnsl.jvtxlt1-hytuvunu1.vyn@flex--smostafa.bounces.google.com>)
 id 1piYoM-0000nq-V0
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:19 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZAwoZAgKCEUztvz0hmhnvvnsl.jvtxlt1-hytuvunu1.vyn@flex--smostafa.bounces.google.com>)
 id 1piYoJ-0003Dz-PG
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:18 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 e5-20020a05600c4e4500b003edc5824521so13360421wmq.0
 for <qemu-arm@nongnu.org>; Sat, 01 Apr 2023 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346213;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zVDAZMhAgBT9TXpgUYUZSHvHWpJ2ghy01UMwDbx0Zp8=;
 b=qACRRSc+bTXy6DCbCGhfyhu9g/Jtppikoscy7CKXf3zI52+yC+DllsguKZ2OkAyaXj
 zBEEFMz8Rl7GKMte0N6KmpjmGi2HCYrHtsMJHUCAFvGUnSLxoWXF3Kb4A2rKztgzjRUz
 FpjuJ6GKhqWNBNAMYgisejkfYNhkKF4ipvXZQ40y3DA4jtxQ5sS/wzdQpx4PhaGLCY+l
 4OZXsg2a0brem9ThOQ9yrc853h6zA/oSlExh094yWJIWPdn9+DANLc8qCLRHHQWxnyiL
 /U7Q5vKpuwKCFkgw4Fvlt1PDIf7w+6OfI0fFFSQG0hpDuFJFVJfowKUq3aqRDfLQKxGo
 JG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346213;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVDAZMhAgBT9TXpgUYUZSHvHWpJ2ghy01UMwDbx0Zp8=;
 b=UPkUeL9+oDjd1yTaYA80kB8PWyKIa05ChQpR9zplm4pc/DhQE9eWZ1bjTrPJW+4CxV
 x9qya357jxvfhkaOkYYX7AZmNYdJNvEMBh2hGJTy34n6ZptndJBRujn1q5LNvPlRDIJt
 UR+HDKhddRsf5DfWF7Vc3sWQ0d+vS9bcwBaVGJ21bAenJYQsIPIGnUvlnv+X1dflivuk
 COOZrGIasVNzoJI+/iFJuw2wmzeoNmP5+XYysGRpyIxYha6CijK47UnqvkrMDayKi9dO
 fE6xKeC87i07VChU/W1rVBTHZkbu1KxgLM1O6pJv9vTP6a6AJ8cp5CK3XlR3igkXDIXT
 zySQ==
X-Gm-Message-State: AAQBX9ebUXLFEiiQBTx0q6jfUI80ojguY4WXaZUOufwHS2vU35ZoWzk7
 Wvul5Xw3657X5iOiARrrqk+9OMrgabtJIQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:69d1:0:b0:2e4:cc35:dbb5 with SMTP id
 s17-20020a5d69d1000000b002e4cc35dbb5mr1915191wrw.0.1680346212776; Sat, 01 Apr
 2023 03:50:12 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:50 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-8-smostafa@google.com>
Subject: [RFC PATCH v3 07/10] hw/arm/smmuv3: Add VMID to TLB tagging
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3ZAwoZAgKCEUztvz0hmhnvvnsl.jvtxlt1-hytuvunu1.vyn@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S3302G2Lmljx

Allow TLB to be tagged with VMID.

If stage-1 is only supported, VMID is set to -1 and ignored from STE
and CMD_TLBI_NH* cmds.

Update smmu_iotlb_insert trace event to have vmid.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v3:
- Collected Reviewed-by tag.
Changes in v2:
-Fix TLB aliasing issue from missing check in smmu_iotlb_key_equal.
-Add vmid to traces smmu_iotlb_insert and smmu_iotlb_lookup_hit/miss.
-Add vmid to hash function.
---
 hw/arm/smmu-common.c         | 36 ++++++++++++++++++++++--------------
 hw/arm/smmu-internal.h       |  2 ++
 hw/arm/smmuv3.c              | 12 +++++++++---
 hw/arm/trace-events          |  6 +++---
 include/hw/arm/smmu-common.h |  5 +++--
 5 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index a4ebd004c5..72ed6edd48 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -38,7 +38,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
 
     /* Jenkins hash */
     a = b = c = JHASH_INITVAL + sizeof(*key);
-    a += key->asid + key->level + key->tg;
+    a += key->asid + key->vmid + key->level + key->tg;
     b += extract64(key->iova, 0, 32);
     c += extract64(key->iova, 32, 32);
 
@@ -53,13 +53,15 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
     SMMUIOTLBKey *k1 = (SMMUIOTLBKey *)v1, *k2 = (SMMUIOTLBKey *)v2;
 
     return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
-           (k1->level == k2->level) && (k1->tg == k2->tg);
+           (k1->level == k2->level) && (k1->tg == k2->tg) &&
+           (k1->vmid == k2->vmid);
 }
 
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level)
 {
-    SMMUIOTLBKey key = {.asid = asid, .iova = iova, .tg = tg, .level = level};
+    SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
+                        .tg = tg, .level = level};
 
     return key;
 }
@@ -78,7 +80,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         uint64_t mask = subpage_size - 1;
         SMMUIOTLBKey key;
 
-        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
+        key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
+                                 iova & ~mask, tg, level);
         entry = g_hash_table_lookup(bs->iotlb, &key);
         if (entry) {
             break;
@@ -88,13 +91,13 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
 
     if (entry) {
         cfg->iotlb_hits++;
-        trace_smmu_iotlb_lookup_hit(cfg->asid, iova,
+        trace_smmu_iotlb_lookup_hit(cfg->asid, cfg->s2cfg.vmid, iova,
                                     cfg->iotlb_hits, cfg->iotlb_misses,
                                     100 * cfg->iotlb_hits /
                                     (cfg->iotlb_hits + cfg->iotlb_misses));
     } else {
         cfg->iotlb_misses++;
-        trace_smmu_iotlb_lookup_miss(cfg->asid, iova,
+        trace_smmu_iotlb_lookup_miss(cfg->asid, cfg->s2cfg.vmid, iova,
                                      cfg->iotlb_hits, cfg->iotlb_misses,
                                      100 * cfg->iotlb_hits /
                                      (cfg->iotlb_hits + cfg->iotlb_misses));
@@ -111,8 +114,10 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
         smmu_iotlb_inv_all(bs);
     }
 
-    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
-    trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
+    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
+                              tg, new->level);
+    trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
+                            tg, new->level);
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
@@ -130,8 +135,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
 
     return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
-
-static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
+static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
                                               gpointer user_data)
 {
     SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
@@ -142,18 +146,21 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
     if (info->asid >= 0 && info->asid != SMMU_IOTLB_ASID(iotlb_key)) {
         return false;
     }
+    if (info->vmid >= 0 && info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
+        return false;
+    }
     return ((info->iova & ~entry->addr_mask) == entry->iova) ||
            ((entry->iova & ~info->mask) == info->iova);
 }
 
-void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
+void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
     /* if tg is not set we use 4KB range invalidation */
     uint8_t granule = tg ? tg * 2 + 10 : 12;
 
     if (ttl && (num_pages == 1) && (asid >= 0)) {
-        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
+        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl);
 
         if (g_hash_table_remove(s->iotlb, &key)) {
             return;
@@ -166,10 +173,11 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
 
     SMMUIOTLBPageInvInfo info = {
         .asid = asid, .iova = iova,
+        .vmid = vmid,
         .mask = (num_pages * 1 << granule) - 1};
 
     g_hash_table_foreach_remove(s->iotlb,
-                                smmu_hash_remove_by_asid_iova,
+                                smmu_hash_remove_by_asid_vmid_iova,
                                 &info);
 }
 
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index a9454f914e..843bebb185 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -132,9 +132,11 @@ static inline int pgd_concat_idx(int start_level, int granule_sz,
 }
 
 #define SMMU_IOTLB_ASID(key) ((key).asid)
+#define SMMU_IOTLB_VMID(key) ((key).vmid)
 
 typedef struct SMMUIOTLBPageInvInfo {
     int asid;
+    int vmid;
     uint64_t iova;
     uint64_t mask;
 } SMMUIOTLBPageInvInfo;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a1f4a4f902..d7e7003da9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1073,7 +1073,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
-    uint16_t vmid = CMD_VMID(cmd);
+    int vmid = -1;
     uint8_t scale = CMD_SCALE(cmd);
     uint8_t num = CMD_NUM(cmd);
     uint8_t ttl = CMD_TTL(cmd);
@@ -1082,6 +1082,12 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     uint64_t num_pages;
     uint8_t granule;
     int asid = -1;
+    SMMUv3State *smmuv3 = ARM_SMMUV3(s);
+
+    /* Only consider VMID if stage-2 is supported. */
+    if (STAGE2_SUPPORTED(smmuv3)) {
+        vmid = CMD_VMID(cmd);
+    }
 
     if (type == SMMU_CMD_TLBI_NH_VA) {
         asid = CMD_ASID(cmd);
@@ -1090,7 +1096,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     if (!tg) {
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
 
@@ -1108,7 +1114,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
     }
 }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 205ac04573..705104e58b 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -14,9 +14,9 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
-smmu_iotlb_lookup_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_lookup_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_insert(uint16_t asid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d addr=0x%"PRIx64" tg=%d level=%d"
+smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
 
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 4f1405d4e4..3cbb4998ad 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -125,6 +125,7 @@ typedef struct SMMUPciBus {
 typedef struct SMMUIOTLBKey {
     uint64_t iova;
     uint16_t asid;
+    uint16_t vmid;
     uint8_t tg;
     uint8_t level;
 } SMMUIOTLBKey;
@@ -188,11 +189,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
                                 SMMUTransTableInfo *tt, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
-void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
+void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
-- 
2.40.0.348.gf938b09366-goog

