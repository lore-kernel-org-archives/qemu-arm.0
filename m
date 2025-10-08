Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CBECAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:14:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9Q-0003wz-F9; Wed, 08 Oct 2025 17:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9P-0003wl-E8
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:47 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c90-0006dF-4z
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:47 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b5526b7c54eso160518a12.0
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960579; x=1760565379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQVWUvLcDou/AxWVkjzuguGXQD36QliqcWswbcaqJJI=;
 b=pBatbaAR17qFvO4NlMU3CeZV1P2wbvXC5y7Du+yxWN4NKLUsmo/oFP9LDTJ7/o9cXR
 TvVORUT42H1rpSD/RRHhdPmvv0XhYEfpsoJ/qXJc638Ey23xMPBQrwz7qBCTpnt+QV7Z
 AAnwo/1xJ5qULLFFK83kseG+fMn46NUgY6uixhgXQ+2hrM1AtEKNMnS4f0LFhQf7QSaY
 R7tCrGX/nxHjOyX1TUsE3B7vFQw2cikoxiXxABeg2tXZslj6BxRSN2DAfkj799ODgQwt
 rUb7La2jenzXWstQO2EPSx8aLwtHcXyu1gyDnkIIhyZVq0kZl/Tyx/2dtud1VaKn4hdD
 LLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960579; x=1760565379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQVWUvLcDou/AxWVkjzuguGXQD36QliqcWswbcaqJJI=;
 b=lzsA/T06RxNXbttP8ybJl6TdLr34oMECufU2pEmyuCcI/OfJyG/bekkth1AjsH3D83
 ek4a8zzE1cPVgzrUYKWnsIQNSoWPL3IjSCpCNKhFyOCbeltdMr0ZOgA409o5tveHJ2Hg
 UrUOV2y00wcJvABKCd7t0B6jPl70M2J9NBl7SkZZkpxAQugYYEDzN6VRnaY4zCC15oNy
 quN39gNjDThSbWM2hC0mWjEIu0O8Uqke04mZntXZO3afUmTaHja2gvmKvho2sGf5l9OB
 bDbiO2Vla6g4oGE65OQO3LgtSsphQM5DRrRS1dFueMUIK1xMiLWs87J24lCB4ugXuek6
 dkIQ==
X-Gm-Message-State: AOJu0YxCfllYBwNav3EcxroUu1OsYWc3xt4jpzywEb8i/C0NXmNck0fU
 NugKB+UKYbyRhTwfKEWp3un0xBGj1bv+r3NWti5U4ihxK1R/wx+i2OuPU60b+GJp4AY=
X-Gm-Gg: ASbGncsPOVEPy+Q3UR+/snTq5XUKekA/V691WmAbkGrTgtFB0cXKWbBuQBBFGX83oQ1
 Evky8ndAGNtUFMCop0FYVWqpOa3TiEAAzvbO0Tko/RNtef/XL353Dq/tM/PwGGR9/1Ov0kIHxDL
 meI8usLnh61Z4x+k+R/T9N/ZLurxdqooLqpIOX8ncJAwWlMvF23OhGpxCUOQRfGBOawCGcSXfek
 xbeMTFvPYrBo/2wnp4HEVvyYOz7javcji4R5aMIG610bXoAi4sqzhJVPy7I0S5a20lx0bz44TXw
 +oHHeUJc74coK/R/wqzfgH2bM3Z+FKVTN15F+gj9jeD4sqH/op6Vde+1vnfWEPvjoM8i7m6u2fh
 D6m5gNUnwX1hp2p30XqQMwSpNYpPkI2gHHqM4UeW6DFQoEjFUOYJoT+Jl
X-Google-Smtp-Source: AGHT+IHyChMPFRve0iq//XRfsI8/WyMhHAz0/pznFkr3Co/Vy6DFVo5EbBZV+6xkf4EkPM5nNqToJg==
X-Received: by 2002:a17:903:2a87:b0:25a:24f2:af00 with SMTP id
 d9443c01a7336-2902721305cmr73599595ad.12.1759960579447; 
 Wed, 08 Oct 2025 14:56:19 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 07/73] target/arm: Populate PIE in aa64_va_parameters
Date: Wed,  8 Oct 2025 14:55:07 -0700
Message-ID: <20251008215613.300150-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Select the PIE bit for the translation regime.
With PIE, the PTE layout changes, forcing HPD.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  3 ++-
 target/arm/helper.c    | 19 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1d958dbf68..face1019f5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1491,7 +1491,7 @@ static inline int arm_granule_bits(ARMGranuleSize gran)
 
 /*
  * Parameters of a given virtual address, as extracted from the
- * translation control register (TCR) for a given regime.
+ * translation controls for a given regime.
  */
 typedef struct ARMVAParameters {
     unsigned tsz    : 8;
@@ -1506,6 +1506,7 @@ typedef struct ARMVAParameters {
     bool ha         : 1;
     bool hd         : 1;
     ARMGranuleSize gran : 2;
+    bool pie        : 1;
 } ARMVAParameters;
 
 /**
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b7bc27436f..37865bf70e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9386,11 +9386,12 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    bool el1_is_aa32)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, tsz_oob, ds, ha, hd;
+    bool epd, hpd, tsz_oob, ds, ha, hd, pie = false;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
     bool stage2 = regime_is_stage2(mmu_idx);
+    int r_el = regime_el(env, mmu_idx);
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -9402,8 +9403,17 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
              * Thus disabling them makes things easier during ptw.
              */
             hpd = true;
+            pie = extract64(tcr, 36, 1) && cpu_isar_feature(aa64_s2pie, cpu);
         } else {
             hpd = extract32(tcr, 24, 1);
+            if (r_el == 3) {
+                pie = (extract64(tcr, 35, 1)
+                       && cpu_isar_feature(aa64_s1pie, cpu));
+            } else {
+                pie = ((env->cp15.tcr2_el[2] & TCR2_PIE)
+                       && (!arm_feature(env, ARM_FEATURE_EL3)
+                           || (env->cp15.scr_el3 & SCR_TCR2EN)));
+            }
         }
         epd = false;
         sh = extract32(tcr, 12, 2);
@@ -9443,7 +9453,13 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             regime_is_user(env, mmu_idx)) {
             epd = true;
         }
+
+        pie = ((env->cp15.tcr2_el[r_el] & TCR2_PIE)
+               && (!arm_feature(env, ARM_FEATURE_EL3)
+                   || (env->cp15.scr_el3 & SCR_TCR2EN))
+               && (r_el == 2 || (arm_hcrx_el2_eff(env) & HCRX_TCR2EN)));
     }
+    hpd |= pie;
 
     gran = sanitize_gran_size(cpu, gran, stage2);
 
@@ -9522,6 +9538,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .ha = ha,
         .hd = ha && hd,
         .gran = gran,
+        .pie = pie,
     };
 }
 
-- 
2.43.0


