Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444CECCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 20:20:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7Jab-0000UE-Ap; Fri, 10 Oct 2025 16:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaJ-0000PW-Qx
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:29 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaF-0002lh-3u
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:26 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-77f5d497692so3208976b3a.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760127560; x=1760732360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/tcvXe/+zrpnYYwFhuufS2LXIH9ZUA9oPOxweSPI5bU=;
 b=EnGgf9H2ZY4Eg2KFcPlBqfVqVKU2tVmarGtwYkoknBsNkrtUwsLsGWN0/rxtP3iph4
 b/xQjJ37N2iHRLpaXNzqe/NLNg4o0q5Q44FpzuwCEXmhmJ0syrmPsoclIAInmfGdNB5q
 EmDTSEUm874eb/4ZzMovNIzVV7cvLazyUdDKpESKETTO9e1APzJ2e/TK6VMQ4bBQ+j6S
 8cuUPWYTdpC83jkb6z8vSNayWU9S6oVrH0EXh7e8Ps9sWZBo+eORMCaga1E/F3wENiMJ
 Vb1EG9WsSHNl+bhXiYjdCwqQd2kfka5iC2CQUDZejr0/+dZh4IXMAoD4UY4ZKNPiwZ6j
 2bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127560; x=1760732360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/tcvXe/+zrpnYYwFhuufS2LXIH9ZUA9oPOxweSPI5bU=;
 b=QGwEoRtzv4tGoA/g/0BVX9MYyG5LC5a+IQb/m9YgK1dPs7YAopRP3E/d46H4jpKNET
 wGn+5FtIylOXT1CLdEEUF8lZZhJ1aKsZT1DJnNOW13Okn/s+sCtg0Vy+1ZL1UeZmYPyZ
 MnImXDL8j/zMN5SXRAeEMi7r28gEFNndlYfZCqTjJASmGp7YZzkhIDX7/GBZY8QFQHjF
 zZ94r5VQCjIj8mTP2hiL6spCkRReBiZgk8sbfuhZwYlWR6zx5i3qm5IovSGdwzrOXVhN
 VfSSL7HiP8wTY9Fqm9KXVLkQqlFTejtxpkeS4WEbPjhMNH2dWh4X7S8wmX1FQp2pevU2
 pCcw==
X-Gm-Message-State: AOJu0YzUplc9VnH5Xt5EQ5I8znraeajHKtGEqKdIiCc7ZM81s694pR1e
 e0hUDVDCab5vJqcDeU4rFS0ugsMICpB33+TX5rHqUOgNEdGGn6XHjxY5I/m0+v+sVPo=
X-Gm-Gg: ASbGncsh/VY1a632rkdBqFg2y7FueqQQjioxgqlUZP+RQCBS61bIi8eBNIJCt8E4VpK
 W2Nnpb2/hn5suxDR7FgnJWEzAGnNSx4hJ2UvU9S9215pWOahMXOPS+t0t4CuvzePlTE+NQRwDwZ
 HsU1mshDpuT61O+h0yOat9xlmpDpMU0cHFvTSvK/pXdG0F0Rl3ncaXtxjenmm5bgxhkbRrXxfKw
 fM7dNLU2o40ZED3C6Nvp8/1ejsgdGtnY/kfDdiWNdVKll1Zncly7lECgVvhYWMYxsaKPZO3SNzV
 FafuWiO8fg6DU4TdWz0tb2dbKJ3GP4b/898W2aAnBBRvUAh4hp6YbADB0F5IaVYQ/r2G3PQNLIq
 g99h75W0pTlu5U68ZStNp08fJN4Wm5VmRY58Xd6S5MUOEiqTsIHCfGZ8WE9tpRQ==
X-Google-Smtp-Source: AGHT+IHmRe3uENi2PItqGA61GOOwz89E7hPW2mPCuJ8gd39gfYXpldNKg+71rAPSI4863oRT2BT7Bg==
X-Received: by 2002:a05:6a00:234b:b0:781:8680:3175 with SMTP id
 d2e1a72fcca58-79387146c19mr15880335b3a.21.1760127560209; 
 Fri, 10 Oct 2025 13:19:20 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd7ee5bsm3764830b3a.85.2025.10.10.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 13:19:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/7] target/arm: Implement MAIR2_ELx and AMAIR2_ELx
Date: Fri, 10 Oct 2025 13:19:12 -0700
Message-ID: <20251010201917.685716-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010201917.685716-1-richard.henderson@linaro.org>
References: <20251010201917.685716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Enable the SCR.AIEn bit in scr_write, and test it in aien_access.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h |  2 ++
 target/arm/cpu.h    |  5 +++-
 target/arm/helper.c | 62 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 763de5e051..48a406a5fb 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -806,6 +806,8 @@ typedef enum FGTBit {
     DO_REV_BIT(HFGRTR, NTPIDR2_EL0),
     DO_REV_BIT(HFGRTR, NPIRE0_EL1),
     DO_REV_BIT(HFGRTR, NPIR_EL1),
+    DO_REV_BIT(HFGRTR, NMAIR2_EL1),
+    DO_REV_BIT(HFGRTR, NAMAIR2_EL1),
 
     /* Trap bits in HDFGRTR_EL2 / HDFGWTR_EL2, starting from bit 0. */
     DO_BIT(HDFGRTR, DBGBCRN_EL1),
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1d4e13320c..e21612b898 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -447,7 +447,8 @@ typedef struct CPUArchState {
         uint64_t c9_pmuserenr; /* perf monitor user enable */
         uint64_t c9_pmselr; /* perf monitor counter selection register */
         uint64_t c9_pminten; /* perf monitor interrupt enables */
-        union { /* Memory attribute redirection */
+        /* Memory attribute redirection */
+        union {
             struct {
 #if HOST_BIG_ENDIAN
                 uint64_t _unused_mair_0;
@@ -467,6 +468,7 @@ typedef struct CPUArchState {
             };
             uint64_t mair_el[4];
         };
+        uint64_t mair2_el[4];
         union { /* vector base address register */
             struct {
                 uint64_t _unused_vbar;
@@ -1736,6 +1738,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TCR2EN            (1ULL << 43)
 #define SCR_SCTLR2EN          (1ULL << 44)
 #define SCR_PIEN              (1ULL << 45)
+#define SCR_AIEN              (1ULL << 46)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 167f2909b3..e4d1651440 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -779,6 +779,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             cpu_isar_feature(aa64_s2pie, cpu)) {
             valid_mask |= SCR_PIEN;
         }
+        if (cpu_isar_feature(aa64_aie, cpu)) {
+            valid_mask |= SCR_AIEN;
+        }
         if (cpu_isar_feature(aa64_mec, cpu)) {
             valid_mask |= SCR_MECEN;
         }
@@ -6189,6 +6192,61 @@ static const ARMCPRegInfo s2pie_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.s2pir_el2) },
 };
 
+static CPAccessResult aien_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_AIEN)
+        && arm_current_el(env) < 3) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult aien_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    CPAccessResult ret = access_tvm_trvm(env, ri, isread);
+    if (ret == CP_ACCESS_OK) {
+        ret = aien_access(env, ri, isread);
+    }
+    return ret;
+}
+
+static const ARMCPRegInfo aie_reginfo[] = {
+    { .name = "MAIR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .accessfn = aien_el1_access,
+      .fgt = FGT_NMAIR2_EL1, .nv2_redirect_offset = 0x280 | NV2_REDIR_NV1,
+      .vhe_redir_to_el2 = ENCODE_AA64_CP_REG(3, 4, 10, 1, 1),
+      .vhe_redir_to_el01 = ENCODE_AA64_CP_REG(3, 5, 10, 2, 1),
+      .fieldoffset = offsetof(CPUARMState, cp15.mair2_el[1]) },
+    { .name = "MAIR2_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .accessfn = aien_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.mair2_el[2]) },
+    { .name = "MAIR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 1, .opc2 = 1,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.mair2_el[3]) },
+
+    { .name = "AMAIR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .accessfn = aien_el1_access,
+      .fgt = FGT_NAMAIR2_EL1, .nv2_redirect_offset = 0x288 | NV2_REDIR_NV1,
+      .vhe_redir_to_el2 = ENCODE_AA64_CP_REG(3, 4, 10, 3, 1),
+      .vhe_redir_to_el01 = ENCODE_AA64_CP_REG(3, 5, 10, 3, 1),
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "AMAIR2_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
+      .access = PL2_RW, .accessfn = aien_access,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "AMAIR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 3, .opc2 = 1,
+      .access = PL3_RW,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+};
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -7434,6 +7492,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     }
 
+    if (cpu_isar_feature(aa64_aie, cpu)) {
+        define_arm_cp_regs(cpu, aie_reginfo);
+    }
+
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
     }
-- 
2.43.0


