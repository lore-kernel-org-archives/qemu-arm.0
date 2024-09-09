Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984712njb;
        Mon, 9 Sep 2024 09:25:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMwJcja6LM7RkucZqfa5W4NbP1eN/IlT0PHZEbyoBdOCBCP67ENykhcld18wxmY33WdpmdeYOyKBWz5w==@linaro.org
X-Google-Smtp-Source: AGHT+IEaniCciSdeMFuItJp6CvnLrjboQoV/CsrT3RGjotrItO+DGAcIDR4qGcJiRmgBMc01h7Ij
X-Received: by 2002:a05:6214:3b8a:b0:6c5:17cf:d9fc with SMTP id 6a1803df08f44-6c5285106d4mr180921456d6.46.1725899144220;
        Mon, 09 Sep 2024 09:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899144; cv=none;
        d=google.com; s=arc-20240605;
        b=b6G7QIyOyXfgkBk0EzSo9mWhta6fNxgC4S4Z/rXmVa7Tyd/02SlSlJLFpNEBpb4l/q
         CqsXTdTppYM/TGo3W5TgF9UDgxblkKivbM4tO7j8QmubHCqe+0w+gxw1s7nqlotZyXvJ
         RwpPXPw6c0ci4XicpoxeYPnoMCHvkeQKOlRtnFcVU0NfhywAlNQH4sMy8m9cSIltJ5n/
         1+4Rn1jcMVrDes1OmApbVHs/rG+CJ7PKV5oIJUI6VfxP+QfaKPRl596G91jFGNNFQfp+
         yt7OoxzCLQ8ncE9fH4c/6zRif8Nt4//1IfbnR6i0l8Gv24j3Qan0AEkMgpTUWOzTJ0jl
         TbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CJbXt7pOg4FXFelFynZLe3iemHyaou99mZ5a4Xb7T/U=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=SmOU9kioIK9GTAJp83rURJ7Q+eL+fldkEBQ/lZAJZFjUkZ5gSrgXhf8IUPGvz9IKrR
         aOnQGovYiH0G8bNB7pFKhqzCMhZZA83CZNpWSxfCCK7OUV6QvP8UnKrByWzSScFJnfCm
         b8cLkhlHeYO7N50QFo3OTPzcAaNcnEv85fF5ufAFpQdxGpqdOsVAVaFhuWc0pxnx8pEQ
         Efk3Zmk9EKY/fzrNnsz2WEKBx0KYeNTJzQTGcrhTJzRFQlIMwEs7GnWF31RmM9jUyFHw
         iDO7S6aWUoaWaD7Fd/PT8MEkoFGXyyJBU/+Z5auN5lU1q0FeonWRK3N4Qjo1P4Gjxqf5
         +lRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tS0QaKK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53476f2cesi55784746d6.199.2024.09.09.09.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tS0QaKK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snhAM-00035y-Hv; Mon, 09 Sep 2024 12:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAK-0002yf-S0
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:23:00 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAJ-0007l8-1u
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:23:00 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-7d1fa104851so2801299a12.3
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898977; x=1726503777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJbXt7pOg4FXFelFynZLe3iemHyaou99mZ5a4Xb7T/U=;
 b=tS0QaKK5+lszJM0SozRYaNn/TI+ntkKDboPqXCUh573PEzBuPHIBbITNFIW0/uHFZy
 Vtywh2PJoxjTPijjvmwB60uq6FfOBqEC2Pl5H20i522JXLOzosrZXR/IRTX8nQnPFiNY
 /88UJ0bYAyKz9EjbdgFIRP0vSPADjAYU1dhUWxE2v5bNdsYaiyVATT7XQt6fc3MC49rd
 KxdGLEBH1oIqt2Sf0SUIzw6cam5imCLa8MFuXbrUDYSm7ofdX4NovOmC3IN3HUb1zXwR
 8kTPXAv/Xr6UCMcrhsvvElbHXULdU1ma+s3eDbeOU47OU0C9nSblVlo9+h9Ry0iZdAw3
 rBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898978; x=1726503778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJbXt7pOg4FXFelFynZLe3iemHyaou99mZ5a4Xb7T/U=;
 b=dj9flYuNsqQcmhKu6F6Nm+czx+ahQInVhzHfmLZo3rnWZx7+dWKE3QSsPTfImMDJVf
 umAWkdLj3e73Ze6oTRCIxxmYB+Z7Mq9Wl4HxXUEYBLyrMRKf97UYl64ulfKsJEOBRvOr
 H8CMXpb2TPhFFuBRz2kqylQGw1d6hNeAmQrdSIi+RPAP4vQHEtQ6+srt8TFyOOf4yD2y
 zp6YE78R9YvVeSzRe4bcOH8QMviIXREMZ3E7Xff/e9dsm0MzT9V+iQznT6MxegcWxw2l
 05qetLkSw29TADlvhCv1cXtZLKtxSGLj1L0XXxdzS5jiwust/EkFbMZpamqERRhHjg7D
 TkoA==
X-Gm-Message-State: AOJu0Yy4zjjTf7/fpQsRXu3iaYw+ISShqQEprApUuP2go8pOH5mNatAM
 YzzY03aCmLeK+/hMtyCGNd9XvLDTaA5RK+DbXDZJCn3mTY1vHcnh7X1R5XU78KsOGT+rb3scGiY
 P
X-Received: by 2002:a17:902:d50a:b0:205:861c:5c3e with SMTP id
 d9443c01a7336-206f054d85amr195034605ad.30.1725898977637; 
 Mon, 09 Sep 2024 09:22:57 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 17/29] target/arm: Convert handle_vec_simd_shli to
 decodetree
Date: Mon,  9 Sep 2024 09:22:27 -0700
Message-ID: <20240909162240.647173-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-TUID: AimukxcvznUB

This includes SHL and SLI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 33 +++------------------------------
 target/arm/tcg/a64.decode      | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5c76cdf101..1225aac665 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6980,6 +6980,8 @@ TRANS(URSHR_v, do_vec_shift_imm, a, gen_gvec_urshr)
 TRANS(SRSRA_v, do_vec_shift_imm, a, gen_gvec_srsra)
 TRANS(URSRA_v, do_vec_shift_imm, a, gen_gvec_ursra)
 TRANS(SRI_v, do_vec_shift_imm, a, gen_gvec_sri)
+TRANS(SHL_v, do_vec_shift_imm, a, tcg_gen_gvec_shli)
+TRANS(SLI_v, do_vec_shift_imm, a, gen_gvec_sli);
 
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
@@ -10445,33 +10447,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -10585,9 +10560,6 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0a: /* SHL / SLI */
-        handle_vec_simd_shli(s, is_q, is_u, immh, immb, opcode, rn, rd);
-        break;
     case 0x10: /* SHRN */
     case 0x11: /* RSHRN / SQRSHRUN */
         if (is_u) {
@@ -10628,6 +10600,7 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     case 0x04: /* SRSHR / URSHR (rounding) */
     case 0x06: /* SRSRA / URSRA (accum + rounding) */
     case 0x08: /* SRI */
+    case 0x0a: /* SHL / SLI */
         unallocated_encoding(s);
         return;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 74ba1fa07c..77b860a3f2 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1205,6 +1205,11 @@ FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
 @q_shri_d       . 1 .. ..... 1 ...... ..... . rn:5 rd:5     \
                 &qrri_e esz=3 imm=%neon_rshift_i6 q=1
 
+@q_shli_b       . q:1 .. ..... 0001 imm:3 ..... . rn:5 rd:5 &qrri_e esz=0
+@q_shli_h       . q:1 .. ..... 001  imm:4 ..... . rn:5 rd:5 &qrri_e esz=1
+@q_shli_s       . q:1 .. ..... 01   imm:5 ..... . rn:5 rd:5 &qrri_e esz=2
+@q_shli_d       . 1   .. ..... 1    imm:6 ..... . rn:5 rd:5 &qrri_e esz=3 q=1
+
 FMOVI_v_h       0 q:1 00 1111 00000 ... 1111 11 ..... rd:5  %abcdefgh
 
 # MOVI, MVNI, ORR, BIC, FMOV are all intermixed via cmode.
@@ -1254,3 +1259,13 @@ SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_b
 SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_h
 SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_s
 SRI_v           0.10 11110 .... ... 01000 1 ..... .....     @q_shri_d
+
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_b
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_h
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_s
+SHL_v           0.00 11110 .... ... 01010 1 ..... .....     @q_shli_d
+
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_b
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_h
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_s
+SLI_v           0.10 11110 .... ... 01010 1 ..... .....     @q_shli_d
-- 
2.43.0

