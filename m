Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1339020ejc;
        Fri, 27 Jan 2023 09:58:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtroO8nQ9bREsQ6uYPyjiW3Bzc5Yz9p9fGduRP5fL11V5AnZxNPtWUGhAzAbcplyt2ny8Jh
X-Received: by 2002:ac8:12c2:0:b0:3b3:6088:9e7a with SMTP id b2-20020ac812c2000000b003b360889e7amr52892721qtj.36.1674842337167;
        Fri, 27 Jan 2023 09:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842337; cv=none;
        d=google.com; s=arc-20160816;
        b=ROPqJ5dmw/q+rLQYmDSuUf1/XgmgP7K75wgasVeWuo1ctgnb/YwoNG1nOXTjtyiSEp
         2EedELBePkePL5Olqa/yHWqoI8pi750sUtmCjEhnwqctK+jJ2unBBB483OP1TdOFFX3N
         gJFgllqIHZA275C3Qk9m5hWkX1JVHbO86vsLJ2TXn6MwjRCplDkIOPathm5T3YPsIvgN
         bcRXn87+NMjc60+RK6S3rtBWLkst0WlBMYUrQupSXvSXI53YpAI3/rJ6TyX3kDCUX4nX
         qeBoZbMZPbeF/HMTP7/g2+wibAAGbxrsY3DHfBCUcBMtkrf19Ts/YsEqN8PrXR2klrZM
         jMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YpvewRgrpa5vSbj3hihUkuq2kpNmpQp+aUmPHVOPmEs=;
        b=AV45AlFkwPPclvQZKcE2K7xoNfVpOt61GHlDQtX5zQyLXFGe4/3Trlipgn0N4fR1Te
         0AEMp9lP6wOhXJpXjuiihuT9ScUMr9MQ8M1oFd4A0ij/ZOdmEoLFUvsmNCHO/Je3lBvD
         9gZ5F1lGjZxonJeXvVUOmEU6YJsZsLpgFbvXGp/94DO1g+SDjGaehETcjcpO7rTJoZyW
         85s48moCgU7cjCmD1rslhAP0SPqbRjlDGolsj3REXafiCnSzMrpj9B+mlzwtdF+2OFkx
         3hUVabjG2vyBr2V76Dnb3pmq2gG0Xgmy/BKcgCV5xh/FnB98g2/Oivu1oFlVpZ3nAzLu
         wOzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qp9cBtf+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a05622a004300b003b0b904616fsi2741350qtw.615.2023.01.27.09.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qp9cBtf+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLSx8-00014G-4b; Fri, 27 Jan 2023 12:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSx0-0000wS-HK
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:46 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwm-0005yR-Ku
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so5641547wrz.12
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YpvewRgrpa5vSbj3hihUkuq2kpNmpQp+aUmPHVOPmEs=;
 b=qp9cBtf+FhuyWxbbVD51ZZ+Xf6pdpzOIO6JH3szeXr9yOg1w1y3966fy3dzN4VzJbe
 +NrxZvNnpaekAVWjD3D8sZYhXj0uqteumheErBgAxBka5HkHn7+xM7YCP9A6YorhxD82
 EP1DcdTvvwSvVWnUpCY8HqkdXNLbOdctoFV8HuGPNK/ihG3tNcwKPV6M5VqrvFJST5fj
 CFuV4jJawkM7fTiqkKLqGAdIhWCHtA2KMU2ezEzrfSGDy/i/DEbYom29TXEXT0jXkgaU
 dSqgNpbxlo37So5oVnmluMIpKHa3DYxey+HJHfwfHXb0aDpNOUiO4qG8Wvflu4YSXCx9
 Cknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpvewRgrpa5vSbj3hihUkuq2kpNmpQp+aUmPHVOPmEs=;
 b=4+2m7s+JBnxUGC9R0RqxFYbuOKqKzW9iDrgi1F03OsqpL4u0wMA2BlyQlQ3HsK3lKs
 AX3rAoSpaZYx6IJWqhvFDCttVqrSxwW0mFYy29jfmni3/mgPgwUHStMPDY2VAgYCGVvo
 9FQ25rWQXd4+8I5083YEqXFzgkjluZLNom6KYBjbbV2wrfDcLAXPseX7wK8KLND5qsLz
 PdBapxfniDQ/mR8910K9KuKoCGJ1ulcLRouJxjctY/sfIOpnB2Oh3UVhW6Vxs5rCEjw8
 MAm/sq/h/Q8JMyxTWTAFn7SjEUOdw4Wvd2YNeNjEY+wEpDeCu03iiq4frJjvKsRs/Dci
 BtWQ==
X-Gm-Message-State: AFqh2kpyk4WFmvxmtByi3/12No13E5FBiME04YebI3AADx+aOrZnhGnE
 u89K3tjkip/dljWGA9Ul8Q+kHgpuAklsVK/L
X-Received: by 2002:a5d:6282:0:b0:2bf:9516:d295 with SMTP id
 k2-20020a5d6282000000b002bf9516d295mr22260182wru.22.1674842131947; 
 Fri, 27 Jan 2023 09:55:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/23] target/arm: Implement the HFGITR_EL2.SVC_EL0 and
 SVC_EL1 traps
Date: Fri, 27 Jan 2023 17:55:05 +0000
Message-Id: <20230127175507.2895013-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1e8CzqYiZQMc

Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 fine-grained traps.
These trap execution of the SVC instruction from AArch32 and AArch64.
(As usual, AArch32 can only trap from EL0, as fine grained traps are
disabled with an AArch32 EL1.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        | 20 ++++++++++++++++++++
 target/arm/translate-a64.c |  9 ++++++++-
 target/arm/translate.c     | 12 +++++++++---
 5 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ec2a7716ce7..7bc97fece97 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3171,6 +3171,7 @@ FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 FIELD(TBFLAG_ANY, ALIGN_MEM, 10, 1)
 FIELD(TBFLAG_ANY, PSTATE__IL, 11, 1)
 FIELD(TBFLAG_ANY, FGT_ACTIVE, 12, 1)
+FIELD(TBFLAG_ANY, FGT_SVC, 13, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 62a7706eabd..3717824b754 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -134,6 +134,8 @@ typedef struct DisasContext {
     bool fgt_active;
     /* True if fine-grained trap on ERET is enabled */
     bool fgt_eret;
+    /* True if fine-grained trap on SVC is enabled */
+    bool fgt_svc;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6151c775053..c62ed05c122 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11842,6 +11842,20 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
+static inline bool fgt_svc(CPUARMState *env, int el)
+{
+    /*
+     * Assuming fine-grained-traps are active, return true if we
+     * should be trapping on SVC instructions. Only AArch64 can
+     * trap on an SVC at EL1, but we don't need to special-case this
+     * because if this is AArch32 EL1 then arm_fgt_active() is false.
+     * We also know el is 0 or 1.
+     */
+    return el == 0 ?
+        FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL0) :
+        FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL1);
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -11927,6 +11941,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 
     if (arm_fgt_active(env, el)) {
         DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
+        if (fgt_svc(env, el)) {
+            DP_TBFLAG_ANY(flags, FGT_SVC, 1);
+        }
     }
 
     if (env->uncached_cpsr & CPSR_IL) {
@@ -12068,6 +12085,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, ERET)) {
             DP_TBFLAG_A64(flags, FGT_ERET, 1);
         }
+        if (fgt_svc(env, el)) {
+            DP_TBFLAG_ANY(flags, FGT_SVC, 1);
+        }
     }
 
     if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 11bfa3f717a..bbfadb7c2e8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2179,6 +2179,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 21, 3);
     int op2_ll = extract32(insn, 0, 5);
     int imm16 = extract32(insn, 5, 16);
+    uint32_t syndrome;
 
     switch (opc) {
     case 0:
@@ -2189,8 +2190,13 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          */
         switch (op2_ll) {
         case 1:                                                     /* SVC */
+            syndrome = syn_aa64_svc(imm16);
+            if (s->fgt_svc) {
+                gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
+                break;
+            }
             gen_ss_advance(s);
-            gen_exception_insn(s, 4, EXCP_SWI, syn_aa64_svc(imm16));
+            gen_exception_insn(s, 4, EXCP_SWI, syndrome);
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -14751,6 +14757,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
+    dc->fgt_svc = EX_TBFLAG_ANY(tb_flags, FGT_SVC);
     dc->fgt_eret = EX_TBFLAG_A64(tb_flags, FGT_ERET);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c23ba5fa7d9..acd56c44336 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8835,9 +8835,14 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         (a->imm == semihost_imm)) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
-        gen_update_pc(s, curr_insn_len(s));
-        s->svc_imm = a->imm;
-        s->base.is_jmp = DISAS_SWI;
+        if (s->fgt_svc) {
+            uint32_t syndrome = syn_aa32_svc(a->imm, s->thumb);
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
+        } else {
+            gen_update_pc(s, curr_insn_len(s));
+            s->svc_imm = a->imm;
+            s->base.is_jmp = DISAS_SWI;
+        }
     }
     return true;
 }
@@ -9418,6 +9423,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
+    dc->fgt_svc = EX_TBFLAG_ANY(tb_flags, FGT_SVC);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.34.1

