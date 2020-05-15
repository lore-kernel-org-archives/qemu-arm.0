Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp549075lfb;
        Fri, 15 May 2020 07:23:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxTZUBO5r+jOX1wlMoazoa1dqbmmIsn/cV5y79YoQ0FgMhow1DFvZ/2KNNVpFTBXpFrhuc
X-Received: by 2002:a05:6214:13aa:: with SMTP id h10mr3558916qvz.41.1589552594768;
        Fri, 15 May 2020 07:23:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589552594; cv=none;
        d=google.com; s=arc-20160816;
        b=URr9GeU+PYkCfN8snw9/rvyYoY6TPiYfk1q6JQHQAV/j0Q02DYynreQngVzP+/kvOm
         eLvJfcGlCvGA+J8Ojh3sW5N+3Kv+UXIPgPYDnrP7/E3BuPbIts0FKBcB0OIAmtawQfHA
         YkDuKY25VyAbtqp52UHXsBskhheyIMuihTNypZfD2obgKafSdrjiSwLYM9JAKHw23X9Q
         Ck9mgDGn3fTiURpjUbUV3XTCKmzIpeLJGDQ7CgR3m9qoPi9BorkshYT/+Uo0nZGu5RoN
         TRFj59HtD5vWqJMGQLPXgEhZpwDdpnUYMIJQXhbVjgyh0NL9JD+n7hDwUSOwu0gllpcQ
         iv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wdYDE6D4f41OSyQDXa/yslAI5HysUIzYcX5Y5tAHexk=;
        b=Epdh9XgyUgiLLfXImfaOURmihs2zQu/4XeDq4/3XR0M7YK+4XRmAWmQHIPVbM8wpAD
         uQNYr/B0v8+YXFP3DJ466zfmJwpCsqTm/jC7vvhkerGl1L2cwqm6YNClMFD2t7Exdc7Z
         sr5l0tz3piqHJ6GLM1Di+V9Fszy0OkDk1TJ1fOYOOGyG9ss2E+IMBvn/4dHw3W4N48vD
         /Wp47IPybUxL4vT4kMiZooRiwZAfzi/u5M714jm86xQunclCPqUt3yoNlC2CbNcgwT6P
         7aY0CXuX58itcnjltkCtBEsCybkPh9F9n6INKPTOnoAgrB9hqyPKNyOR6dDjstUZUdVA
         a99Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qHYVBo/v";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si1329565qte.299.2020.05.15.07.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 07:23:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qHYVBo/v";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZbF4-0004PM-4c
	for alex.bennee@linaro.org; Fri, 15 May 2020 10:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbD5-00010a-Sz
 for qemu-devel@nongnu.org; Fri, 15 May 2020 10:21:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbD4-0003uu-Lx
 for qemu-devel@nongnu.org; Fri, 15 May 2020 10:21:11 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m12so2520124wmc.0
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdYDE6D4f41OSyQDXa/yslAI5HysUIzYcX5Y5tAHexk=;
 b=qHYVBo/vibTvYrFIG9tPYKO9V3WJvlChV3Jz2ZtZtdJ0n1zWWiRJd6YDaZaByPlh+5
 WWX9ilQGJ4qxPI1tDRdYF84TaSjSLAB9DZgVLwBktv/PNMEo4FiAEI6OgiQTf/oLL6wb
 txq2yyDKmeWkVt9fSmXVIBeoKedeQKmkubANV8zdgW32umW32MBHyV4R4QPwh6Nst1Lg
 5LBUstFGWxF5c1HoSH+luYEDevZ1G9ZQlnvm63+MXC9OIx7+C2mSDO03Q9amjpH9yqdd
 gBZ16VluYNNvpwSrt+FPaN9V2Gi3RFmLxxgn9zktU5x+wIFupoYubaOvzHT/GlXuStOA
 UZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdYDE6D4f41OSyQDXa/yslAI5HysUIzYcX5Y5tAHexk=;
 b=gPWfBJcTt/FYUgCryvX0uIaQvmDIyqIwlJoP9mvJooLDLLbmAWRxqBK41C6/pgWqRI
 MPL4iCaRkmqdmPEGcNeEJ4D7y98STWzvVtvepY7FPF/fyOTymwRh7gw9+ZH64KfBWrK7
 pDClRHTO0XWjNaNR0//G1bNMwAR+j2ts1mpICWLLxPFcP+rqr9yjRgqRQqfTuwr3oqJ7
 mbBIxAsiKst1nc4YsbFclNOquycX0zFHMK0N4Bz/IqNc1YhQ9KzeHjKUsFmAvz4l9klf
 b7bpYlUeyzcY94KD6yS9Krm2egHgV9IJF+MPaPseuC//WS6xIiYXfCJLltp08V2QY70V
 vzMA==
X-Gm-Message-State: AOAM531fyBpe4Zd1QORRBPYUnlyNqWMjd30sIGHsvMoCML9r0BlOc/nr
 Xet9T8abJ2pnh8cSNgzzXeUCew==
X-Received: by 2002:a1c:a3c1:: with SMTP id m184mr4592450wme.91.1589552469153; 
 Fri, 15 May 2020 07:21:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s14sm3738327wmh.18.2020.05.15.07.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:21:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/10] target/arm: Convert VCVT fixed-point ops to decodetree
Date: Fri, 15 May 2020 15:20:55 +0100
Message-Id: <20200515142056.21346-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515142056.21346-1-peter.maydell@linaro.org>
References: <20200515142056.21346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +TkoesQ7/f+T

Convert the VCVT fixed-point conversion operations in the
Neon 2-regs-and-shift group to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 12 ++++++
 target/arm/translate-neon.inc.c | 53 +++++++++++++++++++++++
 target/arm/translate.c          | 75 +--------------------------------
 3 files changed, 67 insertions(+), 73 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 4438c1c8728..bce4043746e 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -418,3 +418,15 @@ VSHLL_U_2sh      1111 001 1 1 . 01 shift:4  .... 1010 0 . . 1 .... \
                  @2reg_shift_q0 size=1
 VSHLL_U_2sh      1111 001 1 1 . 001 shift:3 .... 1010 0 . . 1 .... \
                  @2reg_shift_q0 size=0
+
+# VCVT fixed<->float conversions
+# TODO: FP16 fixed<->float conversions are opc==0b1100 and 0b1101
+# We use size=0 for fp32 and size=1 for fp16 to match the 3-same encodings.
+VCVT_SF_2sh      1111 001 0 1 . 1 shift:5   .... 1110 0 . . 1 .... \
+                 @2reg_shift size=0
+VCVT_UF_2sh      1111 001 1 1 . 1 shift:5   .... 1110 0 . . 1 .... \
+                 @2reg_shift size=0
+VCVT_FS_2sh      1111 001 0 1 . 1 shift:5   .... 1111 0 . . 1 .... \
+                 @2reg_shift size=0
+VCVT_FU_2sh      1111 001 1 1 . 1 shift:5   .... 1111 0 . . 1 .... \
+                 @2reg_shift size=0
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 5678bfd0d4d..f27fe769f85 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1768,3 +1768,56 @@ static bool trans_VSHLL_U_2sh(DisasContext *s, arg_2reg_shift *a)
     };
     return do_vshll_2sh(s, a, widenfn[a->size], true);
 }
+
+static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
+                      NeonGenTwoSingleOPFn *fn)
+{
+    /* FP operations in 2-reg-and-shift group */
+    TCGv_i32 tmp, shiftv;
+    TCGv_ptr fpstatus;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpstatus = get_fpstatus_ptr(1);
+    /*
+     * The decode doesn't include the must-be-1 top bit of imm6 in a->shift,
+     * hence this 32-shift where the ARM ARM has 64-imm6.
+     */
+    shiftv = tcg_const_i32(32 - a->shift);
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        tmp = neon_load_reg(a->vm, pass);
+        fn(tmp, tmp, shiftv, fpstatus);
+        neon_store_reg(a->vd, pass, tmp);
+    }
+    tcg_temp_free_ptr(fpstatus);
+    tcg_temp_free_i32(shiftv);
+    return true;
+}
+
+#define DO_FP_2SH(INSN, FUNC)                                           \
+    static bool trans_##INSN##_2sh(DisasContext *s, arg_2reg_shift *a)  \
+    {                                                                   \
+        return do_fp_2sh(s, a, FUNC);                                   \
+    }
+
+DO_FP_2SH(VCVT_SF, gen_helper_vfp_sltos)
+DO_FP_2SH(VCVT_UF, gen_helper_vfp_ultos)
+DO_FP_2SH(VCVT_FS, gen_helper_vfp_tosls_round_to_zero)
+DO_FP_2SH(VCVT_FU, gen_helper_vfp_touls_round_to_zero)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ef39c89f10a..9cc44e6258e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5193,7 +5193,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int q;
     int rd, rn, rm, rd_ofs, rn_ofs, rm_ofs;
     int size;
-    int shift;
     int pass;
     int u;
     int vec_size;
@@ -5234,78 +5233,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         return 1;
     } else if (insn & (1 << 4)) {
         if ((insn & 0x00380080) != 0) {
-            /* Two registers and shift.  */
-            op = (insn >> 8) & 0xf;
-
-            switch (op) {
-            case 0: /* VSHR */
-            case 1: /* VSRA */
-            case 2: /* VRSHR */
-            case 3: /* VRSRA */
-            case 4: /* VSRI */
-            case 5: /* VSHL, VSLI */
-            case 6: /* VQSHLU */
-            case 7: /* VQSHL */
-            case 8: /* VSHRN, VRSHRN, VQSHRUN, VQRSHRUN */
-            case 9: /* VQSHRN, VQRSHRN */
-            case 10: /* VSHLL, including VMOVL */
-                return 1; /* handled by decodetree */
-            default:
-                break;
-            }
-
-            if (insn & (1 << 7)) {
-                /* 64-bit shift. */
-                if (op > 7) {
-                    return 1;
-                }
-                size = 3;
-            } else {
-                size = 2;
-                while ((insn & (1 << (size + 19))) == 0)
-                    size--;
-            }
-            shift = (insn >> 16) & ((1 << (3 + size)) - 1);
-            if (op >= 14) {
-                /* VCVT fixed-point.  */
-                TCGv_ptr fpst;
-                TCGv_i32 shiftv;
-                VFPGenFixPointFn *fn;
-
-                if (!(insn & (1 << 21)) || (q && ((rd | rm) & 1))) {
-                    return 1;
-                }
-
-                if (!(op & 1)) {
-                    if (u) {
-                        fn = gen_helper_vfp_ultos;
-                    } else {
-                        fn = gen_helper_vfp_sltos;
-                    }
-                } else {
-                    if (u) {
-                        fn = gen_helper_vfp_touls_round_to_zero;
-                    } else {
-                        fn = gen_helper_vfp_tosls_round_to_zero;
-                    }
-                }
-
-                /* We have already masked out the must-be-1 top bit of imm6,
-                 * hence this 32-shift where the ARM ARM has 64-imm6.
-                 */
-                shift = 32 - shift;
-                fpst = get_fpstatus_ptr(1);
-                shiftv = tcg_const_i32(shift);
-                for (pass = 0; pass < (q ? 4 : 2); pass++) {
-                    TCGv_i32 tmpf = neon_load_reg(rm, pass);
-                    fn(tmpf, tmpf, shiftv, fpst);
-                    neon_store_reg(rd, pass, tmpf);
-                }
-                tcg_temp_free_ptr(fpst);
-                tcg_temp_free_i32(shiftv);
-            } else {
-                return 1;
-            }
+            /* Two registers and shift: handled by decodetree */
+            return 1;
         } else { /* (insn & 0x00380080) == 0 */
             int invert, reg_ofs, vec_size;
 
-- 
2.20.1

