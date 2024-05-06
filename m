Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1270116ejc;
        Sun, 5 May 2024 18:06:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5dO1BDZ1Wq2XJLTei8rpXQPPbKt1MotdYjLf4cGP/TRGPhlzEYD2sQvyR7O/2sTYCXCeit529iPZQIy5pAktfNy63AW8U
X-Google-Smtp-Source: AGHT+IG8UGzAJ+zSOoKE8pMbkjM30I3tYwO0kknob5cNayNQq9dWgUVOTzuLPv+9EkuOEoBjFsbo
X-Received: by 2002:ac8:5886:0:b0:435:7a:6037 with SMTP id t6-20020ac85886000000b00435007a6037mr9563986qta.45.1714957591723;
        Sun, 05 May 2024 18:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957591; cv=none;
        d=google.com; s=arc-20160816;
        b=TJIkQ2nZ85oO8papLEf4mAx/cujWfOaN7+/jSvxgwOmgTZN4aJ8ogtS/ivjYc2l1q7
         on3wvNLOoNovMoZSSwjKkXqvtX8aDqBHZRppKXDYL+T8d0ag5OhHi6V9IPKhRzX0zzMI
         7LjrmCxRCdVVZrpX37F2iOodFcDb4CgHLRrQ4gUszh65Lzzx19yLij0NMh5i2+kgpBg3
         DcRHPdS4KhmoRAFwYg8a/fZ/32+orzVp0Sa1odB0OBkMvV6NJOLzJ+9uJp93jL+4vh/6
         /jlRmblGb6NYX5o+g9RiVqCwK92Ge7/W4Ob87iINnWmRftxUXRimqEhwfbia/944sqOW
         gLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MHhqJ/tFplaHJ98CV/yvWRHdYL4N+4lnWkqfwMYIGxo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=a/IBZ7y+jSMkK01UvoMSRKRG2JpvvAv3EcVoiogfiKt2Nn4PXRj2pTp5Si0BgcGen/
         r7jFxno8eEUHqvD9ig4vhGXYcbAbP6xqvPheQvfFnbQxVeLNSYFftwRTVz+KqNuTwOB4
         RWSMMTgnN4XjiOiDDewXilRaokx1fREVXGeYzsCG5FaZ7imhR+tmMqCBwJNi7B3xFF/o
         t15H20w1i9fKJa8kDcwfCUw6YTo1Kb89OMI9mhN4V6B0v+8he6cQB+PGDNnx3dt45Faj
         NPKG/HAuAPa1CrhoKIVFfpjVzopUeDMl2xrQOM5Z1HnmYsJzec1ePGES4osFX9aceV4/
         LMdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zm4ZeZju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020ac857cb000000b004347788820fsi8276767qta.533.2024.05.05.18.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zm4ZeZju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mmd-0007tL-J8; Sun, 05 May 2024 21:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmV-0007nJ-2l
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:39 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmD-0002Sz-VP
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2b273cbbdfdso984103a91.1
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957458; x=1715562258; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHhqJ/tFplaHJ98CV/yvWRHdYL4N+4lnWkqfwMYIGxo=;
 b=Zm4ZeZjurajNNZw+Ge0Yqy0DJlRtHAeN94UF/tQH918iAWt1uI3W10L+kjboP2aaBk
 9ObcbaED+7BSoIrJefjhW/OVqDYDXoaZRsToj3XhUAsnAo3kPAGDyJBfgK1DyG+uKs4j
 LGGsZxBYZSjZQBo4Ge0hXdsljYTVJFsmVbl+UwsLXXQufJELS2gCyc7IYYag1rp/ZuVo
 VRgYCbe/sN+jb0S2I1BRvRyHJdVYYKLMVLnFLzg4IskheHKa2neoqxxawQLnbc/BpQB8
 7UPeG5xkIP1v9Ut9OlQHuG7I/BDHNy3BF49fDn0OGbU6NK158vEyxBkSNA8cbHOu9XY2
 mC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957458; x=1715562258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHhqJ/tFplaHJ98CV/yvWRHdYL4N+4lnWkqfwMYIGxo=;
 b=cKL/dO8eAeLysB/33jPbO96mwqNnJy3rWCFlWOt/zyyKHOd4ePaR8eIRMbjeGm2N1Z
 tDAdRMFNR4nVLw4buIG158XoFeH7KucJ80v6/VlqbDqwM7iFW8AD9kyp41pWVuEqCxYm
 XwJptVAnSwh2DIGC4OOyy4IrdLaQJd16B3fyLI1RBHGbQs6tIX8SJktHmeHQIbBSxrTV
 pBp9rlas4rY9041lWSwuupUg+a2iadWlrJCgBrhgfJ7DNwCkbNp1n6/u77wCXXSeznTA
 fbzB07wSCAsmB8oxcIkQULuAu60Jx8+EipE03paKrM8tZFhNog6AEGWyNjdiQGbx5bxy
 o8rg==
X-Gm-Message-State: AOJu0YzquokOTfwNHFHHwUuu7B7F+RdplZSrbOwifK6kZDb1wED3IYj1
 q8CdUqR3vd/fdr664k0ko0Wn9lwh6aq75CjZPCUMrRS+HCC+oiVkY2dgaPa2k5c=
X-Received: by 2002:a17:90a:fa01:b0:2b2:c9d0:378f with SMTP id
 cm1-20020a17090afa0100b002b2c9d0378fmr6921796pjb.13.1714957457685; 
 Sun, 05 May 2024 18:04:17 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/57] target/arm: Convert FMAX, FMIN, FMAXNM,
 FMINNM to decodetree
Date: Sun,  5 May 2024 18:03:20 -0700
Message-Id: <20240506010403.6204-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: p/p3iZZyhdHU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |   4 +
 target/arm/tcg/a64.decode      |  17 ++++
 target/arm/tcg/translate-a64.c | 168 +++++++++++++++++----------------
 target/arm/tcg/vec_helper.c    |   4 +
 4 files changed, 113 insertions(+), 80 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2b02733305..7ee15b9651 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -748,15 +748,19 @@ DEF_HELPER_FLAGS_5(gvec_facgt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmax_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmax_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmax_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmin_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmin_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmin_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmaxnum_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmaxnum_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxnum_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fminnum_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fminnum_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fminnum_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_recps_nf_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_recps_nf_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 828ea2d62a..4d72fafae7 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -704,6 +704,11 @@ FSUB_s          0001 1110 ..1 ..... 0011 10 ..... ..... @rrr_hsd
 FDIV_s          0001 1110 ..1 ..... 0001 10 ..... ..... @rrr_hsd
 FMUL_s          0001 1110 ..1 ..... 0000 10 ..... ..... @rrr_hsd
 
+FMAX_s          0001 1110 ..1 ..... 0100 10 ..... ..... @rrr_hsd
+FMIN_s          0001 1110 ..1 ..... 0101 10 ..... ..... @rrr_hsd
+FMAXNM_s        0001 1110 ..1 ..... 0110 10 ..... ..... @rrr_hsd
+FMINNM_s        0001 1110 ..1 ..... 0111 10 ..... ..... @rrr_hsd
+
 FMULX_s         0101 1110 010 ..... 00011 1 ..... ..... @rrr_h
 FMULX_s         0101 1110 0.1 ..... 11011 1 ..... ..... @rrr_sd
 
@@ -721,6 +726,18 @@ FDIV_v          0.10 1110 0.1 ..... 11111 1 ..... ..... @qrrr_sd
 FMUL_v          0.10 1110 010 ..... 00011 1 ..... ..... @qrrr_h
 FMUL_v          0.10 1110 0.1 ..... 11011 1 ..... ..... @qrrr_sd
 
+FMAX_v          0.00 1110 010 ..... 00110 1 ..... ..... @qrrr_h
+FMAX_v          0.00 1110 0.1 ..... 11110 1 ..... ..... @qrrr_sd
+
+FMIN_v          0.00 1110 110 ..... 00110 1 ..... ..... @qrrr_h
+FMIN_v          0.00 1110 1.1 ..... 11110 1 ..... ..... @qrrr_sd
+
+FMAXNM_v        0.00 1110 010 ..... 00000 1 ..... ..... @qrrr_h
+FMAXNM_v        0.00 1110 0.1 ..... 11000 1 ..... ..... @qrrr_sd
+
+FMINNM_v        0.00 1110 110 ..... 00000 1 ..... ..... @qrrr_h
+FMINNM_v        0.00 1110 1.1 ..... 11000 1 ..... ..... @qrrr_sd
+
 FMULX_v         0.00 0111 010 ..... 00011 1 ..... ..... @qrrr_h
 FMULX_v         0.00 1110 0.1 ..... 11011 1 ..... ..... @qrrr_sd
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f3b037a7c6..c7b379385f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4916,6 +4916,34 @@ static const FPScalar f_scalar_fmul = {
 };
 TRANS(FMUL_s, do_fp3_scalar, a, &f_scalar_fmul)
 
+static const FPScalar f_scalar_fmax = {
+    gen_helper_advsimd_maxh,
+    gen_helper_vfp_maxs,
+    gen_helper_vfp_maxd,
+};
+TRANS(FMAX_s, do_fp3_scalar, a, &f_scalar_fmax)
+
+static const FPScalar f_scalar_fmin = {
+    gen_helper_advsimd_minh,
+    gen_helper_vfp_mins,
+    gen_helper_vfp_mind,
+};
+TRANS(FMIN_s, do_fp3_scalar, a, &f_scalar_fmin)
+
+static const FPScalar f_scalar_fmaxnm = {
+    gen_helper_advsimd_maxnumh,
+    gen_helper_vfp_maxnums,
+    gen_helper_vfp_maxnumd,
+};
+TRANS(FMAXNM_s, do_fp3_scalar, a, &f_scalar_fmaxnm)
+
+static const FPScalar f_scalar_fminnm = {
+    gen_helper_advsimd_minnumh,
+    gen_helper_vfp_minnums,
+    gen_helper_vfp_minnumd,
+};
+TRANS(FMINNM_s, do_fp3_scalar, a, &f_scalar_fminnm)
+
 static const FPScalar f_scalar_fmulx = {
     gen_helper_advsimd_mulxh,
     gen_helper_vfp_mulxs,
@@ -4979,6 +5007,34 @@ static gen_helper_gvec_3_ptr * const f_vector_fmul[3] = {
 };
 TRANS(FMUL_v, do_fp3_vector, a, f_vector_fmul)
 
+static gen_helper_gvec_3_ptr * const f_vector_fmax[3] = {
+    gen_helper_gvec_fmax_h,
+    gen_helper_gvec_fmax_s,
+    gen_helper_gvec_fmax_d,
+};
+TRANS(FMAX_v, do_fp3_vector, a, f_vector_fmax)
+
+static gen_helper_gvec_3_ptr * const f_vector_fmin[3] = {
+    gen_helper_gvec_fmin_h,
+    gen_helper_gvec_fmin_s,
+    gen_helper_gvec_fmin_d,
+};
+TRANS(FMIN_v, do_fp3_vector, a, f_vector_fmin)
+
+static gen_helper_gvec_3_ptr * const f_vector_fmaxnm[3] = {
+    gen_helper_gvec_fmaxnum_h,
+    gen_helper_gvec_fmaxnum_s,
+    gen_helper_gvec_fmaxnum_d,
+};
+TRANS(FMAXNM_v, do_fp3_vector, a, f_vector_fmaxnm)
+
+static gen_helper_gvec_3_ptr * const f_vector_fminnm[3] = {
+    gen_helper_gvec_fminnum_h,
+    gen_helper_gvec_fminnum_s,
+    gen_helper_gvec_fminnum_d,
+};
+TRANS(FMINNM_v, do_fp3_vector, a, f_vector_fminnm)
+
 static gen_helper_gvec_3_ptr * const f_vector_fmulx[3] = {
     gen_helper_gvec_fmulx_h,
     gen_helper_gvec_fmulx_s,
@@ -6892,18 +6948,6 @@ static void handle_fp_2src_single(DisasContext *s, int opcode,
     tcg_op2 = read_fp_sreg(s, rm);
 
     switch (opcode) {
-    case 0x4: /* FMAX */
-        gen_helper_vfp_maxs(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x5: /* FMIN */
-        gen_helper_vfp_mins(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x6: /* FMAXNM */
-        gen_helper_vfp_maxnums(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x7: /* FMINNM */
-        gen_helper_vfp_minnums(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
     case 0x8: /* FNMUL */
         gen_helper_vfp_muls(tcg_res, tcg_op1, tcg_op2, fpst);
         gen_helper_vfp_negs(tcg_res, tcg_res);
@@ -6913,6 +6957,10 @@ static void handle_fp_2src_single(DisasContext *s, int opcode,
     case 0x1: /* FDIV */
     case 0x2: /* FADD */
     case 0x3: /* FSUB */
+    case 0x4: /* FMAX */
+    case 0x5: /* FMIN */
+    case 0x6: /* FMAXNM */
+    case 0x7: /* FMINNM */
         g_assert_not_reached();
     }
 
@@ -6934,18 +6982,6 @@ static void handle_fp_2src_double(DisasContext *s, int opcode,
     tcg_op2 = read_fp_dreg(s, rm);
 
     switch (opcode) {
-    case 0x4: /* FMAX */
-        gen_helper_vfp_maxd(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x5: /* FMIN */
-        gen_helper_vfp_mind(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x6: /* FMAXNM */
-        gen_helper_vfp_maxnumd(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x7: /* FMINNM */
-        gen_helper_vfp_minnumd(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
     case 0x8: /* FNMUL */
         gen_helper_vfp_muld(tcg_res, tcg_op1, tcg_op2, fpst);
         gen_helper_vfp_negd(tcg_res, tcg_res);
@@ -6955,6 +6991,10 @@ static void handle_fp_2src_double(DisasContext *s, int opcode,
     case 0x1: /* FDIV */
     case 0x2: /* FADD */
     case 0x3: /* FSUB */
+    case 0x4: /* FMAX */
+    case 0x5: /* FMIN */
+    case 0x6: /* FMAXNM */
+    case 0x7: /* FMINNM */
         g_assert_not_reached();
     }
 
@@ -6976,18 +7016,6 @@ static void handle_fp_2src_half(DisasContext *s, int opcode,
     tcg_op2 = read_fp_hreg(s, rm);
 
     switch (opcode) {
-    case 0x4: /* FMAX */
-        gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x5: /* FMIN */
-        gen_helper_advsimd_minh(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x6: /* FMAXNM */
-        gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x7: /* FMINNM */
-        gen_helper_advsimd_minnumh(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
     case 0x8: /* FNMUL */
         gen_helper_advsimd_mulh(tcg_res, tcg_op1, tcg_op2, fpst);
         tcg_gen_xori_i32(tcg_res, tcg_res, 0x8000);
@@ -6997,6 +7025,10 @@ static void handle_fp_2src_half(DisasContext *s, int opcode,
     case 0x1: /* FDIV */
     case 0x2: /* FADD */
     case 0x3: /* FSUB */
+    case 0x4: /* FMAX */
+    case 0x5: /* FMIN */
+    case 0x6: /* FMAXNM */
+    case 0x7: /* FMINNM */
         g_assert_not_reached();
     }
 
@@ -9215,24 +9247,12 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
                 gen_helper_vfp_muladdd(tcg_res, tcg_op1, tcg_op2,
                                        tcg_res, fpst);
                 break;
-            case 0x18: /* FMAXNM */
-                gen_helper_vfp_maxnumd(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x1c: /* FCMEQ */
                 gen_helper_neon_ceq_f64(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x1e: /* FMAX */
-                gen_helper_vfp_maxd(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x1f: /* FRECPS */
                 gen_helper_recpsf_f64(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x38: /* FMINNM */
-                gen_helper_vfp_minnumd(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x3e: /* FMIN */
-                gen_helper_vfp_mind(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x3f: /* FRSQRTS */
                 gen_helper_rsqrtsf_f64(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
@@ -9253,9 +9273,13 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
                 gen_helper_neon_acgt_f64(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
+            case 0x18: /* FMAXNM */
             case 0x1a: /* FADD */
             case 0x1b: /* FMULX */
+            case 0x1e: /* FMAX */
+            case 0x38: /* FMINNM */
             case 0x3a: /* FSUB */
+            case 0x3e: /* FMIN */
             case 0x5b: /* FMUL */
             case 0x5f: /* FDIV */
                 g_assert_not_reached();
@@ -9284,21 +9308,9 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
             case 0x1c: /* FCMEQ */
                 gen_helper_neon_ceq_f32(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x1e: /* FMAX */
-                gen_helper_vfp_maxs(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x1f: /* FRECPS */
                 gen_helper_recpsf_f32(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x18: /* FMAXNM */
-                gen_helper_vfp_maxnums(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x38: /* FMINNM */
-                gen_helper_vfp_minnums(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x3e: /* FMIN */
-                gen_helper_vfp_mins(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x3f: /* FRSQRTS */
                 gen_helper_rsqrtsf_f32(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
@@ -9319,9 +9331,13 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
                 gen_helper_neon_acgt_f32(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
+            case 0x18: /* FMAXNM */
             case 0x1a: /* FADD */
             case 0x1b: /* FMULX */
+            case 0x1e: /* FMAX */
+            case 0x38: /* FMINNM */
             case 0x3a: /* FSUB */
+            case 0x3e: /* FMIN */
             case 0x5b: /* FMUL */
             case 0x5f: /* FDIV */
                 g_assert_not_reached();
@@ -11245,11 +11261,7 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
     case 0x7d: /* FACGT */
     case 0x19: /* FMLA */
     case 0x39: /* FMLS */
-    case 0x18: /* FMAXNM */
     case 0x1c: /* FCMEQ */
-    case 0x1e: /* FMAX */
-    case 0x38: /* FMINNM */
-    case 0x3e: /* FMIN */
     case 0x5c: /* FCMGE */
     case 0x7a: /* FABD */
     case 0x7c: /* FCMGT */
@@ -11280,9 +11292,13 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
         return;
 
     default:
+    case 0x18: /* FMAXNM */
     case 0x1a: /* FADD */
     case 0x1b: /* FMULX */
+    case 0x1e: /* FMAX */
+    case 0x38: /* FMINNM */
     case 0x3a: /* FSUB */
+    case 0x3e: /* FMIN */
     case 0x5b: /* FMUL */
     case 0x5f: /* FDIV */
         unallocated_encoding(s);
@@ -11626,14 +11642,10 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
     int pass;
 
     switch (fpopcode) {
-    case 0x0: /* FMAXNM */
     case 0x1: /* FMLA */
     case 0x4: /* FCMEQ */
-    case 0x6: /* FMAX */
     case 0x7: /* FRECPS */
-    case 0x8: /* FMINNM */
     case 0x9: /* FMLS */
-    case 0xe: /* FMIN */
     case 0xf: /* FRSQRTS */
     case 0x14: /* FCMGE */
     case 0x15: /* FACGE */
@@ -11650,9 +11662,13 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         pairwise = true;
         break;
     default:
+    case 0x0: /* FMAXNM */
     case 0x2: /* FADD */
     case 0x3: /* FMULX */
+    case 0x6: /* FMAX */
+    case 0x8: /* FMINNM */
     case 0xa: /* FSUB */
+    case 0xe: /* FMIN */
     case 0x13: /* FMUL */
     case 0x17: /* FDIV */
         unallocated_encoding(s);
@@ -11720,9 +11736,6 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
             read_vec_element_i32(s, tcg_op2, rm, pass, MO_16);
 
             switch (fpopcode) {
-            case 0x0: /* FMAXNM */
-                gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x1: /* FMLA */
                 read_vec_element_i32(s, tcg_res, rd, pass, MO_16);
                 gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_res,
@@ -11731,15 +11744,9 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
             case 0x4: /* FCMEQ */
                 gen_helper_advsimd_ceq_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x6: /* FMAX */
-                gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x7: /* FRECPS */
                 gen_helper_recpsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
-            case 0x8: /* FMINNM */
-                gen_helper_advsimd_minnumh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0x9: /* FMLS */
                 /* As usual for ARM, separate negation for fused multiply-add */
                 tcg_gen_xori_i32(tcg_op1, tcg_op1, 0x8000);
@@ -11747,9 +11754,6 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_res,
                                            fpst);
                 break;
-            case 0xe: /* FMIN */
-                gen_helper_advsimd_minh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
             case 0xf: /* FRSQRTS */
                 gen_helper_rsqrtsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
@@ -11770,9 +11774,13 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
+            case 0x0: /* FMAXNM */
             case 0x2: /* FADD */
             case 0x3: /* FMULX */
+            case 0x6: /* FMAX */
+            case 0x8: /* FMINNM */
             case 0xa: /* FSUB */
+            case 0xe: /* FMIN */
             case 0x13: /* FMUL */
             case 0x17: /* FDIV */
                 g_assert_not_reached();
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 4106536371..99ef676071 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1231,15 +1231,19 @@ DO_3OP(gvec_facgt_s, float32_acgt, float32)
 
 DO_3OP(gvec_fmax_h, float16_max, float16)
 DO_3OP(gvec_fmax_s, float32_max, float32)
+DO_3OP(gvec_fmax_d, float64_max, float64)
 
 DO_3OP(gvec_fmin_h, float16_min, float16)
 DO_3OP(gvec_fmin_s, float32_min, float32)
+DO_3OP(gvec_fmin_d, float64_min, float64)
 
 DO_3OP(gvec_fmaxnum_h, float16_maxnum, float16)
 DO_3OP(gvec_fmaxnum_s, float32_maxnum, float32)
+DO_3OP(gvec_fmaxnum_d, float64_maxnum, float64)
 
 DO_3OP(gvec_fminnum_h, float16_minnum, float16)
 DO_3OP(gvec_fminnum_s, float32_minnum, float32)
+DO_3OP(gvec_fminnum_d, float64_minnum, float64)
 
 DO_3OP(gvec_recps_nf_h, float16_recps_nf, float16)
 DO_3OP(gvec_recps_nf_s, float32_recps_nf, float32)
-- 
2.34.1

