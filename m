Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A196CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:19:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJq-0002VD-7M; Tue, 14 Oct 2025 16:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJg-0002Kf-D0
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ3-0005Mt-Iy
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:14 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-27c369f8986so52789315ad.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472453; x=1761077253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i+qU0whZ6ZjQiZGb9Lq+40FrMiv4gq0wjHFcVSvTXNk=;
 b=L8vz4LrlVyppL3jDPU3TjFDj7DuiABpCUs6c4Hm+DbtMQf8/mDkYz+kU7z9Ik3a/3J
 ZwOh6uRvWqqYOZbNvPHA7H1kghYYC/v6tTEjoDINR/kuRAjO7XlT61xlmNMLgjOoAy1U
 fBZ3cmoXJ6gaJX5rpeiyJEpcTBSjqySOIorovq9n2ADj2N64ixwWLIaTAYL5pir7yVnY
 QFVbnAUv7wlDm14oAaVSvuh4e+Z4RtJsLDRb9ytMtqv/LpNlwdWh6k/XYYAYwMpe7IcO
 bnxpJbNa+RNTuUZSr50BiXjTSNe7R72+QUcBSGGUIo1PlyN72Ou5jCkD2BvC2zo392CL
 Lubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472453; x=1761077253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i+qU0whZ6ZjQiZGb9Lq+40FrMiv4gq0wjHFcVSvTXNk=;
 b=doCJJGP74ZFLfnrGzc1km6ufiaaAlJXOjcJwj/AbEILhjhyvq4QMr0sN4LnB/GmIMM
 N0xkjXkMOB+0v4vsaPBvmr95Ev3RYioPEpASWTdEQFjx244LqQHOfpm0YnsGetyXFzBM
 RICO8OAbOB0QUKXQjsi1Am7/WVtTQFHw0Q75jwJ+F1emVyHDSYXum9jt3vuIQ+q2xK7N
 OkDy4BpBqlM+NuOfA+tQJDbB34B9kwwMaD3a0rHqDwwlL+1XBA9H5JiFI+bkXWM/xQ2q
 Wo6VTG36sHJuVKRuQD6byR5DWbVTfFsx7OIB5O0P/kHMXmcDT4LzlhcHpsByJwGIoz9Z
 seaQ==
X-Gm-Message-State: AOJu0Yw0OL2TN8BhjsNOPplq1d6kNkvCVgvOaKYN3VxIACdYnUn62VPz
 A7pbuaE2R4+OFi/m18XTI2OioXs0D49akacyJIMTwFvtERQ7ZLSgzBu9ZfTMtsMRbyg=
X-Gm-Gg: ASbGnctHtS8h1z7bYvNSaHlIKCEkYFyon3y47mNuQwfi87d/bw+4ir5wfvPgSruK3oj
 K9ZGsbBchCtWXuzFJbGH8+717IJBHID2b7KipBFzywKHTtdgsP+IIcSHb9BUfQa+IoAKzgGwbxu
 Fsn799f7+1Y2axNZ0ZMDj3C78Z+3sd7NiSGQf/xEL1YPprIwPlvMxtsLuM8YtrE2ACBllWi9lbH
 F1vL8+VCXKnEf9rxPZz3KAoemPb9/g0PCMVKTmcBBJwG4OSPbNVg9BjQOBGGISILacAkROAUNs7
 8RMId+GkJ9ZG60SSxfE62YeXgcwV+vqSQ5C5qjOtnYk52QIMV80O3SC56qwjLf1QNHeYC6XjtRP
 /zH0QUpNustITjDjlLF9SnSAOUY0zaNJ0e+7CRnz1CNbbY3jW2Y4=
X-Google-Smtp-Source: AGHT+IE0Kxr6QefjgB5eoH1V9yc4zW1jU/WWtmP2lBc440xGKnNB1sae9ho0SY2KNR3XbYx7WCjhXA==
X-Received: by 2002:a17:903:f85:b0:275:b1cf:6ddc with SMTP id
 d9443c01a7336-290273565c8mr349853185ad.5.1760472453483; 
 Tue, 14 Oct 2025 13:07:33 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 20/37] target/arm: Consolidate definitions of PAR
Date: Tue, 14 Oct 2025 13:07:01 -0700
Message-ID: <20251014200718.422022-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
index d3a425e259..7800d83f48 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2475,9 +2475,7 @@ static const ARMCPRegInfo gen_timer_ecv_cp_reginfo[] = {
 
 static void par_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
-    if (arm_feature(env, ARM_FEATURE_LPAE)) {
-        raw_write(env, ri, value);
-    } else if (arm_feature(env, ARM_FEATURE_V7)) {
+    if (arm_feature(env, ARM_FEATURE_V7)) {
         raw_write(env, ri, value & 0xfffff6ff);
     } else {
         raw_write(env, ri, value & 0xfffff1ff);
@@ -3244,10 +3242,11 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
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
@@ -3262,6 +3261,71 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
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
@@ -3765,13 +3829,6 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
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
@@ -7120,23 +7177,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


