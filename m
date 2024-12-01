Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2153314njk;
        Sun, 1 Dec 2024 07:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWyPzSDsequssyUTPpXBMrXrSUHnD/RoylcW3epJJXSEGK3e6SgHwXvOuYmZKk3OWyEHgYISDstVGowJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFWxSLWTRS0QqmhKLhM+m0hma0LscBQiJXTWGxQek6oZ8fQHBOgvvkeCsKveDb5rmyxolpN
X-Received: by 2002:a05:620a:40c5:b0:7b1:543d:c99 with SMTP id af79cd13be357-7b67c2b0817mr2842434085a.24.1733066156722;
        Sun, 01 Dec 2024 07:15:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066156; cv=none;
        d=google.com; s=arc-20240605;
        b=WDkr/TuQybifTBVYio4pHWpSuzBW68bxeDqKLJAYm8S4/54L2Y31Gv6wBunXSc0anJ
         rL6aAhL7fZhH6aWpkx3191THh50bRgLOLgg/3s0qsjEW267yrUXQzoY2zgQ9FmVP8Aer
         g4T/rRjUL2PvWkGBprUWN44jO3MyzczObUyRtYzXvpKhooLfQeA60SiZYEu8ALpVUHgd
         YOIevqturs3qAu65LazbAbRb0tPnO/uq8Df6YYKZHmW95YiXEax0afYI/ey3SrTd6fgM
         yd/N2BrxzOFQPed3w5wynGMyr5FrzZNqY+U8qlvq9hDzluxYjrYYThLfBr5Kyvw0tyHS
         5P5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UMhtfBuwPRg9Cp8ZBzyqrotyhkW2U1MLrVH4X39MPUc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=RbGjoKY0aE20acwjzDeV0jd7ChO0bCDarIwx/2MrlHGGnlAnfGh6M/NYFGa0q7HCCp
         m09OX/4EDC6sUhWPULp+xz9KHWbWGy8GoKuyYI53YyZ4qunHI3TFYyqqSgmkmeWy5ldi
         Rk9E+CgV4AgiIZv45IN4nxlizth7Jx89zoUWouM7vrPEBGSn5KxbHP3k5D02JwL7fXsQ
         LOuAuVDf1mU+w3uJ9e9k39mCb+3AhV5ibeNju4X8s2g+pEXdq9eyo+/VA8HxmlJW39e/
         7OKNGA6vz7JcT/L3fGZFVAD5IsKUcenJBP721TUlJ5io1K6VFdhm+F48GkJMnxIPhy9T
         txmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+9wofSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af593db1adsi3133757137.689.2024.12.01.07.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:15:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+9wofSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlbG-0003Ji-5Z; Sun, 01 Dec 2024 10:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaO-00083J-4A
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:14 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaI-0005B0-Qk
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:09 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-71d5ecf9556so1340237a34.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065805; x=1733670605; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMhtfBuwPRg9Cp8ZBzyqrotyhkW2U1MLrVH4X39MPUc=;
 b=F+9wofSunGGzW/b63lM8IESAjEuCVirl/yejSk57+s3euwcbuVzY2+8Li5Wj0B+r7U
 19frTeee/QDKYW8frsVCXuws7c2PP9eVJkSej0qMVk1zR5v4p02u4b5g/Krom7j3ekSJ
 V5aiku7D+YjmVzc2Jlp1xRO47uPHo2hX8HuU1Sc22S0TeFx7yBn7bzlfCpd0e5IViwkt
 laDbQsFcsktL6nc1CdjaEk+ruEzdiplJBS/5/4r4/3XVBQv1MKdVOpC98EIZLkxQO3R3
 Zg7gZIYp58DLKqCxajniwKvgQDnmYCsShLKz18LdBFHF8MCKdGJMsEgpwA69Yyrmybxf
 jE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065805; x=1733670605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMhtfBuwPRg9Cp8ZBzyqrotyhkW2U1MLrVH4X39MPUc=;
 b=L5JnQ98OmU4PERnzU1AghthjdT1TNxj26WddDbZhQJ/TMAKVo7eTGBaILDRPQ+8Qk/
 N6Ki6ZGxXvHUmtvpvxrDNlbAs1vz+JCgqAKDc5u7pVKdHtnkc+zZ3MVDUyTF402+69ZP
 IAEwUQRDybL1ioIpbpiVgWG5xEXn3lcsOXcuI01OYVPhdOZ2LhrOVW6Go4R42LlrtxMC
 xFCoh2/IhW6fM8Lfnm6tngmQtd90yx/9KL7Ll6KciwGluVDVzsbkq2BpwDnU6/7+vFFc
 hu0plzS4dLk/IiQnLLy98Zo4PqdGSi/2VvuGOs/SZuLfjnuv1itmrWQaZqm1YSofcoVX
 rYpA==
X-Gm-Message-State: AOJu0Yzz0Z2WXiet5TFUPEOU++6XGC/zddpi0Ggjm2TKNn/bGEOll7EH
 QZ64lPspv+zOT/mJ5WPEZ95UFEIMqm7I8vLgymy41f6TJVDe1kDo9YKU4tpTxgfIj9HPZCxKUEf
 C/YA=
X-Gm-Gg: ASbGncto/V1bpclLpHZ9QJJjUa8Vgg5OjYGCLVVtb+0fGzcTBSA6ONDQK0ayf4eNnGF
 m91jyArVRs7JGUsucVqbI2eXlKdiUrRnTX3Kps20f/VvRq80Ao+kf2NhNCIwPd8WLqBADaqPkLa
 nZ30bRIpeTeWMdO9FQEe46HJHJxcHkppL6p43Y+WfiRcO4+fDKeEL4GMkXnIvbBBAAMpJug2b3b
 Jz9vQBq87X8IOU4Wt73xSbwiBewJGmtwr5LTdruoFWrTwWldqWp6QUzRkl8iEKDibCS4K24IOtB
 WS6/Pi4z5GFrLktUVVvw3ZZHc5DWtt7AhvBl
X-Received: by 2002:a05:6830:44a2:b0:71d:5484:9385 with SMTP id
 46e09a7af769-71d65c926bdmr16310081a34.7.1733065805656; 
 Sun, 01 Dec 2024 07:10:05 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 50/67] target/arm: Convert FCVTXN to decodetree
Date: Sun,  1 Dec 2024 09:05:49 -0600
Message-ID: <20241201150607.12812-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
X-TUID: DA7BVUpnyBEK

Remove handle_2misc_narrow as this was the last insn decoded
by that function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 101 +++++++--------------------------
 target/arm/tcg/a64.decode      |   4 ++
 2 files changed, 24 insertions(+), 81 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8b76c307af..dd46749ac6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8979,6 +8979,24 @@ static ArithOneOp * const f_scalar_uqxtn[] = {
 };
 TRANS(UQXTN_s, do_2misc_narrow_scalar, a, f_scalar_uqxtn)
 
+static void gen_fcvtxn_sd(TCGv_i64 d, TCGv_i64 n)
+{
+    /*
+     * 64 bit to 32 bit float conversion
+     * with von Neumann rounding (round to odd)
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    gen_helper_fcvtx_f64_to_f32(tmp, n, tcg_env);
+    tcg_gen_extu_i32_i64(d, tmp);
+}
+
+static ArithOneOp * const f_scalar_fcvtxn[] = {
+    NULL,
+    NULL,
+    gen_fcvtxn_sd,
+};
+TRANS(FCVTXN_s, do_2misc_narrow_scalar, a, f_scalar_fcvtxn)
+
 #undef WRAP_ENV
 
 static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
@@ -9082,6 +9100,7 @@ static ArithOneOp * const f_vector_fcvtn[] = {
     gen_fcvtn_sd,
 };
 TRANS(FCVTN_v, do_2misc_narrow_vector, a, f_vector_fcvtn)
+TRANS(FCVTXN_v, do_2misc_narrow_vector, a, f_scalar_fcvtxn)
 
 static void gen_bfcvtn_hs(TCGv_i64 d, TCGv_i64 n)
 {
@@ -9651,68 +9670,6 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
     }
 }
 
-static void handle_2misc_narrow(DisasContext *s, bool scalar,
-                                int opcode, bool u, bool is_q,
-                                int size, int rn, int rd)
-{
-    /* Handle 2-reg-misc ops which are narrowing (so each 2*size element
-     * in the source becomes a size element in the destination).
-     */
-    int pass;
-    TCGv_i64 tcg_res[2];
-    int destelt = is_q ? 2 : 0;
-    int passes = scalar ? 1 : 2;
-
-    if (scalar) {
-        tcg_res[1] = tcg_constant_i64(0);
-    }
-
-    for (pass = 0; pass < passes; pass++) {
-        TCGv_i64 tcg_op = tcg_temp_new_i64();
-        NeonGenOne64OpFn *genfn = NULL;
-        NeonGenOne64OpEnvFn *genenvfn = NULL;
-
-        if (scalar) {
-            read_vec_element(s, tcg_op, rn, pass, size + 1);
-        } else {
-            read_vec_element(s, tcg_op, rn, pass, MO_64);
-        }
-        tcg_res[pass] = tcg_temp_new_i64();
-
-        switch (opcode) {
-        case 0x56:  /* FCVTXN, FCVTXN2 */
-            {
-                /*
-                 * 64 bit to 32 bit float conversion
-                 * with von Neumann rounding (round to odd)
-                 */
-                TCGv_i32 tmp = tcg_temp_new_i32();
-                assert(size == 2);
-                gen_helper_fcvtx_f64_to_f32(tmp, tcg_op, tcg_env);
-                tcg_gen_extu_i32_i64(tcg_res[pass], tmp);
-            }
-            break;
-        default:
-        case 0x12: /* XTN, SQXTUN */
-        case 0x14: /* SQXTN, UQXTN */
-        case 0x16: /* FCVTN, FCVTN2 */
-        case 0x36: /* BFCVTN, BFCVTN2 */
-            g_assert_not_reached();
-        }
-
-        if (genfn) {
-            genfn(tcg_res[pass], tcg_op);
-        } else if (genenvfn) {
-            genenvfn(tcg_res[pass], tcg_env, tcg_op);
-        }
-    }
-
-    for (pass = 0; pass < 2; pass++) {
-        write_vec_element(s, tcg_res[pass], rd, destelt + pass, MO_32);
-    }
-    clear_vec_high(s, is_q, rd);
-}
-
 /* AdvSIMD scalar two reg misc
  *  31 30  29 28       24 23  22 21       17 16    12 11 10 9    5 4    0
  * +-----+---+-----------+------+-----------+--------+-----+------+------+
@@ -9784,15 +9741,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
             rmode = FPROUNDING_TIEAWAY;
             break;
         case 0x56: /* FCVTXN, FCVTXN2 */
-            if (size == 2) {
-                unallocated_encoding(s);
-                return;
-            }
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_2misc_narrow(s, true, opcode, u, false, size - 1, rn, rd);
-            return;
         default:
             unallocated_encoding(s);
             return;
@@ -10105,16 +10053,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             handle_2misc_reciprocal(s, opcode, false, u, is_q, size, rn, rd);
             return;
-        case 0x56: /* FCVTXN, FCVTXN2 */
-            if (size == 2) {
-                unallocated_encoding(s);
-                return;
-            }
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_2misc_narrow(s, false, opcode, 0, is_q, size - 1, rn, rd);
-            return;
         case 0x17: /* FCVTL, FCVTL2 */
             if (!fp_access_check(s)) {
                 return;
@@ -10164,6 +10102,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         default:
         case 0x16: /* FCVTN, FCVTN2 */
         case 0x36: /* BFCVTN, BFCVTN2 */
+        case 0x56: /* FCVTXN, FCVTXN2 */
             unallocated_encoding(s);
             return;
         }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1412b99241..bc87dd4a03 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -74,6 +74,7 @@
 
 @qrr_b          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=0
 @qrr_h          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=1
+@qrr_s          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=2
 @qrr_bh         . q:1 ...... . esz:1 ...... ...... rn:5 rd:5  &qrr_e
 @qrr_hs         . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=%esz_hs
 @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
@@ -1648,6 +1649,8 @@ SQXTUN_s        0111 1110 ..1 00001 00101 0 ..... .....     @rr_e
 SQXTN_s         0101 1110 ..1 00001 01001 0 ..... .....     @rr_e
 UQXTN_s         0111 1110 ..1 00001 01001 0 ..... .....     @rr_e
 
+FCVTXN_s        0111 1110 011 00001 01101 0 ..... .....     @rr_s
+
 # Advanced SIMD two-register miscellaneous
 
 SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
@@ -1680,4 +1683,5 @@ SQXTN_v         0.00 1110 ..1 00001 01001 0 ..... .....     @qrr_e
 UQXTN_v         0.10 1110 ..1 00001 01001 0 ..... .....     @qrr_e
 
 FCVTN_v         0.00 1110 0.1 00001 01101 0 ..... .....     @qrr_hs
+FCVTXN_v        0.10 1110 011 00001 01101 0 ..... .....     @qrr_s
 BFCVTN_v        0.00 1110 101 00001 01101 0 ..... .....     @qrr_h
-- 
2.43.0

