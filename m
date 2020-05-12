Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1320459lfb;
        Tue, 12 May 2020 09:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy57K2Xl23hPocD5N+xiWgCcQVBoslVt09CECHXvMLCgVQTPAtFJ0cSd4TTOtHONEC8K+CR
X-Received: by 2002:ac8:7587:: with SMTP id s7mr2830567qtq.116.1589301785839;
        Tue, 12 May 2020 09:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301785; cv=none;
        d=google.com; s=arc-20160816;
        b=yOh0urnQP005oLm3RELFkPv2XIx7DEsrxwoHtDgPzPqPCcTyBnAeh0VIKpXeprCDSo
         L/87moeKctlfFOX3wyvt7jr3FWJLO5JIOAf/MceyGXobzF/a+NYvLM6p26JMuQJ6Dd02
         VPlcdcPk3OBYSBliQFadDVHBUaFWy+FumsIcJU0uswETeV3rI5UVeSIWm2HJudnp7T8f
         V1WUAR9hTxrVNJ5FdeZnEkN0Wk4ims6wlY+TSP/Xkl04P+qBZfe2hNd11wNt6UXALa/a
         1Eefm8V0akCZQmawfWwPl5jpoVw1h43rCxYETXok+U2Pm0zYQFBXILLYW0ZiZmQgwpM7
         dYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Dz9iHVssEtWGnM5ibB3PaM3aTlxRZRePy2DU6crML64=;
        b=iDpf9nHw6lJC7oZ0hVRWnUdq0NWapaoHVQvOFsnuv1YiqYpg8ZKM2UsOpYbMSwO9Xo
         ZNsy/6ghm2ZXZptqS9uSS0CL+yzLJ50Bbm2Hn9KFbMsb1Hwu4Zg/49GHL6vlURaZSe29
         ju+WdCZwjXPSW4MWaic1WLkSlNJ2H5GJWZfuiWX7q5eTendGlPZywgTm/qE9KUV08cB5
         YbEI4XUPyUE2HF+EP5fg7IUguF6mEomqEfp+5Hyy0ZHuXrSlNSxXTw2jYeC0DKvozjLo
         MUCl4/VWI9GNerE6cV5HJj7/GFaVRufnUXRcp9BAaStkBO6SvSnw/oAto1/Z60f0bpuD
         xjGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1OXHr2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si7494498qvj.68.2020.05.12.09.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1OXHr2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYXzl-0002qX-97
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwF-0006kk-0h
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:27 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwD-0006Er-Qd
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:26 -0400
Received: by mail-wm1-x343.google.com with SMTP id n5so9289456wmd.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dz9iHVssEtWGnM5ibB3PaM3aTlxRZRePy2DU6crML64=;
 b=c1OXHr2+FyFy+lYBjk0f9qLhygsuI9bo91lw2hMyGPWFiQVXMEotNkrfK2zwEkZc6T
 AtvE0UYmSZYKqIvCj2Mn61lBHdWSLJPto0BwwYl+YwhMV+kw5/HmjsqhNdliwf8lJ0oj
 JuSXxOVIArw1rwltQf+t+dr2qghHB0u3O7rWjafOvf+dW0a5s4+XXtTTNpsr7JsVHhe3
 m5b2HRBmuNV+eTakseEG9BYsrsVL5ras9JBFSHMx63jpwL0eBWZG9m3b3KYDtIAqDY8P
 qjoVPTP71NKKStQDewKNALBRUXgEISfCNPJuQUdZ9EXogQJNa4XhwQ0NlQsovvlt3KAT
 BS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dz9iHVssEtWGnM5ibB3PaM3aTlxRZRePy2DU6crML64=;
 b=ktHpvn70YZs1U1zW4pQePBWfMgTZPYtg95XAVuM45NQBYW5QrxjI5z64yU3HuOCkFA
 B9dHSbDgg+Zqmc0J6biSpwl9sPmKJqrncroYZpt+bvBODh5SIMcAF2EDuhliWLfNxTLq
 3bmqYiu+n8qd72uU+6cc0hviBCWTidilUA4LZewCBo+wvWKHRt+/R72dMdq24gJlSxeb
 Jn6Z8HGnPrLYcYLME4eqmgruU4Fbe6t/PoOv9XdUjp9gReris+rRjzzOjc94YP+8pmRn
 2UKvs+VWYnYBDXTV6kw2Qgx4QdcKbVOkpChsY3Y7WphBscuEd08xsTEBViBsRG67RnoZ
 rd+A==
X-Gm-Message-State: AGi0PuYzpZtnkSJIfKTuEEmNCTc7b0jNp765w79qShwNUJpZ00hvCCB8
 mwVVrOBK9fkeBbOzkOaMVJqQhoOFHAwL/A==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr18843475wml.84.1589301563849; 
 Tue, 12 May 2020 09:39:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/17] target/arm: Convert Neon VPMIN/VPMAX/VPADD float
 3-reg-same insns to decodetree
Date: Tue, 12 May 2020 17:38:59 +0100
Message-Id: <20200512163904.10918-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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
X-TUID: pQnZUWuleL4v

Convert the Neon float VPMIN, VPMAX and VPADD 3-reg-same insns to
decodetree. These are the only remaining 'pairwise' operations,
so we can delete the pairwise-specific bits of the old decoder's
for-each-element loop now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       |  5 +++
 target/arm/translate-neon.inc.c | 63 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 63 +++++----------------------------
 3 files changed, 76 insertions(+), 55 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 06fb8b96aad..1f289750dcd 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -48,6 +48,8 @@
 # For FP insns the high bit of 'size' is used as part of opcode decode
 @3same_fp        .... ... . . . . size:1 .... .... .... . q:1 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
+@3same_fp_q0     .... ... . . . . size:1 .... .... .... . 0 . . .... \
+                 &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp q=0
 
 VHADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 0 .... @3same
 VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
@@ -177,4 +179,7 @@ VQRDMLSH_3s      1111 001 1 0 . .. .... .... 1100 ... 1 .... @3same
 
 VADD_fp_3s       1111 001 0 0 . 0 . .... .... 1101 ... 0 .... @3same_fp
 VSUB_fp_3s       1111 001 0 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
+VPADD_fp_3s      1111 001 1 0 . 0 . .... .... 1101 ... 0 .... @3same_fp_q0
 VABD_fp_3s       1111 001 1 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
+VPMAX_fp_3s      1111 001 1 0 . 0 . .... .... 1111 ... 0 .... @3same_fp_q0
+VPMIN_fp_3s      1111 001 1 0 . 1 . .... .... 1111 ... 0 .... @3same_fp_q0
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 540720f5e0d..7bdf1e3fee8 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1049,3 +1049,66 @@ DO_3SAME_VQDMULH(VQRDMULH, qrdmulh)
 DO_3S_FP_GVEC(VADD, gen_helper_gvec_fadd_s)
 DO_3S_FP_GVEC(VSUB, gen_helper_gvec_fsub_s)
 DO_3S_FP_GVEC(VABD, gen_helper_gvec_fabd_s)
+
+static bool do_3same_fp_pair(DisasContext *s, arg_3same *a, VFPGen3OpSPFn *fn)
+{
+    /* FP operations handled pairwise 32 bits at a time */
+    TCGv_i32 tmp, tmp2, tmp3;
+    TCGv_ptr fpstatus;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    assert(a->q == 0); /* enforced by decode patterns */
+
+    /*
+     * Note that we have to be careful not to clobber the source operands
+     * in the "vm == vd" case by storing the result of the first pass too
+     * early. Since Q is 0 there are always just two passes, so instead
+     * of a complicated loop over each pass we just unroll.
+     */
+    fpstatus = get_fpstatus_ptr(1);
+    tmp = neon_load_reg(a->vn, 0);
+    tmp2 = neon_load_reg(a->vn, 1);
+    fn(tmp, tmp, tmp2, fpstatus);
+    tcg_temp_free_i32(tmp2);
+
+    tmp3 = neon_load_reg(a->vm, 0);
+    tmp2 = neon_load_reg(a->vm, 1);
+    fn(tmp3, tmp3, tmp2, fpstatus);
+    tcg_temp_free_i32(tmp2);
+    tcg_temp_free_ptr(fpstatus);
+
+    neon_store_reg(a->vd, 0, tmp);
+    neon_store_reg(a->vd, 1, tmp3);
+    return true;
+}
+
+/*
+ * For all the functions using this macro, size == 1 means fp16,
+ * which is an architecture extension we don't implement yet.
+ */
+#define DO_3S_FP_PAIR(INSN,FUNC)                                    \
+    static bool trans_##INSN##_fp_3s(DisasContext *s, arg_3same *a) \
+    {                                                               \
+        if (a->size != 0) {                                         \
+            /* TODO fp16 support */                                 \
+            return false;                                           \
+        }                                                           \
+        return do_3same_fp_pair(s, a, FUNC);                        \
+    }
+
+DO_3S_FP_PAIR(VPADD, gen_helper_vfp_adds)
+DO_3S_FP_PAIR(VPMAX, gen_helper_vfp_maxs)
+DO_3S_FP_PAIR(VPMIN, gen_helper_vfp_mins)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8a94856cd28..ca6ed09ec34 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5348,7 +5348,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int shift;
     int pass;
     int count;
-    int pairwise;
     int u;
     int vec_size;
     uint32_t imm;
@@ -5433,6 +5432,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VPMIN:
         case NEON_3R_VPADD_VQRDMLAH:
         case NEON_3R_VQDMULH_VQRDMULH:
+        case NEON_3R_FLOAT_ARITH:
             /* Already handled by decodetree */
             return 1;
         }
@@ -5441,16 +5441,11 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             /* 64-bit element instructions: handled by decodetree */
             return 1;
         }
-        pairwise = 0;
         switch (op) {
-        case NEON_3R_FLOAT_ARITH:
-            pairwise = (u && size < 2); /* if VPADD (float) */
-            if (!pairwise) {
-                return 1; /* handled by decodetree */
-            }
-            break;
         case NEON_3R_FLOAT_MINMAX:
-            pairwise = u; /* if VPMIN/VPMAX (float) */
+            if (u) {
+                return 1; /* VPMIN/VPMAX handled by decodetree */
+            }
             break;
         case NEON_3R_FLOAT_CMP:
             if (!u && size) {
@@ -5478,41 +5473,12 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             break;
         }
 
-        if (pairwise && q) {
-            /* All the pairwise insns UNDEF if Q is set */
-            return 1;
-        }
-
         for (pass = 0; pass < (q ? 4 : 2); pass++) {
 
-        if (pairwise) {
-            /* Pairwise.  */
-            if (pass < 1) {
-                tmp = neon_load_reg(rn, 0);
-                tmp2 = neon_load_reg(rn, 1);
-            } else {
-                tmp = neon_load_reg(rm, 0);
-                tmp2 = neon_load_reg(rm, 1);
-            }
-        } else {
-            /* Elementwise.  */
-            tmp = neon_load_reg(rn, pass);
-            tmp2 = neon_load_reg(rm, pass);
-        }
+        /* Elementwise.  */
+        tmp = neon_load_reg(rn, pass);
+        tmp2 = neon_load_reg(rm, pass);
         switch (op) {
-        case NEON_3R_FLOAT_ARITH: /* Floating point arithmetic. */
-        {
-            TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-            switch ((u << 2) | size) {
-            case 4: /* VPADD */
-                gen_helper_vfp_adds(tmp, tmp, tmp2, fpstatus);
-                break;
-            default:
-                abort();
-            }
-            tcg_temp_free_ptr(fpstatus);
-            break;
-        }
         case NEON_3R_FLOAT_MULTIPLY:
         {
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
@@ -5603,22 +5569,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         }
         tcg_temp_free_i32(tmp2);
 
-        /* Save the result.  For elementwise operations we can put it
-           straight into the destination register.  For pairwise operations
-           we have to be careful to avoid clobbering the source operands.  */
-        if (pairwise && rd == rm) {
-            neon_store_scratch(pass, tmp);
-        } else {
-            neon_store_reg(rd, pass, tmp);
-        }
+        neon_store_reg(rd, pass, tmp);
 
         } /* for pass */
-        if (pairwise && rd == rm) {
-            for (pass = 0; pass < (q ? 4 : 2); pass++) {
-                tmp = neon_load_scratch(pass);
-                neon_store_reg(rd, pass, tmp);
-            }
-        }
         /* End of 3 register same size operations.  */
     } else if (insn & (1 << 4)) {
         if ((insn & 0x00380080) != 0) {
-- 
2.20.1

