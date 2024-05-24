Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994609ejb;
        Fri, 24 May 2024 16:28:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbdookrW8ZyAMlO2h1wGe9Yo/Wgny3V6C4k7P1x9NU46sS+vaePDkTKq67Cy7+XHjwoFkvTLOqASKn1nC+NWylQGoW+r/s
X-Google-Smtp-Source: AGHT+IHll+cEi8UbNLD9jJxXxAvCTNhMAXwytTK1FKyzRiOaGDz/ImKlb6JzBvSV6jxrQAtC473D
X-Received: by 2002:a05:622a:389:b0:43d:f7b4:3087 with SMTP id d75a77b69052e-43fb0e8f7dfmr38785691cf.24.1716593287061;
        Fri, 24 May 2024 16:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593287; cv=none;
        d=google.com; s=arc-20160816;
        b=digNg0A/SN226SD7Lb2wNgwsAS3PcCKj5dMuo0e5hGi3WJemxaykGtUHoUkHg7uOEx
         lERFQRp7sIN8nF40Uv2yWbaZZy3bgTMEiy170EaF5Z9cJjOp6vTrauh5QGhIprTNl066
         wlmWgRxRUAkSOi56gEinRIlmhtfrUZb27VZKII8bKU+f3ASvYtQ4OFXJcRfrU/6b2i5y
         lgrC8gVcIyHXGx7wATAN8I2cST8meoPBP6eq0T7FJ7AqHAXkiDk7gSvc2GgygooxpfFv
         /U+ZSQl5fO3rYiw1yAXvyBxidK66yNPYS0kTg2m/uwxiyE0CVRFzRD9ywWz/RGrXxd+N
         oA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fODOcCWj61ck2RRtz0vPUUYcMqJTXdEitBsSudVvQlM=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=F9vOOwPEIEN0hiWKV4SgbVrvPnrKsnBuFt/Es+ROlzcSl3F7N9KvSJpCuyn8ARS3MF
         bprrJu1B+0DLM1/bRE8vhkyaKdcJu3q5LjROPQuqBD04LakJkX65AxHJuLYFrfedBFIH
         jq1uhCgnBEWL1DbVrrzyaJxX8d9/vKoAqu8+JZ5rlgx2KdMk3H7gOcMdEoesHa/2Yxx2
         39gWoBC1tAEk3UbqQXsxeYaW6utSp8zXDpOxYFi+X96k1TLs8Q5XmXrzyWwTE3/2tViD
         J3Zu1ULfJSTs/g1oYnYbx9KVqLLaeJjsQHsEfUpaHxhpUHyRlmlqkoKUsZK6PEyPDB1m
         1uiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zckZDexI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb17ed72esi27937161cf.194.2024.05.24.16.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:28:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zckZDexI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEW-0006hb-6Q; Fri, 24 May 2024 19:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEK-0006W8-4n
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:44 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEF-0005mZ-FJ
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:43 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-65c5a29f7f0so4357694a12.1
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592897; x=1717197697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fODOcCWj61ck2RRtz0vPUUYcMqJTXdEitBsSudVvQlM=;
 b=zckZDexIZnIMhteJHeMv6SXcThm+k4R05hytQHjIJJ81z5BAkBohV7H3qbypxnzv6e
 uZtUkahl7P9fYxS0eckxt/T2QFBRoLMF81whubiQ4qPURia3umCGUbnHcr3k60tqt99U
 99gCzx/LgMFTfkDukC9cCVC87RIhTO3FRlHIriWDyThxHXDnu3daRKk6pNaFCG6y0kYh
 x8hltqzk/44j16jlJxK6AUMcpLiIyM6UQiyaiYRJ1k8DNfygH61aA+K4EPnuJsWrjTr/
 R1+lvQXvFgeC99z6Aw4Pv9Ji3RHZqVtDhFwpZb03d6mmv5Szr3laR6GWc1juoEnZ266L
 I1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592897; x=1717197697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fODOcCWj61ck2RRtz0vPUUYcMqJTXdEitBsSudVvQlM=;
 b=hih9ObtSPDco3TYayWzxZmeuaH4cGV6xapSNSVT1kHAhWNjTyT8mh/vHXdj9QNxfLn
 5fprni4wgqTjIpNSYJOTXgJriOLpQCact6BT0yCOOASaug+ZtaO8twqkZeIHEpmUcuWE
 OWXMwnl+SKhGpQYI+k+XGAQSr85N4TIRN3T82xT8dZoWQEjo4vmLXpD3l0F9pKrwMclH
 n5vVzGgixbh98z0SXa7ta4kRE1lEym9kqv05SXvUP1005Dl5eP+HZWetZmYVxW4mcrEa
 p6tuPyi3xK53wf7QNvvK8Q9biHd4ILn4GlfZ3iuhp4IUS+jiKrfmMViP+HuldvTrrYxp
 SnGA==
X-Gm-Message-State: AOJu0Yxo4Oz7PwQnusMCrACRCo4n9TOodqWONhs0Fr5CDVek6UL2Wfis
 1wlNQ543cytQLH63OvFg0oVR6K5ZlQoQrEsI2bvmmrjpiW6x7bLXBKUGouFxc5A=
X-Received: by 2002:a17:902:d486:b0:1f3:1cb9:47a0 with SMTP id
 d9443c01a7336-1f44870a07cmr44675365ad.27.1716592896932; 
 Fri, 24 May 2024 16:21:36 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 16/67] target/arm: Convert XAR to decodetree
Date: Fri, 24 May 2024 16:20:30 -0700
Message-Id: <20240524232121.284515-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: d/6o+//KErJF

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++++
 target/arm/tcg/translate-a64.c | 43 +++++++++++-----------------------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1292312a7f..7f354af25d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -654,3 +654,7 @@ SM3TT1A         11001110 010 ..... 10 .. 00 ..... ..... @crypto3i
 SM3TT1B         11001110 010 ..... 10 .. 01 ..... ..... @crypto3i
 SM3TT2A         11001110 010 ..... 10 .. 10 ..... ..... @crypto3i
 SM3TT2B         11001110 010 ..... 10 .. 11 ..... ..... @crypto3i
+
+### Cryptographic XAR
+
+XAR             1100 1110 100 rm:5 imm:6 rn:5 rd:5
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index cf3a7dfa99..75f1e6a7b9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4688,6 +4688,20 @@ TRANS_FEAT(SM3TT1B, aa64_sm3, do_crypto3i, a, gen_helper_crypto_sm3tt1b)
 TRANS_FEAT(SM3TT2A, aa64_sm3, do_crypto3i, a, gen_helper_crypto_sm3tt2a)
 TRANS_FEAT(SM3TT2B, aa64_sm3, do_crypto3i, a, gen_helper_crypto_sm3tt2b)
 
+static bool trans_XAR(DisasContext *s, arg_XAR *a)
+{
+    if (!dc_isar_feature(aa64_sha3, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_xar(MO_64, vec_full_reg_offset(s, a->rd),
+                     vec_full_reg_offset(s, a->rn),
+                     vec_full_reg_offset(s, a->rm), a->imm, 16,
+                     vec_full_reg_size(s));
+    }
+    return true;
+}
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -13588,34 +13602,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Crypto XAR
- *  31                   21 20  16 15    10 9    5 4    0
- * +-----------------------+------+--------+------+------+
- * | 1 1 0 0 1 1 1 0 1 0 0 |  Rm  |  imm6  |  Rn  |  Rd  |
- * +-----------------------+------+--------+------+------+
- */
-static void disas_crypto_xar(DisasContext *s, uint32_t insn)
-{
-    int rm = extract32(insn, 16, 5);
-    int imm6 = extract32(insn, 10, 6);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-
-    if (!dc_isar_feature(aa64_sha3, s)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    gen_gvec_xar(MO_64, vec_full_reg_offset(s, rd),
-                 vec_full_reg_offset(s, rn),
-                 vec_full_reg_offset(s, rm), imm6, 16,
-                 vec_full_reg_size(s));
-}
-
 /* C3.6 Data processing - SIMD, inc Crypto
  *
  * As the decode gets a little complex we are using a table based
@@ -13644,7 +13630,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e000400, 0xdfe08400, disas_simd_scalar_copy },
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
-    { 0xce800000, 0xffe00000, disas_crypto_xar },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
     { 0x5e400400, 0xdf60c400, disas_simd_scalar_three_reg_same_fp16 },
-- 
2.34.1

