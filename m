Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1993245ejb;
        Fri, 24 May 2024 16:23:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzyMmmfmRJSe1YwwpoASMMvbT8yeVSBSiHwnaPi7y8EU9SyHxHmGLcVdzYDOFF5C3HncBW/Jbg5FiveFS1Vy9CwUzv6cqa
X-Google-Smtp-Source: AGHT+IEY8dy6q+lN1J1fpKElpD2yzSaVERbTsDbpFvPxSgMscAVakYDDMH/dBGUqVbv5QRWUUku0
X-Received: by 2002:ac8:7d0f:0:b0:43e:3d64:8c1 with SMTP id d75a77b69052e-43fb0f05e88mr47562351cf.55.1716593001758;
        Fri, 24 May 2024 16:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593001; cv=none;
        d=google.com; s=arc-20160816;
        b=uu1izIeE2T26bP24E6yCC4iucO5Y/6OEVl4Bn1UhniPB0Vn9ZxAHYBykbgZFd1RO4j
         LH1hzzwDcRPoYigqpgY97/B9a6RgfEq75aNH82HyEM5vEu9Fr/NWaui4LzLEyRnhmPsH
         9881mDEUFw8HyV+Lz4LDlVSXJfV+k59GGomHkW730WA7aigbyaWlvs3VzqrGUeIJPuAI
         Z0MAhdpOlgOlXh58MVsIgHxcTWLzbRlCTwHxQVSB6pZHJYiwu+uD5BvYJnEsomgc0kjS
         0yeY9TWqJO4sBTQY/r8WgtbEh8jMdCB3KUq1gjzVJCwCcU/tNQurAWEjhPgt5+S3ePXL
         IaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6JGBAb3suYnGkPI0Zq7FnXw4L8WJQd0Zh1edTR6Hth4=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=IFpgcNkKZ0EwkeRUjmGuGFV8Txpn2KPT5RQiUogyaAd76YdKUfI7tNu8r8HeuFjt40
         HaVZnZT7s0emdZ//H29OJQXT14Seg2DHV3n6omUyDrV0BDvR0UCfOqRriK7fpb8XxUlJ
         1K0ZUWBTyXR+rQ7j5bWuuxZjvPnY2i5MKo+mwcdgad0Cc1bGGpiOQe2uvXRU37qDDVN1
         Bc7l/syomgSedaSN0oPWbbfN5ELMHwItsrXipDEpFJYgjk3iU1LTsNb7402/hQIcpRSP
         ALl3uib5Quw7MSqr6Z8i4IuqSNvo1fzy+Ku675W5I2RPm7kuaMmHUfuLct7Fr4Wj3ef+
         lsfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cMMmwrt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c9f5esi27603301cf.635.2024.05.24.16.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cMMmwrt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEO-0006Z7-AN; Fri, 24 May 2024 19:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEI-0006VK-E7
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:42 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeED-0005m0-3Z
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1f05b669b6cso33016985ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592896; x=1717197696; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JGBAb3suYnGkPI0Zq7FnXw4L8WJQd0Zh1edTR6Hth4=;
 b=cMMmwrt9t2T4hAuGTd3VLIlRnpdZMnIzG9H7EOvj1YNq8NhKB4Vh1Sd6qieQQVW2qB
 yui1rwByV2lWAzm9XuaD26wFnOKsn22Y3Uy8kRavt2g2EvjMRJ2NKPab/LIelXLnRSif
 0qxWA+7EIs6bD+233yDTy6ryo0OFXrPL4JxFRHyqnL9YILlWPIe50ofIz6hqyI7oJnRb
 Q/cYWnH33MjcwB91/v2GMcRMlNmm/dlxxYjthm1ZwBewQ6WFdW4Dp0/8eMY2sZC7/4m/
 OQxLcRlw0jNQ0LBGQNvhaxiiP9bczUvWL6u+7k1nYyiP6H2tIuNWGpblEutz6RVgN7Iw
 2kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592896; x=1717197696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JGBAb3suYnGkPI0Zq7FnXw4L8WJQd0Zh1edTR6Hth4=;
 b=khfT8rzfW9l/qKzcG3AinjgHPX9bOJyRP2XP//OBdmNGKptkoss3t4CigNQb0MRKd1
 YeNUiU8RKwYLkq4MW3Y2yEYM2Tmu4wTbDzjWbfKgjzw0SwiATSutDNCF/Z6X3lF8tnye
 9g+whkwGUQkuiSNSWh47gWRZBRmi5oomC92gwr75M0q5Q/wlCUhC2Q1hNuruV2/CnJk3
 2hqhEmDS6NhkqHtp+njuiq1D9qpDB6B6PzFA0gwOQtc91x6cEKm0v3vOjmyfhN7TiAij
 kpJNvVOOL2QYyJN5Tu8qRiHso27r+CS4k3Ow0ua2IFrU7fe5H0ntFUHCYT3xVeuxv9xf
 ADCw==
X-Gm-Message-State: AOJu0Ywii3l7mk8wjoSHgopmTU2upjaxtEkkZUboiVg4nh42FTJFYXRv
 b0T8URMvdYfRY1Nc6/7crGIYpjETeHNu1g4Ovg1TChQDFmhaNuxFuemF2fDfTcw=
X-Received: by 2002:a17:903:41ce:b0:1e2:4c85:82ea with SMTP id
 d9443c01a7336-1f4486f23c2mr46433985ad.24.1716592895744; 
 Fri, 24 May 2024 16:21:35 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 15/67] target/arm: Convert Cryptographic 3-register,
 imm2 to decodetree
Date: Fri, 24 May 2024 16:20:29 -0700
Message-Id: <20240524232121.284515-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: FvskB1Tz+gca

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 2951e7eb59..cf3a7dfa99 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4676,6 +4676,18 @@ static bool trans_SM3SS1(DisasContext *s, arg_SM3SS1 *a)
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
@@ -13604,36 +13616,6 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
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
@@ -13663,7 +13645,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
     { 0xce800000, 0xffe00000, disas_crypto_xar },
-    { 0xce408000, 0xffe0c000, disas_crypto_three_reg_imm2 },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
     { 0x5e400400, 0xdf60c400, disas_simd_scalar_three_reg_same_fp16 },
-- 
2.34.1

