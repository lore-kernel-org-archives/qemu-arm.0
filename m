Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368373nji;
        Wed, 11 Sep 2024 19:43:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVctmn/ZWFM3/37EXmFhtaGN+BoMTZrz0KgnTn1KC96g/SSC4YYbHGOqN9V5roStXu3PBy5s7H1aSfAEg==@linaro.org
X-Google-Smtp-Source: AGHT+IEiJ8wRl6ZwEmEK7weOsL3O+8ElzdPnDQBfRYX6BPyfGW2iD1vuCWjpPutR5EdJ0J8TS1Re
X-Received: by 2002:a05:6214:3a8a:b0:6c5:1a21:b8b9 with SMTP id 6a1803df08f44-6c573514ed0mr28557516d6.13.1726109013016;
        Wed, 11 Sep 2024 19:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109013; cv=none;
        d=google.com; s=arc-20240605;
        b=cdLvWB5lvvOAtTIg5JDKE61UY99JzJfBbLvKmMomHBkmTzKAYtk1wkJVNhXJMNaIZ6
         QhfMKOGwh+C7VOG4pJmRD0mTAoMmXK1FZiMEpHzGFEzutdBbaq07VWaN6AAvarkxOHD2
         Ff6s2xPh03m2tRj8xtiCZVHPSifiRRE/R4i8pvezuqGZuueLaRLrtkbUPjU8DMeqCCUZ
         IUVGxAhySA/ASStkJWSquOCL37f/hgW1vuR60bz0oDQptJzKyjDtITgTwVgiKzrwnfEC
         5nFn8sB2REYZ7HVpr5hgeGJuJ46yuJ8mwovTE10JiDEIP9YAbSoYHKioTEHiLlrOGiHq
         4qEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Kgeom0orQyCoH8W6cLgDwpuRJ/jfJeEw1kOvWE0iihw=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=IBl+iAZ8tC3rgLIDPsZacunyhlTl1w9fBCU/Cj/LjUVDg0n2X4BN7yfVz/5jJWmzSW
         sVwo8V/An50PiZOw3xRc4NVUdwgnJsbpryJsg5NcBcw0u7TKW+gpbriKLFmC6jRYIvtX
         cRhNY9cNAo6XwAjrDRtDhxGOpAkUwIOYpooaJ7ucJRRgkm2EHkxyhL3k8UT9zdEvDpkr
         +kgwPi7pdFgEaXGbTe5NrBno+fytX2taa5ozUGOma3Nz7Yr2DSk1dmrupVCipe1Gbej/
         Oh2kiEoMlpUNoBJrWbVPA/8tuhFE+MWGkQIvHL95VWE/DroU3UC/ezMRIx8x9ANrQnDK
         0ixQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQtZFxpW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53433012esi116375426d6.9.2024.09.11.19.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQtZFxpW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZmq-0007Em-DX; Wed, 11 Sep 2024 22:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm9-0003gH-0q
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm7-0004FW-7n
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-206bd1c6ccdso5035545ad.3
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108898; x=1726713698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kgeom0orQyCoH8W6cLgDwpuRJ/jfJeEw1kOvWE0iihw=;
 b=VQtZFxpWO9opRNB1G3S24IdqqTINqfeveEeQ7SX8kb9vKDiu3qKBF2pEJXOHVWoGz6
 APaQpD2TUAIOenrcaGNMg+RiMlut8Uw2J3o+0VZNB9ptiyZupGYb9Mwl5PWHPbxuMU7E
 6+j4elNmxquLis9UJdFdb3uZeBxzTInsfK5ggw3c7EYlcAbSiP93ZTx94aodkoRzvTI+
 Geol5KlNXOgHNvsfKHWQgSj7pj0Lo1iPSpjTd0KG6NjgfjLWXOjtV8lnrgoVAc/QdY2+
 MZZnFlsdNn7gwI6Y0+w/jxXxQuo0bkMy51wcPcz3Xqq4LsCNJ3Xo3YolvoDVxRvBEf/8
 lwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108898; x=1726713698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kgeom0orQyCoH8W6cLgDwpuRJ/jfJeEw1kOvWE0iihw=;
 b=QN4DSTgMaS7T5MofWuaztQj2MPnMJgeEDFbM+gKwMIVbT0POSZC8WAeN8PCVH9k9x6
 deEcJRFQHa5YV/ZBG3AzHgCly3m61pEQbBTruHU+yhAkabkTLa+e0ajQEq27KOS782Qz
 bR6m/4c/tFxgCJyS2LHOMzRJZp4bft6l6QROWLCLQrxZfUY8Dg+4A62N8euVAof647mm
 7DVS8HtiBcuwRYxibtUK6x46XANSpY0RPXcmsHUjXMW2svsdzKDc5TRNRBLORlwN9ALZ
 Tt3xnmwoL2Rdt0gI7ov+assXOHQa+2xnUnTjps3INXQV+Ut0evw+jR2uq+Ev8FZ9NcEO
 +c0w==
X-Gm-Message-State: AOJu0YwwKdt2lVOCqCNxVCa59naft15DGQ8ymwE4Dg7PIcR4TB7LwhcT
 jE+YMGE5L2HNsu5UW96QGEoSflPbYVdCld4aUAY3UMSfWQOm21NUjuNwf4si4IM=
X-Received: by 2002:a17:903:41cb:b0:206:ae39:9f4 with SMTP id
 d9443c01a7336-2076e35ebfamr15947455ad.20.1726108897922; 
 Wed, 11 Sep 2024 19:41:37 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 24/29] target/arm: Convert handle_scalar_simd_shli to
 decodetree
Date: Wed, 11 Sep 2024 19:41:09 -0700
Message-ID: <20240912024114.1097832-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: B5v6Wa/fk0Ls

This includes SHL and SLI.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 44 +++++++---------------------------
 target/arm/tcg/a64.decode      |  4 ++++
 2 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index efd93a7f23..934746d2f2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7124,6 +7124,11 @@ static void gen_sri_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
     }
 }
 
+static void gen_sli_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    tcg_gen_deposit_i64(dst, dst, src, shift, 64 - shift);
+}
+
 static bool do_vec_shift_imm_narrow(DisasContext *s, arg_qrri_e *a,
                                     WideShiftImmFn * const fns[3], MemOp sign)
 {
@@ -7201,6 +7206,9 @@ TRANS(SRSRA_s, do_scalar_shift_imm, a, gen_srsra_d, true, 0)
 TRANS(URSRA_s, do_scalar_shift_imm, a, gen_ursra_d, true, 0)
 TRANS(SRI_s, do_scalar_shift_imm, a, gen_sri_d, true, 0)
 
+TRANS(SHL_s, do_scalar_shift_imm, a, tcg_gen_shli_i64, false, 0)
+TRANS(SLI_s, do_scalar_shift_imm, a, gen_sli_d, true, 0)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -9417,38 +9425,6 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
     }
 }
 
-/* SHL/SLI - Scalar shift left */
-static void handle_scalar_simd_shli(DisasContext *s, bool insert,
-                                    int immh, int immb, int opcode,
-                                    int rn, int rd)
-{
-    int size = 32 - clz32(immh) - 1;
-    int immhb = immh << 3 | immb;
-    int shift = immhb - (8 << size);
-    TCGv_i64 tcg_rn;
-    TCGv_i64 tcg_rd;
-
-    if (!extract32(immh, 3, 1)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    tcg_rn = read_fp_dreg(s, rn);
-    tcg_rd = insert ? read_fp_dreg(s, rd) : tcg_temp_new_i64();
-
-    if (insert) {
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_rn, shift, 64 - shift);
-    } else {
-        tcg_gen_shli_i64(tcg_rd, tcg_rn, shift);
-    }
-
-    write_fp_dreg(s, rd, tcg_rd);
-}
-
 /* SQSHRN/SQSHRUN - Saturating (signed/unsigned) shift right with
  * (signed/unsigned) narrowing */
 static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
@@ -9900,9 +9876,6 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0a: /* SHL / SLI */
-        handle_scalar_simd_shli(s, is_u, immh, immb, opcode, rn, rd);
-        break;
     case 0x1c: /* SCVTF, UCVTF */
         handle_simd_shift_intfp_conv(s, true, false, is_u, immh, immb,
                                      opcode, rn, rd);
@@ -9940,6 +9913,7 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
     case 0x04: /* SRSHR / URSHR */
     case 0x06: /* SRSRA / URSRA */
     case 0x08: /* SRI */
+    case 0x0a: /* SHL / SLI */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6c2362b3bb..96803fe6e4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1291,6 +1291,7 @@ RSHRN_v         0.00 11110 .... ... 10001 1 ..... .....     @q_shri_s
 
 @shri_d         .... ..... 1 ...... ..... . rn:5 rd:5   \
                 &rri_e esz=3 imm=%neon_rshift_i6
+@shli_d         .... ..... 1 imm:6  ..... . rn:5 rd:5   &rri_e esz=3 
 
 SSHR_s          0101 11110 .... ... 00000 1 ..... .....     @shri_d
 USHR_s          0111 11110 .... ... 00000 1 ..... .....     @shri_d
@@ -1301,3 +1302,6 @@ URSHR_s         0111 11110 .... ... 00100 1 ..... .....     @shri_d
 SRSRA_s         0101 11110 .... ... 00110 1 ..... .....     @shri_d
 URSRA_s         0111 11110 .... ... 00110 1 ..... .....     @shri_d
 SRI_s           0111 11110 .... ... 01000 1 ..... .....     @shri_d
+
+SHL_s           0101 11110 .... ... 01010 1 ..... .....     @shli_d
+SLI_s           0111 11110 .... ... 01010 1 ..... .....     @shli_d
-- 
2.43.0

