Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24271CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:22:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4jf-0006Ox-63; Tue, 26 Aug 2025 21:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hx-0001lD-1Y
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hm-0000Iz-GJ
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:12 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b4c1aee9ecbso291798a12.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257119; x=1756861919; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbQjJBUTfyF1LG/ZjQbeKDSBiuqkUEwYI9qrxKdqL20=;
 b=WHylZzt7AxKN5YJ+AhAfvx1qmdgVsXDBNeThGNtE+Dw41iJOdpT0nWxEQtNXtOuSbs
 VPob8XLKc0xDAxEeh+Zv8bIfEoJPoaamcZbZByXmHGf2yzA0J3K/fQx75npc9VO2e07i
 a+nklnx/KIkqDpNxxFoJjHOhSGAdwbjcw9QUiuBn2nsFhp3D0wPS6/PqNbGu4lRjFsa+
 fuNNjwi/z1DoSQKkqT39uCHWQSfiT+P4XE8dTtZxN1k7RpCwDtrdPv1OFp43FD6KhV2G
 /DgGj+PWc/hOJjnvH4BGp9deOh865w2uVURKjLILo7CbBDxjnTnWLd3IkP6TPrG9Rbe/
 ScCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257119; x=1756861919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbQjJBUTfyF1LG/ZjQbeKDSBiuqkUEwYI9qrxKdqL20=;
 b=hwWQLxl/xYLYaPcqOf4kbnAQDkMmiRoM18TDxAvoIlejdhTyygjBSFkcyuzgVGroIh
 fwIGy63N+zG7sF3nnuhYTQFXLFLLCSPkWgBJNbNCirT0U71GZaBKBZmsgm4uTnvgTdzS
 sXLF1h3IfSo338ePoRiApq7pJ9vqS1CJ08+R1NL5nSa0kXEM4Y81CkCfqdnn5/uiBgjQ
 PB/8wzqPYAd85WszjcLly+NUpZdlCgojmRayO5chaYMJgXIw+PIBizneFafb+2yc/je/
 ojRJiaq12D5ZDzcnSJzTivjfRcEf9BZydycYSzyd/bxRglRv7HYl2mjw0z5wdyXzlzMu
 H1hg==
X-Gm-Message-State: AOJu0Yyl6GvpEb88f4nPKhf0+HYUmpc32lp9YBWOh2KfxqnC5tmhoKG5
 jjvKkn+mHCagg4YBEfZkTiqcQGM+ZkfHLOfHbOt68PirrmnYbQwVWpBozLPvUuQrwkjrOey+N1x
 tI6qbbCs=
X-Gm-Gg: ASbGncsyYJJTyFBu1Tbb8jjqng09iC2ak8D9ApRUjV6qIt50iPuNzNCy03hhx9UPyuT
 RvNgU43qI65Chs/JXZUE8Z1Y/D0m3kpuCuldyaU4wxGTXsVXPInoLlHKERDChk3Ahwa5xV9L4mx
 emJTKQ2KNm2rJkABCMuj3KjKaLJFxSOje3IcpBfuowSr+YpLnd4Qs3u6V8Hkj6Gxv1/tGSkhwtp
 Je6OfUnOOE4mBPGjvHD1Pt3JFv8fEGoqMLMVH0LVUBDVtpdhoiQO+zZLnq5ts7vACiyjWoqvY3B
 ST40+6vOEJCA62W6J567bCPr6Rqp/u2G0/OCAxlIasi+V+T8qY7vAewxYjMU79tySO2e/4jKOLh
 y6o97ZQ2RBTwpuWCXF0atuHa0krjERJzVl0KL
X-Google-Smtp-Source: AGHT+IH6KcW1ePCJacwG41k8Q+hEkMj2EKJMYcBPybeyHgrW2G+hCAYAFQ67RkxHVO03u6VVbngTVQ==
X-Received: by 2002:a05:6a20:12c8:b0:243:78a:82cd with SMTP id
 adf61e73a8af0-2438fad26d8mr4578125637.26.1756257118623; 
 Tue, 26 Aug 2025 18:11:58 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 56/61] target/arm: Consolidate definitions of PAR
Date: Wed, 27 Aug 2025 11:04:47 +1000
Message-ID: <20250827010453.4059782-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Create a function define_par_register which handles the 3
distinct cases for PAR.  It is easier to understand with
the definitions all in one place.

Make the aarch64 to be the primary definition, when present,
rather than being an alias of the 64-bit non-secure aa32 reg.
Remove the unnecessary .writefn from the aarch64 defintion,
and drop it from the 32-bit definition with LPAE.

Remove the LPAE test from par_write, since it will no longer
be used in that situation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 103 +++++++++++++++++++++++++++++++-------------
 1 file changed, 73 insertions(+), 30 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6f20d3986e..0282e41c59 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2439,9 +2439,7 @@ static const ARMCPRegInfo gen_timer_ecv_cp_reginfo[] = {
 
 static void par_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
-    if (arm_feature(env, ARM_FEATURE_LPAE)) {
-        raw_write(env, ri, value);
-    } else if (arm_feature(env, ARM_FEATURE_V7)) {
+    if (arm_feature(env, ARM_FEATURE_V7)) {
         raw_write(env, ri, value & 0xfffff6ff);
     } else {
         raw_write(env, ri, value & 0xfffff1ff);
@@ -3235,10 +3233,11 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
     { .name = "AMAIR1", .cp = 15, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "PAR", .cp = 15, .crm = 7, .opc1 = 0,
-      .access = PL1_RW, .type = ARM_CP_64BIT, .resetvalue = 0,
-      .bank_fieldoffsets = { offsetof(CPUARMState, cp15.par_s),
-                             offsetof(CPUARMState, cp15.par_ns)} },
+
+    /*
+     * The primary definitions of TTBR[01]_EL1 are in vmsa_cp_reginfo[].
+     * Here we need only provide the 64-bit views for AArch32.
+     */
     { .name = "TTBR0", .cp = 15, .crm = 2, .opc1 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_64BIT | ARM_CP_ALIAS,
@@ -3253,6 +3252,71 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
       .writefn = vmsa_ttbr_write, .raw_writefn = raw_write },
 };
 
+static void define_par_register(ARMCPU *cpu)
+{
+    /*
+     * For v8:
+     * The aarch64 reg is primary, since it might be 128-bit.
+     * The aarch32 64-bit non-secure reg is secondary to aa64.
+     * The aarch32 64-bit secure reg is primary.
+     *
+     * For v7:
+     * The aarch32 64-bit s+ns regs are primary.
+     *
+     * The aarch32 32-bit regs are secondary to one of the above,
+     * and we also don't expose them to gdb.
+     */
+    static const ARMCPRegInfo parv8_reginfo = {
+        .name = "PAR_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 7, .crm = 4, .opc2 = 0,
+        .access = PL1_RW, .fgt = FGT_PAR_EL1,
+        .fieldoffset = offsetof(CPUARMState, cp15.par_el[1])
+    };
+
+    static ARMCPRegInfo par64_reginfo[2] = {
+        [0 ... 1] = {
+            .state = ARM_CP_STATE_AA32,
+            .cp = 15, .crm = 7, .opc1 = 0,
+            .type = ARM_CP_64BIT, .access = PL1_RW,
+        },
+        [0].name = "PAR",
+        [0].secure = ARM_CP_SECSTATE_NS,
+        [0].fieldoffset = offsetof(CPUARMState, cp15.par_ns),
+        [1].name = "PAR_S",
+        [1].secure = ARM_CP_SECSTATE_S,
+        [1].fieldoffset = offsetof(CPUARMState, cp15.par_s),
+    };
+
+    static ARMCPRegInfo par32_reginfo = {
+        .name = "PAR", .state = ARM_CP_STATE_AA32,
+        .cp = 15, .crn = 7, .crm = 4, .opc1 = 0, .opc2 = 0,
+        .access = PL1_RW, .resetvalue = 0,
+        .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.par_s),
+                               offsetoflow32(CPUARMState, cp15.par_ns) },
+        .writefn = par_write,
+    };
+
+    CPUARMState *env = &cpu->env;
+
+    /* With only VAPA, define a 32-bit reg that filters bits from write. */
+    if (!arm_feature(env, ARM_FEATURE_LPAE)) {
+        define_one_arm_cp_reg(cpu, &par32_reginfo);
+        return;
+    }
+
+    /* With LPAE, the 32-bit regs are aliases of 64-bit regs. */
+    par32_reginfo.type = ARM_CP_ALIAS | ARM_CP_NO_GDB;
+    par32_reginfo.writefn = NULL;
+    define_one_arm_cp_reg(cpu, &par32_reginfo);
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        define_one_arm_cp_reg(cpu, &parv8_reginfo);
+        par64_reginfo[0].type |= ARM_CP_ALIAS;
+    }
+
+    define_arm_cp_regs(cpu, par64_reginfo);
+}
+
 static uint64_t aa64_fpcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     return vfp_get_fpcr(env);
@@ -3710,13 +3774,6 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
       .fgt = FGT_DCCISW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
-    { .name = "PAR_EL1", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS,
-      .opc0 = 3, .opc1 = 0, .crn = 7, .crm = 4, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0,
-      .fgt = FGT_PAR_EL1,
-      .fieldoffset = offsetof(CPUARMState, cp15.par_el[1]),
-      .writefn = par_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_ticab },
@@ -6674,23 +6731,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &gen_timer_cntpoff_reginfo);
     }
 #endif
-    if (arm_feature(env, ARM_FEATURE_VAPA)) {
-        ARMCPRegInfo vapa_cp_reginfo[] = {
-            { .name = "PAR", .cp = 15, .crn = 7, .crm = 4, .opc1 = 0, .opc2 = 0,
-              .access = PL1_RW, .resetvalue = 0,
-              .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.par_s),
-                                     offsetoflow32(CPUARMState, cp15.par_ns) },
-              .writefn = par_write},
-        };
 
-        /*
-         * When LPAE exists this 32-bit PAR register is an alias of the
-         * 64-bit AArch32 PAR register defined in lpae_cp_reginfo[]
-         */
-        if (arm_feature(env, ARM_FEATURE_LPAE)) {
-            vapa_cp_reginfo[0].type = ARM_CP_ALIAS | ARM_CP_NO_GDB;
-        }
-        define_arm_cp_regs(cpu, vapa_cp_reginfo);
+    if (arm_feature(env, ARM_FEATURE_VAPA)) {
+        define_par_register(cpu);
     }
     if (arm_feature(env, ARM_FEATURE_CACHE_TEST_CLEAN)) {
         define_arm_cp_regs(cpu, cache_test_clean_cp_reginfo);
-- 
2.43.0


