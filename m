Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193477njb;
        Wed, 11 Dec 2024 08:37:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJRwJ8A4nqiSJfDeEBzFXCwXOFuEn4CL0fDCoAA0969pJldRA1FTirbgJIQ86TgZ1Bf2p3cHIABdvoug==@linaro.org
X-Google-Smtp-Source: AGHT+IGr/7aBF8uNaNFUQ453cqYDBlkNU6lFpuhTXznff5FobqCDDy7XRlVFBzrtKOOoZSupOpCE
X-Received: by 2002:a05:6214:2461:b0:6d8:a70d:5e41 with SMTP id 6a1803df08f44-6d934b8fae0mr69244276d6.33.1733935037186;
        Wed, 11 Dec 2024 08:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935037; cv=none;
        d=google.com; s=arc-20240605;
        b=JhNquSHzG63M/qX+j4fYET2IWPqqf8PxeVrgSRfkThI46Kvmm7kmtjyCRMb5xvgfLw
         Qt8j837dv6T+DhP7kzvVbHBv8v7cIUSKGd6zI+r5mC2zH2l4ZNJYdf5iAPSRJ0sgFMOK
         tdvfk0x5IXKD9jV8AT3dqTdYzHar/efgE+aL9CWHG1LtBhHoMowDfjYlkz02pjXeYKHy
         fxON/prdT6sXElnUu+fSpRpyoQ/xt9KFI+i6UVWhRaDXCjVhZ/nm8pnRd9JdOhtmgYPI
         l12JdKQy4gsCvFPJQA+WL4GEg+QcO1ougBigpCrTz7Usi9A6Lr+YV2to3nWMwiE5nKLP
         jjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x3n7GIpbiAxM941owV9rTCZ55j+n45R7K1MmLLxzJJ8=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=R5dSpZiuedziXXvbPC4VRKT3KjSO5tMufN5YCb7OEUQYbJQjNU2MLuM+SB3G9zCmnx
         LOML2NyvmrjadUaA/BQhSXK6O5InlD51R29WqRrIbmE5A2M7f6MvpqH1FYFFsdMRglOb
         8DdNwEi19civPkXnHfNE4yFiRMadh2enieiFDFYaLk0TEAe8rdiirv0lNbBwzhc4CMb3
         qIxD+EO1jbW50Vo3dG2GHfILXPZrp2R65rBQgPpPEJ36qROszmIrHMFl80wlskR1kvYb
         +QDY1vvH6414cyldFEPkVLPY2lAmEQwJ5veM1AfSwfoaQ97wNx7EKzwyLBF8Go9HuKg7
         sh3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbzdC9CX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da69e94bsi168530096d6.158.2024.12.11.08.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbzdC9CX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPfM-0002yv-8J; Wed, 11 Dec 2024 11:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdW-0006Mk-DD
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:31 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdU-0001ST-AO
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:30 -0500
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-467838e75ffso20313311cf.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934747; x=1734539547; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3n7GIpbiAxM941owV9rTCZ55j+n45R7K1MmLLxzJJ8=;
 b=gbzdC9CXZzHBShkCQZigR43MNhpN820gpbcGd9L41kXlMP01Bo/J9fCg9KwxyL4l3E
 fE1heUImfJmGU5QAcf80Q7+V6QF5hWlblUQkB0htIZwUrhP3fTdFha4ByJcn0onGVLSx
 7LfwTetRIl16BLztutfXFGoRFgDkYj8XahXJ/MnDsKfw+3hV1GrK11lgB9ie8rSnUJDn
 glwy1MdWoFXuVVaOHT09de9Ty/Z3XZaX9mdC2ecEbJZKNiy1yh72MgO/r0HHw5yrL1eX
 QN5OLZY45MyDmwkjapdStcOJ6QLxNalB081+k0yqzQKpxldmuhxmN7mpK7hSU8TwrbnX
 pJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934747; x=1734539547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3n7GIpbiAxM941owV9rTCZ55j+n45R7K1MmLLxzJJ8=;
 b=RQhshCql24LRDX/zJJsnoAe4UqfY2KUyHuXxzuMhymd6nUCteRX0BdaTek/J41rFHT
 hPE1E8/PIMIr7g+Yv07dlcBYJNkKmvHFePJW91xH0aq+RNkw6osSaSZpu6VPh5c/MGrB
 uRZEFVXFfn6ljIRFD6uC6isF0Y8XR862Dp9Eal8/ksT2uAC2WaHAuXyYhd7LDdRIaQFz
 RrU7HbvcqkZBj/KKY01M+lzyBVo1xDhufWB1RZtAaE70IwBYN+IIXDf7R+0pt9lTXxvc
 nEhyIJ58lTLMOhTu2LtqDz+FqlaIzK6MMZrgrIU1N0EK5jWjKiUIqRlP/nWEpY/6hd5E
 B3ig==
X-Gm-Message-State: AOJu0YzvIruYqeKur0uOMuskLPTlVYQLBB25Yfz0VUTTSWvGWHXDq3da
 v4abN9xy214XHCosgddyeck4mpjJBvcsQM0X5fUIKd85qyCPIDx7GwoFnTt+BuX9KzaDT3Nf2/P
 W4E5GSbl7
X-Gm-Gg: ASbGncusgc8hV6yJNtevZN/eIT5r86XBan9GT74MvvA5CyiZoYyKzNiFQ6xzdtPA1NY
 mnwSQsyiSHCsfDvawErdxj6HvzHaK1MNHILywPuIF7Hfz/nagwNjGB6REhxF6P3kOWkOWA8EQsM
 BgpUD2mk40vtACOHB+U4STBrMGhUpbr6UvCzO9R3KEJHcynZnkiWOQOP9sYbRglXvpUCGRQHELR
 PGcb6G3nxkmShsZh89LZ/z04u8walBEUz/Hy4k+dG12velTIYYMoJqTa5EpOg==
X-Received: by 2002:a05:622a:1a07:b0:467:607f:eefa with SMTP id
 d75a77b69052e-467960120cdmr567891cf.0.1733934747319; 
 Wed, 11 Dec 2024 08:32:27 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 34/69] target/arm: Convert handle_fmov to decodetree
Date: Wed, 11 Dec 2024 10:30:01 -0600
Message-ID: <20241211163036.2297116-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
X-TUID: 0f5yqe8lsUEh

Remove disas_fp_int_conv and disas_data_proc_fp as these
were the last insns decoded by those functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 232 ++++++++++-----------------------
 target/arm/tcg/a64.decode      |  14 ++
 2 files changed, 86 insertions(+), 160 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d260b45ddb..95bb2b1ca9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8734,175 +8734,87 @@ static bool trans_FJCVTZS(DisasContext *s, arg_FJCVTZS *a)
     return true;
 }
 
-static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
+static bool trans_FMOV_hx(DisasContext *s, arg_rr *a)
 {
-    /* FMOV: gpr to or from float, double, or top half of quad fp reg,
-     * without conversion.
-     */
-
-    if (itof) {
-        TCGv_i64 tcg_rn = cpu_reg(s, rn);
-        TCGv_i64 tmp;
-
-        switch (type) {
-        case 0:
-            /* 32 bit */
-            tmp = tcg_temp_new_i64();
-            tcg_gen_ext32u_i64(tmp, tcg_rn);
-            write_fp_dreg(s, rd, tmp);
-            break;
-        case 1:
-            /* 64 bit */
-            write_fp_dreg(s, rd, tcg_rn);
-            break;
-        case 2:
-            /* 64 bit to top half. */
-            tcg_gen_st_i64(tcg_rn, tcg_env, fp_reg_hi_offset(s, rd));
-            clear_vec_high(s, true, rd);
-            break;
-        case 3:
-            /* 16 bit */
-            tmp = tcg_temp_new_i64();
-            tcg_gen_ext16u_i64(tmp, tcg_rn);
-            write_fp_dreg(s, rd, tmp);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        TCGv_i64 tcg_rd = cpu_reg(s, rd);
-
-        switch (type) {
-        case 0:
-            /* 32 bit */
-            tcg_gen_ld32u_i64(tcg_rd, tcg_env, fp_reg_offset(s, rn, MO_32));
-            break;
-        case 1:
-            /* 64 bit */
-            tcg_gen_ld_i64(tcg_rd, tcg_env, fp_reg_offset(s, rn, MO_64));
-            break;
-        case 2:
-            /* 64 bits from top half */
-            tcg_gen_ld_i64(tcg_rd, tcg_env, fp_reg_hi_offset(s, rn));
-            break;
-        case 3:
-            /* 16 bit */
-            tcg_gen_ld16u_i64(tcg_rd, tcg_env, fp_reg_offset(s, rn, MO_16));
-            break;
-        default:
-            g_assert_not_reached();
-        }
+    if (!dc_isar_feature(aa64_fp16, s)) {
+        return false;
     }
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rn = cpu_reg(s, a->rn);
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_ext16u_i64(tmp, tcg_rn);
+        write_fp_dreg(s, a->rd, tmp);
+    }
+    return true;
 }
 
-/* Floating point <-> integer conversions
- *   31   30  29 28       24 23  22  21 20   19 18 16 15         10 9  5 4  0
- * +----+---+---+-----------+------+---+-------+-----+-------------+----+----+
- * | sf | 0 | S | 1 1 1 1 0 | type | 1 | rmode | opc | 0 0 0 0 0 0 | Rn | Rd |
- * +----+---+---+-----------+------+---+-------+-----+-------------+----+----+
- */
-static void disas_fp_int_conv(DisasContext *s, uint32_t insn)
+static bool trans_FMOV_sw(DisasContext *s, arg_rr *a)
 {
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int opcode = extract32(insn, 16, 3);
-    int rmode = extract32(insn, 19, 2);
-    int type = extract32(insn, 22, 2);
-    bool sbit = extract32(insn, 29, 1);
-    bool sf = extract32(insn, 31, 1);
-    bool itof = false;
-
-    if (sbit) {
-        goto do_unallocated;
-    }
-
-    switch (opcode) {
-    case 2: /* SCVTF */
-    case 3: /* UCVTF */
-    case 4: /* FCVTAS */
-    case 5: /* FCVTAU */
-    case 0: /* FCVT[NPMZ]S */
-    case 1: /* FCVT[NPMZ]U */
-        goto do_unallocated;
-
-    default:
-        switch (sf << 7 | type << 5 | rmode << 3 | opcode) {
-        case 0b01100110: /* FMOV half <-> 32-bit int */
-        case 0b01100111:
-        case 0b11100110: /* FMOV half <-> 64-bit int */
-        case 0b11100111:
-            if (!dc_isar_feature(aa64_fp16, s)) {
-                goto do_unallocated;
-            }
-            /* fallthru */
-        case 0b00000110: /* FMOV 32-bit */
-        case 0b00000111:
-        case 0b10100110: /* FMOV 64-bit */
-        case 0b10100111:
-        case 0b11001110: /* FMOV top half of 128-bit */
-        case 0b11001111:
-            if (!fp_access_check(s)) {
-                return;
-            }
-            itof = opcode & 1;
-            handle_fmov(s, rd, rn, type, itof);
-            break;
-
-        case 0b00111110: /* FJCVTZS */
-        default:
-        do_unallocated:
-            unallocated_encoding(s);
-            return;
-        }
-        break;
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rn = cpu_reg(s, a->rn);
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_ext32u_i64(tmp, tcg_rn);
+        write_fp_dreg(s, a->rd, tmp);
     }
+    return true;
 }
 
-/* FP-specific subcases of table C3-6 (SIMD and FP data processing)
- *   31  30  29 28     25 24                          0
- * +---+---+---+---------+-----------------------------+
- * |   | 0 |   | 1 1 1 1 |                             |
- * +---+---+---+---------+-----------------------------+
- */
-static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
+static bool trans_FMOV_dx(DisasContext *s, arg_rr *a)
 {
-    if (extract32(insn, 24, 1)) {
-        unallocated_encoding(s); /* in decodetree */
-    } else if (extract32(insn, 21, 1) == 0) {
-        /* Floating point to fixed point conversions */
-        unallocated_encoding(s); /* in decodetree */
-    } else {
-        switch (extract32(insn, 10, 2)) {
-        case 1: /* Floating point conditional compare */
-        case 2: /* Floating point data-processing (2 source) */
-        case 3: /* Floating point conditional select */
-            unallocated_encoding(s); /* in decodetree */
-            break;
-        case 0:
-            switch (ctz32(extract32(insn, 12, 4))) {
-            case 0: /* [15:12] == xxx1 */
-                /* Floating point immediate */
-                unallocated_encoding(s); /* in decodetree */
-                break;
-            case 1: /* [15:12] == xx10 */
-                /* Floating point compare */
-                unallocated_encoding(s); /* in decodetree */
-                break;
-            case 2: /* [15:12] == x100 */
-                /* Floating point data-processing (1 source) */
-                unallocated_encoding(s); /* in decodetree */
-                break;
-            case 3: /* [15:12] == 1000 */
-                unallocated_encoding(s);
-                break;
-            default: /* [15:12] == 0000 */
-                /* Floating point <-> integer conversions */
-                disas_fp_int_conv(s, insn);
-                break;
-            }
-            break;
-        }
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rn = cpu_reg(s, a->rn);
+        write_fp_dreg(s, a->rd, tcg_rn);
     }
+    return true;
+}
+
+static bool trans_FMOV_ux(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rn = cpu_reg(s, a->rn);
+        tcg_gen_st_i64(tcg_rn, tcg_env, fp_reg_hi_offset(s, a->rd));
+        clear_vec_high(s, true, a->rd);
+    }
+    return true;
+}
+
+static bool trans_FMOV_xh(DisasContext *s, arg_rr *a)
+{
+    if (!dc_isar_feature(aa64_fp16, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+        tcg_gen_ld16u_i64(tcg_rd, tcg_env, fp_reg_offset(s, a->rn, MO_16));
+    }
+    return true;
+}
+
+static bool trans_FMOV_ws(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+        tcg_gen_ld32u_i64(tcg_rd, tcg_env, fp_reg_offset(s, a->rn, MO_32));
+    }
+    return true;
+}
+
+static bool trans_FMOV_xd(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+        tcg_gen_ld_i64(tcg_rd, tcg_env, fp_reg_offset(s, a->rn, MO_64));
+    }
+    return true;
+}
+
+static bool trans_FMOV_xu(DisasContext *s, arg_rr *a)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+        tcg_gen_ld_i64(tcg_rd, tcg_env, fp_reg_hi_offset(s, a->rn));
+    }
+    return true;
 }
 
 /* Common vector code for handling integer to FP conversion */
@@ -10821,7 +10733,7 @@ static void disas_data_proc_simd(DisasContext *s, uint32_t insn)
 static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
 {
     if (extract32(insn, 28, 1) == 1 && extract32(insn, 30, 1) == 0) {
-        disas_data_proc_fp(s, insn);
+        unallocated_encoding(s); /* in decodetree */
     } else {
         /* SIMD, including crypto */
         disas_data_proc_simd(s, insn);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index cd10961618..5b9f7caa7f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1365,6 +1365,20 @@ FCVTAU_g        . 0011110 .. 100101 000000 ..... .....  @icvt
 
 FJCVTZS         0 0011110 01 111110 000000 ..... .....  @rr
 
+FMOV_ws         0 0011110 00 100110 000000 ..... .....  @rr
+FMOV_sw         0 0011110 00 100111 000000 ..... .....  @rr
+
+FMOV_xd         1 0011110 01 100110 000000 ..... .....  @rr
+FMOV_dx         1 0011110 01 100111 000000 ..... .....  @rr
+
+# Move to/from upper half of 128-bit
+FMOV_xu         1 0011110 10 101110 000000 ..... .....  @rr
+FMOV_ux         1 0011110 10 101111 000000 ..... .....  @rr
+
+# Half-precision allows both sf=0 and sf=1 with identical results
+FMOV_xh         - 0011110 11 100110 000000 ..... .....  @rr
+FMOV_hx         - 0011110 11 100111 000000 ..... .....  @rr
+
 # Floating-point data processing (1 source)
 
 FMOV_s          00011110 .. 1 000000 10000 ..... .....      @rr_hsd
-- 
2.43.0

