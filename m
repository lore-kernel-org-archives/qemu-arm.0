Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615524njk;
        Tue, 16 Jul 2024 23:11:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfZyXWjFAtVJud907T9DxFc16pdAcPoxCVtzvWs32e/jY3o2E1/NaW5Gtp8WCeZ+0MbfX+bX7GNLJa6ubD1W3nnm9JRWbP
X-Google-Smtp-Source: AGHT+IGyAaY3/bGln5o6wnBMzE9byMAePU1J1ESSHHt0H37qFMYPjYsrecDXm25/tsLNtOcWbF/d
X-Received: by 2002:a05:6214:f0e:b0:6b4:fe1a:eeee with SMTP id 6a1803df08f44-6b78e2c0efamr9771556d6.46.1721196696143;
        Tue, 16 Jul 2024 23:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196696; cv=none;
        d=google.com; s=arc-20160816;
        b=BLDFK/FJupMdhK/9RNdsPuN0NympesqTOccL7xbli+FFQaA7fQMbeT47AIlv5yv4pj
         uLA3YQue2BozKf1SSPlIpCq+NCGZ1GGF6sLnzcKDtqqM5SBfMw/jVb8jjfYo/1xpci0p
         5kEB1zhE/o6WdJvMKM/BXV6lYsCjLWSQPWp2mMUrm7eEKdlJYMSdMXdUG6vJwqItQ3Ar
         jYjzKFY1iPyAJQuzm/qeyAdLBpXp7++tRv7GEVLmOGXPKKWhA6ByIPfJ1fWoLHCvmkaz
         i43CmBZD3pvL1olHPvk9lMFPJzcSJbki/e3E+d9qbnO8cLNmNVr8jWeFsPliM6GV1bJu
         FbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6XuY01gcGNghIOOf5X8qApquvihmysZWPJ2xnop5Jqo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Lz37VJBS35WfpUqpEJcsY15WQFDZLNEf0Pt5HbVppnOzqnt2mEmCKJmGzhIpi1cily
         C3nSxVLbNMCgVktIUBWc766cgRb2+G8WBeW/Up4TYz0IJB1V32SvbxE3JMK0+l/G8y3F
         XdXSOVngabWVsncuG9O8rQsz59kzc9norVBvRq/3NqUqZAIzjgbw90HZvxBNj+RZNODK
         V7NvxgooAauJgEGNGGwTf+ReA4SQ5XmmXqBSX1BQ6YyIub0EGtEcGdOoxPyu3KJlas09
         KN64rT6AJMCRHiMzHf04IWo4r/Aqhlpk5fAGxY95dk9ATUwD74cLxj5fFxDeOOZ02vvw
         l6+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9KKfeNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b76194f409si90754046d6.47.2024.07.16.23.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R9KKfeNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxrp-0007wC-M1; Wed, 17 Jul 2024 02:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrL-0005UQ-O0
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:51 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrF-00035N-QF
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:50 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-781f5007950so5253529a12.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196583; x=1721801383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XuY01gcGNghIOOf5X8qApquvihmysZWPJ2xnop5Jqo=;
 b=R9KKfeNECve2q7WUzksTcnEHUiEzWuiBg8H4HMIaKQ5PXjdXOfMI9h1zUAXV5LHXQN
 CYZpD5zP/aHy5X7XtlVKCFrirPoV843adgSs4DcaVnoK230czhsfQtAG+btebkUyEOvH
 ymDjg74r93BA2U385wbDFz4h29bj0lYNozZhtOmyHHhTudqiJfYAFu20HUapPiRThPlA
 TVw+ZdgbLtbjnqAD23QfLEz/O7cGp6p2V+FZ8zTsNEyfW7CMx7j7RpoaCdlxyRrSszC8
 KrGHLtBvDJg0eez9HubO1MlJmKs3mes0bq4kuIePHYfF4A0N4lC8QfNnhsNTGBdTjyqH
 PkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196583; x=1721801383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XuY01gcGNghIOOf5X8qApquvihmysZWPJ2xnop5Jqo=;
 b=ft7oZQTdyyfJkCLZg7qrk+yLhHt13hx2bT5+s7Smt/uhR+DD/PedHOUIfg5wcBQPUi
 CUBpqmtyYua77uqLYQ2pJ9UwuQuegxMhPonw4Tnin+CdfjQk5exsIiU3xjjjRgsf8XaC
 6EPTS1T971Pbf0VtHtUHdY3wmML+7zjiKabFHhMh2PZoMUdH+fYPF9UCkESeiPKQKvPY
 RxwrejLmEudNNuUWLmkLMOFFzFJaJPWkwQ90QRah4YGENRvpy7a1tp/Jl+F8c5NfWIIC
 bjpsrPveL4U2LWnYSbSMumrAciNDSF0kU5AIiTdLcdvQYyW4j0LyKDTsVrpg6A+lMo/P
 iKVw==
X-Gm-Message-State: AOJu0YzvyQcU9sD5DZQFJDaMnPaJ2campbEV2kel3GGPOoZuOMSS56pk
 /7y8CB2QV//vqWjlByIJo/avBV2GyBHvMC8NEIaPXO4gH2xmtjrs7XNdUzQuJlFn4d0M8QJ3mS8
 GhzI=
X-Received: by 2002:a05:6a21:458a:b0:1c2:8b78:880 with SMTP id
 adf61e73a8af0-1c3fddc9683mr856533637.41.1721196583135; 
 Tue, 16 Jul 2024 23:09:43 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/17] target/arm: Convet handle_vec_simd_shli to decodetree
Date: Wed, 17 Jul 2024 16:08:59 +1000
Message-ID: <20240717060903.205098-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 5OnsWyQNTntg

This includes SHL and SLI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 40 +++++++++-------------------------
 target/arm/tcg/a64.decode      |  6 +++++
 2 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1e482477c5..fd90752dee 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -84,6 +84,13 @@ static int rcount_immhb(DisasContext *s, int x)
     return (16 << size) - x;
 }
 
+/* For Advanced SIMD shift by immediate, left shift count. */
+static int lcount_immhb(DisasContext *s, int x)
+{
+    int size = esz_immh(s, x >> 3);
+    return x - (8 << size);
+}
+
 /*
  * Include the generated decoders.
  */
@@ -6962,6 +6969,8 @@ TRANS(URSHR_v, do_vec_shift_imm, a, gen_gvec_urshr)
 TRANS(SRSRA_v, do_vec_shift_imm, a, gen_gvec_srsra)
 TRANS(URSRA_v, do_vec_shift_imm, a, gen_gvec_ursra)
 TRANS(SRI_v, do_vec_shift_imm, a, gen_gvec_sri)
+TRANS(SHL_v, do_vec_shift_imm, a, tcg_gen_gvec_shli)
+TRANS(SLI_v, do_vec_shift_imm, a, gen_gvec_sli);
 
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
@@ -10427,33 +10436,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 }
 
-/* SHL/SLI - Vector shift left */
-static void handle_vec_simd_shli(DisasContext *s, bool is_q, bool insert,
-                                 int immh, int immb, int opcode, int rn, int rd)
-{
-    int size = 32 - clz32(immh) - 1;
-    int immhb = immh << 3 | immb;
-    int shift = immhb - (8 << size);
-
-    /* Range of size is limited by decode: immh is a non-zero 4 bit field */
-    assert(size >= 0 && size <= 3);
-
-    if (extract32(immh, 3, 1) && !is_q) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (insert) {
-        gen_gvec_fn2i(s, is_q, rd, rn, shift, gen_gvec_sli, size);
-    } else {
-        gen_gvec_fn2i(s, is_q, rd, rn, shift, tcg_gen_gvec_shli, size);
-    }
-}
-
 /* USHLL/SHLL - Vector shift left with widening */
 static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
                                  int immh, int immb, int opcode, int rn, int rd)
@@ -10566,9 +10548,6 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0a: /* SHL / SLI */
-        handle_vec_simd_shli(s, is_q, is_u, immh, immb, opcode, rn, rd);
-        break;
     case 0x10: /* SHRN */
     case 0x11: /* RSHRN / SQRSHRUN */
         if (is_u) {
@@ -10609,6 +10588,7 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     case 0x04: /* SRSHR / URSHR (rounding) */
     case 0x06: /* SRSRA / URSRA (accum + rounding) */
     case 0x08: /* SRI */
+    case 0x0a: /* SHL / SLI */
         unallocated_encoding(s);
         return;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c525f5fc35..6aa8a18240 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1191,9 +1191,12 @@ FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
 %abcdefgh       16:3 5:5
 %esz_immh       19:4 !function=esz_immh
 %rcount_immhb   16:7 !function=rcount_immhb
+%lcount_immhb   16:7 !function=lcount_immhb
 
 @qrshifti       . q:1 .. ..... .... ... ..... . rn:5 rd:5   \
                 &qrri_e esz=%esz_immh imm=%rcount_immhb
+@qlshifti       . q:1 .. ..... .... ... ..... . rn:5 rd:5   \
+                &qrri_e esz=%esz_immh imm=%lcount_immhb
 
 FMOVI_v_h       0 q:1 00 1111 00000 ... 1111 11 ..... rd:5  %abcdefgh
 
@@ -1212,5 +1215,8 @@ FMOVI_v_h       0 q:1 00 1111 00000 ... 1111 11 ..... rd:5  %abcdefgh
     SRSRA_v     0.00 11110 .... ... 00110 1 ..... .....     @qrshifti
     URSRA_v     0.10 11110 .... ... 00110 1 ..... .....     @qrshifti
     SRI_v       0.10 11110 .... ... 01000 1 ..... .....     @qrshifti
+
+    SHL_v       0.00 11110 .... ... 01010 1 ..... .....     @qlshifti
+    SLI_v       0.10 11110 .... ... 01010 1 ..... .....     @qlshifti
   ]
 }
-- 
2.43.0

