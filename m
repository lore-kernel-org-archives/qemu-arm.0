Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC13CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:13:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOE0-0006MU-H8; Sat, 30 Aug 2025 12:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usER1-0007LK-5s
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:32 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQz-0004x4-C1
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:30 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b4c8bee055cso1609455a12.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532848; x=1757137648; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RlMDePceCGyIDKPJVA4FDsC5S2EUjyL2Wq20QLthmQU=;
 b=gXmWZuUcIHUQp5jj1zFRZprjeJxRLp9PnPN6oGbC+kvIwwzvUHDXthu1Ns4pZ7a8EU
 xR1jsHmVxRN9YA7V4E9fxmFbSpiJdSXfG3P6h/Yfs4lCOY7rad+o1xwzoCfrQnl76b1c
 wUXYmdr5kb5M1M/BqgaIUPt20486t9y52U7NSHgUSM90Pkvtj6BI4CYnpCxYCx5YBkB2
 nZrNRMVbGPKpXp4cvdEQ89enmyA8G2cA606E5EKm8bl+RWQ1+22YXUXuRCwIsIFLN7p8
 t9v47ujheJLT09G8MNHMfurJLBnetoxgcQdFUUXbHAj5ZCuK51aFHVQ3zC/5nBl9KvMh
 S7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532848; x=1757137648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RlMDePceCGyIDKPJVA4FDsC5S2EUjyL2Wq20QLthmQU=;
 b=KOJxBOnGd3z0GQfxYZ2STeii2ubhQ0AaRtmSpHK3miKP8zlfm/TgPSu+oXh1Sj+Xgo
 vk7EZGPG++dmYnP9vj+4V5J6Hxibvyf8jRkbkaWHT5Mqy8PsF4yW75iuB7NTgjymNFfS
 6KFB1OPk+93tcSNTV05stF5nMHtSEpF/guC0ptRIUoawk9HXS9gM6ilLyaThzSD10P3Q
 AothYoVQ/NRlm84hK4ZMj6wK47NwVfBxkdSDOlToO2JJbasAZz+cKqrxMeK3OfYezgZe
 pJtCaaWtsT0YTAcxhNRUBkpQmFwXpTPl10Xf5ukap3Qy6sLUeit0NNlT0Yhclc54Z4Y0
 qzew==
X-Gm-Message-State: AOJu0YxTnw+2xNQPS/FF8Y0yzmx9f5G65kLs84eopVVP3Vr+gUpQbQ0A
 b4Tl2F34THxjWWKZM6n/BMVHVucsmW5HZRyfwfiAOI5fVgqjrT6Bj9/9Xf2mRCFvM/k=
X-Gm-Gg: ASbGncstWusFV5aAGr85lYHwdW/FMQN5W2Js3WElpibuFNPMS5ewL1nbvBTitmiSu0J
 sRF/cSqDaJNk5aGacaThtafwJqQRKKFjxWzzIZ9iXR2JxxegXhyTRQ6+QWieoa+Apl1wCos6nfJ
 HlgeXGbDaDlAM9YsHz7STVhOWRUuVAgm1MncBoAf+lVP0R55SqR5+WCYR2BN1o7+MYu/sSxJmGs
 xnkuw29LttK2HKkWPmZUCfvBWxWnl2+w3sZuZaByRTdoMLdw4/Dj27XlX3f0N979pc+kChiuxEn
 OOedFa/FjFQQugmtyUuFVSMYadm0pOAZKqJTABn0qzVEwMytOPG3H4B6NWx0QOhYc2BE8K8W2Qx
 VvPzljHSq/ZTSywkETlH0i8SyJSfe6afC4jdIyhPKbduX784JsH80EARrorQRhIpqzvaKvTrzUw
 ==
X-Google-Smtp-Source: AGHT+IFKw/EXUIEpDBTlJuhWT5kNLq+Tw1YQuYA0rj1867Uco05R/Ogl8Njfalg4qUQO1SU9Qtlk3w==
X-Received: by 2002:a17:902:d4cb:b0:246:cfc4:9a52 with SMTP id
 d9443c01a7336-24944b64b33mr14862055ad.52.1756532847892; 
 Fri, 29 Aug 2025 22:47:27 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 61/84] target/arm: Implement GCSPUSHX
Date: Sat, 30 Aug 2025 15:41:05 +1000
Message-ID: <20250830054128.448363-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
index fdefb2e17a..c688d0c391 100644
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
@@ -99,6 +112,10 @@ static const ARMCPRegInfo gcs_reginfo[] = {
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
index badc24d2a5..e5d9a6e837 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2531,6 +2531,35 @@ static void gen_gcspopm(DisasContext *s, int rt)
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
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2818,6 +2847,14 @@ static void handle_sys(DisasContext *s, bool isread,
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


