Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368295nji;
        Wed, 11 Sep 2024 19:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMmkx4e/t7qc0fJwWXGT+TmHZ/iHw7EZ309Yw4V18/HqHkp1Khk7U1UOD6nfGUvkRvm9/XBghxq69FAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGkggCMkdLq6tbJ3tMS/VnQro3vYY2VLWEk152XFmQUqJlRqMqJqD+i4fYNvhUKdNeIqinG
X-Received: by 2002:a05:6214:3993:b0:6c5:30b4:1f75 with SMTP id 6a1803df08f44-6c573590614mr20805516d6.29.1726108984042;
        Wed, 11 Sep 2024 19:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726108984; cv=none;
        d=google.com; s=arc-20240605;
        b=O+EQw922y1EMvcpxdgX8jF6tv4W9IrafBo3fEN8XjOqZvcTFoe2iJ4YpZRmDqZIaPf
         ffG5afp3GF9MFpBhcBdbbsz3UUPIMkJ2kzQhNsUttK/hFRV8HoMy2WkrUa9WKKF4Knvd
         9FJu/ZZv/6U2lsoSOnZshHr8PCA1Dmlbz802YQqttmAJTRtanYWwFihmMuzPUSCQNg0L
         fEtBeDrrgr6JM2OZT3FbrAIdjBu8DEWDgr/7R4DjZu3Vs1kQNku8YonFSykY6py1e7Fv
         kHGNhrZ9YRWZEfqKdmxx1nAiu4htBRBEbjFmtNDBbe83iMovnAT7syK0MRqaaQK0MMSj
         l8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Si86JKCuT9dzTb6LuA2zkdzwmeHcws3bbEbFgiDwDVI=;
        fh=gQUbKHWxndGeE+DWX4FUU/bGRmGjAJrLFJIkYOi+27k=;
        b=jPHrsFLdUIUbYy2rSI7dr+I1oRt5OeYjW7COkHFuXHlchl3Dmiu+9a1ebPrDpmx3MQ
         hfsMBqlgpwbaY5oZQHhyXVB+8bCYl0ktr+DFVj039GDzNEFMXLkODrKRmrgDelXvHfLT
         /ormBTbt4U18SSaWq7xAPWgZpTwnVO8F1gOZY9rklVFZMJl85c6ruC+7YcbSiI7qfwbP
         yWt16cRxpqxdOW2kaOsCmPU7IUQIFiKqwBMRlLryXTxnpVICrNjj1WvIucm60X4UbQHF
         MKJDaKg9iDx8UgqY6ZBYG6/qe54OBckPgtcjxu+1lcA4iM9/sog4V3Tjuq6tdP/57kJQ
         MCdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsnD3XWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5343303d6si117401646d6.22.2024.09.11.19.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsnD3XWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZmD-00040A-Bp; Wed, 11 Sep 2024 22:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm5-0003OA-Bt
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:37 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm3-0004Dx-Lj
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:37 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2054e22ce3fso5283725ad.2
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108894; x=1726713694; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Si86JKCuT9dzTb6LuA2zkdzwmeHcws3bbEbFgiDwDVI=;
 b=SsnD3XWfxPEayb/GB5zK+dBZuvJIzld1xWILRtrkKHBQOezIbBj6nVrJgeS6YXqEFE
 CPPYluqZG2/mKyEIQqQqNEPwam6hco1NlY31f7VLkqEqS0830YWoaIu3fOxYfcHzWls2
 HrRhOnNslTFS5fBCseojNgZHBUBunKNTVGLwsbfK0kiJ+7rxTfRy7i8T3hc5FGV4hs0p
 1pdJ58YOjhTh7O7sKeHomde0GMl40b0aWyjE5abolNV84G11RqYicqtdl3D45XEAJ/V2
 E7eNztenuEaq0ZY8TPZZ+vlix07fowtetgU4EQQYBkQI9wOgg1TBBts+q4lfJurssINq
 4rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108894; x=1726713694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Si86JKCuT9dzTb6LuA2zkdzwmeHcws3bbEbFgiDwDVI=;
 b=sHOQ8m2GZu4O8X06UV3WDRBVCaJKEJt1CewwiOTDuB17//FmzgNiA+bqNx3/mgrwQz
 BWrgd/fSL6ULeWUpdW8oBYwgEV2hwhcUoHhAkNFL3OPsegZxgnwbEynv5eUaRKUHu3wC
 /hsuEBfhMRiMhnspddIOv2G2mjxI/t3FLedABJfTUyNi52/YJxNlGRyESY7eQU48aX/f
 18lsMoaITC7R8L/hrRdQPCiKYEpqw8bT5DOKbPdY0ag/Z/SJF2MuVQkZR0JPJHgW1/9c
 mlRLGZlEK4tmVxqGeFZMCf+Wc0re67L7ZRyb/Llq1bR+44rjvAxtpifTZ9kzEUuAjCHR
 KZ2A==
X-Gm-Message-State: AOJu0Yw4BZm5pVerPznWsLHRI3yTdzs94uXS1g56huGNfE+BDj9QFgq7
 rjdW3lF3am7TNej07wOXEkgiCPzWuRwO7fKU4K9ubr6n39uDsa3NWQCJuvJ+QmRN2FDinrPodX5
 y
X-Received: by 2002:a17:903:41c3:b0:207:1de9:1014 with SMTP id
 d9443c01a7336-2076e38f304mr23558695ad.34.1726108894313; 
 Wed, 11 Sep 2024 19:41:34 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 20/29] target/arm: Push tcg_rnd into handle_shri_with_rndacc
Date: Wed, 11 Sep 2024 19:41:05 -0700
Message-ID: <20240912024114.1097832-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: 3CbA+zfiHszA

We always pass the same value for round; compute it
within common code.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e00d7fbf48..e59236330a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9205,11 +9205,10 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
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
 
@@ -9227,6 +9226,7 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
 
     /* Deal with the rounding step */
     if (round) {
+        TCGv_i64 tcg_rnd = tcg_constant_i64(1ull << (shift - 1));
         if (extended_result) {
             TCGv_i64 tcg_zero = tcg_constant_i64(0);
             if (!is_u) {
@@ -9294,7 +9294,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
     bool insert = false;
     TCGv_i64 tcg_rn;
     TCGv_i64 tcg_rd;
-    TCGv_i64 tcg_round;
 
     if (!extract32(immh, 3, 1)) {
         unallocated_encoding(s);
@@ -9320,12 +9319,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
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
 
@@ -9339,7 +9332,7 @@ static void handle_scalar_simd_shri(DisasContext *s,
             tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, 0, esize - shift);
         }
     } else {
-        handle_shri_with_rndacc(tcg_rd, tcg_rn, tcg_round,
+        handle_shri_with_rndacc(tcg_rd, tcg_rn, round,
                                 accumulate, is_u, size, shift);
     }
 
@@ -9392,7 +9385,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     int elements = is_scalar ? 1 : (64 / esize);
     bool round = extract32(opcode, 0, 1);
     MemOp ldop = (size + 1) | (is_u_shift ? 0 : MO_SIGN);
-    TCGv_i64 tcg_rn, tcg_rd, tcg_round;
+    TCGv_i64 tcg_rn, tcg_rd;
     TCGv_i32 tcg_rd_narrowed;
     TCGv_i64 tcg_final;
 
@@ -9437,15 +9430,9 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
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
@@ -10495,7 +10482,6 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     int shift = (2 * esize) - immhb;
     bool round = extract32(opcode, 0, 1);
     TCGv_i64 tcg_rn, tcg_rd, tcg_final;
-    TCGv_i64 tcg_round;
     int i;
 
     if (extract32(immh, 3, 1)) {
@@ -10512,15 +10498,9 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
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

