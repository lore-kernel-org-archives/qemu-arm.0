Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1149905ejb;
        Mon, 30 Jan 2023 10:26:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvMLYbof9o87FzyVhQs5vOMhHt2hZeiUTXnhJfhm1F6DrRsXXKFqxLm2wmOsOR/e8ZKxUEX
X-Received: by 2002:a0c:ee90:0:b0:535:5f72:d9c4 with SMTP id u16-20020a0cee90000000b005355f72d9c4mr52947998qvr.36.1675103210767;
        Mon, 30 Jan 2023 10:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103210; cv=none;
        d=google.com; s=arc-20160816;
        b=vCFY0gtBBt3jGfx3w9OvAVKmadzSegKbis2LRpDTnr0bLojlHbuyL2q/E6wlOj7xz9
         EEEL9eZVZ9BKtCToiv+aPKiqx3nfUUg0S7iu5xrcp+EGoRmSP2VsaIt0uDGBjEIWa3xh
         YHLOrAEL73eOaR5QqBAZDgpMbGvZSwrsHFe1rqaEjn0OIh94Tr24Pc+3fUghzMxMeE/t
         70xHHuw7GRkTebf74KlCWH76LVtcJ0qO2e7UExjQ08PkJhoci3/5ygA22hcHx7VVMS2u
         MWHQG5S7DcCdNsp8pJflg7qv+wXffjjKmp75Dn4+wuAKvCzI0oiNdcM29vLwTAISDFnj
         DCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VeFx9B0Mzz35VrXD2mipraCVegd6Rxt0nAjW/UplbN4=;
        b=qyG4lw3JayaJQYYorqwXqnDymaaAho0L4VYHTsYblX7cylm313o4WcNyVkqbF9++QH
         8P1OFUfAJQlnJ6KId13vTf3yOp4xCTjlPZqavs2l62Ou9YAwFQanLiIJjBioiGuW00oR
         qlv5QExwabSzYmyTLAnNSHWPk0jp1/6jKz6vjZ7cP5g8qcYIw3WeGAhJCZveOdhI5Fgj
         wlL+/Jcrk3z7bGGPuiQr4uARyLYxZAA95juUm8QJoLSoZnzwOYl6ahBn80lFO0TGQVRp
         saJwXtCsGziJafrsau4cohsJqzSV+bu/b7Sue/iFGo5gJ207Up3f6kN2db0kutNRcJQk
         mZAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3sdf5PI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a056214202300b004c791803422si8391438qvf.5.2023.01.30.10.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3sdf5PI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqS-0001EA-G8; Mon, 30 Jan 2023 13:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqP-0001C1-84
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:29 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqJ-0000At-PV
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q10so11992731wrm.4
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VeFx9B0Mzz35VrXD2mipraCVegd6Rxt0nAjW/UplbN4=;
 b=A3sdf5PIuD4Pv/SyIV5fxs3BaQUCZ4p5N9i/qgbiEW9jdqvYZaACf6SWA+bIVwf4aZ
 Da6kg+VYWu++RcD2mCliEXXT2h7KsXQ3WHR1QwkRnixG8RgLj5w9sAFfKkbMQWlP1qeY
 ZxSBz97vOgThfunKwQJswoOGSmVzcvgg8sKFjUHDbjtSXYyM4NVMMwM6STmotcFc7Dsb
 u6FI86NeRfqu8xZGG3jajRwRIl6A0EKoROOk72QAH/4o207QIt/P4XoW/FBAnWhpuWji
 9+iIbfkGl1qH4qQegCSsSCMnN548IFLu7Mz2SxoJBZV7w1pogDMEhud7pVKhi02lWJY/
 qzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VeFx9B0Mzz35VrXD2mipraCVegd6Rxt0nAjW/UplbN4=;
 b=muK8DZ6bneMh0vr+3aM6UU3Y350l66sjuXEgZxmXmFCxIT9ecdHy+VQY0vni5CJ2u4
 FxRdmToBS1TegV4LzY7rvNg6MT1CkKNL2RR0WGEcti473eo6xG6FO7QsLm5fNFmcDOqM
 1JAGoOPrybrB11Vx6XSEhuKsQh56AcG7WRzdEMKWAMhRilEgRn6SFXwtvEOVJfDwRW4O
 Cg4jI4iNXREekjhOK4QAloPCT7/0YDtpmsMf7rLjHil9t0W6tmnhp7i4/6ww2vtjv54y
 GGb18djwmZtZfXnL31z7oEHcp/LShj8NQKYybvEbOWiOWLfdAN+gMdwEyMyDk74Wx+ZP
 SPLw==
X-Gm-Message-State: AO0yUKW5iLc670uJbPFd2gIDpWvk2PVwQdnyu0SbpI0eFKYFdVpkJFVY
 S/CeTBOioIgppP7JMlpCjyObcKrfAB9gubXI
X-Received: by 2002:adf:9790:0:b0:2bf:d425:11ba with SMTP id
 s16-20020adf9790000000b002bfd42511bamr484301wrb.22.1675103122521; 
 Mon, 30 Jan 2023 10:25:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/23] target/arm: Implement the HFGITR_EL2.SVC_EL0 and
 SVC_EL1 traps
Date: Mon, 30 Jan 2023 18:24:57 +0000
Message-Id: <20230130182459.3309057-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: YdBTABW4ulEy

Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 fine-grained traps.
These trap execution of the SVC instruction from AArch32 and AArch64.
(As usual, AArch32 can only trap from EL0, as fine grained traps are
disabled with an AArch32 EL1.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-22-peter.maydell@linaro.org
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
index 3f51dc6a6bf..c23a3462bfc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8834,9 +8834,14 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
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
@@ -9417,6 +9422,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
+    dc->fgt_svc = EX_TBFLAG_ANY(tb_flags, FGT_SVC);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.34.1

