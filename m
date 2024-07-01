Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286621njm;
        Mon, 1 Jul 2024 04:03:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWDFRx7PRxL7d/sogCP3QUClGzOZ3hbqmTo3ePAR3lYj6O2eGRngC2cqPtW9D+U3FUXaHExqOeHQ0ZWnYXjyMnyiEIO4Yb
X-Received: by 2002:a5b:c03:0:b0:e03:2333:a6f0 with SMTP id 3f1490d57ef6-e035bf4f044mr5525305276.10.1719831826914;
        Mon, 01 Jul 2024 04:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831826; cv=none;
        d=google.com; s=arc-20160816;
        b=Yn5V+WlBKHgS9+atIPziqF1746aKW4i/ZXMGa7wv/0sU5MhxAssuw20jk3xo6WEaoX
         ZJPrVzCIQ9OzLJRn9VhgEAqpRiGQfowdyIY+0YH6HtQbvRIzxb2IO9rpEMpux8Mgz5gJ
         DQS/GWO9L0JyWzYDl44IXmO7FHaaQt4GNLA+gm1COPBpCre+OvPaqcQkyt3ucuudXF9l
         7t2aNorVFBLlws+xoafV7Y1g2VAVwPcPKkXF8/0O+u5PC6aWc11AolLwjmNpbBEOIPzB
         gadaONXK667HJ4B0+sZcBO9447aqXNTsLJQ/ipp8YPFBuc1nMuzAhdM7v/N3UNr95oij
         tsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=sNbHX8nqDYpOLRvymfwhnJH75L2FVhdf8IpttBXPNL4=;
        fh=b057Zb9wBHTzKo9LwETgurnkRVPk8AxFx/b+pjQ73C4=;
        b=zTM32dP8ZQHHo92OV3eYDlpOLUob2aV45kUVrkhPxCrbMohUNBPQenZYM4P8KmLUf+
         0J5oMfL1ssGxu8lV/l8TpfuoZNujaytNEfOn5rdfmwUVYR3rnc/ZmWan65VYjhOjzoav
         WFmcHDi516Xo99QiwfL5B7RDFXv1gVKyy+K5p28WpKPZqU7bVOieR5aJZikEYR9QpGR3
         PnsrVnQU9ze5VA6/qSdf0H/2pOsmQApuVXVxx23M/qNXypSXxCTSCGmBb0D8gjAtptNc
         BcrZympjUd7X+biXvKVoQSZvbwXcRtbRQ8F5kHI1U6o9+DbL4ZU85OdHE50RBH6rjoTR
         iiDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JTgAA4aq;
       spf=pass (google.com: domain of 3eo2czggkc3ehbdhipupvddvat.rdbpatm.qtccttaxcpgd.dgv@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3Eo2CZggKC3EhbdhiPUPVddVaT.RdbPaTm.QTccTTaXcPgd.dgV@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3Eo2CZggKC3EhbdhiPUPVddVaT.RdbPaTm.QTccTTaXcPgd.dgV@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0353ed6cc7sor3766409276.9.2024.07.01.04.03.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3eo2czggkc3ehbdhipupvddvat.rdbpatm.qtccttaxcpgd.dgv@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JTgAA4aq;
       spf=pass (google.com: domain of 3eo2czggkc3ehbdhipupvddvat.rdbpatm.qtccttaxcpgd.dgv@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3Eo2CZggKC3EhbdhiPUPVddVaT.RdbPaTm.QTccTTaXcPgd.dgV@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831826; x=1720436626; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNbHX8nqDYpOLRvymfwhnJH75L2FVhdf8IpttBXPNL4=;
        b=JTgAA4aqSX/GFh6GCSPs1C1jzWv0KHQU1v7ztj0JSOpWrY6WbLcPaZ4YD4a6JyJGQK
         Tk3CVgrGyyaQP4jnYsOc/4e61Y+PmjInYlOxfINnRkX8qoASt3/5Mu//rZBfhSiOymTL
         Llr2oOsXU+qK12mrMzBZfLjDTvIAJhKuqWmkt5FxZQ+Sb+Oq3qck6VR9Plq/3Da8g+kq
         oNZWpdjo48gHKl74dl24LbwBsZfhbZFXXvLAMgBk6hAcQ+T4IkP4GhjnVbti/Aqhvfpg
         +vNbrXE8thLOqlwewGVyLDLv/Qz5bYWYFrETGifzyVkatlYI7tI1SClKWuYh9U3tkckD
         jMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831826; x=1720436626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNbHX8nqDYpOLRvymfwhnJH75L2FVhdf8IpttBXPNL4=;
        b=I6c+Qt3B0cN8YTNQkEpCch8hzu2qow8AN6M9gR0vo5NRZaW06yn/pIn8MrSP+gE+bR
         l6FbrHUpWdrFVA0744mahP+mKhAY9kCaPy2FRgPUi1OA+cfE4WhEx1jvZlMXNQr0495p
         FR3uqpF8/3/QDjNiUoTY5JvavXrlV3C/7gRASof94vE721IVLMu3SfNMTtmn2vG9qpCB
         +IlRKsHpGtAadFol5GP7/Pr7Sie0tUWn4cVnmMQosfTJR28m3Hse3xVGxPa4SfA6k5lD
         Ac9BWKbXJzBE5T3WwGmuVNkXjkYZOEmfW4wX3Ebc7IsN7xn91bz+nKhYB/L1ZKhypWdk
         PxHw==
X-Forwarded-Encrypted: i=1; AJvYcCUdOB6/xllg/Ez74y58a3y879FDXv96TyHoECm7J52FzK9iVMYnRdMqmKuloAvbF/rkrFyeFyxkQbxNiAQ6oKOIfeNpqAsR
X-Gm-Message-State: AOJu0YwSDGiZaPGDehOqBan8VhKpiu0CeUcc7WUj5VD7H23xF8tzXrns
	cZmH1Cz3kkcNb4mzHz0umgABcxfbX6I4ihyx7eRvUk+DckEVDxRFN41tcBukZrDaGEpISW4NrP+
	iQe/fYvLpoQ==
X-Google-Smtp-Source: AGHT+IG9LUycpUctA+hUPQMuLbv0IwlMNM88J6rS7LprZNCXDvKBB2hWGR8rlIoR8I6PGZDwkYIWTuhS/ZMyzg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:dbd3:0:b0:e03:60b4:b7a with SMTP id
 3f1490d57ef6-e036eb22e40mr249373276.6.1719831826547; Mon, 01 Jul 2024
 04:03:46 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:39 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-18-smostafa@google.com>
Subject: [PATCH v4 17/19] hw/arm/smmuv3: Support and advertise nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AlES56Mxi/Yc

Everything is in place, consolidate parsing of STE cfg and setting
translation stage.

Advertise nesting if stage requested is "nested".

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 6c18dc0acf..807f26f2da 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -261,6 +261,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
     /* Based on sys property, the stages supported in smmu will be advertised.*/
     if (s->stage && !strcmp("2", s->stage)) {
         s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
+    } else if (s->stage && !strcmp("nested", s->stage)) {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
     } else {
         s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
     }
@@ -425,8 +428,6 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
 
 static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
 {
-    cfg->stage = SMMU_STAGE_2;
-
     if (STE_S2AA64(ste) == 0x0) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 AArch32 tables not supported\n");
@@ -509,6 +510,27 @@ bad_ste:
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
@@ -525,13 +547,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
 
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
 
@@ -704,7 +722,6 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
 
     /* we support only those at the moment */
     cfg->aa64 = true;
-    cfg->stage = SMMU_STAGE_1;
 
     cfg->oas = oas2bits(CD_IPS(cd));
     cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
-- 
2.45.2.803.g4e1b14247a-goog
