Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1649682ejc;
        Fri, 11 Aug 2023 14:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoj/eM5UCwcn+pw2gC3m14kWbjhhzkHUigPAECzmqReanNqRu9apL6isOMeMY+oE8CK4G9
X-Received: by 2002:a05:622a:191:b0:410:3132:8265 with SMTP id s17-20020a05622a019100b0041031328265mr3642804qtw.10.1691790153361;
        Fri, 11 Aug 2023 14:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691790153; cv=none;
        d=google.com; s=arc-20160816;
        b=sONKkfPtYe5Wx8ieKxkFxFopg/ThhZZAgnXIvNtgaiai66P2eRxG3Re9WOqc+8s1w0
         WtH+YovI8mlJN2s+g9pd8S+kK/jtHGvk3o5PGTtwB2Ela8kq83uvrYzKR7V8vGZ1h1WP
         oZTgj6L9F46tVOL27SJR0FX+TJcV497lrvoGk9jf0NZBYDXmy23EvWUn/12NkPfwj8wX
         StKoxwMNttTvtkE4fUzo/P8hJ4xdRP3AJEXQHH3TWKLtSiyFLQPoa45Kt8NG3rf4UYm8
         I7gZ6yI9J9HID6uwIJs627jrT1IjbtR0pwQzNmfD0eMGqUq0sAEqEsNbTvOK9swOIENc
         hsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Tau8pgXUMuYC3xEwEgLgNu8xbGRCSUW71FNo8qIPNck=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=Irmql6elDFyxPylSxl94Xp21OwJRPD4r92tgpLDtg0UmzhPGeExUBGocSFcr8uAGHo
         vr+a3/++DFLoMh/kFtFKrqyfoSBdO0cKWUaJ6t3XAMM6i7pWb8ry38JayXWUQcJChk7q
         s25m2Owj3ghgYOy2PDMnC/i/Y0WZnRE43HNsL3TDYWKjWrkIW3TBs4cIL58RygtLBP42
         5HsQxIVxyGFbex7NtBxCj6WuHzmRTIfuwTHgvEY0G1Z82TNHhHKDgUNTdGQXw7N3kadF
         nRa1PWFl4ZdntmLLEtf491AJBukvGJvEyXzukVHxBmCdq947gUlPckR/M0oCHynFAd0c
         TA8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQDlvhHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a05622a064800b00403e7db8913si2896245qtb.124.2023.08.11.14.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 14:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQDlvhHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUZsH-0003BP-Go; Fri, 11 Aug 2023 17:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsF-00038L-FB
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:47 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsB-00028b-8v
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:46 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686f8614ce5so2223005b3a.3
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 14:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691790038; x=1692394838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tau8pgXUMuYC3xEwEgLgNu8xbGRCSUW71FNo8qIPNck=;
 b=qQDlvhHCPP1lE8R36jdKhzhWTJ1ttE+av5hD2ZmlriJIlbopuy+sOR8cPIFJJ5cHpr
 0bOM/eVDbBDSQkxXt+d8WQo/19BIRWG7gsugxX6trCiMMGyTUlQSpHj/mTst9ybo2+XJ
 WPKKupsY8jRRsCSjD0wqDSM5JCr6P+UGoZVXqaPeyLh50+dNxCsvgVzMCudmGTZuGgKf
 vQYjpUqWde+ecwacHpjlk3JLhAt3NNBOYo04i5nQOzrZyNaKQkkHxbj2EasUJNf7dbgg
 aMQytYJx+IascmSeTdzakQmUe6yOp18/VzKI1pOVBwt1ofM3v2o5HVjCOezZCb3qeFTc
 HKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691790038; x=1692394838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tau8pgXUMuYC3xEwEgLgNu8xbGRCSUW71FNo8qIPNck=;
 b=j12lU15u1zcJis8V4aEEPUz8kg27eH6uEE89Gh1JRAciP2iVb66n7WxzAYmPJMIh8T
 cH7UgZ1ZRjrVrHSZQVsvD5JXj2rnHfmQWXl9rgxa7L3yKAI4ufDtjzt84uFogmzHBRgT
 jNQ6mI68IKYuHMJvNqgqw9ImYBk42bC0C3JICTjsgoiDAkk+ghu6rlxYRKl9s154q9Ih
 qnZTX08uqqaU/iubsQ9MKVR/hQ5XxBxBnVUwc2pNuiZL4IT4UwE3ppZUehfgCInHvw3m
 Jf7Uut4mKgnC0stJjkBViIjxL87bB/+VEnaOtcTX4vw1L8tAyIS9dd7jd81ThyVTLLKt
 HoMg==
X-Gm-Message-State: AOJu0Yza4CbIzAKAFGIjDpRGdFVuNv+RykaVscAt7UFz7ArTpiilDEGc
 7dRd4yyyvT535z2VKYz1UXb+cQ==
X-Received: by 2002:a17:90b:90b:b0:261:685:95b6 with SMTP id
 bo11-20020a17090b090b00b00261068595b6mr2639117pjb.13.1691790038318; 
 Fri, 11 Aug 2023 14:40:38 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 gk18-20020a17090b119200b00263ba6a248bsm5723840pjb.1.2023.08.11.14.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 14:40:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 06/11] target/arm: Apply access checks to neoverse-n1
 special registers
Date: Fri, 11 Aug 2023 14:40:26 -0700
Message-Id: <20230811214031.171020-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811214031.171020-1-richard.henderson@linaro.org>
References: <20230811214031.171020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kF4burIkWshD

Access to many of the special registers is enabled or disabled
by ACTLR_EL[23], which we implement as constant 0, which means
that all writes outside EL3 should trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h    |  2 ++
 target/arm/helper.c    |  4 ++--
 target/arm/tcg/cpu64.c | 46 +++++++++++++++++++++++++++++++++---------
 3 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 14785686f6..f1293d16c0 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -1077,4 +1077,6 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+CPAccessResult access_tvm_trvm(CPUARMState *, const ARMCPRegInfo *, bool);
+
 #endif /* TARGET_ARM_CPREGS_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f5effa30f7..ff3ea2abf8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -319,8 +319,8 @@ static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 /* Check for traps from EL1 due to HCR_EL2.TVM and HCR_EL2.TRVM.  */
-static CPAccessResult access_tvm_trvm(CPUARMState *env, const ARMCPRegInfo *ri,
-                                      bool isread)
+CPAccessResult access_tvm_trvm(CPUARMState *env, const ARMCPRegInfo *ri,
+                               bool isread)
 {
     if (arm_current_el(env) == 1) {
         uint64_t trap = isread ? HCR_TRVM : HCR_TVM;
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 00f39d42a8..bc3db798f0 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -463,10 +463,30 @@ static void aarch64_a64fx_initfn(Object *obj)
     /* TODO:  Add A64FX specific HPC extension registers */
 }
 
+static CPAccessResult access_actlr_w(CPUARMState *env, const ARMCPRegInfo *r,
+                                     bool read)
+{
+    if (!read) {
+        int el = arm_current_el(env);
+
+        /* Because ACTLR_EL2 is constant 0, writes below EL2 trap to EL2. */
+        if (el < 2 && arm_is_el2_enabled(env)) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        /* Because ACTLR_EL3 is constant 0, writes below EL3 trap to EL3. */
+        if (el < 3 && arm_feature(env, ARM_FEATURE_EL3)) {
+            return CP_ACCESS_TRAP_EL3;
+        }
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
     { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      /* Traps and enables are the same as for TCR_EL1. */
+      .accessfn = access_tvm_trvm, .fgt = FGT_TCR_EL1, },
     { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -481,13 +501,16 @@ static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
     { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
     { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
     /*
      * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
      * (and in particular its system registers).
@@ -497,7 +520,8 @@ static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
       .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },
     { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010,
+      .accessfn = access_actlr_w },
     { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
       .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -512,16 +536,20 @@ static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
       .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
     { .name = "ERXPFGCDN_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
     { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
     { .name = "ERXPFGF_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
 };
 
 static void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
-- 
2.34.1

