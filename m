Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1271207ejc;
        Sun, 5 May 2024 18:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfVl/4t0BTCB9kMVarR3uxxcodnJyx4VMzJROjStu7sIOH7+zD0KLtItRRmAA3X273kBCGPs5qhuYhuAw8M74+cux8p7pw
X-Google-Smtp-Source: AGHT+IGlPzgv/nrbDDxg+SEi8gutefiemcArmyClikDFM+IyKmodAfg3U6h0zqppLptgiM+Ixw7w
X-Received: by 2002:a54:488e:0:b0:3c9:677d:bf5a with SMTP id r14-20020a54488e000000b003c9677dbf5amr3863201oic.33.1714957772813;
        Sun, 05 May 2024 18:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957772; cv=none;
        d=google.com; s=arc-20160816;
        b=TJS45H0SIMRKzXYxMmozeETTerWBUI7VuGOIdIt0wsmSbRBC26qWlZOnLwLrsMCIlk
         FjTfLXFZ9l94iMeaW9DFad0gxRhJ+42PWHedL0AO1ZQDFkSAQSvFaOSyljHjVKopdTos
         O5pB/OnpnYj37MF4ZCr5cPBpXtV1FwkNHTeZQMuzjnwLVVBwD1nX+4udvwMdBXwyP08g
         7rG83V7ta7ESuSnup16JNms7vCpCdAAC6EyG1WDM+/Zr5jSVec2vaOuBPcmfABvsy7V/
         3YNxBF79xHeM2WzDQN0jLvOrCXUSoJ2C1np7F2qP5OC4EHabd8HWO6k7kcVdwxu1TJKk
         gy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5LPNO1GxvoAXX4VhTuSlkwDb1bkC9+IYC6oOe7zp/PE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=KXLJaejrPiKaseve7MYnK02X89qsnR/ly7uF8dm/EmzyuQ/b/tVMijMfCMl8rlVKyE
         XHPiS+3k8mAbpVYTMViAj6MePHQcNxRHfE9cguuvFugr3tQrwhSVyeKxh9HF9pCpEhw6
         1SiC+7QpBNKecAQ//H6R9Tg4oCPg5G38zgarV82J8YGn9iG73hCDcVeL2eZlwsGabQZc
         fXwzdl3BBZNoBhT1tspQ09M/4yPoYVjgSGGneOdgMtyAGfrtOgQAGSOmXCNT5v7yi5Z1
         OBFuipsaAchRaafMI08JRgc9zi1ND3DQTbOnFLeDAFUilUMgC0p0nJBE04Zpsyt6KvaZ
         FEWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mrZMy7Dn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05620a0a0600b007929547c039si1919085qka.105.2024.05.05.18.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mrZMy7Dn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mqB-0000RZ-Oc; Sun, 05 May 2024 21:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpZ-0007b3-EE
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:07:51 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpS-0003Ka-AH
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:07:49 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-23d1c4c14ceso1127491fac.0
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957658; x=1715562458; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LPNO1GxvoAXX4VhTuSlkwDb1bkC9+IYC6oOe7zp/PE=;
 b=mrZMy7DnQGQqtqAj8ELnPBkvW8ZnrfJR/tK7uQuYaW1w6ocNh80zDH5JaBLYa19trY
 /kxVjdQHStG7Rl3orlJyVaTg5DKwKz++u5TZ5/fi40eHGAzGkZkUJNapV/g1Y4NRNaPe
 5PRLjziPobcIIY07rSES9Chg0mHrYGR4f+19rUOZN3lAn3WgqhE2HiAWnHSB/xjVxrsQ
 gVJ8lQbsfFyTVen5C3bqhdK7if9a9p5Yjjrku8sRtUBUXITt04u9+/7afu7KV6odV5Yi
 pGETcaoKS8wPuHpviNPdhPJ0BPlfg+SUgmMreYxf3aitmHhHnT+ymDJ42JPg8iZB0W3B
 FoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957658; x=1715562458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LPNO1GxvoAXX4VhTuSlkwDb1bkC9+IYC6oOe7zp/PE=;
 b=ep0KIbR3H3KU156itXruS9DwR0wjOWvSTQY03iX+WJFXFRdLS0lXfRUR4Eaf0eZr2H
 xj0W5GTMjoDH+ZK6BS5mDgcgI+M6fP1RkgPcM7U2ItN6gU772jyCkJZ0fuuaehbFM98I
 3K/Eorc82yf8Ia8FdiOAQzMu0k+ppOfe0jpDxaoZO3jYxy5R4PhDMTuds0RMlGT1Uqmf
 BxkqgCWD1cun4oGss8mRJ9VyiH38UzM4BNN+EDhPkOPCzMbbjPZPKglk0h+iB+vjxC1V
 sNWHBylQrpwbti7hnNxOt7KRUlw8mMKC+313lae+QU0JuZ5z+3IhR+2zfuXL4edJ7JLe
 M7Rw==
X-Gm-Message-State: AOJu0YwTc8UBtZzLBhfDSTIbqogYrhq0e3knqZVYFheeqta4ATRcvrpQ
 hczv1HWejdYJDC+9J8KYlJriIwBCi9pzIABkx6It9TD4H6Zr/g5CvT40zikGAkU=
X-Received: by 2002:a05:6870:8898:b0:22e:b96a:375 with SMTP id
 m24-20020a056870889800b0022eb96a0375mr10729889oam.30.1714957658228; 
 Sun, 05 May 2024 18:07:38 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 40/57] target/arm: Convert SQSHL, UQSHL to decodetree
Date: Sun,  5 May 2024 18:03:46 -0700
Message-Id: <20240506010403.6204-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
X-TUID: QKYzlFV03hdj

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++
 target/arm/tcg/translate-a64.c | 74 ++++++++++++++++++++++------------
 2 files changed, 53 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6f55e0e300..9f5ea9223d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -760,6 +760,8 @@ SSHL_s          0101 1110 111 ..... 01000 1 ..... ..... @rrr_d
 USHL_s          0111 1110 111 ..... 01000 1 ..... ..... @rrr_d
 SRSHL_s         0101 1110 111 ..... 01010 1 ..... ..... @rrr_d
 URSHL_s         0111 1110 111 ..... 01010 1 ..... ..... @rrr_d
+SQSHL_s         0101 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
+UQSHL_s         0111 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
 
 ### Advanced SIMD scalar pairwise
 
@@ -886,6 +888,8 @@ SSHL_v          0.00 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
 USHL_v          0.10 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
 SRSHL_v         0.00 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 URSHL_v         0.10 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
+SQSHL_v         0.00 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
+UQSHL_v         0.10 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index fc0f371211..c1c513fd12 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5120,6 +5120,49 @@ TRANS(USHL_s, do_int3_scalar_d, a, gen_ushl_i64)
 TRANS(SRSHL_s, do_int3_scalar_d, a, gen_helper_neon_rshl_s64)
 TRANS(URSHL_s, do_int3_scalar_d, a, gen_helper_neon_rshl_u64)
 
+typedef struct ENVScalar2 {
+    NeonGenTwoOpEnvFn *gen_bhs[3];
+    NeonGenTwo64OpEnvFn *gen_d;
+} ENVScalar2;
+
+static bool do_env_scalar2(DisasContext *s, arg_rrr_e *a, const ENVScalar2 *f)
+{
+    if (!fp_access_check(s)) {
+        return true;
+    }
+    if (a->esz == MO_64) {
+        TCGv_i64 t0 = read_fp_dreg(s, a->rn);
+        TCGv_i64 t1 = read_fp_dreg(s, a->rm);
+        f->gen_d(t0, tcg_env, t0, t1);
+        write_fp_dreg(s, a->rd, t0);
+    } else {
+        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t1 = tcg_temp_new_i32();
+
+        read_vec_element_i32(s, t0, a->rn, 0, a->esz);
+        read_vec_element_i32(s, t1, a->rm, 0, a->esz);
+        f->gen_bhs[a->esz](t0, tcg_env, t0, t1);
+        write_fp_sreg(s, a->rd, t0);
+    }
+    return true;
+}
+
+static const ENVScalar2 f_scalar_sqshl = {
+    { gen_helper_neon_qshl_s8,
+      gen_helper_neon_qshl_s16,
+      gen_helper_neon_qshl_s32 },
+    gen_helper_neon_qshl_s64,
+};
+TRANS(SQSHL_s, do_env_scalar2, a, &f_scalar_sqshl)
+
+static const ENVScalar2 f_scalar_uqshl = {
+    { gen_helper_neon_qshl_u8,
+      gen_helper_neon_qshl_u16,
+      gen_helper_neon_qshl_u32 },
+    gen_helper_neon_qshl_u64,
+};
+TRANS(UQSHL_s, do_env_scalar2, a, &f_scalar_uqshl)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5369,6 +5412,8 @@ TRANS(SSHL_v, do_gvec_fn3, a, gen_gvec_sshl)
 TRANS(USHL_v, do_gvec_fn3, a, gen_gvec_ushl)
 TRANS(SRSHL_v, do_gvec_fn3, a, gen_gvec_srshl)
 TRANS(URSHL_v, do_gvec_fn3, a, gen_gvec_urshl)
+TRANS(SQSHL_v, do_gvec_fn3, a, gen_neon_sqshl)
+TRANS(UQSHL_v, do_gvec_fn3, a, gen_neon_uqshl)
 
 
 /*
@@ -9375,13 +9420,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         gen_cmtst_i64(tcg_rd, tcg_rn, tcg_rm);
         break;
-    case 0x9: /* SQSHL, UQSHL */
-        if (u) {
-            gen_helper_neon_qshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        } else {
-            gen_helper_neon_qshl_s64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        }
-        break;
     case 0xb: /* SQRSHL, UQRSHL */
         if (u) {
             gen_helper_neon_qrshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
@@ -9400,6 +9438,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     case 0x1: /* SQADD / UQADD */
     case 0x5: /* SQSUB / UQSUB */
     case 0x8: /* SSHL, USHL */
+    case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
         g_assert_not_reached();
     }
@@ -9422,7 +9461,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0x9: /* SQSHL, UQSHL */
     case 0xb: /* SQRSHL, UQRSHL */
         break;
     case 0x6: /* CMGT, CMHI */
@@ -9444,6 +9482,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x1: /* SQADD, UQADD */
     case 0x5: /* SQSUB, UQSUB */
     case 0x8: /* SSHL, USHL */
+    case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
         unallocated_encoding(s);
         return;
@@ -9471,16 +9510,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         void (*genfn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp) = NULL;
 
         switch (opcode) {
-        case 0x9: /* SQSHL, UQSHL */
-        {
-            static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                { gen_helper_neon_qshl_s8, gen_helper_neon_qshl_u8 },
-                { gen_helper_neon_qshl_s16, gen_helper_neon_qshl_u16 },
-                { gen_helper_neon_qshl_s32, gen_helper_neon_qshl_u32 },
-            };
-            genenvfn = fns[size][u];
-            break;
-        }
         case 0xb: /* SQRSHL, UQRSHL */
         {
             static NeonGenTwoOpEnvFn * const fns[3][2] = {
@@ -9504,6 +9533,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         default:
         case 0x1: /* SQADD, UQADD */
         case 0x5: /* SQSUB, UQSUB */
+        case 0x9: /* SQSHL, UQSHL */
             g_assert_not_reached();
         }
 
@@ -10929,13 +10959,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x09: /* SQSHL, UQSHL */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqshl, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqshl, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11017,6 +11040,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x01: /* SQADD, UQADD */
     case 0x05: /* SQSUB, UQSUB */
     case 0x08: /* SSHL, USHL */
+    case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
         g_assert_not_reached();
     }
-- 
2.34.1

