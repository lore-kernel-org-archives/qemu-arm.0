Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E455ECCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 20:20:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7Jae-0000WT-BI; Fri, 10 Oct 2025 16:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaK-0000Pa-5B
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:29 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaF-0002ly-Lf
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:27 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7930132f59aso3500620b3a.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 13:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760127561; x=1760732361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lKDWM9JOJL4Z7fwX++JRpG4RVDnGvsCntxjMTQCvPsg=;
 b=LKYxU5i1gtVY38P4Rrfqnb091qkqkAEUhBzkkX7ppUSdrcIlgy68ME0uqnSGExAAiS
 jd07YpfKaWailSmnPDpTGUdxTnXSJ03p+E0wf6SkPkP5J3gtHjb3OrY6E5YbTwF7ZK7l
 bMtFX2nExRktqjn1UHWWsBIJOhjxchwgFnQJpsRMQz3R63wm/fNlCMkdUJXUPY6uCvMR
 wP3QfC+K+JoC7K5uPm+vJYEdEzKbCtse+BfjyKlddhKOrp2A4HDAgz7IAnYFsrBarO8y
 C5tIKyLBABpd4n7D12JMnvA4/LGOZqkx8HR+YQR3d6CUg+TTo/Kg++IzbNfeiUG8+r/v
 jKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127561; x=1760732361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lKDWM9JOJL4Z7fwX++JRpG4RVDnGvsCntxjMTQCvPsg=;
 b=cNZQLxIsNAda8NhTjE5KKSSgmqSwyT4WBfPoYqka9eYlrFLmE4jowQDYBbXqIhfL1S
 Tp6/iPH3IT6c6XTMvDeWZb7i8uhtP7Q7pVJ03BDAyk04+Yg5rKmxwlhykQsMoiIDPUCU
 9bv2MeHV8J6lAcIbEo9RFbj89R/lgjvHgIsZhIT7/hv/HMk6uwWeQeMvHcy93bE2rK4P
 eU6d4aw/sRDTMxRy8uy9D4Dp0cDytrwiw1tM1kPvQP+IG6yVJmuY/8zBXBvA1tSAuYBS
 5MsI4cGk923H9lo4dippZWNAJq3b4+XQvXFg15ZnPTYtq1h4M5/oCpUC6IPfK1/43U5r
 BoDQ==
X-Gm-Message-State: AOJu0Yz2i0YrMYbW6lJIqjiqgB220ag/b2xbzf0zYQdw8xyaIkuzM7uI
 l8AaUNlotbHFY8bGodoUeoOGHmrNMV1oNIveMmN/TAPnNhObKVIdBEVO4W7ckHRPoTeHuYlbKsG
 Ew+mSJjk=
X-Gm-Gg: ASbGnctkR71Jc4YqSC06C6GPdMyQKxovx/a+A/Lr27qaTgXhaXBtKvC2w/AtkZKKPZr
 jwe2TeysoZ9YgL/4nkPMNJIavw/rn80+tWUhRhe3cnlWyI5GyDT0G/KMBAvQzSverKZX9zLgaYk
 6jNt1OIONWDSDAiZC6TSGP6GkJju9FGnv3D1ObpP1nVp3mHYLiaOIF83SBdoVHvdxDOmQZjzC6w
 4QgLjOuGyg0RhSTUX4kohXhoQaue+yHbQpaCbLJDLCT9xM5XSet8mtfSeIWu5a8k/otaowk56XT
 8KhVOvKHuEBvR+77r57NbHuQtPuGXrupnUoO/6luHDftBpZZBp7IuSyS/z9ZY2zuUpvLVRJqGUR
 DTRbzAwQtSvIbpp5k5MAj+tlqFv1XqNUp5aeOxprNfWkUOrHV2QmxHERemlsTj0czXRmqzAH+
X-Google-Smtp-Source: AGHT+IEBFVi/+kricpkeclHcP9sh9XWEFi+pL5UzcNnL5re0LVXz4iFq+eC3dOX7dCbgye/cAW41hA==
X-Received: by 2002:a05:6a00:8c8:b0:781:2538:bf95 with SMTP id
 d2e1a72fcca58-793858fb6d4mr15043291b3a.10.1760127560844; 
 Fri, 10 Oct 2025 13:19:20 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd7ee5bsm3764830b3a.85.2025.10.10.13.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 13:19:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/7] target/arm: Add AIE to ARMVAParameters
Date: Fri, 10 Oct 2025 13:19:13 -0700
Message-ID: <20251010201917.685716-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010201917.685716-1-richard.henderson@linaro.org>
References: <20251010201917.685716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Allow the bit to be set in TCR2;
extract the bit in aa64_va_parameters.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 30 +++++++++++++++++++++---------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f539bbe58e..a65386aaed 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1391,6 +1391,7 @@ typedef struct ARMVAParameters {
     bool hd         : 1;
     ARMGranuleSize gran : 2;
     bool pie        : 1;
+    bool aie        : 1;
 } ARMVAParameters;
 
 /**
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e4d1651440..8c0b8889db 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6098,6 +6098,9 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_s1pie, cpu)) {
         valid_mask |= TCR2_PIE;
     }
+    if (cpu_isar_feature(aa64_aie, cpu)) {
+        valid_mask |= TCR2_AIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
@@ -6111,7 +6114,10 @@ static void tcr2_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_s1pie, cpu)) {
         valid_mask |= TCR2_PIE;
     }
-    if (cpu_isar_feature(aa64_mec, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_aie, cpu)) {
+        valid_mask |= TCR2_AIE;
+    }
+    if (cpu_isar_feature(aa64_mec, cpu)) {
         valid_mask |= TCR2_AMEC0 | TCR2_AMEC1;
     }
     value &= valid_mask;
@@ -9666,6 +9672,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd, pie = false;
+    bool aie = false;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -9688,10 +9695,12 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             if (r_el == 3) {
                 pie = (extract64(tcr, 35, 1)
                        && cpu_isar_feature(aa64_s1pie, cpu));
-            } else {
-                pie = ((env->cp15.tcr2_el[2] & TCR2_PIE)
-                       && (!arm_feature(env, ARM_FEATURE_EL3)
-                           || (env->cp15.scr_el3 & SCR_TCR2EN)));
+                aie = (extract64(tcr, 37, 1)
+                       && cpu_isar_feature(aa64_aie, cpu));
+            } else if (!arm_feature(env, ARM_FEATURE_EL3)
+                       || (env->cp15.scr_el3 & SCR_TCR2EN)) {
+                pie = env->cp15.tcr2_el[2] & TCR2_PIE;
+                aie = env->cp15.tcr2_el[2] & TCR2_AIE;
             }
         }
         epd = false;
@@ -9733,10 +9742,12 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = true;
         }
 
-        pie = ((env->cp15.tcr2_el[r_el] & TCR2_PIE)
-               && (!arm_feature(env, ARM_FEATURE_EL3)
-                   || (env->cp15.scr_el3 & SCR_TCR2EN))
-               && (r_el == 2 || (arm_hcrx_el2_eff(env) & HCRX_TCR2EN)));
+        if ((!arm_feature(env, ARM_FEATURE_EL3)
+             || (env->cp15.scr_el3 & SCR_TCR2EN))
+            && (r_el == 2 || (arm_hcrx_el2_eff(env) & HCRX_TCR2EN))) {
+            pie = env->cp15.tcr2_el[r_el] & TCR2_PIE;
+            aie = env->cp15.tcr2_el[r_el] & TCR2_AIE;
+        }
     }
     hpd |= pie;
 
@@ -9818,6 +9829,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hd = ha && hd,
         .gran = gran,
         .pie = pie,
+        .aie = aie,
     };
 }
 
-- 
2.43.0


