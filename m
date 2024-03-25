Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597513ejj;
        Mon, 25 Mar 2024 03:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0BweAQVcnaHL6nsBmph4dLc8K8iSRdde0vLiGLVi3VcIINRGXqjwEYFkZOEsoC6aoIZo6rpCc/Rcy0KyIoDxBZ6U0QxT4
X-Received: by 2002:a5d:5051:0:b0:340:5b4:ba31 with SMTP id h17-20020a5d5051000000b0034005b4ba31mr5415614wrt.34.1711361711235;
        Mon, 25 Mar 2024 03:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361711; cv=none;
        d=google.com; s=arc-20160816;
        b=MWw+2Y47wst+yyYx/Jve4FAcHRMBaMqA+C1cDabkLaiBWaBJhJuV+t9M4Yaq+wwwi9
         6EAGBFRf5RWS2d/7OHQGgexIU/mn57khXbjXwM4A6OlKzxm6cXIRZUL1tD8oo8VfnDyR
         PAz7BgPONLOHlK3ua6f+I9A8US8HaRls651AtKv77jfouMNhbTlaCbcZpVOphlPuIm3U
         Gs3P36u38FRQSz50jHNpm/UU6ooiTxbvgjFmfQOr0iEeKKJcBlr6na4ThJlANSIAYF9K
         XvIbLdXj8hrw3gJt23gFuuKz8i/jXg6+MX9JtxzN1dYjhCeTuXuwHqrmQfR8Y3RNI1YM
         REHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=0zs62To/zJ9W1gm3g27mxbClG/j+VvNKtNLClUaybGo=;
        fh=szhqlviaYqDP3XOOAs0kxrlDn91sn7pKYS91I4SyvWM=;
        b=XJZ8M4rujlFIGzEw1ytVmGDbb+c/HvAylVK3ZtPkXrVyqsoCzUkYPnWLh5SqLD1tIh
         +B+7phIJIZkyJfJHJI2EAsARhl8mkHQ3E+I3vWx0UbJonF9e8j1YOfrxwIcgcwp13uwY
         dQ0h0G3ebCc55CnNf/VuqzM8sTLpIGK37ggOb+xXmNk5ePsRd96hpBX110WklW5bMm1Y
         HVQnBuQq79EIqNzk97WTqMyssVHsvPLd/TfTojhIdMI8Yb0cfDEN2UMMvalbJtiElwmD
         lEJ6UOiGwGXj5grSEHlQY3FO8WKvJqO3soofr7DpF2Mayy5ZjWbCZ9WHUG5FxeTcfi+j
         EgeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JhNb4ep1;
       spf=pass (google.com: domain of 3rk4bzggkc4c3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3rk4BZggKC4c3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3rk4BZggKC4c3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id b4-20020a05600c150400b004140434718asor1047545wmg.2.2024.03.25.03.15.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3rk4bzggkc4c3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JhNb4ep1;
       spf=pass (google.com: domain of 3rk4bzggkc4c3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3rk4BZggKC4c3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361711; x=1711966511; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zs62To/zJ9W1gm3g27mxbClG/j+VvNKtNLClUaybGo=;
        b=JhNb4ep1ZDZ0sHq+CSER7mNw7ecxYhxY9emGDATjjGzdE1Y42UuoxgCKbOlqOt4mzm
         ZCW/fCDGpYW5fuftddkYuFO/hq6M3jVcmVqWeovDSXqSFVqGor2/VXTHFiZMOB3IV3+h
         SMzsT5btc9LSHU+EK3qJRd8IaCbK/o06KJqN3ohSs+goejs0PY6R+UTcG/kRUNDg/be1
         ssvQ8sE4wkHc6bah6iZY/nE+kWR8TVtfwzQsy8C1AhT9L75jHcyPFncsshTxffb6cIQT
         gVgafNKg9eB3bKbUdua8/ShTInTEQhf1m1CMhe05ERtUeR/I5zzBKy+rzP9whVfw/tqw
         62gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361711; x=1711966511;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zs62To/zJ9W1gm3g27mxbClG/j+VvNKtNLClUaybGo=;
        b=afx8rORZH+YXTz+iT3z1p/ToK3UKuZ3jbO1Y3OctMIqV/QIUjxU+pV+iHh2q7KK4RY
         AQvHQSHT4VL8quB0j0CHGscte/LdDU7hy4TKJK2BJYI9PrvFmZGSzY2XL0fQLcRzx/1c
         1vuP2R0Gyl0ZGgXbASxn5fqmpmOFxD0I3POVyT8k2LY/5WegC+XKWbIA7A1+kYKUVgNo
         JmmWGT839LVaf69V2pef3392BC0rKm70RKHImzozDEW1+vn8VDS6YLK0S5cImse4Qvql
         Cz7URfQtDidHhvSgvLvkgnvcz00KX5rrnsdBI5Rp1bvF7EJ2Lw2FMpsvS1c21zrBLaZu
         z9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJqm5nAMbGkIDgmpeSTSSjEfkwT9aB0uav8GIkEkEvNrt+waEiWLrdgs0QqPiP1vI/Y8bWb1lvBMYbS1iKfIGMCEoHNN0s
X-Gm-Message-State: AOJu0Yz4QezizynXsR+wxHyLh4477z4dkGyCwt7RGwYBq8x8dNRaD0+G
	C5BXUh0luLRmMWGjTfxtDTb5kGblUbhqDse+GB4Q8r595L1pdvrzmZHGeHvYj2/3IhWDti9Myll
	PBp36LPaOag==
X-Google-Smtp-Source: AGHT+IETeQArB2ujPLdn1ThPuCEai0FayXQZcRHfRnbXYtcbtk9yVNCMGU65XiYRHxNzju4oO1oSGeWj83gx9Q==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:4572:0:b0:33d:356f:fb82 with SMTP id
 a18-20020a5d4572000000b0033d356ffb82mr21524wrc.11.1711361710691; Mon, 25 Mar
 2024 03:15:10 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:13:59 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-4-smostafa@google.com>
Subject: [RFC PATCH 03/12] hw/arm/smmu: Add stage to TLB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: N3vOqWnU+Jkf

TLBs for nesting will be extended to be combined, a new index is added
"stage", with 2 valid values:
 - SMMU_STAGE_1: Meaning this translates VA to PADDR, this entry can
   be cached from fully nested configuration or from stage-1 only.
   We don't support separate cached entries (VA to IPA)

 - SMMU_STAGE_2: Meaning this translates IPA to PADDR, cached from
   stage-2 only configuration.

For TLB invalidation:
 - by VA: Invalidate TLBs tagged with SMMU_STAGE_1
 - by IPA: Invalidate TLBs tagged with SMMU_STAGE_2
 - All: Will invalidate both, this is communicated to the TLB as
   SMMU_NESTED which is (SMMU_STAGE_1 | SMMU_STAGE_2) which uses
   it as a mask.

This briefly described in the user manual (ARM IHI 0070 F.b) in
"16.2.1 Caching combined structures".

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 27 +++++++++++++++++----------
 hw/arm/smmu-internal.h       |  2 ++
 hw/arm/smmuv3.c              |  5 +++--
 hw/arm/trace-events          |  3 ++-
 include/hw/arm/smmu-common.h |  8 ++++++--
 5 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 20630eb670..677dcf9a13 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -38,7 +38,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
 
     /* Jenkins hash */
     a = b = c = JHASH_INITVAL + sizeof(*key);
-    a += key->asid + key->vmid + key->level + key->tg;
+    a += key->asid + key->vmid + key->level + key->tg + key->stage;
     b += extract64(key->iova, 0, 32);
     c += extract64(key->iova, 32, 32);
 
@@ -54,14 +54,14 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
 
     return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
            (k1->level == k2->level) && (k1->tg == k2->tg) &&
-           (k1->vmid == k2->vmid);
+           (k1->vmid == k2->vmid) && (k1->stage == k2->stage);
 }
 
 SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
-                                uint8_t tg, uint8_t level)
+                                uint8_t tg, uint8_t level, SMMUStage stage)
 {
     SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
-                        .tg = tg, .level = level};
+                        .tg = tg, .level = level, .stage = stage};
 
     return key;
 }
@@ -81,7 +81,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         SMMUIOTLBKey key;
 
         key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
-                                 iova & ~mask, tg, level);
+                                 iova & ~mask, tg, level,
+                                 SMMU_STAGE_TO_TLB_TAG(cfg->stage));
         entry = g_hash_table_lookup(bs->iotlb, &key);
         if (entry) {
             break;
@@ -109,15 +110,16 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
 {
     SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
     uint8_t tg = (new->granule - 10) / 2;
+    SMMUStage stage_tag = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
 
     if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
         smmu_iotlb_inv_all(bs);
     }
 
     *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
-                              tg, new->level);
+                              tg, new->level, stage_tag);
     trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
-                            tg, new->level);
+                            tg, new->level, stage_tag);
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
@@ -159,18 +161,22 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
     if (info->vmid >= 0 && info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
         return false;
     }
+    if (!(info->stage & SMMU_IOTLB_STAGE(iotlb_key))) {
+        return false;
+    }
     return ((info->iova & ~entry->addr_mask) == entry->iova) ||
            ((entry->iova & ~info->mask) == info->iova);
 }
 
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
-                         uint8_t tg, uint64_t num_pages, uint8_t ttl)
+                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
+                         SMMUStage stage)
 {
     /* if tg is not set we use 4KB range invalidation */
     uint8_t granule = tg ? tg * 2 + 10 : 12;
 
     if (ttl && (num_pages == 1) && (asid >= 0)) {
-        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl);
+        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl, stage);
 
         if (g_hash_table_remove(s->iotlb, &key)) {
             return;
@@ -184,6 +190,7 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
     SMMUIOTLBPageInvInfo info = {
         .asid = asid, .iova = iova,
         .vmid = vmid,
+        .stage = stage,
         .mask = (num_pages * 1 << granule) - 1};
 
     g_hash_table_foreach_remove(s->iotlb,
@@ -597,7 +604,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             info->type = SMMU_PTW_ERR_PERMISSION;
-            info->stage = cfg->stage;
+            info->stage = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
             return NULL;
         }
         return cached_entry;
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 843bebb185..6caa0ddf21 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -133,12 +133,14 @@ static inline int pgd_concat_idx(int start_level, int granule_sz,
 
 #define SMMU_IOTLB_ASID(key) ((key).asid)
 #define SMMU_IOTLB_VMID(key) ((key).vmid)
+#define SMMU_IOTLB_STAGE(key) ((key).stage)
 
 typedef struct SMMUIOTLBPageInvInfo {
     int asid;
     int vmid;
     uint64_t iova;
     uint64_t mask;
+    SMMUStage stage;
 } SMMUIOTLBPageInvInfo;
 
 typedef struct SMMUSIDRange {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f081ff0cc4..b27bf297e1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1087,7 +1087,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, SMMU_NESTED);
         return;
     }
 
@@ -1105,7 +1105,8 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg,
+                            num_pages, ttl, SMMU_NESTED);
         addr += mask + 1;
     }
 }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index cc12924a84..3000c3bf14 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -14,10 +14,11 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
 smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
+smmu_iotlb_inv_stage(int stage) "Stage invalidate stage=%d"
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
 smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
+smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level, int stage) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d stage=%d"
 
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 876e78975c..695d6d10ad 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -37,6 +37,8 @@
 #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
                                              VMSA_BIT_LVL(isz, strd, lvl)) - 1)
 
+#define SMMU_STAGE_TO_TLB_TAG(stage)        (((stage) == SMMU_NESTED) ? \
+                                             SMMU_STAGE_1 : (stage))
 /*
  * Page table walk error types
  */
@@ -136,6 +138,7 @@ typedef struct SMMUIOTLBKey {
     uint16_t vmid;
     uint8_t tg;
     uint8_t level;
+    SMMUStage stage;
 } SMMUIOTLBKey;
 
 struct SMMUState {
@@ -203,12 +206,13 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
                                 SMMUTransTableInfo *tt, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
 SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
-                                uint8_t tg, uint8_t level);
+                                uint8_t tg, uint8_t level, SMMUStage stage);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
 void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
-                         uint8_t tg, uint64_t num_pages, uint8_t ttl);
+                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
+                         SMMUStage stage);
 
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
-- 
2.44.0.396.g6e790dbe36-goog
