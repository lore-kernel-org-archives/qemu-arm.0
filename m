Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp932486njk;
        Fri, 24 Jan 2025 08:38:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUekaDOcML9ani/VYIGJCcil8bqfvSlkT6CpZjhjy2d0rnGdOcXw995d9diEZNWEFMutE2bBjwmcExcLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGBQ+5MHp6bMZ2G2BU1djSJJ3cLWOPfGdbGyZHJDyTSQ+PGloKx1vDwM0vQtDKQQtzNUMfA
X-Received: by 2002:a05:6122:88b:b0:518:a0ee:e8e7 with SMTP id 71dfb90a1353d-51d51a6328amr26998421e0c.0.1737736715127;
        Fri, 24 Jan 2025 08:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736715; cv=none;
        d=google.com; s=arc-20240605;
        b=HY1pfUD5mqaAb9gJ9RqabZjhW8BoBmXsEhm6QgV/UJIBLWMDTWNxIseR/QtQikxsc9
         /CaCjWl9+EO6arfZM2rEm5tv+A2u9eitAne2UBr/xzO83XLRP9gAQvazwRfHUFK+TqTO
         f8qYeS3aHPod4PByOIuuSlbqDXeatU6qAZlmekgm4r8EBon0XEk5ffG4MhzBEQWoirjp
         7tQ1dyFSzIwHF+j1K0Rwqr6S0RVvG6gntr2ruYLA74oU+rRk5ooFnDymJjxAFwIE+Ghp
         sWYUqBcWOtOdYbUwHLDyZiDbnrKdvQ6+o/4FOcE5fp4bQx1+PhwLACp5HNnlBgFxaAKv
         uv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=phqWKrFmcHTgW6QQ28uLmFCKUWP0y8vEv9xKJtoc0vQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=G0hDhBVNallxraeoKGrRXW2pDDps+qeGsZv8HKN34wCmCM8lXHm7TFW24lRcyCTA4W
         fvHBxsS/g5jnjss+IVEMeN60XFti6Tq//tRxD6e4y6toUn8S4kG2nAM3OK660nJf5eo5
         ZFYeN+VUWt8knR0nYWS3N/JLAdxfQMh2DtOvP2pn7EG51wAavfkKJFDGYBasYXXocMk6
         uHRNBPMWPOmAlV9fRy8xi/jDuFSIEzE6ejrm5ULgoxLRGsxDaDRefSTnQsYCAXOTvH+t
         Qoe2vPaMeaqVIk6pfkj98mycQoxHKA+5gpyjg/Tcy2pDX83h8VF/p0j9d9mqp4i/Gx/d
         272A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1vWMb2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51e4ecef6cesi1149015e0c.271.2025.01.24.08.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1vWMb2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMeG-0002GC-Ks; Fri, 24 Jan 2025 11:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZN-0005vi-TK
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:16 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZD-0005o8-KD
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:01 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso22313915e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736198; x=1738340998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=phqWKrFmcHTgW6QQ28uLmFCKUWP0y8vEv9xKJtoc0vQ=;
 b=G1vWMb2wVMZ2enIicJMMhBT9OEF/8oa4viM0FxpZWLT96e5bO5qtyKLzQh6ruQhwCJ
 QEToXjuIvByoFaQW+kBNBMWTk4f2ynA32Rw+QaCd81FdyGY014ljZnAG9UGdMfi0zz4J
 QLFlQhIPlEo/3tN7fisuZ5W4cZbz7NxPnSWviM3xupdS+dxnSe3RalV5FuFZgJcbEOvu
 9CfGlQ9itGxgPfRSOup9Ix/BdeQJGW5ovFGxesgB6f66pgfyc4EaALpHJ/jkT/m6iCIg
 UWjztnam4gLmo7wrbLgDF9b81bRpxmxwhqJP35V2pbBkIiLZKLM8AeUNZiwtJCqowSC7
 idcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736198; x=1738340998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phqWKrFmcHTgW6QQ28uLmFCKUWP0y8vEv9xKJtoc0vQ=;
 b=EGNBNjyplzq9xHEe6W4qOBMvtYFXYhJiaKFxuRPaQgQkGUJiF8sCBTTpN+S3nj1tZD
 6qrMGv91CSADMPXgSX28g3NObGcOp46EpYmDr5G6wlLuwfjJr6eTNfRiXOMYE0ndcu47
 mNh89bHM5tIV611ecq2isFwqKXTvLwJ7ylZ5XLVima2AdMc1KgosnAet1IYKkyowI/VP
 6to89UWmMahU02X5QXJVBIEbnvc49RH3UD42isxZqi37bvBBJYeA647hP20pAw0uU3yY
 vqLfj24UqSCNz/CNahbscLwpnKeUCd/htSKfJ+gzhuTbSssakHvpXYHiGuazN/drc6f8
 8z5A==
X-Gm-Message-State: AOJu0Yydkr5D5xPonSCMEoHtUiyIbUarbRnzBmc1rrnNrAoVpFz0HVLH
 4SoAYh83ohkM4EDJos+9UCdOHDHF+m3Y88TZQWSsGkgl4MQumSHOp/eSF6zumhq06bF8JZwZmFU
 r
X-Gm-Gg: ASbGncuwOtfsOAcQC7WM7GCKwMg0rMw1+Vj4/EmwuS5aGXPLDFkgejQFsX/5pJrFe7E
 9KacHzkwxHS3W7OLLAKgD0M30I2L1sF5ZARBPgHmVn+arH4dlt8ZF2btAWqpG3cfjJXr8QyQW73
 5eFrMfa0bfNODzzActzX5qq/VSk1cFOx8narC/crdZW2Dv9UF57Hwezzj4HJZGMA/45xhUW7PyD
 3gR+0xXAS8fbmEZN9wN8oOwEAVnRLG1RpmtLM+ra/cJorAjWldFD62OnO0lcuqsFj93xjWMoWw4
 i207F0XzC10=
X-Received: by 2002:a05:600c:1391:b0:434:ffb2:f9cf with SMTP id
 5b1f17b1804b1-438b88603femr75243415e9.14.1737736198236; 
 Fri, 24 Jan 2025 08:29:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 63/76] target/arm: Handle FPCR.AH in negation step in FMLS
 (indexed)
Date: Fri, 24 Jan 2025 16:28:23 +0000
Message-Id: <20250124162836.2332150-64-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PyOUWeB34dLL

Handle the FPCR.AH "don't negate the sign of a NaN" semantics in FMLS
(indexed), by passing through FPCR.AH in the SIMD data word, for the
helper to use to determine whether to negate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 2 +-
 target/arm/tcg/translate-sve.c | 2 +-
 target/arm/tcg/vec_helper.c    | 9 +++++++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3fe8e041093..c688275106f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6751,7 +6751,7 @@ static bool do_fmla_vector_idx(DisasContext *s, arg_qrrx_e *a, bool neg)
 
     gen_gvec_op4_fpst(s, a->q, a->rd, a->rn, a->rm, a->rd,
                       esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64,
-                      (a->idx << 1) | neg,
+                      (s->fpcr_ah << 5) | (a->idx << 1) | neg,
                       fns[esz - 1]);
     return true;
 }
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index eef3623fd3a..a7033fe93ab 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3533,7 +3533,7 @@ static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
         gen_helper_gvec_fmla_idx_d,
     };
     return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
-                              (a->index << 1) | sub,
+                              (s->fpcr_ah << 5) | (a->index << 1) | sub,
                               a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
 }
 
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index bf6f6a97636..5e9663382a9 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1708,13 +1708,18 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va,                  \
     intptr_t i, j, oprsz = simd_oprsz(desc);                               \
     intptr_t segment = MIN(16, oprsz) / sizeof(TYPE);                      \
     TYPE op1_neg = extract32(desc, SIMD_DATA_SHIFT, 1);                    \
-    intptr_t idx = desc >> (SIMD_DATA_SHIFT + 1);                          \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3);                \
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 5, 1);                \
     TYPE *d = vd, *n = vn, *m = vm, *a = va;                               \
     op1_neg <<= (8 * sizeof(TYPE) - 1);                                    \
     for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
         TYPE mm = m[H(i + idx)];                                           \
         for (j = 0; j < segment; j++) {                                    \
-            d[i + j] = TYPE##_muladd(n[i + j] ^ op1_neg,                   \
+            TYPE nval = n[i + j];                                          \
+            if (!(fpcr_ah && TYPE ## _is_any_nan(nval))) {                 \
+                nval ^= op1_neg;                                           \
+            }                                                              \
+            d[i + j] = TYPE##_muladd(nval,                                 \
                                      mm, a[i + j], 0, stat);               \
         }                                                                  \
     }                                                                      \
-- 
2.34.1

