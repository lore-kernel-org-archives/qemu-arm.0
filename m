Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118038nji;
        Mon, 15 Jul 2024 01:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHS46PDQ3a1xGJZMlECmDfu01ApwNSxaVzTSzhnZ957kTiPbecRAC/G4hi80fVsOd8THOfFEemOAwvUz/6thGzHKs5Tlsi
X-Received: by 2002:a2e:a581:0:b0:2ec:5219:8f59 with SMTP id 38308e7fff4ca-2eeb304eebemr162642171fa.0.1721033140304;
        Mon, 15 Jul 2024 01:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033140; cv=none;
        d=google.com; s=arc-20160816;
        b=zsSu/R6p2Qg0Eh1JjiL2lwSKl59rA+Sg/PqoUKW4cy5ZYhFWLG97Rf6khXiXNKdLkQ
         KpwPbtVFbsAZwBWHs3x2i3hi5IZjh+6akJp+iaVCiJDXL7Ce9LszKNeBuiXcrli5VWy2
         ZkO//gb09rLMDTywTpO7BuUmt+1swhizt2cISl9wL8QpL/Wnd+T89PcyXoJ0Nn6dKVYd
         hImT3U/BTV40DOPITnnVv91sgsIZjKV2oSgxDaVa3mNjWhMVaZQXt6mjSmKbv7XYhDA6
         36lTDLebp3hiRlYl6yWLR11wwiI3+xRj7+1ElWQi5BFuGq6ZfJR6JSQo2jv+Y3s5PGeB
         SsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=SZUG8vWPgda5JSi+0ivMM+5unzE39DmY473Vl+6Kelo=;
        fh=Hesz+58MXgDaiKMGc4GWgWi7gwhA0Y53Nnxt8Ro52x4=;
        b=C4r6Zvq5A2JRto2SDeoUk1dNnmkb/RmLj3kxPzVGtBEQytkXvjUSd2hT8TVrnPZow8
         FvyhvYjIyHUaHgoLFB3vNOicb4DbJLnUnPQzcVoAY/sF80aVDNCG6KUbtRXej+2bxkSx
         Jm3/HwhFyxggtiIwjsDt1dQ99vD4mY+ilcvtXreSHlM9VLWM7Z6mYnEPq7oyzZCKa+is
         EcwRQXtzQLB7rfqmhHT3SAbN5Oj7NBLHLjpRgJWWvQYZrOPJbJA4BL3iUpO6z1I6qUGd
         6pLAlrEoote/MBzlc8rH7O7aQtwaF1/mnoo7ipVXnZ94hWQP+rcFk0X1WWO8nwGlG0gz
         Ru6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=z4ePcIoe;
       spf=pass (google.com: domain of 3s-guzggkcwyysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3s-GUZggKCwYysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3s-GUZggKCwYysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id ffacd0b85a97d-3680dd5b371sor902193f8f.6.2024.07.15.01.45.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3s-guzggkcwyysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=z4ePcIoe;
       spf=pass (google.com: domain of 3s-guzggkcwyysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3s-GUZggKCwYysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033140; x=1721637940; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZUG8vWPgda5JSi+0ivMM+5unzE39DmY473Vl+6Kelo=;
        b=z4ePcIoeBhe9oi9KcbclQxnSFdAMv+cUde7wwEtdXewXHHrczxcQpfBC5U/W9Hntut
         eftJfg36b4qHRUCj28sTnq0JNT6QZqT4pgbsu6z1F79IZveoQZl/6Q2C5xHSxMe05oLs
         AIs7CHrOKHja4m48LU9g6HbZNRF02p30PnKodVvVhzm05ViDq8rpoOkXvVHm0+L2HSQr
         kRu2mPGDMieot355MlMhWt9YI3BqJLhNvmFRNdtKpevlfsgeZKaZtYpe7tWzUD/eywLN
         HnhrLHFUetoxqK7Hcjtnz5QcttPHeoCc9QDHoBSHDTzMZ1kXh3gJjtPP27Q59iufxhZO
         DRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033140; x=1721637940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZUG8vWPgda5JSi+0ivMM+5unzE39DmY473Vl+6Kelo=;
        b=MtWBc9xKAds29goKGTuS8OBVrSsTt76+8UkfhWsyHqJE0b+b3pu/KQKp6q5AvRe+0a
         sniAIWUBT2SofMVZ/nLMWOyMzufW35TbRBR0Lyqa2l4R0dba2ig8XX5tK++3tV2rVB0x
         rLxubDFDx3m3u+JOyrJYMwsn78dCyJz76qa0MHedJKzevEWY0CvbdoXEOzI10+y7Sk8m
         XVepVnPxbc6o5/ueCOP63rfJDUU67u/hrci8ES1HxcMmhOXbeKuhg/l550wEpDej/b92
         qmTr+CzMBiCECWRnoyh6PPHlh/hDZjE6hj3mkV1N9vT3rYWVaPKa3JnN7UrO/goanMIi
         gO7g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ70fDjD8tCddxQjkrE+5N1s7HCwF6/NgbJgiIwJ7/eyXIUdhoNYkdLFj0qrGj+qKgS99aZDyxTo5YpxTEyfIHS8ZTAbkd
X-Gm-Message-State: AOJu0YyclxEu/HSUyL5XochuEC6ih//zvGj5zkhv/g8FgCY2v6ab0oa0
	5lXlTjoYuT8tFGcqaaaKRG/QXK0HK6GFmLPQd5yf+koLiGE9lhtxOs+CiFa6iXP9zeYhWU3BmWA
	2fMcbpEmE1w==
X-Google-Smtp-Source: AGHT+IF6GpSx1mFVuW1s4Flz2crSW1GVcnmEUD7rSfSF9TQ82o/hPJywFaCcKyUDbOKOR5EhU0THgfWaSxGWrw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:5002:0:b0:367:904a:fae9 with SMTP id
 ffacd0b85a97d-367cea8eca8mr33300f8f.7.1721033139639; Mon, 15 Jul 2024
 01:45:39 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:05 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-6-smostafa@google.com>
Subject: [PATCH v5 05/18] hw/arm/smmu: Split smmuv3_translate()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: FQ6FeWYiRW8A

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

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         |  59 +++++++++++
 hw/arm/smmuv3.c              | 194 +++++++++++++----------------------
 hw/arm/trace-events          |   2 +-
 include/hw/arm/smmu-common.h |   8 ++
 4 files changed, 142 insertions(+), 121 deletions(-)

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
index 7e9874b4a6..85a3efd357 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -827,6 +827,76 @@ static void smmuv3_flush_config(SMMUDevice *sdev)
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
+            event->u.f_walk_eabt.class = (ptw_info.stage == SMMU_STAGE_2) ?
+                                          SMMU_CLASS_IN : SMMU_CLASS_TT;
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
@@ -836,12 +906,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
@@ -850,11 +915,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
 
@@ -883,115 +944,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
-            /* Stage-2 (only) is class IN while stage-1 is class TT */
-            event.u.f_walk_eabt.class = (ptw_info.stage == SMMU_STAGE_2) ?
-                                         SMMU_CLASS_IN : SMMU_CLASS_TT;
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
@@ -1002,7 +955,8 @@ epilogue:
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
2.45.2.993.g49e7a77208-goog
