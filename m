Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4A2C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:19:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRO-0001zb-IL; Sun, 27 Jul 2025 04:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPZ-0002gP-8p
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:15 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPX-0004oE-8v
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:13 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-23dea2e01e4so45488295ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603630; x=1754208430; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAD+04FqwSKw8DLKNS0UP167F5/dokMNRY9qi0ztYmk=;
 b=zZHzihO/ttgj20/+f5jSBFQwspvFgMtNBettLdEMsuGfB+MMYj2ZMDfV7JhZEsqCqK
 sBDVlt/AFMEW4aMYNv/Mg505KlwhuYU7jtRudDWPCds/gZW86hUVWQuZ6rlOD104Htry
 ZzKqEryRIW5W1YrI7bKNQz1JK0afCcXKF2z3Z5ekUdIdG89+CgxOeyWMGJ3CkfQ6MmNp
 Zms5rzfslgmkr4UkyeNUBEmfs8Smy1ZA0temM9Is6Tzb0nVjNe//bp4vs8pUawxioolR
 3PwhV4rL14/+PKWx3kZcfyBj16kyT70qVwhMtNCuGtMJPdyU8VmKiAAy8oxPg99Yrphc
 R4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603630; x=1754208430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAD+04FqwSKw8DLKNS0UP167F5/dokMNRY9qi0ztYmk=;
 b=hzTFozYG98yeK4+3PbTxMKoXkvsEvk0V0PQMobBFscGKAqpe/DhIkOzdy1wtjyGKky
 WJ6Cy2FC9HkZqXVx7VI+9rtK9qtsdUfE5LcHGoPQDqi4ckF3P0CPsM34VB7f2zLQtHSb
 CGXEa0507sudXh/5N66tl4Q63BQxmoNWPL1BV8/AKEFv/cbzdZd/jwtNwiic4ua1dXF4
 XHNtSARau1pn0dt5sW+sGw0LNwr68Cz5vg4Wpe8kn3QU5wsQWZ0qP+K2FxXJcrJxeYFA
 uBM9kckBOURRH5PJDrFEA+kGm2YHxZvgGyAAjUJEiamyOVZEl5FpF1tRVtijzsU2ieCM
 47zw==
X-Gm-Message-State: AOJu0Yx5upuH/3mXROW0ANNKiTvGFT9n30URmn/cRJskL8XdXs+VIHdW
 xmQ5D3TfzHb/Ik2Rf2meZNTzUZHNcYmeP3+MGCIExzxqpdgAy1YlsO14kgWvXzduUZmPvixRrXz
 qVo6w
X-Gm-Gg: ASbGncvjyg0UakSsPW+jy9/xBFJqbGH6uAhh1Pjh/9gEHPVx0U1xTcC6w2n7jo6i3F1
 Nw1QL6PM9kn/ozDl0+ydyq1chwxjHfj0aKK+IycgOi0h1eKtl8vLCXs7z6J/D3qB+L/usBOp4/5
 q2tLbgxhWfhGBZnQhZ1mc9AAnFtPiWi/yXDDUpthKryoa1yCvx+9w/GG3rluGzu+XcBVJBB9yUc
 7Yl4J07yLHvmp9cGevHLAL+2mhQsPxnOSQ5q/YLWvdUtK3q8QbzK9IPmnL2go4Hnwe6rOE6sVM8
 voW+L5WJ/Vbxrbd7G4WaHCdBSSGA8E9rKHNRlI/JvQVw60SbQ971nkkzeCwM1AIR1KoFZ9P6mG8
 Gj4S859WSfKRyNRxehZoWDMOmtYgUhDHGJou9uikUCmV8oKu3NcL7/AlE34nIapxg9FProv5l/E
 7gp6pM+6aIAw==
X-Google-Smtp-Source: AGHT+IGRGVkSQcbbDZejA4BH7Qq5Pd+P3cDd1yiNrCv4EzHOiV0dfvrfmb856jYel1ryf48cjsmTcA==
X-Received: by 2002:a17:902:f114:b0:23f:df69:af50 with SMTP id
 d9443c01a7336-23fdf69b14bmr34451645ad.34.1753603629908; 
 Sun, 27 Jul 2025 01:07:09 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 60/82] target/arm: Implement GCSPOPCX
Date: Sat, 26 Jul 2025 22:02:32 -1000
Message-ID: <20250727080254.83840-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
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
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        | 17 ++++++++++
 target/arm/tcg/translate-a64.c | 58 ++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 084ea00e51..392a0a264f 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -51,6 +51,7 @@ enum {
     ARM_CP_GCSPOPM               = 0x0009,
     ARM_CP_GCSPUSHX              = 0x000a,
     ARM_CP_GCSPOPX               = 0x000b,
+    ARM_CP_GCSPOPCX              = 0x000c,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 2bdd41c796..ab53a4314f 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -57,6 +57,19 @@ static CPAccessResult access_gcspushx(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_gcspopcx(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    /* Trap if lock not taken, and enabled. */
+    if (env->pstate & PSTATE_EXLOCK) {
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
@@ -105,6 +118,10 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
       .type = ARM_CP_GCSPUSHX },
+    { .name = "GCSPOPCX", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 5,
+      .access = PL1_W, .accessfn = access_gcspopcx, .fgt = FGT_NGCSEPP,
+      .type = ARM_CP_GCSPOPCX },
     { .name = "GCSPOPX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 6,
       .access = PL1_W, .type = ARM_CP_GCSPOPX },
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 773ed3044d..af91b7f95f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2555,6 +2555,56 @@ static void gen_gcspushx(DisasContext *s)
     clear_pstate_bits(PSTATE_EXLOCK);
 }
 
+static void gen_gcspopcx(DisasContext *s)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int spsr_idx = aarch64_banked_spsr_index(s->current_el);
+    int spsr_off = offsetof(CPUARMState, banked_spsr[spsr_idx]);
+    int elr_off = offsetof(CPUARMState, elr_el[s->current_el]);
+    int gcscr_off = offsetof(CPUARMState, cp15.gcscr_el[s->current_el]);
+    int pstate_off = offsetof(CPUARMState, pstate);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp1 = tcg_temp_new_i64();
+    TCGv_i64 tmp2 = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPCX, 31));
+
+    /* The value at top-of-stack must be an exception token. */
+    tcg_gen_ld_i64(addr, tcg_env, sp_off);
+    tcg_gen_qemu_ld_i64(tmp1, addr, mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp1, 0b1001, fail_label);
+
+    /* Validate in turn, ELR ... */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp1, addr, mmuidx, mop);
+    tcg_gen_ld_i64(tmp2, tcg_env, elr_off);
+    tcg_gen_brcond_i64(TCG_COND_NE, tmp1, tmp2, fail_label);
+
+    /* ... SPSR ... */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp1, addr, mmuidx, mop);
+    tcg_gen_ld_i64(tmp2, tcg_env, spsr_off);
+    tcg_gen_brcond_i64(TCG_COND_NE, tmp1, tmp2, fail_label);
+
+    /* ... and LR. */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp1, addr, mmuidx, mop);
+    tcg_gen_brcond_i64(TCG_COND_NE, tmp1, cpu_reg(s, 30), fail_label);
+
+    /* Writeback stack pointer after pop. */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_st_i64(addr, tcg_env, sp_off);
+
+    /* PSTATE.EXLOCK = GetCurrentEXLOCKEN(). */
+    tcg_gen_ld_i64(tmp1, tcg_env, gcscr_off);
+    tcg_gen_ld_i64(tmp2, tcg_env, pstate_off);
+    tcg_gen_shri_i64(tmp1, tmp1, ctz64(GCSCR_EXLOCKEN));
+    tcg_gen_deposit_i64(tmp2, tmp2, tmp1, ctz64(PSTATE_EXLOCK), 1);
+    tcg_gen_st_i64(tmp2, tcg_env, pstate_off);
+}
+
 static void gen_gcspopx(DisasContext *s)
 {
     int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
@@ -2879,6 +2929,14 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspushx(s);
         }
         return;
+    case ARM_CP_GCSPOPCX:
+        /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
+        if (rt != 31) {
+            unallocated_encoding(s);
+        } else if (s->gcs_en) {
+            gen_gcspopcx(s);
+        }
+        return;
     case ARM_CP_GCSPOPX:
         /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
         if (rt != 31) {
-- 
2.43.0


