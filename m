Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2153456njk;
        Sun, 1 Dec 2024 07:16:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWK4wxpP31WkCbYta9+Q4I5RXluPFLxLEvVh//GusLpaBH8g4PSodHtmYjjxIF750D+RPS0wxn9VRQ1Qg==@linaro.org
X-Google-Smtp-Source: AGHT+IGFvE8WvDiUmiwYjtf2irTsZ/aMktS+ZM6QJZ7BOFpieAvhRSKlWJFN/cmeWJUt7oP4c34B
X-Received: by 2002:a05:620a:260f:b0:7b6:66d0:5ac6 with SMTP id af79cd13be357-7b67c45d6ccmr2849712485a.48.1733066166515;
        Sun, 01 Dec 2024 07:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066166; cv=none;
        d=google.com; s=arc-20240605;
        b=GDOc4Utw/BfA/HqensRaCfPgTp0DISWFCIdVhsgEbIff05ePOb19J8902wWGGZk90d
         QutBTgbMrq+LsspezkociM+cwHaWP54C0qXFxWKyyGjumPAVWARZF/jtN280WajGf4FE
         DGmQlYoAIXc2qdU2X9X20O4AWhfKxprshcI05ljI/Xc+dI3HsRdT1oDKVIgBlMs8gqXA
         FNmnC1xpGdcXyfJ14i8ZhHPiZfpuGVeySfzrRepXzocdknW7isJ6HTkkJa2iGPzOH01F
         9Hm8qGT6UIXMypOl4DUe6TqhgQnFokeF9pFlFTcawvVz+45FGw8NzId2zrG/+h1N/9wv
         vxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8nu8nWD7N4EQBx13FR0vvaNwesH8hvFESmWFdkh2zfM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=dRmX/BJTDlV+Sg8SV4HBLaKOyWqk1wrpHskTb8TKAStZJlAtM6lZ6Wl2uHLAFxTzTn
         w6L7TXkD2CfyYP2vww6Fyqhqvt8S1pcWdMqSEvp8HhJLrWMSlxmkJ7++d3OBVyeqqM6Z
         r03Xp67Q8ClL/lf0OdHhebR0GMefuVqnhkJN3g68fDel7TR3P/RVQxB6VefQC9z5hge3
         n2FgWVbt/dDGFhq1dsrEYJKkuKvDotoDq9mKEL6tvpXU4Vpy+3i550cZgQnOQQ9Pwdpl
         ldPLAD1Kt+O5X/5ZNHsv8SiqHjtU52ZYT4RiAykfT9skJeydcB9BO66frVfENKzH7UV8
         Ck5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpt6mzvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af590d35c9si4094737137.3.2024.12.01.07.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpt6mzvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlaY-0008QW-0z; Sun, 01 Dec 2024 10:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaC-0007jv-D7
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:00 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaA-000571-5x
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:00 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-71d4e043dd9so1377923a34.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065797; x=1733670597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nu8nWD7N4EQBx13FR0vvaNwesH8hvFESmWFdkh2zfM=;
 b=qpt6mzvAcVf5rmC7IMldZjq0LnLqSTXsQeWRALqoABbVgUjqtrRQVspXreXBVpYr4c
 cI3FOtox+S96z+qDtmyotb1mSRpmn2pDT3kpIPFlKek1P1Bt9PKlWVZH0CSVQU3JnZ3H
 WngxwEFbM5dbgOokU8Bn+o7bB5Fnj2kgNbhvav9exIBxpGuIdPtVuB2ojJ2+yKWHix8z
 sX/upZKNnUxG39mIjk9I9pZBAojAgNtr/HcupKMy1YfTifLZRd2X7Z0Op5erJrB3fIYS
 ghvDZFUb1Z5s+E3NSGxuMoiagMzBbEPocdK0lHyzb7JF++SHMdcUmhe/fPfF9TnRh4RB
 +fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065797; x=1733670597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nu8nWD7N4EQBx13FR0vvaNwesH8hvFESmWFdkh2zfM=;
 b=KUEz/U+ofg+zYnKot2DRYEeJhCip92ObXxqqjQnj9dSJ4lBiaudgDzWXNza1VyPGH2
 +x7n6ArtzR/Meo3l2S1CRmXoekgHmHMY9xMFwH7eNGRpi1vr2QZ4qB6w5Ufkb/N3DGgY
 DkukvPeznZh+1i5vctGJ5w2fHqBR/vpir9XjrUm+J/X86dXsYAVTuWDthj2eKYu7OSvZ
 LAXhSYbeF6LC+RMXh6NfnVXaEbuOzw9ei3/mmGGqeZ5Uo+o2OLoxOXjdffxmti+inZrG
 IpF6ZVcG4RaaBXqgljWlOiwLb7Kt5W7B1F85Pz0eEDUg3AbkZ2GKBOQYiMzOidLwWIf/
 1/aw==
X-Gm-Message-State: AOJu0Yycrz4v9yl6iQtw7xNrrHZye+V8l177MTuqu1s6jbH4If596gYz
 xR83Yiba/cEUE/nfzM+mMvXHAqIVbnHBAeYm861jCDkILXEt9KNijnu4GfSPFFMq5UHs3qciPVW
 SmB8=
X-Gm-Gg: ASbGncvlXbB18IoEnvqjCo1rIsu2pbi4dM8OLRGbDmUVLL39V5ym171R79xahcehyhW
 rkZJluh69pFG2wJ8+9sitOxStNsyqyNH2qZ+cNFNdJCtU4hh36j4cJB6YxAT9zGEmnq5jLRJEPh
 XX+aDozIntDmS82LGMOT3FwPWweCTV1c32Fvajl8+tYxvrov/e5yA4UF2fMbtHGfSEdDGRqTr9t
 +0m2uESxT99y7yDy18iVs5IpoRzQpOrTjAY8EgWwHwq/3HoWZGWcxCnH9bzCImDlmgY6m6oclZ6
 FU/KUNC+LUYf1RifMzPQtmK3TZlpEGZ/DQra
X-Received: by 2002:a05:6830:2aab:b0:718:123e:922d with SMTP id
 46e09a7af769-71d65cd2630mr14247812a34.18.1733065796951; 
 Sun, 01 Dec 2024 07:09:56 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:09:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 42/67] target/arm: Convert handle_rev to decodetree
Date: Sun,  1 Dec 2024 09:05:41 -0600
Message-ID: <20241201150607.12812-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
X-TUID: jJiaOPfrLBIs

This includes REV16, REV32, REV64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 79 +++-------------------------------
 target/arm/tcg/a64.decode      |  5 +++
 2 files changed, 10 insertions(+), 74 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bc1d0e18eb..11ccdb2d08 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8943,6 +8943,8 @@ TRANS(CMGE0_v, do_gvec_fn2, a, gen_gvec_cge0)
 TRANS(CMLT0_v, do_gvec_fn2, a, gen_gvec_clt0)
 TRANS(CMLE0_v, do_gvec_fn2, a, gen_gvec_cle0)
 TRANS(CMEQ0_v, do_gvec_fn2, a, gen_gvec_ceq0)
+TRANS(REV16_v, do_gvec_fn2, a, gen_gvec_rev16)
+TRANS(REV32_v, do_gvec_fn2, a, gen_gvec_rev32)
 
 static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 {
@@ -8957,6 +8959,7 @@ static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 
 TRANS(CLS_v, do_gvec_fn2_bhs, a, gen_gvec_cls)
 TRANS(CLZ_v, do_gvec_fn2_bhs, a, gen_gvec_clz)
+TRANS(REV64_v, do_gvec_fn2_bhs, a, gen_gvec_rev64)
 
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
@@ -9886,76 +9889,6 @@ static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
     }
 }
 
-static void handle_rev(DisasContext *s, int opcode, bool u,
-                       bool is_q, int size, int rn, int rd)
-{
-    int op = (opcode << 1) | u;
-    int opsz = op + size;
-    int grp_size = 3 - opsz;
-    int dsize = is_q ? 128 : 64;
-    int i;
-
-    if (opsz >= 3) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (size == 0) {
-        /* Special case bytes, use bswap op on each group of elements */
-        int groups = dsize / (8 << grp_size);
-
-        for (i = 0; i < groups; i++) {
-            TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-
-            read_vec_element(s, tcg_tmp, rn, i, grp_size);
-            switch (grp_size) {
-            case MO_16:
-                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
-                break;
-            case MO_32:
-                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
-                break;
-            case MO_64:
-                tcg_gen_bswap64_i64(tcg_tmp, tcg_tmp);
-                break;
-            default:
-                g_assert_not_reached();
-            }
-            write_vec_element(s, tcg_tmp, rd, i, grp_size);
-        }
-        clear_vec_high(s, is_q, rd);
-    } else {
-        int revmask = (1 << grp_size) - 1;
-        int esize = 8 << size;
-        int elements = dsize / esize;
-        TCGv_i64 tcg_rn = tcg_temp_new_i64();
-        TCGv_i64 tcg_rd[2];
-
-        for (i = 0; i < 2; i++) {
-            tcg_rd[i] = tcg_temp_new_i64();
-            tcg_gen_movi_i64(tcg_rd[i], 0);
-        }
-
-        for (i = 0; i < elements; i++) {
-            int e_rev = (i & 0xf) ^ revmask;
-            int w = (e_rev * esize) / 64;
-            int o = (e_rev * esize) % 64;
-
-            read_vec_element(s, tcg_rn, rn, i, size);
-            tcg_gen_deposit_i64(tcg_rd[w], tcg_rd[w], tcg_rn, o, esize);
-        }
-
-        for (i = 0; i < 2; i++) {
-            write_vec_element(s, tcg_rd[i], rd, i, MO_64);
-        }
-        clear_vec_high(s, true, rd);
-    }
-}
-
 static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
                                   bool is_q, int size, int rn, int rd)
 {
@@ -10070,10 +10003,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0x0: /* REV64, REV32 */
-    case 0x1: /* REV16 */
-        handle_rev(s, opcode, u, is_q, size, rn, rd);
-        return;
     case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
     case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
         if (size == 3) {
@@ -10276,6 +10205,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         break;
     }
     default:
+    case 0x0: /* REV64 */
+    case 0x1: /* REV16, REV32 */
     case 0x3: /* SUQADD, USQADD */
     case 0x4: /* CLS, CLZ */
     case 0x5: /* CNT, NOT, RBIT */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4f8231d07a..2531809096 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -73,6 +73,7 @@
 
 @qrr_b          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=0
 @qrr_h          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=1
+@qrr_bh         . q:1 ...... . esz:1 ...... ...... rn:5 rd:5  &qrr_e
 @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
 
 @qrrr_b         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=0
@@ -1657,3 +1658,7 @@ CMGE0_v         0.10 1110 ..1 00000 10001 0 ..... .....     @qrr_e
 CMEQ0_v         0.00 1110 ..1 00000 10011 0 ..... .....     @qrr_e
 CMLE0_v         0.10 1110 ..1 00000 10011 0 ..... .....     @qrr_e
 CMLT0_v         0.00 1110 ..1 00000 10101 0 ..... .....     @qrr_e
+
+REV16_v         0.00 1110 001 00000 00011 0 ..... .....     @qrr_b
+REV32_v         0.10 1110 0.1 00000 00011 0 ..... .....     @qrr_bh
+REV64_v         0.00 1110 ..1 00000 00001 0 ..... .....     @qrr_e
-- 
2.43.0

