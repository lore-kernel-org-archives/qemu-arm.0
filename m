Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3516893lfb;
        Mon, 13 Sep 2021 03:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDhqwtUIA6UHvUgWXLWSxhFQC0G61MVu84KGiTs/Etw4R52/FFgh3ZQtpVShQW9YBT0RUu
X-Received: by 2002:ab0:6dc7:: with SMTP id r7mr4232809uaf.14.1631527416002;
        Mon, 13 Sep 2021 03:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527415; cv=none;
        d=google.com; s=arc-20160816;
        b=BIWXP04Qu41U4XX865ZwdB71X51nbTL8Bhi45euXF2Lufm7YDHoqJbSwfHG0ntZCwT
         He1E3GviekjwomSxIcWlcIzqOmKNAGCKonStDYSRmm1cQURe6B8R1BWitLxB1IBSypbw
         /Wqui7eUe0GQEgMijzTQDOk60AMxIkfAxP3LNafgwPMzsRkj4EODn2TUldww4xWpy95F
         EKfWnG/1+IWXG9dfpyMDD0xKKPFXuQCz1OvagKWQXRrHeBRx1Z/UFgazP5gmgrfMFO0I
         4QrmFpJVo2buuXe+QbAgYf+njszcl8eVYnmI3Y4u0GyI9JWVuKH9KS6kiHSp12YCk8r6
         Y9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wdKuKhvstPpd89dW4hhsxGes6H2FSQ0P7XNiWFH2WBQ=;
        b=EZDPG19LgYu3uCknX0lonu6GZbbt6cnh4Ykm6fGtlUDowlUNyb2wtVsXhI8DpV+75f
         F0aKE3XYvo27K0siYZMT0M9MPqAM3MLwPeSGaWERBvDHvE5aftYe45lp70Q4lBDu2w59
         fHpV/a9taS4rbJ6KPNYLTB0GYDCWN9H+/tnmmcRkmGH4gzRzynRZhnsfWfBG6ug6GtOh
         RPmTBtfkVymDeVRS2f3/QVLpsTZjd4vCQZYTlFDARoRE4OSPcD4yjj17uR4Ke1IqqXH6
         KLrFBVI4Wiy5jgexe86HMfqCg1PLxD989lYS3NAlQrAdIUCXn0QXOh1XprgG2eBsp0FD
         vgTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XW4KAgAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si1488214ual.99.2021.09.13.03.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XW4KAgAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPioJ-0003RP-Ar
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPig2-0007qc-TT
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:55:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifn-0001ro-28
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:55:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id g128so1736928wma.5
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdKuKhvstPpd89dW4hhsxGes6H2FSQ0P7XNiWFH2WBQ=;
 b=XW4KAgADdgIM6pcPzzQEXduR1TyJX0YyyKUQu8TaAt/e/LzTNYGIskvDn4NPPVK5RO
 X+fbibFL3va0SPVENn/abxek5p5ALz1G6FiQ0RbKVEfam9c5flLVJ7DcfIKRfMNFWO+l
 u5bulpWhALNrtJsR4TSXtAGJJxomxev06Gnt0WFuZxAKGjAGIYqEF8GaN/Pu7MtN5ku3
 p2oINZi6MDsORfnRaGIYFtIwCX4el9EdISjx1GSomZCxPFKNpeJT24UhRvdBJX5as+gB
 3j74FtVYlgpzkgoqnLMTchoHSca7AWaxY0J0Eh2pGPeWQ6CVw66QbFBYqVGM7iMzw4o3
 Te6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdKuKhvstPpd89dW4hhsxGes6H2FSQ0P7XNiWFH2WBQ=;
 b=g4ucRFEwhgZ4T+26o/izsFfUKsfusDYju6XksDKzL3aXxWpUkGi1H5+ol7yZIzSmL/
 l6dBVnzgj5P96taFP3RNhqi2K8zsN+9amILfFUvopj7Xju/P2Kq02ZDECoT8i32Z9plA
 iEKXr4B7aEvpYVMggZs6c9oTSjFMc4tTLBfsLNLZjQcFkOD2uXMfnQqw2s7wnngV6lZb
 nfp917YWtgxNDlS9TK6er/grIPQuDe/xo4vYv+dNDY7BI78IFi6xXRACd3Q3C8aUVpsv
 wRi1LvobP/kZ6i11kRTB0obhjTUcUZuWQsHpiZfZEQafaUBB3EYWyrJhjng7GsllDPfB
 1KMQ==
X-Gm-Message-State: AOAM532W6QaxGaS8Mc9YvpFpXHAbTiZ9oiDmteGDzwk8m/FR8Qyr1jkW
 XUKbftXLzuRiuh6EfwlVPmuAuBUkX1bXtw==
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr10067581wmi.157.1631526884900; 
 Mon, 13 Sep 2021 02:54:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] target/arm: Add TB flag for "MVE insns not
 predicated"
Date: Mon, 13 Sep 2021 10:54:31 +0100
Message-Id: <20210913095440.13462-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0iWXIyOqheu

Our current codegen for MVE always calls out to helper functions,
because some byte lanes might be predicated.  The common case is that
in fact there is no predication active and all lanes should be
updated together, so we can produce better code by detecting that and
using the TCG generic vector infrastructure.

Add a TB flag that is set when we can guarantee that there is no
active MVE predication, and a bool in the DisasContext.  Subsequent
patches will use this flag to generate improved code for some
instructions.

In most cases when the predication state changes we simply end the TB
after that instruction.  For the code called from vfp_access_check()
that handles lazy state preservation and creating a new FP context,
we can usually avoid having to try to end the TB because luckily the
new value of the flag following the register changes in those
sequences doesn't depend on any runtime decisions.  We do have to end
the TB if the guest has enabled lazy FP state preservation but not
automatic state preservation, but this is an odd corner case that is
not going to be common in real-world code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I renamed the mve_no_predication() function to mve_no_pred() because
I want to use the former name in patch 2 for the translate-time "no
predication of any kind including ECI", and wanted to distinguish it
from this function that is just determining the value of the TB flag
bit.  Better naming suggestions welcome.
---
 target/arm/cpu.h              |  4 +++-
 target/arm/translate.h        |  2 ++
 target/arm/helper.c           | 33 +++++++++++++++++++++++++++++++++
 target/arm/translate-m-nocp.c |  8 +++++++-
 target/arm/translate-mve.c    | 13 ++++++++++++-
 target/arm/translate-vfp.c    | 33 +++++++++++++++++++++++++++------
 target/arm/translate.c        |  8 ++++++++
 7 files changed, 92 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a987f65e41..a235d21c233 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3440,7 +3440,7 @@ typedef ARMCPU ArchCPU;
  * | TBFLAG_AM32 |          +-----+----------+
  * |             |                |TBFLAG_M32|
  * +-------------+----------------+----------+
- *  31         23                5 4        0
+ *  31         23                6 5        0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3497,6 +3497,8 @@ FIELD(TBFLAG_M32, LSPACT, 2, 1)                 /* Not cached. */
 FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 /* Set if FPCCR.S does not match current security state */
 FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
+/* Set if MVE insns are definitely not predicated by VPR or LTPSIZE */
+FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
 
 /*
  * Bit usage when in AArch64 state
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8636c20c3b4..f3cc820d071 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -98,6 +98,8 @@ typedef struct DisasContext {
     bool hstr_active;
     /* True if memory operations require alignment */
     bool align_mem;
+    /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
+    bool mve_no_pred;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d4..6f8cf67d895 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13673,6 +13673,35 @@ static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 #endif
 }
 
+static bool mve_no_pred(CPUARMState *env)
+{
+    /*
+     * Return true if there is definitely no predication of MVE
+     * instructions by VPR or LTPSIZE. (Returning false even if there
+     * isn't any predication is OK; generated code will just be
+     * a little worse.)
+     * If the CPU does not implement MVE then this TB flag is always 0.
+     *
+     * NOTE: if you change this logic, the "recalculate s->mve_no_pred"
+     * logic in gen_update_fp_context() needs to be updated to match.
+     *
+     * We do not include the effect of the ECI bits here -- they are
+     * tracked in other TB flags. This simplifies the logic for
+     * "when did we emit code that changes the MVE_NO_PRED TB flag
+     * and thus need to end the TB?".
+     */
+    if (cpu_isar_feature(aa32_mve, env_archcpu(env))) {
+        return false;
+    }
+    if (env->v7m.vpr) {
+        return false;
+    }
+    if (env->v7m.ltpsize < 4) {
+        return false;
+    }
+    return true;
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -13712,6 +13741,10 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
                 DP_TBFLAG_M32(flags, LSPACT, 1);
             }
+
+            if (mve_no_pred(env)) {
+                DP_TBFLAG_M32(flags, MVE_NO_PRED, 1);
+            }
         } else {
             /*
              * Note that XSCALE_CPAR shares bits with VECSTRIDE.
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 5eab04832cd..d9e144e8eb3 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -95,7 +95,10 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
 
     clear_eci_state(s);
 
-    /* End the TB, because we have updated FP control bits */
+    /*
+     * End the TB, because we have updated FP control bits,
+     * and possibly VPR or LTPSIZE.
+     */
     s->base.is_jmp = DISAS_UPDATE_EXIT;
     return true;
 }
@@ -397,6 +400,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         store_cpu_field(control, v7m.control[M_REG_S]);
         tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
+        s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
         tcg_temp_free_i32(tmp);
         tcg_temp_free_i32(sfpa);
         break;
@@ -409,6 +413,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         }
         tmp = loadfn(s, opaque, true);
         store_cpu_field(tmp, v7m.vpr);
+        s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
         break;
     case ARM_VFP_P0:
     {
@@ -418,6 +423,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_deposit_i32(vpr, vpr, tmp,
                             R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
         store_cpu_field(vpr, v7m.vpr);
+        s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
         tcg_temp_free_i32(tmp);
         break;
     }
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2ed91577ec8..0eca96e29cf 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -810,7 +810,12 @@ DO_LOGIC(VORR, gen_helper_mve_vorr)
 DO_LOGIC(VORN, gen_helper_mve_vorn)
 DO_LOGIC(VEOR, gen_helper_mve_veor)
 
-DO_LOGIC(VPSEL, gen_helper_mve_vpsel)
+static bool trans_VPSEL(DisasContext *s, arg_2op *a)
+{
+    /* This insn updates predication bits */
+    s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
+    return do_2op(s, a, gen_helper_mve_vpsel);
+}
 
 #define DO_2OP(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
@@ -1366,6 +1371,8 @@ static bool trans_VPNOT(DisasContext *s, arg_VPNOT *a)
     }
 
     gen_helper_mve_vpnot(cpu_env);
+    /* This insn updates predication bits */
+    s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     mve_update_eci(s);
     return true;
 }
@@ -1852,6 +1859,8 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
         /* VPT */
         gen_vpst(s, a->mask);
     }
+    /* This insn updates predication bits */
+    s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     mve_update_eci(s);
     return true;
 }
@@ -1883,6 +1892,8 @@ static bool do_vcmp_scalar(DisasContext *s, arg_vcmp_scalar *a,
         /* VPT */
         gen_vpst(s, a->mask);
     }
+    /* This insn updates predication bits */
+    s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     mve_update_eci(s);
     return true;
 }
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index e2eb797c829..59bcaec5beb 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -109,7 +109,7 @@ static inline long vfp_f16_offset(unsigned reg, bool top)
  * Generate code for M-profile lazy FP state preservation if needed;
  * this corresponds to the pseudocode PreserveFPState() function.
  */
-static void gen_preserve_fp_state(DisasContext *s)
+static void gen_preserve_fp_state(DisasContext *s, bool skip_context_update)
 {
     if (s->v7m_lspact) {
         /*
@@ -128,6 +128,20 @@ static void gen_preserve_fp_state(DisasContext *s)
          * any further FP insns in this TB.
          */
         s->v7m_lspact = false;
+        /*
+         * The helper might have zeroed VPR, so we do not know the
+         * correct value for the MVE_NO_PRED TB flag any more.
+         * If we're about to create a new fp context then that
+         * will precisely determine the MVE_NO_PRED value (see
+         * gen_update_fp_context()). Otherwise, we must:
+         *  - set s->mve_no_pred to false, so this instruction
+         *    is generated to use helper functions
+         *  - end the TB now, without chaining to the next TB
+         */
+        if (skip_context_update || !s->v7m_new_fp_ctxt_needed) {
+            s->mve_no_pred = false;
+            s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
+        }
     }
 }
 
@@ -169,12 +183,19 @@ static void gen_update_fp_context(DisasContext *s)
             TCGv_i32 z32 = tcg_const_i32(0);
             store_cpu_field(z32, v7m.vpr);
         }
-
         /*
-         * We don't need to arrange to end the TB, because the only
-         * parts of FPSCR which we cache in the TB flags are the VECLEN
-         * and VECSTRIDE, and those don't exist for M-profile.
+         * We just updated the FPSCR and VPR. Some of this state is cached
+         * in the MVE_NO_PRED TB flag. We want to avoid having to end the
+         * TB here, which means we need the new value of the MVE_NO_PRED
+         * flag to be exactly known here and the same for all executions.
+         * Luckily FPDSCR.LTPSIZE is always constant 4 and the VPR is
+         * always set to 0, so the new MVE_NO_PRED flag is always 1
+         * if and only if we have MVE.
+         *
+         * (The other FPSCR state cached in TB flags is VECLEN and VECSTRIDE,
+         * but those do not exist for M-profile, so are not relevant here.)
          */
+        s->mve_no_pred = dc_isar_feature(aa32_mve, s);
 
         if (s->v8m_secure) {
             bits |= R_V7M_CONTROL_SFPA_MASK;
@@ -238,7 +259,7 @@ bool vfp_access_check_m(DisasContext *s, bool skip_context_update)
     /* Handle M-profile lazy FP state mechanics */
 
     /* Trigger lazy-state preservation if necessary */
-    gen_preserve_fp_state(s);
+    gen_preserve_fp_state(s, skip_context_update);
 
     if (!skip_context_update) {
         /* Update ownership of FP context and create new FP context if needed */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3d1ff8ba951..3a59de208d5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8496,6 +8496,7 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
         /* DLSTP: set FPSCR.LTPSIZE */
         tmp = tcg_const_i32(a->size);
         store_cpu_field(tmp, v7m.ltpsize);
+        s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     }
     return true;
 }
@@ -8561,6 +8562,10 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
         assert(ok);
         tmp = tcg_const_i32(a->size);
         store_cpu_field(tmp, v7m.ltpsize);
+        /*
+         * LTPSIZE updated, but MVE_NO_PRED will always be the same thing (0)
+         * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
+         */
     }
     gen_jmp_tb(s, s->base.pc_next, 1);
 
@@ -8743,6 +8748,8 @@ static bool trans_VCTP(DisasContext *s, arg_VCTP *a)
     gen_helper_mve_vctp(cpu_env, masklen);
     tcg_temp_free_i32(masklen);
     tcg_temp_free_i32(rn_shifted);
+    /* This insn updates predication bits */
+    s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     mve_update_eci(s);
     return true;
 }
@@ -9402,6 +9409,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->v7m_new_fp_ctxt_needed =
             EX_TBFLAG_M32(tb_flags, NEW_FP_CTXT_NEEDED);
         dc->v7m_lspact = EX_TBFLAG_M32(tb_flags, LSPACT);
+        dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED);
     } else {
         dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
         dc->sctlr_b = EX_TBFLAG_A32(tb_flags, SCTLR__B);
-- 
2.20.1

