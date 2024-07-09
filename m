Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2976202njb;
        Mon, 8 Jul 2024 17:08:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkGYtO3Ag8VYZR0bVzew832id5X3kI+xN3/IBN6oJCKZ64H83/Mebr1LF0rf1BLY4HTdrFUqIYUwTaOestlb4CQ6s51n+H
X-Google-Smtp-Source: AGHT+IEReciqmHtD5BQ0PBF7zp3qNJmW11rdTlOXnWboL/6GWX9Q9401bHGP6UL24f9K+HYlJrxd
X-Received: by 2002:a0d:eb10:0:b0:62f:945a:7bb1 with SMTP id 00721157ae682-658f02f4b17mr12190027b3.42.1720483680802;
        Mon, 08 Jul 2024 17:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720483680; cv=none;
        d=google.com; s=arc-20160816;
        b=pn80PTM5UhgZ/pOicI16e5S+Vi4CBFfBl7swR/halGaZTyJE5V6YPP77fbJCWO7p3k
         4gx5wWXeySAxWZlBdv6Xjvlm0rNJ22Otqv7EohTBZi+zFk8fVx0O3lFjzLWYlQwTn0/G
         fG5QPAfrpDtvJgpy/3XaMWqHS7pfFO1+1P1wmK95wZYk51S4pApLH4xusWDArxb4uR+1
         roju74Sf4sIt75jlxAc+0/vUTIyr41hEuSRK8hBnh93/9T0EUfbim4wvf7O6o4tBgJ9K
         eDpTSDi0PvwxUjVcqWB6dXUBT3V2FKEkdMppsmIN4xw+qE4NThRJYBOnMBM/08r9TDJf
         SIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LwsPWzq4fQTFKfaBL9scNXQ8qaJTvw6XrZRRWc2thLU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=KCHwrvK5lRUg3mWIcdeNftTOjbpDjPvaygnnrt5yhZNbsTK29P/ZC4sP05iFJoIwYV
         Tny2Q6EKy+NMpu+TmSOOpSK7h8Iv9QCnwg1agSuSDGfyVU5QipVxBnTPhqaytF3VOnuF
         w6cZ+CSg2WwqSHX0yu5DhP/uNPCPDsa/N8RAkespmWLWXG+SSsuucku50mpDmS7sbeF2
         BViHApuOxO7fI46Nra2VSTdYvqnhRPLQw6sf3Aw+mdcnJBvWlpn5fNJvSCxcI14c2p9q
         K8LPazh2zMQjDt27SDLGdtTQTL2SDzhwpcX8TlGbnL5AsSTsKEwbDEZlaOtH/q6paR5V
         uJyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxIX3qdI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bab7d01si10146416d6.416.2024.07.08.17.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2024 17:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxIX3qdI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQyNH-0006tx-2v; Mon, 08 Jul 2024 20:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyN8-0006It-SC
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:18 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyN5-0001um-Ax
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:18 -0400
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-38713b03039so10096005ab.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2024 17:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720483574; x=1721088374; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwsPWzq4fQTFKfaBL9scNXQ8qaJTvw6XrZRRWc2thLU=;
 b=WxIX3qdI90Cperc8Ui2j/3UyRthLBUkvepIwPbnUdyNnB/EAEVG9ac8hpsgGjanCH2
 RsuT7X3dALFbLChLUIdGKWlCy8T3i7ado92tjTkJ0pCl386Er0HrwmanuOa7oR2LXW6b
 VlM7qLRArD/ZgkN6mVmN+aaQ6VqIBQ7aNF0evmbKqIWaFWKiuT7TmvAHMAQByTG5SRO2
 Z70O7iECji8J7D9TtkD6dPqdqzDN13ZJDd/9i4dFkGlYt5QpDOu/nDqTPyRAgMcrCkZ7
 zcRL4s4EQ69f5pJTYzdsQw0e0B8SLJCKAbS7TbND9ffvUX/S9fZJTEfgnzy5jb76/eOt
 yJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720483574; x=1721088374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwsPWzq4fQTFKfaBL9scNXQ8qaJTvw6XrZRRWc2thLU=;
 b=LkTegjAydHcVxijMzDnvwVCi74ADHhHBMza8ZSWmxNOyzbuhxW0M+0gHDKrWFmH0QQ
 Td5djO5JU6AU6UdCbQrL4+ouqv/gVXaEusLDBXsCpr+H6s+e5+zqgFIQPgLPtGdvvO4o
 cknzY14oSdgGeB1p7MN9Ax11AcHiO3N22NV7oBkUyu6Fzhfwh2bcl1Lv6R68QqL8kdTW
 fmaGv6VYjxlcxwXhVxqHLdAE/5HnEzce5nxNr5J356eOiTWLc34eyBsfG1OFYOgOND8g
 zpx1QAkhHZWLzZiXIHRy2EN41Y7VIboqaBh9Lu/1aG8mXG0C8rSWfR0PD5L9ourlwRdj
 0ExA==
X-Gm-Message-State: AOJu0YyhZ7jyCV/XuuDc7jt203YRPxMJty0sFF5EHbGWRXeC0v7+8bcS
 D709B8E3qQgAYTlte7MhOkUdUs7SA/LBBwv9WRdvSaHf8c8zKI7p+at5QEhOrcM=
X-Received: by 2002:a05:6e02:148f:b0:375:9c7e:d04 with SMTP id
 e9e14a558f8ab-38a57215a42mr13877505ab.10.1720483574133; 
 Mon, 08 Jul 2024 17:06:14 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d682b3fefsm316617a12.76.2024.07.08.17.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 17:06:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/6] target/arm: Convert SADDL, SSUBL, SABDL, SABAL,
 and unsigned to decodetree
Date: Mon,  8 Jul 2024 17:06:06 -0700
Message-ID: <20240709000610.382391-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709000610.382391-1-richard.henderson@linaro.org>
References: <20240709000610.382391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12a.google.com
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
X-TUID: Cj2UF9WAw7xa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 150 +++++++++++++++++----------------
 target/arm/tcg/a64.decode      |   9 ++
 2 files changed, 87 insertions(+), 72 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8f0781e1f7..95a37c71bc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5779,6 +5779,65 @@ TRANS(UMLSL_vi, do_3op_widening,
       a->esz, a->q, a->rd, a->rn, a->rm, a->idx,
       gen_mulsub_i64, true)
 
+static void gen_sabd_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
+{
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_sub_i64(t1, n, m);
+    tcg_gen_sub_i64(t2, m, n);
+    tcg_gen_movcond_i64(TCG_COND_GE, d, n, m, t1, t2);
+}
+
+static void gen_uabd_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
+{
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_sub_i64(t1, n, m);
+    tcg_gen_sub_i64(t2, m, n);
+    tcg_gen_movcond_i64(TCG_COND_GEU, d, n, m, t1, t2);
+}
+
+static void gen_saba_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    gen_sabd_i64(t, n, m);
+    tcg_gen_add_i64(d, d, t);
+}
+
+static void gen_uaba_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    gen_uabd_i64(t, n, m);
+    tcg_gen_add_i64(d, d, t);
+}
+
+TRANS(SADDL_v, do_3op_widening,
+      a->esz | MO_SIGN, a->q, a->rd, a->rn, a->rm, -1,
+      tcg_gen_add_i64, false)
+TRANS(UADDL_v, do_3op_widening,
+      a->esz, a->q, a->rd, a->rn, a->rm, -1,
+      tcg_gen_add_i64, false)
+TRANS(SSUBL_v, do_3op_widening,
+      a->esz | MO_SIGN, a->q, a->rd, a->rn, a->rm, -1,
+      tcg_gen_sub_i64, false)
+TRANS(USUBL_v, do_3op_widening,
+      a->esz, a->q, a->rd, a->rn, a->rm, -1,
+      tcg_gen_sub_i64, false)
+TRANS(SABDL_v, do_3op_widening,
+      a->esz | MO_SIGN, a->q, a->rd, a->rn, a->rm, -1,
+      gen_sabd_i64, false)
+TRANS(UABDL_v, do_3op_widening,
+      a->esz, a->q, a->rd, a->rn, a->rm, -1,
+      gen_uabd_i64, false)
+TRANS(SABAL_v, do_3op_widening,
+      a->esz | MO_SIGN, a->q, a->rd, a->rn, a->rm, -1,
+      gen_saba_i64, true)
+TRANS(UABAL_v, do_3op_widening,
+      a->esz, a->q, a->rd, a->rn, a->rm, -1,
+      gen_uaba_i64, true)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -10780,25 +10839,6 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
             }
 
             switch (opcode) {
-            case 0: /* SADDL, SADDL2, UADDL, UADDL2 */
-                tcg_gen_add_i64(tcg_passres, tcg_op1, tcg_op2);
-                break;
-            case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
-                tcg_gen_sub_i64(tcg_passres, tcg_op1, tcg_op2);
-                break;
-            case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
-            case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
-            {
-                TCGv_i64 tcg_tmp1 = tcg_temp_new_i64();
-                TCGv_i64 tcg_tmp2 = tcg_temp_new_i64();
-
-                tcg_gen_sub_i64(tcg_tmp1, tcg_op1, tcg_op2);
-                tcg_gen_sub_i64(tcg_tmp2, tcg_op2, tcg_op1);
-                tcg_gen_movcond_i64(is_u ? TCG_COND_GEU : TCG_COND_GE,
-                                    tcg_passres,
-                                    tcg_op1, tcg_op2, tcg_tmp1, tcg_tmp2);
-                break;
-            }
             case 9: /* SQDMLAL, SQDMLAL2 */
             case 11: /* SQDMLSL, SQDMLSL2 */
             case 13: /* SQDMULL, SQDMULL2 */
@@ -10810,20 +10850,20 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
             case 8: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
             case 10: /* SMLSL, SMLSL2, UMLSL, UMLSL2 */
             case 12: /* UMULL, UMULL2, SMULL, SMULL2 */
+            case 0: /* SADDL, SADDL2, UADDL, UADDL2 */
+            case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
+            case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
+            case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
                 g_assert_not_reached();
             }
 
-            if (opcode == 9 || opcode == 11) {
+            if (accop != 0) {
                 /* saturating accumulate ops */
                 if (accop < 0) {
                     tcg_gen_neg_i64(tcg_passres, tcg_passres);
                 }
                 gen_helper_neon_addl_saturate_s64(tcg_res[pass], tcg_env,
                                                   tcg_res[pass], tcg_passres);
-            } else if (accop > 0) {
-                tcg_gen_add_i64(tcg_res[pass], tcg_res[pass], tcg_passres);
-            } else if (accop < 0) {
-                tcg_gen_sub_i64(tcg_res[pass], tcg_res[pass], tcg_passres);
             }
         }
     } else {
@@ -10844,38 +10884,6 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
             }
 
             switch (opcode) {
-            case 0: /* SADDL, SADDL2, UADDL, UADDL2 */
-            case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
-            {
-                TCGv_i64 tcg_op2_64 = tcg_temp_new_i64();
-                static NeonGenWidenFn * const widenfns[2][2] = {
-                    { gen_helper_neon_widen_s8, gen_helper_neon_widen_u8 },
-                    { gen_helper_neon_widen_s16, gen_helper_neon_widen_u16 },
-                };
-                NeonGenWidenFn *widenfn = widenfns[size][is_u];
-
-                widenfn(tcg_op2_64, tcg_op2);
-                widenfn(tcg_passres, tcg_op1);
-                gen_neon_addl(size, (opcode == 2), tcg_passres,
-                              tcg_passres, tcg_op2_64);
-                break;
-            }
-            case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
-            case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
-                if (size == 0) {
-                    if (is_u) {
-                        gen_helper_neon_abdl_u16(tcg_passres, tcg_op1, tcg_op2);
-                    } else {
-                        gen_helper_neon_abdl_s16(tcg_passres, tcg_op1, tcg_op2);
-                    }
-                } else {
-                    if (is_u) {
-                        gen_helper_neon_abdl_u32(tcg_passres, tcg_op1, tcg_op2);
-                    } else {
-                        gen_helper_neon_abdl_s32(tcg_passres, tcg_op1, tcg_op2);
-                    }
-                }
-                break;
             case 9: /* SQDMLAL, SQDMLAL2 */
             case 11: /* SQDMLSL, SQDMLSL2 */
             case 13: /* SQDMULL, SQDMULL2 */
@@ -10888,22 +10896,21 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
             case 8: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
             case 10: /* SMLSL, SMLSL2, UMLSL, UMLSL2 */
             case 12: /* UMULL, UMULL2, SMULL, SMULL2 */
+            case 0: /* SADDL, SADDL2, UADDL, UADDL2 */
+            case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
+            case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
+            case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
                 g_assert_not_reached();
             }
 
             if (accop != 0) {
-                if (opcode == 9 || opcode == 11) {
-                    /* saturating accumulate ops */
-                    if (accop < 0) {
-                        gen_helper_neon_negl_u32(tcg_passres, tcg_passres);
-                    }
-                    gen_helper_neon_addl_saturate_s32(tcg_res[pass], tcg_env,
-                                                      tcg_res[pass],
-                                                      tcg_passres);
-                } else {
-                    gen_neon_addl(size, (accop < 0), tcg_res[pass],
-                                  tcg_res[pass], tcg_passres);
+                /* saturating accumulate ops */
+                if (accop < 0) {
+                    gen_helper_neon_negl_u32(tcg_passres, tcg_passres);
                 }
+                gen_helper_neon_addl_saturate_s32(tcg_res[pass], tcg_env,
+                                                  tcg_res[pass],
+                                                  tcg_passres);
             }
         }
     }
@@ -11075,11 +11082,6 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-        /* fall through */
-    case 0: /* SADDL, SADDL2, UADDL, UADDL2 */
-    case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
-    case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
-    case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
         /* 64 x 64 -> 128 */
         if (size == 3) {
             unallocated_encoding(s);
@@ -11092,6 +11094,10 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
         handle_3rd_widening(s, is_q, is_u, size, opcode, rd, rn, rm);
         break;
     default:
+    case 0: /* SADDL, SADDL2, UADDL, UADDL2 */
+    case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
+    case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
+    case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
     case 8: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
     case 10: /* SMLSL, SMLSL2, UMLSL, UMLSL2 */
     case 12: /* SMULL, SMULL2, UMULL, UMULL2 */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 513d112787..e626ee067f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -969,6 +969,15 @@ UMLAL_v         0.10 1110 ..1 ..... 10000 0 ..... ..... @qrrr_e
 SMLSL_v         0.00 1110 ..1 ..... 10100 0 ..... ..... @qrrr_e
 UMLSL_v         0.10 1110 ..1 ..... 10100 0 ..... ..... @qrrr_e
 
+SADDL_v         0.00 1110 ..1 ..... 00000 0 ..... ..... @qrrr_e
+UADDL_v         0.10 1110 ..1 ..... 00000 0 ..... ..... @qrrr_e
+SSUBL_v         0.00 1110 ..1 ..... 00100 0 ..... ..... @qrrr_e
+USUBL_v         0.10 1110 ..1 ..... 00100 0 ..... ..... @qrrr_e
+SABAL_v         0.00 1110 ..1 ..... 01010 0 ..... ..... @qrrr_e
+UABAL_v         0.10 1110 ..1 ..... 01010 0 ..... ..... @qrrr_e
+SABDL_v         0.00 1110 ..1 ..... 01110 0 ..... ..... @qrrr_e
+UABDL_v         0.10 1110 ..1 ..... 01110 0 ..... ..... @qrrr_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0

