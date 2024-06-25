Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp584864njc;
        Mon, 24 Jun 2024 22:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrL59uy2LahdgqssnoYCREI8HmMHYV38mS6JqXiM8QTwb9bjXQ8HW2R/8VlTP6fvPkkC9hPQ8Ct3anoD6g0WJMpu9EONDg
X-Google-Smtp-Source: AGHT+IFu3mAUZWw1H8qBcqTizmFf8bm4BdKVKCAg7Oi9JaChxiqPXO2StGKF904RrwnA1O2ZJzNi
X-Received: by 2002:a81:f20f:0:b0:646:5f0b:e54 with SMTP id 00721157ae682-6465f0b0e71mr21510307b3.8.1719292167915;
        Mon, 24 Jun 2024 22:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719292167; cv=none;
        d=google.com; s=arc-20160816;
        b=AbQiog+jzMRlnQodDvb11E/2Ni+TI03NkcltySrI3IppC4gIIJK6U66dIzvYzsgUdJ
         T0Ll6MAN1DbjLQcg0Sb7RNpjGGVVmiNlpiQcHduVfCyuTBNZX4lWrD6IV+wPe1yADAyt
         cpFqiVvE57yYJ1SpLRIU/Skm+yiivYd5NLmyzpr3ZOovkZx9+SnSy0l7d9snfxmR0WFV
         gwv5OtzleWYxSM7BoC6Mgn9j657FS7kAOTPArxfQbepD4Of7t/2fT+JjHU/askxISpjr
         nCw3TmuyHabcDje3KaoWTw92St1yyK9yWOqlu0ysQclDya7qBCZ5Iaedz/8iU4efQc5j
         dVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KOVwJ2HbyEXrwGcMTUooR/pqQ3FbdP38VzfLFDauipg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=zRBgBSyfwuOiZz6+ZSUSutP1RXsuH6EaWxMFqGuF/980hP4ZG7DjEfl+1wbUQyJ/pu
         woB/nyawjRGKq7qPSBtflj2KrN/GpCqh9BS7jcxxjWKwdZrrzZ2rC4Gmo6ez860lr7fV
         uN2VvaEEXvcGcJ4QOLhyw0k9c6qNDYH+go5sd+F2es1PPx6hEUipLuCb9yZpHXPvJsW8
         XlPDOaSDnM+wjB2FxCZtyeBo35bRUWkvH+VRkTMwAusCKZNT/1odVW+6WF/0pQxi4oM/
         25dpweKYasVpUvPbzbWFQIgN/OVZMgg3uKlUOoqb10ZHHKYweQBKUz4P7Xa/rfUsV0ja
         OCiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxH6fkxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c0a856si93449921cf.333.2024.06.24.22.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 22:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxH6fkxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLyPw-0001Dj-NI; Tue, 25 Jun 2024 01:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPu-0001B9-91
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:30 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPq-0001Z2-JA
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:30 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-717f17d7c63so2488236a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719292104; x=1719896904; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOVwJ2HbyEXrwGcMTUooR/pqQ3FbdP38VzfLFDauipg=;
 b=mxH6fkxe0GmKMb9/aug0CZJXdKyfjRY51f6Oktd8KC3H6t0jSpOIVZ/GhQ+yId5892
 nl6iE83aO01ZgU9PatqWoh4kHe31Cu0EKgE5V6mfxCddq72bbD5WpJwE1KQks5dhXZz9
 pn88Tz2hsRLGJAA/YH5NojLSTGi0KyHz7A/wzQzWwTcTIo3aHARLd9d2BKnkjX1toj+O
 Q5UktSNlrDka4pQuEASg+H02T0auXPbtL2ZHXSZUXH/urczMTaHKOkDdk45ZQxoOeglp
 y5y80qQ41ch+cr6vz29ZG8vgnfF2spUl3iI56GCBwPIQzBCC079P4sHVqU0EvFMe5W6p
 +4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719292104; x=1719896904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOVwJ2HbyEXrwGcMTUooR/pqQ3FbdP38VzfLFDauipg=;
 b=wVBiV+9b+XNJomwzqT27Fsd8qgMbhVQbEXUzZO+UcMMrqz5QnSaeUrWK3sVHHs1qhV
 M1mPtx3aYHPtdO5OmCMvgHGyiBP5gnVew+IksbZd9kybHHtK6Y0JtGe+gU9mWevk3Qm+
 qPJXZ5L3KsL8xHGYqVckHIJSe+X8EBkAsUFZ5JdcK7WVaF+1KkQBeV3v+5b7QgW9WZbb
 OnRFtq/Hymz8PxmWazrRcZSyIURqhJx7/KSU8Ih2i0YodbGicxd3BuolWAjzl5Wy9c++
 auXFLAdnQj9Od4eH5Oy4Hw5QrP+xjN34UNg2QR7VgW+maGLJUnMVCngHCHlP16ERAePD
 OjfQ==
X-Gm-Message-State: AOJu0Yy4/Ed6g4dIO40rbUW9jmqAwVwzmwRpfjrLWu5rBvJkqThDL+FT
 dKgRrBRM3zf+ZiiJTX9dLUtBvP+kV4yoCqpz7CCW6eag4pE/TEv2mjgvp5dghpY=
X-Received: by 2002:a05:6a20:30d5:b0:1b8:4107:ce4d with SMTP id
 adf61e73a8af0-1bcf7e76fcemr5326155637.19.1719292104433; 
 Mon, 24 Jun 2024 22:08:24 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbc72e9sm70843865ad.296.2024.06.24.22.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 22:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/13] target/arm: Convert FCMLA to decodetree
Date: Mon, 24 Jun 2024 22:08:09 -0700
Message-Id: <20240625050810.1475643-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625050810.1475643-1-richard.henderson@linaro.org>
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: Q3QcD4I7HRZ/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |   5 +
 target/arm/tcg/translate-a64.c | 241 ++++++++++-----------------------
 2 files changed, 76 insertions(+), 170 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f330919851..4b2a6ba302 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -960,6 +960,8 @@ USMMLA          0100 1110 100 ..... 10101 1 ..... ..... @rrr_q1e0
 FCADD_90        0.10 1110 ..0 ..... 11100 1 ..... ..... @qrrr_e
 FCADD_270       0.10 1110 ..0 ..... 11110 1 ..... ..... @qrrr_e
 
+FCMLA_v         0 q:1 10 1110 esz:2 0 rm:5 110 rot:2 1 rn:5 rd:5
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
@@ -1041,6 +1043,9 @@ USDOT_vi        0.00 1111 10 .. .... 1111 . 0 ..... .....   @qrrx_s
 BFDOT_vi        0.00 1111 01 .. .... 1111 . 0 ..... .....   @qrrx_s
 BFMLAL_vi       0.00 1111 11 .. .... 1111 . 0 ..... .....   @qrrx_h
 
+FCMLA_vi        0 q:1 10 1111 10 . rm:5 0 rot:2 1 . 0 rn:5 rd:5 esz=1 idx=%hl
+FCMLA_vi        0 q:1 10 1111 01 0 rm:5 0 rot:2 1 idx:1 0 rn:5 rd:5 esz=2
+
 # Floating-point conditional select
 
 FCSEL           0001 1110 .. 1 rm:5 cond:4 11 rn:5 rd:5     esz=%esz_hsd
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a1b338263f..0a54a9ef8f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5631,6 +5631,39 @@ static gen_helper_gvec_3_ptr * const f_vector_fcadd[3] = {
 TRANS_FEAT(FCADD_90, aa64_fcma, do_fp3_vector, a, 0, f_vector_fcadd)
 TRANS_FEAT(FCADD_270, aa64_fcma, do_fp3_vector, a, 1, f_vector_fcadd)
 
+static bool trans_FCMLA_v(DisasContext *s, arg_FCMLA_v *a)
+{
+    gen_helper_gvec_4_ptr *fn;
+
+    if (!dc_isar_feature(aa64_fcma, s)) {
+        return false;
+    }
+    switch (a->esz) {
+    case MO_64:
+        if (!a->q) {
+            return false;
+        }
+        fn = gen_helper_gvec_fcmlad;
+        break;
+    case MO_32:
+        fn = gen_helper_gvec_fcmlas;
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        fn = gen_helper_gvec_fcmlah;
+        break;
+    default:
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
+                          a->esz == MO_16, a->rot, fn);
+    }
+    return true;
+}
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -5985,6 +6018,36 @@ static bool trans_BFMLAL_vi(DisasContext *s, arg_qrrx_e *a)
     return true;
 }
 
+static bool trans_FCMLA_vi(DisasContext *s, arg_FCMLA_vi *a)
+{
+    gen_helper_gvec_4_ptr *fn;
+
+    if (!dc_isar_feature(aa64_fcma, s)) {
+        return false;
+    }
+    switch (a->esz) {
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        fn = gen_helper_gvec_fcmlah_idx;
+        break;
+    case MO_32:
+        if (!a->q && a->idx) {
+            return false;
+        }
+        fn = gen_helper_gvec_fcmlas_idx;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
+                          a->esz == MO_16, (a->idx << 2) | a->rot, fn);
+    }
+    return true;
+}
+
 /*
  * Advanced SIMD scalar pairwise
  */
@@ -10942,90 +11005,6 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
     }
 }
 
-/* AdvSIMD three same extra
- *  31   30  29 28       24 23  22  21 20  16  15 14    11  10 9  5 4  0
- * +---+---+---+-----------+------+---+------+---+--------+---+----+----+
- * | 0 | Q | U | 0 1 1 1 0 | size | 0 |  Rm  | 1 | opcode | 1 | Rn | Rd |
- * +---+---+---+-----------+------+---+------+---+--------+---+----+----+
- */
-static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
-{
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int opcode = extract32(insn, 11, 4);
-    int rm = extract32(insn, 16, 5);
-    int size = extract32(insn, 22, 2);
-    bool u = extract32(insn, 29, 1);
-    bool is_q = extract32(insn, 30, 1);
-    bool feature;
-    int rot;
-
-    switch (u * 16 + opcode) {
-    case 0x18: /* FCMLA, #0 */
-    case 0x19: /* FCMLA, #90 */
-    case 0x1a: /* FCMLA, #180 */
-    case 0x1b: /* FCMLA, #270 */
-        if (size == 0
-            || (size == 1 && !dc_isar_feature(aa64_fp16, s))
-            || (size == 3 && !is_q)) {
-            unallocated_encoding(s);
-            return;
-        }
-        feature = dc_isar_feature(aa64_fcma, s);
-        break;
-    default:
-    case 0x02: /* SDOT (vector) */
-    case 0x03: /* USDOT */
-    case 0x04: /* SMMLA */
-    case 0x05: /* USMMLA */
-    case 0x10: /* SQRDMLAH (vector) */
-    case 0x11: /* SQRDMLSH (vector) */
-    case 0x12: /* UDOT (vector) */
-    case 0x14: /* UMMLA */
-    case 0x1c: /* FCADD, #90 */
-    case 0x1d: /* BFMMLA */
-    case 0x1e: /* FCADD, #270 */
-    case 0x1f: /* BFDOT / BFMLAL */
-        unallocated_encoding(s);
-        return;
-    }
-    if (!feature) {
-        unallocated_encoding(s);
-        return;
-    }
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    switch (opcode) {
-    case 0x8: /* FCMLA, #0 */
-    case 0x9: /* FCMLA, #90 */
-    case 0xa: /* FCMLA, #180 */
-    case 0xb: /* FCMLA, #270 */
-        rot = extract32(opcode, 0, 2);
-        switch (size) {
-        case 1:
-            gen_gvec_op4_fpst(s, is_q, rd, rn, rm, rd, true, rot,
-                              gen_helper_gvec_fcmlah);
-            break;
-        case 2:
-            gen_gvec_op4_fpst(s, is_q, rd, rn, rm, rd, false, rot,
-                              gen_helper_gvec_fcmlas);
-            break;
-        case 3:
-            gen_gvec_op4_fpst(s, is_q, rd, rn, rm, rd, false, rot,
-                              gen_helper_gvec_fcmlad);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        return;
-
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
                                   int size, int rn, int rd)
 {
@@ -12001,10 +11980,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     bool is_long = false;
-    int is_fp = 0;
-    bool is_fp16 = false;
     int index;
-    TCGv_ptr fpst;
 
     switch (16 * u + opcode) {
     case 0x02: /* SMLAL, SMLAL2 */
@@ -12024,16 +12000,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x0b: /* SQDMULL, SQDMULL2 */
         is_long = true;
         break;
-    case 0x11: /* FCMLA #0 */
-    case 0x13: /* FCMLA #90 */
-    case 0x15: /* FCMLA #180 */
-    case 0x17: /* FCMLA #270 */
-        if (is_scalar || !dc_isar_feature(aa64_fcma, s)) {
-            unallocated_encoding(s);
-            return;
-        }
-        is_fp = 2;
-        break;
     default:
     case 0x00: /* FMLAL */
     case 0x01: /* FMLA */
@@ -12046,7 +12012,11 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x0e: /* SDOT */
     case 0x0f: /* SUDOT / BFDOT / USDOT / BFMLAL */
     case 0x10: /* MLA */
+    case 0x11: /* FCMLA #0 */
+    case 0x13: /* FCMLA #90 */
     case 0x14: /* MLS */
+    case 0x15: /* FCMLA #180 */
+    case 0x17: /* FCMLA #270 */
     case 0x18: /* FMLAL2 */
     case 0x19: /* FMULX */
     case 0x1c: /* FMLSL2 */
@@ -12057,46 +12027,12 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         return;
     }
 
-    switch (is_fp) {
-    case 1: /* normal fp */
-        unallocated_encoding(s); /* in decodetree */
-        return;
-
-    case 2: /* complex fp */
-        /* Each indexable element is a complex pair.  */
-        size += 1;
-        switch (size) {
-        case MO_32:
-            if (h && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            is_fp16 = true;
-            break;
-        case MO_64:
-            break;
-        default:
-            unallocated_encoding(s);
-            return;
-        }
-        break;
-
-    default: /* integer */
-        switch (size) {
-        case MO_8:
-        case MO_64:
-            unallocated_encoding(s);
-            return;
-        }
-        break;
-    }
-    if (is_fp16 && !dc_isar_feature(aa64_fp16, s)) {
-        unallocated_encoding(s);
-        return;
-    }
-
     /* Given MemOp size, adjust register and indexing.  */
     switch (size) {
+    case MO_8:
+    case MO_64:
+        unallocated_encoding(s);
+        return;
     case MO_16:
         index = h << 2 | l << 1 | m;
         break;
@@ -12104,14 +12040,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         index = h << 1 | l;
         rm |= m << 4;
         break;
-    case MO_64:
-        if (l || !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-        index = h;
-        rm |= m << 4;
-        break;
     default:
         g_assert_not_reached();
     }
@@ -12120,32 +12048,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         return;
     }
 
-    if (is_fp) {
-        fpst = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16 : FPST_FPCR);
-    } else {
-        fpst = NULL;
-    }
-
-    switch (16 * u + opcode) {
-    case 0x11: /* FCMLA #0 */
-    case 0x13: /* FCMLA #90 */
-    case 0x15: /* FCMLA #180 */
-    case 0x17: /* FCMLA #270 */
-        {
-            int rot = extract32(insn, 13, 2);
-            int data = (index << 2) | rot;
-            tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
-                               vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm),
-                               vec_full_reg_offset(s, rd), fpst,
-                               is_q ? 16 : 8, vec_full_reg_size(s), data,
-                               size == MO_64
-                               ? gen_helper_gvec_fcmlas_idx
-                               : gen_helper_gvec_fcmlah_idx);
-        }
-        return;
-    }
-
     if (size == 3) {
         g_assert_not_reached();
     } else if (!is_long) {
@@ -12407,7 +12309,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
  */
 static const AArch64DecodeTable data_proc_simd[] = {
     /* pattern  ,  mask     ,  fn                        */
-    { 0x0e008400, 0x9f208400, disas_simd_three_reg_same_extra },
     { 0x0e200000, 0x9f200c00, disas_simd_three_reg_diff },
     { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
     { 0x0e300800, 0x9f3e0c00, disas_simd_across_lanes },
-- 
2.34.1

