Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2147388njk;
        Sun, 1 Dec 2024 07:07:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXo97cAZ7HYzHl1xtWfFXbDFjm9MT/ncyi9WofIK7iF+CzgwqSWdaE+mMOENqMeVfFq4wxlo3bJ6RZWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH/LOd9IlQXtQuDneAAJwHdBG04Ef8Vlq36VguUwgihtJ8OMMVQ8tkdEZwn6TiPmnpmNuA1
X-Received: by 2002:a05:6102:dd4:b0:4af:3ff0:e6a6 with SMTP id ada2fe7eead31-4af4491a8b9mr23581895137.20.1733065676054;
        Sun, 01 Dec 2024 07:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065676; cv=none;
        d=google.com; s=arc-20240605;
        b=UTNmt9p/7wHfmAHUNEIbkwhjSgNNRkWxkdC2wQmQZRf4bf6q8XrBP+H/8PxX00CiPU
         2GOtFQEvkJPGcV+ujU4D+/e6nLNWJou92USveoA77D1PYZOJVViGq5+C09g5Sj09mS0j
         XaBPM9osCwwGDQDfF09NgqhcxsIK7n9b0W5rHNTFexq66/GzOSsHfFHzRddur2ch8ty4
         bJObTSOKeTVKcPvQWKky4XUnDJL5Z9WDOSOpdSA4t/vlWPqs7rYNF2dGdxL43UaQEbcF
         t/q7ievCOtOr2tlVAmNkXnFOR852/pBKTL3MQ5fDcXtivJP16HXaDZ7BvjHgaIhtH0Ek
         kwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T5/xoahRU3amiYGGR5zPHyc0xxRVZolbI3oRaPb2Uwc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=lCc0oA/VBC7y3Ao8MEHRlJd9RuYrYQ6xMsbG9gT436ReM84dNbSLq5FLPLR6gTVlCy
         5PYuxmwkPZpcwOdPqQhjReYXQpAsVlCwIj0vO/rh3c0dMxUMwQJwjXxDdVfmRldj25Bi
         7xsDOWbF31GGMGJNFv5I9LnYsySiMbRB0c4Sj9uGgEkVdxjCpGVhTqIDZkBce/WQl0xz
         gViB9/RBBT9DdFkc545f+mQO/4Qs2ddNVau+ZyICpXo8ZHjR9Xtai7ABWstg1QHLZSp3
         tRfYeLJvBbwpl1kGHvwO0BXwTYuSJhxuoWOQEPY9IltxaAyQ6qtWN7rzUaxXMitenJ0y
         81Pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0N0L/aO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af593a2421si2807899137.628.2024.12.01.07.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0N0L/aO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlX9-0001bW-4S; Sun, 01 Dec 2024 10:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX3-0001We-IA
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:45 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX1-0004KF-Ny
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:45 -0500
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3ea369fdb0cso1893963b6e.3
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065602; x=1733670402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5/xoahRU3amiYGGR5zPHyc0xxRVZolbI3oRaPb2Uwc=;
 b=m0N0L/aODJdhXD4nxi66F3frlncwiLEgGX2hE5UwhXfTtdx1CjT9Zpiw+1j/JTy/tk
 0s7crFgF7QS6LbmqpSFtflUkSKE7XBqkFHTw4gys6ZzG2L63IniyKlwNn5V/tZb7kECY
 HbAyOYa4KWlswHuAQLl60wrUlE2atICoAjcF/HWfH44F5z/fbEyuc/CSmjGfXagF0l1e
 GjQkQJLDSSGSPFd5wQ8Wf7mEj8Azag4gOFpELCo2bl3HxjeQ7x5F+xnngOOccXCEYn3H
 jUsAiumNFIzORs3QddpcWORztwF//gKVuupF48j3jrKkP+BlzrrJmZQYVr2Ol8IZprBC
 Jn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065602; x=1733670402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5/xoahRU3amiYGGR5zPHyc0xxRVZolbI3oRaPb2Uwc=;
 b=oqolC2xNfO/2IFB+N9ivpcHfsEZjvploLk86C3MxdKzKcPpOFeaoqTArh4udrevLFD
 NRT2kJnmSwIgyuMUstnI23FJGZ7N6isnjLe+bbqNWmzEhjuMbkrbxjMmyGZ6ld4VkwTg
 z7By9F5s38z94Fu0QRWTqdyky9rxSti7JXRuV89pRewClV2sHxy+u68K3j7mZmody2Zq
 FNCb5//jLnd+cn34J56qq5DAxwUztnRhWgr32bNsHomhayDIU9R0JVBWg2S/+3kWaIHc
 rsBBPeO4CoGASpBHNLDIK4+SXAU1JE/GMlFJwwZV3sHF+dECDVeDLU5MIqjy8YD+Schy
 WUxA==
X-Gm-Message-State: AOJu0Yxb0aE3iqjMsqlSuP6Kkxq7AWHu/BDM4rDJhBDbfzw3UTzdGhxO
 9qFUH7xB5q+XAc+Z3h9foOp5MWxCB+ofbiv3njDlYquSz7QoLl5BPojM/pN0smVy4Rzz71X8YF3
 Iq9E=
X-Gm-Gg: ASbGncsG7RjhsRX0o7njsFHHWVmIZ5GMy/N9AzG/KrYxojfydo2T5S16qW5oEn9UoSJ
 6bgsQuvuf/OA4j8NV6USRgYy9VBxBd4vUr6RVrC/Rz46xs/9vIcuGpQE73Oxp2Gh/5vZ8O8zS4u
 jU9dSU2I/D0Oc8N7covQx5dlX/AXpavtH+fX9ziIP8QGOPyQoADblsPOcokSCvYeqA9ZfdFxIM2
 K69aTiuIjDLDauCfy3ueDSwycIaMAHDHCsSiJMK6KzUjqiuLbB24PWazvMPbjhJeisaHRsgMreP
 /i+EmsVcRDnM0qjQj4bkBO1cG82L8nBQzzZD
X-Received: by 2002:a05:6830:65c1:b0:717:d558:ca70 with SMTP id
 46e09a7af769-71d65c8a574mr16000450a34.7.1733065602183; 
 Sun, 01 Dec 2024 07:06:42 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 29/67] target/arm: Convert FRINT{32,
 64}[ZX] (scalar) to decodetree
Date: Sun,  1 Dec 2024 09:05:28 -0600
Message-ID: <20241201150607.12812-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wAnoxGuiT3uj

Remove handle_fp_1src_single and handle_fp_1src_double as
these were the last insns decoded by those functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 150 ++++-----------------------------
 target/arm/tcg/a64.decode      |   5 ++
 2 files changed, 21 insertions(+), 134 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b713c7d184..679bdd826c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8429,112 +8429,23 @@ static const FPScalar1 f_scalar_bfcvt = {
 };
 TRANS_FEAT(BFCVT_s, aa64_bf16, do_fp1_scalar, a, &f_scalar_bfcvt, -1)
 
-/* Floating-point data-processing (1 source) - single precision */
-static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
-{
-    void (*gen_fpst)(TCGv_i32, TCGv_i32, TCGv_ptr);
-    TCGv_i32 tcg_op, tcg_res;
-    TCGv_ptr fpst;
-    int rmode = -1;
+static const FPScalar1 f_scalar_frint32 = {
+    NULL,
+    gen_helper_frint32_s,
+    gen_helper_frint32_d,
+};
+TRANS_FEAT(FRINT32Z_s, aa64_frint, do_fp1_scalar, a,
+           &f_scalar_frint32, FPROUNDING_ZERO)
+TRANS_FEAT(FRINT32X_s, aa64_frint, do_fp1_scalar, a, &f_scalar_frint32, -1)
 
-    tcg_op = read_fp_sreg(s, rn);
-    tcg_res = tcg_temp_new_i32();
-
-    switch (opcode) {
-    case 0x10: /* FRINT32Z */
-        rmode = FPROUNDING_ZERO;
-        gen_fpst = gen_helper_frint32_s;
-        break;
-    case 0x11: /* FRINT32X */
-        gen_fpst = gen_helper_frint32_s;
-        break;
-    case 0x12: /* FRINT64Z */
-        rmode = FPROUNDING_ZERO;
-        gen_fpst = gen_helper_frint64_s;
-        break;
-    case 0x13: /* FRINT64X */
-        gen_fpst = gen_helper_frint64_s;
-        break;
-    default:
-    case 0x0: /* FMOV */
-    case 0x1: /* FABS */
-    case 0x2: /* FNEG */
-    case 0x3: /* FSQRT */
-    case 0x6: /* BFCVT */
-    case 0x8: /* FRINTN */
-    case 0x9: /* FRINTP */
-    case 0xa: /* FRINTM */
-    case 0xb: /* FRINTZ */
-    case 0xc: /* FRINTA */
-    case 0xf: /* FRINTI */
-    case 0xe: /* FRINTX */
-        g_assert_not_reached();
-    }
-
-    fpst = fpstatus_ptr(FPST_FPCR);
-    if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
-        gen_fpst(tcg_res, tcg_op, fpst);
-        gen_restore_rmode(tcg_rmode, fpst);
-    } else {
-        gen_fpst(tcg_res, tcg_op, fpst);
-    }
-
-    write_fp_sreg(s, rd, tcg_res);
-}
-
-/* Floating-point data-processing (1 source) - double precision */
-static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
-{
-    void (*gen_fpst)(TCGv_i64, TCGv_i64, TCGv_ptr);
-    TCGv_i64 tcg_op, tcg_res;
-    TCGv_ptr fpst;
-    int rmode = -1;
-
-    tcg_op = read_fp_dreg(s, rn);
-    tcg_res = tcg_temp_new_i64();
-
-    switch (opcode) {
-    case 0x10: /* FRINT32Z */
-        rmode = FPROUNDING_ZERO;
-        gen_fpst = gen_helper_frint32_d;
-        break;
-    case 0x11: /* FRINT32X */
-        gen_fpst = gen_helper_frint32_d;
-        break;
-    case 0x12: /* FRINT64Z */
-        rmode = FPROUNDING_ZERO;
-        gen_fpst = gen_helper_frint64_d;
-        break;
-    case 0x13: /* FRINT64X */
-        gen_fpst = gen_helper_frint64_d;
-        break;
-    default:
-    case 0x0: /* FMOV */
-    case 0x1: /* FABS */
-    case 0x2: /* FNEG */
-    case 0x3: /* FSQRT */
-    case 0x8: /* FRINTN */
-    case 0x9: /* FRINTP */
-    case 0xa: /* FRINTM */
-    case 0xb: /* FRINTZ */
-    case 0xc: /* FRINTA */
-    case 0xf: /* FRINTI */
-    case 0xe: /* FRINTX */
-        g_assert_not_reached();
-    }
-
-    fpst = fpstatus_ptr(FPST_FPCR);
-    if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
-        gen_fpst(tcg_res, tcg_op, fpst);
-        gen_restore_rmode(tcg_rmode, fpst);
-    } else {
-        gen_fpst(tcg_res, tcg_op, fpst);
-    }
-
-    write_fp_dreg(s, rd, tcg_res);
-}
+static const FPScalar1 f_scalar_frint64 = {
+    NULL,
+    gen_helper_frint64_s,
+    gen_helper_frint64_d,
+};
+TRANS_FEAT(FRINT64Z_s, aa64_frint, do_fp1_scalar, a,
+           &f_scalar_frint64, FPROUNDING_ZERO)
+TRANS_FEAT(FRINT64X_s, aa64_frint, do_fp1_scalar, a, &f_scalar_frint64, -1)
 
 static void handle_fp_fcvt(DisasContext *s, int opcode,
                            int rd, int rn, int dtype, int ntype)
@@ -8635,35 +8546,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         break;
     }
 
-    case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
-        if (type > 1 || !dc_isar_feature(aa64_frint, s)) {
-            goto do_unallocated;
-        }
-        /* fall through */
-    case 0x0 ... 0x3:
-    case 0x8 ... 0xc:
-    case 0xe ... 0xf:
-        /* 32-to-32 and 64-to-64 ops */
-        switch (type) {
-        case 0:
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_fp_1src_single(s, opcode, rd, rn);
-            break;
-        case 1:
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_fp_1src_double(s, opcode, rd, rn);
-            break;
-        case 3:
-        default:
-            goto do_unallocated;
-        }
-        break;
-
-    case 0x6:
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 476989c1b4..e828834c16 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1340,6 +1340,11 @@ FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
 
 BFCVT_s         00011110 10 1 000110 10000 ..... .....      @rr_s
 
+FRINT32Z_s      00011110 0. 1 010000 10000 ..... .....      @rr_sd
+FRINT32X_s      00011110 0. 1 010001 10000 ..... .....      @rr_sd
+FRINT64Z_s      00011110 0. 1 010010 10000 ..... .....      @rr_sd
+FRINT64X_s      00011110 0. 1 010011 10000 ..... .....      @rr_sd
+
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

