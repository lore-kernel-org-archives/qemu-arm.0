Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597560ejj;
        Mon, 25 Mar 2024 03:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXoQURk5p3aNS+Gifofru7VxApupUXDVkQ9K/Mv3+PbmXC7/J1Of1Frk9S8c/wvyx6uiO4EUCcRPscKAjJZVOzgomWs+9qh
X-Received: by 2002:a0d:e6cd:0:b0:610:e9a1:f420 with SMTP id p196-20020a0de6cd000000b00610e9a1f420mr6126818ywe.8.1711361717797;
        Mon, 25 Mar 2024 03:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361717; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMcTfYTRl5zIl9QQtzF0/Vb3u7IzIeBcqYkfNmClDWvYWK1P7B4GTMydC4Gxw/mkcm
         tBeyvnMNdaR17e08tG8KAwagZv4WL36pecwRLGM9vuDqbulYuweQYgptmCbq2OvOnv+q
         +tIcjP6XyoNezOMydqXheRRLh+3wGNyedgog80/d9WCuC476ZoANStykg4LpY+hHiRXU
         T2xutobawISdUYq+T3G/aCRZjdIQw5hRpOD3kcDcpiiEvTh3pmF9XHT726Grgg9suRZT
         J3Zp+0TW+FuQTVD6QxumIMXI84kkapi5NfuYY6ArnY2Xi5/Bgogd9EOnNPv1p5ZdVXkO
         Vr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=ccD7sbdzuGpAa0jXfN4y1W86pnnvVB5TQIYedSVoLrs=;
        fh=d2e78YmmBu17G/zXB3vu0B3Bg0wk92zDGbxlicJfCdE=;
        b=e4+/L0GdqPcLE2FWxA9xa9tZCMujYoQntvvwzDmpVDLiGQ0OHuHRc0BJMb0vm1nIRL
         G2oQxBbyLrn5EjAES3StMkpZ6aeN56TE3qJO/1a66jRCPNy/tED+EZwamVwm/BuvqbR1
         WHq82zV4vg2LUqcxgy+1I0CBdTHbeZs0x3EWzCBzZ+5/4MX4qCDeuaer1XkEedbPtN1c
         WwHPNPt5o/2yv6Jl6nkVgYFY9mvUUOtIBjTf2PwuV9Qvn2UWzqiLOiXRQIuX29fJneIw
         icnp+SVYYMFejpAo4R0E0hFTFJhFbqM9VQ1VjeJuTk31i7GWscY9Sqvaz+5h4yeEvGMD
         w4hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Jr8crMxT;
       spf=pass (google.com: domain of 3tu4bzggkc44a46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3tU4BZggKC44A46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3tU4BZggKC44A46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id a14-20020a81bb4e000000b00610de8565easor2553854ywl.12.2024.03.25.03.15.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3tu4bzggkc44a46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Jr8crMxT;
       spf=pass (google.com: domain of 3tu4bzggkc44a46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3tU4BZggKC44A46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361717; x=1711966517; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccD7sbdzuGpAa0jXfN4y1W86pnnvVB5TQIYedSVoLrs=;
        b=Jr8crMxTRPeXWqoXaTCjuWnNvnjnSjIdECrrneyZGqhq6z6WBy21/dPRzK0hr/DAKU
         QzkYNi8sZY1AsE/oZ4/+Ypgy5npXW/M2A9msH6nY4k6tH8g3L4M1VtaZHlaIQNia5za3
         6l8L12yjwu3lPoikciL/i91K0n1g73uBHroeAT4b33h63iBn7koGUm2WOEro8kccMUlh
         EnEa9u8uPNSZ+LxIxPo++AUC8Fcli168wAPDXkOPoBTn07w3EiyHjExvj6vBlpDES5Gr
         MQX1pqoKlc2Dc79CDesMyEzb6LHviibcAytbdu/8nQaCU86FnmE457/nmbAtd1VTzaa5
         h9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361717; x=1711966517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccD7sbdzuGpAa0jXfN4y1W86pnnvVB5TQIYedSVoLrs=;
        b=DCutasoqlxfUfFH3NyevFam5/fr3CeOwryUQ+ytjViv4WpHhFzOWVN+rXW6xXa9mAJ
         EZAyfgScV0Tr7yOx+sMkZjf3b77EBTq7MUUGOH/sG7cOfDIUTQ1iUs0CSHzu6G1RwvOL
         yEjw95gv8UcDBtHO+6Fg47j8cF+c2Mzl4A4rpNULJ8WqtvjpwGmJcNW76mqhyHPT1DX4
         v2AbnO+uvQYSCk8sVm/ZCk6VAdBrevBqBatErxhPWutKya9KX92Zi1n57l+K5xc4QdlF
         1hAeEAa6HQ83tJKrNP24Xw9I15D7LDBj+YVVh+ZqbrurtM7QSJ+f4CvywL3MZ3eSjjbd
         ogAw==
X-Forwarded-Encrypted: i=1; AJvYcCXWCSblUmc2YNh+vYn4veQoh4sncxgfJ1tbe6gjuNRGTE1XxJYDb0K6S/3+2ULXvjb3dmMa4AYMGU3Hugz/rf2ZGbi+iRmz
X-Gm-Message-State: AOJu0YxreXt97VOGvHhmvIalGJsyNrOA5Nn039Yqo+Prtxpru3Ir+weC
	6Ew6K4jfZBYZzvKOoDDa4DwGg1XJiAfCyOsy4OJOVGLFYIUWFNq/Hpl+qxEaeqi2SpAVjfmi0JI
	k2SloKxlNHA==
X-Google-Smtp-Source: AGHT+IHuVTIErXz5GdelQv2USvYnaZHUcmlfIO6KPl/dcfbh/pXqBnjKYfsNOwbgHKK+XkcKjKHsoNam/gU4fw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:100a:b0:dc6:ff2b:7e1b with SMTP
 id w10-20020a056902100a00b00dc6ff2b7e1bmr2119495ybt.4.1711361717430; Mon, 25
 Mar 2024 03:15:17 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:02 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-7-smostafa@google.com>
Subject: [RFC PATCH 06/12] hw/arm/smmuv3: Translate CD and TT using stage-2 table
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6Gl6G6BlYJeW

According to the user manual (ARM IHI 0070 F.b),
In "5.2 Stream Table Entry":
 [51:6] S1ContextPtr
 If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
 stage 2 and the programmed value must be within the range of the IAS.

In "5.4.1 CD notes":
 The translation table walks performed from TTB0 or TTB1 are always performed
 in IPA space if stage 2 translations are enabled.

So translate both the CD and the TTBx in this patch if nested
translation is requested.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c              | 49 ++++++++++++++++++++++++++++++------
 include/hw/arm/smmu-common.h | 15 +++++++++++
 2 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d9ee203d09..32a1838576 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -337,14 +337,36 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
 
 }
 
+static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
+                                                 SMMUTransCfg *cfg,
+                                                 SMMUEventInfo *event,
+                                                 IOMMUAccessFlags flag,
+                                                 SMMUTLBEntry **out_entry);
 /* @ssid > 0 not supported yet */
-static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
-                       CD *buf, SMMUEventInfo *event)
+static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
+                       uint32_t ssid, CD *buf, SMMUEventInfo *event)
 {
     dma_addr_t addr = STE_CTXPTR(ste);
     int ret, i;
+    SMMUTranslationStatus status;
+    SMMUTLBEntry *entry;
 
     trace_smmuv3_get_cd(addr);
+
+    if (cfg->stage == SMMU_NESTED) {
+        CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s, addr,
+                         cfg, event, IOMMU_RO, &entry);
+        /*
+         * It is not clear what should happen if this fails, so we return here
+         * which gets propagated as a translation error.
+         */
+        if (status != SMMU_TRANS_SUCCESS) {
+            return -EINVAL;
+        }
+
+        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
+    }
+
     /* TODO: guarantee 64-bit single-copy atomicity */
     ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
                           MEMTXATTRS_UNSPECIFIED);
@@ -659,10 +681,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
     return 0;
 }
 
-static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
+static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
+                     CD *cd, SMMUEventInfo *event)
 {
     int ret = -EINVAL;
     int i;
+    SMMUTranslationStatus status;
+    SMMUTLBEntry *entry;
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -713,6 +738,17 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
 
         tt->tsz = tsz;
         tt->ttb = CD_TTB(cd, i);
+
+        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
+        if (cfg->stage == SMMU_NESTED) {
+            CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s,
+                             tt->ttb, cfg, event, IOMMU_RO, &entry);
+            /* See smmu_get_cd(). */
+            if (status != SMMU_TRANS_SUCCESS) {
+                return -EINVAL;
+            }
+            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
+        }
         if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
             goto bad_cd;
         }
@@ -767,12 +803,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return 0;
     }
 
-    ret = smmu_get_cd(s, &ste, 0 /* ssid */, &cd, event);
+    ret = smmu_get_cd(s, &ste, cfg, 0 /* ssid */, &cd, event);
     if (ret) {
         return ret;
     }
 
-    return decode_cd(cfg, &cd, event);
+    return decode_cd(s, cfg, &cd, event);
 }
 
 /**
@@ -942,8 +978,7 @@ epilogue:
     switch (status) {
     case SMMU_TRANS_SUCCESS:
         entry.perm = cached_entry->entry.perm;
-        entry.translated_addr = cached_entry->entry.translated_addr +
-                                    (addr & cached_entry->entry.addr_mask);
+        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
         entry.addr_mask = cached_entry->entry.addr_mask;
         trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
                                        entry.translated_addr, entry.perm,
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 6d3bf5316b..c0969e461d 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -39,6 +39,21 @@
 
 #define SMMU_STAGE_TO_TLB_TAG(stage)        (((stage) == SMMU_NESTED) ? \
                                              SMMU_STAGE_1 : (stage))
+
+#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
+                                             ((addr) & (ent)->entry.addr_mask);
+
+/*
+ * From nested context, some functions might need to translate IPA addresses.
+ * As cfg has SMMU_NESTED, this won't work, this macro calls a function with
+ * making it a stage-2 cfg and then restore it after.
+ */
+#define CALL_FUNC_CFG_S2(cfg, ret, fn, ...)  ({ \
+                                                   cfg->stage = SMMU_STAGE_2; \
+                                                   ret = fn(__VA_ARGS__); \
+                                                   cfg->stage = SMMU_NESTED; \
+                                              })
+
 /*
  * Page table walk error types
  */
-- 
2.44.0.396.g6e790dbe36-goog
