Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931859ejb;
        Sun, 28 Apr 2024 20:25:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXipjaDI0Fwvfn9GsTbn8rP9584wplY8fcolw7gObbba9/kz8nXwQeDHtOSNEwGpGAaDusFXmuBKYR6XitEI/ZYYnHm7dtg
X-Received: by 2002:a05:690c:6f84:b0:61a:b5cd:ee95 with SMTP id je4-20020a05690c6f8400b0061ab5cdee95mr10038777ywb.32.1714361105608;
        Sun, 28 Apr 2024 20:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361105; cv=none;
        d=google.com; s=arc-20160816;
        b=UKiMLRVjl7h8Q74aN9naljqNVVwO/zJSvnwEgxK3V0L05XY7x89xoEkizCsyoZKkBY
         4lARv9sJyMHdOcEugf6K9KngwyKYZq2Vn/BBQTE5O6nN+xhd4aO5aYDFtnUmz6GjcOEx
         kid5m2PdNfAZT8/yhXbUuQgRl9KAi9mnadC3kVQeXoWWKNkW1Rq+gT5EZ5jyA4brcGTd
         d6xr55jjKcKzecWyw/NOgyQx/OcPUhI7oSXd7qE4izQ0q/aUOPfyS0C7VEFxjTy3O+V7
         jLsPZIqVF4bxIZKU8xNSKsgKhojf49LYUgoNEYokhwHrn/og8xbdQoHMHU2C+w87ymZn
         PbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=H4fA+OHOmnWEwvYlQG+NpudUMjNJ2XOSvr3sfIS6o60=;
        fh=RYDkL19j7+oTN3ycQbSN062yJYN5CnXLltazTu/PJiI=;
        b=Y4YDTWO2e8xjQjPB6BHVyfvvyMTAlMdxHPePtXSAA3iHF/+RM4VayryqysRTy9Q/vw
         0KCCgsg4bwxQ84H9+5mBKigCmAZQeGRMOcAmy4+wYhXGcZ54HmPV0qMQxwodY4AyCZQL
         JJR7mYTqT9ijWJulrf2t4x7k9GQXReeHy3Y4DhMlSS8nfds6kPVMDMr4gHLDPSMU9GaA
         dYvXsmqdKyWrqOeLk3/YY2iL6j7wa0/yM/gnazNhsVhsI0xrpgrrk0z86XCI6hr5RDO6
         Lhh2cT4wJgTRHJYpvV4RBkKW+M8dOW2xRBj5C9WoPry8r8u7O87SNblzSna+gn41kO2u
         LGIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=RW10B0S6;
       spf=pass (google.com: domain of 3ermvzggkcywauwabiniowwotm.kwuitmf.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ERMvZggKCywaUWabINIOWWOTM.KWUITMf.JMVVMMTQVIZW.WZO@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3ERMvZggKCywaUWabINIOWWOTM.KWUITMf.JMVVMMTQVIZW.WZO@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id z5-20020a81a245000000b0061438599fe1sor17508735ywg.6.2024.04.28.20.25.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ermvzggkcywauwabiniowwotm.kwuitmf.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=RW10B0S6;
       spf=pass (google.com: domain of 3ermvzggkcywauwabiniowwotm.kwuitmf.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ERMvZggKCywaUWabINIOWWOTM.KWUITMf.JMVVMMTQVIZW.WZO@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361105; x=1714965905; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H4fA+OHOmnWEwvYlQG+NpudUMjNJ2XOSvr3sfIS6o60=;
        b=RW10B0S6fS6Aaow5H9qAYjyYUBxqGQs6UIicE3K1EPwnIdHG291f/GTB5Zju47fsso
         iDVH1vtMKx9eTTvUtioiZUsbpU+njjcZDMYWDZSa6BUBU92kwii5pdcLQhlXttjbHrLK
         t5YCt61G4SZM/qFp7sCW8iRpHYdDf4/0s1iOYYzd+rZZIyb3SuAfsCTWjLRFvluLoyk8
         NSwkhPTH7miLGBZlL/Qw/i3ISjTERnPhg1SyVNJTvkEVmcY6EDNfnoKpuJExFoCPdypA
         qfiSVc8Wqca2fyifgA3fBs5rzMWJdvtLarWNJrVJu7BNVCvokQhlm4bw1s+zd0woHL5P
         45uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361105; x=1714965905;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4fA+OHOmnWEwvYlQG+NpudUMjNJ2XOSvr3sfIS6o60=;
        b=AhlwZqW8HJufEfjvKHC/hH5cSdND/f9cxLaCUiRuUHQAdl5E+Y1Vw19aEjv9e6NIOh
         aFVpFTr6V5LDIuTw04LvkNgFFMkWXmjO/lxwD7WsCC2xTZy2SEbubFE1NnTTho6klhUb
         jMJ2l5IZKjcPNrS20iB2ZhA3FkvEe7wpN1MpxR3Su3gt3GysVVuRHRRVOQnjjwpeV3Vy
         /aY/GJvzUblKVBFmgmrcy2emZAE86+lor7Ymlz77EKZeEorK4VduesohOPs5OSEFSiBI
         G45zRQ+aODBthyGR2OEkXTgGhVrR/IqU3IkM+EQY/RmTyImy9jlFf9LV7Z0rzK0+OWAq
         fU2g==
X-Forwarded-Encrypted: i=1; AJvYcCVDi2H8SsrfouF09nHbi2UY92MDQH3aKUyamY9k3pVIcToEMSq6ThSa38vMAY9PLoBeowjbWeG72/o5wtbbGTYZyjTqe+QD
X-Gm-Message-State: AOJu0YydLuB9JcXYTnmioUXGICRi5rJH1hWQj18Y08jqrXMdOUqdv/q4
	NUMLquRrc8G/eDMLniU2hWoKnbpP+9s4qaWvR5yebMZ5n1j6k+tOiAEnANu5GQpjoC6tyAt+AqY
	+Hb5tQ7e5pA==
X-Google-Smtp-Source: AGHT+IHMgQnc8GyjdKLDzwQQxWvYt2h6/8YOpL/WjUuJxPOdpipmwtupZ49sEHJAAoD+kf6Tv0IaV2WKS18zXA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:18ca:b0:dc2:2ace:860 with SMTP
 id ck10-20020a05690218ca00b00dc22ace0860mr1017837ybb.2.1714361105174; Sun, 28
 Apr 2024 20:25:05 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:58 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-15-smostafa@google.com>
Subject: [RFC PATCH v3 14/18] hw/arm/smmuv3: Support and advertise nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KsFGkf5rbg24

Everything is in place, add the last missing bits:
- Handle fault checking according to the actual PTW event and not the
  the translation stage.
- Consolidate parsing of STE cfg and setting translation stage.

Advertise nesting if stage requested is "nested".

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 50 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 96d07234fe..88f6473d33 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -34,9 +34,10 @@
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
 
-#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == SMMU_STAGE_1) ? \
-                                 (cfg)->record_faults : \
-                                 (cfg)->s2cfg.record_faults)
+#define PTW_RECORD_FAULT(ptw_info, cfg) (((ptw_info).stage == SMMU_STAGE_1 && \
+                                        (cfg)->record_faults) || \
+                                        ((ptw_info).stage == SMMU_STAGE_2 && \
+                                        (cfg)->s2cfg.record_faults))
 
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -260,6 +261,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
     /* Based on sys property, the stages supported in smmu will be advertised.*/
     if (s->stage && !strcmp("2", s->stage)) {
         s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
+    } else if (s->stage && !strcmp("nested", s->stage)) {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
     } else {
         s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
     }
@@ -422,8 +426,6 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
 
 static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
 {
-    cfg->stage = SMMU_STAGE_2;
-
     if (STE_S2AA64(ste) == 0x0) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 AArch32 tables not supported\n");
@@ -506,6 +508,27 @@ bad_ste:
     return -EINVAL;
 }
 
+static void decode_ste_config(SMMUTransCfg *cfg, uint32_t config)
+{
+
+    if (STE_CFG_ABORT(config)) {
+        cfg->aborted = true;
+        return;
+    }
+    if (STE_CFG_BYPASS(config)) {
+        cfg->bypassed = true;
+        return;
+    }
+
+    if (STE_CFG_S1_ENABLED(config)) {
+        cfg->stage = SMMU_STAGE_1;
+    }
+
+    if (STE_CFG_S2_ENABLED(config)) {
+        cfg->stage |= SMMU_STAGE_2;
+    }
+}
+
 /* Returns < 0 in case of invalid STE, 0 otherwise */
 static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
@@ -522,13 +545,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
 
     config = STE_CONFIG(ste);
 
-    if (STE_CFG_ABORT(config)) {
-        cfg->aborted = true;
-        return 0;
-    }
+    decode_ste_config(cfg, config);
 
-    if (STE_CFG_BYPASS(config)) {
-        cfg->bypassed = true;
+    if (cfg->aborted || cfg->bypassed) {
         return 0;
     }
 
@@ -701,7 +720,6 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
 
     /* we support only those at the moment */
     cfg->aa64 = true;
-    cfg->stage = SMMU_STAGE_1;
 
     cfg->oas = oas2bits(CD_IPS(cd));
     cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
@@ -901,7 +919,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             event->u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_TRANSLATION;
                 event->u.f_translation.addr = addr;
                 event->u.f_translation.addr2 = ptw_info.addr;
@@ -910,7 +928,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_ADDR_SIZE:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ADDR_SIZE;
                 event->u.f_addr_size.addr = addr;
                 event->u.f_addr_size.addr2 = ptw_info.addr;
@@ -919,7 +937,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_ACCESS:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ACCESS;
                 event->u.f_access.addr = addr;
                 event->u.f_access.addr2 = ptw_info.addr;
@@ -928,7 +946,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_PERMISSION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_PERMISSION;
                 event->u.f_permission.addr = addr;
                 event->u.f_permission.addr2 = ptw_info.addr;
-- 
2.44.0.769.g3c40516874-goog
