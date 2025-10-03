Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92590CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:36:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jMv-0000qc-Ml; Fri, 03 Oct 2025 13:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLG-0006n1-Eb
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:16 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jK6-0007mf-CS
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:14 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso3495042b3a.3
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511507; x=1760116307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vTcN1bmbjlBmSHOppZaWA7zST739/0Swmy38eG0HYE=;
 b=c0S1MReBxcWmXkpWgeTDiALchHZ1TgMRabeaJAB81ORgZpr3g6qdvivCA8UuU7JZkP
 Ff3LeEskmiTk7mRB6UBLup8+oYIhR9n/2JLRTiCQ6ukHthko97+nfqbAP637YQO/vyNV
 3UQahfceIUnJs91ynUKm1QoWdw+P/YD0Dlzrmtqfu3ZuDFvDXLwFVon6h4mtR1RKke8L
 wnVNVikF1qEEU1k/j8TRKze0/D0k9X91nBgOwXAs2NntYnphxRdoee5q+cI4pgCbidLF
 jNBHHYaJOAzvyISQdIWee5bgt+rM7VL00NzNjX3sIDHdw8Tm4K2pbGEWnXLoD/ybcyl3
 jTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511507; x=1760116307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+vTcN1bmbjlBmSHOppZaWA7zST739/0Swmy38eG0HYE=;
 b=olrOBKAtIeht+BtOhRMvNLvMYBtZWxx03k1I7IZtMTmzFMnzl1JExTsIh900Cpc1hV
 GUWSVtwQJ1cu0veKcRcIme/kM4tlQWEFtqJKGyC3zgWYMTXewpCickSY+/mi05tkw3vP
 y2yPYLfC5GaNKUmCuU1yevd25c2CY0nX/I6zILVtWsfKO5fpZqtbUvPA+hoeu5gJetFK
 p+bwgITFVxICjIRWUv8SOBfKh6eihryxojTS/pcDy1HCS1u/lDWI0Lil99KxB5WN89Wo
 1oKbGik5U2offwUwetPjEZW+xxPQYvpY9Ra5PympdzB/GsbiwARDukyDZwO0HML77izn
 mLjA==
X-Gm-Message-State: AOJu0Yw49IJsxEIvB5bRk+geekNHxRrkm0LGlMDAlKCbWgqJZU40qXta
 OWsqSGnYRnoYXxPdiQB9ZE6Wt8b85xN8gWSeqXY3p/RAbbxb4qj1X9o6bcl+IQOSQRc=
X-Gm-Gg: ASbGncvlw2DNITo5SzMFBNURaLH3gSoWe91DLwI48xcfSQEqfr3NzFGer5e4rJh7Ni3
 +mJ9EXuSYSikX1FdvzMf9hpzUJia+vOz6HX520rg4y0QZa6k3n16iu3T4e+Cam27yn5TfNU9fHW
 HGrhxYGMInipFKopcBWrOVpHXc6Ex7TEJ4G7A4AZ/WHExTj3rzF7gKD3tYznbC0xk+8wwh+BT+8
 IT++TqFeaTBc5V6KAa+7oYIHJnUkdJuSCMKQ3G0Xjl7h1WihyrLHvTH36e/vOAdNjBW4CMoe8Xc
 TcIOuZK3Zil5/duZP9Fj4K3mFSKF6710wNzgHUPuWNOXz7u2ayxaBfGb24A12EUt47V+0k3hZXS
 I2PgBGlH1Eg1PBRfWabNF9/AFicI65+FFNk6uJZZX6WRl2piQi9wllJOJ
X-Google-Smtp-Source: AGHT+IHfPwHgOQ4193+Z5WW3eJcujKTU2cH1KfVCyhj70tyAAcd6xtES1KGcBOBcWLHg2fjZdJvLfQ==
X-Received: by 2002:a05:6a00:1394:b0:783:6042:114a with SMTP id
 d2e1a72fcca58-78c98dfdb38mr4993172b3a.25.1759511507370; 
 Fri, 03 Oct 2025 10:11:47 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 50/73] target/arm: Implement GCSPUSHX
Date: Fri,  3 Oct 2025 10:07:37 -0700
Message-ID: <20251003170800.997167-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/arm/cpregs.h            |  2 ++
 target/arm/cpregs-gcs.c        | 17 ++++++++++++++++
 target/arm/tcg/translate-a64.c | 37 ++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 81d8f0e32b..909916b7fd 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -50,6 +50,7 @@ enum {
     /* Special: gcs instructions */
     ARM_CP_GCSPUSHM              = 0x0008,
     ARM_CP_GCSPOPM               = 0x0009,
+    ARM_CP_GCSPUSHX              = 0x000a,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
@@ -875,6 +876,7 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, CPPRCTX),
     DO_BIT(HFGITR, DCCVAC),
     DO_REV_BIT(HFGITR, NGCSPUSHM_EL1),
+    DO_REV_BIT(HFGITR, NGCSEPP),
     DO_BIT(HFGITR, ATS1E1A),
 } FGTBit;
 
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 15d383b2a4..e6c7025d02 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -53,6 +53,19 @@ static CPAccessResult access_gcspushm(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -103,6 +116,10 @@ static const ARMCPRegInfo gcs_reginfo[] = {
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
index 6e088d638a..c918e3acfc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2539,6 +2539,35 @@ static void gen_gcspopm(DisasContext *s, int rt)
     tcg_gen_mov_i64(cpu_reg(s, rt), value);
 }
 
+static void gen_gcspushx(DisasContext *s)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int spsr_idx = aarch64_banked_spsr_index(s->current_el);
+    int spsr_off = offsetof(CPUARMState, banked_spsr[spsr_idx]);
+    int elr_off = offsetof(CPUARMState, elr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    tcg_gen_addi_i64(addr, gcspr, -8);
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
+    tcg_gen_mov_i64(gcspr, addr);
+    clear_pstate_bits(PSTATE_EXLOCK);
+}
+
 /*
  * Look up @key, returning the cpreg, which must exist.
  * Additionally, the new cpreg must also be accessible.
@@ -2856,6 +2885,14 @@ static void handle_sys(DisasContext *s, bool isread,
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


