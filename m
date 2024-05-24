Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1993343ejb;
        Fri, 24 May 2024 16:23:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYGUTgt2ITuErQGmOp3EgI8NHv5WKuiCFq8VyqwarwhtRtMbX52bAf32E9d9Lh4XaE0jEMnNNib41ps0FP51ITu4O8DF7/
X-Google-Smtp-Source: AGHT+IHQBskLVzZMsdJNdT2ZWz/Cyhlr2GXNJsiFxDrd3Tl19rxa6aN3XWJ0jS8x+qe4YVw5RrKi
X-Received: by 2002:a05:620a:4113:b0:794:9b38:2312 with SMTP id af79cd13be357-794ab11260cmr424017785a.62.1716593025677;
        Fri, 24 May 2024 16:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593025; cv=none;
        d=google.com; s=arc-20160816;
        b=vrLWfj4+s39JMg3C4pGgtK3Iaik5dUnJ25Siaq96Pup59U4N9YWynaugKUnGG1F0FW
         7w0oxL9T8vejZu47TgrLKCv+/VJsnW4JotGv3wMBI0AGRAxbwuU4iF/LdNJ0m2hufb62
         xUyz4GEqWAn/QJ2pVnTUBsJkvqQqugMIytnrXZllCQtEeYFeGIz/GfAj9UxBm6+J6tAL
         iLaVCvaJqDM7La4/xKoZzE5F5NS8Zf8eytFvd8o6k676HSCcgw20QSM5QPsZ6Gui4p1+
         QHfD5B1S4uJZROv9eI35wQQj2fTGFySDnjcHg5TbREM9uN+KupOhahXYuW2F4T1+SxPv
         99Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BWmL6MxcnQuRiLjnWsKqiDG9Myh863kv81D/qPM1764=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=RUcpEzWlqzChaVEzm+g3E3fxgVqSko7rL86RhrhtLAkY7ul5AuE8BHNVyGywI/zsML
         eJfKX2gxqlGuXEk9fgrW+wHSIOAMvBCluIc5pvcjkcTRZkrKnK717rXY6dpTz+coxHqN
         NuJYkq0SqP2phnKeKp1RD21l1YaVAMS/P6aQdHkdeJAk4cLZyH4MFmocHir6oiPdbtnO
         a4W8anVjO1RQCCoHBwi9DdsPTF10t86dVB+2vTviICYfBLs3tCc6BkVvWowyMX2fkrhg
         gFJwGy62+B4+5l/yw+s/6i5KHbNwjGq78UXAj/lWNDlwOhjHnEk/CKbk3ORYnOQfKlQY
         eIVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HskoCrcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd0a822si262179185a.346.2024.05.24.16.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:23:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HskoCrcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEV-0006gH-AE; Fri, 24 May 2024 19:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEM-0006XT-Qv
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:47 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE8-0005kJ-7p
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:46 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f32864bcc7so24957445ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592891; x=1717197691; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWmL6MxcnQuRiLjnWsKqiDG9Myh863kv81D/qPM1764=;
 b=HskoCrczW56l+gT8FpLMPCGacsPD7lyDbkafvnhhlYIRO4aK5rpXyRt7uHUbuU1Czg
 WTWz2gi0K8S+KAfSL9pI/oEEGVJ+TsW3/8IqZXV1Y0djnEPnmQVs8lQhuPhMQggijSvv
 liIF4NNqmIRq9gGI3okeaZ4fiN+Anzq5Y6tw96+Oc6O82YUS5ttNcedj799dMuxY3vVV
 4pXRPWym7S90f9TEWqnul2epf+wneWY6BKP4+ZLxvXAH1XBGboTAPf8WRWWhXxbvKS4i
 BC62/LA6SrG+PK2h7aaqWIlWeDoHdN8A5hQ/v3e0KguUG1X5jFLaBquEoobjuM5y58P+
 grBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592891; x=1717197691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWmL6MxcnQuRiLjnWsKqiDG9Myh863kv81D/qPM1764=;
 b=DnDP49Wwpfdtkeypj/oYLgP5mj5mo6ndYkZKEZOfN4A9tzX1AaH+8JtJ8xb2tOI+El
 XOmKecCKY2WHpFSS6aHAzsNs9bHFcV68Hzs0IOmBSlmj0Yc3f0kOXkda8hFx8XEMpg5A
 btqUIk73gOETSkRl/fPl+C/sY8IxKyBBiuWRSDq9Of+u5HgoX6Ffx38Awwlnq4MW7Mm+
 yng+7L5YrXTSyUY1aesyMy8vTSAZ+7ONxjQfWuIhYoVuBOd5sMHIAdh5D+ieTkjJOqbW
 48qHTwCKLp1Y+JuEyyS7dc+1XRAENipk4ZUANo5hRSNWLr5z4YZkycqE6inKCTKkpVJH
 XjGw==
X-Gm-Message-State: AOJu0YyClpJdyujWhsJAaM2ULsK8UA09zRLGYWnYpGrTOnFwefb05QAX
 oFKiT7nZmOYNswZrBLy3HzUh9npouwsjdojrxveSRPimXix0ifM1WP9d1+yITpNkvdRZ5BBAGMS
 5
X-Received: by 2002:a17:902:e849:b0:1f2:ff65:d2e0 with SMTP id
 d9443c01a7336-1f449026bdamr45105035ad.42.1716592890685; 
 Fri, 24 May 2024 16:21:30 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/67] target/arm: Convert Cryptographic AES to decodetree
Date: Fri, 24 May 2024 16:20:23 -0700
Message-Id: <20240524232121.284515-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: tf5654kHkAYE

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      | 21 +++++++--
 target/arm/tcg/translate-a64.c | 86 +++++++++++++++-------------------
 2 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 0e7656fd15..1de09903dc 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -19,11 +19,17 @@
 # This file is processed by scripts/decodetree.py
 #
 
-&r               rn
-&ri              rd imm
-&rri_sf          rd rn imm sf
-&i               imm
+%rd             0:5
 
+&r              rn
+&ri             rd imm
+&rri_sf         rd rn imm sf
+&i              imm
+&qrr_e          q rd rn esz
+&qrrr_e         q rd rn rm esz
+
+@rr_q1e0        ........ ........ ...... rn:5 rd:5      &qrr_e q=1 esz=0
+@r2r_q1e0       ........ ........ ...... rm:5 rd:5      &qrrr_e rn=%rd q=1 esz=0
 
 ### Data Processing - Immediate
 
@@ -590,3 +596,10 @@ CPYFE           00 011 0 01100 ..... .... 01 ..... ..... @cpy
 CPYP            00 011 1 01000 ..... .... 01 ..... ..... @cpy
 CPYM            00 011 1 01010 ..... .... 01 ..... ..... @cpy
 CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
+
+### Cryptographic AES
+
+AESE            01001110 00 10100 00100 10 ..... .....  @r2r_q1e0
+AESD            01001110 00 10100 00101 10 ..... .....  @r2r_q1e0
+AESMC           01001110 00 10100 00110 10 ..... .....  @rr_q1e0
+AESIMC          01001110 00 10100 00111 10 ..... .....  @rr_q1e0
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8842ff634d..3894db4bee 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1313,6 +1313,34 @@ bool sme_enabled_check_with_svcr(DisasContext *s, unsigned req)
     return true;
 }
 
+/*
+ * Expanders for AdvSIMD translation functions.
+ */
+
+static bool do_gvec_op2_ool(DisasContext *s, arg_qrr_e *a, int data,
+                            gen_helper_gvec_2 *fn)
+{
+    if (!a->q && a->esz == MO_64) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_op2_ool(s, a->q, a->rd, a->rn, data, fn);
+    }
+    return true;
+}
+
+static bool do_gvec_op3_ool(DisasContext *s, arg_qrrr_e *a, int data,
+                            gen_helper_gvec_3 *fn)
+{
+    if (!a->q && a->esz == MO_64) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_op3_ool(s, a->q, a->rd, a->rn, a->rm, data, fn);
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -4560,6 +4588,15 @@ static bool trans_EXTR(DisasContext *s, arg_extract *a)
     return true;
 }
 
+/*
+ * Cryptographic AES
+ */
+
+TRANS_FEAT(AESE, aa64_aes, do_gvec_op3_ool, a, 0, gen_helper_crypto_aese)
+TRANS_FEAT(AESD, aa64_aes, do_gvec_op3_ool, a, 0, gen_helper_crypto_aesd)
+TRANS_FEAT(AESMC, aa64_aes, do_gvec_op2_ool, a, 0, gen_helper_crypto_aesmc)
+TRANS_FEAT(AESIMC, aa64_aes, do_gvec_op2_ool, a, 0, gen_helper_crypto_aesimc)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -13460,54 +13497,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Crypto AES
- *  31             24 23  22 21       17 16    12 11 10 9    5 4    0
- * +-----------------+------+-----------+--------+-----+------+------+
- * | 0 1 0 0 1 1 1 0 | size | 1 0 1 0 0 | opcode | 1 0 |  Rn  |  Rd  |
- * +-----------------+------+-----------+--------+-----+------+------+
- */
-static void disas_crypto_aes(DisasContext *s, uint32_t insn)
-{
-    int size = extract32(insn, 22, 2);
-    int opcode = extract32(insn, 12, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-    gen_helper_gvec_2 *genfn2 = NULL;
-    gen_helper_gvec_3 *genfn3 = NULL;
-
-    if (!dc_isar_feature(aa64_aes, s) || size != 0) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (opcode) {
-    case 0x4: /* AESE */
-        genfn3 = gen_helper_crypto_aese;
-        break;
-    case 0x6: /* AESMC */
-        genfn2 = gen_helper_crypto_aesmc;
-        break;
-    case 0x5: /* AESD */
-        genfn3 = gen_helper_crypto_aesd;
-        break;
-    case 0x7: /* AESIMC */
-        genfn2 = gen_helper_crypto_aesimc;
-        break;
-    default:
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-    if (genfn2) {
-        gen_gvec_op2_ool(s, true, rd, rn, 0, genfn2);
-    } else {
-        gen_gvec_op3_ool(s, true, rd, rd, rn, 0, genfn3);
-    }
-}
-
 /* Crypto three-reg SHA
  *  31             24 23  22  21 20  16  15 14    12 11 10 9    5 4    0
  * +-----------------+------+---+------+---+--------+-----+------+------+
@@ -13917,7 +13906,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e000400, 0xdfe08400, disas_simd_scalar_copy },
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
-    { 0x4e280800, 0xff3e0c00, disas_crypto_aes },
     { 0x5e000000, 0xff208c00, disas_crypto_three_reg_sha },
     { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
     { 0xce608000, 0xffe0b000, disas_crypto_three_reg_sha512 },
-- 
2.34.1

