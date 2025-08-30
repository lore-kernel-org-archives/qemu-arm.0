Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461FACA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:54:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOE3-0006jK-Io; Sat, 30 Aug 2025 12:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usER7-0007Ng-SQ
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usER6-0004xw-0f
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:37 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2491f6b39a1so7966415ad.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532853; x=1757137653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NOZ/CjfdiSdINiVTxT9+lF6CMC4POOvU27v/qSr3hZo=;
 b=yD4ahFvGk+fFwWuPTkW7XYYJvsziKdcG7bYs/WVMxofLu2/jIwtbDfCoCp4SnErnIk
 VJDbpR7bLsVOthlks5S905YYWKBdwqEsQtZCsjKBdxdWt+f4fULg6IyOtSrDHwvm5+o4
 VPJJezCyPjomIu+6biX1IBL3iH6UDuxoxUvBhCtL03hpL61fIHkpDoSL9rodz8FylxI9
 M7PLJUfa1OVflrfU/rnYFOudm74JPcmB5um52E+vPWX8Hgx7qiJGEHattLHMD4w5Yw1d
 zvLHYmpCmM9qHvAoYi9RpAoj219YBo853I6XEgYFR516uX+IQvr7Iz+12JcEH3RRgq8U
 CtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532853; x=1757137653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOZ/CjfdiSdINiVTxT9+lF6CMC4POOvU27v/qSr3hZo=;
 b=p7hEDCZCKqJdRU6VCaOZhKEPbm0s364xg9OpRCuaTEMKkRw6vwF6D29NC/IFKLtxxe
 UW24Zg7J3+kNI6czIyTb+qOtpSGPMQBJPiRbpTw1mEEPWrNnZw6Kp3bWHvS6hN7bpoed
 fVIq7PoSz3nFit6PI9WcDSMResd2SACgLuNkCnWjRbhF3nFTuOx1CXHa5kPnkUfqnPbk
 aWsaRCiINlReU3GdMEgfhKuynyB0Nbjw/AzS5orSKwrRRPmGVYxPKmVwOErWLI8aFB1B
 HyB76m+LEBIRdZPfKqOTqs46no2H4Fg4b1jwljZOltQIJfNQkWfb7TlPq8IeohMtyqWe
 r1sQ==
X-Gm-Message-State: AOJu0YxFuOxt8vi68H2jE3qrmdDZG6Hs37yz+Kpy4Bg/GuYIJCdXANDx
 6T5Ty3GO03nesddSruFDd4ky8ee/0J6Y6oHjN8/BtD9l5ugj/72u54aUr0n0wckHItA=
X-Gm-Gg: ASbGncs3zvqMspSy2wn0a/URZs7NhyhdnJ096HfVrvRFxmyATQSlfEvh+TL7tHSYo/Z
 u26GdV6dl/08v/URtd+GB8NJHnebAAFN+NUPrXuezfmAvBVFGJCjRVtTvghS8vJzSLEcExLhqCz
 /RqxhWMEqljBgZzcfF7CWW3xN9gbmTNdihYGsJ+jU648Et3nUq5OLG74dBv7aculltmlkuYcYAl
 Iz5qv4NT87cc/F6yBBzd4n9631I3MDv36QhIVOdl9UrH6A0Pb1bVYqYycmQSwB2bDIjuEz2qGk5
 J19ZQA0JMemj34oj3N3CMZQAs8eASO10h3vlJCFjd4yrI+LIcQWt9mYWjNrB8ZqRw4lvD/2Q155
 tKd5yE5V0TwC3GgTC4vxCAHWnyWuk9Sdyt/lSSLwipBiNSMIO29mSu2sSSFBXtt4=
X-Google-Smtp-Source: AGHT+IFtl4VxsxAD7HgGCs0U4jiD1GJuCGQlWccATysjMmf/s6AC7gyParEuYn/IqO1AbHzhNb3EJg==
X-Received: by 2002:a17:902:e788:b0:246:a165:87c7 with SMTP id
 d9443c01a7336-24944ac69b5mr10754905ad.42.1756532853206; 
 Fri, 29 Aug 2025 22:47:33 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 63/84] target/arm: Implement GCSPOPCX
Date: Sat, 30 Aug 2025 15:41:07 +1000
Message-ID: <20250830054128.448363-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        | 17 +++++++++++
 target/arm/tcg/translate-a64.c | 56 ++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

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
index 2d39b17188..3236f607f3 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -66,6 +66,19 @@ static CPAccessResult access_gcspushx(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -116,6 +129,10 @@ static const ARMCPRegInfo gcs_reginfo[] = {
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
index b0a1a62a91..193c199a2e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2560,6 +2560,54 @@ static void gen_gcspushx(DisasContext *s)
     clear_pstate_bits(PSTATE_EXLOCK);
 }
 
+static void gen_gcspopcx(DisasContext *s)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
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
+    tcg_gen_qemu_ld_i64(tmp1, gcspr, mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp1, 0b1001, fail_label);
+
+    /* Validate in turn, ELR ... */
+    tcg_gen_addi_i64(addr, gcspr, 8);
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
+    tcg_gen_addi_i64(gcspr, addr, 8);
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
     TCGv_i64 gcspr = cpu_gcspr[s->current_el];
@@ -2882,6 +2930,14 @@ static void handle_sys(DisasContext *s, bool isread,
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


