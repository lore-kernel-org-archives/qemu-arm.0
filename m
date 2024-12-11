Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4194568njb;
        Wed, 11 Dec 2024 08:38:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUT9CzfTIRUSDGBwwLnQe+OmGmUv/ngF02u+HlNGgFRcEcefeB1OMcAVDNv8m4OjZhen4QHiss+Mn+1GA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTvRbN+I1KoC6/5CMEip4+SNUTj/XFAXDIy5r7mvVnwx9aKH1UyIcGpywfrR7GxezmCkmb
X-Received: by 2002:a05:620a:24cf:b0:7b6:d736:55c4 with SMTP id af79cd13be357-7b6f1bfbbb6mr50735485a.17.1733935135874;
        Wed, 11 Dec 2024 08:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935135; cv=none;
        d=google.com; s=arc-20240605;
        b=jLJpqnErbrOmcapiD1QrapjArcpb2hCz0XR4aO7cRCFztsEfa+BR6GO4xh8gnwGww/
         9jTLD/DKH9bslPgwSJj76G0ryLjVwb+gtviLJHXxgXyYmv5UxIjn6KHE9+j0GYxE7QrJ
         NNsuB7+di7qn/BN8bSew/hiuwQFsh0C2BdTBZl7KYphTDZifhXomYo0/nDgybbSn0WzJ
         YKF8bpd7KjvGyruTKj+XcCTFR72PVxLBxoN4f3XJ8mdHUKq8bSNpcEpECqFwhU8UPsKf
         XQdor42l2xp0tuxlIsdVzwb2cmzuoeRDFEwXmKMvgBU35tRas/LZxEhSNKEmy50Zpm0k
         wnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wx2oeNvk7+nxzVdOySanVfeimHrR2uj9890rtyuJIiE=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=WmOFfOKJC84OLLn8//kU4CMK7p5yKbAphrcWu6QvUgUdGsiYA2JizISiLg6Gzyi6GH
         0XUKxMMN9wAlS0cgmUrOfLLMttu2/qeG1nIAB+EddlO+22VQxyX2MXqBjQzLQ4F6SUK3
         CviooWc5EcJlZ10g7tumzRUG5lkJ2MFxU2SEsmaiNmq7ME/iseRX5614Jg6qdu7aIEkd
         r8FdDienEeQc8bVSAb195CWYv/VGpw9Lu58a/+XSRBkjpnKn9psWB5qoO4qMuFz53u2n
         hKqxa4lwEunsmQwhVwW0adiWDm8G1yJVm5Ge6kz3KBN8p275BmaEsLEblyfAza7GLQVL
         8REQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F97k42j5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6ee9b0610si120435885a.693.2024.12.11.08.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F97k42j5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPi0-0002EW-1g; Wed, 11 Dec 2024 11:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhu-0001qB-6E
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:37:02 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhr-0002Ls-HF
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:37:01 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6d87fea84cdso52646196d6.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733935018; x=1734539818; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wx2oeNvk7+nxzVdOySanVfeimHrR2uj9890rtyuJIiE=;
 b=F97k42j5Pslc6KR7P3+xQlumjolO7oHgizmgMem8zMmhWQbtuSK/4eyFqqGDMRNUO7
 7xLkDsSY2ATnBJ1nM5gBjutYi27fhFwxb6Z8/Lk5LOidJgPDbCo3EdcjWRPfvLbrdKKn
 Kxl97/zBdoo0Oxr7FKiMsXxIAi7dRpw/brc84SY+Wxq1Le4uQpSYGRLambhuPANV3zLq
 lT4t+IrQToB/5mbFbzJbUX5k9pi6T2cnUddkSoNiKuA212ucc14CprcJJFHmM33F5l3z
 0ozrNwxfjwrEQ3/jWA7DXCaHQm3h1DkLzFQq21NsJNXEacjRJtStFInT3N++P/zRuSRX
 rxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733935018; x=1734539818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wx2oeNvk7+nxzVdOySanVfeimHrR2uj9890rtyuJIiE=;
 b=f4HPzmrK3Ndo7In3utq0GOieVqP3B+oInAfomFU0VLYe6kxC2ytVf1EUHhgBXsPMSL
 7vgfikHIxALTe4QIthIJWlwdGuS1xD+nl/QbHy2M1EJewtGsXi01BvsClqxu2o1qwzx4
 ZfS+AiuvZM5+0h0SGLHCaw9e+e9IVOdKNBrNF4ffJwNXIjNAVbY9bMoVjIG2yIQMgzSW
 jIUakLLWwBNx0dV9cAu9rPIEReo5C7xwHOVeeAcppKBw3fIqa6Tk6czyEyzLPILuHMIz
 Q2Ig6OUR3d62sFfowcyauttwmzpeKbPFrPG0IVho8wbc5V7OIQxi1lA+lUonuRFqLLOG
 TeCg==
X-Gm-Message-State: AOJu0Yxfof7hydWhgc8kja5bff0PjJ7MD40HWHcfYtS9lTcMZGbSj4I5
 8pT2aCNM7T6iPRIprKQXcLoQKMpnWV8W8zq7e8biDOHm3JYO8D0zuVoGDy6uVuc=
X-Gm-Gg: ASbGncsFlEw2qfZXL/xuO0hmE7tr/7bbwhE4GbBRrLRxojXm9BttqS7swLzkJtIkdgf
 7YPQAkBVZMQsFq+AHpKRSVeFcLuIunF6Ca3KGJzOMdms3h8G4l28e33+LzOrLDdvzw+PvV5BlVs
 q2/LeluqARd0An2k3z0LhjDZw+Fzp0BNBOWs236Wbav5odx4nWqka6Y6HQjFE/uS1AQ2Ks35h5A
 yA2nu1GLQPWSAV/i50UguAc0CMTB6kE3HNlNptsa7L42FcK0YYDxobEkepTTw==
X-Received: by 2002:a05:6214:3018:b0:6d9:2e0c:56c9 with SMTP id
 6a1803df08f44-6dae29c3573mr7119196d6.9.1733935018491; 
 Wed, 11 Dec 2024 08:36:58 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 64/69] target/arm: Convert FCVT* (vector,
 integer) to decodetree
Date: Wed, 11 Dec 2024 10:30:31 -0600
Message-ID: <20241211163036.2297116-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
X-TUID: tAIZklWLay5Q

Remove handle_2misc_64 as these were the last insns decoded
by that function.  Remove helper_advsimd_f16to[su]inth as unused;
we now always go through helper_vfp_to[su]hh or a specialized
vector function instead.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |   2 +
 target/arm/tcg/helper-a64.h    |   2 -
 target/arm/tcg/helper-a64.c    |  32 -----
 target/arm/tcg/translate-a64.c | 227 +++++++++++----------------------
 target/arm/tcg/vec_helper.c    |   2 +
 target/arm/tcg/a64.decode      |  25 ++++
 6 files changed, 102 insertions(+), 188 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0c8a56c3ae..64aa603465 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -665,6 +665,8 @@ DEF_HELPER_FLAGS_4(gvec_vcvt_ud, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rz_ds, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rz_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_vcvt_rm_sd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rm_ud, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_us, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index ac7ca190fa..3c0774139b 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -74,8 +74,6 @@ DEF_HELPER_3(advsimd_mulx2h, i32, i32, i32, ptr)
 DEF_HELPER_4(advsimd_muladd2h, i32, i32, i32, i32, ptr)
 DEF_HELPER_2(advsimd_rinth_exact, f16, f16, ptr)
 DEF_HELPER_2(advsimd_rinth, f16, f16, ptr)
-DEF_HELPER_2(advsimd_f16tosinth, i32, f16, ptr)
-DEF_HELPER_2(advsimd_f16touinth, i32, f16, ptr)
 
 DEF_HELPER_2(exception_return, void, env, i64)
 DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 3de564e0fe..28de7468cd 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -618,38 +618,6 @@ uint32_t HELPER(advsimd_rinth)(uint32_t x, void *fp_status)
     return ret;
 }
 
-/*
- * Half-precision floating point conversion functions
- *
- * There are a multitude of conversion functions with various
- * different rounding modes. This is dealt with by the calling code
- * setting the mode appropriately before calling the helper.
- */
-
-uint32_t HELPER(advsimd_f16tosinth)(uint32_t a, void *fpstp)
-{
-    float_status *fpst = fpstp;
-
-    /* Invalid if we are passed a NaN */
-    if (float16_is_any_nan(a)) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_int16(a, fpst);
-}
-
-uint32_t HELPER(advsimd_f16touinth)(uint32_t a, void *fpstp)
-{
-    float_status *fpst = fpstp;
-
-    /* Invalid if we are passed a NaN */
-    if (float16_is_any_nan(a)) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_uint16(a, fpst);
-}
-
 static int el_from_spsr(uint32_t spsr)
 {
     /* Return the exception level that this SPSR is requesting a return to,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1c4e53770b..ec1ce44c4b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9348,56 +9348,38 @@ static gen_helper_gvec_2_ptr * const f_fcvtzu_vf[] = {
 TRANS(FCVTZU_vf, do_gvec_op2_fpst,
       a->esz, a->q, a->rd, a->rn, a->shift, f_fcvtzu_vf)
 
-static void handle_2misc_64(DisasContext *s, int opcode, bool u,
-                            TCGv_i64 tcg_rd, TCGv_i64 tcg_rn,
-                            TCGv_i32 tcg_rmode, TCGv_ptr tcg_fpstatus)
-{
-    /* Handle 64->64 opcodes which are shared between the scalar and
-     * vector 2-reg-misc groups. We cover every integer opcode where size == 3
-     * is valid in either group and also the double-precision fp ops.
-     * The caller only need provide tcg_rmode and tcg_fpstatus if the op
-     * requires them.
-     */
-    switch (opcode) {
-    case 0x1a: /* FCVTNS */
-    case 0x1b: /* FCVTMS */
-    case 0x1c: /* FCVTAS */
-    case 0x3a: /* FCVTPS */
-    case 0x3b: /* FCVTZS */
-        gen_helper_vfp_tosqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
-        break;
-    case 0x5a: /* FCVTNU */
-    case 0x5b: /* FCVTMU */
-    case 0x5c: /* FCVTAU */
-    case 0x7a: /* FCVTPU */
-    case 0x7b: /* FCVTZU */
-        gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
-        break;
-    default:
-    case 0x4: /* CLS, CLZ */
-    case 0x5: /* NOT */
-    case 0x7: /* SQABS, SQNEG */
-    case 0x8: /* CMGT, CMGE */
-    case 0x9: /* CMEQ, CMLE */
-    case 0xa: /* CMLT */
-    case 0xb: /* ABS, NEG */
-    case 0x2f: /* FABS */
-    case 0x6f: /* FNEG */
-    case 0x7f: /* FSQRT */
-    case 0x18: /* FRINTN */
-    case 0x19: /* FRINTM */
-    case 0x38: /* FRINTP */
-    case 0x39: /* FRINTZ */
-    case 0x58: /* FRINTA */
-    case 0x79: /* FRINTI */
-    case 0x59: /* FRINTX */
-    case 0x1e: /* FRINT32Z */
-    case 0x5e: /* FRINT32X */
-    case 0x1f: /* FRINT64Z */
-    case 0x5f: /* FRINT64X */
-        g_assert_not_reached();
-    }
-}
+static gen_helper_gvec_2_ptr * const f_fcvt_s_vi[] = {
+    gen_helper_gvec_vcvt_rm_sh,
+    gen_helper_gvec_vcvt_rm_ss,
+    gen_helper_gvec_vcvt_rm_sd,
+};
+
+static gen_helper_gvec_2_ptr * const f_fcvt_u_vi[] = {
+    gen_helper_gvec_vcvt_rm_uh,
+    gen_helper_gvec_vcvt_rm_us,
+    gen_helper_gvec_vcvt_rm_ud,
+};
+
+TRANS(FCVTNS_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_nearest_even, f_fcvt_s_vi)
+TRANS(FCVTNU_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_nearest_even, f_fcvt_u_vi)
+TRANS(FCVTPS_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_up, f_fcvt_s_vi)
+TRANS(FCVTPU_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_up, f_fcvt_u_vi)
+TRANS(FCVTMS_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_down, f_fcvt_s_vi)
+TRANS(FCVTMU_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_down, f_fcvt_u_vi)
+TRANS(FCVTZS_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_to_zero, f_fcvt_s_vi)
+TRANS(FCVTZU_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_to_zero, f_fcvt_u_vi)
+TRANS(FCVTAS_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_ties_away, f_fcvt_s_vi)
+TRANS(FCVTAU_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, float_round_ties_away, f_fcvt_u_vi)
 
 static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
                                    bool is_scalar, bool is_u, bool is_q,
@@ -9758,30 +9740,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             handle_2misc_fcmp_zero(s, opcode, false, u, is_q, size, rn, rd);
             return;
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-        case 0x5a: /* FCVTNU */
-        case 0x5b: /* FCVTMU */
-        case 0x7a: /* FCVTPU */
-        case 0x7b: /* FCVTZU */
-            need_fpstatus = true;
-            rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
-        case 0x5c: /* FCVTAU */
-        case 0x1c: /* FCVTAS */
-            need_fpstatus = true;
-            rmode = FPROUNDING_TIEAWAY;
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
         case 0x3c: /* URECPE */
             if (size == 3) {
                 unallocated_encoding(s);
@@ -9831,6 +9789,16 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x5f: /* FRINT64X */
         case 0x1d: /* SCVTF */
         case 0x5d: /* UCVTF */
+        case 0x1a: /* FCVTNS */
+        case 0x1b: /* FCVTMS */
+        case 0x3a: /* FCVTPS */
+        case 0x3b: /* FCVTZS */
+        case 0x5a: /* FCVTNU */
+        case 0x5b: /* FCVTMU */
+        case 0x7a: /* FCVTPU */
+        case 0x7b: /* FCVTZU */
+        case 0x5c: /* FCVTAU */
+        case 0x1c: /* FCVTAS */
             unallocated_encoding(s);
             return;
         }
@@ -9871,26 +9839,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         tcg_rmode = NULL;
     }
 
-    if (size == 3) {
-        /* All 64-bit element operations can be shared with scalar 2misc */
-        int pass;
-
-        /* Coverity claims (size == 3 && !is_q) has been eliminated
-         * from all paths leading to here.
-         */
-        tcg_debug_assert(is_q);
-        for (pass = 0; pass < 2; pass++) {
-            TCGv_i64 tcg_op = tcg_temp_new_i64();
-            TCGv_i64 tcg_res = tcg_temp_new_i64();
-
-            read_vec_element(s, tcg_op, rn, pass, MO_64);
-
-            handle_2misc_64(s, opcode, u, tcg_res, tcg_op,
-                            tcg_rmode, tcg_fpstatus);
-
-            write_vec_element(s, tcg_res, rd, pass, MO_64);
-        }
-    } else {
+    {
         int pass;
 
         assert(size == 2);
@@ -9903,22 +9852,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
-                case 0x1a: /* FCVTNS */
-                case 0x1b: /* FCVTMS */
-                case 0x1c: /* FCVTAS */
-                case 0x3a: /* FCVTPS */
-                case 0x3b: /* FCVTZS */
-                    gen_helper_vfp_tosls(tcg_res, tcg_op,
-                                         tcg_constant_i32(0), tcg_fpstatus);
-                    break;
-                case 0x5a: /* FCVTNU */
-                case 0x5b: /* FCVTMU */
-                case 0x5c: /* FCVTAU */
-                case 0x7a: /* FCVTPU */
-                case 0x7b: /* FCVTZU */
-                    gen_helper_vfp_touls(tcg_res, tcg_op,
-                                         tcg_constant_i32(0), tcg_fpstatus);
-                    break;
                 case 0x7c: /* URSQRTE */
                     gen_helper_rsqrte_u32(tcg_res, tcg_op);
                     break;
@@ -9938,6 +9871,16 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 case 0x5e: /* FRINT32X */
                 case 0x1f: /* FRINT64Z */
                 case 0x5f: /* FRINT64X */
+                case 0x1a: /* FCVTNS */
+                case 0x1b: /* FCVTMS */
+                case 0x1c: /* FCVTAS */
+                case 0x3a: /* FCVTPS */
+                case 0x3b: /* FCVTZS */
+                case 0x5a: /* FCVTNU */
+                case 0x5b: /* FCVTMU */
+                case 0x5c: /* FCVTAU */
+                case 0x7a: /* FCVTPU */
+                case 0x7b: /* FCVTZU */
                     g_assert_not_reached();
                 }
             }
@@ -10006,36 +9949,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x3d: /* FRECPE */
     case 0x3f: /* FRECPX */
         break;
-    case 0x1a: /* FCVTNS */
-        rmode = FPROUNDING_TIEEVEN;
-        break;
-    case 0x1b: /* FCVTMS */
-        rmode = FPROUNDING_NEGINF;
-        break;
-    case 0x1c: /* FCVTAS */
-        rmode = FPROUNDING_TIEAWAY;
-        break;
-    case 0x3a: /* FCVTPS */
-        rmode = FPROUNDING_POSINF;
-        break;
-    case 0x3b: /* FCVTZS */
-        rmode = FPROUNDING_ZERO;
-        break;
-    case 0x5a: /* FCVTNU */
-        rmode = FPROUNDING_TIEEVEN;
-        break;
-    case 0x5b: /* FCVTMU */
-        rmode = FPROUNDING_NEGINF;
-        break;
-    case 0x5c: /* FCVTAU */
-        rmode = FPROUNDING_TIEAWAY;
-        break;
-    case 0x7a: /* FCVTPU */
-        rmode = FPROUNDING_POSINF;
-        break;
-    case 0x7b: /* FCVTZU */
-        rmode = FPROUNDING_ZERO;
-        break;
     case 0x7d: /* FRSQRTE */
         break;
     default:
@@ -10051,6 +9964,16 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x79: /* FRINTI */
     case 0x1d: /* SCVTF */
     case 0x5d: /* UCVTF */
+    case 0x1a: /* FCVTNS */
+    case 0x1b: /* FCVTMS */
+    case 0x1c: /* FCVTAS */
+    case 0x3a: /* FCVTPS */
+    case 0x3b: /* FCVTZS */
+    case 0x5a: /* FCVTNU */
+    case 0x5b: /* FCVTMU */
+    case 0x5c: /* FCVTAU */
+    case 0x7a: /* FCVTPU */
+    case 0x7b: /* FCVTZU */
         unallocated_encoding(s);
         return;
     }
@@ -10115,23 +10038,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             read_vec_element_i32(s, tcg_op, rn, pass, MO_16);
 
             switch (fpop) {
-            case 0x1a: /* FCVTNS */
-            case 0x1b: /* FCVTMS */
-            case 0x1c: /* FCVTAS */
-            case 0x3a: /* FCVTPS */
-            case 0x3b: /* FCVTZS */
-                gen_helper_advsimd_f16tosinth(tcg_res, tcg_op, tcg_fpstatus);
-                break;
             case 0x3d: /* FRECPE */
                 gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
-            case 0x5a: /* FCVTNU */
-            case 0x5b: /* FCVTMU */
-            case 0x5c: /* FCVTAU */
-            case 0x7a: /* FCVTPU */
-            case 0x7b: /* FCVTZU */
-                gen_helper_advsimd_f16touinth(tcg_res, tcg_op, tcg_fpstatus);
-                break;
             case 0x7d: /* FRSQRTE */
                 gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
@@ -10146,6 +10055,16 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x58: /* FRINTA */
             case 0x79: /* FRINTI */
             case 0x59: /* FRINTX */
+            case 0x1a: /* FCVTNS */
+            case 0x1b: /* FCVTMS */
+            case 0x1c: /* FCVTAS */
+            case 0x3a: /* FCVTPS */
+            case 0x3b: /* FCVTZS */
+            case 0x5a: /* FCVTNU */
+            case 0x5b: /* FCVTMU */
+            case 0x5c: /* FCVTAU */
+            case 0x7a: /* FCVTPU */
+            case 0x7b: /* FCVTZU */
                 g_assert_not_reached();
             }
 
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 9b269a4f18..0aee38a3bc 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2537,6 +2537,8 @@ DO_VCVT_FIXED(gvec_vcvt_rz_hu, helper_vfp_touhh_round_to_zero, uint16_t)
         clear_tail(d, oprsz, simd_maxsz(desc));                         \
     }
 
+DO_VCVT_RMODE(gvec_vcvt_rm_sd, helper_vfp_tosqd, uint64_t)
+DO_VCVT_RMODE(gvec_vcvt_rm_ud, helper_vfp_touqd, uint64_t)
 DO_VCVT_RMODE(gvec_vcvt_rm_ss, helper_vfp_tosls, uint32_t)
 DO_VCVT_RMODE(gvec_vcvt_rm_us, helper_vfp_touls, uint32_t)
 DO_VCVT_RMODE(gvec_vcvt_rm_sh, helper_vfp_toshh, uint16_t)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 61d519b96a..05a0b84416 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1793,6 +1793,31 @@ SCVTF_vi        0.00 1110 0.1 00001 11011 0 ..... .....     @qrr_sd
 UCVTF_vi        0.10 1110 011 11001 11011 0 ..... .....     @qrr_h
 UCVTF_vi        0.10 1110 0.1 00001 11011 0 ..... .....     @qrr_sd
 
+FCVTNS_vi       0.00 1110 011 11001 10101 0 ..... .....     @qrr_h
+FCVTNS_vi       0.00 1110 0.1 00001 10101 0 ..... .....     @qrr_sd
+FCVTNU_vi       0.10 1110 011 11001 10101 0 ..... .....     @qrr_h
+FCVTNU_vi       0.10 1110 0.1 00001 10101 0 ..... .....     @qrr_sd
+
+FCVTPS_vi       0.00 1110 111 11001 10101 0 ..... .....     @qrr_h
+FCVTPS_vi       0.00 1110 1.1 00001 10101 0 ..... .....     @qrr_sd
+FCVTPU_vi       0.10 1110 111 11001 10101 0 ..... .....     @qrr_h
+FCVTPU_vi       0.10 1110 1.1 00001 10101 0 ..... .....     @qrr_sd
+
+FCVTMS_vi       0.00 1110 011 11001 10111 0 ..... .....     @qrr_h
+FCVTMS_vi       0.00 1110 0.1 00001 10111 0 ..... .....     @qrr_sd
+FCVTMU_vi       0.10 1110 011 11001 10111 0 ..... .....     @qrr_h
+FCVTMU_vi       0.10 1110 0.1 00001 10111 0 ..... .....     @qrr_sd
+
+FCVTZS_vi       0.00 1110 111 11001 10111 0 ..... .....     @qrr_h
+FCVTZS_vi       0.00 1110 1.1 00001 10111 0 ..... .....     @qrr_sd
+FCVTZU_vi       0.10 1110 111 11001 10111 0 ..... .....     @qrr_h
+FCVTZU_vi       0.10 1110 1.1 00001 10111 0 ..... .....     @qrr_sd
+
+FCVTAS_vi       0.00 1110 011 11001 11001 0 ..... .....     @qrr_h
+FCVTAS_vi       0.00 1110 0.1 00001 11001 0 ..... .....     @qrr_sd
+FCVTAU_vi       0.10 1110 011 11001 11001 0 ..... .....     @qrr_h
+FCVTAU_vi       0.10 1110 0.1 00001 11001 0 ..... .....     @qrr_sd
+
 &fcvt_q         rd rn esz q shift
 @fcvtq_h        . q:1 . ...... 001 .... ...... rn:5 rd:5    \
                 &fcvt_q esz=1 shift=%fcvt_f_sh_h
-- 
2.43.0

