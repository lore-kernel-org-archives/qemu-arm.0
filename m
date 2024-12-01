Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148946njk;
        Sun, 1 Dec 2024 07:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3x99Tgmzm/3QHBm8gfEb1NxMT/WNazDsjMIwpUtJl+Kk6HO9RRtLdslg7av80A7D/wUxfsD+I3BXUJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEpdMoDCnUm3KUzXfCValUUQFctWIXTHHQlQB76wNK7HuKbEy59c9dJqGu3RjwC+QVEISCk
X-Received: by 2002:a05:6122:a0d:b0:4f5:199b:2a61 with SMTP id 71dfb90a1353d-51556ad01admr19657932e0c.9.1733065797954;
        Sun, 01 Dec 2024 07:09:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065797; cv=none;
        d=google.com; s=arc-20240605;
        b=PD+XmRtWHo+d/PQZkhuhvDPSUDBwE3MdwKcwK3t4tfQ8u/M5IdHJWGCrfwpOr9x7RX
         6o0CT99sht8lf7+DzxB7SPIT28c0PAr227Pd1ZW/QfwMHe/X6Ud5V8P4M8u6KCFRKhNC
         q56oYpUv3KrVLUN0shqB2zzq5SgEQXMvjxnrsWNqCoLaCVImrkptK5ybaAUhrH9XkuQP
         SNQXqF08oAYz1mV2b+xUfRDg4JI/lDcvLYoaX7nC53KknXdLtoZWuuxfNs7yeRiNgGFH
         jN7S+jGCqWxW2zvOftbqkD1bDD3nGXOapz98/i9TF3lBMSFgKYaRvKy792aKWP4Fyhyb
         vc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=alkDtjzjBH2GSnOqoHrhgtc/qRm6I+Sq6rzsnTVfH94=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=ZY6832hC7VMjChT/33qisxfPjPlFquWzjy4TQO02Y9NHM83Xl+6WOzk7IyzRjpydce
         twWDToB3a2Tffikvb37eeTobUbEs+32lrqQamG7zlpEaeqOEToPliY9wB6YVI/Pb4enm
         VHbjgfCqeNVGGqlleoPk9hDE6bQy2YH2FIkbU4fJnBPYwxWeE7zxHPuRpcetapjubiZD
         FLeUl6hWRSBoutVq3vqfONS5ZKdcSQhzYF2pQp1eS9c4X1HNG5U5D+GQ5GMb/n197K+S
         DlCQRyfUbnFWFjmAnuQd7XADZufoHK6jDoiIbDkqU8Y8d5Dkvtq0zhjLSg/rPFiJ3Vva
         O3Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9VR17ST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156d0d9ba4si3065984e0c.124.2024.12.01.07.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:09:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9VR17ST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlXD-0001ey-Ip; Sun, 01 Dec 2024 10:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX9-0001bv-Gf
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:51 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX7-0004NA-N4
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:51 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-29e644b3f6fso20802fac.2
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065608; x=1733670408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alkDtjzjBH2GSnOqoHrhgtc/qRm6I+Sq6rzsnTVfH94=;
 b=I9VR17ST3U/jyQfpZ1RPAJ9qXTYy4so0zfHhs9SFf2ABld8hdnv6VpJQjWTBNjcxnA
 LhUYGU27i1gljgpHx5b966h1d3KnanX1FFUdFQn2+eBxeUubDw112xR6C3mDUguexI8L
 8rY604Xjk2oMZ3ze3NFK95YvfFg8YyfKZ324J0Ba6yG+7aI/kvZQYrllUlPZjhnnn/0D
 EtDn6Hrg+PDUJC79WI/2CWlor/3rdZVWeoSS8rgp7nlPAmCiog8K0SaXgiVwTtkOEKX0
 XXnLP6jSDC/nZQdd73dR897rDyoYgS12sTlL9UDnzDNGOefNG+sWquZ7j+Nn74Xuc8+c
 1Ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065608; x=1733670408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=alkDtjzjBH2GSnOqoHrhgtc/qRm6I+Sq6rzsnTVfH94=;
 b=UI42BraIzViS+4EbF6GuH4o2FrpVwXXX47zGOWdGI85JwXDWYyJ3Ot6ZL3YvQJekMx
 /+NQTVIa0xRs5BkbPsVrBW4QuXQ0vsa1OR3aqIDVhrCMx/amon7JKI7mFL6t9PUqygFa
 4yyvkBIigdFFT70HkBz7jlITsXaM6FppA0sODTkaPbq729vGSMoYTGzCEmsUzEvGaU0K
 pCmENH28r+rFWkRGrxbuWJscjzkd45QQ9reyCZ9kGoLbarv9zvKe1wvfe+wtTAsQ5zqv
 2/Yex4J/IOyIM0/cbtZBexg/wYvrVZRLHGuNVDshRarycTHvCzb+zIH9zRgXTDFzZpm8
 jlVw==
X-Gm-Message-State: AOJu0Yx0mwGf3q58RgaWOTfp4TJmPng/b9eIAabXbx6nOt2PSMROEh/C
 BLlRezEdQeCb0aSNBsBMAWLz+XHei+cou+Obm9MFznNlu85EbN8oeqPV0xFf6JY=
X-Gm-Gg: ASbGncv/17tszOgQkgGKP/w3IqGmy38yvJaCRnt/+ARzYG5HFEv7VnjFcKppyoux9YN
 FLsj7FDwRNHCht3rME0G6cmsbp/me/ilPP+aNntmZdKaWpNetLl3NimsOF5YwHh/lViaxAOoPtE
 Q+PDrMyzkLwLoiny+HWMjgZJlUCjOMTN4c0eOj1cjuVp6XLqp4KUxpPkKZETEJ3hAM62YKSwr2z
 j8CoQJghAQwUIOb7AGGMcSbz/1bw10ijZCEUwKLbHMBd4F+4P1LbELtD9rWcZtVnlHzbeo9rgbO
 TyR0PEweqGjpQMGFGSVbHuRaNAd2oTm1PUJR
X-Received: by 2002:a05:6870:b9cb:b0:296:aef8:fe9a with SMTP id
 586e51a60fabf-29dc3f9edecmr14345024fac.7.1733065608484; 
 Sun, 01 Dec 2024 07:06:48 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 35/67] target/arm: Convert ABS, NEG to decodetree
Date: Sun,  1 Dec 2024 09:05:34 -0600
Message-ID: <20241201150607.12812-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
X-TUID: GceBDdrJWWEP

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 46 +++++++++++++++++++++++-----------
 target/arm/tcg/a64.decode      |  4 +++
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6564fff6b9..c519f82452 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8893,6 +8893,33 @@ static const ENVScalar1 f_scalar_sqneg = {
 TRANS(SQNEG_s, do_env_scalar1, a, &f_scalar_sqneg)
 TRANS(SQNEG_v, do_env_vector1, a, &f_scalar_sqneg)
 
+static bool do_scalar1_d(DisasContext *s, arg_rr *a, ArithOneOp *f)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 t = read_fp_dreg(s, a->rn);
+        f(t, t);
+        write_fp_dreg(s, a->rd, t);
+    }
+    return true;
+}
+
+TRANS(ABS_s, do_scalar1_d, a, tcg_gen_abs_i64)
+TRANS(NEG_s, do_scalar1_d, a, tcg_gen_neg_i64)
+
+static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
+{
+    if (!a->q && a->esz == MO_64) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_fn2(s, a->q, a->rd, a->rn, fn, a->esz);
+    }
+    return true;
+}
+
+TRANS(ABS_v, do_gvec_fn2, a, tcg_gen_gvec_abs)
+TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9217,13 +9244,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x9: /* CMEQ, CMLE */
         cond = u ? TCG_COND_LE : TCG_COND_EQ;
         goto do_cmop;
-    case 0xb: /* ABS, NEG */
-        if (u) {
-            tcg_gen_neg_i64(tcg_rd, tcg_rn);
-        } else {
-            tcg_gen_abs_i64(tcg_rd, tcg_rn);
-        }
-        break;
     case 0x2f: /* FABS */
         gen_vfp_absd(tcg_rd, tcg_rn);
         break;
@@ -9268,6 +9288,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         break;
     default:
     case 0x7: /* SQABS, SQNEG */
+    case 0xb: /* ABS, NEG */
         g_assert_not_reached();
     }
 }
@@ -9618,7 +9639,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         /* fall through */
     case 0x8: /* CMGT, CMGE */
     case 0x9: /* CMEQ, CMLE */
-    case 0xb: /* ABS, NEG */
         if (size != 3) {
             unallocated_encoding(s);
             return;
@@ -9709,6 +9729,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* USQADD / SUQADD */
     case 0x7: /* SQABS / SQNEG */
+    case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
     }
@@ -10107,7 +10128,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         /* fall through */
     case 0x8: /* CMGT, CMGE */
     case 0x9: /* CMEQ, CMLE */
-    case 0xb: /* ABS, NEG */
         if (size == 3 && !is_q) {
             unallocated_encoding(s);
             return;
@@ -10284,6 +10304,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* SUQADD, USQADD */
     case 0x7: /* SQABS, SQNEG */
+    case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
     }
@@ -10328,12 +10349,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clt0, size);
         return;
     case 0xb:
-        if (u) { /* ABS, NEG */
-            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_neg, size);
-        } else {
-            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_abs, size);
-        }
-        return;
+        g_assert_not_reached();
     }
 
     if (size == 3) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d26ee07597..30cd05030a 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1632,8 +1632,12 @@ SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_s
 
 SQABS_s         0101 1110 ..1 00000 01111 0 ..... .....     @rr_e
 SQNEG_s         0111 1110 ..1 00000 01111 0 ..... .....     @rr_e
+ABS_s           0101 1110 111 00000 10111 0 ..... .....     @rr
+NEG_s           0111 1110 111 00000 10111 0 ..... .....     @rr
 
 # Advanced SIMD two-register miscellaneous
 
 SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
 SQNEG_v         0.10 1110 ..1 00000 01111 0 ..... .....     @qrr_e
+ABS_v           0.00 1110 ..1 00000 10111 0 ..... .....     @qrr_e
+NEG_v           0.10 1110 ..1 00000 10111 0 ..... .....     @qrr_e
-- 
2.43.0

