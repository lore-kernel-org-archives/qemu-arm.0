Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A704FCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:08:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbh-0004jL-3o; Mon, 22 Sep 2025 14:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbc-0004ez-3W
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbW-00044g-5h
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:42 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76e4fc419a9so4737357b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566974; x=1759171774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GeDVjFb3QFb5yHp7aGr6QIEnzzZoZpmvfgcLzDSF2qM=;
 b=wr3xDf6UqQbZW+TYaqzHQGo6/9MnYOzyiq+CfT3DKrzOwfAKTDlziGl53mCREvwGax
 gCs26K9mKQAm2dGgtJf5PfOIr80ZwTnj6TK4HdYwWn59x5QuHj3t4INA2wyZHiA0GW+Y
 1iab/gxt0O0icswuVXcJyXuQTvrs0ZgVhQRXL4W9FEPhlveUx+RMfG85dkmeTob0OGO+
 Ou+ECzZ8oqoHY2Eya7zmPGDMcBSYNLWYSMkB/UpbD9Dv5KbVlYa0G23X39x0sYnDoOjG
 SkbS6Lm5Az72UvVelROV8hRZkYXLm6Iq3csA8QFRcYZlaaG7hfO9fzb4zopNjUgho1kF
 mLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566974; x=1759171774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GeDVjFb3QFb5yHp7aGr6QIEnzzZoZpmvfgcLzDSF2qM=;
 b=bbwDlyY94hCwoJAHh/VTMozgeRnLOggMonvSqRcq4gpd2IGFU99ElA2BePquEupk6W
 Y35oNBMc8wFBHPtwsst2T8IBcjpr+wEOY0B/jrCniiqqdTC1cTpKFx8lSGtTy6OLzVl1
 QUd3BIe3LznuTqOjoxq5KVmZ3HiJNzV8iWHNS+3Mj/i5l3yVnJ4R3j7+4K2MjOMIrnFS
 tEm9IokmybrxnKp1pjthmHhJK2O0kyk14MociGccTFxHzvEmM5Cc2EnUhagQGYb7D59A
 BADcHns2eViq6v9GACms4phKzHUpi0yl0RzVeUuqRfDNFvpR8H53AmLITjbiOt5C2ibh
 l6Aw==
X-Gm-Message-State: AOJu0YyosQieJdbMDR0CiSywD0ensdKMng/RibvquXfP7X6MOoPSCEgF
 gB8uAVva4RXevMRldEpkvPQQqNGbzdjw1qbPuT4NeNb/VdQSp4NH59hiq66D1t6+bsI=
X-Gm-Gg: ASbGncv2585tVp2sCmvL71R7kw3qre7i5PZ41dBD45puRzU4JsPVATxGiI+Zd4zQ+lt
 0aOjowHE/U3JOwcW2Emm97xEj01QtjSAFPXm7d7ua/KTYnloMUTJvF/+AwPAg8/jmyETXs4vdCu
 Z9m5NfL/Li6+20wBEQDhbJYa/QgUBs+VA0nzoAmK9QJX+4rIx1vK37tUSdYQn8A3Aez9Kd5+2TR
 FzV68XO5Ly1yeHCTaMXkQJp9I2Vkje8qkxWRgZXNtYUfLhWpBMgMLdEpjtkne+XyTcHt/FKjb6V
 M2xSoKQBLnvpUmxiYHv91YKEE4ZAl/8WPx1VeelJtSj1dinCqw6qsLk9FTzlGG3ZEm+wSbtqJ5H
 IdWwnfSIGnLDyhtLWKe4BV1hyNC2N
X-Google-Smtp-Source: AGHT+IFjvZn/tzbQInVqrcT0+MESyQgeoosP4/eBV7g7bYlxPvDE9KdszICBtjaWfM6j2jlV9N9Ogw==
X-Received: by 2002:a05:6a00:4c16:b0:77f:d23:a1f3 with SMTP id
 d2e1a72fcca58-77f0d23a2d7mr15922006b3a.6.1758566974348; 
 Mon, 22 Sep 2025 11:49:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 06/76] target/arm: Populate PIE in aa64_va_parameters
Date: Mon, 22 Sep 2025 11:48:14 -0700
Message-ID: <20250922184924.2754205-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index b1263e4750..b7a1b69561 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1486,7 +1486,7 @@ static inline int arm_granule_bits(ARMGranuleSize gran)
 
 /*
  * Parameters of a given virtual address, as extracted from the
- * translation control register (TCR) for a given regime.
+ * translation controls for a given regime.
  */
 typedef struct ARMVAParameters {
     unsigned tsz    : 8;
@@ -1501,6 +1501,7 @@ typedef struct ARMVAParameters {
     bool ha         : 1;
     bool hd         : 1;
     ARMGranuleSize gran : 2;
+    bool pie        : 1;
 } ARMVAParameters;
 
 /**
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f64543dc78..1111a16330 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9372,11 +9372,12 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
@@ -9388,8 +9389,17 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
@@ -9429,7 +9439,13 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
 
@@ -9508,6 +9524,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .ha = ha,
         .hd = ha && hd,
         .gran = gran,
+        .pie = pie,
     };
 }
 
-- 
2.43.0


