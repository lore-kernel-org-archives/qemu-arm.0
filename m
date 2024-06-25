Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp752805njc;
        Tue, 25 Jun 2024 11:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTBxAQca5t/PruFwQzADmT7Wy6TTOJupuYgL3dq/7TzbBWEnxn8IhBmrq5l2Xzk4P1ZOywKNRy5efdZJ7HfKMW8KIz5iFh
X-Google-Smtp-Source: AGHT+IHGqCFc5HOR33T609SMfsSmoM5knQAAdkHL+zCkQWWmSv+wUhy1FcA7tMBbyFNanhUWK02+
X-Received: by 2002:a05:600c:3506:b0:421:7997:bf79 with SMTP id 5b1f17b1804b1-4248cc66749mr58316645e9.36.1719341840835;
        Tue, 25 Jun 2024 11:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719341840; cv=none;
        d=google.com; s=arc-20160816;
        b=zo8aUSRkKx4KnRssBiBHzsPqwTgKP0G1DGZEYVBMU+HYFrMHbvjGSMdeKL3PDfpD8H
         0IXVxFVjbPiYUbPNJTIKmB9gxUsSYx8oXG6nuP78fNlVvqvtoLUygNDA1EZSdGPCqTGa
         RXXRxVunOOndvyYDGNeFf4ZebYIjlOJ2TdgrS9gBC1YD73G3JHz2iYQ/KGFteSUUVK/E
         Z/0PvV7ZXytK+1hP7MzNQjmhB1bCp1bQyRZ9bPdhVGZW1SPuPSeoqU5780MLqe4svlW3
         zRA/qjkA68nmy3+GNvtVUJbj36lndH8vXmMEX58j275pFZoUKfssaSQ0tiK2ZBZf22Hj
         iUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A9xMCiVEPs8xOyyzawG2CVQ8zg7ghsGamdUOThsHcoY=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=J3mDehuUKANYuO8f81PtfOTPKud3CMmS4BhrypIYDeKlArxiT8LSGJRSGrFvRBIPAG
         H+DRdOS2dUBj8JisdzvO51ojKYRp2x8E49k8VUPyQR6R/tpqL15sDg+QHBqY8FidHV/O
         snjVWxiv3LzS4ZCZXgKBhBthwD4MBdsA0smNrO795DpR400hCsKwt9iTgfepVWcaBljx
         bwUnOZvnV1/lnIWRHsdwKPF8AmgrkL1yrBCsC8ij80amXN5idrwdf/iDY8lKEmiVVLe8
         ZHbccZU6Mqt0NH5nkU1zMCxwgr77FMGeUUaG7NK3It/oLBixmLKCxMxK77fbB+nx6cNw
         ZIBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCLB2fx1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3663a8c8e46si5521832f8f.571.2024.06.25.11.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 11:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCLB2fx1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sMBBc-0002eu-Bn; Tue, 25 Jun 2024 14:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB50-000163-8B
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 14:39:56 -0400
Received: from [2607:f8b0:4864:20::631] (helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB3m-00066R-3h
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 14:39:34 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fa78306796so5767215ad.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340543; x=1719945343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9xMCiVEPs8xOyyzawG2CVQ8zg7ghsGamdUOThsHcoY=;
 b=BCLB2fx1HMZWEVHNoDUFIPjYoPi2gSqcm8GP342vMmKI0LOSVp6ZjWAfK8vdzahHFA
 RT3mfRWKrdOSvwToZebAPA41uCPDrgBt2VYr+65fp0EOVVI3Qav/DZX5DgztOCbs1oFE
 53fel413nnLZJfGV7XtRIwbJiZrO0DWsrBrpUjaqbqj88WiDKkOAir6K3sJOTPjStH/K
 xlciA1hVh3mCKGUZNqHAE/ZML7oe08QDxk/CMQVsjc64MqSq3g01R5jvYEcqV09h2JXC
 2ebZ7cEtlR4mfjTjU4/rVu7YoOfr3km5PdVz2YCiuxobVFQYVigB2CrbOjvTYn06tEau
 UPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340543; x=1719945343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9xMCiVEPs8xOyyzawG2CVQ8zg7ghsGamdUOThsHcoY=;
 b=DQ6K/TRYFLk3cBJ0BkmBux7WnOPCL/hjc5G68ik7t4R6aflZJMgDASL8tN7jQv4yjM
 GnfqdLOd6pn1K1My+T0c0rtBcuP2eLfVyGPiFBmG4in9YcmZ++ZlAzvBBehKn0qlRvc9
 jyq9XOeKhLQyyR0UIZ5rXxsvk7MKzwUjZ51/LmNxxkKY5RjZmKSSRWMjJhnxXjmQH3rm
 Zg41yDbqNnir5X3el8K5Os2q03leJGzK9KLw+1rwLTeJTEwhaRx+yjLD5ChUwi5oe/4Y
 w/zeJfy29sk8Cvjgsk9w29hcS6Eh4RF6FUBElpKruBuX3DCsir8vKNtuwvPJGH5mHMsn
 lhLQ==
X-Gm-Message-State: AOJu0Yx/4mgo6KTSr3k67Gs137DP01NYP3eBDmJFQGYXNO0OS5tThdYF
 37dRZ687Flh4RZholYap8hYuPuUnaYx5zMMPKW2FRWAlSlRLCbNUy+BIH3jUwBd45vf9EZZrtr4
 U
X-Received: by 2002:a17:902:da86:b0:1f6:8235:dba7 with SMTP id
 d9443c01a7336-1fa1d6ad2d6mr102683915ad.69.1719340543290; 
 Tue, 25 Jun 2024 11:35:43 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/13] target/arm: Convert SUDOT, USDOT to decodetree
Date: Tue, 25 Jun 2024 11:35:29 -0700
Message-Id: <20240625183536.1672454-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (deferred)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: d8efX2TeTpE5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  3 +++
 target/arm/tcg/translate-a64.c | 35 ++++++++--------------------------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 7411d4ba97..8a0251f83c 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -949,6 +949,7 @@ SQRDMLSH_v      0.10 1110 ..0 ..... 10001 1 ..... ..... @qrrr_e
 
 SDOT_v          0.00 1110 100 ..... 10010 1 ..... ..... @qrrr_s
 UDOT_v          0.10 1110 100 ..... 10010 1 ..... ..... @qrrr_s
+USDOT_v         0.00 1110 100 ..... 10011 1 ..... ..... @qrrr_s
 
 ### Advanced SIMD scalar x indexed element
 
@@ -1026,6 +1027,8 @@ SQRDMLSH_vi     0.10 1111 10 .. .... 1111 . 0 ..... .....   @qrrx_s
 
 SDOT_vi         0.00 1111 10 .. .... 1110 . 0 ..... .....   @qrrx_s
 UDOT_vi         0.10 1111 10 .. .... 1110 . 0 ..... .....   @qrrx_s
+SUDOT_vi        0.00 1111 00 .. .... 1111 . 0 ..... .....   @qrrx_s
+USDOT_vi        0.00 1111 10 .. .... 1111 . 0 ..... .....   @qrrx_s
 
 # Floating-point conditional select
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f2e7d8d75c..9a658ca876 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5603,6 +5603,7 @@ static bool do_dot_vector(DisasContext *s, arg_qrrr_e *a,
 
 TRANS_FEAT(SDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_sdot_b)
 TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_b)
+TRANS_FEAT(USDOT_v, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usdot_b)
 
 /*
  * Advanced SIMD scalar/vector x indexed element
@@ -5937,6 +5938,10 @@ static bool do_dot_vector_idx(DisasContext *s, arg_qrrx_e *a,
 
 TRANS_FEAT(SDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_sdot_idx_b)
 TRANS_FEAT(UDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_udot_idx_b)
+TRANS_FEAT(SUDOT_vi, aa64_i8mm, do_dot_vector_idx, a,
+           gen_helper_gvec_sudot_idx_b)
+TRANS_FEAT(USDOT_vi, aa64_i8mm, do_dot_vector_idx, a,
+           gen_helper_gvec_usdot_idx_b)
 
 /*
  * Advanced SIMD scalar pairwise
@@ -10914,13 +10919,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     int rot;
 
     switch (u * 16 + opcode) {
-    case 0x03: /* USDOT */
-        if (size != MO_32) {
-            unallocated_encoding(s);
-            return;
-        }
-        feature = dc_isar_feature(aa64_i8mm, s);
-        break;
     case 0x04: /* SMMLA */
     case 0x14: /* UMMLA */
     case 0x05: /* USMMLA */
@@ -10964,6 +10962,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         break;
     default:
     case 0x02: /* SDOT (vector) */
+    case 0x03: /* USDOT */
     case 0x10: /* SQRDMLAH (vector) */
     case 0x11: /* SQRDMLSH (vector) */
     case 0x12: /* UDOT (vector) */
@@ -10979,10 +10978,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x3: /* USDOT */
-        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
-        return;
-
     case 0x04: /* SMMLA, UMMLA */
         gen_gvec_op4_ool(s, 1, rd, rn, rm, rd, 0,
                          u ? gen_helper_gvec_ummla_b
@@ -12058,14 +12053,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         break;
     case 0x0f:
         switch (size) {
-        case 0: /* SUDOT */
-        case 2: /* USDOT */
-            if (is_scalar || !dc_isar_feature(aa64_i8mm, s)) {
-                unallocated_encoding(s);
-                return;
-            }
-            size = MO_32;
-            break;
         case 1: /* BFDOT */
             if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
                 unallocated_encoding(s);
@@ -12082,6 +12069,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             size = MO_16;
             break;
         default:
+        case 0: /* SUDOT */
+        case 2: /* USDOT */
             unallocated_encoding(s);
             return;
         }
@@ -12190,18 +12179,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     switch (16 * u + opcode) {
     case 0x0f:
         switch (extract32(insn, 22, 2)) {
-        case 0: /* SUDOT */
-            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
-                             gen_helper_gvec_sudot_idx_b);
-            return;
         case 1: /* BFDOT */
             gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
                              gen_helper_gvec_bfdot_idx);
             return;
-        case 2: /* USDOT */
-            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
-                             gen_helper_gvec_usdot_idx_b);
-            return;
         case 3: /* BFMLAL{B,T} */
             gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, 0, (index << 1) | is_q,
                               gen_helper_gvec_bfmlal_idx);
-- 
2.34.1

