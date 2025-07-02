Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3707865qtb;
        Wed, 2 Jul 2025 05:41:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHCAKRvzx64pJJZhsbUWYOWrAigkbGyi28Wck4pPqkAjPFY2aOOWGH34eBcUX3r0NR5pjVaYgoz5pD5g==@linaro.org
X-Google-Smtp-Source: AGHT+IH/DIgvGBuyUKSUksdP2P9IYg6EjniRw/TzAESEpMv9f0PHz5nLEyzwCi7uqElm/rxsDxST
X-Received: by 2002:ac8:59c3:0:b0:4a6:f774:dec0 with SMTP id d75a77b69052e-4a976960c53mr44907281cf.20.1751460074787;
        Wed, 02 Jul 2025 05:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460074; cv=none;
        d=google.com; s=arc-20240605;
        b=RRd51zcevbHdbu9o4mbztLHtJv2MMm5fFAmP8wBenjhaZdi5Hw+eIRTCiIFrLtRQ7X
         Yoq95tavCCA1GPqNDpelYtnfUuJLF+sNaj6S6nfiVoXJ4ojkid/DzxPlxXC8DcgCaAW2
         4pavqTKjwUE3zMfBobv1T72BuJQ2pQu6/Q8VI1tHPmtWan4FL0ZPupB/bpz3R/DWn8gh
         QiWTiPiF9Ks9mda3HcDa8fsGPU9Lukkd48RoxuaS/0RbJb/7NPxiLB105hWfl+k444Di
         FGySYr6JMMGopaBxNkO9ESAv03dTLHMxY30jvmNyUGVHlS0LExw0kwDT831U+IfsUBzd
         C2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+6/XKkly86pfJIi7WG6IB145/8kk5JqWQO5Z6Z5XVuE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=UIDYVsa/IOfRM6rvaIRB1EyPcP4YdXmF6cyLrpME6mI1mjbYNhKLXBcghELsw5qXyV
         M98UD1Kxm8rJU674VNPK74boyY1puNfM6FhR5//Ts9m2fx/hkb8yJlSbI4xsNUfm9I0H
         K1rh29Edh1nibWUFicrfAzCQ96fMowVBDsT4PMQBgiYSz4ZsagCJ8WvRxzLtEs9a/tfV
         WezvQSFiIPqCtVHrWLn15Mh3bA10nFFJhp+qB4jW6LeRiRwcEzeDz06agmInPJmLstKl
         lpaDDs/FxCJjkjhnzM1JxjPj2Q2PeJcGYcPaSKzspLjkFZCKDWwk54GMxzpiYQGj3z1Y
         Ggyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d3bg/9H7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e88ccsi131259511cf.231.2025.07.02.05.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d3bg/9H7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwkQ-0004wF-EW; Wed, 02 Jul 2025 08:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwj9-00049X-UU
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:16 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwj4-00021x-WB
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:15 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2edec6c5511so1865385fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459886; x=1752064686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6/XKkly86pfJIi7WG6IB145/8kk5JqWQO5Z6Z5XVuE=;
 b=d3bg/9H7U02E49kxmotdciKdbhapjvBn5azk/2xSVUeOv5tXdnwaLtGfBlDhJ3mPeu
 VLk/ml5uNKGuy3M71LTM/RXwQDQxUESYWs8Gi8/lsLMck9P5HWBtKFFy3gUTaA+8jRqa
 sOI2cZkdSdqZCq99C9W/dLv73J3TvuQB7li1vctZ+agCW8rDpZ23HQNMkOf//NiU8UkW
 Kfc8+Ie1PbmaI/2zyYQE1VrtvNXm6fovNGAkWQtaoAb5axyfDNwV7y/J5c8KenRq2dZZ
 US3Tf5u/RjMIlqhkJM4OSDzOCAz1HTUWcsPH97W4+F/PEdqpHhgrYI38J3DClrW6UPp5
 f04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459886; x=1752064686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6/XKkly86pfJIi7WG6IB145/8kk5JqWQO5Z6Z5XVuE=;
 b=MXWf2KbObXgC4ZYqxn3Dnkjlqu7ssY2U1E9ISZRrjEC/QxzD8Z0Z60Rlvw+kTta2/5
 cl8vzMxJUr1RA+uGuMOrVMasSjO8Z9Gj5iBOlYJ3NXB74o6vqMwqNdOPEbEN4CJ/2t6m
 GqBK9iBKOxLBzSh0syYGVroeeR74pegKtBdRXAaqNAYNuLd9QUBRcWK1Y6yMmpTa/0ha
 BSJ9hMSUyPiKObKXZGK0lTyJYoDlF4810BPpb6W+RfkhTHL2e9PwYyTO4OJU0O8H4UOw
 l5gGa1kKGg4Qsuci+cxuENlMgP+RpydZsxDRuK1TiEmSbpg8IeNWQwYPvE+Bg2jOQSoy
 kMdg==
X-Gm-Message-State: AOJu0YzyzvsxurjSOGu69d5CPKjRWWqTh1B3AASa7MVWV1sAQJONxzOB
 AGGzJmW7Z9qQ2BOfP37Dywp7c8jnzLem8LWDmsBPfuJ88fXOZIu2UY81fnf/o7zMOrLq5TwC3qy
 MGq46S8o=
X-Gm-Gg: ASbGncsNViZS3IU5KwVAif8WdcO96Mri3c/gowJ8fLMcMlhxHZeuQDu8+8ebLVItZF4
 exvnBHrSV2+O365/dg3G4WvVU7AUBjIGe50TdCsRRvUOz2VNZ5XFTDcXJlcr3RGpXw19W1lpZhA
 PAzhD9SmJfTAZ3VYAW5zahkhEiM0NrPkrNEZSaQ5gN3+UKQVerGZCU239qbUqI46es7VaLqo4lI
 00gdb42GFMr0thBQETD2inGd4M3qzkUQyokenr6tkEcCzKhB1PYAeF8gC+g7dIEq6DebESqiYIw
 FNQFcCBZfEUFoFCn9MRwigvdZfqdbIz/qn/Bc47/mq+HprtWDhC+kkMRAXew84aUx6SksA==
X-Received: by 2002:a05:6870:418c:b0:2f5:2b87:416a with SMTP id
 586e51a60fabf-2f5aed18a8dmr1904473fac.37.1751459886486; 
 Wed, 02 Jul 2025 05:38:06 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 43/97] target/arm: Implement SME2 FCVT (widening), FCVTL
Date: Wed,  2 Jul 2025 06:33:16 -0600
Message-ID: <20250702123410.761208-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-TUID: oy+k5UzVjI5M

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  2 ++
 target/arm/tcg/vec_internal.h  |  1 +
 target/arm/tcg/sme_helper.c    | 38 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve_helper.c    |  2 +-
 target/arm/tcg/translate-sme.c |  5 +++++
 target/arm/tcg/sme.decode      |  5 +++++
 6 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 97e70959e8..be4621f2d9 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -217,3 +217,5 @@ DEF_HELPER_FLAGS_4(sme2_bfcvt, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_bfcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvt_n, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtn, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_w, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtl, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index c8199a3ef8..bbf76f63b1 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -306,6 +306,7 @@ static inline float64 float64_maybe_ah_chs(float64 a, bool fpcr_ah)
 bfloat16 helper_sme2_ah_fmax_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 
+float32 sve_f16_to_f32(float16 f, float_status *fpst);
 float16 sve_f32_to_f16(float32 f, float_status *fpst);
 
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index d97afdb69c..b0e1fe845b 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1591,3 +1591,41 @@ void HELPER(sme2_fcvtn)(void *vd, void *vs, float_status *fpst, uint32_t desc)
         d[H2(i * 2 + 1)] = d1;
     }
 }
+
+/* Expand and convert */
+void HELPER(sme2_fcvt_w)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    ARMVectorReg scratch;
+    size_t oprsz = simd_oprsz(desc);
+    size_t i, n = oprsz / 4;
+    float16 *s = vs;
+    float32 *d0 = vd;
+    float32 *d1 = vd + sizeof(ARMVectorReg);
+
+    if (vd == vs) {
+        s = memcpy(&scratch, s, oprsz);
+    }
+
+    for (i = 0; i < n; ++i) {
+        d0[H4(i)] = sve_f16_to_f32(s[H2(i)], fpst);
+    }
+    for (i = 0; i < n; ++i) {
+        d1[H4(i)] = sve_f16_to_f32(s[H2(n + i)], fpst);
+    }
+}
+
+/* Deinterleave and convert. */
+void HELPER(sme2_fcvtl)(void *vd, void *vs, float_status *fpst, uint32_t desc)
+{
+    size_t i, n = simd_oprsz(desc) / 4;
+    float16 *s = vs;
+    float32 *d0 = vd;
+    float32 *d1 = vd + sizeof(ARMVectorReg);
+
+    for (i = 0; i < n; ++i) {
+        float32 v0 = sve_f16_to_f32(s[H2(i * 2 + 0)], fpst);
+        float32 v1 = sve_f16_to_f32(s[H2(i * 2 + 1)], fpst);
+        d0[H4(i)] = v0;
+        d1[H4(i)] = v1;
+    }
+}
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index b522ddaf7c..4f12723afe 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4554,7 +4554,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                       \
  * FZ16.  When converting from fp16, this affects flushing input denormals;
  * when converting to fp16, this affects flushing output denormals.
  */
-static inline float32 sve_f16_to_f32(float16 f, float_status *fpst)
+float32 sve_f16_to_f32(float16 f, float_status *fpst)
 {
     bool save = get_flush_inputs_to_zero(fpst);
     float32 ret;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 10e5b77040..d6167eafe1 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1360,3 +1360,8 @@ TRANS_FEAT(FCVT_n, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_fcvt_n)
 TRANS_FEAT(FCVTN, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_fcvtn)
+
+TRANS_FEAT(FCVT_w, aa64_sme_f16f16, do_zz_fpst, a, 0,
+           FPST_A64_F16, gen_helper_sme2_fcvt_w)
+TRANS_FEAT(FCVTL, aa64_sme_f16f16, do_zz_fpst, a, 0,
+           FPST_A64_F16, gen_helper_sme2_fcvtl)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 831179c0ee..5100ebaeba 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -726,9 +726,14 @@ SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
 &zz_n           zd zn n
 @zz_1x2         ........ ... ..... ...... ..... zd:5        \
                 &zz_n n=1 zn=%zn_ax2
+@zz_2x1         ........ ... ..... ...... zn:5  .....       \
+                &zz_n n=1 zd=%zd_ax2
 
 BFCVT           11000001 011 00000 111000 ....0 .....       @zz_1x2
 BFCVTN          11000001 011 00000 111000 ....1 .....       @zz_1x2
 
 FCVT_n          11000001 001 00000 111000 ....0 .....       @zz_1x2
 FCVTN           11000001 001 00000 111000 ....1 .....       @zz_1x2
+
+FCVT_w          11000001 101 00000 111000 ..... ....0       @zz_2x1
+FCVTL           11000001 101 00000 111000 ..... ....1       @zz_2x1
-- 
2.43.0

