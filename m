Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2157029njk;
        Sun, 1 Dec 2024 07:21:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQzKKQPCQHBFpJumVlYxqbmXnOHWFhN1SSPS0wXFR0KRr57AP7yRnDvDSucY8nv92PrVgWclpboGJd2w==@linaro.org
X-Google-Smtp-Source: AGHT+IG63eC13orkTfoQET5P4Qz9lDWKwma9iNi+1M4on/riTvw1niXPRLEMa2zpjxD2ZOMiBzMk
X-Received: by 2002:a05:6122:251b:b0:515:3bb5:50a9 with SMTP id 71dfb90a1353d-51556818879mr21425377e0c.0.1733066463738;
        Sun, 01 Dec 2024 07:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066463; cv=none;
        d=google.com; s=arc-20240605;
        b=cCxgHsf8NQdiqBsKP1qw4q5r/NsNrVU5hnoj6s4/CdTBkcuqMM/s3/tMKJjdP0lIsC
         t8lFFOvobS7mvMm4INLW6l47NLI6j+0SB97mV+WGFPJNQgkfBZ3DPZwZM9bc7S2TRmBE
         sfI5HeqMRzOrrsQWUQiG4pWEivvZ/itrTRcGKf00PC8jPa5jyTfFWcQJ5veRhkAJX47S
         NQ7TpMuh1p9tj2qYJ5mFy2jaV0p9+zyJORZrjwqbM2oPio2mxhlRt4hgLPwA4eqLZa0I
         2ZmkPO8BYXO0k3npuAo8rciVhr91tH+NXcO66zfgPbTzZZlnXHipDkxZzeGlrcO7gJIF
         uf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YM8rPv2C+9rAw2tjuh5taBMURN6VwaVwJYYc+LS5ydA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Y/53L2vH0VZgJLkmAs6VwpwjbH4SKgQXTnTw993TbaW2oPG6OPU+q+/5ugFzjLMCmC
         i45epvjKEyl7N4yKgE7Gy8lKWy5VW+lS+xEeVhlTxmScsn6QzFA5Dd4S5J+5WK8Cv5SL
         99Zh05/zuC9gEigBIe/ueUh+c1GhVu8loqB2Hsy87dZ6LfOflN91zK56D7Kb1rDgf97U
         /S112W/GKRmFpdGBim9FG2xXpxk44Nk4ujuxmXNpz5ENeqpnOwIW+CbR+Y2iy47x3esk
         OhYUo6GZzSA7nTVxdpF0h0qDY+rdMfVKy0q6x7AApCwMJLbM2w6nPw9XyA4MX35EOJvv
         kENg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhrZqoji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af59129368si3129821137.166.2024.12.01.07.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:21:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhrZqoji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlbj-00053u-Rb; Sun, 01 Dec 2024 10:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaS-00086b-Fc
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:18 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaO-0005Ee-I4
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:15 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5f1cec20a77so919736eaf.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065811; x=1733670611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YM8rPv2C+9rAw2tjuh5taBMURN6VwaVwJYYc+LS5ydA=;
 b=YhrZqojiqqfHu3Bqz3TE9lkNC0tRvfiIY4Gymewb8nYK3pPPCEnQ/jMHzRcSvxlAAK
 pblW7+cwAy4XWBGboAnrmlLB6fcS8XQQ48qChnFSlZVWv6rRA5Ri4328bIbOPa1EnN+h
 zgLeGkyq12LXwSuOVeiz/RCKJrdNuv96qwd1G4H274ZFJDIpn/TIoZzHxhXI8Sucky23
 AHsU+IdPzdU/WvJCCUmJJXzBkk3g1Nja5M+szMujn0782xQVh2pqqiAXhA/vPPfjnxwJ
 Cz5ZgBAyfL4J/vmVlgAw1WAjDBY6cxueLucjFgP/6MDb/DYDHNREi8KvS2aL55C/OC5f
 Lb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065811; x=1733670611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YM8rPv2C+9rAw2tjuh5taBMURN6VwaVwJYYc+LS5ydA=;
 b=HweYzY3mN7Ps/vTM87xs5u6ufj3zYQ9bilKqJivh8DBzcGdZ+TbllBi9cpHzUOH2vu
 xjetcCYprgaUu4vEbUUp/y1xrD9XK2QzIPMeSuANeg+RiloYNadHmhi2clUfD6jbWri4
 IC5pCWQr6jnRMOsxgo3mRRJXIJNyvFHNWvm52peRbo++YqnHyBqv33YP6Wg0VXW8RExN
 qUJSUirUB0b3mX46pYnNBrs2ME3EfhAF7wiQHHBRciCxqW5ilQrTUOhRaJWj28jMPBvs
 lf+Inn9d8Rq4THMxVnaX1x2T2tJlmwCIm8BpWnQ2useW1l1/SzUjYHlcebobBjg9QD4X
 gFNQ==
X-Gm-Message-State: AOJu0YyOJVUSf3tLVH5xuVUhMQBL3UU6r50gOk6V44uDzpKJBhwXG4AI
 T6zTpvfyPWHzFvXNTv3Oo0g/w3u00VWM9b05pnqxQ4D+F5HqqFCk19QFxrgr1ExdUm+IoRlsmqI
 t/Kw=
X-Gm-Gg: ASbGncuEawr7mQveGf2hosdFVdu6DZ/EdKrWB4awrpDjbnZCLi+F8+cGP6lhfOScvVu
 caaGYi5Uu3STzijDW1XRbW+sIf2n1/7+Yhet4srS+KhLMq6Buti8fyfJwH6p7lSPMAYy7WcXFLt
 zJ2laazEb/lbtBlxopqIe7JBCuHlykTUCyRSZ8lUGwSbEvm0ftQLsyxtzXo0D4kIKoekr7hIucA
 ok0J+rFZA081hxp57z8RUe4Ue2JCjvzCgCRIw32F+jcRXD9+og8XvA8/haSRChnzJarkUnT2IEz
 K7Xh8r7gNH4ft6Xb9RJRlzndv1w/9DmGnG6C
X-Received: by 2002:a05:6830:2655:b0:71d:572f:66c3 with SMTP id
 46e09a7af769-71d65d0983dmr15669837a34.30.1733065811338; 
 Sun, 01 Dec 2024 07:10:11 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/67] target/arm: Convert FCVT* (vector,
 integer) scalar to decodetree
Date: Sun,  1 Dec 2024 09:05:54 -0600
Message-ID: <20241201150607.12812-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
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
X-TUID: bni3Ecu52oNf

Arm silliness with naming, the scalar insns described
as part of the vector instructions, as separate from
the "regular" scalar insns which output to general registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 135 ++++++++++++++-------------------
 target/arm/tcg/a64.decode      |  30 ++++++++
 2 files changed, 87 insertions(+), 78 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 98a42feb7d..ad245f2c26 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8678,6 +8678,16 @@ static void do_fcvt_scalar(DisasContext *s, MemOp out, MemOp esz,
                                  tcg_shift, tcg_fpstatus);
             tcg_gen_extu_i32_i64(tcg_out, tcg_single);
             break;
+        case MO_16 | MO_SIGN:
+            gen_helper_vfp_toshh(tcg_single, tcg_single,
+                                 tcg_shift, tcg_fpstatus);
+            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
+            break;
+        case MO_16:
+            gen_helper_vfp_touhh(tcg_single, tcg_single,
+                                 tcg_shift, tcg_fpstatus);
+            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -8721,6 +8731,42 @@ TRANS(FCVTZU_g, do_fcvt_g, a, FPROUNDING_ZERO, false)
 TRANS(FCVTAS_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, true)
 TRANS(FCVTAU_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, false)
 
+/*
+ * FCVT* (vector), scalar version.
+ * Which sounds weird, but really just means output to fp register
+ * instead of output to general register.  Input and output element
+ * size are always equal.
+ */
+static bool do_fcvt_f(DisasContext *s, arg_fcvt *a,
+                      ARMFPRounding rmode, bool is_signed)
+{
+    TCGv_i64 tcg_int;
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    tcg_int = tcg_temp_new_i64();
+    do_fcvt_scalar(s, a->esz | (is_signed ? MO_SIGN : 0),
+                   a->esz, tcg_int, a->shift, a->rn, rmode);
+
+    clear_vec(s, a->rd);
+    write_vec_element(s, tcg_int, a->rd, 0, a->esz);
+    return true;
+}
+
+TRANS(FCVTNS_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, true)
+TRANS(FCVTNU_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, false)
+TRANS(FCVTPS_f, do_fcvt_f, a, FPROUNDING_POSINF, true)
+TRANS(FCVTPU_f, do_fcvt_f, a, FPROUNDING_POSINF, false)
+TRANS(FCVTMS_f, do_fcvt_f, a, FPROUNDING_NEGINF, true)
+TRANS(FCVTMU_f, do_fcvt_f, a, FPROUNDING_NEGINF, false)
+TRANS(FCVTZS_f, do_fcvt_f, a, FPROUNDING_ZERO, true)
+TRANS(FCVTZU_f, do_fcvt_f, a, FPROUNDING_ZERO, false)
+TRANS(FCVTAS_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, true)
+TRANS(FCVTAU_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, false)
+
 static bool trans_FJCVTZS(DisasContext *s, arg_FJCVTZS *a)
 {
     if (!dc_isar_feature(aa64_jscvt, s)) {
@@ -9788,10 +9834,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     int opcode = extract32(insn, 12, 5);
     int size = extract32(insn, 22, 2);
     bool u = extract32(insn, 29, 1);
-    bool is_fcvt = false;
-    int rmode;
-    TCGv_i32 tcg_rmode;
-    TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
     case 0xc ... 0xf:
@@ -9836,15 +9878,8 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x5b: /* FCVTMU */
         case 0x7a: /* FCVTPU */
         case 0x7b: /* FCVTZU */
-            is_fcvt = true;
-            rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
-            break;
         case 0x1c: /* FCVTAS */
         case 0x5c: /* FCVTAU */
-            /* TIEAWAY doesn't fit in the usual rounding mode encoding */
-            is_fcvt = true;
-            rmode = FPROUNDING_TIEAWAY;
-            break;
         case 0x56: /* FCVTXN, FCVTXN2 */
         default:
             unallocated_encoding(s);
@@ -9863,59 +9898,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         unallocated_encoding(s);
         return;
     }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (is_fcvt) {
-        tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
-        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
-    } else {
-        tcg_fpstatus = NULL;
-        tcg_rmode = NULL;
-    }
-
-    if (size == 3) {
-        TCGv_i64 tcg_rn = read_fp_dreg(s, rn);
-        TCGv_i64 tcg_rd = tcg_temp_new_i64();
-
-        handle_2misc_64(s, opcode, u, tcg_rd, tcg_rn, tcg_rmode, tcg_fpstatus);
-        write_fp_dreg(s, rd, tcg_rd);
-    } else {
-        TCGv_i32 tcg_rn = tcg_temp_new_i32();
-        TCGv_i32 tcg_rd = tcg_temp_new_i32();
-
-        read_vec_element_i32(s, tcg_rn, rn, 0, size);
-
-        switch (opcode) {
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x1c: /* FCVTAS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-            gen_helper_vfp_tosls(tcg_rd, tcg_rn, tcg_constant_i32(0),
-                                 tcg_fpstatus);
-            break;
-        case 0x5a: /* FCVTNU */
-        case 0x5b: /* FCVTMU */
-        case 0x5c: /* FCVTAU */
-        case 0x7a: /* FCVTPU */
-        case 0x7b: /* FCVTZU */
-            gen_helper_vfp_touls(tcg_rd, tcg_rn, tcg_constant_i32(0),
-                                 tcg_fpstatus);
-            break;
-        default:
-        case 0x7: /* SQABS, SQNEG */
-            g_assert_not_reached();
-        }
-
-        write_fp_sreg(s, rd, tcg_rd);
-    }
-
-    if (is_fcvt) {
-        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
-    }
+    g_assert_not_reached();
 }
 
 /* AdvSIMD shift by immediate
@@ -10403,31 +10386,27 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         TCGv_i32 tcg_res = tcg_temp_new_i32();
 
         switch (fpop) {
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x1c: /* FCVTAS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-            gen_helper_advsimd_f16tosinth(tcg_res, tcg_op, tcg_fpstatus);
-            break;
         case 0x3d: /* FRECPE */
             gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
             break;
         case 0x3f: /* FRECPX */
             gen_helper_frecpx_f16(tcg_res, tcg_op, tcg_fpstatus);
             break;
-        case 0x5a: /* FCVTNU */
-        case 0x5b: /* FCVTMU */
-        case 0x5c: /* FCVTAU */
-        case 0x7a: /* FCVTPU */
-        case 0x7b: /* FCVTZU */
-            gen_helper_advsimd_f16touinth(tcg_res, tcg_op, tcg_fpstatus);
-            break;
         case 0x7d: /* FRSQRTE */
             gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
             break;
         default:
         case 0x6f: /* FNEG */
+        case 0x1a: /* FCVTNS */
+        case 0x1b: /* FCVTMS */
+        case 0x1c: /* FCVTAS */
+        case 0x3a: /* FCVTPS */
+        case 0x3b: /* FCVTZS */
+        case 0x5a: /* FCVTNU */
+        case 0x5b: /* FCVTMU */
+        case 0x5c: /* FCVTAU */
+        case 0x7a: /* FCVTPU */
+        case 0x7b: /* FCVTZU */
             g_assert_not_reached();
         }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4bd72d7f7f..617bbc6380 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1652,6 +1652,36 @@ UQXTN_s         0111 1110 ..1 00001 01001 0 ..... .....     @rr_e
 
 FCVTXN_s        0111 1110 011 00001 01101 0 ..... .....     @rr_s
 
+@icvt_h         . ....... .. ...... ...... rn:5 rd:5 \
+                &fcvt sf=0 esz=1 shift=0
+@icvt_sd        . ....... .. ...... ...... rn:5 rd:5 \
+                &fcvt sf=0 esz=%esz_sd shift=0
+
+FCVTNS_f        0101 1110 011 11001 10101 0 ..... .....     @icvt_h
+FCVTNS_f        0101 1110 0.1 00001 10101 0 ..... .....     @icvt_sd
+FCVTNU_f        0111 1110 011 11001 10101 0 ..... .....     @icvt_h
+FCVTNU_f        0111 1110 0.1 00001 10101 0 ..... .....     @icvt_sd
+
+FCVTPS_f        0101 1110 111 11001 10101 0 ..... .....     @icvt_h
+FCVTPS_f        0101 1110 1.1 00001 10101 0 ..... .....     @icvt_sd
+FCVTPU_f        0111 1110 111 11001 10101 0 ..... .....     @icvt_h
+FCVTPU_f        0111 1110 1.1 00001 10101 0 ..... .....     @icvt_sd
+
+FCVTMS_f        0101 1110 011 11001 10111 0 ..... .....     @icvt_h
+FCVTMS_f        0101 1110 0.1 00001 10111 0 ..... .....     @icvt_sd
+FCVTMU_f        0111 1110 011 11001 10111 0 ..... .....     @icvt_h
+FCVTMU_f        0111 1110 0.1 00001 10111 0 ..... .....     @icvt_sd
+
+FCVTZS_f        0101 1110 111 11001 10111 0 ..... .....     @icvt_h
+FCVTZS_f        0101 1110 1.1 00001 10111 0 ..... .....     @icvt_sd
+FCVTZU_f        0111 1110 111 11001 10111 0 ..... .....     @icvt_h
+FCVTZU_f        0111 1110 1.1 00001 10111 0 ..... .....     @icvt_sd
+
+FCVTAS_f        0101 1110 011 11001 11001 0 ..... .....     @icvt_h
+FCVTAS_f        0101 1110 0.1 00001 11001 0 ..... .....     @icvt_sd
+FCVTAU_f        0111 1110 011 11001 11001 0 ..... .....     @icvt_h
+FCVTAU_f        0111 1110 0.1 00001 11001 0 ..... .....     @icvt_sd
+
 # Advanced SIMD two-register miscellaneous
 
 SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
-- 
2.43.0

