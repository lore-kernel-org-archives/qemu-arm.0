Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp552919lfg;
        Sat, 21 Aug 2021 13:00:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycIb8tugP33PpUlUaRJf3ngqbrBctbKgfhJTjPEhoFAzse+4ECRnfVS34c5wcMoLVsWsWb
X-Received: by 2002:a6b:905:: with SMTP id t5mr20767829ioi.209.1629576024691;
        Sat, 21 Aug 2021 13:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629576024; cv=none;
        d=google.com; s=arc-20160816;
        b=qkwtHBL7qyXEPxyKdcOWV4+n7zZIFWFvMbxyDtYZYtAqCfZsL2UGR137e+60v6tmDL
         Nz2XGZSat9N0+KkJOB/3ah7zxkW/XiXl/oNAVwJW/SzP7BPK1T1v6QHGC98lI5sQ2ZDf
         C3LBZop5L0nImFd0p9MIeTF9MgK3Stdhi2nNK7iBGSyePucmb44uHMVeGiR71o/fw4Y3
         3SjhnO6Eu6yKYd0/npjwo5GZOZzk3UaOXNOPt5jGffmKgrZQqP4Yw0tpNrNHVWoleCRk
         TqPEaYv+8vEGy20ZS01IlHujDh1BlUwoajcdXWc43yJh+U5HHrBRaEL4Be242dMxJCIm
         EMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0gM1lJ5QbpFYG1IXZ0/xrE9q1D2a+icOd5fzVUyjtn4=;
        b=1COejl11nodetEJFcOyDfIBcaq3TZNZ+fXALTVMseEwHrAFO85zQKA1aamZf+BvIsK
         aqYsGCa7fr2FLHCMFi2dVb20RqFroVhXRqMCE6JycG8Hvpppd9xQ6+FTAd27k7ikuno0
         OIAKRrvntZERlrU0WsfW1R1lHGXnIDN9yD+KnSQp8sqRvA67ML0cUSD3eeSs8D6QO/QG
         kN5Iic1hR46IdJKredPhZgBPiPn4s3H5SGq42/szrCJFmE+wpwniztQYpr4xiTaG2jmk
         +naWPti8fQMi+QfvD2lUyAYJz7lsEgk0DwA4SFnOTpslM/y9c0YVYebCKxmNARo2wX6n
         J/jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SnaO1ESL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j186si10111106jac.23.2021.08.21.13.00.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 13:00:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SnaO1ESL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHXAF-0002AD-Se
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 16:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9y-00027J-4y
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:06 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9u-0004T4-My
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id t42so9151685pfg.12
 for <qemu-arm@nongnu.org>; Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0gM1lJ5QbpFYG1IXZ0/xrE9q1D2a+icOd5fzVUyjtn4=;
 b=SnaO1ESLNbUnGpg0/rw50Kb4+kKiLQJd75sDaCgvx/efRaPmOWyJvmSJZs9+glVlx0
 qNKA5+QNbWv1K/pbiCNp4UjZyPNVdLB4cUcMULah5BZfEo6tZ15aMkgIZozxMGOhRzWU
 bPzNCYEc7Ug2waa29W4axLKVnxGiWzorti3jGxM0u9WX2azZrcaMebzxKQPclpMYfD84
 1F5IhWRXbVVpeVZ/G5HUwo6DFbaUgGrzEUBSgeqsHybhwhWdt9l8KSCVQpRPHqzMU757
 Sa7FICcPcy5UOZkxfEsQi5iixbRQfJ6A8cIwA71/2TDm57LcDFAbz6PWz2yIxxZdXRqq
 5z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0gM1lJ5QbpFYG1IXZ0/xrE9q1D2a+icOd5fzVUyjtn4=;
 b=E7tYE1XdLwXSUaTV4Y0Bg992OtDmTify4eypQ0IAStY2wlV+hCoU80aSYdU79usadd
 MpYGHUs7kTkKZYQVH0cZXOKyHlW0D4dOtP8f7+bxF+XwkepeTcm1/PJUiTE22PAFeu1C
 sDI1Rkk0qxZljmToxNWiswBWQlBforlocY91FcINXUlexEiD1TrrXCpNJfgqdGRqPl5K
 1RlLytgT6anEf/eLTl0QwjPfwJbDtfzbV4Y53gUkpVO+palW+7hE6oHPZG2uI90e2xGt
 bVRob41/ebY+7uT7edurbEOa0HNjkaw9gjsBRXXBaZx7BOtDz7UH7hhQIoyC4VRO0hU2
 8DXA==
X-Gm-Message-State: AOAM532QrbTTaDiamTyP0faOY9YVlua1j4aPawnMoSJebL8BLQiQNOnK
 TAHD27xqVnJ/rg4RE2hvuPs+Jw==
X-Received: by 2002:a63:1f45:: with SMTP id q5mr16770305pgm.385.1629576001258; 
 Sat, 21 Aug 2021 13:00:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] target/arm: Merge disas_a64_insn into
 aarch64_tr_translate_insn
Date: Sat, 21 Aug 2021 12:59:52 -0700
Message-Id: <20210821195958.41312-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRKwTF7Ni6tl

It is confusing to have different exits from translation
for various conditions in separate functions.

Merge disas_a64_insn into its only caller.  Standardize
on the "s" name for the DisasContext, as the code from
disas_a64_insn had more instances.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 224 ++++++++++++++++++-------------------
 1 file changed, 109 insertions(+), 115 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 230cc8d83b..333bc836b2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14649,113 +14649,6 @@ static bool btype_destination_ok(uint32_t insn, bool bt, int btype)
     return false;
 }
 
-/* C3.1 A64 instruction index by encoding */
-static void disas_a64_insn(CPUARMState *env, DisasContext *s)
-{
-    uint32_t insn;
-
-    s->pc_curr = s->base.pc_next;
-    insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
-    s->insn = insn;
-    s->base.pc_next += 4;
-
-    s->fp_access_checked = false;
-    s->sve_access_checked = false;
-
-    if (s->pstate_il) {
-        /*
-         * Illegal execution state. This has priority over BTI
-         * exceptions, but comes after instruction abort exceptions.
-         */
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_illegalstate(), default_exception_el(s));
-        return;
-    }
-
-    if (dc_isar_feature(aa64_bti, s)) {
-        if (s->base.num_insns == 1) {
-            /*
-             * At the first insn of the TB, compute s->guarded_page.
-             * We delayed computing this until successfully reading
-             * the first insn of the TB, above.  This (mostly) ensures
-             * that the softmmu tlb entry has been populated, and the
-             * page table GP bit is available.
-             *
-             * Note that we need to compute this even if btype == 0,
-             * because this value is used for BR instructions later
-             * where ENV is not available.
-             */
-            s->guarded_page = is_guarded_page(env, s);
-
-            /* First insn can have btype set to non-zero.  */
-            tcg_debug_assert(s->btype >= 0);
-
-            /*
-             * Note that the Branch Target Exception has fairly high
-             * priority -- below debugging exceptions but above most
-             * everything else.  This allows us to handle this now
-             * instead of waiting until the insn is otherwise decoded.
-             */
-            if (s->btype != 0
-                && s->guarded_page
-                && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                                   syn_btitrap(s->btype),
-                                   default_exception_el(s));
-                return;
-            }
-        } else {
-            /* Not the first insn: btype must be 0.  */
-            tcg_debug_assert(s->btype == 0);
-        }
-    }
-
-    switch (extract32(insn, 25, 4)) {
-    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
-        unallocated_encoding(s);
-        break;
-    case 0x2:
-        if (!dc_isar_feature(aa64_sve, s) || !disas_sve(s, insn)) {
-            unallocated_encoding(s);
-        }
-        break;
-    case 0x8: case 0x9: /* Data processing - immediate */
-        disas_data_proc_imm(s, insn);
-        break;
-    case 0xa: case 0xb: /* Branch, exception generation and system insns */
-        disas_b_exc_sys(s, insn);
-        break;
-    case 0x4:
-    case 0x6:
-    case 0xc:
-    case 0xe:      /* Loads and stores */
-        disas_ldst(s, insn);
-        break;
-    case 0x5:
-    case 0xd:      /* Data processing - register */
-        disas_data_proc_reg(s, insn);
-        break;
-    case 0x7:
-    case 0xf:      /* Data processing - SIMD and floating point */
-        disas_data_proc_simd_fp(s, insn);
-        break;
-    default:
-        assert(FALSE); /* all 15 cases should be handled above */
-        break;
-    }
-
-    /* if we allocated any temporaries, free them here */
-    free_tmp_a64(s);
-
-    /*
-     * After execution of most insns, btype is reset to 0.
-     * Note that we set btype == -1 when the insn sets btype.
-     */
-    if (s->btype > 0 && s->base.is_jmp != DISAS_NORETURN) {
-        reset_btype(s);
-    }
-}
-
 static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
                                           CPUState *cpu)
 {
@@ -14857,10 +14750,11 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 
 static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    DisasContext *s = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t insn;
 
-    if (dc->ss_active && !dc->pstate_ss) {
+    if (s->ss_active && !s->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
          *  a) we just took an exception to an EL which is being debugged
@@ -14871,14 +14765,114 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
          * "did not step an insn" case, and so the syndrome ISV and EX
          * bits should be zero.
          */
-        assert(dc->base.num_insns == 1);
-        gen_swstep_exception(dc, 0, 0);
-        dc->base.is_jmp = DISAS_NORETURN;
-    } else {
-        disas_a64_insn(env, dc);
+        assert(s->base.num_insns == 1);
+        gen_swstep_exception(s, 0, 0);
+        s->base.is_jmp = DISAS_NORETURN;
+        return;
     }
 
-    translator_loop_temp_check(&dc->base);
+    s->pc_curr = s->base.pc_next;
+    insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
+    s->insn = insn;
+    s->base.pc_next += 4;
+
+    s->fp_access_checked = false;
+    s->sve_access_checked = false;
+
+    if (s->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(s));
+        return;
+    }
+
+    if (dc_isar_feature(aa64_bti, s)) {
+        if (s->base.num_insns == 1) {
+            /*
+             * At the first insn of the TB, compute s->guarded_page.
+             * We delayed computing this until successfully reading
+             * the first insn of the TB, above.  This (mostly) ensures
+             * that the softmmu tlb entry has been populated, and the
+             * page table GP bit is available.
+             *
+             * Note that we need to compute this even if btype == 0,
+             * because this value is used for BR instructions later
+             * where ENV is not available.
+             */
+            s->guarded_page = is_guarded_page(env, s);
+
+            /* First insn can have btype set to non-zero.  */
+            tcg_debug_assert(s->btype >= 0);
+
+            /*
+             * Note that the Branch Target Exception has fairly high
+             * priority -- below debugging exceptions but above most
+             * everything else.  This allows us to handle this now
+             * instead of waiting until the insn is otherwise decoded.
+             */
+            if (s->btype != 0
+                && s->guarded_page
+                && !btype_destination_ok(insn, s->bt, s->btype)) {
+                gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                                   syn_btitrap(s->btype),
+                                   default_exception_el(s));
+                return;
+            }
+        } else {
+            /* Not the first insn: btype must be 0.  */
+            tcg_debug_assert(s->btype == 0);
+        }
+    }
+
+    switch (extract32(insn, 25, 4)) {
+    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
+        unallocated_encoding(s);
+        break;
+    case 0x2:
+        if (!dc_isar_feature(aa64_sve, s) || !disas_sve(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
+    case 0x8: case 0x9: /* Data processing - immediate */
+        disas_data_proc_imm(s, insn);
+        break;
+    case 0xa: case 0xb: /* Branch, exception generation and system insns */
+        disas_b_exc_sys(s, insn);
+        break;
+    case 0x4:
+    case 0x6:
+    case 0xc:
+    case 0xe:      /* Loads and stores */
+        disas_ldst(s, insn);
+        break;
+    case 0x5:
+    case 0xd:      /* Data processing - register */
+        disas_data_proc_reg(s, insn);
+        break;
+    case 0x7:
+    case 0xf:      /* Data processing - SIMD and floating point */
+        disas_data_proc_simd_fp(s, insn);
+        break;
+    default:
+        assert(FALSE); /* all 15 cases should be handled above */
+        break;
+    }
+
+    /* if we allocated any temporaries, free them here */
+    free_tmp_a64(s);
+
+    /*
+     * After execution of most insns, btype is reset to 0.
+     * Note that we set btype == -1 when the insn sets btype.
+     */
+    if (s->btype > 0 && s->base.is_jmp != DISAS_NORETURN) {
+        reset_btype(s);
+    }
+
+    translator_loop_temp_check(&s->base);
 }
 
 static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.25.1

