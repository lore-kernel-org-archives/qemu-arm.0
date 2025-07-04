Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1253682dyc;
        Fri, 4 Jul 2025 07:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNubghz+vGe03WyqwpVBvdRMpBDfEquHTiaNb/JBh19gZYAvbN8+QS7s9+jaQSETj4+IX0Cc7PDxP/+w==@linaro.org
X-Received: by 2002:a05:6870:b154:b0:2e4:c018:e5d7 with SMTP id 586e51a60fabf-2f796975801mr1549057fac.3.1751639345891;
        Fri, 04 Jul 2025 07:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639345; cv=none;
        d=google.com; s=arc-20240605;
        b=UAfGgqg++gq+6lkZYR4877d4/EjXGaO8qEB8iH+ogsMT5mkCVA79cXab0EA0qbD6u8
         M7bSuaH9//pXIeyxulLplq36lHfpyXAhar0lcfepCcGYe4/F+b8NqWkPR7B9q37DDrov
         JsxQFqDhHixc/z6o3TzN2+75BcmPt7ihEIVYMGJRmdwaZQjnoGTUwRtn8hkgf8P/CRvC
         36PsMx3Tx4OFNzhs5pbdH3I/fxC1ig0LaGeOkqtBU6NLMMigcUmxeKI7wq4Yo/8UNbBq
         zovmpAwT5Qg2EaloamTkfYVRFuSpQTs6/MI2D70GsQXXLmF8lNc3d+QMzC6nfWUNamGL
         55ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BaetWJ15cQFkPEfdWC9a2/JW2VrVNcRjZFn2m3OFvj0=;
        fh=2dWCdk6hkIPYLrUFB6jji+0dnZJQktI8RTGzzkJR/1I=;
        b=Fv7fJraw2Myc+WNaKodcNGzC3psjT45AXwnSOzNaIdzPZmuYRECxqgiIo37veUgHvq
         iHXS4Mq+wgDWHCrINMUvM8mttCDBJM/Rf9/7tXY72esHFmw+5rXTTf/H1wOsuU4VtBts
         QoWHSPttBHsw7ULxUBmPsEBp2HZE0pNYyNjnExur7udwZKpTWtRwRGE/OSus/xTVmBh5
         bnfg1rdpciWzWUrdaEwX3A5RcD53/mtHdFeBKJWUExblHrX+ZQOqbcCvdU/LI/yQeuXc
         fYw1RSj+8eZJtAuMud3w5yqIyGNGmltlBSjjKgBhOMikGtgL/q0+sfSYFMflEc8j0MWB
         DNCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WCtjc+IV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2f78fdda633sor324764fac.3.2025.07.04.07.29.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 07:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WCtjc+IV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639345; x=1752244145; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaetWJ15cQFkPEfdWC9a2/JW2VrVNcRjZFn2m3OFvj0=;
        b=WCtjc+IV7h+QEYJsLjE/qM+O82HVs9rwsIUEG1jY5AXSPF+oHCRpUu3gdC0r7aaN3h
         F+KGlGUTYjMS+UWOqHFls8kzHtF774lT5vu2n6WmpvHG6wAnG9ZZBWdgpS67MZdixgYR
         5EKEo63EwBfEmc2dlp53DNUYpJyY4pwM7gWAwsh2g6svD7USQfFoN3ZnoeXh5Ur8NaKd
         476zbksJObus3tFUDTPsSjGi4KatgwNMbha5HLYDMko9sL8u3ErahxMgoImGjdEfMFPT
         TWs9AeGm3T8GULZOxIxGwEqr4AvUX/5oZQhsp3TGwNW0wVPdzkvtWTgwvQGQ1ftqed52
         5+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639345; x=1752244145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaetWJ15cQFkPEfdWC9a2/JW2VrVNcRjZFn2m3OFvj0=;
        b=wz2nSjTRJrYWNtmyQgft+RrgY/gIE3VbMfL/AMitVhVuSAtqXuKVTi44Ny4QEVwS6I
         9/ChIRexoVGJkWLrVzukRqoakt2JBD2Q9MOoRJF5ITR57fV5YK4HatA8Mw62P32hbMrF
         h4Me1fz/PP2xceC7ZS2gfuIe1fmTXE28eF59SeX0wo8FuuCzkYGS5eznUnd8IUfkDy0f
         +gsrOlEaY/DKF7//2qKNKOnlM2rq6/zwOhlsuoQVBS+kYl2bN735MM4ypPdoGExT37Bw
         6Lj2HxHVRHW2AvHykGkGAYy40vFHukCkdYXJ7GiKBZ/t4sZVAy6hIrsueaEGmi1nXnvJ
         k1ww==
X-Forwarded-Encrypted: i=1; AJvYcCUDSqh3Ik4p3vKmSjtU+R/ILCAz4e6RvyPOOf2voH+EaQfcwxPYBWg7oKBoZN6f/hI4KTecHKGOjZzqsQ==@linaro.org
X-Gm-Message-State: AOJu0YwZUIec/FJ/68wLd5zsW39eG7jqfoNdx9lZHjgtpaXdF2L1pRa9
	KnD793B/a0dyLWsl7ed7SNcwepbw4LUU7wZcUfoem5v5VPw6U+x1REval7eyzJTOAbRxiw==
X-Gm-Gg: ASbGncsWKj09gpdAHBI2UDwovIddA/JbV8JunbbaI4hJqiwcJOSjilg6c/0RZu5UGPW
	ijCtuN1u4LsdoRhcdxhAonp4Sw5xuyd0iEDGufE52EbQWllZ5Kz6LXdQqWo2tTS2Rb/my1N5eCE
	8TSh2e5KPNFLZlOupPTmhJ1bckWKQ/YHquvpoyocRqJF9/ONNzzAdF1y8rnHuqAzicVWpV7bcBO
	7KV2+XwkgXYm5U0LjFmFk6oC7/2TJc2eafW/fHO915Irz5MSYTrvXkz3uPtpZZ6BL7MPEoQ3lY8
	QdTezweHWz9lHJ70OHnwLTPS6N7iBHwp1NcHudGvTuidZRvA0eRYck6BEIRyoaVbWdSF/ZfcohC
	o0tie68I3hJJ+5YgK4E5oXGKTqOsVEJwCjP3NBPQdyucJspLyHBi+h242QxQ=
X-Google-Smtp-Source: AGHT+IGMbTk9W4e8KVhe79U4OAAQza0G/YxGPNomyCJMoJuLfAvYlNv7HNrF0PGX3UkXG/5BaV9UYQ==
X-Received: by 2002:a05:6870:4686:b0:2c2:4d76:f1ad with SMTP id 586e51a60fabf-2f796a09a7amr1635362fac.16.1751639345416;
        Fri, 04 Jul 2025 07:29:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:29:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 105/108] target/arm: Implement SME2 BFMOPA (non-widening)
Date: Fri,  4 Jul 2025 08:21:08 -0600
Message-ID: <20250704142112.1018902-106-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TZPDAOxrEK1o

From: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  6 ++++
 target/arm/tcg/sme_helper.c    | 51 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c |  5 ++++
 target/arm/tcg/sme.decode      |  2 ++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index fac70a82b9..1fc756bec6 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -145,6 +145,8 @@ DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_bfmopa_w, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_7(sme_bfmopa, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_7(sme_fmops_w_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
@@ -156,6 +158,8 @@ DEF_HELPER_FLAGS_7(sme_fmops_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_bfmops_w, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_7(sme_bfmops, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_7(sme_ah_fmops_w_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
@@ -167,6 +171,8 @@ DEF_HELPER_FLAGS_7(sme_ah_fmops_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_7(sme_ah_bfmops_w, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_7(sme_ah_bfmops, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_6(sme_smopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index d23d9f08d2..bb8ed1ed0e 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1144,6 +1144,57 @@ void HELPER(sme_ah_fmops_d)(void *vza, void *vzn, void *vzm, void *vpn,
                float_muladd_negate_product);
 }
 
+static void do_bfmopa(void *vza, void *vzn, void *vzm, uint16_t *pn,
+                      uint16_t *pm, float_status *fpst, uint32_t desc,
+                      uint16_t negx, int negf)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            if (pa & 1) {
+                void *vza_row = vza + tile_vslice_offset(row);
+                uint16_t n = *(uint32_t *)(vzn + H1_2(row)) ^ negx;
+
+                for (col = 0; col < oprsz; ) {
+                    uint16_t pb = pm[H2(col >> 4)];
+                    do {
+                        if (pb & 1) {
+                            uint16_t *a = vza_row + H1_2(col);
+                            uint16_t *m = vzm + H1_2(col);
+                            *a = bfloat16_muladd(n, *m, *a, negf, fpst);
+                        }
+                        col += 2;
+                        pb >>= 2;
+                    } while (col & 15);
+                }
+            }
+            row += 2;
+            pa >>= 2;
+        } while (row & 15);
+    }
+}
+
+void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
+                        void *vpm, float_status *fpst, uint32_t desc)
+{
+    do_bfmopa(vza, vzn, vzm, vpn, vpm, fpst, desc, 0, 0);
+}
+
+void HELPER(sme_bfmops)(void *vza, void *vzn, void *vzm, void *vpn,
+                        void *vpm, float_status *fpst, uint32_t desc)
+{
+    do_bfmopa(vza, vzn, vzm, vpn, vpm, fpst, desc, 1u << 15, 0);
+}
+
+void HELPER(sme_ah_bfmops)(void *vza, void *vzn, void *vzm, void *vpn,
+                           void *vpm, float_status *fpst, uint32_t desc)
+{
+    do_bfmopa(vza, vzn, vzm, vpn, vpm, fpst, desc, 0,
+              float_muladd_negate_product);
+}
+
 /*
  * Alter PAIR as needed for controlling predicates being false,
  * and for NEG on an enabled row element.
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 119a5665e6..65fc8bc9b2 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -582,6 +582,11 @@ TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, FPST_ZA,
            : !s->fpcr_ah ? gen_helper_sme_fmops_d
            : gen_helper_sme_ah_fmops_d)
 
+TRANS_FEAT(BFMOPA, aa64_sme_b16b16, do_outprod_fpst, a, MO_16, FPST_ZA,
+           !a->sub ? gen_helper_sme_bfmopa
+           : !s->fpcr_ah ? gen_helper_sme_bfmops
+           : gen_helper_sme_ah_bfmops)
+
 TRANS_FEAT(BFMOPA_w, aa64_sme, do_outprod_env, a, MO_32,
            !a->sub ? gen_helper_sme_bfmopa_w
            : !s->fpcr_ah ? gen_helper_sme_bfmops_w
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 3c58fdd2a0..6bb9aa2a90 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -191,6 +191,8 @@ FMOPA_h         10000001 100 ..... ... ... ..... . 100 .        @op_16
 FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
+BFMOPA          10000001 101 ..... ... ... ..... . 100 .        @op_16
+
 BFMOPA_w        10000001 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_w_h       10000001 101 ..... ... ... ..... . 00 ..        @op_32
 
-- 
2.43.0
