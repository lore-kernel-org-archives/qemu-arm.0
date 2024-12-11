Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4198885njb;
        Wed, 11 Dec 2024 08:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLIXp6dMCz3DA3VC8cbKprxaFJJi1XKGcXwsStPUVVj4XQbExGkgSD3qdzvqMCXqVLkCrvQavKD1a8hw==@linaro.org
X-Google-Smtp-Source: AGHT+IERUKRjGBfJS1q9qY7InRtuPs8tMiTStVCgcqdReZytsUM3cdbhUfkh1fovrfFJz93E46id
X-Received: by 2002:a05:6214:246d:b0:6d8:a64d:da51 with SMTP id 6a1803df08f44-6d9348d2129mr63094086d6.8.1733935530762;
        Wed, 11 Dec 2024 08:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935530; cv=none;
        d=google.com; s=arc-20240605;
        b=WkBptK8tQedPbD62iw+ow0ephTs9aGBFXAWxgcANYwjG+syvU+0ATWcIV8Su4Mfnkw
         VsMAwK7UZUP2FvorDg75oqv4Jvqm/MJFk6U2oD9WBQuE3qtbRPFNjVxKnhDhD/W3ySLW
         r1V9DLsINQ2PEewlwUsgUerZ1SdyBBm7nbaIdTxCDB1swow/IdEw1DDtRw3X8NsPxgzK
         q1DlDrb6zXPSt5l0VJh/WxCz8hNfIit95AUEncl2Z6KJnjFPKiPPo3qJKQW5bPZ+Ka2S
         Ho6faVIOZWC22vdmfhrumwX9Bf7/SW9MFxlc3Ne1wAZgUh0dNKKU++OtrOt4qZCfQyrj
         xacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZntTIOGg/1bzhdSiC1UurASxEDoLtQtjFGk9EIblI20=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=LzUA6kGoR22zk9cMXLOV1eHdfemXmUeNimGplGv6RKq5jCj+DF9qVpna5s2YIIuYo5
         TXQshC6s4emIsItqg56rVcVZjzHrC1pbIFSo34J27kWlG+bvDiQcX1suremiSmxY5XQ1
         90WgjsCSR/wX48qG0lC1z8HVjT2WnwulBE2E6C3AjPzRlrnLVxchHThDQSmXWWvJo7b+
         qzK2aY9+uSp2gqcrWg8BROi1fpNNwkBXYdMoTZozv5nRsF8YBDFAwxE1+DB4JOn1w3n8
         67BGj6tI3zktK+oEPslivscfTuBXSwLKOsUZzh9Ku7IfcD5NBKu+zT0QLpd6crTvi+hn
         z74w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2boiI6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa07e42si176884456d6.239.2024.12.11.08.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:45:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2boiI6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPhZ-0000m6-JF; Wed, 11 Dec 2024 11:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhS-0000NB-KR
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:34 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhQ-0002DV-7O
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:34 -0500
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6d8f916b40bso59521176d6.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934991; x=1734539791; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZntTIOGg/1bzhdSiC1UurASxEDoLtQtjFGk9EIblI20=;
 b=p2boiI6BDnlvTXf9XEPGlqyrfyLTT74mWcdfgQzuTGjKselph2HmMv7pT0l62JIL9G
 vIg5EScuYYT//T4wqrPB01VBujIN05LrTd6KAZQbZvpQp3eArqeKLsez1OtI2Yecrj5L
 Gi1n7+JJ8IQLOpo+JxANDq2wT2P2RQaAHXiUBTtZGdmcYA/7EscM8MXc0h1zNl1a6/OD
 x73kxhYrkAYkwadQBOy6cHOiBZ+qQET3Xp4p8JQdYr10F5ArFhzZDsQ0FtZ6PspE1VeA
 CVEbbdoJ9SG0o6xxKB7WF4jqGHZfqzj54DV9ujGWsPVnkJ7uFXpQm6CfWVefRwcyJ6fj
 ie0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934991; x=1734539791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZntTIOGg/1bzhdSiC1UurASxEDoLtQtjFGk9EIblI20=;
 b=YG/dYXNcLCSmakc6UOdUkvfvZFmIAz4uqhLXc67Oxkj+CkKofgafv0Kg2ooFF3Pa9h
 9CouxSmDOxDHDpoEP+WdN4/0l+xm+3yF1KNx+SeSpipcJr5GSq+CItrz5BVAHYWYN2jO
 qYO/22f1n7f1e8YV6AuQ3FBG62beimtkFLz5riuFSj1O7t3jH7HU0UJdOXnsNChtBBXW
 z+UaT/3G6bWgK2eN8g76vUH9mfPeng4hYJfYmAO2Wklot69M1ypGKc62HfdhCoLXdWoS
 zpogz30+k7w3DbJYx9DXi8qAGp6RODL0sYtuLWcah07bLRP2aVbagsMQ56a2RmawQFSo
 KKJA==
X-Gm-Message-State: AOJu0YwxMEGGGm1HgR2IXCMrhM9lNBhK0JoVA+G+1w8hY8H3Gtr2vX0u
 MmL+kj0woUAuZJ4XOBoXX8mM5yucIjFQRz0mHVJEyZNSEibucELQ/PgvTUyBq8Q=
X-Gm-Gg: ASbGncuqfothoxag2vvrV43+gJyAQpKL1bo3JDO8ARIHrqXIRxvjSHBZkGWBuvFljgo
 CD24nMNdrHqfIBBx8/8+eQNAG3HjNaHIqYGQe54GNIiKGAGW8hOtM64e68KnU74Bgdja8l0QjaQ
 7V3xSrDRf/yLbGYyDiQJmYlCIVOTSLS2Y9yTjWE9Bvxy5iiMKotSfxCh/8SsOBdiISkXGQH1N6Y
 OfyRusthSrSnOAPIvFbRKirPxTRPAdgCscIfaXcQVFael+zNhFY0yZlIW3Etw==
X-Received: by 2002:a05:6214:401c:b0:6d4:18ce:117f with SMTP id
 6a1803df08f44-6d934aeda1emr48974016d6.20.1733934991280; 
 Wed, 11 Dec 2024 08:36:31 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 52/69] target/arm: Convert SHLL to decodetree
Date: Wed, 11 Dec 2024 10:30:19 -0600
Message-ID: <20241211163036.2297116-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
X-TUID: lIr64qCAFxyC

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 75 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      |  2 +
 2 files changed, 40 insertions(+), 37 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1c454a37f4..c5d456de3b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9113,6 +9113,43 @@ static ArithOneOp * const f_vector_bfcvtn[] = {
 };
 TRANS_FEAT(BFCVTN_v, aa64_bf16, do_2misc_narrow_vector, a, f_vector_bfcvtn)
 
+static bool trans_SHLL_v(DisasContext *s, arg_qrr_e *a)
+{
+    static NeonGenWidenFn * const widenfns[3] = {
+        gen_helper_neon_widen_u8,
+        gen_helper_neon_widen_u16,
+        tcg_gen_extu_i32_i64,
+    };
+    NeonGenWidenFn *widenfn;
+    TCGv_i64 tcg_res[2];
+    TCGv_i32 tcg_op;
+    int part, pass;
+
+    if (a->esz == MO_64) {
+        return false;
+    }
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    tcg_op = tcg_temp_new_i32();
+    widenfn = widenfns[a->esz];
+    part = a->q ? 2 : 0;
+
+    for (pass = 0; pass < 2; pass++) {
+        read_vec_element_i32(s, tcg_op, a->rn, part + pass, MO_32);
+        tcg_res[pass] = tcg_temp_new_i64();
+        widenfn(tcg_res[pass], tcg_op);
+        tcg_gen_shli_i64(tcg_res[pass], tcg_res[pass], 8 << a->esz);
+    }
+
+    for (pass = 0; pass < 2; pass++) {
+        write_vec_element(s, tcg_res[pass], a->rd, pass, MO_64);
+    }
+    return true;
+}
+
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9901,33 +9938,6 @@ static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
     }
 }
 
-static void handle_shll(DisasContext *s, bool is_q, int size, int rn, int rd)
-{
-    /* Implement SHLL and SHLL2 */
-    int pass;
-    int part = is_q ? 2 : 0;
-    TCGv_i64 tcg_res[2];
-
-    for (pass = 0; pass < 2; pass++) {
-        static NeonGenWidenFn * const widenfns[3] = {
-            gen_helper_neon_widen_u8,
-            gen_helper_neon_widen_u16,
-            tcg_gen_extu_i32_i64,
-        };
-        NeonGenWidenFn *widenfn = widenfns[size];
-        TCGv_i32 tcg_op = tcg_temp_new_i32();
-
-        read_vec_element_i32(s, tcg_op, rn, part + pass, MO_32);
-        tcg_res[pass] = tcg_temp_new_i64();
-        widenfn(tcg_res[pass], tcg_op);
-        tcg_gen_shli_i64(tcg_res[pass], tcg_res[pass], 8 << size);
-    }
-
-    for (pass = 0; pass < 2; pass++) {
-        write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-    }
-}
-
 /* AdvSIMD two reg misc
  *   31  30  29 28       24 23  22 21       17 16    12 11 10 9    5 4    0
  * +---+---+---+-----------+------+-----------+--------+-----+------+------+
@@ -9948,16 +9958,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0x13: /* SHLL, SHLL2 */
-        if (u == 0 || size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_shll(s, is_q, size, rn, rd);
-        return;
     case 0xc ... 0xf:
     case 0x16 ... 0x1f:
     {
@@ -10118,6 +10118,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
     case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
+    case 0x13: /* SHLL, SHLL2 */
     case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
         unallocated_encoding(s);
         return;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d8902dfb22..ec0d46a563 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1685,3 +1685,5 @@ UQXTN_v         0.10 1110 ..1 00001 01001 0 ..... .....     @qrr_e
 FCVTN_v         0.00 1110 0.1 00001 01101 0 ..... .....     @qrr_hs
 FCVTXN_v        0.10 1110 011 00001 01101 0 ..... .....     @qrr_s
 BFCVTN_v        0.00 1110 101 00001 01101 0 ..... .....     @qrr_h
+
+SHLL_v          0.10 1110 ..1 00001 00111 0 ..... .....     @qrr_e
-- 
2.43.0

