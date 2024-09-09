Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984679njb;
        Mon, 9 Sep 2024 09:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWum+l62K6useQt3tKDpv4vKxYoFHbcYKNJVgoIyaLNJHjWzV4fHwscecwclFBdhsaKitknMPMJKkRr7g==@linaro.org
X-Google-Smtp-Source: AGHT+IHyqvZ6283SUAcCXlYaMJkEAHWr85RLRFlhFWPeJOfD8Z4b8/UTHpL1nbVxAhAQX9ufxG3l
X-Received: by 2002:a05:6359:4c81:b0:1b3:9444:fb17 with SMTP id e5c5f4694b2df-1b8385b1f63mr1170600055d.5.1725899139700;
        Mon, 09 Sep 2024 09:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899139; cv=none;
        d=google.com; s=arc-20240605;
        b=AVNj7aHh7v5s6Tti1FkxCnAX2ApU3CkWmoXcAVWOBZjiBHnStYdNB5OfaLF8iYbSgx
         m4nQ/CdoRir6nye+q5IOtBJvDHCiCJZsRBbIxdslFzdPJJYDgyBZj2hMb9OBXFdfA5rZ
         C9NUpav7C5IVcEgYfpsmLunNmprb86J2k3rxi1BVWtGnuEATFkSNK/dE0mlcDmUx+4Lt
         y3/J7Yivu1+qWUtq8qaCJ7mPjzKTmGNLTJU+mbJ/bsivXV7UEx49i3HbXFQ9lIwzxRI4
         EFUBSijNZVR6JYtWBSBALJVBkjiV2tgKVuZO8193T19hIrhAKVZfLIuYWfJz5E8lMeJ6
         97mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MFw2VQon7yYNUOzGMyDI6NhEkt/3qQ163d5w/+6FdjY=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=l0np4MecC0fiDhHzxmG8z4bxgSDuHrrZzfTSW/kCQn/g8QUlEWuGtCUQt3T5fE9tT9
         hzGAzU4eEZI9/X9CZxmZ0zpKDLPD5BNea76mzMGOflNOc1/21VgvjQVBvwxx29oV4X65
         UF4oARMOPh2BO4YmNybfyGrk2KtCvghswFD2ADg9HShYmz2ii+bcIRQRsBO9y1rcyvH+
         K2/o4NuLw9zRPwNDGkQQ6HxGKYYaYVw/SYEBl4brOFcKQQiZE0pPaXFXfF09F8WNMD10
         oy23ucYxL8YpRChpv2R9WVY6LL1Q6CrJPaABWF/uAqoKsbmeH5+qg3Knni93ngJreFXt
         2sAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVXbOA4b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a55918si582203385a.591.2024.09.09.09.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:25:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVXbOA4b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snhAS-0003cP-7y; Mon, 09 Sep 2024 12:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAN-000396-DG
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:23:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAL-0007mM-Ly
 for qemu-devel@nongnu.org; Mon, 09 Sep 2024 12:23:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20543fdb7acso31133615ad.1
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2024 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898980; x=1726503780; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFw2VQon7yYNUOzGMyDI6NhEkt/3qQ163d5w/+6FdjY=;
 b=aVXbOA4b3vlFdiHoTz5QhUYy6C7s4Lts2Yh+/GaEOlUqVqi/D3VsckEDNZ/Jo/nZXm
 IbEBfUEfhqA6iBIgKCgvZ42JJ+MjmpWiBa0vFoJKjR5SFipTZFzfNmYF13b2YhRqltet
 oBuHsHZSsryMGHYItQ5eUc1z9aXlKSvm8UmlkrWcxk/qZ+OUmxM6OG+vP11DuFnJJOv5
 uXadxMJAo/seYmvlzTtw3oPrxr8nNN/CaZyUiCP+7y9UlURuQxH/D/nyWcTTiPhtrTzf
 PVG5z7jC++zMitJAZbLM+kCr2GADFSCuL5hnQ2jLPmZEtsh7bn/AUx4rd5bPjSCoG03S
 vV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898980; x=1726503780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFw2VQon7yYNUOzGMyDI6NhEkt/3qQ163d5w/+6FdjY=;
 b=gC8TNgTdsa8uuW7r5eRt3/QLqdX/GzeEhZioupSfTQd4qeHACTsHN9TG83SVV9X4F0
 cGYK0ZiXOO9VZTPbvc66Xt2Kp+cA0PCzLt2le6GXLlVEyHR/E7wGvbB4PIoiyPbl4poH
 RGePFB99fhsU9UBvPkkgyEOAgUeWQOf0AqITrQ/VWz545I2HR2lL25qihlx/BdsSWRcC
 rlKTe9Li3/VMPnGiQO2VQf4x1iYAqH+y2wF0CntkX2TqE9BKEshqtiX7yi1BOnarXPtP
 /puDW3NTa9+N7T9h7nuv1uIL4L2Pvncau/qzViTRsBFm5KHPwWKMv8TUbVIDOSNN/wpu
 X0MQ==
X-Gm-Message-State: AOJu0Yy40aFSoG8FzQ8iM+o0nDv3sZlpksWoAbVucEeHM4YB6Lhl3LVe
 FKyWlEWTUi4jH1H4bixXMLKBCjvMPC1xpU0DM4FE9vUeH6Guefnp+vKIMqbOvzHs7Xi84lJkJlF
 n
X-Received: by 2002:a17:902:e80e:b0:206:d6ac:854f with SMTP id
 d9443c01a7336-206f049d45amr95431845ad.3.1725898980363; 
 Mon, 09 Sep 2024 09:23:00 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 20/29] target/arm: Push tcg_rnd into handle_shri_with_rndacc
Date: Mon,  9 Sep 2024 09:22:30 -0700
Message-ID: <20240909162240.647173-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AWs6mENKFs3F

We always pass the same value for round; compute it
within common code.

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

