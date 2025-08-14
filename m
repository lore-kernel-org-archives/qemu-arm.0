Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB963CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXdQ-0002rt-36; Thu, 14 Aug 2025 09:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcX-0001zA-69
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:54 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcR-00056F-3U
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:51 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76e2eb09041so816144b3a.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176621; x=1755781421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGoBaPI9YdbcahbR3TKVmmYjuDxcjQqW1lAo/n6M0zk=;
 b=aJrb3UkkOMbRBnBcDDYIaLLbAV5xUj6qnDUNltiqIcphvAsD6IYkUixZjIzZ8lIxzE
 tTPS8/VcAHt4QbF3CpAW2j0aQWIt4Tzb3PTN02KEBTbYnu2BLOqR69Pf6yasx6uqZ+sL
 Mo2xn7zNjbFLRDZ6XMTqSM89Zt8PF6dWp6i3MSGv+dNJUZK3ZPsfcDB3DYe5xsZTK8P+
 NrDtka9is3pXPSWSsT+JMlnuaf94intlwl5/M0GajQu/Ra+kgM0XwSclQ/TiiDdfPvYt
 W4+tY7MN4N85KwEa9gC8wCC4CImtj06VK2VaMeJOfwtDY0LgFOW4BwzGuYpJx3Tjvrs3
 zgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176621; x=1755781421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGoBaPI9YdbcahbR3TKVmmYjuDxcjQqW1lAo/n6M0zk=;
 b=XUKzVslOINJrhlkAZ2bW5AJ/qAr00u5Dk2uptCOHr22URpd1BP3qshuQ0wkjTqHtjm
 3khp8ThEcwqwi5af5yOQSNrbZTd17re7dsbsRkneI9GKDvd5ptsm4i9jTK/DAfGxFAuU
 r05xdbs81PZHURrgo0q7K6Suop2nziGVn7Oh1BzR6U4meqkwAwR5fMLOGTDkeBwCCwvu
 aAKy4CqO5GQ/asQllUBEs9v6cV+B+UU5hHCXki6BrGm/w8i87hZKd7VS/iSqrhY8kjTW
 vhsZdXjYqqE2+IFrknUEdF8GfblwVu2hHkzeUlQSxtJY874PTxQTs8OuOqMVLnNngRce
 uiKA==
X-Gm-Message-State: AOJu0YwDi0inEi5ERFmTs9YN4FYyL9oQNwmeX3aC7Iu8XqgSB6kye2pc
 G6PlFCSLE0rrPaBU1LJ3KcNYHXXrWElO4jHgblI2MZJdT6ALBcKmzdxX/zRtfsB0BZcdfjQJ6+4
 Wx6uuaAU=
X-Gm-Gg: ASbGnctaWnkqtyvkQdDfHxrrzYKIkuocHOySUiZOIWgVFpc0lLUpukw22nADysV/Ed8
 zRW6dz8KHow/xS0hR2Xy+IfuUYqViAsoOkFU4/AsW0YUGU6sjmNj56TnhSTLjSMh05cMfx3U5TP
 6iIUQDB9N+plam3nNi8kHxSzfkBuGbmpom4d5zGAneeWkHMy7PHZX4uaDeIqN4wH2vfReV3Z5TY
 WwajvBpgsX04xTqvRrRO6XaJyn5dWNzC1ujSIQKaQw1ZEBh3YV+FJPDqaQeVhgTYgYqWCtek1/3
 r/a/ofMG2sV9KMveZZwXDNfHP6nOfTWLp3frurUDyFm0nNBS6zdk0Y5pHT2mJPygDLE3WGiRtzw
 jeDk5MEF7pTmIfsTeKibCd4RGAYUyhoCTbJTY/ShcChL4T6O7rmSM0L+KMA==
X-Google-Smtp-Source: AGHT+IFDZJjAhfJjl0nQoc2+aHIb44hyR5BVJjHQZG4I3OrzqgxMpWdxYRbyae6790HPbP6s3Pl/TQ==
X-Received: by 2002:a05:6a00:1303:b0:76b:dbe2:40f4 with SMTP id
 d2e1a72fcca58-76e31fef1bamr3661631b3a.16.1755176621310; 
 Thu, 14 Aug 2025 06:03:41 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:03:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 47/85] target/arm: Add GCS cpregs
Date: Thu, 14 Aug 2025 22:57:14 +1000
Message-ID: <20250814125752.164107-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
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

Add isar_feature_aa64_gcs.
Enable SCR_GCSEN in scr_write.
Enable HCRX_GCSEN in hcrx_write.
Default HCRX_GCSEN on if EL2 disabled.
Add the GCSCR* and GCSPR* registers.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h       |  2 +
 target/arm/cpu-features.h |  5 +++
 target/arm/cpu.h          | 12 ++++++
 target/arm/internals.h    |  3 ++
 target/arm/cpregs-gcs.c   | 91 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c          |  3 ++
 target/arm/helper.c       | 10 +++++
 target/arm/meson.build    |  2 +
 8 files changed, 128 insertions(+)
 create mode 100644 target/arm/cpregs-gcs.c

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 9efe9238c1..bc6adf5956 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -774,6 +774,8 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, VBAR_EL1),
     DO_BIT(HFGRTR, ICC_IGRPENN_EL1),
     DO_BIT(HFGRTR, ERRIDR_EL1),
+    DO_REV_BIT(HFGRTR, NGCS_EL0),
+    DO_REV_BIT(HFGRTR, NGCS_EL1),
     DO_REV_BIT(HFGRTR, NSMPRI_EL1),
     DO_REV_BIT(HFGRTR, NTPIDR2_EL0),
     DO_REV_BIT(HFGRTR, NPIRE0_EL1),
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 83875c06bb..e3754df786 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -719,6 +719,11 @@ static inline bool isar_feature_aa64_nmi(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, NMI) != 0;
 }
 
+static inline bool isar_feature_aa64_gcs(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, GCS) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64_IDREG(id, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index da42bd4466..1da73196f0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -591,6 +591,9 @@ typedef struct CPUArchState {
         uint64_t mecid_rl_a_el3;
         uint64_t vmecid_p_el2;
         uint64_t vmecid_a_el2;
+
+        uint64_t gcscr_el[4];   /* GCSCRE0_EL1, GCSCR_EL[123] */
+        uint64_t gcspr_el[4];   /* GCSPR_EL[0123] */
     } cp15;
 
     struct {
@@ -1735,6 +1738,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_ENAS0             (1ULL << 36)
 #define SCR_ADEN              (1ULL << 37)
 #define SCR_HXEN              (1ULL << 38)
+#define SCR_GCSEN             (1ULL << 39)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_TCR2EN            (1ULL << 43)
@@ -1744,6 +1748,14 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
 
+/* GCSCR_ELx fields */
+#define GCSCR_PCRSEL    (1ULL << 0)
+#define GCSCR_RVCHKEN   (1ULL << 5)
+#define GCSCR_EXLOCKEN  (1ULL << 6)
+#define GCSCR_PUSHMEN   (1ULL << 8)
+#define GCSCR_STREN     (1ULL << 9)
+#define GCSCRE0_NTR     (1ULL << 10)
+
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 805f4a1876..4f5b42af12 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -253,6 +253,7 @@ FIELD(VTCR, SL2, 33, 1)
 #define HCRX_MSCEN    (1ULL << 11)
 #define HCRX_TCR2EN   (1ULL << 14)
 #define HCRX_SCTLR2EN (1ULL << 15)
+#define HCRX_GCSEN    (1ULL << 22)
 
 #define HPFAR_NS      (1ULL << 63)
 
@@ -1777,6 +1778,8 @@ void define_tlb_insn_regs(ARMCPU *cpu);
 void define_at_insn_regs(ARMCPU *cpu);
 /* Add the cpreg definitions for PM cpregs */
 void define_pm_cpregs(ARMCPU *cpu);
+/* Add the cpreg definitions for GCS cpregs */
+void define_gcs_cpregs(ARMCPU *cpu);
 
 /* Effective value of MDCR_EL2 */
 static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
new file mode 100644
index 0000000000..1a64acd584
--- /dev/null
+++ b/target/arm/cpregs-gcs.c
@@ -0,0 +1,91 @@
+/*
+ * QEMU ARM CP Register GCS regiters and instructions
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "exec/icount.h"
+#include "hw/irq.h"
+#include "cpu.h"
+#include "cpu-features.h"
+#include "cpregs.h"
+#include "internals.h"
+
+
+static CPAccessResult access_gcs(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    if (arm_current_el(env) < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_GCSEN)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult access_gcs_el0(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
+{
+    if (arm_current_el(env) == 0 && !(env->cp15.gcscr_el[0] & GCSCRE0_NTR)) {
+        return CP_ACCESS_TRAP_EL1;
+    }
+    return access_gcs(env, ri, isread);
+}
+
+static void gcspr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    /*
+     * Bits [2:0] are RES0, so we might as well clear them now,
+     * rather than upon each usage a-la GetCurrentGCSPointer.
+     */
+    raw_write(env, ri, value & ~7);
+}
+
+static const ARMCPRegInfo gcs_reginfo[] = {
+    { .name = "GCSCRE0_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 5, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_gcs, .fgt = FGT_NGCS_EL0,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcscr_el[0]) },
+    { .name = "GCSCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 5, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_gcs, .fgt = FGT_NGCS_EL1,
+      .nv2_redirect_offset = 0x8d0 | NV2_REDIR_NV1,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcscr_el[1]) },
+    { .name = "GCSCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 5, .opc2 = 0,
+      .access = PL2_RW, .accessfn = access_gcs,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcscr_el[2]) },
+    { .name = "GCSCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 5, .opc2 = 0,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcscr_el[3]) },
+
+    { .name = "GCSPR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 5, .opc2 = 1,
+      .access = PL0_R | PL1_W, .accessfn = access_gcs_el0,
+      .fgt = FGT_NGCS_EL0, .writefn = gcspr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcspr_el[0]) },
+    { .name = "GCSPR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 5, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_gcs,
+      .fgt = FGT_NGCS_EL1, .writefn = gcspr_write,
+      .nv2_redirect_offset = 0x8c0 | NV2_REDIR_NV1,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcspr_el[1]) },
+    { .name = "GCSPR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 5, .opc2 = 1,
+      .access = PL2_RW, .accessfn = access_gcs, .writefn = gcspr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcspr_el[2]) },
+    { .name = "GCSPR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 5, .opc2 = 1,
+      .access = PL3_RW, .writefn = gcspr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcspr_el[2]) },
+};
+
+void define_gcs_cpregs(ARMCPU *cpu)
+{
+    if (cpu_isar_feature(aa64_gcs, cpu)) {
+        define_arm_cp_regs(cpu, gcs_reginfo);
+    }
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b472992b4a..d9318c5325 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -644,6 +644,9 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
             if (cpu_isar_feature(aa64_fgt, cpu)) {
                 env->cp15.scr_el3 |= SCR_FGTEN;
             }
+            if (cpu_isar_feature(aa64_gcs, cpu)) {
+               env->cp15.scr_el3 |= SCR_GCSEN;
+            }
             if (cpu_isar_feature(aa64_tcr2, cpu)) {
                 env->cp15.scr_el3 |= SCR_TCR2EN;
             }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1b21ae5d8e..14f7129607 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -743,6 +743,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_ecv, cpu)) {
             valid_mask |= SCR_ECVEN;
         }
+        if (cpu_isar_feature(aa64_gcs, cpu)) {
+            valid_mask |= SCR_GCSEN;
+        }
         if (cpu_isar_feature(aa64_tcr2, cpu)) {
             valid_mask |= SCR_TCR2EN;
         }
@@ -3947,6 +3950,9 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_sctlr2, cpu)) {
         valid_mask |= HCRX_SCTLR2EN;
     }
+    if (cpu_isar_feature(aa64_gcs, cpu)) {
+        valid_mask |= HCRX_GCSEN;
+    }
 
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
@@ -4017,6 +4023,9 @@ uint64_t arm_hcrx_el2_eff(CPUARMState *env)
         if (cpu_isar_feature(aa64_sctlr2, cpu)) {
             hcrx |= HCRX_SCTLR2EN;
         }
+        if (cpu_isar_feature(aa64_gcs, cpu)) {
+            hcrx |= HCRX_GCSEN;
+        }
         return hcrx;
     }
     if (arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_HXEN)) {
@@ -7574,6 +7583,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     define_pm_cpregs(cpu);
+    define_gcs_cpregs(cpu);
 
 #ifndef CONFIG_USER_ONLY
     /*
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 91630a1f72..8c82304fde 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -27,6 +27,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c',
 ))
 arm_user_ss.add(files(
+  'cpregs-gcs.c',
   'cpregs-pmu.c',
   'debug_helper.c',
   'helper.c',
@@ -42,6 +43,7 @@ arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
   'cortex-regs.c',
+  'cpregs-gcs.c',
   'cpregs-pmu.c',
   'debug_helper.c',
   'helper.c',
-- 
2.43.0


