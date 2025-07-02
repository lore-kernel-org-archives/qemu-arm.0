Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3704909qtb;
        Wed, 2 Jul 2025 05:35:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWH34IKc+QCam3YfN5b1f7NlauzPjxMMubX2/EA/7Xgwjnoro/sWuHLcq5n2FGNwVyr/gVTf0N87BE5mw==@linaro.org
X-Google-Smtp-Source: AGHT+IEMZxH9xgtLAh6yleRW/8D27ho023ji6YOzw+sKwHFjrFgJHwMKEnNi4x9wXV23FnF3nDM7
X-Received: by 2002:a05:620a:1992:b0:7d4:58d6:2c63 with SMTP id af79cd13be357-7d5c4748b1dmr415806185a.22.1751459733324;
        Wed, 02 Jul 2025 05:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459733; cv=none;
        d=google.com; s=arc-20240605;
        b=a5pxJMF8eZUZoWEDuRO776DA8uyqWlBOSJCcpiP55pwYrWLwDAoz0Bx0hjieVHPDsH
         wTy6TBnNdQG+EXuhOoGr73P+rVoM4mnTNV9WRg2ly2VpxYVVE07cTxwtT71j2KNITF/p
         6E/7TJO5DF5vEzYGW2d6A3Dms6PPevqGtkfvkCMV0H/voJuOrsY92eCEcTG+lXlumOnO
         wNhJpzEayM5j8Mx9YtSpKC1iDMYkkbPpGF9DI2EIeDSHxZHNW1m91XGzkSvYk+wuHNj1
         nRPHsCI2ypopj9295E4SqtqZrWB6dkr62tnKPV5mxUDavKyEI1Lt9tKNMySs0tcvS6WN
         7EDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pSqaS831N83InmzeCaQegnhiZ0zBwsBesGxo2ZWt3Jk=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=O2KG7d4GajAUMfTk5Q82CvqGDodXVWtN5+hi3aAj9xmH8ivNuK3rBiWVXUz/C13xLZ
         4LDze6j1hMFmjdtGAYJ0SlMSxaQjbqDAVf+iutiLgO2JI5Q/mPW4ZVlHy+2xG23ZVK4W
         Ux8ZI9VzWrrHNSvyQX1Wck73Ys1I4jPAfuhZ2KFaI/dy6OPKhjsxloyYxh2m7iz87yEU
         zC1+Ie9I07iUVFG3zkdHGX6SMCF+QtCyDStTCwYTKvSzpKRzGJjvjoPQFFBVQIgYCt5x
         vW3zgzGoMUxIkoSuUVru9LSqMIw0fvoIpsHBTQJJNhJ2OpW1BSC7rlymz8tuxdClBeCL
         MmYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TT49HAn7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44328a336si1133547185a.528.2025.07.02.05.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TT49HAn7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWwfh-0007Wv-Kc; Wed, 02 Jul 2025 08:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfe-0007Uz-79
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:34:38 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfO-0000vx-HW
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:34:37 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ea58f008e9so3755998fac.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jul 2025 05:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459660; x=1752064460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSqaS831N83InmzeCaQegnhiZ0zBwsBesGxo2ZWt3Jk=;
 b=TT49HAn7LCqRqHGThDZjvCswesEZceo/bt20Ds559ZNn6fXciMUEtqFM+MwJQQC0QV
 Fb+EMkuMn6VtDd8tCnGldn93LDBcMxQx68Ekk7B2ICSeTVvGkxhaOJL6YdHpuWTv19Zj
 MR8BLx/bU4PARk8SgE1XQ+R+G7cnEyJrJeZE0LcmESLsDvxd6DWaz7EofAmvcKGONHtp
 DU5KGBzMmwEtwkqjve4uXMT0PiVZBxMPHocaMr9Dqzbo3KY0ksyma1c/b75M77kluccU
 WBFu0CmNqJ+yMcLeSUCk80bQwKYt67Y1oNCyZn9rTZeQSyT71ah1K0hdFktXvfkbPuZq
 ZJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459660; x=1752064460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSqaS831N83InmzeCaQegnhiZ0zBwsBesGxo2ZWt3Jk=;
 b=rI1+8s/8DFlCyXWFnj4y3yq+clMeKn1tF1wYwZq5gKjC8LerI6TrJ8z9f+K419Fn9A
 HFHZzf1NWA6SHElK7ZJ6rqJ3e4vkVqwwdrN6wp1e1P2S4xgPuGRemVCUEx+ywYu+NtqS
 oCc99G7yYsWNIadOSqZPjAJpe3wWUUY+qQOVPGFv+R+v99ujZpy+YlyS12+qC8WUdDIz
 8I1/LKgOGk3Ou84WDQurqYeEHi2jPuo3lnf0NelBrx3QuQXMt8xfks+Xy+ta9KNWcDUe
 QrBoUi5vWS4CTzxW7K6REuxzsdxsrpjM0DBwmzNIukqKmOQPkQduGwFbnmq8mbPshlLy
 JaAw==
X-Gm-Message-State: AOJu0YwDJjjzAhyGISEk9iY0AYkkRe7z06uYX38AliynAKFDQSRUvw3h
 APm0jnqa/8T6s2nVlzTEG1HmZW5YYwoeiGcW6TVUWDyouxR2RDcIjil5HBG0QP4jwLd4Pn+/HKz
 QLixt4kw=
X-Gm-Gg: ASbGnctuKqTp9MI/TsTNWhXpE2/6s/uSCEW90FXW/FWvY0iVjmmc6CDA0+bAP09lTOF
 OPjcdKlUM2TDKLSU5oZzieUesNheNK3+kHP+nGUl26yjmDxU1XwIeV+91ytnmvLIMEeiBYrooeP
 YksR4AqNejFG/R8Lds8T4x12TmVWYFhp2k4wjJxS3DsSohQl4L/poDiitFHXyc0LjSrj4BBwAqS
 k93hN1EZcJbSpbO8vgW7srk1WZ/U1IUX4+DKBdTabqbWg7Y0ePVi0LVWUv2pUoO1P2JA3FpwMDE
 t5UKqUZgUuRVbWoSHO54dVXnU8tpo2JeN8oPEAp4chM61/Zmuxp1ONVcaNtkopLXUPrRzQ==
X-Received: by 2002:a05:6871:6188:b0:2e9:11c9:1093 with SMTP id
 586e51a60fabf-2f5a8c68719mr2047226fac.31.1751459660341; 
 Wed, 02 Jul 2025 05:34:20 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 06/97] target/arm: Add zt0_excp_el to DisasContext
Date: Wed,  2 Jul 2025 06:32:39 -0600
Message-ID: <20250702123410.761208-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qPNdd+u2OCe4

Pipe the value through from SMCR_ELx through hflags and into
the disassembly context.  Enable EZT0 in smcr_write.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  2 ++
 target/arm/tcg/translate.h     |  1 +
 target/arm/cpu.c               |  3 +++
 target/arm/helper.c            |  6 +++++-
 target/arm/tcg/hflags.c        | 34 +++++++++++++++++++++++++++++++++-
 target/arm/tcg/translate-a64.c |  1 +
 6 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f3c83702f4..2f2c131613 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1497,6 +1497,7 @@ FIELD(SVCR, ZA, 1, 1)
 
 /* Fields for SMCR_ELx. */
 FIELD(SMCR, LEN, 0, 4)
+FIELD(SMCR, EZT0, 30, 1)
 FIELD(SMCR, FA64, 31, 1)
 
 /* Write a new value to v7m.exception, thus transitioning into or out
@@ -3068,6 +3069,7 @@ FIELD(TBFLAG_A64, NV2_MEM_E20, 35, 1)
 FIELD(TBFLAG_A64, NV2_MEM_BE, 36, 1)
 FIELD(TBFLAG_A64, AH, 37, 1)   /* FPCR.AH */
 FIELD(TBFLAG_A64, NEP, 38, 1)   /* FPCR.NEP */
+FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 1bfdb0fb9b..5153824a49 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -70,6 +70,7 @@ typedef struct DisasContext {
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sme_excp_el; /* SME exception EL or 0 if enabled */
+    int zt0_excp_el; /* ZT0 exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
     int svl;         /* current streaming vector length in bytes */
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f7cbdd6814..3ceb8d87f4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -635,6 +635,9 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
                 env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
                 env->cp15.scr_el3 |= SCR_ENTP2;
                 env->vfp.smcr_el[3] = 0xf;
+                if (cpu_isar_feature(aa64_sme2, cpu)) {
+                    env->vfp.smcr_el[3] |= R_SMCR_EZT0_MASK;
+                }
             }
             if (cpu_isar_feature(aa64_hcx, cpu)) {
                 env->cp15.scr_el3 |= SCR_HXEN;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 617097a9e7..2edd43bb2f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6682,10 +6682,14 @@ static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     int cur_el = arm_current_el(env);
     int old_len = sve_vqm1_for_el(env, cur_el);
+    uint64_t valid_mask = R_SMCR_LEN_MASK | R_SMCR_FA64_MASK;
     int new_len;
 
     QEMU_BUILD_BUG_ON(ARM_MAX_VQ > R_SMCR_LEN_MASK + 1);
-    value &= R_SMCR_LEN_MASK | R_SMCR_FA64_MASK;
+    if (cpu_isar_feature(aa64_sme2, env_archcpu(env))) {
+        valid_mask |= R_SMCR_EZT0_MASK;
+    }
+    value &= valid_mask;
     raw_write(env, ri, value);
 
     /*
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 1ccec63bbd..59ab526375 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -214,6 +214,31 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+/*
+ * Return the exception level to which exceptions should be taken for ZT0.
+ * C.f. the ARM pseudocode function CheckSMEZT0Enabled, after the ZA check.
+ */
+static int zt0_exception_el(CPUARMState *env, int el)
+{
+#ifndef CONFIG_USER_ONLY
+    if (el <= 1
+        && !el_is_in_host(env, el)
+        && !FIELD_EX64(env->vfp.smcr_el[1], SMCR, EZT0)) {
+        return 1;
+    }
+    if (el <= 2
+        && arm_is_el2_enabled(env)
+        && !FIELD_EX64(env->vfp.smcr_el[2], SMCR, EZT0)) {
+        return 2;
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->vfp.smcr_el[3], SMCR, EZT0)) {
+        return 3;
+    }
+#endif
+    return 0;
+}
+
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -269,7 +294,14 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
             DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
         }
-        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
+
+        if (FIELD_EX64(env->svcr, SVCR, ZA)) {
+            DP_TBFLAG_A64(flags, PSTATE_ZA, 1);
+            if (cpu_isar_feature(aa64_sme2, env_archcpu(env))) {
+                int zt0_el = zt0_exception_el(env, el);
+                DP_TBFLAG_A64(flags, ZT0EXC_EL, zt0_el);
+            }
+        }
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7f8671e2e8..4ad2a9d1bf 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10141,6 +10141,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->trap_eret = EX_TBFLAG_A64(tb_flags, TRAP_ERET);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
+    dc->zt0_excp_el = EX_TBFLAG_A64(tb_flags, ZT0EXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->svl = (EX_TBFLAG_A64(tb_flags, SVL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
-- 
2.43.0

