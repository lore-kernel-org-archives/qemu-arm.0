Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1273541ejc;
        Sun, 5 May 2024 18:16:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXsWjpMk9s3aRZR0iMSsCw9Ixwp5fXPogMxcfLfP0eC7A2fhCVtZC1idklQQlK4f4OQLHJW6xJ7MFXqQ3YoE03p83GonIt
X-Google-Smtp-Source: AGHT+IEeXI3MxNCF3wGFrXnv6IobUdRVoD2i7pMA2UgU1ms4agA8IA6dLSH3tk7dI61s7fZzrJAJ
X-Received: by 2002:a05:6214:d06:b0:6a0:d04e:c021 with SMTP id 6-20020a0562140d0600b006a0d04ec021mr10946298qvh.50.1714958166148;
        Sun, 05 May 2024 18:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714958166; cv=none;
        d=google.com; s=arc-20160816;
        b=nyKjRfGN7yjxxUw7Of8KS9nWz5EEshePPqR1K4sTKiuc20v6lrQf+8ZT8zSel7TzaW
         S1VNRiY/z/zulAU8WqPOtCjF5MCZMn7vrSTryx3CC6SnSVtifDU26QDvr/kk0TgYOTyA
         uyHFenliw+EezRGshZ0xQE4YoZVJOl0mXMEQVvfFRZd1sVa/KM6OF+MMjpPN/pMh59wF
         l6wpf450SodVSQO9e7rMk/dylF7sGhj/8aPkF8t/Fhc8pGD1XfTKK4bJIYMc2b9dz+3c
         KQdbDpuPDSxyFyMuwev8zfWofFsfgVcJP6uWbuzc2JuKt5lyfjzDnPEhRGUPscjZBCm+
         AO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uXd7G7gYNjtzzrDvubOWwZNd9eG96LxiAMr8ZaBZ+pk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=gtSO0rdRaZEcQRfprY+81eVEoIQb4vTuVqYPsW4tWlzUI9EngFNMjO3d7lc3lRymg9
         BC1Z/a88LeykwYrpxHZyVjAAe4SHZ9+tMcJ241sZL+6uUj1t0pGtvYND5gcqCK3v0KTZ
         6PH0nARgSaqzDd4bHRbbcBzHil6SjxPde+sQnKa6lBn30JUS3+Vw8zRkdPZjiMSm1Htp
         TWYcCgg9FYgN5XFWpdOmSXPVdEyNYmL47Rs5O/k8J3x1nr6OvyfT2EN9aI1SzQzE19P7
         06XA/xYi5y+6I9cu7VzboMVcMIWLNIzoNdDW+23s/EeWWnM8S2a7gFOAh1ybnTBCayGF
         LbwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eh7npzFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020ad45aed000000b006a0ce3299c8si8403762qvh.299.2024.05.05.18.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eh7npzFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mmI-0007gM-Cr; Sun, 05 May 2024 21:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmE-0007df-6u
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:23 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mm6-0002R3-DK
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:20 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2b12b52fbe0so928364a91.0
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957452; x=1715562252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXd7G7gYNjtzzrDvubOWwZNd9eG96LxiAMr8ZaBZ+pk=;
 b=Eh7npzFvpohfrkoh98KKfXPWGPuuDtk0LALCgwoQ9yIh0Bdps4hnQ/EqGHblMEfZgs
 JHwVey/IDEjQePcVYep4qD22jUPap1R5ejyCMdziYBsmk9yW+jXjnu7x86rX5NiXin1n
 jSfRot4U05/Qlm8OA5PWNER99OOm9kytCAdcDVWEntkj3UIPCMCPegE1pjvpM4FD6ni0
 Ti5CWQsHSpYR5Kh3I4tSzrtcxOa8TPDJG/SoYT/7BJUisi8D2iZYHZSIBmuzZgDX2Kp0
 FGKsI/299+0qbE/Xf6Eh4Z6nJfu/dr54zG6XC8CsBAYptcb97s8M/40BfWQCuDjDIt1b
 9lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957452; x=1715562252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXd7G7gYNjtzzrDvubOWwZNd9eG96LxiAMr8ZaBZ+pk=;
 b=JWUpwOXENxTeL8HVGrcvHNI6ATqRaQQKeT3ie0i6kJ61lr1yQ4bBmPLdA8KcdfZAjF
 fL3VFQoM2onUOAgrYRiY3F4DChY8eEi19eNAmuTWRxTEFSSxuz4CX9jtVhWrqcYJau/d
 CPygcnfZD46tsgXRHLi40416ANkcmOTTuRYai9qAGCn4p+M6ca95r7xRLuZ1uV4E3NXO
 R3I16XU84Lm09kyfRkQVYwqC6VNyb+uawfsIVhZkREy60jNox7+IEZU9pifoQsnc1ME8
 fWScFQkyBtMUNorctfJ1H/wfXbg7i/RicINYmn5u+9jm4/HBdggYMXMsfIdDOKdPXe4o
 Uv/A==
X-Gm-Message-State: AOJu0YwDBzoj5F1Qu+1y70DmP2BJ/DqBk5pyG/TJ3Z28jNVGY+YhbKiT
 u5Q4HrVOrFBIrT/EIMP9WCIMhCpJgRg/fkd5alGFWN9SCHJ8MPVxNRVJzwwnTa4Q7q+kczdhbwS
 7
X-Received: by 2002:a17:90a:5293:b0:2b5:6e92:1096 with SMTP id
 w19-20020a17090a529300b002b56e921096mr380702pjh.28.1714957451858; 
 Sun, 05 May 2024 18:04:11 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/57] target/arm: Convert Cryptographic 2-register SHA512 to
 decodetree
Date: Sun,  5 May 2024 18:03:13 -0700
Message-Id: <20240506010403.6204-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: 63kOnqVzracO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  5 ++++
 target/arm/tcg/translate-a64.c | 50 ++--------------------------------
 2 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c342c27608..5a46205751 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -631,3 +631,8 @@ RAX1            1100 1110 011 ..... 100011 ..... .....  @rrr_q1e3
 SM3PARTW1       1100 1110 011 ..... 110000 ..... .....  @rrr_q1e0
 SM3PARTW2       1100 1110 011 ..... 110001 ..... .....  @rrr_q1e0
 SM4EKEY         1100 1110 011 ..... 110010 ..... .....  @rrr_q1e0
+
+### Cryptographic two-register SHA512
+
+SHA512SU0       1100 1110 110 00000 100000 ..... .....  @rr_q1e0
+SM4E            1100 1110 110 00000 100001 ..... .....  @r2r_q1e0
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d2d9198f22..1bfee2583a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4630,6 +4630,9 @@ TRANS_FEAT(SM3PARTW1, aa64_sm3, do_gvec_op3_ool, a, 0, gen_helper_crypto_sm3part
 TRANS_FEAT(SM3PARTW2, aa64_sm3, do_gvec_op3_ool, a, 0, gen_helper_crypto_sm3partw2)
 TRANS_FEAT(SM4EKEY, aa64_sm4, do_gvec_op3_ool, a, 0, gen_helper_crypto_sm4ekey)
 
+TRANS_FEAT(SHA512SU0, aa64_sha512, do_gvec_op2_ool, a, 0, gen_helper_crypto_sha512su0)
+TRANS_FEAT(SM4E, aa64_sm4, do_gvec_op3_ool, a, 0, gen_helper_crypto_sm4e)
+
 
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
@@ -13524,52 +13527,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Crypto two-reg SHA512
- *  31                                     12  11  10  9    5 4    0
- * +-----------------------------------------+--------+------+------+
- * | 1 1 0 0 1 1 1 0 1 1 0 0 0 0 0 0 1 0 0 0 | opcode |  Rn  |  Rd  |
- * +-----------------------------------------+--------+------+------+
- */
-static void disas_crypto_two_reg_sha512(DisasContext *s, uint32_t insn)
-{
-    int opcode = extract32(insn, 10, 2);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-    bool feature;
-
-    switch (opcode) {
-    case 0: /* SHA512SU0 */
-        feature = dc_isar_feature(aa64_sha512, s);
-        break;
-    case 1: /* SM4E */
-        feature = dc_isar_feature(aa64_sm4, s);
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
-
-    switch (opcode) {
-    case 0: /* SHA512SU0 */
-        gen_gvec_op2_ool(s, true, rd, rn, 0, gen_helper_crypto_sha512su0);
-        break;
-    case 1: /* SM4E */
-        gen_gvec_op3_ool(s, true, rd, rd, rn, 0, gen_helper_crypto_sm4e);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /* Crypto four-register
  *  31               23 22 21 20  16 15  14  10 9    5 4    0
  * +-------------------+-----+------+---+------+------+------+
@@ -13744,7 +13701,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e000400, 0xdfe08400, disas_simd_scalar_copy },
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
-    { 0xcec08000, 0xfffff000, disas_crypto_two_reg_sha512 },
     { 0xce000000, 0xff808000, disas_crypto_four_reg },
     { 0xce800000, 0xffe00000, disas_crypto_xar },
     { 0xce408000, 0xffe0c000, disas_crypto_three_reg_imm2 },
-- 
2.34.1

