Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615627njk;
        Tue, 16 Jul 2024 23:11:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5hzBKKpDkB0mOs6KTiueesJ/0XABN1Kg0Mxvndwt+deYdyeTovCJIXG0F2nGl8KhMWgMfSikDIkyn4E9fuxtTs8ezT7yd
X-Google-Smtp-Source: AGHT+IFakY02oaWd3o4JQHl24ege78u2E1t87tIb6aiulcCgDXBQHjkmzLHuMWgeB+MFFySgZmFZ
X-Received: by 2002:a05:620a:4047:b0:79d:60c2:59f with SMTP id af79cd13be357-7a187461f3cmr59670185a.32.1721196710277;
        Tue, 16 Jul 2024 23:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196710; cv=none;
        d=google.com; s=arc-20160816;
        b=pUimaAOic358lUlmcPzMaR5Is/4QcjzQ3rsFQDXd8r5eTiorod+B7MTxq4GL2vEyWj
         K2bf3waqQ44CP60stLvTBFMhC77vY2b4qdK86hQ6SiCfBylVy+/gxAkbu331jDou/yI6
         E1nTkSA0nkHpc/MZ9Td5lHjPQWVTprWQGZhfgw5JsSmYDYl3uxdmj+A7Yq/BLQsfvGeQ
         Y9AbIIGRlw1XdPXgkThMiTQmYEH4BM3CTLimdgZsMJGiSRTcIpauxRPg4ruCK/0smzEp
         T5HFd7xhuXR1KUDlOLqBQDUWdvDF81l5sgAQEe7c6b0ce4MNjfi0VMdChzjykVIUb8Uk
         kJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k+oYXE4L2h80inyKqiRmXD3B0YphDkaBHXm+psrg+vQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=VQMTvGp8XIYwkghJf/b4k+9NDXitVRWcRLtW0/IKT97boULCrWKccHkfYVt4Gd5tQq
         wmihOW82Q25sPrtpkOWMwydxPNyBKy7O9yIHEJtJTodkq/CIf8cAvEgYHK5HbtbNAxZG
         JDYJNon3FW0rYgccuWmFaiAA7aY6cT4/UcVAGY1oxDvyCaMAb1WwsruqYobw8T9sgOhv
         Rp13yigXud8KI+Ict4f9dKikVvI+huKMAsL5ZgXiopMFnK8sjGI5rytVBRj39lMDPCld
         +Z9Qplw5/ePWiBM8y8X2YGafPdKwD9+yuYTQVeJ5XRz10lVwvbjypHTJ/qGMBtCkzBaA
         FTAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+tOtrZ9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160baa770si916882285a.167.2024.07.16.23.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+tOtrZ9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTxs2-0000lP-63; Wed, 17 Jul 2024 02:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrS-0005xz-Kw
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:58 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrO-00037a-7z
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70b1207bc22so5367647b3a.3
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2024 23:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196593; x=1721801393; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+oYXE4L2h80inyKqiRmXD3B0YphDkaBHXm+psrg+vQ=;
 b=g+tOtrZ92V2PZNTfVH9aMsS1c+c57ujzHlicbRQL6+1OpzAx8uAOYcv0IKWP40R/Gk
 cHp7X49nZMgyWotKIThb3WVr/I85subfbf7eNZB79l010fineqt7q6bNxrxRbxXvOX1g
 VvaRjnT6GG5bT/SESqd5cYclB8ugU4ds9kPNZNSYIaYv/Fef7i9vzIMt70vcXH7Gqzrz
 2v9JCX35au7b/OVhGSdXKo4lDaZ3fiYV/4BgVXXl4n4XbcKSX7aQ19EAdSu4/gG7N9b/
 D7vGHGe7bTV2zw+8VBDmQg2UNULuqvOvN+0uk48S6SneBhQGJnCNRyKaVUUjk7HOnPD3
 Tqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196593; x=1721801393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+oYXE4L2h80inyKqiRmXD3B0YphDkaBHXm+psrg+vQ=;
 b=rEUYoNZugQXkF6/8F7TcH18kxFe1nqveo0aumMhmgeV85wSOt92SdaWprWsW8P2Xa6
 dNaY6EvUgcqYKqcTFGzZGvhZR8rzNUzyTCpldDi5mEeYD8Kxgb+SC00MdkhSWUq2fNRw
 ZlsvJ2iXYPxfMDNJ0Tc9WBHpuxwi4Y0+dHhdlfB8Hs207hKmW7AbbxUmdKA+atP3WFbY
 AgSfr9dU46uaGgAIYxCL9La62DrwilGsUw8ZEsOIer1jU9iGAeXW2z/jfWKPAQBvkseZ
 nmcpp0miFBovU6KH+95r2ykq7e0IrABg46f1ZpkP9W6s0WfKlts+NB0a8VMz6Hrjgq8G
 W9OQ==
X-Gm-Message-State: AOJu0YyUuQjVFbvS1BAAe/laHofYQ4UxhkcvLccd8/q/NdOjBiYreUpC
 9xAw50/okq8+F2pV2RI66WurHfOLWiGPlNjVnY/ByA/X+ZeeGUULHbccwPwM1EgqHz4O2+pzonv
 2Hqg=
X-Received: by 2002:a05:6a00:1743:b0:706:62b6:cbd3 with SMTP id
 d2e1a72fcca58-70ce4fff799mr1028138b3a.26.1721196592847; 
 Tue, 16 Jul 2024 23:09:52 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/17] target/arm: Push tcg_rnd into handle_shri_with_rndacc
Date: Wed, 17 Jul 2024 16:09:03 +1000
Message-ID: <20240717060903.205098-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vSaOAJJA/wuK

We always pass the same value for round; compute it
within common code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2a9cb3fbe0..f4ff698257 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9197,11 +9197,10 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
  * the vector and scalar code.
  */
 static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
-                                    TCGv_i64 tcg_rnd, bool accumulate,
+                                    bool round, bool accumulate,
                                     bool is_u, int size, int shift)
 {
     bool extended_result = false;
-    bool round = tcg_rnd != NULL;
     int ext_lshift = 0;
     TCGv_i64 tcg_src_hi;
 
@@ -9219,6 +9218,7 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
 
     /* Deal with the rounding step */
     if (round) {
+        TCGv_i64 tcg_rnd = tcg_constant_i64(1ull << (shift - 1));
         if (extended_result) {
             TCGv_i64 tcg_zero = tcg_constant_i64(0);
             if (!is_u) {
@@ -9286,7 +9286,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
     bool insert = false;
     TCGv_i64 tcg_rn;
     TCGv_i64 tcg_rd;
-    TCGv_i64 tcg_round;
 
     if (!extract32(immh, 3, 1)) {
         unallocated_encoding(s);
@@ -9312,12 +9311,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
         break;
     }
 
-    if (round) {
-        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
-    } else {
-        tcg_round = NULL;
-    }
-
     tcg_rn = read_fp_dreg(s, rn);
     tcg_rd = (accumulate || insert) ? read_fp_dreg(s, rd) : tcg_temp_new_i64();
 
@@ -9331,7 +9324,7 @@ static void handle_scalar_simd_shri(DisasContext *s,
             tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, 0, esize - shift);
         }
     } else {
-        handle_shri_with_rndacc(tcg_rd, tcg_rn, tcg_round,
+        handle_shri_with_rndacc(tcg_rd, tcg_rn, round,
                                 accumulate, is_u, size, shift);
     }
 
@@ -9384,7 +9377,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     int elements = is_scalar ? 1 : (64 / esize);
     bool round = extract32(opcode, 0, 1);
     MemOp ldop = (size + 1) | (is_u_shift ? 0 : MO_SIGN);
-    TCGv_i64 tcg_rn, tcg_rd, tcg_round;
+    TCGv_i64 tcg_rn, tcg_rd;
     TCGv_i32 tcg_rd_narrowed;
     TCGv_i64 tcg_final;
 
@@ -9429,15 +9422,9 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_rd_narrowed = tcg_temp_new_i32();
     tcg_final = tcg_temp_new_i64();
 
-    if (round) {
-        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
-    } else {
-        tcg_round = NULL;
-    }
-
     for (i = 0; i < elements; i++) {
         read_vec_element(s, tcg_rn, rn, i, ldop);
-        handle_shri_with_rndacc(tcg_rd, tcg_rn, tcg_round,
+        handle_shri_with_rndacc(tcg_rd, tcg_rn, round,
                                 false, is_u_shift, size+1, shift);
         narrowfn(tcg_rd_narrowed, tcg_env, tcg_rd);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_rd_narrowed);
@@ -10487,7 +10474,6 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     int shift = (2 * esize) - immhb;
     bool round = extract32(opcode, 0, 1);
     TCGv_i64 tcg_rn, tcg_rd, tcg_final;
-    TCGv_i64 tcg_round;
     int i;
 
     if (extract32(immh, 3, 1)) {
@@ -10504,15 +10490,9 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     tcg_final = tcg_temp_new_i64();
     read_vec_element(s, tcg_final, rd, is_q ? 1 : 0, MO_64);
 
-    if (round) {
-        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
-    } else {
-        tcg_round = NULL;
-    }
-
     for (i = 0; i < elements; i++) {
         read_vec_element(s, tcg_rn, rn, i, size+1);
-        handle_shri_with_rndacc(tcg_rd, tcg_rn, tcg_round,
+        handle_shri_with_rndacc(tcg_rd, tcg_rn, round,
                                 false, true, size+1, shift);
 
         tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
-- 
2.43.0

