Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1269502ejc;
        Sun, 5 May 2024 18:04:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUd39dVX/JWsbD4wOX5yT2v/2ZZOQuDnhlXlxc3tNb9URCVAmBBHbSo6dtleCj+tnCPDiRPZXQbJSv8jf3Ok3t/n6om0fCl
X-Google-Smtp-Source: AGHT+IFfK5KDiKZLpdzWg9JKueq1dsDwBivvkEQWtLxe5b27zurqghkWGwyBnCyKLxlqfAtlByek
X-Received: by 2002:a05:6870:7188:b0:23c:550:ca37 with SMTP id d8-20020a056870718800b0023c0550ca37mr11119173oah.42.1714957494229;
        Sun, 05 May 2024 18:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957494; cv=none;
        d=google.com; s=arc-20160816;
        b=0V4WKb8pBE/LF66Gzu+YMCwiFV9pD9PqZTgvoAxuNYANNxdVD1xoTpnjSxBld43374
         59+XvFYpOZW1/SMHcXlZ3lfA4++/b83VG3alhyrLDH2qNII2sfA0wfVN1ytIGwXL1Tjn
         9varFPnkDCEKK/lwNwPzP4VtMAlmGduQusES2c7YYrI+nqQHS9lb1372D6LoYAfr3Md0
         yWAhiueCliA9vtknKQiK6fR5NVJe+K0BKKeduoOrfv+Uqm2sE+G9ByQcEuewO7dUSo/R
         4eoa8lhpxrXgDVAm3NZSJOXcrUgeuVNcyud60KW64ATFOAE2vN6hIKriorVc9WV7CwFv
         jgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8RJ421IoYsEikolqw17j6jFWLjJ63gDN6hhStPiCmzU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=B5wU4NHWZrPb0IZh0kUedaW9W7LlSYVZ/jaA/w5ceQZ0U3894GNwOhaLGJPlc459Rz
         6tMvc5P5br9XvnjUTwDGdBfdLXYE1i7aB98ZyZMQZA5DUQzORrFoRIxmYhdSRQ4JXAR2
         IPCKV2GjMoneYNDGnG5Tnsd22c89bMltM8S4IxyDXRyhqe5F7j1nAdrCJR3DxnPZA6FO
         SjV7RpL60FAqAnBepNI5oT5quytBZc8br0+ISDttKVeIqrBx59nZPk2kLxYqcGnInP2h
         WJkul/mMXY49sMaNEWronLyNLZX/6R3KP6pU2REU46Izc+xEWSAOSqwaHUT5bjzhZxcl
         I/Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xUK1CAoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05620a450a00b00790db0e8aafsi9093527qkp.130.2024.05.05.18.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xUK1CAoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mmL-0007ip-QM; Sun, 05 May 2024 21:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmI-0007gT-OT
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mm8-0002RS-1Z
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ab1ddfded1so1343085a91.1
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957453; x=1715562253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8RJ421IoYsEikolqw17j6jFWLjJ63gDN6hhStPiCmzU=;
 b=xUK1CAoiw/jZKHVMlejO79YQE8HbYG6W8853p9c47DVTKhEf40NbZHRceibC5a27nA
 hlwZFfsmOsR5O1j3yqTOftBHhosx4Op97XlBxpAOkbTUkaW17ggQbZ5GUlPGiaS5qY1e
 2N7v6y46q/Y9Fqiddvi3l5U1CrxmQIKATrLQQ/RbK+l9yRia5JjTnJCM5qRVk14NfVMk
 s70zHFDlZOXJ9qNNJY9lOWjMLqHj2+lNpySCmAZ42etB0WHo33wACD8y1gnfcypV+Vri
 ZuqMhxYOhtFucvJBj6d/ozdhGl3gWr1ePfHhwzP5di10wzo7onPaDPKjTV9TJTxIA36K
 /Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957453; x=1715562253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8RJ421IoYsEikolqw17j6jFWLjJ63gDN6hhStPiCmzU=;
 b=FgO1T60gnJcnuLL7pO8Xe9jwhJ2/k5pBFfe3aK1KJRqzRw0LKldSym/Dbkqc4Z2rJs
 f0ecCxg5AG7AVK6iuURRwPm2ZZvNnPJ412a82oNZHtxGqVw7A+O1QaMJjDMjHNpV+Ok6
 /byfQ7MzRouDy2G3Qt/grPKqLhhPz7B4eIjaYdwbq+ra57x1fH0hyFg+8LOfisqRlvYN
 yvXnFojSK2w4iKFlkIVGK+JRrwiB/+Jm6BXPYq33V7sdkjOPwA/rPuUlgpSMYZ3GbeOV
 iLYwgkPFFHDhVXTb4DLevKPQbq/92/vor1lTKilGH28qezp98f4huvF+jEpNZcZUV2Rt
 Tiyg==
X-Gm-Message-State: AOJu0Yw1BoeIkMefNRf1tITsppS3OVDjecgKdYeDMnvXzg/20n0EwMYb
 P3QstDJxahZBO+elKjMaGgbofbo+3z91G5AbcqD7+XsIQcuPc+FH7euvRb1AYhIxBJTQC5t2BZ7
 d
X-Received: by 2002:a17:90a:ac03:b0:2b1:782:8827 with SMTP id
 o3-20020a17090aac0300b002b107828827mr8146701pjq.20.1714957453507; 
 Sun, 05 May 2024 18:04:13 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/57] target/arm: Convert Cryptographic 3-register,
 imm2 to decodetree
Date: Sun,  5 May 2024 18:03:15 -0700
Message-Id: <20240506010403.6204-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: 192w2ak2AOls

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      | 10 ++++++++
 target/arm/tcg/translate-a64.c | 43 ++++++++++------------------------
 2 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index ef6902e86a..1292312a7f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -644,3 +644,13 @@ SM4E            1100 1110 110 00000 100001 ..... .....  @r2r_q1e0
 EOR3            1100 1110 000 ..... 0 ..... ..... ..... @rrrr_q1e3
 BCAX            1100 1110 001 ..... 0 ..... ..... ..... @rrrr_q1e3
 SM3SS1          1100 1110 010 ..... 0 ..... ..... ..... @rrrr_q1e3
+
+### Cryptographic three-register, imm2
+
+&crypto3i       rd rn rm imm
+@crypto3i       ........ ... rm:5 .. imm:2 .. rn:5 rd:5 &crypto3i
+
+SM3TT1A         11001110 010 ..... 10 .. 00 ..... ..... @crypto3i
+SM3TT1B         11001110 010 ..... 10 .. 01 ..... ..... @crypto3i
+SM3TT2A         11001110 010 ..... 10 .. 10 ..... ..... @crypto3i
+SM3TT2B         11001110 010 ..... 10 .. 11 ..... ..... @crypto3i
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a20da75423..219a666cbb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4677,6 +4677,18 @@ static bool trans_SM3SS1(DisasContext *s, arg_SM3SS1 *a)
     return true;
 }
 
+static bool do_crypto3i(DisasContext *s, arg_crypto3i *a, gen_helper_gvec_3 *fn)
+{
+    if (fp_access_check(s)) {
+        gen_gvec_op3_ool(s, true, a->rd, a->rn, a->rm, a->imm, fn);
+    }
+    return true;
+}
+TRANS_FEAT(SM3TT1A, aa64_sm3, do_crypto3i, a, gen_helper_crypto_sm3tt1a)
+TRANS_FEAT(SM3TT1B, aa64_sm3, do_crypto3i, a, gen_helper_crypto_sm3tt1b)
+TRANS_FEAT(SM3TT2A, aa64_sm3, do_crypto3i, a, gen_helper_crypto_sm3tt2a)
+TRANS_FEAT(SM3TT2B, aa64_sm3, do_crypto3i, a, gen_helper_crypto_sm3tt2b)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -13598,36 +13610,6 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
                  vec_full_reg_size(s));
 }
 
-/* Crypto three-reg imm2
- *  31                   21 20  16 15  14 13 12  11  10  9    5 4    0
- * +-----------------------+------+-----+------+--------+------+------+
- * | 1 1 0 0 1 1 1 0 0 1 0 |  Rm  | 1 0 | imm2 | opcode |  Rn  |  Rd  |
- * +-----------------------+------+-----+------+--------+------+------+
- */
-static void disas_crypto_three_reg_imm2(DisasContext *s, uint32_t insn)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_crypto_sm3tt1a, gen_helper_crypto_sm3tt1b,
-        gen_helper_crypto_sm3tt2a, gen_helper_crypto_sm3tt2b,
-    };
-    int opcode = extract32(insn, 10, 2);
-    int imm2 = extract32(insn, 12, 2);
-    int rm = extract32(insn, 16, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-
-    if (!dc_isar_feature(aa64_sm3, s)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    gen_gvec_op3_ool(s, true, rd, rn, rm, imm2, fns[opcode]);
-}
-
 /* C3.6 Data processing - SIMD, inc Crypto
  *
  * As the decode gets a little complex we are using a table based
@@ -13657,7 +13639,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
     { 0xce800000, 0xffe00000, disas_crypto_xar },
-    { 0xce408000, 0xffe0c000, disas_crypto_three_reg_imm2 },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
     { 0x5e400400, 0xdf60c400, disas_simd_scalar_three_reg_same_fp16 },
-- 
2.34.1

