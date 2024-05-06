Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1269734ejc;
        Sun, 5 May 2024 18:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwWofrp5FPL+0MAoPi7fXE5UcX4rJlxNCmsMaVXf8GfojGsO2VQ2oMqc3w6TitZZCAWyLeyQmkLXhCoVUDq3sK6ZVHyqG2
X-Google-Smtp-Source: AGHT+IEErv6MuvPUsLadnOdvxyrKTNOFV2z2MlIZEtD2ptiiwr1fEqU64YiscvSmNCGqhHoS2JES
X-Received: by 2002:a05:6102:21b2:b0:47c:37e4:9143 with SMTP id i18-20020a05610221b200b0047c37e49143mr7424579vsb.11.1714957529726;
        Sun, 05 May 2024 18:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957529; cv=none;
        d=google.com; s=arc-20160816;
        b=x11sVLKOr6sE46OQLbBU+JN1I9SPQ1yYkqpC44Pdoc8uo22urrKKpYEMEO7X99TY/W
         rkDFKzhwIGRbA9+FJyhMlcdD+jxBPKqR5/xoKImjlfpWtY0qB/xi8sB68b7xkwmuAiJR
         CfhqHwFU/eWVYqGb3mDuayc9k6P4kLG0G4as+7Pylbf1zsRsfKg7l37RELoh8HogRe5I
         Bg+4qxDvyQ6ULZU4XI/hX4zNK3r2CAFV5YXgkdCVv+REglZpzzXFkaV9xDq0jMpIJqMJ
         rK1I6gXjqqgw4Awy0+I5HMXybRmV1gBO1haD086dM9gzCsAdjorbvTJRnJcwvol6axG1
         lDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ASrA7TqhkE0rAAXJqfu7t/qjiXelCpy+2ZhxPwsTqN8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=ldED0Z3GsKilPQZt7jBisR+3B7TguwDvzHD7CfUVQwi4EW2xvJo5SRuht86Ppl+6kk
         0oiGN+oP7M/vUWIqxM5KTjS/rBUixHTZMtUPl7VKYCeh6+zPw023lYsgpUci41+Lj0EV
         hRFsXSv1kVltufam24EPZsw6n8fB47BKw/mkgZfi1SQnfs6yXQo6P1B51OpTnT+rRcX4
         +Cu23xRxXT9b77saZEU6hk5+TVxDw/rMv0U0C0wvLKFFW763wy7IGYovaXRG795tBe5A
         WrDCpor7D7AI/AFN593SVr/jlEfyW9gjYxlJWPooH+SLbg+IqrwoQ0smWIqdIa2Q9JkK
         P4LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InfsP3RI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy14-20020a0562140f6e00b006a07a484bf2si8299526qvb.482.2024.05.05.18.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InfsP3RI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mmL-0007i3-GT; Sun, 05 May 2024 21:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmB-0007cA-Uw
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mm6-0002Qg-D7
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2b12b52fbe0so928355a91.0
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957450; x=1715562250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASrA7TqhkE0rAAXJqfu7t/qjiXelCpy+2ZhxPwsTqN8=;
 b=InfsP3RIQIH2uoi0O2BChQRH2FTC/KteVJeewrJzd5JqjumjCpix0waivoS+19WYPE
 Z8UGjIKPuM5ePnGc9KevF9RlT+gOElJ4ssjtfCrhRMCUCNYjG8brB6ECfda6qXx8JRWc
 8wMGRd0SQD391+l+2j4ltp7rD1wfn1HRpIX311zdSPtaMSSw3LXcjIEKrZhXpJmbv4RB
 rT62yAUThV/Ip5/eTA479wX2GAq9KcfGSr3g+RoJMvvJgh1YLJRLgIkbF+QXZMYde5X+
 P4gMPTOy2BN0VCgOgvf3EGYXR4P7Z2OAbaf7ieMDDplTs2trqeeZK6p61AH4DbK61X1m
 G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957450; x=1715562250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ASrA7TqhkE0rAAXJqfu7t/qjiXelCpy+2ZhxPwsTqN8=;
 b=IUDZAHyfuMxcJOlpkMbnk9l7mZEoHfGToBenSgqbpEu3hsTrU9c6MtC4N0m3d7lCLf
 +aAqo45X7w93cEQy3Sg8U5BRGSNIs7mzi1UjrjCILNx4uPAIZEYV446lCv0marj3WWH7
 QR3xGyRowUUBYJVEn02/Qur9vQYNX42BgRMq9lpazqgKAU4+OHU3moqnr3JovinShA5Z
 cQ9+OeRQ1a1e80KLwqivPyWwCN6Wa4RGfNxZ8trazAqe9S2NOgRJJjXn2j6xmgoS1KZy
 M3QIdq4owmvgEMVpyJk2kRFjMb19/eFMSQflF4geiEGCFQPwP9w3CLkQbmuAr+9UUhqU
 0Q/w==
X-Gm-Message-State: AOJu0YwCWj95LyyuJD4ENMj9ED71gDMLVnFfksadC6D9WcsgHJ+sCLHi
 +rnHs71C43EgTchFmTiP+pQGWzrk8+CP2EwfRmeKC1ujZj3fImRC33veJNplSNI=
X-Received: by 2002:a17:90a:9406:b0:2b3:90ab:fb9 with SMTP id
 r6-20020a17090a940600b002b390ab0fb9mr7764482pjo.49.1714957450115; 
 Sun, 05 May 2024 18:04:10 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/57] target/arm: Convert Cryptographic 2-register SHA to
 decodetree
Date: Sun,  5 May 2024 18:03:11 -0700
Message-Id: <20240506010403.6204-6-richard.henderson@linaro.org>
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
X-TUID: G9a1aHzWM+PW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  6 ++++
 target/arm/tcg/translate-a64.c | 54 +++-------------------------------
 2 files changed, 10 insertions(+), 50 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 7590659ee6..350afabc77 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -614,3 +614,9 @@ SHA1SU0         0101 1110 000 ..... 001100 ..... .....  @rrr_q1e0
 SHA256H         0101 1110 000 ..... 010000 ..... .....  @rrr_q1e0
 SHA256H2        0101 1110 000 ..... 010100 ..... .....  @rrr_q1e0
 SHA256SU1       0101 1110 000 ..... 011000 ..... .....  @rrr_q1e0
+
+### Cryptographic two-register SHA
+
+SHA1H           0101 1110 0010 1000 0000 10 ..... ..... @rr_q1e0
+SHA1SU1         0101 1110 0010 1000 0001 10 ..... ..... @rr_q1e0
+SHA256SU0       0101 1110 0010 1000 0010 10 ..... ..... @rr_q1e0
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b31e70b5d3..89f733ef12 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4607,6 +4607,10 @@ TRANS_FEAT(SHA256H, aa64_sha256, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha256
 TRANS_FEAT(SHA256H2, aa64_sha256, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha256h2)
 TRANS_FEAT(SHA256SU1, aa64_sha256, do_gvec_op3_ool, a, 0, gen_helper_crypto_sha256su1)
 
+TRANS_FEAT(SHA1H, aa64_sha1, do_gvec_op2_ool, a, 0, gen_helper_crypto_sha1h)
+TRANS_FEAT(SHA1SU1, aa64_sha1, do_gvec_op2_ool, a, 0, gen_helper_crypto_sha1su1)
+TRANS_FEAT(SHA256SU0, aa64_sha256, do_gvec_op2_ool, a, 0, gen_helper_crypto_sha256su0)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -13500,55 +13504,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Crypto two-reg SHA
- *  31             24 23  22 21       17 16    12 11 10 9    5 4    0
- * +-----------------+------+-----------+--------+-----+------+------+
- * | 0 1 0 1 1 1 1 0 | size | 1 0 1 0 0 | opcode | 1 0 |  Rn  |  Rd  |
- * +-----------------+------+-----------+--------+-----+------+------+
- */
-static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
-{
-    int size = extract32(insn, 22, 2);
-    int opcode = extract32(insn, 12, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-    gen_helper_gvec_2 *genfn;
-    bool feature;
-
-    if (size != 0) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (opcode) {
-    case 0: /* SHA1H */
-        feature = dc_isar_feature(aa64_sha1, s);
-        genfn = gen_helper_crypto_sha1h;
-        break;
-    case 1: /* SHA1SU1 */
-        feature = dc_isar_feature(aa64_sha1, s);
-        genfn = gen_helper_crypto_sha1su1;
-        break;
-    case 2: /* SHA256SU0 */
-        feature = dc_isar_feature(aa64_sha256, s);
-        genfn = gen_helper_crypto_sha256su0;
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
-    gen_gvec_op2_ool(s, true, rd, rn, 0, genfn);
-}
-
 /* Crypto three-reg SHA512
  *  31                   21 20  16 15  14  13 12  11  10  9    5 4    0
  * +-----------------------+------+---+---+-----+--------+------+------+
@@ -13843,7 +13798,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e000400, 0xdfe08400, disas_simd_scalar_copy },
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
-    { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
     { 0xce608000, 0xffe0b000, disas_crypto_three_reg_sha512 },
     { 0xcec08000, 0xfffff000, disas_crypto_two_reg_sha512 },
     { 0xce000000, 0xff808000, disas_crypto_four_reg },
-- 
2.34.1

