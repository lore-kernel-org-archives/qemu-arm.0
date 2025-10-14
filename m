Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F34BCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 19:51:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8l2e-0001cJ-5j; Tue, 14 Oct 2025 15:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2U-0001ZY-E2
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:30 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2Q-0003PH-LJ
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-79ef9d1805fso1036735b3a.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760471422; x=1761076222; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLWvUqmmBANKsaF5zaX5lQHObBvuZy86Gts19KQtK6w=;
 b=siwZYPlEVlKtEU4zyVBrILUXVepO+jkn2qg/184Htwk+k4HZ8iPHtMTsfcta2IOXx3
 BZdjl0uAisliXeH/wQHDo3X8O8x6U66cQ+Ewlr7FE7Ftwunn8QcNElLMe8wJ+H7I50On
 y/gU0+rymb4NmKZTlqBZ6KsdqGenashFS+6aj53vs03umB8HdpUq+tuH/C4FAQZLdtvZ
 zuAdPqBa4nlAQFfP1TFUN5scqKA7SjrplfERtHE/ImnUeL3oSV6zIQmIRKYtUgMhr1EE
 LIxymcVOFqIowYhJ78/VOylDngr29Y1FAbcSK3ADfkMhU44I4iZFzyuTxZfCH8ANEfn3
 WV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471422; x=1761076222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLWvUqmmBANKsaF5zaX5lQHObBvuZy86Gts19KQtK6w=;
 b=W6o6CLfNj5yInuM4l8mnPI0oKxel6AZKriNwUAqybre2YYVhxUl017IGGIljE2XtIK
 XZPn4xtNOUzpW1oTkZpa9/HlORCsMNCa8oEa3ap2fL3KIrJzWgxl85Mr0Jjm2C8+oT9R
 zyTa2I6iL0fc6FNG4/iGTydzr3XpaPzUtLEdQNL9Pw++PN1XZy955H/hpHNrIH3PIfHI
 Q6XrvskoCxvCGQakSak1wyLsylpzKfIBP/wtVcZHJO4Ots0bxDs/y8XJt1TqeT4A3Buu
 mrs0WxueX6pYYDis5i6a9rn/DQXW7aW2LONfzCnQkkooPYLy5cuFvVFv+fWIqYMJul9l
 mHOQ==
X-Gm-Message-State: AOJu0YyW2n8eSW+M/xGpcXV1a9TDZuQ6UeGnMQhka8iY2aRxKj2YVfj3
 t/xE5bS9eajBNFPa8B4bVr2wo4jCAqn2gVlMN0MwhiuiGDd5/LYsPCyrS8/J+PvDpt7ndTbTVJE
 db6nLLI4=
X-Gm-Gg: ASbGncsd7MIoPw5Ns8DE233FhLboVpvNyNtmLzx1cvc8lg+JduAcV2UaucxkO0Q7dxD
 v3jpQmS/a+/tAjAtsdbbDN9ZoApAsV42TjbnWLhzDoC4u46cjohVaYzJkVS8tKzUkq2h+kOVaid
 PPt4/1pP64YAutg5IVpFVe218UErvKbDDme/eE9b3QzSNDq8p6oyDdvwAFJYaVeq3tquLbV0W3N
 PJSPUgATtO0sHpB8TGTMIvbV59+e9siu/9GWUSREJLLFV23KTcZ2YZS8kttOosdXvQ845/U7K57
 Fs0u2g6ni3JmvnjpzFyAYXRkLJrtNs6y6o6vG1p41O2UJG+RrV06JEPmIRfMigumMzVz/V0Jb5m
 CoWXNLRDMBcC1IqEfolr0+Wuf9ZwFuWUTtblBPUlcIc8WPju8Teg=
X-Google-Smtp-Source: AGHT+IFO+jcUMFNDnlWEPK/csFK/QMM1pst4KCKWDs40eylcmd6uLUfhUUPiUV4sgNL1nYfLbGs65w==
X-Received: by 2002:a05:6a20:a123:b0:243:d1bd:fbc9 with SMTP id
 adf61e73a8af0-32da8462b41mr36584149637.56.1760471421934; 
 Tue, 14 Oct 2025 12:50:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63a03dsm15918727b3a.19.2025.10.14.12.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/7] target/arm: Implement MAIR2_ELx and AMAIR2_ELx
Date: Tue, 14 Oct 2025 12:50:12 -0700
Message-ID: <20251014195017.421681-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014195017.421681-1-richard.henderson@linaro.org>
References: <20251014195017.421681-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h |  2 ++
 target/arm/cpu.h    |  5 +++-
 target/arm/cpu.c    |  3 +++
 target/arm/helper.c | 62 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 1 deletion(-)

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
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3b556f1404..d2fc17eab6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -652,6 +652,9 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
                 cpu_isar_feature(aa64_s2pie, cpu)) {
                 env->cp15.scr_el3 |= SCR_PIEN;
             }
+            if (cpu_isar_feature(aa64_aie, cpu)) {
+                env->cp15.scr_el3 |= SCR_AIEN;
+            }
             if (cpu_isar_feature(aa64_mec, cpu)) {
                 env->cp15.scr_el3 |= SCR_MECEN;
             }
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


