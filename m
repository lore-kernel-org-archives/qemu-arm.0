Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597488ejj;
        Mon, 25 Mar 2024 03:15:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXf8a7otzDIlp7qP1dkZkW0Q9rAYZvgz+XpSIAEcz8kxo1VqRITIztsMLAvMyfGGwWIPXO2vjGteCnGbhtxcjfeSSjW55I
X-Received: by 2002:a05:651c:92:b0:2d2:31b0:4f64 with SMTP id 18-20020a05651c009200b002d231b04f64mr4083431ljq.34.1711361708974;
        Mon, 25 Mar 2024 03:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361708; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1od4owH7uy4BjZC0AjpQn/31ZN2M6w8S/R2vtsh47AS0A5VMAQXRMPaVZZw97+x4B
         joxJUIp9vN+S8/wQwfcs+9Nh11ytc52RNOZc54BYM1OCIbd2or5svemQPUyy6k4rtc8Z
         t7uwqmPPMcJrv4j8/Q65CsqkpP9qQiD6G51ExBY6+cRtSvfL000Pd3uTiqQlOvVWI29d
         MgzbKMFPfAFujOqVTe+MXg0r1thH0cAz/4xkKGZSAsR8eJujolFWVdn4HTvqx/A03EiM
         PtlyohPuTHq62L66WAMrZtQTHZ7UT9SQM9KQ2EFxbPSVnOC4leMx9qxGRX/xJ3ueJHTi
         YcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=wI5+HSlhnFLc7ghJppjiDbWNYQgzqY+velSYkez+Sxs=;
        fh=akq3fBrMaIV1FMS3m3wpEaYHUyOxY1uA3OCfECemQLc=;
        b=gP5troSN4l2ndDiC2EQNKofDqFnRotHQVF3pvbawof9Zf3zI6wckbwKfZ1QjNtngXW
         d2oDfSbh9NMOw73nVnkliUqcEGu1pyuin1WCst9PzvjmKt8j3SUNWDT8A/+O1MOmur1e
         0PCpJU7g44j8/n08A+nyhCrRVwuHaHZA98gPw9IRw/HBRl56aTy6fKzS9x9q4HcHskSd
         LR4cg3nhoXufityme+ykwWqOHJkkmKpqFuSwn08BnbavjZO7X/30ElsTzB9lHCOXm1ie
         W08hj8IVuzpnM7DadfYpI6yswwWmaKQVgkc4VbrpN8yrhcQnyTOPQGktUn3XEnbaeeNw
         g4RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YJpaP2re;
       spf=pass (google.com: domain of 3re4bzggkc4u1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3rE4BZggKC4U1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3rE4BZggKC4U1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id c20-20020a05600c4a1400b004147b3b0ed0sor1501286wmp.1.2024.03.25.03.15.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3re4bzggkc4u1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YJpaP2re;
       spf=pass (google.com: domain of 3re4bzggkc4u1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3rE4BZggKC4U1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361708; x=1711966508; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wI5+HSlhnFLc7ghJppjiDbWNYQgzqY+velSYkez+Sxs=;
        b=YJpaP2rey0brZtIEQjXYqB0JOZ4fHH7eW2ecUAkvo8FVyG30ag1wrPL1juBTIrf/uG
         Bgcm8AoiXOFsFpWO+JV7Sdicr7cJzzuWfG+4eJn4Ko1Psm3F7+0vUBC5J1+MYGxLukyW
         qGwtRi9po4+vVV4jgZ7uPcx8ch978L7l8aDLiSkQtc3siHriSIAjm+KqOsbq9j21UmwG
         +dpVpzX1MViqdqrCME65aBHk/Hz/zWaAb6FBYSrEmw+vwsPoA+fh5AY58XLkMocfmmcb
         RQOlTuuOix5tDIPKIeITQvC98pZOF/P7MR3Nnt8TkOViKJqLN5SDHrAwGGkZqrW8WeQb
         qhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361708; x=1711966508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wI5+HSlhnFLc7ghJppjiDbWNYQgzqY+velSYkez+Sxs=;
        b=wgeoeXi90/LDuMz3UYbAsDI1M7YJb+xqUcUt+0ZXv5mnL+Vlve4wrG8KHeZDbiKfUl
         8XDy+mqjW668M3EiK9PJoPIfYDdU8H9yFmxvzQy0QKk8zq4q00A5JkgJ6IlQReM6WeEG
         HAnX2Pzy4eUX0ftF9akGccWC5xLM843P+mTHOgqFaEkQn8PTntwGgqIuHauEwowiIkYY
         AOO5mEQq/Xeq9KAxy3G2P6qCSv3Vo//HLbMxGRbmWN6Krwjvngqs87s6oh4oCegrPSil
         jlIrp78jS3QN3y1tYmC789vbxwQebDqALOjOKZIGCCBSUo71GNwr9cEMAP8oJF7VWFhf
         CRZA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAtG1Pqh6Hozld86y4fT+TkDs18oLH6RVcJeP0iHRId3TNHD5OZiQ/B4uF0Sfrrnb/hk5m16HinOan4wzF6Ww4MsUhzKr
X-Gm-Message-State: AOJu0YxWmbCshgHsWR+nVsoWo72zImjIfDmUYGpp1eODGTBIHu9TrpG/
	+fu5C8iOBV7JEOgGzYpysGte0UQjExaxdP6nb6b4F8OhvAKXTjvY0Lg7VwRc6cmhtrx+IRUm3w8
	/G66Dwb/2DA==
X-Google-Smtp-Source: AGHT+IFfriDA7EKPuaygKPx6DgFIv5LZFQHIPMTl9mNRyYT1a0hn/dMhM8V3pfHiRupT3oqohmaTPv96KQ0OIQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1d08:b0:414:630:26aa with SMTP
 id l8-20020a05600c1d0800b00414063026aamr56892wms.7.1711361708678; Mon, 25 Mar
 2024 03:15:08 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:13:58 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-3-smostafa@google.com>
Subject: [RFC PATCH 02/12] hw/arm/smmu: Split smmuv3_translate()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: F5LUak9bXy3m

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
---
 hw/arm/smmu-common.c         |  59 ++++++++++++
 hw/arm/smmuv3.c              | 175 +++++++++++++----------------------
 hw/arm/trace-events          |   2 +-
 include/hw/arm/smmu-common.h |   5 +
 4 files changed, 130 insertions(+), 111 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3a7c350aca..20630eb670 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -554,6 +554,65 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
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
index 50e5a72d54..f081ff0cc4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -827,6 +827,67 @@ static void smmuv3_flush_config(SMMUDevice *sdev)
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
+            event->u.f_walk_eabt.class = 0x1;
+            event->u.f_walk_eabt.addr2 = ptw_info.addr;
+            break;
+        case SMMU_PTW_ERR_TRANSLATION:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_TRANSLATION;
+                event->u.f_translation.addr = addr;
+                event->u.f_translation.rnw = flag & 0x1;
+            }
+            break;
+        case SMMU_PTW_ERR_ADDR_SIZE:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_ADDR_SIZE;
+                event->u.f_addr_size.addr = addr;
+                event->u.f_addr_size.rnw = flag & 0x1;
+            }
+            break;
+        case SMMU_PTW_ERR_ACCESS:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_ACCESS;
+                event->u.f_access.addr = addr;
+                event->u.f_access.rnw = flag & 0x1;
+            }
+            break;
+        case SMMU_PTW_ERR_PERMISSION:
+            if (PTW_RECORD_FAULT(cfg)) {
+                event->type = SMMU_EVT_F_PERMISSION;
+                event->u.f_permission.addr = addr;
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
@@ -836,12 +897,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
@@ -850,11 +906,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
 
@@ -883,105 +935,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
-            event.u.f_walk_eabt.class = 0x1;
-            event.u.f_walk_eabt.addr2 = ptw_info.addr;
-            break;
-        case SMMU_PTW_ERR_TRANSLATION:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_TRANSLATION;
-                event.u.f_translation.addr = addr;
-                event.u.f_translation.rnw = flag & 0x1;
-            }
-            break;
-        case SMMU_PTW_ERR_ADDR_SIZE:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_ADDR_SIZE;
-                event.u.f_addr_size.addr = addr;
-                event.u.f_addr_size.rnw = flag & 0x1;
-            }
-            break;
-        case SMMU_PTW_ERR_ACCESS:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_ACCESS;
-                event.u.f_access.addr = addr;
-                event.u.f_access.rnw = flag & 0x1;
-            }
-            break;
-        case SMMU_PTW_ERR_PERMISSION:
-            if (PTW_RECORD_FAULT(cfg)) {
-                event.type = SMMU_EVT_F_PERMISSION;
-                event.u.f_permission.addr = addr;
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
@@ -992,7 +946,8 @@ epilogue:
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
index b3c881f0ee..876e78975c 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -183,6 +183,11 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
 
+
+/* smmu_translate - Look for a translation in TLB, if not, do a PTW. */
+SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
+                             IOMMUAccessFlags flag, SMMUPTWEventInfo *info);
+
 /**
  * select_tt - compute which translation table shall be used according to
  * the input iova and translation config and return the TT specific info
-- 
2.44.0.396.g6e790dbe36-goog
