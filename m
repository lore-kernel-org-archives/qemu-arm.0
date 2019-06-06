Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4753937wrg;
        Thu, 6 Jun 2019 10:53:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzl5qm7GPrOI7cY1NYYqGwRPzn+FdlwJMcRWArVfC7qQlBRMyRLaIRsd1NyA0iTjX3cL2rb
X-Received: by 2002:ac8:66d8:: with SMTP id m24mr41751901qtp.355.1559843621176;
        Thu, 06 Jun 2019 10:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843621; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNrk5E8sb8BI8ujr1lUPPG610PDiSBXv0XMaXFwCdF/d68yxqqHNx5nT+MY9Es0Fu3
         4n55iUycR+rXix2Tfv7B4ZLzq326q8toCzTvq4PjLjUi6ltjLwrJl8euZ7kBINpA1n9R
         root30gzH6yXRiczHwkJzd0eyC3JYmm9oG+fu74l+3BP05wLSOsDL/ki/N8H7NBVzkuG
         iVtLW34znCNScIdL0PDvXzDPdeflUJdiPIxpEcS2lttSctQDjMM/Ta4rwhT/srdAvaCb
         byF2Uw6Z9m9DtfiNZnVp39RVU+3lPhaBx2xslikrsPuYAmAcF9cfJYVNdXL297pa3VSr
         Er8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YpYRRdgRhzNXtTHb+mlZtWZev3S3aQYGhaPt/SJ1b1I=;
        b=f4Mtm3Yehs2n0+5aHnCrjULjVhR8ccRUVMywfsymQpzoIon0/2eWFuD7F08Gp80EKj
         8/JdiVt7xigiZad6yQRvPVjHn+eP5/KjD4uTo8X2xWN68wJvTkO3SIATVxaLChmr4ezA
         8REc2mdXG23lmo/FlpZMFTgB+yQ3hwjafUBto49B+U4vRHogfIz9UM6ZDaxcbe13Txn/
         NYrup4is9bWuEGimNDTR2SyMof9js3URHgH66wxnJ7iSjoWZ7bVPviN1Kn7ZMA2und/9
         X6myNRYQ4NiR9QqBuYoZ2a0vL9rKnhKj2eoMXJI+7ku3VcYt2YG7rJll2nvr9WyUU+zJ
         qA5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gKi1snmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o48si2306692qvc.68.2019.06.06.10.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gKi1snmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwa4-0001ou-HS
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:53:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTz-0004Kr-O0
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTx-0003ss-1r
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:23 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTt-0002oJ-8z
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:18 -0400
Received: by mail-wr1-x444.google.com with SMTP id n9so3361189wru.0
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YpYRRdgRhzNXtTHb+mlZtWZev3S3aQYGhaPt/SJ1b1I=;
	b=gKi1snmKy4Du8yZDDRmsAPTqxKvAbH4j66UKxuqbpP0XrRL2VbyXez1X0eNijJ3sDA
	AHlTREQaLlHL+KI+v21xQs5Wj5PXgk1vV1DKLB/BCiW/1t+V1PhG0okrXjCwvO3YgRZJ
	uXkM4Dxm9bCXDUdmJtJQpzsJiuT9CPGAyQV35sAiXUE6lgkNsktx33PtjkEgIc3hf+kO
	qq6v/55NcRzuHWnx0itBEcvRl0TPi2kEGtoTjEPrH7yfB134f7RXVMUyuks0ZOHrNZz+
	xGN8GWnWajI2lYlfWahdEnQGyujFxYHeCE3qlntVczegbxZ9g7/v6+FvRPCKmHzC1c0W
	42Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YpYRRdgRhzNXtTHb+mlZtWZev3S3aQYGhaPt/SJ1b1I=;
	b=td7nxajCn2ya1yo7ugihxBzZExDAxIjJXI96EamC1EwEcZPq5HnNznfPGJB0+ngHLu
	6Zs9jbUczea/qHFqIaCmCj/+KxtrOoYHu+Vs/smsGsPGbQmcZahq7+wOdcZPW/rJ2IE4
	4E1Ab1yv/kd3oEWcPsieWqcoeFDl/6hWe8+BBRU1CDhrPM/N4JTYUVFgWTVfRZymMjJt
	kLnDQONfSiZjvrF5unLcp5nlpUUoE4GEgz3igPDg9VZAYDrMhKmgleG+3cELl9L7Tt0B
	gq+GWhY1gFdsjOruhHrZtB7g60edi2GNGy1bNkWBj+78rMblAgSn7eyDWYSBuGORkHtz
	zgDw==
X-Gm-Message-State: APjAAAVTN6Egve5S04pjoQ7cJhtV0MQB/48nCVdnJn1sPmpmlEcl/zox
	yaSjGAqR7M1SaejlFp3vFI5BNuy57TOBcQ==
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr3579999wrw.98.1559843174729; 
	Thu, 06 Jun 2019 10:46:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:30 +0100
Message-Id: <20190606174609.20487-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 03/42] target/arm: Factor out VFP access checking
 code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DuKbSy9VHjr5

Factor out the VFP access checking code so that we can use it in the
leaf functions of the decodetree decoder.

We call the function full_vfp_access_check() so we can keep
the more natural vfp_access_check() for a version which doesn't
have the 'ignore_vfp_enabled' flag -- that way almost all VFP
insns will be able to use vfp_access_check(s) and only the
special-register access function will have to use
full_vfp_access_check(s, ignore_vfp_enabled).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 100 ++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 101 +++++----------------------------
 2 files changed, 113 insertions(+), 88 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 3447b3e6466..cf3d7febaa7 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -29,3 +29,103 @@
 /* Include the generated VFP decoder */
 #include "decode-vfp.inc.c"
 #include "decode-vfp-uncond.inc.c"
+
+/*
+ * Check that VFP access is enabled. If it is, do the necessary
+ * M-profile lazy-FP handling and then return true.
+ * If not, emit code to generate an appropriate exception and
+ * return false.
+ * The ignore_vfp_enabled argument specifies that we should ignore
+ * whether VFP is enabled via FPEXC[EN]: this should be true for FMXR/FMRX
+ * accesses to FPSID, FPEXC, MVFR0, MVFR1, MVFR2, and false for all other insns.
+ */
+static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
+{
+    if (s->fp_excp_el) {
+        if (arm_dc_feature(s, ARM_FEATURE_M)) {
+            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
+                               s->fp_excp_el);
+        } else {
+            gen_exception_insn(s, 4, EXCP_UDEF,
+                               syn_fp_access_trap(1, 0xe, false),
+                               s->fp_excp_el);
+        }
+        return false;
+    }
+
+    if (!s->vfp_enabled && !ignore_vfp_enabled) {
+        assert(!arm_dc_feature(s, ARM_FEATURE_M));
+        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+                           default_exception_el(s));
+        return false;
+    }
+
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        /* Handle M-profile lazy FP state mechanics */
+
+        /* Trigger lazy-state preservation if necessary */
+        if (s->v7m_lspact) {
+            /*
+             * Lazy state saving affects external memory and also the NVIC,
+             * so we must mark it as an IO operation for icount.
+             */
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_start();
+            }
+            gen_helper_v7m_preserve_fp_state(cpu_env);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_end();
+            }
+            /*
+             * If the preserve_fp_state helper doesn't throw an exception
+             * then it will clear LSPACT; we don't need to repeat this for
+             * any further FP insns in this TB.
+             */
+            s->v7m_lspact = false;
+        }
+
+        /* Update ownership of FP context: set FPCCR.S to match current state */
+        if (s->v8m_fpccr_s_wrong) {
+            TCGv_i32 tmp;
+
+            tmp = load_cpu_field(v7m.fpccr[M_REG_S]);
+            if (s->v8m_secure) {
+                tcg_gen_ori_i32(tmp, tmp, R_V7M_FPCCR_S_MASK);
+            } else {
+                tcg_gen_andi_i32(tmp, tmp, ~R_V7M_FPCCR_S_MASK);
+            }
+            store_cpu_field(tmp, v7m.fpccr[M_REG_S]);
+            /* Don't need to do this for any further FP insns in this TB */
+            s->v8m_fpccr_s_wrong = false;
+        }
+
+        if (s->v7m_new_fp_ctxt_needed) {
+            /*
+             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA
+             * and the FPSCR.
+             */
+            TCGv_i32 control, fpscr;
+            uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
+
+            fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
+            gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+            tcg_temp_free_i32(fpscr);
+            /*
+             * We don't need to arrange to end the TB, because the only
+             * parts of FPSCR which we cache in the TB flags are the VECLEN
+             * and VECSTRIDE, and those don't exist for M-profile.
+             */
+
+            if (s->v8m_secure) {
+                bits |= R_V7M_CONTROL_SFPA_MASK;
+            }
+            control = load_cpu_field(v7m.control[M_REG_S]);
+            tcg_gen_ori_i32(control, control, bits);
+            store_cpu_field(control, v7m.control[M_REG_S]);
+            /* Don't need to do this for any further FP insns in this TB */
+            s->v7m_new_fp_ctxt_needed = false;
+        }
+    }
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ca9e0bfd99e..6088ffdc6ee 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3373,8 +3373,10 @@ static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
-/* Disassemble a VFP instruction.  Returns nonzero if an error occurred
-   (ie. an undefined instruction).  */
+/*
+ * Disassemble a VFP instruction.  Returns nonzero if an error occurred
+ * (ie. an undefined instruction).
+ */
 static int disas_vfp_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t rd, rn, rm, op, i, n, offset, delta_d, delta_m, bank_mask;
@@ -3382,6 +3384,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
     TCGv_i32 addr;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
+    bool ignore_vfp_enabled = false;
 
     if (!arm_dc_feature(s, ARM_FEATURE_VFP)) {
         return 1;
@@ -3403,98 +3406,20 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
         }
     }
 
-    /* FIXME: this access check should not take precedence over UNDEF
+    /*
+     * FIXME: this access check should not take precedence over UNDEF
      * for invalid encodings; we will generate incorrect syndrome information
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
      */
-    if (s->fp_excp_el) {
-        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
-                               s->fp_excp_el);
-        } else {
-            gen_exception_insn(s, 4, EXCP_UDEF,
-                               syn_fp_access_trap(1, 0xe, false),
-                               s->fp_excp_el);
-        }
-        return 0;
-    }
-
-    if (!s->vfp_enabled) {
-        /* VFP disabled.  Only allow fmxr/fmrx to/from some control regs.  */
-        if ((insn & 0x0fe00fff) != 0x0ee00a10)
-            return 1;
+    if ((insn & 0x0fe00fff) == 0x0ee00a10) {
         rn = (insn >> 16) & 0xf;
-        if (rn != ARM_VFP_FPSID && rn != ARM_VFP_FPEXC && rn != ARM_VFP_MVFR2
-            && rn != ARM_VFP_MVFR1 && rn != ARM_VFP_MVFR0) {
-            return 1;
+        if (rn == ARM_VFP_FPSID || rn == ARM_VFP_FPEXC || rn == ARM_VFP_MVFR2
+            || rn == ARM_VFP_MVFR1 || rn == ARM_VFP_MVFR0) {
+            ignore_vfp_enabled = true;
         }
     }
-
-    if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        /* Handle M-profile lazy FP state mechanics */
-
-        /* Trigger lazy-state preservation if necessary */
-        if (s->v7m_lspact) {
-            /*
-             * Lazy state saving affects external memory and also the NVIC,
-             * so we must mark it as an IO operation for icount.
-             */
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_io_start();
-            }
-            gen_helper_v7m_preserve_fp_state(cpu_env);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_io_end();
-            }
-            /*
-             * If the preserve_fp_state helper doesn't throw an exception
-             * then it will clear LSPACT; we don't need to repeat this for
-             * any further FP insns in this TB.
-             */
-            s->v7m_lspact = false;
-        }
-
-        /* Update ownership of FP context: set FPCCR.S to match current state */
-        if (s->v8m_fpccr_s_wrong) {
-            TCGv_i32 tmp;
-
-            tmp = load_cpu_field(v7m.fpccr[M_REG_S]);
-            if (s->v8m_secure) {
-                tcg_gen_ori_i32(tmp, tmp, R_V7M_FPCCR_S_MASK);
-            } else {
-                tcg_gen_andi_i32(tmp, tmp, ~R_V7M_FPCCR_S_MASK);
-            }
-            store_cpu_field(tmp, v7m.fpccr[M_REG_S]);
-            /* Don't need to do this for any further FP insns in this TB */
-            s->v8m_fpccr_s_wrong = false;
-        }
-
-        if (s->v7m_new_fp_ctxt_needed) {
-            /*
-             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA
-             * and the FPSCR.
-             */
-            TCGv_i32 control, fpscr;
-            uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
-
-            fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
-            gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-            tcg_temp_free_i32(fpscr);
-            /*
-             * We don't need to arrange to end the TB, because the only
-             * parts of FPSCR which we cache in the TB flags are the VECLEN
-             * and VECSTRIDE, and those don't exist for M-profile.
-             */
-
-            if (s->v8m_secure) {
-                bits |= R_V7M_CONTROL_SFPA_MASK;
-            }
-            control = load_cpu_field(v7m.control[M_REG_S]);
-            tcg_gen_ori_i32(control, control, bits);
-            store_cpu_field(control, v7m.control[M_REG_S]);
-            /* Don't need to do this for any further FP insns in this TB */
-            s->v7m_new_fp_ctxt_needed = false;
-        }
+    if (!full_vfp_access_check(s, ignore_vfp_enabled)) {
+        return 0;
     }
 
     if (extract32(insn, 28, 4) == 0xf) {
-- 
2.20.1

