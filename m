Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1326637lfb;
        Tue, 12 May 2020 09:51:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZ9CGz4iOdDlk0sgROGxdgavYQaT6Gcy4T9QCECMTCNdArz7h8718SBrBv8gmBfhfSPvCI
X-Received: by 2002:a37:a008:: with SMTP id j8mr21012878qke.421.1589302296893;
        Tue, 12 May 2020 09:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589302296; cv=none;
        d=google.com; s=arc-20160816;
        b=dTUx037IXj2Vl5OD/0bK8bKdDN69q+bIRMdCMsVbQa89MVtY9hGBO6LYZ6PX3/tmeJ
         a0NEF5q+0r4CeSvxiRzwkLJJUZX74GogG6OZD+umNuFlEe/pV+YykQ0UNRYrgIUBQQKr
         Wu2bN7JDLEUwApybzouEVpvgZBwBIWC4OEuXSOtGipCjG8ses8/gY97V1mw4FPkJyXER
         SGwSRBlhDeg+QlkYDcgQrmBerNQLzySwzUQkJhoa7rmsYaw225X183GPjjmN3rRFmEej
         8IkKbVvgOatUo+MeQ46f6hdD142t6L1W4Iot2xIv7SvNHIVFRZjkTw/O8ySdVv5Mfdct
         r+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=F+yaFxIvTHCyrF2KyV7XGJ2IoIrQubqAcfuXHKLVgu4=;
        b=xOn3gFeqFgG/+O0zc/fneAmOutHC2lmx4dkZN+Ff7uCfdBA6soKgU6fh9sxCWgTPSM
         5wjHw1jA7dS6djbhgYb5LHA/SAWyMez38FH+V7vbstxmkSsw3mV7attkytfmXe25kPUn
         3tIwgv0CEBtW+mkAEfgP8keb7eM+Yo99/ZaD/pq3aEjqurdpjb3kZOalBKpcB/mCRwXR
         pYEKBnAh6jXeUbDD0cRJVQrdzgLh+PwbLOxMffnh3c2CYLwboUrTNu00AmoAh6py2Q0L
         DcMfT///CzMMSMNIX7h2gEzW4tZQKQ2PomYNZHc3v/XgjPTpNkiMlhq5sRLvCiwzHorp
         CNmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3YwogxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si2872300qtq.109.2020.05.12.09.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3YwogxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYY80-0005SO-AI
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwD-0006hE-Ac
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:25 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXwC-0006DE-9j
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:24 -0400
Received: by mail-wr1-x441.google.com with SMTP id l17so2744697wrr.4
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F+yaFxIvTHCyrF2KyV7XGJ2IoIrQubqAcfuXHKLVgu4=;
 b=f3YwogxOCRlm2Vx1uuxyhA+lbQkwYgZ7t5hxk+aM5fOxgYoNxxvtINBDpTpUnqdeUQ
 JBDaNzLAwN4l1kHzRm9poI6+AWy7DJtzxFLDVXAUJRZL+BeMEstZxhUQ6oZHJ4odbQZf
 DdXja3SX7TwX8em3QwXJ8TKmkmc0lnNRPS49vEJ64vdAMkg0XozhJuGVFUp7FF3DCSKW
 HXygzgGIgtT06Tdek9nNiwlPmpUZD3njmoRODpKNdNYqfSMADSpGU9x+bBTSeukWpoDe
 Hjt4P3QBarTevUQGxdHJ+cbmu7QaBERHb7ecnk/cS9hXCkZEiM6rXNDn7TKXI/j0sqSv
 CAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F+yaFxIvTHCyrF2KyV7XGJ2IoIrQubqAcfuXHKLVgu4=;
 b=l8SWz77GSgEbrbE6lvYnJn6+kuzMpJEUQ3/sf796UED+iG9UQMbQ1s9J09DCnuiAHW
 x8Raj+XMgB0QKhgR1TMBUN6wzUPWy1NaJEkez8fVQzYxyM+pttn1syFWEQe/PJe62zo0
 2uj/lLgCQ6r7zfl9rz4bIdjCdzQZrXES9gt0SNS2PN6n/BC44thDjSCLvdDSAzew4uYR
 0ZkAFDUSUF2uMFXL5r18+LlFSFxQoOZ3oWNT3T7OrY5+eeGWQs8H94uC67Zch90gQSu3
 9+3hY55m4VuZjZZURIfu7HWf8OCJIr93DRRdHbip7h4lwqNPB+4ZICI1PYW1hIfSN2J6
 HiXQ==
X-Gm-Message-State: AGi0PuZiky03ixWyxLGVpGwjysAbk3yp+egTdDjtE/K4cqpFIatsKbqC
 adcRkuU1dGzFzsyndzreN6d5FT7qeqH/LQ==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr27254620wru.40.1589301562624; 
 Tue, 12 May 2020 09:39:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/17] target/arm: Convert Neon VADD, VSUB,
 VABD 3-reg-same insns to decodetree
Date: Tue, 12 May 2020 17:38:58 +0100
Message-Id: <20200512163904.10918-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
X-TUID: 9z7yec04J2pO

Convert the Neon VADD, VSUB, VABD 3-reg-same insns to decodetree.
We already have gvec helpers for addition and subtraction, but must
add one for fabd.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             |  3 ++-
 target/arm/neon-dp.decode       |  8 ++++++++
 target/arm/neon_helper.c        |  7 -------
 target/arm/translate-neon.inc.c | 28 ++++++++++++++++++++++++++++
 target/arm/translate.c          | 10 +++-------
 target/arm/vec_helper.c         |  7 +++++++
 6 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1857f4ee46a..6e9629c87b0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -396,7 +396,6 @@ DEF_HELPER_FLAGS_2(neon_qneg_s16, TCG_CALL_NO_RWG, i32, env, i32)
 DEF_HELPER_FLAGS_2(neon_qneg_s32, TCG_CALL_NO_RWG, i32, env, i32)
 DEF_HELPER_FLAGS_2(neon_qneg_s64, TCG_CALL_NO_RWG, i64, env, i64)
 
-DEF_HELPER_3(neon_abd_f32, i32, i32, i32, ptr)
 DEF_HELPER_3(neon_ceq_f32, i32, i32, i32, ptr)
 DEF_HELPER_3(neon_cge_f32, i32, i32, i32, ptr)
 DEF_HELPER_3(neon_cgt_f32, i32, i32, i32, ptr)
@@ -595,6 +594,8 @@ DEF_HELPER_FLAGS_5(gvec_fmul_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fabd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 28e8333335d..06fb8b96aad 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -45,6 +45,10 @@
 @3same_q0        .... ... . . . size:2 .... .... .... . 0 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp q=0
 
+# For FP insns the high bit of 'size' is used as part of opcode decode
+@3same_fp        .... ... . . . . size:1 .... .... .... . q:1 . . .... \
+                 &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
 VHADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 0 .... @3same
 VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
 VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
@@ -170,3 +174,7 @@ SHA256SU1_3s     1111 001 1 0 . 10 .... .... 1100 . 1 . 0 .... \
                  vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 VQRDMLSH_3s      1111 001 1 0 . .. .... .... 1100 ... 1 .... @3same
+
+VADD_fp_3s       1111 001 0 0 . 0 . .... .... 1101 ... 0 .... @3same_fp
+VSUB_fp_3s       1111 001 0 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
+VABD_fp_3s       1111 001 1 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
diff --git a/target/arm/neon_helper.c b/target/arm/neon_helper.c
index 2ef75e04c83..b637265691a 100644
--- a/target/arm/neon_helper.c
+++ b/target/arm/neon_helper.c
@@ -1825,13 +1825,6 @@ uint64_t HELPER(neon_qneg_s64)(CPUARMState *env, uint64_t x)
 }
 
 /* NEON Float helpers.  */
-uint32_t HELPER(neon_abd_f32)(uint32_t a, uint32_t b, void *fpstp)
-{
-    float_status *fpst = fpstp;
-    float32 f0 = make_float32(a);
-    float32 f1 = make_float32(b);
-    return float32_val(float32_abs(float32_sub(f0, f1, fpst)));
-}
 
 /* Floating point comparisons produce an integer result.
  * Note that EQ doesn't signal InvalidOp for QNaNs but GE and GT do.
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index f52302f42b1..540720f5e0d 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1021,3 +1021,31 @@ DO_3SAME_PAIR(VPADD, padd_u)
 
 DO_3SAME_VQDMULH(VQDMULH, qdmulh)
 DO_3SAME_VQDMULH(VQRDMULH, qrdmulh)
+
+/*
+ * For all the functions using this macro, size == 1 means fp16,
+ * which is an architecture extension we don't implement yet.
+ */
+#define DO_3S_FP_GVEC(INSN,FUNC)                                        \
+    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
+                                uint32_t rn_ofs, uint32_t rm_ofs,       \
+                                uint32_t oprsz, uint32_t maxsz)         \
+    {                                                                   \
+        TCGv_ptr fpst = get_fpstatus_ptr(1);                            \
+        tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, fpst,                \
+                           oprsz, maxsz, 0, FUNC);                      \
+        tcg_temp_free_ptr(fpst);                                        \
+    }                                                                   \
+    static bool trans_##INSN##_fp_3s(DisasContext *s, arg_3same *a)     \
+    {                                                                   \
+        if (a->size != 0) {                                             \
+            /* TODO fp16 support */                                     \
+            return false;                                               \
+        }                                                               \
+        return do_3same(s, a, gen_##INSN##_3s);                         \
+    }
+
+
+DO_3S_FP_GVEC(VADD, gen_helper_gvec_fadd_s)
+DO_3S_FP_GVEC(VSUB, gen_helper_gvec_fsub_s)
+DO_3S_FP_GVEC(VABD, gen_helper_gvec_fabd_s)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 561cb67286d..8a94856cd28 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5445,6 +5445,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         switch (op) {
         case NEON_3R_FLOAT_ARITH:
             pairwise = (u && size < 2); /* if VPADD (float) */
+            if (!pairwise) {
+                return 1; /* handled by decodetree */
+            }
             break;
         case NEON_3R_FLOAT_MINMAX:
             pairwise = u; /* if VPMIN/VPMAX (float) */
@@ -5501,16 +5504,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         {
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
             switch ((u << 2) | size) {
-            case 0: /* VADD */
             case 4: /* VPADD */
                 gen_helper_vfp_adds(tmp, tmp, tmp2, fpstatus);
                 break;
-            case 2: /* VSUB */
-                gen_helper_vfp_subs(tmp, tmp, tmp2, fpstatus);
-                break;
-            case 6: /* VABD */
-                gen_helper_neon_abd_f32(tmp, tmp, tmp2, fpstatus);
-                break;
             default:
                 abort();
             }
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index fa33df859e5..50a499299fd 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -691,6 +691,11 @@ static float64 float64_ftsmul(float64 op1, uint64_t op2, float_status *stat)
     return result;
 }
 
+static float32 float32_abd(float32 op1, float32 op2, float_status *stat)
+{
+    return float32_abs(float32_sub(op1, op2, stat));
+}
+
 #define DO_3OP(NAME, FUNC, TYPE) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
 {                                                                          \
@@ -718,6 +723,8 @@ DO_3OP(gvec_ftsmul_h, float16_ftsmul, float16)
 DO_3OP(gvec_ftsmul_s, float32_ftsmul, float32)
 DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
 
+DO_3OP(gvec_fabd_s, float32_abd, float32)
+
 #ifdef TARGET_AARCH64
 
 DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
-- 
2.20.1

