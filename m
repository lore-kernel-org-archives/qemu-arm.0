Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931704ejb;
        Sun, 28 Apr 2024 20:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlgDymCxGzvjvPAWXlx66tgCkzr6OJQCa+tMwmIv0F4y9SooOg9DUYfvRqPyFWMxJN26NfihrMPj3pzGTJ0AINUzcF66bp
X-Received: by 2002:a05:690c:7302:b0:61a:c4a3:8a5c with SMTP id jp2-20020a05690c730200b0061ac4a38a5cmr8711094ywb.44.1714361084656;
        Sun, 28 Apr 2024 20:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361084; cv=none;
        d=google.com; s=arc-20160816;
        b=TlH7Rie+rmFnqmNTXEG34nwM1bcB9PAHlwHC97xKwkoMaJt/N4nDXG6Q61+SD52ig7
         BFjfK7eXTeciQDyi0emsVjMusp/vVKzIOOJr9rkotdYig1ya1Z0WfIU4x8wdCL6x6UML
         gl31zqY1jY6OuuMnWA5Dbp1C4MdeUhbIC8Ep0vnAxOFXNx1e4SpaFdCUwGd6wwH0ah59
         q+VIGrWcP22S4sYCSfR/7tCk4PJHqmeamHDaFNW3tNpyLSf8dnIW33/ITypGbNWrFJqn
         eOQ2UuHlUkx2FVAY6u5dNM6CMt9qd9Ew4Ey8yOpCByp5jBPxcIchWGYlEhj8whJMSiez
         83rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=FOv8tQY3gqanJb3e4V3O9RXeyFozfTDlVqwKTPezREg=;
        fh=8MrIA/bgnVuObgH1UeRa/BWJUZauVVnq7yEJ9IUbyt4=;
        b=uqa6C348+p9k+6fmidgEyZF/AzzQZYZdTxsfAzlQDQ52h9dM8pdYfe3Oge2p7+uztI
         rmBYTjnzQnQO9zxkCRdutPMr7HKhZWNzHRaf/pEJcwZ3ezGNgEm1+lkRw5EjrJeA1OzK
         zSub043/zSHiDRB642kpUKJ1vlvFZU7WeMb8tcT6qWEPmLnIGTjvEj903BsL9CFQRRFb
         ADewHSWfiUQQ3Zor14jq50DzS4tsNYInRbgXpRUJoTAXaizEYXYXTxAqDjiUMmtsXgDz
         GzStf0eBavsynotpRuLuR2zFUI3MWJpYQFgAYAx7I1RMrhlkBvUCSq+uZZqdC3S5bRTg
         SIoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NEBzOsku;
       spf=pass (google.com: domain of 3_bivzggkcxcf9bfgx2x3bb381.zb9x81k.y1aa1185axeb.be3@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_BIvZggKCxcF9BFGx2x3BB381.zB9x81K.y1AA1185AxEB.BE3@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3_BIvZggKCxcF9BFGx2x3BB381.zB9x81K.y1AA1185AxEB.BE3@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id m188-20020a8171c5000000b006150d06f777sor19071695ywc.3.2024.04.28.20.24.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3_bivzggkcxcf9bfgx2x3bb381.zb9x81k.y1aa1185axeb.be3@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NEBzOsku;
       spf=pass (google.com: domain of 3_bivzggkcxcf9bfgx2x3bb381.zb9x81k.y1aa1185axeb.be3@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_BIvZggKCxcF9BFGx2x3BB381.zB9x81K.y1AA1185AxEB.BE3@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361084; x=1714965884; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOv8tQY3gqanJb3e4V3O9RXeyFozfTDlVqwKTPezREg=;
        b=NEBzOskuattxJ1a/pqnap2D8ytSVPdJrJRiowHuPSNWGo2FT2JVF4Y/ovubiY84Y5r
         QUQmPAS27oNHeqE2aWbF3PMT1R1DGu9H04XaEF5f74iR0PPJJ5TiXyWJF6Q4QYMqogQU
         S4Dm7sBrJuWvcS1+D4Fhy7cMdJyKzPdJQ0ygQvBPhmQpK79VUH/qoIH3fda1mflxAwh4
         2R1CbwCfoRozP57Sz9yu5xTwJvVhtDm9pAZOxPkenlucwhSlAKHu5TFiabgHyiA4s+hf
         rtRPAFeFxLFMOpAXegfVH1LMenvBBdKmeogq3RKKYy/0sDLd4owG8t3wB4YkBTx4JEo4
         r6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361084; x=1714965884;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOv8tQY3gqanJb3e4V3O9RXeyFozfTDlVqwKTPezREg=;
        b=UHFdK/vThJWtDThcEnBvLtkyUssIuPv6z4sr5JF32TJrtxDyehZYx/oMorJNyF9mQK
         6HjQlpGCDs0NDwBZhIcMl8noTirC0tlQNiuQYI4IzBp1mmSqNxejzn2UYT/0GPCJ69th
         l5wMksdOc4NWOoCJ/IEhhUs6zW1caNRHBjUj60XcahgxFOtw92U0xIANU4Ha3kgmo3I0
         cN5mzkAcCW5kOQOkPOybDUBQgYzBqhzrnWmJorqSviu0Dcp029302z859OLww0pPjK9k
         nTOpoA39Qh/atP2AyxqGB0IW0BSP4ZAObhIQ7paa/fX545xoQYc16TXcKmT2YY34wKPB
         lFvw==
X-Forwarded-Encrypted: i=1; AJvYcCVJJ8tqWa1jgAwHLIH3sYJFpAPHA15PG87b5q3YzeX3fS7rNp0pc5azLgLlbYZ8BnGXZEFr1VTgI4Sj5JlbyFbJT+KCSWye
X-Gm-Message-State: AOJu0YyTP6fdDGi4h91gV0FvC163n+kdtyJ74GQMbS5IM9cS8SQeih+1
	0U+p+xez4KOTILcUjUEa1Z99vIHyKVcyzxC69pyKLQG9M9iXguG1QGTz0tiYxjcnf6glykG5S81
	7r6HF3YWNPw==
X-Google-Smtp-Source: AGHT+IHmL7+nCrBdhWUrOjPLmXVKuGvmHnkmI8Fk5VfqZCkQAdYsXnjburTnc98yOA08S54I24xYNznZxWHNOg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a0d:ea56:0:b0:61a:c7c9:5392 with SMTP id
 t83-20020a0dea56000000b0061ac7c95392mr2624612ywe.2.1714361084209; Sun, 28 Apr
 2024 20:24:44 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:49 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-6-smostafa@google.com>
Subject: [RFC PATCH v3 05/18] hw/arm/smmu: Split smmuv3_translate()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 62XuzxQ/vRsN

smmuv3_translate() does everything from STE/CD parsing to TLB lookup
and PTW.

Soon, when nesting is supported, stage-1 data (tt, CD) needs to be
translated using stage-2.

Split smmuv3_translate() to 3 functions:

- smmu_translate(): in smmu-common.c, which does the TLB lookup, PTW,
  TLB insertion, all the functions are already there, this just puts
  them together.
  This also simplifies the code as it consolidates event generation
  in case of TLB lookup permission failure or in TT selection.

- smmuv3_do_translate(): in smmuv3.c, Calls smmu_translate() and does
  the event population in case of errors.

 - smmuv3_translate(), now calls smmuv3_do_translate() for
   translation while the rest is the same.

Also, add stage in trace_smmuv3_translate_success()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c         |  59 +++++++++++
 hw/arm/smmuv3.c              | 191 +++++++++++++----------------------
 hw/arm/trace-events          |   2 +-
 include/hw/arm/smmu-common.h |   8 ++
 4 files changed, 141 insertions(+), 119 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 8a5858f69f..d94db6b34f 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -566,6 +566,65 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
     g_assert_not_reached();
 }
 
+SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
+                             IOMMUAccessFlags flag, SMMUPTWEventInfo *info)
+{
+    uint64_t page_mask, aligned_addr;
+    SMMUTLBEntry *cached_entry = NULL;
+    SMMUTransTableInfo *tt;
+    int status;
+
+    /*
+     * Combined attributes used for TLB lookup, as only one stage is supported,
+     * it will hold attributes based on the enabled stage.
+     */
+    SMMUTransTableInfo tt_combined;
+
+    if (cfg->stage == SMMU_STAGE_1) {
+        /* Select stage1 translation table. */
+        tt = select_tt(cfg, addr);
+        if (!tt) {
+            info->type = SMMU_PTW_ERR_TRANSLATION;
+            info->stage = SMMU_STAGE_1;
+            return NULL;
+        }
+        tt_combined.granule_sz = tt->granule_sz;
+        tt_combined.tsz = tt->tsz;
+
+    } else {
+        /* Stage2. */
+        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
+        tt_combined.tsz = cfg->s2cfg.tsz;
+    }
+
+    /*
+     * TLB lookup looks for granule and input size for a translation stage,
+     * as only one stage is supported right now, choose the right values
+     * from the configuration.
+     */
+    page_mask = (1ULL << tt_combined.granule_sz) - 1;
+    aligned_addr = addr & ~page_mask;
+
+    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
+    if (cached_entry) {
+        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
+            info->type = SMMU_PTW_ERR_PERMISSION;
+            info->stage = cfg->stage;
+            return NULL;
+        }
+        return cached_entry;
+    }
+
+    cached_entry = g_new0(SMMUTLBEntry, 1);
+    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
+    if (status) {
+            g_free(cached_entry);
+            return NULL;
+    }
+    smmu_iotlb_insert(bs, cfg, cached_entry);
+    return cached_entry;
+}
+
 /**
  * The bus number is used for lookup when SID based invalidation occurs.
  * In that case we lazily populate the SMMUPciBus array from the bus hash
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index dab3ad2db9..f98c157221 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -827,6 +827,75 @@ static void smmuv3_flush_config(SMMUDevice *sdev)
     g_hash_table_remove(bc->configs, sdev);
 }
 
+/* Do translation with TLB lookup. */
+static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
+                                                 SMMUTransCfg *cfg,
+                                                 SMMUEventInfo *event,
+                                                 IOMMUAccessFlags flag,
+                                                 SMMUTLBEntry **out_entry)
+{
+    SMMUPTWEventInfo ptw_info = {};
+    SMMUState *bs = ARM_SMMU(s);
+    SMMUTLBEntry *cached_entry = NULL;
+
+    cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
+    if (!cached_entry) {
+        /* All faults from PTW has S2 field. */
+        event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
+        switch (ptw_info.type) {
+        case SMMU_PTW_ERR_WALK_EABT:
+            event->type = SMMU_EVT_F_WALK_EABT;
+            event->u.f_walk_eabt.addr = addr;
+            event->u.f_walk_eabt.rnw = flag & 0x1;
+            event->u.f_walk_eabt.class = SMMU_CLASS_TT;
+            event->u.f_walk_eabt.addr2 = ptw_info.addr;
+            break;
+        case SMMU_PTW_ERR_TRANSLATION:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_TRANSLATION;
+                event->u.f_translation.addr = addr;
+                event->u.f_translation.addr2 = ptw_info.addr;
+                event->u.f_translation.class = SMMU_CLASS_IN;
+                event->u.f_translation.rnw = flag & 0x1;
+            }
+            break;
+        case SMMU_PTW_ERR_ADDR_SIZE:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_ADDR_SIZE;
+                event->u.f_addr_size.addr = addr;
+                event->u.f_addr_size.addr2 = ptw_info.addr;
+                event->u.f_addr_size.class = SMMU_CLASS_IN;
+                event->u.f_addr_size.rnw = flag & 0x1;
+            }
+            break;
+        case SMMU_PTW_ERR_ACCESS:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_ACCESS;
+                event->u.f_access.addr = addr;
+                event->u.f_access.addr2 = ptw_info.addr;
+                event->u.f_access.class = SMMU_CLASS_IN;
+                event->u.f_access.rnw = flag & 0x1;
+            }
+            break;
+        case SMMU_PTW_ERR_PERMISSION:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_PERMISSION;
+                event->u.f_permission.addr = addr;
+                event->u.f_permission.addr2 = ptw_info.addr;
+                event->u.f_permission.class = SMMU_CLASS_IN;
+                event->u.f_permission.rnw = flag & 0x1;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        return SMMU_TRANS_ERROR;
+    }
+    *out_entry = cached_entry;
+    return SMMU_TRANS_SUCCESS;
+}
+
+/* Entry point to SMMU, does everything. */
 static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                       IOMMUAccessFlags flag, int iommu_idx)
 {
@@ -836,12 +905,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUEventInfo event = {.type = SMMU_EVT_NONE,
                            .sid = sid,
                            .inval_ste_allowed = false};
-    SMMUPTWEventInfo ptw_info = {};
     SMMUTranslationStatus status;
-    SMMUState *bs = ARM_SMMU(s);
-    uint64_t page_mask, aligned_addr;
-    SMMUTLBEntry *cached_entry = NULL;
-    SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg = NULL;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
@@ -850,11 +914,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .addr_mask = ~(hwaddr)0,
         .perm = IOMMU_NONE,
     };
-    /*
-     * Combined attributes used for TLB lookup, as only one stage is supported,
-     * it will hold attributes based on the enabled stage.
-     */
-    SMMUTransTableInfo tt_combined;
+    SMMUTLBEntry *cached_entry = NULL;
 
     qemu_mutex_lock(&s->mutex);
 
@@ -883,113 +943,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    if (cfg->stage == SMMU_STAGE_1) {
-        /* Select stage1 translation table. */
-        tt = select_tt(cfg, addr);
-        if (!tt) {
-            if (cfg->record_faults) {
-                event.type = SMMU_EVT_F_TRANSLATION;
-                event.u.f_translation.addr = addr;
-                event.u.f_translation.rnw = flag & 0x1;
-            }
-            status = SMMU_TRANS_ERROR;
-            goto epilogue;
-        }
-        tt_combined.granule_sz = tt->granule_sz;
-        tt_combined.tsz = tt->tsz;
-
-    } else {
-        /* Stage2. */
-        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
-        tt_combined.tsz = cfg->s2cfg.tsz;
-    }
-    /*
-     * TLB lookup looks for granule and input size for a translation stage,
-     * as only one stage is supported right now, choose the right values
-     * from the configuration.
-     */
-    page_mask = (1ULL << tt_combined.granule_sz) - 1;
-    aligned_addr = addr & ~page_mask;
-
-    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
-    if (cached_entry) {
-        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
-            status = SMMU_TRANS_ERROR;
-            /*
-             * We know that the TLB only contains either stage-1 or stage-2 as
-             * nesting is not supported. So it is sufficient to check the
-             * translation stage to know the TLB stage for now.
-             */
-            event.u.f_walk_eabt.s2 = (cfg->stage == SMMU_STAGE_2);
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_PERMISSION;
-                event.u.f_permission.addr = addr;
-                event.u.f_permission.rnw = flag & 0x1;
-            }
-        } else {
-            status = SMMU_TRANS_SUCCESS;
-        }
-        goto epilogue;
-    }
-
-    cached_entry = g_new0(SMMUTLBEntry, 1);
-
-    if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
-        /* All faults from PTW has S2 field. */
-        event.u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
-        g_free(cached_entry);
-        switch (ptw_info.type) {
-        case SMMU_PTW_ERR_WALK_EABT:
-            event.type = SMMU_EVT_F_WALK_EABT;
-            event.u.f_walk_eabt.addr = addr;
-            event.u.f_walk_eabt.rnw = flag & 0x1;
-            event.u.f_walk_eabt.class = SMMU_CLASS_TT;
-            event.u.f_walk_eabt.addr2 = ptw_info.addr;
-            break;
-        case SMMU_PTW_ERR_TRANSLATION:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_TRANSLATION;
-                event.u.f_translation.addr = addr;
-                event.u.f_translation.addr2 = ptw_info.addr;
-                event.u.f_translation.class = SMMU_CLASS_IN;
-                event.u.f_translation.rnw = flag & 0x1;
-            }
-            break;
-        case SMMU_PTW_ERR_ADDR_SIZE:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_ADDR_SIZE;
-                event.u.f_addr_size.addr = addr;
-                event.u.f_addr_size.addr2 = ptw_info.addr;
-                event.u.f_translation.class = SMMU_CLASS_IN;
-                event.u.f_addr_size.rnw = flag & 0x1;
-            }
-            break;
-        case SMMU_PTW_ERR_ACCESS:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_ACCESS;
-                event.u.f_access.addr = addr;
-                event.u.f_access.addr2 = ptw_info.addr;
-                event.u.f_translation.class = SMMU_CLASS_IN;
-                event.u.f_access.rnw = flag & 0x1;
-            }
-            break;
-        case SMMU_PTW_ERR_PERMISSION:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_PERMISSION;
-                event.u.f_permission.addr = addr;
-                event.u.f_permission.addr2 = ptw_info.addr;
-                event.u.f_translation.class = SMMU_CLASS_IN;
-                event.u.f_permission.rnw = flag & 0x1;
-            }
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        status = SMMU_TRANS_ERROR;
-    } else {
-        smmu_iotlb_insert(bs, cfg, cached_entry);
-        status = SMMU_TRANS_SUCCESS;
-    }
+    status = smmuv3_do_translate(s, addr, cfg, &event, flag, &cached_entry);
 
 epilogue:
     qemu_mutex_unlock(&s->mutex);
@@ -1000,7 +954,8 @@ epilogue:
                                     (addr & cached_entry->entry.addr_mask);
         entry.addr_mask = cached_entry->entry.addr_mask;
         trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
-                                       entry.translated_addr, entry.perm);
+                                       entry.translated_addr, entry.perm,
+                                       cfg->stage);
         break;
     case SMMU_TRANS_DISABLE:
         entry.perm = flag;
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index f1a54a02df..cc12924a84 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -37,7 +37,7 @@ smmuv3_get_ste(uint64_t addr) "STE addr: 0x%"PRIx64
 smmuv3_translate_disable(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=0x%x bypass (smmu disabled) iova:0x%"PRIx64" is_write=%d"
 smmuv3_translate_bypass(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=0x%x STE bypass iova:0x%"PRIx64" is_write=%d"
 smmuv3_translate_abort(const char *n, uint16_t sid, uint64_t addr, bool is_write) "%s sid=0x%x abort on iova:0x%"PRIx64" is_write=%d"
-smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=0x%x iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
+smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm, int stage) "%s sid=0x%x iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x stage=%d"
 smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
 smmuv3_decode_cd(uint32_t oas) "oas=%d"
 smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz, bool had) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d had:%d"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index b3c881f0ee..5944735632 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -183,6 +183,14 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
 
+
+/*
+ * smmu_translate - Look for a translation in TLB, if not, do a PTW.
+ * Returns NULL on PTW error or incase of TLB permission errors.
+ */
+SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
+                             IOMMUAccessFlags flag, SMMUPTWEventInfo *info);
+
 /**
  * select_tt - compute which translation table shall be used according to
  * the input iova and translation config and return the TT specific info
-- 
2.44.0.769.g3c40516874-goog
