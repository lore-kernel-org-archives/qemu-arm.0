Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597612ejj;
        Mon, 25 Mar 2024 03:15:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXldIPbMdMcVU4Ud8+oOMq3vOi0wYpGW862RE/meKFNPWBsazmSBNcjp+XsAqQRI+deoo5qS+vfk+Le1X4RWRHuUNsHk13e
X-Received: by 2002:a25:8550:0:b0:dbd:4578:5891 with SMTP id f16-20020a258550000000b00dbd45785891mr4088112ybn.65.1711361722589;
        Mon, 25 Mar 2024 03:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361722; cv=none;
        d=google.com; s=arc-20160816;
        b=pwrCO+1nLnxsYYhaB1fAfC5eCnkPtRGmLyK3QAzrKEMpAWL6po6mbV/j23IsYni87T
         J0oGYZPnF4SdAVeHYMFx6s1NfZnf0W0KKqtyYps1Z62fTWcncAHqr37fPhUn7aZmmpqm
         6K+zr5kt1Am0R3SR/PJhBoz4KAHIWXxHujFaFgX85cmmAwVaIUJy4/W/NAPtKygPphXn
         zYmvNrSnRi2fzUEPhUbg8dIZGkbBINyz0eta473qcmoGM8n4+i2UB3eVRi6PzLwjNItk
         pAebTG0KaTSi08HdI8a4QDURBGo9eu3/mlJbNa+prAmHhX+F9jnhLqIz00sPYlfe8rKb
         r81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=wHU+2Us+dIMmbE9OBQ2CgF2/1KqvZBlHyTvsxveVE+s=;
        fh=Zmv0juFVIj/gwkxTJsZ9vthBqoRvCBPCMdZD9IalrZs=;
        b=GhoDyOXaUAPVoYxM4h+esTAPQKu36yjLSMsDuQ0ESEIH/lO1sZ6G6KRkmVDEhGEUqw
         hKDrzR6BuN0qE+8FbEDCdarXikXLZHisvg8ZFRRLi1/D6OsRRjVgntQxWboLmaoGRvM1
         2Zr7EFbmvfjBhn+L9Ii5xfUDeZUxfHddrPKdrh5yBGd9XfmQovxY0+9RgL5jRalf+sod
         26ptdRWsuv4ajPJR0/mCqc6zhcQ67ltI/6Ii10+v2aqgFsTACTub0oEuWqLbY0PgNaBW
         S+FFM6e4xxN0cHTjpJKrUi+DruglNF3J6wsnntQgCUJYdpwPoEJ8My20pCDj066cWfAs
         d+Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iaWUnfQQ;
       spf=pass (google.com: domain of 3uk4bzggkc5mf9bfgx2x3bb381.zb9x81k.y1aa1185axeb.be3@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3uk4BZggKC5MF9BFGx2x3BB381.zB9x81K.y1AA1185AxEB.BE3@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3uk4BZggKC5MF9BFGx2x3BB381.zB9x81K.y1AA1185AxEB.BE3@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d4-20020a253604000000b00dc74fe4e3e6sor2334209yba.1.2024.03.25.03.15.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3uk4bzggkc5mf9bfgx2x3bb381.zb9x81k.y1aa1185axeb.be3@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iaWUnfQQ;
       spf=pass (google.com: domain of 3uk4bzggkc5mf9bfgx2x3bb381.zb9x81k.y1aa1185axeb.be3@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3uk4BZggKC5MF9BFGx2x3BB381.zB9x81K.y1AA1185AxEB.BE3@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361722; x=1711966522; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHU+2Us+dIMmbE9OBQ2CgF2/1KqvZBlHyTvsxveVE+s=;
        b=iaWUnfQQe3QkFqhWHTLiqD2h0uawuKKMdj7puP0rWlHYMpnBGRAkVK5EftJL7r3tpc
         7GYJXON/xNd/3rupRpa/wCavvaE0tDDrodRsO/CoD+W7YCrqgIKO4/UPJpNSfK0OUkm+
         v+INjFUFK5b96E+By2ckhb4qlDBnKQxamc5263yL0rg51K/ENall2QpWtxoL2EHBVcau
         F2+L9jB9vQVM1Tl7UAWpZofLYsmZhP2xIprkH31WW/2KfeNOK9i+xHYvtVirhCXMZmNI
         YM543T+fN1g6GfC7nybkjCWd2aQedWUYIM7oBeodIZsqfLEb7DqGhMg0k5tkWuACRGub
         NOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361722; x=1711966522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHU+2Us+dIMmbE9OBQ2CgF2/1KqvZBlHyTvsxveVE+s=;
        b=JLc30nX5TY/9p9/0YkfqXX8VLIbN+rlY87nwF/3Zmx+6JYGd8qXXQe/Kh5Kfg8xqKC
         BrVn2hM1b8dLOnb1D1kMl5Q+HZbtalREeMZuXlda3XHh73hpa3yefv4kYxAMti1AMOqn
         TENFDZp/bM3ahd+RxsENUO1vRdRVBk4oT+YljHgaOe1AbvR1xZLP+gk7X838NVFmYwue
         eWy0tznkzW8RklQaXi10CXvuxALQnyVPicECEbStBjApqLH50J1chPKepeGFuc95UEqe
         Dmnjvsycg7c4mAtBvCoyHEIu+09I5zsFRy57jxEvo7X9fgTDiR+74oNb7He5GdlvEVhh
         Zh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSQX1sJ17vP69YtCMrfmzUu+iHLpBQe4hfRCbzNleAD2oY3RUTprA71RooaSEZ7PuNq2Q5x/yA996mLkq6IJRVt9QSInri
X-Gm-Message-State: AOJu0YwPLrGncqQUuQIVfpDC4FKGAMJJ4VGe4hbYsXItyfOxw9cbCXhB
	IVCdFGlL9F800NF0BdNpsYSPV0/JgbMClKh6ix+Q6YtyXuiCSNcmUxLO1F59LRZp144xixIMB1X
	V8w33MBTdZg==
X-Google-Smtp-Source: AGHT+IGKw7bQ4UOBMzrfuoG6w6xqXQt+M58+XMrrM0hdUU5wZVJhFCCmQCQXHCig6rD5ZfN8BmLqUtKSXBO29A==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:100a:b0:dc7:48ce:d17f with SMTP
 id w10-20020a056902100a00b00dc748ced17fmr2145161ybt.10.1711361722213; Mon, 25
 Mar 2024 03:15:22 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:04 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-9-smostafa@google.com>
Subject: [RFC PATCH 08/12] hw/arm/smmuv3: Support and advertise nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: tfmuV7XZF5pM

Everything is in place, add the last missing bits:
- Handle fault checking according to the actual PTW event and not the
  the translation stage.
- Consolidate parsing of STE cfg and setting translation stage.

Advertise nesting if stage requested is "nested".

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 51 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 32a1838576..e5373f4cfe 100644
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
@@ -425,8 +429,6 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
 
 static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
 {
-    cfg->stage = SMMU_STAGE_2;
-
     if (STE_S2AA64(ste) == 0x0) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 AArch32 tables not supported\n");
@@ -509,6 +511,27 @@ bad_ste:
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
+        cfg->stage |= SMMU_STAGE_1;
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
@@ -525,16 +548,15 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
 
     config = STE_CONFIG(ste);
 
-    if (STE_CFG_ABORT(config)) {
-        cfg->aborted = true;
+    decode_ste_config(cfg, config);
+
+    if (cfg->aborted) {
         return 0;
     }
 
-    if (STE_CFG_BYPASS(config)) {
-        cfg->bypassed = true;
+    if (cfg->bypassed) {
         return 0;
     }
-
     /*
      * If a stage is enabled in SW while not advertised, throw bad ste
      * according to user manual(IHI0070E) "5.2 Stream Table Entry".
@@ -704,7 +726,6 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
 
     /* we support only those at the moment */
     cfg->aa64 = true;
-    cfg->stage = SMMU_STAGE_1;
 
     cfg->oas = oas2bits(CD_IPS(cd));
     cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
@@ -887,28 +908,28 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             event->u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_TRANSLATION;
                 event->u.f_translation.addr = addr;
                 event->u.f_translation.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ADDR_SIZE:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ADDR_SIZE;
                 event->u.f_addr_size.addr = addr;
                 event->u.f_addr_size.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ACCESS:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ACCESS;
                 event->u.f_access.addr = addr;
                 event->u.f_access.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_PERMISSION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_PERMISSION;
                 event->u.f_permission.addr = addr;
                 event->u.f_permission.rnw = flag & 0x1;
-- 
2.44.0.396.g6e790dbe36-goog
