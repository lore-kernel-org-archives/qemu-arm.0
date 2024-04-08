Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293818ejh;
        Mon, 8 Apr 2024 07:09:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhTMa6TZ2eeWcKhF4ccNYW48WR/4CV2A2aGAfu7ormRQR/Hpmp/HoKwTGc69hISND5uXDKstcgSnmpfw2H9XNL9+HSEbh4
X-Received: by 2002:a25:c7ca:0:b0:ddd:7ab7:2320 with SMTP id w193-20020a25c7ca000000b00ddd7ab72320mr7308969ybe.27.1712585361448;
        Mon, 08 Apr 2024 07:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585361; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0FZD5dK66q+67fU00xBz7f2KrabR/+LTkMFhDTkgXeOcilXM1aGARV2Cq9zpgPDBv
         3EBTdwa33q6vUHJF5dOj+TkoIvXE0qJntWQlj1KwjwP7yeJadihCnVOKOlBgZVwvPx+j
         jSwm7K9OObxR5cicace7egwUQfhhrNAO+dvPnkyZHcxJ2oSjdpzlTR100RSMi0gRCwF4
         EDC5VlPMR8IJhb8GsbKKVt8hDkQJYWNhPNWAXtcl1iZRGnr4Yn8D/NtqkqKiWPwhNvcF
         bU4O68zeU9ZGV+oynaDd8krW3KCDNL3uem48MI9KKG1OeCd3DusKaOw2003V6/nVCZCv
         IEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=xWJgvkXsRDlv4QySfPpJRYbrk5xBNLshUoOdVCtmsHg=;
        fh=21LgGg4lQYnDlen1vxTOgtTQvjPFSAIUZlNqJOL5NAA=;
        b=jGvGgJEtOttCZKaUfD7tRSK/GJ5EWGPsx5jfzXmHOKS6he5K2HIcjl9U/gqFF2O1in
         P76oa6oM12cZd2a+i8R2lDMQExLPiGFRud5kjjX1Wl1d9dLSMt/Wh7wXZH3e+nOdnr27
         uB112OiL0moYHj2sp/7hFikqUlJUfOOALyGo6mhf4+BIhLpKmgZMirCv2QYiTW3IVyBg
         oR+hnTeq1Wio9ohmj9DiREQ4QINA3DxWd42NHae6ENc0PGQmXbH4l3W+cbv830CXHgXF
         IyMiuKIDYFKqKS6uanJvfeTL22R3fiFk3C0rFMLxifcd50DdhsNdyj92pzbCZYyD+2yO
         T6hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TBmhTHXE;
       spf=pass (google.com: domain of 3kfotzggkcw460267otou22uzs.q20ozsb.ps11sszw1o52.25u@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3kfoTZggKCw460267otou22uzs.q20ozsB.ps11sszw1o52.25u@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3kfoTZggKCw460267otou22uzs.q20ozsB.ps11sszw1o52.25u@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id w125-20020a25df83000000b00dd3f55dae51sor3644031ybg.17.2024.04.08.07.09.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3kfotzggkcw460267otou22uzs.q20ozsb.ps11sszw1o52.25u@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TBmhTHXE;
       spf=pass (google.com: domain of 3kfotzggkcw460267otou22uzs.q20ozsb.ps11sszw1o52.25u@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3kfoTZggKCw460267otou22uzs.q20ozsB.ps11sszw1o52.25u@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585361; x=1713190161; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWJgvkXsRDlv4QySfPpJRYbrk5xBNLshUoOdVCtmsHg=;
        b=TBmhTHXEfKBEMI5U6dlChvotzxo7OgVLfGor6ZG9gJCEbgtgY0RY7Rw7W9326J9OP9
         cdj+o7LF3ln7ZEQRq3r1NwKrgxMRV8VaDL78bblTFHWyFCOwdjBcBDAjlu6g/3FmXUwA
         qrASlywgvJmlyBl3YIF7aVMmKjvSq9UcvN2sOSYMu8XRf4sTACuZj6hEU2AUSdNKxKCw
         yUsz9eYZvRkUae6dOE5te5eEJCeujDZ1mLn3uBGbNnNih7xvrEwGfP5ANCE+gfErJ9Hv
         DIFJwI65o4o+KTl7qY4bd+gWBmCddfej4PtJZhI2uPQ8sdav1V3gup1vu2iQoSBxT7ZU
         UH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585361; x=1713190161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWJgvkXsRDlv4QySfPpJRYbrk5xBNLshUoOdVCtmsHg=;
        b=XEFFdWhjZ/tbHvaaEO817bj+43UW5iFCwgIK5wQHZLbzx3kaUc/HDaMEu/dv4NCJgH
         Xp1VcV/+Qj1gCEF4XfxvOApfuhtokTpD9ckzlPFRbtGeBL0lKtT3zedWuVlZJu3MlcxY
         0RmWpO5f574MFvXuQ0r/c/m5pcwnzqnqTrKwAG2lo8jgknq+V8IPWGU1o47MHV4DhuMO
         0jpfQf/w+AQE4kz96AQeNpkAKhyB++YepJwRlzD/F4hmogY+YdI6JZbP7gkJ2cHFG/UN
         4tqGT3kTkfXCPWvhvanaoXJmgrDqc6Y099LlWdj92M02YRtY2drJsTE2Nz+eME+LundT
         4JYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+RjyAZTTirwqjlzXNpn17em2Wflv6Mu3OD24obXrZQofhaWlq3g9m5cEYUNYkPNF7Shjs4RmlG0Wp3DJmdxICVdGJ+Kos
X-Gm-Message-State: AOJu0Yxs14tYlqAZGumcu7WmomvACsE8GBm3zuo25WONzjr6ZWPAl3xJ
	+4zUFB88dnRsGXmCS/zaTTCVVhl1xpQQildJao/OOL4Vd4U/vKiO+xAMBPY2ClyOX0xN2z84Ye3
	IPZUC7J91JQ==
X-Google-Smtp-Source: AGHT+IHQMA3cRcyxEy3dt9h6LYbjHh++lB0rxNHdAwlgj4xEmjt5EGwd6WJA1nFNuPifBMWod0kAcIu9MKBiHA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:726:b0:dcd:3172:7265 with SMTP
 id l6-20020a056902072600b00dcd31727265mr2744024ybt.8.1712585361014; Mon, 08
 Apr 2024 07:09:21 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:14 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-10-smostafa@google.com>
Subject: [RFC PATCH v2 09/13] hw/arm/smmuv3: Support and advertise nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: bsHrE/aBjhKh

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
index 85b3ac6a9c..da47411410 100644
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
@@ -525,13 +548,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
 
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
 
@@ -704,7 +723,6 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
 
     /* we support only those at the moment */
     cfg->aa64 = true;
-    cfg->stage = SMMU_STAGE_1;
 
     cfg->oas = oas2bits(CD_IPS(cd));
     cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
@@ -887,28 +905,28 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
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
2.44.0.478.gd926399ef9-goog
