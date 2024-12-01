Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2147934njk;
        Sun, 1 Dec 2024 07:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFo41LoHccgp5UuwZo+Fc8fOjr2FYFberY2WYtcpIwKNHjDf4rQjnnfEgO9wqhrX3yu5D0KHnctoV7/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG1Za8X6b2/Ofj6YsJZ9g7Q0E4pfba6nvGrLDCGzUxqqop7Tquf4KuKpZM60AWXxQa/lkkM
X-Received: by 2002:a05:6902:c13:b0:e33:67d8:654e with SMTP id 3f1490d57ef6-e395b9548f7mr19873436276.49.1733065712935;
        Sun, 01 Dec 2024 07:08:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065712; cv=none;
        d=google.com; s=arc-20240605;
        b=h/oeLXIpcQL8r0wY4SN8+FAmiJ+tNfj8kUbsF0SFj/o9d5uj66L2sKIzbzNi9SKmXO
         OSyigxiOkDcj6CqprHouFKiwRonE1T3/LWUibbAHwUZ7uMN0dG6IBlgvLLT0K65KygIh
         GNiGfuvVQ+Fm99LJ5YrbEBkvk9yMNJn7t+Mh+Dc5vHJCGZY0yOTFZGFem4RokUjAptdW
         Zi5uf58z1EmS5rsIARKhJmihSD4nVllPvUXgajLLJz/LtmZ8JnRf0ZtQ1JSsClOF6Zin
         AL1/hil6ItRYg4m0NYAPnUleHDQWhVWh+yLG0yBxTzwlbGr8jtWJ4ub2fJvnyH1FNRkE
         h/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FGeEl2QJJWCARJQ6uwgCAnzw/EO68khcpj5yAWlqgIg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=A/U14iL8dbxYt9aD8XQP95Ib+E6hepxGE+O/9b8m14n/J85MsGFeEghulqinUhvV+n
         MgYw31aex4IDOEhQCN7qojuK8goWPQsdygJ/Vs+29PszAsQMmRwBBvXv7rr5Nudu5huz
         Poz4i8nXQ/rLTdJ2qOdYDFJjku6pixAx8oLc2cqO6DcbYl8EEMYEABb62Pe6+Wow2vSu
         NIrtFo+SC43rYy2G6wV4sgcdgW1Nn+r/aLoWsu/EodA9mdds8vsb3Vuy3GSogX153vLF
         1JPMXnkqsKKJ/UQuM0UUtD2acoo30S/z6JAJYgqDRXVd9SaMkoeLI+bVdTpEmV8PLvGE
         LC7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaFcqn0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e3976900fc6si6967840276.196.2024.12.01.07.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:08:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaFcqn0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlXB-0001dc-86; Sun, 01 Dec 2024 10:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX8-0001aw-4B
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:50 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX5-0004Lu-LK
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:49 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-71d4d0516e6so1511520a34.2
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065606; x=1733670406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGeEl2QJJWCARJQ6uwgCAnzw/EO68khcpj5yAWlqgIg=;
 b=RaFcqn0U0x2gMwrvnhKWIQesg8MEKnWzRLZC3gPEBME3S6ssPLs4xN4yGlgOIDHXD6
 F5Id+/v7mUZttLDxgr26Lg4su5v+FVT3+OBseiBV5UgPIfVFCbB+TQ0ZE82HC+k3487K
 i/QAxUPA4yrPi41h2AlJhMkFxIDzY81CN5xAauet4v0dirBUAQjBPllN4f9/GDdCnHNm
 TqSmq4t3WqfO3FYuYr7rLlC0x9CtXHuBnFRh3gmMezOgBDH9VOMQx+UAVurGfD60qJJZ
 3Nes2Az49Wp1VcWDWTLQDuPIvNeTjHiFBYE1K0XHEVlYifuO3rwNinVnWBYZ7t0nE5Ax
 /t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065606; x=1733670406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGeEl2QJJWCARJQ6uwgCAnzw/EO68khcpj5yAWlqgIg=;
 b=AAvoJr1y0cAXLgvGTr/ksH5DJB/Jhr8G84NLQplvCo6UaH2BROLI2Wlrkp93Zg7OYz
 3qlsxU5vvpsZLRPKZnoXHuQTsaGe0mc4nhvzjISB2mn/1FgrYihaJH2PGstrGvJWOh+H
 ptttdd5ZN/cuHtOfNFSgx7WcprBO6tShMjWW55VCjZ2TBNWnkSw7z3Nvk51s7ycoon4f
 jJ4rVEKY0nwvvZ7KhAA/nVnqkCcjNhTKpaDTSoskcnS2dM7D1AYVBnI85dAemIsYYd6T
 nPIhji9gfBCfOQXnrP5wCahzwjIMt3pAjACImYOcfi3iiMc73m0k+t4eAQE1FsGLfhxu
 whNA==
X-Gm-Message-State: AOJu0Yy4SlzY4Aug4GUAhZTKnNJaabWbUv8FurxwjCsj2e0XOleAJ7GL
 o5SMtccIkmJB/u1FbCAvxnq8s0irABO5bqxQhDI7pggRuo5HNvS6tJ/Zdp6CgY0=
X-Gm-Gg: ASbGncs18Lw6msCePQKoGRi+T5iwhWArojzIzLP/ys6tFEDqkEn7HWfviysbXg7Tm0d
 tyVgIh/Z2silPQd1AYB9QGG3tcvtngKMMamoEryIMzHuGuLfC0WJZ2jK8Va3Jn3tapKCiiCdZZQ
 KhSfWVZ7oUYQdTEe1HwMJdcRyH2t6dAxBR1vTFzILQ0N6Y05FXNhv3OUKetVVhQ2+PmLC84R2Fr
 RGX6px4hCaAusa+8INpDzb++Fypqz6X+YKF8QmHb+uGhc8PlviHT8blRs7bySlFFJAnyvcNiOm+
 Ii+bVEcWjQjEEe3wucsRRdTkLq9V+NLcXYzU
X-Received: by 2002:a05:6830:3689:b0:718:6cc:b5a2 with SMTP id
 46e09a7af769-71d65cf63b8mr14336189a34.20.1733065606515; 
 Sun, 01 Dec 2024 07:06:46 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 33/67] target/arm: Convert handle_fmov to decodetree
Date: Sun,  1 Dec 2024 09:05:32 -0600
Message-ID: <20241201150607.12812-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
X-TUID: ULtICVM8bFby

Remove disas_fp_int_conv and disas_data_proc_fp as these
were the last insns decoded by those functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 232 ++++++++++-----------------------
 target/arm/tcg/a64.decode      |  14 ++
 2 files changed, 86 insertions(+), 160 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 90e1567ad1..e0b5dd76b0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8738,175 +8738,87 @@ static bool trans_FJCVTZS(DisasContext *s, arg_FJCVTZS *a)
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
@@ -10823,7 +10735,7 @@ static void disas_data_proc_simd(DisasContext *s, uint32_t insn)
 static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
 {
     if (extract32(insn, 28, 1) == 1 && extract32(insn, 30, 1) == 0) {
-        disas_data_proc_fp(s, insn);
+        unallocated_encoding(s); /* in decodetree */
     } else {
         /* SIMD, including crypto */
         disas_data_proc_simd(s, insn);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 7b83d06d0d..787e673f7c 100644
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

