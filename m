Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1993428ejb;
        Fri, 24 May 2024 16:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuwgx7l3r24ir7iDnuYHD9KFurhN6h9eBxB7AKfeggbHWlei5oQOWUbuCqTYBWGmg1iXe6kKIEaZtzi+dgHLXoB0jgHqpc
X-Google-Smtp-Source: AGHT+IH5TfJwBJyMpxjH2eo3H4Dvy5B3z1+Dtp9Nra4FtzrNi0thw9qcxCG2ccnhqIlxDakTXiGv
X-Received: by 2002:a05:6214:5d11:b0:6ab:891c:54e9 with SMTP id 6a1803df08f44-6abcd0fadaamr32258566d6.35.1716593040054;
        Fri, 24 May 2024 16:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593040; cv=none;
        d=google.com; s=arc-20160816;
        b=c4j+I2OUfNEtO9NSBRLdGFLki73bJJIJezOALBtXi+J0je8BBDlkCD01k+akXQ2Xvc
         NJTBva7hnSbbWvUSw5SZCFL/2Mf6eYoxInhHsuC5M06/uQszqv8j9Ep+fiATf7ViVxLR
         va9Kq40BFV0D4ESlL+WmBqFMn6zaR8P/wiwrwNNLFfQ7fKFdxV96rfHepX9605H0q0FQ
         sdhzrPuCQCR1ETJXJ/GIfQtkShuuzWCnEzV+FGhWw2lm2x5g3EsrDsvH8v2C1q8nksFi
         utrF5OVoQvEtanjq+Vwd+L+Brn7lvKTfOOaDrd8v7kWiM+RdblXs3dx7JXQCDwf5N7MM
         5J5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=J2dPDbcfetYJQKypEcJdVjwxBjIU4IfpwItkA10fe4A=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=YnRkGm0MtiYKbS1nGpwnHguGXq62Hz3x08QNzuhH+hpWUGb02I8kP+hYzoD9Y5uwGQ
         0YDRbTeBAENGi8PQuHP5jzg4bcZPu4BgA8XIZwxKqoP3C/0i5pXts0zbHihvCim1YmKY
         5GwDBLDMpwLVaHWSyOYsYL4ArMtSRoqTWPF3khr3HZQLgbM+9S1sXGV2kKaR9P6cxN9E
         wgHo20kTDu0dUwMZ+eC4kYytKnAY3eTjSzhGIh9JPVqiGx/5E4oPoKNd8olWv62vzQbv
         9soKZGppv57lFhrk+R1RstEFGD7pBehk6nWZofCp3KiCQ3ahOJxUaO1zTy4GtRiBU6gH
         6jrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D+jj2pc6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac06f4f535si26168566d6.17.2024.05.24.16.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D+jj2pc6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sAeEL-0006W9-If; Fri, 24 May 2024 19:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeED-0006Sk-3k
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:21:37 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE8-0005kZ-Ut
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:21:36 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f3434c36baso16838595ad.2
 for <qemu-devel@nongnu.org>; Fri, 24 May 2024 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592892; x=1717197692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J2dPDbcfetYJQKypEcJdVjwxBjIU4IfpwItkA10fe4A=;
 b=D+jj2pc6L9dMqJBKh8eziAxPbF/WU39rp+s5UAknR+rpCyarcxmA89spfvrTSY03Xo
 XzBW1S8aBDWI5HUDJRtY42VSbCHHVXtjvh+tlJR/pBhfReR6epuPSnMun0f0sls5SbcN
 tqlA8ZJ8NKEXMZsjZgcoL+JYIZXeDj8NgSZ9DPfBXr+bH9OrSy2htzlC6T4AvlJ6seDl
 Fxp9ZuUGfpwvnRUvq+KUpyNEwIwcQIV2SKtuncwnQ50pUGGDDgs2poZfjj0RyFiMJiQv
 zHFUY3wa84y2MibV0s6DQS6DUD2S1nCWc4gEd6/pTaxwyxd1LWVqFitWZoXIdQW+uZsN
 0j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592892; x=1717197692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J2dPDbcfetYJQKypEcJdVjwxBjIU4IfpwItkA10fe4A=;
 b=gyuAXrgkj/m0rys1YiD4qzGdbcHzHwgNg4PWsuY86WN/j14Gd2aXOGrDnRxqiNEaTO
 5hy/BJmls8moI9fZUI8YV7x/CxyqSF89t73mOD9uU9AuTL/0pTt+eZzUjd2lRLHtgR1s
 vnJygeu+661H/9WzI1QxO/T5j/j//DURhQ3JvnXWVhSyWj2DfmOs5t/GpggQPmMxYU8C
 0blzV5CcJ/Sj7zp1gVfa1bPwNS3qY959kUVBjZCiys6rlMbqDpz8zL+poFdpSO4aMiiU
 XSYb/o1Kh3ESZWw2PEZPmXvmECSKHKFkA7eCXNnFH9naFBy9+ydhw35OyPcatzLcFSzl
 LUVA==
X-Gm-Message-State: AOJu0YzIZg8SI9EtqrOsIslJZ9hC5Dt054Xoo+Icr/8p2iASTszjWKMX
 L6DE1uo+yA7cZZCM3y8DILSznPTWFsX1VJmYAsqJMqVkOrOGyJCckiIEUmu4jdJrLBXumIqwXww
 v
X-Received: by 2002:a17:902:654e:b0:1f3:375f:3bb8 with SMTP id
 d9443c01a7336-1f448839297mr30292395ad.41.1716592891576; 
 Fri, 24 May 2024 16:21:31 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/67] target/arm: Convert Cryptographic 3-register SHA to
 decodetree
Date: Fri, 24 May 2024 16:20:24 -0700
Message-Id: <20240524232121.284515-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
X-TUID: ZddltZUgnfpc

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      | 11 +++++
 target/arm/tcg/translate-a64.c | 78 +++++-----------------------------
 2 files changed, 21 insertions(+), 68 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1de09903dc..7590659ee6 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -30,6 +30,7 @@
 
 @rr_q1e0        ........ ........ ...... rn:5 rd:5      &qrr_e q=1 esz=0
 @r2r_q1e0       ........ ........ ...... rm:5 rd:5      &qrrr_e rn=%rd q=1 esz=0
+@rrr_q1e0       ........ ... rm:5 ...... rn:5 rd:5      &qrrr_e q=1 esz=0
 
 ### Data Processing - Immediate
 
@@ -603,3 +604,13 @@ AESE            01001110 00 10100 00100 10 ..... .....  @r2r_q1e0
 AESD            01001110 00 10100 00101 10 ..... .....  @r2r_q1e0
 AESMC           01001110 00 10100 00110 10 ..... .....  @rr_q1e0
 AESIMC          01001110 00 10100 00111 10 ..... .....  @rr_q1e0
+
+### Cryptographic three-register SHA
+
+SHA1C           0101 1110 000 ..... 000000 ..... .....  @rrr_q1e0
+SHA1P           0101 1110 000 ..... 000100 ..... .....  @rrr_q1e0
+SHA1M           0101 1110 000 ..... 001000 ..... .....  @rrr_q1e0
+SHA1SU0         0101 1110 000 ..... 001100 ..... .....  @rrr_q1e0
+SHA256H         0101 1110 000 ..... 010000 ..... .....  @rrr_q1e0
+SHA256H2        0101 1110 000 ..... 010100 ..... .....  @rrr_q1e0
+SHA256SU1       0101 1110 000 ..... 011000 ..... .....  @rrr_q1e0
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3894db4bee..5bef39d4e7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4589,7 +4589,7 @@ static bool trans_EXTR(DisasContext *s, arg_extract *a)
 }
 
 /*
- * Cryptographic AES
+ * Cryptographic AES, SHA
  */
 
 TRANS_FEAT(AESE, aa64_aes, do_gvec_op3_ool, a, 0, gen_helper_crypto_aese)
@@ -4597,6 +4597,15 @@ TRANS_FEAT(AESD, aa64_aes, do_gvec_op3_ool, a, 0, gen_helper_crypto_aesd)
 TRANS_FEAT(AESMC, aa64_aes, do_gvec_op2_ool, a, 0, gen_helper_crypto_aesmc)
 TRANS_FEAT(AESIMC, aa64_aes, do_gvec_op2_ool, a, 0, gen_helper_crypto_aesimc)
 
+TRANS_FEAT(SHA1C, aa64_sha1, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha1c)
+TRANS_FEAT(SHA1P, aa64_sha1, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha1p)
+TRANS_FEAT(SHA1M, aa64_sha1, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha1m)
+TRANS_FEAT(SHA1SU0, aa64_sha1, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha1su0)
+
+TRANS_FEAT(SHA256H, aa64_sha256, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha256h)
+TRANS_FEAT(SHA256H2, aa64_sha256, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha256h2)
+TRANS_FEAT(SHA256SU1, aa64_sha256, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha256su1)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -13497,72 +13506,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Crypto three-reg SHA
- *  31             24 23  22  21 20  16  15 14    12 11 10 9    5 4    0
- * +-----------------+------+---+------+---+--------+-----+------+------+
- * | 0 1 0 1 1 1 1 0 | size | 0 |  Rm  | 0 | opcode | 0 0 |  Rn  |  Rd  |
- * +-----------------+------+---+------+---+--------+-----+------+------+
- */
-static void disas_crypto_three_reg_sha(DisasContext *s, uint32_t insn)
-{
-    int size = extract32(insn, 22, 2);
-    int opcode = extract32(insn, 12, 3);
-    int rm = extract32(insn, 16, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-    gen_helper_gvec_3 *genfn;
-    bool feature;
-
-    if (size != 0) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (opcode) {
-    case 0: /* SHA1C */
-        genfn = gen_helper_crypto_sha1c;
-        feature = dc_isar_feature(aa64_sha1, s);
-        break;
-    case 1: /* SHA1P */
-        genfn = gen_helper_crypto_sha1p;
-        feature = dc_isar_feature(aa64_sha1, s);
-        break;
-    case 2: /* SHA1M */
-        genfn = gen_helper_crypto_sha1m;
-        feature = dc_isar_feature(aa64_sha1, s);
-        break;
-    case 3: /* SHA1SU0 */
-        genfn = gen_helper_crypto_sha1su0;
-        feature = dc_isar_feature(aa64_sha1, s);
-        break;
-    case 4: /* SHA256H */
-        genfn = gen_helper_crypto_sha256h;
-        feature = dc_isar_feature(aa64_sha256, s);
-        break;
-    case 5: /* SHA256H2 */
-        genfn = gen_helper_crypto_sha256h2;
-        feature = dc_isar_feature(aa64_sha256, s);
-        break;
-    case 6: /* SHA256SU1 */
-        genfn = gen_helper_crypto_sha256su1;
-        feature = dc_isar_feature(aa64_sha256, s);
-        break;
-    default:
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!feature) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-    gen_gvec_op3_ool(s, true, rd, rn, rm, 0, genfn);
-}
-
 /* Crypto two-reg SHA
  *  31             24 23  22 21       17 16    12 11 10 9    5 4    0
  * +-----------------+------+-----------+--------+-----+------+------+
@@ -13906,7 +13849,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e000400, 0xdfe08400, disas_simd_scalar_copy },
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
-    { 0x5e000000, 0xff208c00, disas_crypto_three_reg_sha },
     { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
     { 0xce608000, 0xffe0b000, disas_crypto_three_reg_sha512 },
     { 0xcec08000, 0xfffff000, disas_crypto_two_reg_sha512 },
-- 
2.34.1

