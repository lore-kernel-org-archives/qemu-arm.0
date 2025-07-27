Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CF1C87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRT-0002lN-RM; Sun, 27 Jul 2025 04:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPW-0002Sz-U1
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:11 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPV-0004nK-4D
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:10 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-23636167b30so31242125ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603628; x=1754208428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8CYypw7eiczgAtGXhyBt3X1CyDsVK1kkaaTP5EVuds=;
 b=L4CsunAhnY5F4/geUR7Y2jg6VPG5LhaFRqikDTV8cAran1/H/0KSTwDT2kjzuD2VpJ
 iDL9R22m0G6k2T9jm0U136sULC1kT/0b2N9cfqFhay4s7xyYV05rBz3sVfHEYPRN2tM6
 SSOAGZyoH44c/wfbTd/2xfonmGwHY7uVoFEqo5EVqYGyPRh/wlPog2FO1vlPZ7MhUbaD
 F4Zw1om+ETxVqD1AJXtXOghfSucOYGA+iC0LJyIuj8xZSYyB8IzeMmAm8uOWkr3O4B1V
 Itwi60fjLy5OURfpb2UdG6FXoSoZNAviZBUwk6zqMU+J9FtEv7Jb2Yk/yJBeKElyvrMK
 FNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603628; x=1754208428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8CYypw7eiczgAtGXhyBt3X1CyDsVK1kkaaTP5EVuds=;
 b=ioJSrffwU/4RYoYrPXvtbs+AVap4B+qVL6HmZRm/76EaZfXaF3npFM6Zi0d/ZvCVZy
 VBj8iHdgyr14E9jzNtUlvEhwtpAN8JPZUom5TTukCcXaW6T6tp666uV5CU8EjJUdCiPj
 uqRUFlke954ZsHz0p0kzwWCWqqxJK0EL+tTpqX2t5BdjnodpRkfi8R8b/xMEwrH1l4C1
 eazVrPoWyvEQ8axgi9URhIi4tWVOXxEmAnQDf+SjXVb+zRdK8OI3QQmc5SeJ0EWY3tgf
 mECs/MDM/dwbhXVcVXEeqOmNTol0HwdVnkJvcMg0HVmrkMVg/toLHDFolX/2oSPgpRxT
 B09Q==
X-Gm-Message-State: AOJu0YzCi9nzQI6k70FpfhuefAhoDXlvxLx2OJT/XIfE4uUYOeZEy11H
 gRkg17uwipBJTYMal2Og46Bmv+NzTu1IYAaDsFNK8Tf/wFcDNyASknM4jUFpajyzTJ4=
X-Gm-Gg: ASbGncvLWatq6zURRsLq3BTb2P+urwnE2amFJg2YokrSwrekvwUEVxW4JdrVdp75t5E
 CyBfjetfxWxvQzwiuA28doWGxeogD1rST5NUvESH6k5rqLvv6ReDLvW6jcHYgnpu+bouZHRQwph
 ONCfskVObVMhB3XyzjjGzU4uL+AjCOQmT6T+y1xP6l53/meFPFGPCEPa1qA0cix0jUs6T2bMkla
 dJgyW3GhfyQgMC8BdTb1fTKZ+gWYGPvKsbQg9pgYz2h7lynd11RpG5BvD/jQUnqHdTdWzql0Jlk
 W6zVZ3C5TcRCFxiICkG84XtwuqKfWPInpv8Jf/JRI016Xnel6lmp7pbvOgOt3P+QC5vPRJRiZhN
 OiubuRhOZ1qr4T6XhpPlI9xrm6kgmZNTghc7aP72segnRhFrhhw6Qt0JqsoPUvF56GH9/T/Vt8U
 R5pCi/C0/omw==
X-Google-Smtp-Source: AGHT+IGc59+vQi1lvZpKyf1EWjzoQe6ZgMTT/sd5AqG8Qnf4JYRezUtcttHjuRL1Dzzy7ArdCvH2oQ==
X-Received: by 2002:a17:903:2b0b:b0:240:11be:4dd3 with SMTP id
 d9443c01a7336-24011be5835mr8172905ad.3.1753603627817; 
 Sun, 27 Jul 2025 01:07:07 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 58/82] target/arm: Implement GCSPUSHX
Date: Sat, 26 Jul 2025 22:02:30 -1000
Message-ID: <20250727080254.83840-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 target/arm/cpregs.h            |  2 ++
 target/arm/cpregs-gcs.c        | 17 +++++++++++++++
 target/arm/tcg/translate-a64.c | 40 ++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 9b19520346..3d76afd20b 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -49,6 +49,7 @@ enum {
     /* Special: gcs instructions */
     ARM_CP_GCSPUSHM              = 0x0008,
     ARM_CP_GCSPOPM               = 0x0009,
+    ARM_CP_GCSPUSHX              = 0x000a,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
@@ -865,6 +866,7 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, CPPRCTX),
     DO_BIT(HFGITR, DCCVAC),
     DO_REV_BIT(HFGITR, NGCSPUSHM_EL1),
+    DO_REV_BIT(HFGITR, NGCSEPP),
     DO_BIT(HFGITR, ATS1E1A),
 } FGTBit;
 
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 74a1697840..6f25543426 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -44,6 +44,19 @@ static CPAccessResult access_gcspushm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_gcspushx(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    /* Trap if lock taken, and enabled. */
+    if (!(env->pstate & PSTATE_EXLOCK)) {
+        int el = arm_current_el(env);
+        if (env->cp15.gcscr_el[el] & GCSCR_EXLOCKEN) {
+            return CP_ACCESS_EXLOCK;
+        }
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSCRE0_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 5, .opc2 = 2,
@@ -88,6 +101,10 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
       .access = PL0_R, .type = ARM_CP_GCSPOPM },
+    { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
+      .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
+      .type = ARM_CP_GCSPUSHX },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0279111cd2..732d65f54e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2523,6 +2523,38 @@ static void gen_gcspopm(DisasContext *s, int rt)
     tcg_gen_mov_i64(cpu_reg(s, rt), value);
 }
 
+static void gen_gcspushx(DisasContext *s)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int spsr_idx = aarch64_banked_spsr_index(s->current_el);
+    int spsr_off = offsetof(CPUARMState, banked_spsr[spsr_idx]);
+    int elr_off = offsetof(CPUARMState, elr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    tcg_gen_ld_i64(addr, tcg_env, sp_off);
+
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(cpu_reg(s, 30), addr, mmuidx, mop);
+
+    tcg_gen_ld_i64(tmp, tcg_env, spsr_off);
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(tmp, addr, mmuidx, mop);
+
+    tcg_gen_ld_i64(tmp, tcg_env, elr_off);
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(tmp, addr, mmuidx, mop);
+
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(tcg_constant_i64(0b1001), addr, mmuidx, mop);
+
+    tcg_gen_st_i64(addr, tcg_env, sp_off);
+
+    clear_pstate_bits(PSTATE_EXLOCK);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2810,6 +2842,14 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspopm(s, rt);
         }
         return;
+    case ARM_CP_GCSPUSHX:
+        /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
+        if (rt != 31) {
+            unallocated_encoding(s);
+        } else if (s->gcs_en) {
+            gen_gcspushx(s);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


