Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp260946ejc;
        Thu, 31 Aug 2023 16:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNDxFNbv3nGLcphLMJp5dXi+nOHomk6Edsnn4ie2sZyHovLdPZZvQztZgWVWJggTsF18Jt
X-Received: by 2002:a05:6358:990d:b0:13a:9d5:356a with SMTP id w13-20020a056358990d00b0013a09d5356amr670954rwa.21.1693524331437;
        Thu, 31 Aug 2023 16:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693524331; cv=none;
        d=google.com; s=arc-20160816;
        b=eM+/bhwUqNx6PSLJrk/NBIzELB+i7nQVHeSXs4F5cKYhrrWMC1PhYt2GDsUsQL1HXf
         bd/FWWFJbglf7LauKFciM6MlLIqApEUhMABND0A+s3EAOnXMj676YKxmt0BFb4bNGijI
         2gAEQ5pAB5Kcla2MMnMUk2dgskWlftIhBIuZ1nNx5sGxfiIhP4RNLkKgl+53vPjrh0z0
         EoB0vw9Ob13zVdXHf8rGxoyIK1MmTjVcm/GWgSYEV2APFNEk/wSXLyK6XMe3TgWHb+Xe
         oRoDz9COKfhH6O2MRZttneqNhq6JSRSbbQFhMRE9JPWpkb44TQosw8omScuDSe64nYl+
         U7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4qI2v8dkaMA+Ey6DiDpJl+F5PeeixKFwiYK6goiJTlc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=U1+UJSPD3SgPaI6kFJWH3wFqxhQBEKy5mvnpeNDVykpsEC6B/uRkMjUBd5xUQ82XPQ
         socOzyPHUD3hu5eeXL039jx70yO8e+i6BBt7MVW+d+/+Wa6TjS+BVEWJGlFphRcbVzcZ
         JWNPBPuZvl9zpdKzb8GC3/fSDnQsAQNqGBUOBeMWwwoe/3YG8QcG/4C7IPNfo6K2ZGHU
         tTWtFtFQuX3C0YEhlWRszrAh+IN4tsrrQdGa0Bw8oOFha4tkp2SCwtGQm56vCji8QEu+
         InQB4snajHtfIZSL9u0ZWr9gATOk2pjPTZKzbIFuMcaYC5Y2RhSkJLN6y9rCsUz7+LwW
         D2Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ytKj7u1b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rv17-20020a05620a689100b0076ca3a2ee0esi1546554qkn.232.2023.08.31.16.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 16:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ytKj7u1b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbr24-0006qV-1K; Thu, 31 Aug 2023 19:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr22-0006oX-6Q
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1s-0002Hk-DA
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:57 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bf3a2f4528so11274505ad.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 16:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693524285; x=1694129085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qI2v8dkaMA+Ey6DiDpJl+F5PeeixKFwiYK6goiJTlc=;
 b=ytKj7u1b+uREoFuCqfVxl815/SGpzHWUFERVHsFuq7qvDZBekSIVV2gGlWR90Lr1pi
 6/Z8JdgS53gG7BUGQ64RLOsBeiF9bwBiJ/cNtc0slfkBMrrdnCGhV/SrlcNQ58iEUiEP
 ZMzGEVzkfL2sM8jMfeKABa5mADeI1g+mof3ey5BXkSA3Y2JfGAr3wn//q/2Es9oP/qB6
 huJtygJVSkB6Gn18yV2G/jMtNDf1RhhEL9agSFSKiPyep5zGzNTSGsgCshRPVWN+Cdvf
 tEJ/qYQWy80sVFN6pGdzkvhM+tEAIbUZqgaZIGb7XzbZjNEgUbczVGUR4gNrcnpiec+r
 Ye2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693524285; x=1694129085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4qI2v8dkaMA+Ey6DiDpJl+F5PeeixKFwiYK6goiJTlc=;
 b=kaDgF4PwKYJil1dAyaVKA4Mm9YFyzsZ0ZXu6hT2b4XikEETERRcOgAG3XUST53E2kL
 mQPs6YOeqpERfKzJhegv06ZDdE20Dairre6p2KCF1VaaY0ORq2Hc0hhNPR2e0oUIgJ4j
 z1951jkqiUHhK+aFQMOlupebZBf0Zsu5nnJ2ZqwZU8adT2sfJmY2mi6a/f4MKbWoRHhe
 HzRiif7z3/8ftqkfS+9ZyFDiqgCtGzi3UBVnJV5oBVHmyETX+p9JPEPHCpVN4RmidsOO
 1kFbkQB3Nu4uErTpunC7fR91binwMNi0HKob9VsPLi+5+m3jI8/2Fy/MICxdUzAqpn57
 87Iw==
X-Gm-Message-State: AOJu0YxT+KIUcpFUkNHb/2sp6H5Jgp8r0cU6bCvDzRp/WrdpkeG+pVPE
 ogG0Q8foCZHKN6Qbu3ZclDlZwn7+qEzq+Wpaywc=
X-Received: by 2002:a17:902:7449:b0:1c1:fe87:f550 with SMTP id
 e9-20020a170902744900b001c1fe87f550mr1162857plt.7.1693524285692; 
 Thu, 31 Aug 2023 16:24:45 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001bb8895848bsm1732711plb.71.2023.08.31.16.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 16:24:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 4/5] target/arm: Implement FEAT_TIDCP1
Date: Thu, 31 Aug 2023 16:24:40 -0700
Message-Id: <20230831232441.66020-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831232441.66020-1-richard.henderson@linaro.org>
References: <20230831232441.66020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gHZrpnf41Mwi

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst  |  1 +
 target/arm/cpu.h               |  5 +++++
 target/arm/helper.h            |  1 +
 target/arm/tcg/cpu64.c         |  1 +
 target/arm/tcg/op_helper.c     | 20 ++++++++++++++++++++
 target/arm/tcg/translate-a64.c |  5 +++++
 target/arm/tcg/translate.c     |  6 ++++++
 7 files changed, 39 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2e6a7c8961..ce81fd82fc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -85,6 +85,7 @@ the following architecture extensions:
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
+- FEAT_TIDCP1 (EL0 use of IMPLEMENTATION DEFINED functionality)
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
 - FEAT_TLBIRANGE (TLB invalidate range instructions)
 - FEAT_TTCNP (Translation table Common not private translations)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 278cc135c2..c4ce1b915f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3947,6 +3947,11 @@ static inline bool isar_feature_aa64_hcx(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HCX) != 0;
 }
 
+static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR1, TIDCP1) != 0;
+}
+
 static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
diff --git a/target/arm/helper.h b/target/arm/helper.h
index cf5c55a12b..2b02733305 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -81,6 +81,7 @@ DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, cptr, env, i32, i32, i32)
 DEF_HELPER_FLAGS_2(lookup_cp_reg, TCG_CALL_NO_RWG_SE, cptr, env, i32)
+DEF_HELPER_FLAGS_2(tidcp_el0, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_2(tidcp_el1, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_3(set_cp_reg, void, env, cptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, cptr)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ab63526bea..b9691f24f8 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1069,6 +1069,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
     t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
     cpu->isar.id_aa64mmfr1 = t;
 
     t = cpu->isar.id_aa64mmfr2;
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 9014c3ca46..403f8b09d3 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -777,6 +777,26 @@ void HELPER(tidcp_el1)(CPUARMState *env, uint32_t syndrome)
     }
 }
 
+/*
+ * Similarly, for FEAT_TIDCP1 at EL0.
+ * We have already checked for the presence of the feature.
+ */
+void HELPER(tidcp_el0)(CPUARMState *env, uint32_t syndrome)
+{
+    /* See arm_sctlr(), but we also need the sctlr el. */
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
+    int target_el = mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1;
+
+    /*
+     * The bit is not valid unless the target el is aa64, but since the
+     * bit test is simpler perform that first and check validity after.
+     */
+    if ((env->cp15.sctlr_el[target_el] & SCTLR_TIDCP)
+        && arm_el_is_aa64(env, target_el)) {
+        raise_exception_ra(env, EXCP_UDEF, syndrome, target_el, GETPC());
+    }
+}
+
 void HELPER(set_cp_reg)(CPUARMState *env, const void *rip, uint32_t value)
 {
     const ARMCPRegInfo *ri = rip;
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 786a568d31..15d985d95e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2163,6 +2163,11 @@ static void handle_sys(DisasContext *s, bool isread,
          */
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
         switch (s->current_el) {
+        case 0:
+            if (dc_isar_feature(aa64_tidcp1, s)) {
+                gen_helper_tidcp_el0(cpu_env, tcg_constant_i32(syndrome));
+            }
+            break;
         case 1:
             gen_helper_tidcp_el1(cpu_env, tcg_constant_i32(syndrome));
             break;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 47d3bc5fd5..976b704200 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -4640,6 +4640,12 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
          * but raises the same exception, so order doesn't matter.
          */
         switch (s->current_el) {
+        case 0:
+            if (arm_dc_feature(s, ARM_FEATURE_AARCH64)
+                && dc_isar_feature(aa64_tidcp1, s)) {
+                gen_helper_tidcp_el0(cpu_env, tcg_constant_i32(syndrome));
+            }
+            break;
         case 1:
             gen_helper_tidcp_el1(cpu_env, tcg_constant_i32(syndrome));
             break;
-- 
2.34.1

