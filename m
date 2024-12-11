Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192755njb;
        Wed, 11 Dec 2024 08:36:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYrZ0Fojgew+sBI8LFSsk1EDXQsbELBBF7IppNue7kjxnxRdnf0Sqe2MbcN41wbgMFdN7pPiOikuG/SA==@linaro.org
X-Google-Smtp-Source: AGHT+IF8LLDLl9Gn262TZGyR82JJ7jL6BF8uXW5V68S9GGY3cHFXKtPX6rjkVNSPSTgrpmwklooy
X-Received: by 2002:ac8:5a03:0:b0:466:957c:ab22 with SMTP id d75a77b69052e-4678937a7edmr60038091cf.43.1733934980367;
        Wed, 11 Dec 2024 08:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934980; cv=none;
        d=google.com; s=arc-20240605;
        b=TUnyznEdwJmgbNqz/VIiatCdMIjxIA+9VxuC5jGqFvCR0gVUF4+CGUDiSfzP6jnzTM
         fOhr7JWj0Gv7qP9FZjVKidfP7iPdICajdm80mbwXcG8+a6nsKdsg7MiXZcA4zbgd8yV+
         TLxHMkmIyx04fVP7Och8CP5hT1E/4KWQgQO9h1uMtdehDLZoRh+sBkMCwH8fBidzmwUj
         12EU8YiNtoWLh9oNeD9dz+bB8/yv3r9p+6/yg5tbWoK5UnJUih5n8kt0PQkK0W3TjLmw
         twrk75C0U0+JnTK1vJtLIqxreWqXjM52HYE7fh94/h8ctDdMySZhtRr+7hFyjLdhIKuX
         vYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jWpGF0MWOyQ7aY+8srtHXfE0p6nJA0FpviKAVQm8scA=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=H0rB/jSuEwOAjNwQT4H+prFtKNxHmTKT3BcPHOfGyNcVUhwiFEgqW3On39r2U/B78d
         vyFXnY8qOp0ZaI8Q7c/wi8Mfs8IS1EUQyvbJw0TI9AwdpaelUfi7xFltX3dgpjGTNNCa
         y53e4qho87Z8BHmdrK94JuLlWsNUHIAot2OAv1g5rPFKSAHixb/RQyjVagrXcef4manz
         vKLMJ/GzR5XxWGNSIb61Tik4J01IxQmdpry0CPMR9Ogv4zOqB1o7CPrnCozkkyjr8636
         j4g9JgHTNYAASKep+4Rfx1B5T56CrD/O99GZLQfistTS8eIGsX55TV2w8iP6KpiLEzLh
         jDGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yEps5kh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46789387ce9si22729381cf.432.2024.12.11.08.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yEps5kh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdx-00081s-Cl; Wed, 11 Dec 2024 11:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdN-0005YW-A5
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:22 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdL-0001Px-JM
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:21 -0500
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4674f1427deso48067731cf.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934737; x=1734539537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWpGF0MWOyQ7aY+8srtHXfE0p6nJA0FpviKAVQm8scA=;
 b=yEps5kh2sqILOCssehvE/5IhqqhrGjc4Kr9KBlxzuizzQHSIMUD/jtADWljpp6rlBw
 9RMPdK/hP5dUC1h/U7CZSLqCb4C/0Ot3j+LCPmoJGreIBvlJMRAuh3lSmQLh+GNBmJ95
 PTpPnDJHjeiI7fN/sa0Eam41jOQLt1XVfsdCCWuGhO4FBajAZe4MO8PdHDa2j7U31qdo
 Jbj6NJQh3MuDtv6Q/VmRmJtq99axKKK/QNI2s0e01sZL/Ux2UugGkTNDa01LZ2xwdlhQ
 +4DRHGxsCJ9l4alwdUlHrSP7ev4iYo1t7L/4lDDTsSLXOFhvyNvT2KQnRGnRgcwYmJ26
 JGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934737; x=1734539537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWpGF0MWOyQ7aY+8srtHXfE0p6nJA0FpviKAVQm8scA=;
 b=IZ1NMGIq32Agljr357ffK0xixLamKOfLnXkn67T/XFDk5eTxz+v41gTkaHG5uT4gzJ
 JzQ98p/Tf89wgk1b9O+tFLZnxDyu3PpktYY2h8mY6b7szDqTnAczqxzIOtYT7/qvcnX4
 YSt08egCkSTd851zvyetTFJVpdttb7oAXAEMVGZQTD2OpbPGkkE+nKFvOshUMZDufwSM
 qE9fJQU6X+KINpBe0BbSlopWpDnsJ+kmcM8pzYyeYjpHbBTIbCjnOs9Tw+l2q6pZI0hm
 OqGwe3FnfGlNm2tb6vKZY3+0ecYZzsOeRFTDxRIbPFBXS0VTCLHxyMqMfu7XaUoDdqqs
 yOBw==
X-Gm-Message-State: AOJu0YwHe9jN8fJHSGXjHEPuRDvxWhoeFjfOgPoGkR4T7Zt3CU15iCkS
 VNVs5OvZh9VfyITzVEJfuUvfsP/9bkDQBNwEYJ2p/HCSuGDBpeEv+jZfm6A3v8c=
X-Gm-Gg: ASbGncuYfuV5/HH+wwhE+TuzsfVooB/WmKItEH9BiNXngVlwoSRD3ukrrF/DTmz+7FU
 KfW6IS9jJkPze5hCSTIHvo2QVHHctsUbL8Hpdq/GMLIwLhkk0X0YFpoUWZwIkwL+ud9Ka8pg/Ln
 lwLHekLsWTc7rSiWBID27OW+NkQZCtv1DuoEXKmoTXcf58zA1fIlWmxTTaW6oeIjJVvoT9GUylq
 RL+2NBdheNnW3Tq+idNxIxbYoLrhCXTRYbBrHcDmLOj7/ZcvGXR/d0S+7I/Pw==
X-Received: by 2002:a05:622a:309:b0:467:61c1:df3e with SMTP id
 d75a77b69052e-46789315d7amr53578541cf.30.1733934737020; 
 Wed, 11 Dec 2024 08:32:17 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 30/69] target/arm: Convert FRINT{32,
 64}[ZX] (scalar) to decodetree
Date: Wed, 11 Dec 2024 10:29:57 -0600
Message-ID: <20241211163036.2297116-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
X-TUID: cl6jqF8yPB4K

Remove handle_fp_1src_single and handle_fp_1src_double as
these were the last insns decoded by those functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 146 ++++-----------------------------
 target/arm/tcg/a64.decode      |   5 ++
 2 files changed, 22 insertions(+), 129 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5b30b4caca..e48dd308fc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8425,112 +8425,23 @@ static const FPScalar1 f_scalar_bfcvt = {
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
-    case 0xe: /* FRINTX */
-    case 0xf: /* FRINTI */
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
-    case 0xe: /* FRINTX */
-    case 0xf: /* FRINTI */
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
@@ -8631,30 +8542,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         break;
     }
 
-    case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
-        if (type > 1 || !dc_isar_feature(aa64_frint, s)) {
-            goto do_unallocated;
-        }
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
     default:
     do_unallocated:
     case 0x0: /* FMOV */
@@ -8669,6 +8556,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     case 0xc: /* FRINTA */
     case 0xe: /* FRINTX */
     case 0xf: /* FRINTI */
+    case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4a48fcff1d..4f7b3ee3d9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1340,6 +1340,11 @@ FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
 
 BFCVT_s         00011110 01 1 000110 10000 ..... .....      @rr_s
 
+FRINT32Z_s      00011110 0. 1 010000 10000 ..... .....      @rr_sd
+FRINT32X_s      00011110 0. 1 010001 10000 ..... .....      @rr_sd
+FRINT64Z_s      00011110 0. 1 010010 10000 ..... .....      @rr_sd
+FRINT64X_s      00011110 0. 1 010011 10000 ..... .....      @rr_sd
+
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

