Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4200459wrg;
        Tue, 11 Jun 2019 03:57:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOCIp0W/Ki1jAVw38zReo7WFYEyMmaMetaTadm7wg5Qpv6SgfffhmJF01eVtWAnKY8bKCH
X-Received: by 2002:a0c:add8:: with SMTP id x24mr62132179qvc.167.1560250627513;
        Tue, 11 Jun 2019 03:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560250627; cv=none;
        d=google.com; s=arc-20160816;
        b=Yh3RKXjTtgLVKMrLg08PDQP9HUT50EsLELSyiQrSj4PjRjkG4lQNNSbjzHAtGJELta
         2Ctgmh4oGZRyNaoj/zBYwAsl9HL8HpfOLqycP9CrxN09MeyEXUVZ3nOVmh+XXLdn9kZ8
         mDwRqcVlXhOFgSgtedgErVA+B5XKsKygGgvCswLnLM6gfZUf6rv7yoHGTQYfP4RTYhIg
         oY6jL5p+7lhjNOBDse3J2P/4x+qrClOcRQM/w7AxzatPD5y0BRa7RjORnvOaw+QiFACF
         0pu95+mi3PW6ZB8EzS3VtXzLhTkgIpKSL4R2sLIiB/fk/18wds+1r5cdCYbs7juFOOWW
         cjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=7jqHN827NhY1D5N0LjiHG3QJ6+mHqX+62R3ls5gE3QI=;
        b=Mv1LMoPll5xhu/038fdvhDOg52yoxUM1x2HN3PhY9xATh1YxEDtGU2SLcT3fYKNbmm
         zQIJSxMiTbdmYQXdrQei2gfLHpsw89QmpBj3IERMKF+z8jQ4dVEp9dkSU0Cl100vu1hp
         mYV1ygKmWvoY4AOHva+P9bQ+DW/LlWZ1Q3g9jGBMXq4WBCsasQU3W5BaQ9t72n3/hGYX
         T5XLPNJxB3T0o9+VT+zoptLD/ey2EFb0RbPtKF9qtd++yGQNX2rV/HxMd9dXSCbiGHiw
         hw5N633vTTpX3vliKA/hpOPx2ipRoV5zE/BJIHOtQv7KUchn+hKq19G5+tFLdBls3js3
         Gr8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mZlyf08o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u51si8053132qte.390.2019.06.11.03.57.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 03:57:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mZlyf08o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeSh-00018W-0s
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 06:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38851)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePg-00073W-La
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePe-0007By-3c
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:00 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePd-0007BH-QM
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:53:58 -0400
Received: by mail-wr1-x442.google.com with SMTP id x4so9833820wrt.6
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jqHN827NhY1D5N0LjiHG3QJ6+mHqX+62R3ls5gE3QI=;
 b=mZlyf08oNQFnE4X7k9kHqzZbDAXgJBcq1qjVUQJa0hLeFg38PRNpGwr1SNQjpZ6WtP
 c3w6oT7K1gsp7wdTo3oMRIpGgjgDpEFZqnD1BBpSnNNWWF+Byq5q7L0iDqHoqSNcbbIZ
 p6vLDF8BIt1yQVEv7kuOiY3PJojl2Ud1OoswJuK87ZBF/0s5S7gL6rMI3nJA6HT21/py
 DjXRQm7idrfExBiOx9nb7UmW0YS0QTuMXtDB8unxftTAiY1PqJr4l3ht4j97mqQV07xI
 de4paIZflBa9Mv/quvlUaPf4psv+sVsdxJxjmZDt3OiGVbIqyjMvg8TVNp8esCZLjkkA
 oI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jqHN827NhY1D5N0LjiHG3QJ6+mHqX+62R3ls5gE3QI=;
 b=dp2a2TiOWKuK6447obMVq0OtTCAScAh7pYaopRog4/eT8fuyTa9Th6iqY4/H+usNzz
 bmax8KocuJpIIKsgSiSeQuqMUwtLIzmOafvTUYZHqW/wif2aiB/CH4eVJRhd/TGDptfc
 eIhGbKmY8E1daiZdtFHgojGd82NdOgM9e885ZkNr5VuzM7EPWJxIO4Y+KE2suDi5BmYG
 NHLphob1Un3ROd495APqIrt92lM4MM1luSya4a7kIJcrMaNa6daachVTmUu4C/ZmmL1N
 fB0LWOozZMcVCIuv2M3zN4tUNv9RoBc6MM/niuAYZu5T4MQz4Vk6oyN3HDKyiy2g0t8s
 yqqw==
X-Gm-Message-State: APjAAAU69WgW7dtCxpAw+q45kkf+rije0PCeztLfrU3My1JxZ0Bd6yb3
 /qq8oxtg26fNi9MPA7muntbj3jcZl2w+Kw==
X-Received: by 2002:adf:d847:: with SMTP id k7mr19449277wrl.144.1560250436525; 
 Tue, 11 Jun 2019 03:53:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.53.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:53:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:12 +0100
Message-Id: <20190611105351.9871-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH v2 03/42] target/arm: Factor out VFP access
 checking code
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CcjL4CnFkclz

Factor out the VFP access checking code so that we can use it in the
leaf functions of the decodetree decoder.

We call the function full_vfp_access_check() so we can keep
the more natural vfp_access_check() for a version which doesn't
have the 'ignore_vfp_enabled' flag -- that way almost all VFP
insns will be able to use vfp_access_check(s) and only the
special-register access function will have to use
full_vfp_access_check(s, ignore_vfp_enabled).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index c75d94952de..4ba3f1287ee 100644
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

