Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1270844ejc;
        Sun, 5 May 2024 18:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGguNcSkyFsATaEHjsfHTRusJA2HCfqKs8d5JTgsOhIG5DKTsBPZn6OQzPsa5GpZA3UtJyhjfGIPtrDaZRBmuxkOye6n74
X-Google-Smtp-Source: AGHT+IGjcJzIs1+Rqi8eZdnBls7QBA6DieQD+fTVf1ebDNOPIIwM2TFe+z797vkTN4uN2ZMvdrZX
X-Received: by 2002:a05:622a:50:b0:43a:f4cd:fdf8 with SMTP id y16-20020a05622a005000b0043af4cdfdf8mr11453466qtw.53.1714957712269;
        Sun, 05 May 2024 18:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957712; cv=none;
        d=google.com; s=arc-20160816;
        b=Niwl7h3rvRfEOcZXBefJGdc/LVsDZPKExQbxS7bpRlyxhx7UpRiw+TZVruS/wNpHud
         V4v5X1LrbCV4WkqpHkJjseSlDz8nLQ8xsj8luDUEvO5rJ4FSaoTJrz83ZASFj4s+kve+
         9R/52VuUPDkg+9miuLokfJ+lZq2EP9xYdqYibTCePcIpeuCqErgfFpGBo6o+n8Y4ArPI
         Hf39andEE0MkHSfAdK0n3Mn/xSJY4opJoz04EpN72HVfkxSeUvh/gmo5sjQOr59HIT/p
         4xALMGzsiy/bjLmu43p/JRNWGQq7wlb6mWZnRjjGsJ0dFLtAu77JrSY2e5QynMRgsXLe
         cXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2c6U7QJGLptXcC2HARJO0QASgxY0/Hez5iQRIC7xdbo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=lR+8wBTK9TXGZphhD4i8KdQSUsvf43bIu+2DbGLLyYDhThHR52c9iW3/eM24Azr0vt
         vIFEPjPLJMP7vosNx52AW8ZHem4jutV8CqIYWRPIfETS8LOmtUT0Tm0LLHz5WHwT4YJj
         nCxm4sa4tI5Oh9y2KpKXVa5Ej0RBrHILJEQVVXVkqDRCZPhaPS+PmSEkfIuVncnVZAVU
         5uZMT+e0uzFd92d7igliNTLD6tgsqC8CxhWFma9UYFRlmm0PQtXJguQyR6OjVAv4koMq
         h8+Y5sAeTOQMjfpkVzWUuaAKjjy1bfIwv6eWT4nnaYfWVb0xg7nFWf9A/RzVt+NY5Wgs
         Nh4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAq8b2VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac8580d000000b0043afb20945csi8599958qtg.613.2024.05.05.18.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAq8b2VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mnq-0002Cl-TE; Sun, 05 May 2024 21:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmx-0008P4-6r
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:19 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmS-0002Yf-Lo
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2a484f772e2so918147a91.3
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957475; x=1715562275; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2c6U7QJGLptXcC2HARJO0QASgxY0/Hez5iQRIC7xdbo=;
 b=PAq8b2VBUIF5fRM1YEQM4hZ5WpmIYzf6STTXIlB/EjCIyUhgSMpsI6UqLAfofwni9j
 RoTv/Q45xum/JFJYDyHXUWKc6CRp/m/X8IN05YDHbshaefYLuq4uLYsREBvP3JrnQRjc
 aeeSlRvVv1dVArPkI+GOj5pasiRXZcxaY5l0Fj1qRZlFc9/pkdHCmrOCUBFQZ7WE57B+
 IS5Y58bhievV2ILRu+X/xjcIARabbTqzd16SGHIQIpnPCH2qpsBiM6zP7hO7HaZsmSk5
 +rQDlxNLFT01dNY+4SR/PNjUnGUB3Mq5Z4fxljfqLZTJjBQUB5cXA4fXth0hl81PbaeY
 PIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957475; x=1715562275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2c6U7QJGLptXcC2HARJO0QASgxY0/Hez5iQRIC7xdbo=;
 b=mJ8xz9sZtfpFwq9LCPrYRTMmvFrKJWiXjV5Z9oMT9wpTBrX0wW/Slw056nW4OQhgxe
 /BPbL4appyCGE726s7pnzu+31DtCf0jm2vuN322Fx4FeBM5yhNUhVUGPZX0v60agyM9p
 5tIpITwtHvweXXKURWpjeaMg0u8484iV/J/clcg6LZFKnFjZcbrKWZyNhck06HhP/p08
 oGFr84+T0oHcSh1W5rxGNcZyJteK1t9Njy7rM7eVdyJhxQgvHzzQhcYV0S+8qjmWU3oE
 CZQviSnbZnYaK8rCdfMl205fZxpT9iHLNu8bC6OC5adDqSkLWsyJhL0vaAHyM2TQEhDY
 ctig==
X-Gm-Message-State: AOJu0YwoMbkQo2Zo7T6cEDvZUce7vYxbpMlBnG+ofXxroEhv8izi8wy+
 hYHjDU8Mn5GkCQy9rBSZ5i39pz8JqHRR8GdL14ainh0rClg9dgh86phhPp0zivtH4thniLvRHhi
 X
X-Received: by 2002:a17:90a:5897:b0:2b3:be55:bf6f with SMTP id
 j23-20020a17090a589700b002b3be55bf6fmr8046977pji.22.1714957474582; 
 Sun, 05 May 2024 18:04:34 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 36/57] target/arm: Convert SSHL, USHL to decodetree
Date: Sun,  5 May 2024 18:03:42 -0700
Message-Id: <20240506010403.6204-37-richard.henderson@linaro.org>
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
X-TUID: bC4E0mPLyGSQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  7 ++++++
 target/arm/tcg/translate-a64.c | 40 +++++++++++++++++++++-------------
 2 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 7cea0d2721..b98e0a5c5d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -42,6 +42,7 @@
 @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
 
 @rrr_h          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=1
+@rrr_d          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=3
 @rrr_sd         ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_sd
 @rrr_hsd        ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_hsd
 @rrr_e          ........ esz:2 . rm:5 ...... rn:5 rd:5  &rrr_e
@@ -755,6 +756,9 @@ UQSUB_s         0111 1110 ..1 ..... 00101 1 ..... ..... @rrr_e
 SUQADD_s        0101 1110 ..1 00000 00111 0 ..... ..... @r2r_e
 USQADD_s        0111 1110 ..1 00000 00111 0 ..... ..... @r2r_e
 
+SSHL_s          0101 1110 111 ..... 01000 1 ..... ..... @rrr_d
+USHL_s          0111 1110 111 ..... 01000 1 ..... ..... @rrr_d
+
 ### Advanced SIMD scalar pairwise
 
 FADDP_s         0101 1110 0011 0000 1101 10 ..... ..... @rr_h
@@ -876,6 +880,9 @@ UQSUB_v         0.10 1110 ..1 ..... 00101 1 ..... ..... @qrrr_e
 SUQADD_v        0.00 1110 ..1 00000 00111 0 ..... ..... @qr2r_e
 USQADD_v        0.10 1110 ..1 00000 00111 0 ..... ..... @qr2r_e
 
+SSHL_v          0.00 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
+USHL_v          0.10 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ccc30d61f3..fd36137e10 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5100,6 +5100,24 @@ TRANS(UQSUB_s, do_satacc_s, a, 0, 0, gen_uqsub_bhs, gen_uqsub_d)
 TRANS(SUQADD_s, do_satacc_s, a, MO_SIGN, 0, gen_suqadd_bhs, gen_suqadd_d)
 TRANS(USQADD_s, do_satacc_s, a, 0, MO_SIGN, gen_usqadd_bhs, gen_usqadd_d)
 
+static bool do_int3_scalar_d(DisasContext *s, arg_rrr_e *a,
+                             void (*fn)(TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t1 = tcg_temp_new_i64();
+
+        read_vec_element(s, t0, a->rn, 0, MO_64);
+        read_vec_element(s, t1, a->rm, 0, MO_64);
+        fn(t0, t0, t1);
+        write_fp_dreg(s, a->rd, t0);
+    }
+    return true;
+}
+
+TRANS(SSHL_s, do_int3_scalar_d, a, gen_sshl_i64)
+TRANS(USHL_s, do_int3_scalar_d, a, gen_ushl_i64)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5345,6 +5363,10 @@ TRANS(UQSUB_v, do_gvec_fn3, a, gen_gvec_uqsub_qc)
 TRANS(SUQADD_v, do_gvec_fn3, a, gen_gvec_suqadd_qc)
 TRANS(USQADD_v, do_gvec_fn3, a, gen_gvec_usqadd_qc)
 
+TRANS(SSHL_v, do_gvec_fn3, a, gen_gvec_sshl)
+TRANS(USHL_v, do_gvec_fn3, a, gen_gvec_ushl)
+
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -9349,13 +9371,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         gen_cmtst_i64(tcg_rd, tcg_rn, tcg_rm);
         break;
-    case 0x8: /* SSHL, USHL */
-        if (u) {
-            gen_ushl_i64(tcg_rd, tcg_rn, tcg_rm);
-        } else {
-            gen_sshl_i64(tcg_rd, tcg_rn, tcg_rm);
-        }
-        break;
     case 0x9: /* SQSHL, UQSHL */
         if (u) {
             gen_helper_neon_qshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
@@ -9387,6 +9402,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     default:
     case 0x1: /* SQADD / UQADD */
     case 0x5: /* SQSUB / UQSUB */
+    case 0x8: /* SSHL, USHL */
         g_assert_not_reached();
     }
 }
@@ -9411,7 +9427,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x9: /* SQSHL, UQSHL */
     case 0xb: /* SQRSHL, UQRSHL */
         break;
-    case 0x8: /* SSHL, USHL */
     case 0xa: /* SRSHL, URSHL */
     case 0x6: /* CMGT, CMHI */
     case 0x7: /* CMGE, CMHS */
@@ -9431,6 +9446,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     default:
     case 0x1: /* SQADD, UQADD */
     case 0x5: /* SQSUB, UQSUB */
+    case 0x8: /* SSHL, USHL */
         unallocated_encoding(s);
         return;
     }
@@ -10915,13 +10931,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x08: /* SSHL, USHL */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_ushl, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sshl, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11002,6 +11011,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 
     case 0x01: /* SQADD, UQADD */
     case 0x05: /* SQSUB, UQSUB */
+    case 0x08: /* SSHL, USHL */
         g_assert_not_reached();
     }
 
-- 
2.34.1

