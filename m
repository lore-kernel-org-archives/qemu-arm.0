Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148177njk;
        Sun, 1 Dec 2024 07:08:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjQNyJIqu2DUW6j7Ta03e4vtGR8t293n19hNn2oSx8JZsqVZ5/MrxaXKJUKdfQFE68qQjyK6T1uC1SaA==@linaro.org
X-Google-Smtp-Source: AGHT+IFuiuPFQgXweJG/skL6ux/V0spQDgvWQxalACZ4D1afate9wyHZRxcUK1KCldVsl/Cyi+uT
X-Received: by 2002:a05:620a:2792:b0:7b1:55c0:153e with SMTP id af79cd13be357-7b67c460d39mr2796189185a.47.1733065732399;
        Sun, 01 Dec 2024 07:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065732; cv=none;
        d=google.com; s=arc-20240605;
        b=IyftQvwo4ujmqT4H3eul4rxLluE/wGNik8kRBaqdJB5xmTh4Joxq6ye2sauPsHHcbx
         fdZHUWFGZ1h5xCKBHBNPAix7eajogsEvwFmT0gwyjxYvbTbZnVn45YZTTWxBbj+aY6Nt
         YFT7eTThPU9wTNuHnCZKl8MS3lrJ/+DVAXG0VIXNEn5VNa+oI4OweAWSHkjTMAKzxd+b
         MZF5Rhc6mX2Y9EHxhmOTqbtNmGNQFe0CxfFwIVcDpCUXaduo/dJbQFnM0/qmtOQ6mkyB
         DUZ8JwjS30aaBqioWG6dBwa28ZK28Rit6zx5Yldu+dIEr6ePPXsJsRpCYEl+eaaSet67
         Lizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W0Kyjmr0WOluioy2h/qO52iqWK3XVuY0W6MyzBGu6bc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=AaVtL5UzVvKzG6pc4fURSjTxBbZhQaH/ngvzLzyscpRTaJZy9bcuWMR7Jm2j0VsJmN
         llmql8QmfNYNd5WCdP7TkBV45/AV8gfHxHgzMH49dShhdcGCuVjQNGjfj7yxk8dW+3v3
         agKqGPb2FblcxER9gdiHEZfnZlcf/Pc2Q436EQUKwzdzLRHpSC4Vh2vbhP33uj/Z6Z2d
         qm9oY4WeN51ymXnUiXwENmS6Jfqx9SBEZ5D4rxnGofarAyB9PlKITiMEinA5ieFvyM8f
         4BjK5SRBnRv6ygtSFQI/5a8hAR9wz1OvYEHBeX1u8A3iXmY9WY9Xnmo5XUO3K+W6wRwp
         uZ8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHEOnRUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af59231729si4255426137.271.2024.12.01.07.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:08:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHEOnRUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWr-0001Md-C7; Sun, 01 Dec 2024 10:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWm-0001JO-VN
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:28 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWl-0004AO-2S
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:28 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-71d4d3738cdso1218047a34.3
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065586; x=1733670386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0Kyjmr0WOluioy2h/qO52iqWK3XVuY0W6MyzBGu6bc=;
 b=xHEOnRUtavHc9u35sl2VFgPOPE0xQjDCZhKR2MkeJeMsNHGeHQwE8lsyo2dZz5I3lo
 QqU5D/Mw/2+n1dJWAP6jeLzLvytEgabUZ1lf4XNXTSHfcxgXSy56rIZ2G8iAl8pOK0sj
 xQnGObaiYjong0xgxhVOjM+jnfI+DlRDluUO9fZE5Hkaf/FUqvD5gnLReMZeXwbDa/MZ
 h6HFa3OuftkDlNFnVipXBeOegtxdNCHE3yrWNXW8rbRzZnrOZmZ+nIM1DvvhlYTl98MV
 nYt4+wyYacy3WUrRY9OAlk2JAP5yYj7OX8oznNf/yLRrqh4RaEV6z5DnyJ0TmPAsAHVJ
 csBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065586; x=1733670386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0Kyjmr0WOluioy2h/qO52iqWK3XVuY0W6MyzBGu6bc=;
 b=FnFVPVytLkO1iTNFu54j36Imkb4Idc5DpVdQRY2Uidk6c/uR/aCX3J9EBxHThwoJXd
 AKd+P5ZpI2mIyXNJyJtuL2zVO4wte7SuJ3Cird+B6BU1VstZc+KFixW7HsBI/fsoMdMY
 xz2LLhU2X7Qjea5Wbpqr7GUJfsfrst3ov+RA/xNTxNIdyUXeWUrmED2nxMY3HNGG2NLC
 UoeIJjFYEx8IQldBoAus8GV13NIj1YwjFOqkfd1a2SatTnTEoZwviwfzepDxeX/Xfzlh
 5r2c3jnFlTtgX9NoKf9hXI1n0BQPiDsgcu/4tSi0aHxAjnyBhcvjCPQWTCRqPa6yyj2c
 V3Pg==
X-Gm-Message-State: AOJu0YypDYhqJTtEo6Q5zOhVANZGdXc3RDmQExiTU0/1CSw0mEvdtha4
 Ez3i16GDDaFB/brZRQW0HY0jJ23ToMpYx5gSQcDJpAYka0bQ+WZQ4jjYYnpFjJI7mdr+pM6DvaA
 7+O4=
X-Gm-Gg: ASbGncvp07nLkJtuP/wRLmoMdssa+6pA8xAJaBQxLT3P8UFychGl2s+p5DEurdLLeet
 82J3m8eTiqTqS3jZexVy1wyICXAQOU10gs9+R6XDf/Wo/saxnonm1U9YMp3LLx5jQTD55KNqlrd
 I+0JR5B7+E+yqPTpewo78QquZHr3t+ZEfkDDIHWyVF3TUdJ5JFRBYo3V8hvPWEev1qyDVAcOz9P
 tIzoAqgtFskKkrIAbEHpTgGzRRa41JQuvY0GXMQbjvV9+JT3RvoUp7WPpuLC6Rur6Um1WhsR34N
 ZijEZpFhAYBGpL/aPt9hBPqd7vKxhFc3Wty7
X-Received: by 2002:a05:6830:924:b0:71d:5f7d:148e with SMTP id
 46e09a7af769-71d65c92ec1mr16566325a34.8.1733065585824; 
 Sun, 01 Dec 2024 07:06:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/67] target/arm: Convert disas_data_proc_3src to decodetree
Date: Sun,  1 Dec 2024 09:05:13 -0600
Message-ID: <20241201150607.12812-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
X-TUID: /Bmfy9WtMoZQ

This includes MADD, MSUB, SMADDL, SMSUBL, UMADDL, UMSUBL, SMULH, UMULH.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 119 ++++++++++++---------------------
 target/arm/tcg/a64.decode      |  16 +++++
 2 files changed, 59 insertions(+), 76 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d570bbb696..99ff787c61 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7955,98 +7955,68 @@ TRANS(SUB_r, do_addsub_reg, a, true, false)
 TRANS(ADDS_r, do_addsub_reg, a, false, true)
 TRANS(SUBS_r, do_addsub_reg, a, true, true)
 
-/* Data-processing (3 source)
- *
- *    31 30  29 28       24 23 21  20  16  15  14  10 9    5 4    0
- *  +--+------+-----------+------+------+----+------+------+------+
- *  |sf| op54 | 1 1 0 1 1 | op31 |  Rm  | o0 |  Ra  |  Rn  |  Rd  |
- *  +--+------+-----------+------+------+----+------+------+------+
- */
-static void disas_data_proc_3src(DisasContext *s, uint32_t insn)
+static bool do_mulh(DisasContext *s, arg_rrr *a,
+                    void (*fn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int ra = extract32(insn, 10, 5);
-    int rm = extract32(insn, 16, 5);
-    int op_id = (extract32(insn, 29, 3) << 4) |
-        (extract32(insn, 21, 3) << 1) |
-        extract32(insn, 15, 1);
-    bool sf = extract32(insn, 31, 1);
-    bool is_sub = extract32(op_id, 0, 1);
-    bool is_high = extract32(op_id, 2, 1);
-    bool is_signed = false;
-    TCGv_i64 tcg_op1;
-    TCGv_i64 tcg_op2;
-    TCGv_i64 tcg_tmp;
+    TCGv_i64 discard = tcg_temp_new_i64();
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_rn = cpu_reg(s, a->rn);
+    TCGv_i64 tcg_rm = cpu_reg(s, a->rm);
 
-    /* Note that op_id is sf:op54:op31:o0 so it includes the 32/64 size flag */
-    switch (op_id) {
-    case 0x42: /* SMADDL */
-    case 0x43: /* SMSUBL */
-    case 0x44: /* SMULH */
-        is_signed = true;
-        break;
-    case 0x0: /* MADD (32bit) */
-    case 0x1: /* MSUB (32bit) */
-    case 0x40: /* MADD (64bit) */
-    case 0x41: /* MSUB (64bit) */
-    case 0x4a: /* UMADDL */
-    case 0x4b: /* UMSUBL */
-    case 0x4c: /* UMULH */
-        break;
-    default:
-        unallocated_encoding(s);
-        return;
-    }
+    fn(discard, tcg_rd, tcg_rn, tcg_rm);
+    return true;
+}
 
-    if (is_high) {
-        TCGv_i64 low_bits = tcg_temp_new_i64(); /* low bits discarded */
-        TCGv_i64 tcg_rd = cpu_reg(s, rd);
-        TCGv_i64 tcg_rn = cpu_reg(s, rn);
-        TCGv_i64 tcg_rm = cpu_reg(s, rm);
+TRANS(SMULH, do_mulh, a, tcg_gen_muls2_i64)
+TRANS(UMULH, do_mulh, a, tcg_gen_mulu2_i64)
 
-        if (is_signed) {
-            tcg_gen_muls2_i64(low_bits, tcg_rd, tcg_rn, tcg_rm);
-        } else {
-            tcg_gen_mulu2_i64(low_bits, tcg_rd, tcg_rn, tcg_rm);
-        }
-        return;
-    }
+static bool do_muladd(DisasContext *s, arg_rrrr *a,
+                      bool sf, bool is_sub, MemOp mop)
+{
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_op1, tcg_op2;
 
-    tcg_op1 = tcg_temp_new_i64();
-    tcg_op2 = tcg_temp_new_i64();
-    tcg_tmp = tcg_temp_new_i64();
-
-    if (op_id < 0x42) {
-        tcg_gen_mov_i64(tcg_op1, cpu_reg(s, rn));
-        tcg_gen_mov_i64(tcg_op2, cpu_reg(s, rm));
+    if (mop == MO_64) {
+        tcg_op1 = cpu_reg(s, a->rn);
+        tcg_op2 = cpu_reg(s, a->rm);
     } else {
-        if (is_signed) {
-            tcg_gen_ext32s_i64(tcg_op1, cpu_reg(s, rn));
-            tcg_gen_ext32s_i64(tcg_op2, cpu_reg(s, rm));
-        } else {
-            tcg_gen_ext32u_i64(tcg_op1, cpu_reg(s, rn));
-            tcg_gen_ext32u_i64(tcg_op2, cpu_reg(s, rm));
-        }
+        tcg_op1 = tcg_temp_new_i64();
+        tcg_op2 = tcg_temp_new_i64();
+        tcg_gen_ext_i64(tcg_op1, cpu_reg(s, a->rn), mop);
+        tcg_gen_ext_i64(tcg_op2, cpu_reg(s, a->rm), mop);
     }
 
-    if (ra == 31 && !is_sub) {
+    if (a->ra == 31 && !is_sub) {
         /* Special-case MADD with rA == XZR; it is the standard MUL alias */
-        tcg_gen_mul_i64(cpu_reg(s, rd), tcg_op1, tcg_op2);
+        tcg_gen_mul_i64(tcg_rd, tcg_op1, tcg_op2);
     } else {
+        TCGv_i64 tcg_tmp = tcg_temp_new_i64();
+        TCGv_i64 tcg_ra = cpu_reg(s, a->ra);
+
         tcg_gen_mul_i64(tcg_tmp, tcg_op1, tcg_op2);
         if (is_sub) {
-            tcg_gen_sub_i64(cpu_reg(s, rd), cpu_reg(s, ra), tcg_tmp);
+            tcg_gen_sub_i64(tcg_rd, tcg_ra, tcg_tmp);
         } else {
-            tcg_gen_add_i64(cpu_reg(s, rd), cpu_reg(s, ra), tcg_tmp);
+            tcg_gen_add_i64(tcg_rd, tcg_ra, tcg_tmp);
         }
     }
 
     if (!sf) {
-        tcg_gen_ext32u_i64(cpu_reg(s, rd), cpu_reg(s, rd));
+        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
     }
+    return true;
 }
 
+TRANS(MADD_w, do_muladd, a, false, false, MO_64)
+TRANS(MSUB_w, do_muladd, a, false, true, MO_64)
+TRANS(MADD_x, do_muladd, a, true, false, MO_64)
+TRANS(MSUB_x, do_muladd, a, true, true, MO_64)
+
+TRANS(SMADDL, do_muladd, a, true, false, MO_SL)
+TRANS(SMSUBL, do_muladd, a, true, true, MO_SL)
+TRANS(UMADDL, do_muladd, a, true, false, MO_UL)
+TRANS(UMSUBL, do_muladd, a, true, true, MO_UL)
+
 /* Add/subtract (with carry)
  *  31 30 29 28 27 26 25 24 23 22 21  20  16  15       10  9    5 4   0
  * +--+--+--+------------------------+------+-------------+------+-----+
@@ -8364,13 +8334,10 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
         disas_cond_select(s, insn);
         break;
 
-    case 0x8 ... 0xf: /* (3 source) */
-        disas_data_proc_3src(s, insn);
-        break;
-
     default:
     do_unallocated:
     case 0x6: /* Data-processing */
+    case 0x8 ... 0xf: /* (3 source) */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4d422a7191..c6609749ae 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -753,6 +753,22 @@ SUBS_ext        . 11 01011001 ..... ... ... ..... .....  @addsub_ext
 # Conditional select
 # Data Processing (3-source)
 
+&rrrr           rd rn rm ra
+@rrrr           . .. ........ rm:5 . ra:5 rn:5 rd:5     &rrrr
+
+MADD_w          0 00 11011000 ..... 0 ..... ..... ..... @rrrr
+MSUB_w          0 00 11011000 ..... 1 ..... ..... ..... @rrrr
+MADD_x          1 00 11011000 ..... 0 ..... ..... ..... @rrrr
+MSUB_x          1 00 11011000 ..... 1 ..... ..... ..... @rrrr
+
+SMADDL          1 00 11011001 ..... 0 ..... ..... ..... @rrrr
+SMSUBL          1 00 11011001 ..... 1 ..... ..... ..... @rrrr
+UMADDL          1 00 11011101 ..... 0 ..... ..... ..... @rrrr
+UMSUBL          1 00 11011101 ..... 1 ..... ..... ..... @rrrr
+
+SMULH           1 00 11011010 ..... 0 11111 ..... ..... @rrr
+UMULH           1 00 11011110 ..... 0 11111 ..... ..... @rrr
+
 ### Cryptographic AES
 
 AESE            01001110 00 10100 00100 10 ..... .....  @r2r_q1e0
-- 
2.43.0

