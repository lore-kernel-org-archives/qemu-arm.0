Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1271096ejc;
        Sun, 5 May 2024 18:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPRE7NuhYbzvmJJdFyscsFx51mW1flfuO1dFp9/LG/qM6rfykjthQqj15rPLcFxjItGXUVC4MFyHNiAUE8IvcD+2UpLN0p
X-Google-Smtp-Source: AGHT+IHugeugLDJEtFTEfMOudId8OHj2bi44StWgbYw5ebuZmFmGKkYtY1IEZe+pbqPoXjnwhN1N
X-Received: by 2002:a05:6808:b21:b0:3c9:709c:9e88 with SMTP id t1-20020a0568080b2100b003c9709c9e88mr480022oij.9.1714957755084;
        Sun, 05 May 2024 18:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957755; cv=none;
        d=google.com; s=arc-20160816;
        b=fKEkPmkCoUNs0wInuQ0HXtlEeQmJFy2+1uxVBblSVPKxObWZOVWbuDoBHbfd6mj7z1
         CCUlehRqs+OnxRA9F6hZ7+nmWIx6lf3Us4IrlGV1GWlbBoUnZIXB3Du+97XuyoeYZrA4
         FvDObJm++YBIXt6rEYF73JWVzTAFQz4K+ZU0mfKZ8iq+5S8xf7D9Gd9ITehu9wNJtsSU
         gswGAYFKKhv7hCkU/OGl1efFrUJhY1yb+wzW9TrSAjam0fXl2Dx6tCDyYtlG0dU3S93k
         JHyJq9RGBT/ijzFewWwg2Il+tGxcYWpoqm3AUInik5Yxr7AA0P1xQWcFoiB2Oe6x12zt
         fmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GmyhiCSGn2Ic7wgXG37YUf46S2tWcfjFr+lbpJG1zV8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=HjpsNmsWukG0lWJ4WGngiKt+OMJeEt9zaxA0V6SB8c5CCvXNkwdicStJx10RtRz9Y6
         2fc7j65DUZn0asSNBPYN0+YOaBlZ8vmkGfOt8bUkn/P8jQxz5plHoOZK014On8Sa1JUe
         oryQd6/WR6gmIAq5A57UuzF4bhpqDt1eCQBRJhPShigCuDzKE0xABeyjg2Rv0FZcL+if
         y7Ns8HHqPPA4RhjOVsqLBhHf/HJKt5vL21IVyjITTAC8xIQ81yfvLmKaLqHMIHi5y2RN
         9HEbAV1WV/stRSlUbmh+lEs7pVV7A2+Sip8KTIkpD1FulBpHVVXxzlFFqYO89FvhBUMR
         BwHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mg0HV9Bh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05620a057500b007929e765d37si149401qkp.603.2024.05.05.18.09.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mg0HV9Bh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mqB-0000Ra-OL; Sun, 05 May 2024 21:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpZ-0007b2-Bm
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:07:50 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpS-0003Kz-AM
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:07:49 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c9691460b9so421677b6e.2
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957660; x=1715562460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmyhiCSGn2Ic7wgXG37YUf46S2tWcfjFr+lbpJG1zV8=;
 b=Mg0HV9BhsdcZRke6MS7BSMBuax3kU19pkhKwNmqqfq3sv5bqya16jE2XGUwwdwfNyt
 8A3DK6ZGTpyjH7BmZUysR0ZMc4raXtW8+dhKvhXij9sSwOrUr88O3fcieyKxzDTHj05E
 TCFn+L7Ye5jX5wVX4HBIEYhx59JZSR8O3y8KgXp1IwtbaiSjpNhxxdo811GhMuSqh2OP
 PPS0tU/PYtpo0nhOYTyraFpMV9QTgD2vZ2S+asazwP6qSALScLP1yT1gXmtfSNHkICbl
 TCrc3uYdqKEfYA+y+gDOKwqoUZprz7G0ln1Xq9ZrrIyDAKcvkHFExQA0tAsez2hgJ1Ci
 /s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957660; x=1715562460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmyhiCSGn2Ic7wgXG37YUf46S2tWcfjFr+lbpJG1zV8=;
 b=wl3TnRkywSuswYDC6yXaOV1ijUKfJwufv0xnbTGqJJKekx+z71oZRDmzsA4CNVSQjz
 dDJf9gSfTIQg0BXNrne0kUECM2yxh/e5Ysq4k7kPx5hFehzP7kNjZzTZztLzhxZzPt4M
 62pTPEe8BW6adds2pyiL3Zpsigt9NGaEwkJJA8sbe1ItQZGU+QssFhl1fIKXBeQLRCP/
 rIKOiYuP6CuWdCPNu4iPsUA0Hw+LLA+yBK0eJz6actWScjWqUyDqol7lUUw82+zDHBzf
 U6pFiJmn1Er2vRfj7j8rbowkVg9OacbF9xF9GVWTdKBL6hyM01HHCD+AlfooMbQjpKzP
 UiGw==
X-Gm-Message-State: AOJu0YylCBb03Yo2edt7mvUorgtdU4vozs2VHbX9Hm5aMkhnPGVUv8Nh
 lqp3pGaucVv6vQOIxAVRIrL0/gwGKxwqvd5pvdgu8UtH0/eiQVkNdq+7EIwmft0FFMobaJ9tqPl
 T
X-Received: by 2002:a05:6870:c908:b0:239:4aad:777c with SMTP id
 hj8-20020a056870c90800b002394aad777cmr10344372oab.13.1714957659958; 
 Sun, 05 May 2024 18:07:39 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 42/57] target/arm: Convert SQRSHL, UQRSHL to decodetree
Date: Sun,  5 May 2024 18:03:48 -0700
Message-Id: <20240506010403.6204-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Y1o4Sm2F+sSO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 +++
 target/arm/tcg/translate-a64.c | 48 ++++++++++++++++------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 9f5ea9223d..86279edc98 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -762,6 +762,8 @@ SRSHL_s         0101 1110 111 ..... 01010 1 ..... ..... @rrr_d
 URSHL_s         0111 1110 111 ..... 01010 1 ..... ..... @rrr_d
 SQSHL_s         0101 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
 UQSHL_s         0111 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
+SQRSHL_s        0101 1110 ..1 ..... 01011 1 ..... ..... @rrr_e
+UQRSHL_s        0111 1110 ..1 ..... 01011 1 ..... ..... @rrr_e
 
 ### Advanced SIMD scalar pairwise
 
@@ -890,6 +892,8 @@ SRSHL_v         0.00 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 URSHL_v         0.10 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 SQSHL_v         0.00 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
 UQSHL_v         0.10 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
+SQRSHL_v        0.00 1110 ..1 ..... 01011 1 ..... ..... @qrrr_e
+UQRSHL_v        0.10 1110 ..1 ..... 01011 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8f5d8564eb..db3ba77760 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5163,6 +5163,22 @@ static const ENVScalar2 f_scalar_uqshl = {
 };
 TRANS(UQSHL_s, do_env_scalar2, a, &f_scalar_uqshl)
 
+static const ENVScalar2 f_scalar_sqrshl = {
+    { gen_helper_neon_qrshl_s8,
+      gen_helper_neon_qrshl_s16,
+      gen_helper_neon_qrshl_s32 },
+    gen_helper_neon_qrshl_s64,
+};
+TRANS(SQRSHL_s, do_env_scalar2, a, &f_scalar_sqrshl)
+
+static const ENVScalar2 f_scalar_uqrshl = {
+    { gen_helper_neon_qrshl_u8,
+      gen_helper_neon_qrshl_u16,
+      gen_helper_neon_qrshl_u32 },
+    gen_helper_neon_qrshl_u64,
+};
+TRANS(UQRSHL_s, do_env_scalar2, a, &f_scalar_uqrshl)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5414,6 +5430,8 @@ TRANS(SRSHL_v, do_gvec_fn3, a, gen_gvec_srshl)
 TRANS(URSHL_v, do_gvec_fn3, a, gen_gvec_urshl)
 TRANS(SQSHL_v, do_gvec_fn3, a, gen_neon_sqshl)
 TRANS(UQSHL_v, do_gvec_fn3, a, gen_neon_uqshl)
+TRANS(SQRSHL_v, do_gvec_fn3, a, gen_neon_sqrshl)
+TRANS(UQRSHL_v, do_gvec_fn3, a, gen_neon_uqrshl)
 
 
 /*
@@ -9420,13 +9438,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         gen_cmtst_i64(tcg_rd, tcg_rn, tcg_rm);
         break;
-    case 0xb: /* SQRSHL, UQRSHL */
-        if (u) {
-            gen_helper_neon_qrshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        } else {
-            gen_helper_neon_qrshl_s64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        }
-        break;
     case 0x10: /* ADD, SUB */
         if (u) {
             tcg_gen_sub_i64(tcg_rd, tcg_rn, tcg_rm);
@@ -9440,6 +9451,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     case 0x8: /* SSHL, USHL */
     case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
+    case 0xb: /* SQRSHL, UQRSHL */
         g_assert_not_reached();
     }
 }
@@ -9461,8 +9473,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0xb: /* SQRSHL, UQRSHL */
-        break;
     case 0x6: /* CMGT, CMHI */
     case 0x7: /* CMGE, CMHS */
     case 0x11: /* CMTST, CMEQ */
@@ -9484,6 +9494,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x8: /* SSHL, USHL */
     case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
+    case 0xb: /* SQRSHL, UQRSHL */
         unallocated_encoding(s);
         return;
     }
@@ -9510,16 +9521,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         void (*genfn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp) = NULL;
 
         switch (opcode) {
-        case 0xb: /* SQRSHL, UQRSHL */
-        {
-            static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                { gen_helper_neon_qrshl_s8, gen_helper_neon_qrshl_u8 },
-                { gen_helper_neon_qrshl_s16, gen_helper_neon_qrshl_u16 },
-                { gen_helper_neon_qrshl_s32, gen_helper_neon_qrshl_u32 },
-            };
-            genenvfn = fns[size][u];
-            break;
-        }
         case 0x16: /* SQDMULH, SQRDMULH */
         {
             static NeonGenTwoOpEnvFn * const fns[2][2] = {
@@ -9534,6 +9535,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         case 0x1: /* SQADD, UQADD */
         case 0x5: /* SQSUB, UQSUB */
         case 0x9: /* SQSHL, UQSHL */
+        case 0xb: /* SQRSHL, UQRSHL */
             g_assert_not_reached();
         }
 
@@ -10959,13 +10961,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0b: /* SQRSHL, UQRSHL */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqrshl, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqrshl, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11049,6 +11044,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x08: /* SSHL, USHL */
     case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
+    case 0x0b: /* SQRSHL, UQRSHL */
         g_assert_not_reached();
     }
 
-- 
2.34.1

