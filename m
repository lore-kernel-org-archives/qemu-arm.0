Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp584880njc;
        Mon, 24 Jun 2024 22:09:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+FM6iNkCiaUrE8yzGm9JrSnp1opMnXWnE3xbYVhRmWMz3aoaFZr8OLFb3qbujPHGj6uXjnj68cpNLwVkSA/gxPeGW3we3
X-Google-Smtp-Source: AGHT+IGhrhJBowpBRwM1YSY1fKLRt/PqJTo10DniREtbeFUMHyo1G0X3O9ePf5ysNUY5Lt/ADXyD
X-Received: by 2002:ad4:4e2f:0:b0:6b4:e712:468c with SMTP id 6a1803df08f44-6b53653d69dmr62530426d6.62.1719292171657;
        Mon, 24 Jun 2024 22:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719292171; cv=none;
        d=google.com; s=arc-20160816;
        b=SxgS/AtCXG8CuQKDiPiPS34juqRxYcXtIsaYETpcqW37sfvlEUtgOFexNkxeYFUgBU
         kT6wsZGWBYsi3+XSfMGqQEH4IR/P8K9zlTyM9ItyPRDZHJQjCVGrUAm6kzOLHeIBYaod
         76OOvoH+h95QuxQxFLo4/yb6uGxqaSVaz3+5h8dhYMfkAa83LHEDpUu8ppywsRhEg6gO
         hJln2PZjkXlgfVUvioOWwftD1hckeG0vECi0fM1KH2T46/nfNOVKMhYDfnBnCASGQ1DC
         TMf4APFZSs5q3OtYRdlRDxnss6MTydyLTFL/pAjT836GFJOCLy9pKIbdUybSogNM7Cyt
         FHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TQx1O4lRhBgRZKl91tzhM+7YS0VF3KiwHZYbH152yYY=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=B9qM0AcS/dMwzvNNIvDTnCweDnuTXLjZctJMKJtMdhO4uXHTNmBhPaY/fdW2NXyidE
         /zEB2FdBVrB8C1YQxqR6XFMPaI/56o/0MtTR7qq31V/NjcXuzIiX7q5LLViAnKYKJo/Q
         +zreidS93fZzeMwyxDynIlZccAq1PtKaGpWgmR8/Qmr5fz8UfZJcie0RFxinZg3r4jon
         dQPec1y7Bow63Rcw1nciXf8h4QISv50uY2RJ0EXMw5hGuFcVGaSBeZQMcacyYZE7ftcs
         Cnh5JtEehbmLn7F7j4RyCEgVHprikt0d6NeZ5nAE0TJJTch9ShUeXzw5903IxQozlpfJ
         eI/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGLWjTwd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51edd3772si99372716d6.363.2024.06.24.22.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 22:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VGLWjTwd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sLyPw-0001Cb-1H; Tue, 25 Jun 2024 01:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPt-0001AO-Ts
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 01:08:29 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPq-0001ZQ-QG
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 01:08:29 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1f47f07aceaso39877395ad.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2024 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719292105; x=1719896905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQx1O4lRhBgRZKl91tzhM+7YS0VF3KiwHZYbH152yYY=;
 b=VGLWjTwdWb6Vgkn2I9rhOITeYUztro7JTAbBQ7EmyjgT5dyPsDSuO+KIUj8e27iNpN
 kKyBdzyvEAb6Vf1V4FXbto0yWZYMMbD2QeiCfpnmbhMyy/7aEdYi43ZdTYjFTXXUKDqJ
 zI2r3CTR+yNWETH7L5bMVt9mygNMxdMDNWIkLk4tatW8QoEzuNKCkFMk9hm2kMttFCGs
 8ipFa0onP2AT28zbuI7YzZytuCRpyrQmG1qGYQwii4S3GTJr9AS19cmXONg4PE95GtvC
 hw2TbX1Mn/cpdj60AxLdK2IiKj2W7LFlY6CegIaQEaL0AmKDA8M+m29bnQLmKeBuqe28
 6Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719292105; x=1719896905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQx1O4lRhBgRZKl91tzhM+7YS0VF3KiwHZYbH152yYY=;
 b=lGjQXTCWcO9QXl7QWN4O1dv2NKAtVU/n48iejwlEMf4GDKw6K0p4Tp2Zsyu7VBejCb
 ita6tqCoNQze1ULL2g+VRwXBY9MAkl8zkb+nwONM37LZk1c3TDfz+FbAyrYH+C9UjMBS
 6wEPvTBQCrAVJsX2McRu29OlAhmIaL3xwPk50Wp/eZh8cfvaUC3U256RG47ryI1Oiddg
 6vdXc2rnAPL2Tg1d4amYruPZSOGSWshr/fyc1+CXriTab1hXEeQn/NObCCuH6YfJhQ1b
 QuYq1A7ihrjcIf5RnxZcOb05j9Buo5VJ6zWtP/O09e4x6J3uOZFBq9QDAPQqvF95chwH
 lijw==
X-Gm-Message-State: AOJu0YwNpcQNyJuVzolSEgQxilbCC99TJ0kKNndUIx69RULef+diDHXK
 xagIZhIm2vTvKOKOSEVmk54PY/MVsblEnoWtfmur+wiF+IfmqNWOugTn91VsIwO3tonL2Z0IN7+
 H
X-Received: by 2002:a17:902:ea08:b0:1f7:2479:a50b with SMTP id
 d9443c01a7336-1fa15937ad1mr88233715ad.54.1719292105245; 
 Mon, 24 Jun 2024 22:08:25 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbc72e9sm70843865ad.296.2024.06.24.22.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 22:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/13] target/arm: Delete dead code from disas_simd_indexed
Date: Mon, 24 Jun 2024 22:08:10 -0700
Message-Id: <20240625050810.1475643-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625050810.1475643-1-richard.henderson@linaro.org>
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: PDHWecQzv7xn

The last insns in this block, MLA and MLS, were converted
with f80701cb44d, and this code should have been removed then.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 93 ----------------------------------
 1 file changed, 93 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0a54a9ef8f..11955c0c36 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -11979,7 +11979,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int h = extract32(insn, 11, 1);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    bool is_long = false;
     int index;
 
     switch (16 * u + opcode) {
@@ -11993,12 +11992,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-        is_long = true;
         break;
     case 0x03: /* SQDMLAL, SQDMLAL2 */
     case 0x07: /* SQDMLSL, SQDMLSL2 */
     case 0x0b: /* SQDMULL, SQDMULL2 */
-        is_long = true;
         break;
     default:
     case 0x00: /* FMLAL */
@@ -12050,96 +12047,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
 
     if (size == 3) {
         g_assert_not_reached();
-    } else if (!is_long) {
-        /* 32 bit floating point, or 16 or 32 bit integer.
-         * For the 16 bit scalar case we use the usual Neon helpers and
-         * rely on the fact that 0 op 0 == 0 with no side effects.
-         */
-        TCGv_i32 tcg_idx = tcg_temp_new_i32();
-        int pass, maxpasses;
-
-        if (is_scalar) {
-            maxpasses = 1;
-        } else {
-            maxpasses = is_q ? 4 : 2;
-        }
-
-        read_vec_element_i32(s, tcg_idx, rm, index, size);
-
-        if (size == 1 && !is_scalar) {
-            /* The simplest way to handle the 16x16 indexed ops is to duplicate
-             * the index into both halves of the 32 bit tcg_idx and then use
-             * the usual Neon helpers.
-             */
-            tcg_gen_deposit_i32(tcg_idx, tcg_idx, tcg_idx, 16, 16);
-        }
-
-        for (pass = 0; pass < maxpasses; pass++) {
-            TCGv_i32 tcg_op = tcg_temp_new_i32();
-            TCGv_i32 tcg_res = tcg_temp_new_i32();
-
-            read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : MO_32);
-
-            switch (16 * u + opcode) {
-            case 0x10: /* MLA */
-            case 0x14: /* MLS */
-            {
-                static NeonGenTwoOpFn * const fns[2][2] = {
-                    { gen_helper_neon_add_u16, gen_helper_neon_sub_u16 },
-                    { tcg_gen_add_i32, tcg_gen_sub_i32 },
-                };
-                NeonGenTwoOpFn *genfn;
-                bool is_sub = opcode == 0x4;
-
-                if (size == 1) {
-                    gen_helper_neon_mul_u16(tcg_res, tcg_op, tcg_idx);
-                } else {
-                    tcg_gen_mul_i32(tcg_res, tcg_op, tcg_idx);
-                }
-                if (opcode == 0x8) {
-                    break;
-                }
-                read_vec_element_i32(s, tcg_op, rd, pass, MO_32);
-                genfn = fns[size - 1][is_sub];
-                genfn(tcg_res, tcg_op, tcg_res);
-                break;
-            }
-            case 0x0c: /* SQDMULH */
-                if (size == 1) {
-                    gen_helper_neon_qdmulh_s16(tcg_res, tcg_env,
-                                               tcg_op, tcg_idx);
-                } else {
-                    gen_helper_neon_qdmulh_s32(tcg_res, tcg_env,
-                                               tcg_op, tcg_idx);
-                }
-                break;
-            case 0x0d: /* SQRDMULH */
-                if (size == 1) {
-                    gen_helper_neon_qrdmulh_s16(tcg_res, tcg_env,
-                                                tcg_op, tcg_idx);
-                } else {
-                    gen_helper_neon_qrdmulh_s32(tcg_res, tcg_env,
-                                                tcg_op, tcg_idx);
-                }
-                break;
-            default:
-            case 0x01: /* FMLA */
-            case 0x05: /* FMLS */
-            case 0x09: /* FMUL */
-            case 0x19: /* FMULX */
-            case 0x1d: /* SQRDMLAH */
-            case 0x1f: /* SQRDMLSH */
-                g_assert_not_reached();
-            }
-
-            if (is_scalar) {
-                write_fp_sreg(s, rd, tcg_res);
-            } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-            }
-        }
-
-        clear_vec_high(s, is_q, rd);
     } else {
         /* long ops: 16x16->32 or 32x32->64 */
         TCGv_i64 tcg_res[2];
-- 
2.34.1

