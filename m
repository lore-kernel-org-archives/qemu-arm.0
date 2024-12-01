Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2154900njk;
        Sun, 1 Dec 2024 07:17:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeceV3fD/AS4fuICFDFLrfXNXVLihQULp29379EXr/Lc8yVuphw5kIdWTT9F1E7PO37TAGCimvzJoeSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHzAFkaTvEsHMopafjxlmKff0rB9l7xB4RtehvpJqNCHqXQgfAfJRtb5JvCCMJ9zGuVhCVc
X-Received: by 2002:a05:622a:1892:b0:466:a2c2:f372 with SMTP id d75a77b69052e-466b3647458mr303901131cf.37.1733066274967;
        Sun, 01 Dec 2024 07:17:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066274; cv=none;
        d=google.com; s=arc-20240605;
        b=AKMMluNmhJwBTE6FQ8JpVj+aQG+CXydWHJUpzowg49sdsiaLH4eLbMrsczPd7oAKlH
         w/lgsHoaRWc9FKU/HH8fX78NpW3KuXMRpo2ee4B5MMhJR+HA8LaMpqVQ4q8A14jcSnkr
         yL4eqSUlNy4e8HuDUR0PS77ZU43f60WosBFsL38oFmv0q6ZgKVFCIKIlvkx1GlVBF/d1
         ygCQA6KllF/O9OH8158468vQ0C4c2zJi6797K+Fw9rkhDtgD2Db84knkPZ/RytEwABKO
         8qOoQ/BqzEd6qR/PR9g1rtq1RQ2VFmHlN/PATHrCaMmVI4YH06nA+CIwiwd4xqTORSbj
         +F9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iAu5ADHYyflekp458M9CFRgqyCjo4WkfS6Rrrf0k32Q=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=FCu2LUjlOoui93gstZ8U91agKzvKdS47pwH/3oJS16Mib/ytnVP6M+mZj4kUc1uw5i
         GzK04XKyLvbNsHYXSgNxbZv2sZqzqbUSESTBId3z+E27dXEuVcZUSG4GSBndG+RtU3Jp
         +Sc2iK5zoL/ADUpQbyEUeRTNLFPP1WyRqZI1WuJa53NM1H6zYs7SfIacAMsSZZmmxNa4
         nUOFbJmkyenUosU5wtmFTYq5/L6S+1LPii9JqQC3bQnGbR02XN6NdhFcpciYKBAvWqmV
         9qdIXqa6gV2XYpSP4iMuITNDxn5o6wVJz5Z1bC/QIKr6DwdVwrQcz5ZSTyCm3DBndKzQ
         7YUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z0N/u/4z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4258041si88971291cf.569.2024.12.01.07.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:17:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z0N/u/4z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHldY-0000PD-6r; Sun, 01 Dec 2024 10:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlae-0000Zr-I3
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:28 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlac-0005KT-EU
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:28 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-71d4fceec9aso1139148a34.3
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065825; x=1733670625; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAu5ADHYyflekp458M9CFRgqyCjo4WkfS6Rrrf0k32Q=;
 b=Z0N/u/4zB54mlib1FDCw61LcVAZ3RlacQONA/3hKMZW60y3ICLkOv9QlmbnklGfGsS
 MJmreqEbrUmtFxCiDZQ0JBAdpFOUoYQrstsYfqaZytU+Hw7DTFFMQOXysjqTU9Qb5CS2
 RTbFJBOSUFpl7K7eGWp2t8m4GQR90aHcjrW8yHnqTqR+VCJbg3nEJrDBbEpHMiOKZR1S
 Prx57B9gIkxUFjfiOR671YcN1aIANBZw3Dx500GW/fSbQEwZOmhoeg4yQR96xixsT/Ks
 GzovGsJweJB0eno36wAaSqUE5Eel/aQckm7+y0FOUwlHpoP7cfFQS57YcNAAwJrs+53M
 ZeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065825; x=1733670625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAu5ADHYyflekp458M9CFRgqyCjo4WkfS6Rrrf0k32Q=;
 b=itelQzwYkXEjt6tmw9m2w8n67FhvzEt9G0qCKbUHvm0/D+z8JLxLBD0DHj4ARGRWjp
 tVguJKWwxE62UO2vmPVJUvND7nn8WxUcESI4s+y9Os3OyIsLswaBRd+ZYcnLRzwtHvzm
 hIujo6Z+iMDubuO9vOmHzUBY8Xly37yNxnZ+oe4aN9YoM4wkm+auUwLKYEOKRvGOHq8g
 WDQdS22KGiBLtJA4VapNsCS+WSrHmQ0XNsi554VuCJ/ZKF/2PgBiuiZKBXwAlKqWkkRs
 Y96FJX+mIwNkTsmzVcNtn0H+ZkgLBR3uKQs0AvDmnyZdV1BR/rmF9NXKTfoVrfHqzb0Z
 5axw==
X-Gm-Message-State: AOJu0Yw6jMcy+3olFaVpnUjuY4JxZCrpRQpAQj27Zny2aUfhr+SVHTmn
 ZxouqhmGbi/gYacqBUmtYWLA2peRSNqyqKdL/6h3Esix9ffYctf3+WU5SxHd01EilOmKtlp5nY5
 puk4=
X-Gm-Gg: ASbGnctg6cDwZ7jVuw42BvJoShhBhncatkqfyoJZbA5Qj54Vcc43lOtUV3c1JYEsq4H
 BbGvN/cmv2IWsjE9vD92D2ZZqY1Q5RdZAekwBZxYekvnzT+N8pIB8YsxpqgkyGKe5imZnQWOuTD
 57AmTXbdo+JDZlmoHarDnbUd71iGYGTF0Bo5jQjev/G/pxSrUfK11bOvVU5Oz39zIWQg2leCqOM
 EOsMo89a9UbL8YQSBdpzMFA3Tw1PPdfCLLp4aA+vvGC8J5ZgNfHHIXMGQu+JJLL5PAW/lRPWy40
 wuCILJxGhd/GuzXtwBC25OIQxb44VbczaoYq
X-Received: by 2002:a05:6830:442b:b0:710:ea11:3d35 with SMTP id
 46e09a7af769-71d65ca98bcmr16344581a34.15.1733065825115; 
 Sun, 01 Dec 2024 07:10:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 67/67] target/arm: Convert FCVTL to decodetree
Date: Sun,  1 Dec 2024 09:06:06 -0600
Message-ID: <20241201150607.12812-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
X-TUID: +K4mhcxWg3nB

Remove lookup_disas_fn, handle_2misc_widening,
disas_simd_two_reg_misc, disas_data_proc_simd,
disas_data_proc_simd_fp, disas_a64_legacy, as
this is the final insn to be converted.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 202 +++------------------------------
 target/arm/tcg/a64.decode      |   2 +
 2 files changed, 18 insertions(+), 186 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 78ad72061d..8f93fc2737 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1465,31 +1465,6 @@ static inline void gen_check_sp_alignment(DisasContext *s)
      */
 }
 
-/*
- * This provides a simple table based table lookup decoder. It is
- * intended to be used when the relevant bits for decode are too
- * awkwardly placed and switch/if based logic would be confusing and
- * deeply nested. Since it's a linear search through the table, tables
- * should be kept small.
- *
- * It returns the first handler where insn & mask == pattern, or
- * NULL if there is no match.
- * The table is terminated by an empty mask (i.e. 0)
- */
-static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
-                                               uint32_t insn)
-{
-    const AArch64DecodeTable *tptr = table;
-
-    while (tptr->mask) {
-        if ((insn & tptr->mask) == tptr->pattern) {
-            return tptr->disas_fn;
-        }
-        tptr++;
-    }
-    return NULL;
-}
-
 /*
  * The instruction disassembly implemented here matches
  * the instruction encoding classifications in chapter C4
@@ -9520,8 +9495,7 @@ static gen_helper_gvec_2_ptr * const f_frsqrte[] = {
 };
 TRANS(FRSQRTE_v, do_gvec_op2_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frsqrte)
 
-static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
-                                  int size, int rn, int rd)
+static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
 {
     /* Handle 2-reg-misc ops which are widening (so each size element
      * in the source becomes a 2*size element in the destination.
@@ -9529,173 +9503,43 @@ static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
      */
     int pass;
 
-    if (size == 3) {
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    if (a->esz == MO_64) {
         /* 32 -> 64 bit fp conversion */
         TCGv_i64 tcg_res[2];
-        int srcelt = is_q ? 2 : 0;
+        TCGv_i32 tcg_op = tcg_temp_new_i32();
+        int srcelt = a->q ? 2 : 0;
 
         for (pass = 0; pass < 2; pass++) {
-            TCGv_i32 tcg_op = tcg_temp_new_i32();
             tcg_res[pass] = tcg_temp_new_i64();
-
-            read_vec_element_i32(s, tcg_op, rn, srcelt + pass, MO_32);
+            read_vec_element_i32(s, tcg_op, a->rn, srcelt + pass, MO_32);
             gen_helper_vfp_fcvtds(tcg_res[pass], tcg_op, tcg_env);
         }
         for (pass = 0; pass < 2; pass++) {
-            write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
+            write_vec_element(s, tcg_res[pass], a->rd, pass, MO_64);
         }
     } else {
         /* 16 -> 32 bit fp conversion */
-        int srcelt = is_q ? 4 : 0;
+        int srcelt = a->q ? 4 : 0;
         TCGv_i32 tcg_res[4];
         TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
         TCGv_i32 ahp = get_ahp_flag();
 
         for (pass = 0; pass < 4; pass++) {
             tcg_res[pass] = tcg_temp_new_i32();
-
-            read_vec_element_i32(s, tcg_res[pass], rn, srcelt + pass, MO_16);
+            read_vec_element_i32(s, tcg_res[pass], a->rn, srcelt + pass, MO_16);
             gen_helper_vfp_fcvt_f16_to_f32(tcg_res[pass], tcg_res[pass],
                                            fpst, ahp);
         }
         for (pass = 0; pass < 4; pass++) {
-            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
+            write_vec_element_i32(s, tcg_res[pass], a->rd, pass, MO_32);
         }
     }
-}
-
-/* AdvSIMD two reg misc
- *   31  30  29 28       24 23  22 21       17 16    12 11 10 9    5 4    0
- * +---+---+---+-----------+------+-----------+--------+-----+------+------+
- * | 0 | Q | U | 0 1 1 1 0 | size | 1 0 0 0 0 | opcode | 1 0 |  Rn  |  Rd  |
- * +---+---+---+-----------+------+-----------+--------+-----+------+------+
- */
-static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
-{
-    int size = extract32(insn, 22, 2);
-    int opcode = extract32(insn, 12, 5);
-    bool u = extract32(insn, 29, 1);
-    bool is_q = extract32(insn, 30, 1);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-
-    switch (opcode) {
-    case 0xc ... 0xf:
-    case 0x16 ... 0x1f:
-    {
-        /* Floating point: U, size[1] and opcode indicate operation;
-         * size[0] indicates single or double precision.
-         */
-        int is_double = extract32(size, 0, 1);
-        opcode |= (extract32(size, 1, 1) << 5) | (u << 6);
-        size = is_double ? 3 : 2;
-        switch (opcode) {
-        case 0x17: /* FCVTL, FCVTL2 */
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_2misc_widening(s, opcode, is_q, size, rn, rd);
-            return;
-        default:
-        case 0x16: /* FCVTN, FCVTN2 */
-        case 0x36: /* BFCVTN, BFCVTN2 */
-        case 0x56: /* FCVTXN, FCVTXN2 */
-        case 0x2f: /* FABS */
-        case 0x6f: /* FNEG */
-        case 0x7f: /* FSQRT */
-        case 0x18: /* FRINTN */
-        case 0x19: /* FRINTM */
-        case 0x38: /* FRINTP */
-        case 0x39: /* FRINTZ */
-        case 0x59: /* FRINTX */
-        case 0x79: /* FRINTI */
-        case 0x58: /* FRINTA */
-        case 0x1e: /* FRINT32Z */
-        case 0x1f: /* FRINT64Z */
-        case 0x5e: /* FRINT32X */
-        case 0x5f: /* FRINT64X */
-        case 0x1d: /* SCVTF */
-        case 0x5d: /* UCVTF */
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-        case 0x5a: /* FCVTNU */
-        case 0x5b: /* FCVTMU */
-        case 0x7a: /* FCVTPU */
-        case 0x7b: /* FCVTZU */
-        case 0x5c: /* FCVTAU */
-        case 0x1c: /* FCVTAS */
-        case 0x2c: /* FCMGT (zero) */
-        case 0x2d: /* FCMEQ (zero) */
-        case 0x2e: /* FCMLT (zero) */
-        case 0x6c: /* FCMGE (zero) */
-        case 0x6d: /* FCMLE (zero) */
-        case 0x3d: /* FRECPE */
-        case 0x7d: /* FRSQRTE */
-        case 0x3c: /* URECPE */
-        case 0x7c: /* URSQRTE */
-            unallocated_encoding(s);
-            return;
-        }
-        break;
-    }
-    default:
-    case 0x0: /* REV64 */
-    case 0x1: /* REV16, REV32 */
-    case 0x2: /* SADDLP, UADDLP */
-    case 0x3: /* SUQADD, USQADD */
-    case 0x4: /* CLS, CLZ */
-    case 0x5: /* CNT, NOT, RBIT */
-    case 0x6: /* SADALP, UADALP */
-    case 0x7: /* SQABS, SQNEG */
-    case 0x8: /* CMGT, CMGE */
-    case 0x9: /* CMEQ, CMLE */
-    case 0xa: /* CMLT */
-    case 0xb: /* ABS, NEG */
-    case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
-    case 0x13: /* SHLL, SHLL2 */
-    case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
-        unallocated_encoding(s);
-        return;
-    }
-    g_assert_not_reached();
-}
-
-/* C3.6 Data processing - SIMD, inc Crypto
- *
- * As the decode gets a little complex we are using a table based
- * approach for this part of the decode.
- */
-static const AArch64DecodeTable data_proc_simd[] = {
-    /* pattern  ,  mask     ,  fn                        */
-    { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
-    { 0x00000000, 0x00000000, NULL }
-};
-
-static void disas_data_proc_simd(DisasContext *s, uint32_t insn)
-{
-    /* Note that this is called with all non-FP cases from
-     * table C3-6 so it must UNDEF for entries not specifically
-     * allocated to instructions in that table.
-     */
-    AArch64DecodeFn *fn = lookup_disas_fn(&data_proc_simd[0], insn);
-    if (fn) {
-        fn(s, insn);
-    } else {
-        unallocated_encoding(s);
-    }
-}
-
-/* C3.6 Data processing - SIMD and floating point */
-static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
-{
-    if (extract32(insn, 28, 1) == 1 && extract32(insn, 30, 1) == 0) {
-        unallocated_encoding(s); /* in decodetree */
-    } else {
-        /* SIMD, including crypto */
-        disas_data_proc_simd(s, insn);
-    }
+    clear_vec_high(s, true, a->rd);
+    return true;
 }
 
 static bool trans_OK(DisasContext *s, arg_OK *a)
@@ -9761,20 +9605,6 @@ static bool btype_destination_ok(uint32_t insn, bool bt, int btype)
     return false;
 }
 
-/* C3.1 A64 instruction index by encoding */
-static void disas_a64_legacy(DisasContext *s, uint32_t insn)
-{
-    switch (extract32(insn, 25, 4)) {
-    case 0x7:
-    case 0xf:      /* Data processing - SIMD and floating point */
-        disas_data_proc_simd_fp(s, insn);
-        break;
-    default:
-        unallocated_encoding(s);
-        break;
-    }
-}
-
 static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
                                           CPUState *cpu)
 {
@@ -9977,7 +9807,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (!disas_a64(s, insn) &&
         !disas_sme(s, insn) &&
         !disas_sve(s, insn)) {
-        disas_a64_legacy(s, insn);
+        unallocated_encoding(s);
     }
 
     /*
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 5090b857e6..47ca635315 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1866,6 +1866,8 @@ FRSQRTE_v       0.10 1110 1.1 00001 11011 0 ..... .....     @qrr_sd
 URECPE_v        0.00 1110 101 00001 11001 0 ..... .....     @qrr_s
 URSQRTE_v       0.10 1110 101 00001 11001 0 ..... .....     @qrr_s
 
+FCVTL_v         0.00 1110 0.1 00001 01111 0 ..... .....     @qrr_sd
+
 &fcvt_q         rd rn esz q shift
 @fcvtq_h        . q:1 . ...... 001 .... ...... rn:5 rd:5    \
                 &fcvt_q esz=1 shift=%fcvt_f_sh_h
-- 
2.43.0

