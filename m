Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCB9CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:58:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxi-00050t-94; Sat, 30 Aug 2025 11:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQx-0007Ku-E7
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:32 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQv-0004vR-Ko
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-248ff4403b9so17477435ad.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532842; x=1757137642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rODn1flmYmXKaoLiUep6AuzW+IcIjQP7mUH4GL/sHBs=;
 b=yylD85LNnc9dvpdxJ+mEau8T3sTvsxoiBeFlMeJW8pnQy2NEY6aYruIvXfyOP6WmoY
 NIJ5zm70blmGFqxOtg9KjFeRUC4+KnDM0sNAXE2YE6c3AFp04dbFv1FCBOMGpXJgUwea
 FiQao4itsPg0qM/yIXKVRTDuRxaQmmNYJ1TIFfFC6VMs4G6eekbHNxQNOfBXp6q0AwVj
 gzaBzVFdjW/CsAuLr/XQQihOLN+ig9vAX5TteDKnsyOOB5nmOsjTZLBQ5WlvEBW/WfJt
 slZ38RmDcscQTH3eN1T9C+vUSDPGzA2PboGqK9CfJqdzx+fPCi1ObDH7a1Y2xDzSMmm7
 ATCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532842; x=1757137642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rODn1flmYmXKaoLiUep6AuzW+IcIjQP7mUH4GL/sHBs=;
 b=k2S2i2g7KnrSjB9vSOdrJuEhULXho5IgIcgu9pPATt6QIkgn/VBuKMlGk3Wmqgx9+Y
 Ww57/28hHxG6YJkDLH4WAIWUve8oiqTl9M7p/JQTobARgzvy1TqDYS3GWKcKTsB1MMGB
 oQjHWNGD8K2IWGfTUpftU6vEstouSXPN00zXIPldrHCtrcWCbm6YJvGQEIIBoJmslBMV
 gnE7d0RwB0kVL1GK89D37U8+e21zvkZLElz4gukMdF5JCArBqzp4lDSOsODu1g5hO7b/
 uuuJt/Q2arfArDcqJUMoOL6pI4vdwDXQb+lSiZxOnaRHJ3ItYaZ/fxnG8KJDznLUaO7q
 471g==
X-Gm-Message-State: AOJu0YwTE8ABFphuQg4H0B0x77/c1AI6xlVByMbkdX+1J0n1E1OD+cWp
 ngDWUJOaCQWkry700ftL8NCIDZKqVbx6KMKhJfkMwN0gEBXK1Et84f0B1jqftU7WN8c=
X-Gm-Gg: ASbGncvjWLebdqhlA9T16EbJDDzbgaH3N6mLuxDj17H4ujPgcomAw9dwwuA0jHc1vlv
 XA18Fydel4v4WXLgbDCpP4km2wYA36Jz7rMtpgOVYR27tmI/zn8M3zv/rihe1NNvtgj0PN/3YMJ
 E5XnHo5TDzx7gKdGFQKbXvihgEusfvMqvUE4G4o3CpRHaiLHRMyJfNZMWO93xhl7UyaPHfF1lV1
 RQxnrg/lEBomJXDYM3UvJo+VDKrhvxZULmaabm6+mQ151DP5TnD/GOttnHPQOvbG3kxH74IoyR1
 1qQPXVFXEpY4S9NeKfqFAQEHHpHIloZ77lMOOoMhZXUUIdG7skmjnGUzVomq091K+PQ28GiDbWo
 7lmWP2blAY6cxeDuzQtr5hvEtv8Y4gpOsXrbfRoGf+VUXkY8Z2N6AsY6wv6Amn7IolnFhWtgWQw
 ==
X-Google-Smtp-Source: AGHT+IFJ/3GlzEe3N24MhHcbrDHtu8hLioZ6RYMvLJD8NlX6+sOmVQmAJ86QaYCqQHygr8FgnsdXfQ==
X-Received: by 2002:a17:903:1ce:b0:248:fc2d:3a22 with SMTP id
 d9443c01a7336-2494485b899mr16762425ad.12.1756532842440; 
 Fri, 29 Aug 2025 22:47:22 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 59/84] target/arm: Implement GCSPUSHM
Date: Sat, 30 Aug 2025 15:41:03 +1000
Message-ID: <20250830054128.448363-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  3 +++
 target/arm/cpregs-gcs.c        | 15 +++++++++++++++
 target/arm/tcg/translate-a64.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 15894332b2..93358e6123 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -46,6 +46,8 @@ enum {
     ARM_CP_DC_ZVA                = 0x0005,
     ARM_CP_DC_GVA                = 0x0006,
     ARM_CP_DC_GZVA               = 0x0007,
+    /* Special: gcs instructions */
+    ARM_CP_GCSPUSHM              = 0x0008,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
@@ -861,6 +863,7 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, DVPRCTX),
     DO_BIT(HFGITR, CPPRCTX),
     DO_BIT(HFGITR, DCCVAC),
+    DO_REV_BIT(HFGITR, NGCSPUSHM_EL1),
     DO_BIT(HFGITR, ATS1E1A),
 } FGTBit;
 
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 1a64acd584..d17c17dcb7 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -43,6 +43,16 @@ static void gcspr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value & ~7);
 }
 
+static CPAccessResult access_gcspushm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    int el = arm_current_el(env);
+    if (!(env->cp15.gcscr_el[el] & GCSCR_PUSHMEN)) {
+        return CP_ACCESS_TRAP_BIT | (el ? el : 1);
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSCRE0_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 5, .opc2 = 2,
@@ -81,6 +91,11 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 5, .opc2 = 1,
       .access = PL3_RW, .writefn = gcspr_write,
       .fieldoffset = offsetof(CPUARMState, cp15.gcspr_el[2]) },
+
+    { .name = "GCSPUSHM", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 0,
+      .access = PL0_W, .accessfn = access_gcspushm,
+      .fgt = FGT_NGCSPUSHM_EL1, .type = ARM_CP_GCSPUSHM },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 84c62fdb4e..0d2df839f6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -26,6 +26,7 @@
 #include "cpregs.h"
 
 static TCGv_i64 cpu_X[32];
+static TCGv_i64 cpu_gcspr[32];
 static TCGv_i64 cpu_pc;
 
 /* Load/store exclusive handling */
@@ -77,6 +78,10 @@ static int scale_by_log2_tag_granule(DisasContext *s, int x)
 /* initialize TCG globals.  */
 void a64_translate_init(void)
 {
+    static const char gcspr_names[4][12] = {
+        "gcspr_el0", "gcspr_el1", "gcspr_el2", "gcspr_el3"
+    };
+
     int i;
 
     cpu_pc = tcg_global_mem_new_i64(tcg_env,
@@ -90,6 +95,13 @@ void a64_translate_init(void)
 
     cpu_exclusive_high = tcg_global_mem_new_i64(tcg_env,
         offsetof(CPUARMState, exclusive_high), "exclusive_high");
+
+    for (i = 0; i < 4; i++) {
+        cpu_gcspr[i] =
+            tcg_global_mem_new_i64(tcg_env,
+                                   offsetof(CPUARMState, cp15.gcspr_el[i]),
+                                   gcspr_names[i]);
+    }
 }
 
 /*
@@ -420,6 +432,18 @@ static MemOp check_ordered_align(DisasContext *s, int rn, int imm,
     return finalize_memop(s, mop);
 }
 
+static void gen_add_gcs_record(DisasContext *s, TCGv_i64 value)
+{
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+
+    tcg_gen_addi_i64(addr, gcspr, -8);
+    tcg_gen_qemu_st_i64(value, clean_data_tbi(s, addr), mmuidx, mop);
+    tcg_gen_mov_i64(gcspr, addr);
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -2765,6 +2789,11 @@ static void handle_sys(DisasContext *s, bool isread,
             }
         }
         return;
+    case ARM_CP_GCSPUSHM:
+        if (s->gcs_en) {
+            gen_add_gcs_record(s, cpu_reg(s, rt));
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


