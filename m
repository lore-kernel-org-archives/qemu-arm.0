Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1330359ejc;
        Fri, 13 Oct 2023 00:49:50 -0700 (PDT)
X-Received: by 2002:adf:ef91:0:b0:31f:f1f4:ca8b with SMTP id d17-20020adfef91000000b0031ff1f4ca8bmr20619153wro.40.1697183390571;
        Fri, 13 Oct 2023 00:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183390; cv=none;
        d=google.com; s=arc-20160816;
        b=UGjo0BliXIVJlxNjEniJMXXJJq7gaETix46LAXI7s69Okq/hwHpvcwww1AlQDlKHaQ
         Io7+62lmxNiFNBThOorknT8ylUlaGtJLyfde0q1TGO1sTuIdIQ/LJvGjF4RXeJUq3bJI
         iZAHAda50kizVsR4p9IAXzRAIEO5HTrwaXB5pawHqKhFmvKuCcDaTv4cnwi+XQPXyGnI
         pVDFb1dbiWybO1LFVtAIuCD2hiyLLc217qLOJYBNQ12rNikveSc9sgwqWD2xLYZ0wgTw
         3b9bN8Yj79JZ5FodV3k39Rpk3r4fHDTM0rZSepgsoMAR0u/MS1L0cSRuxe9Ram98hPf5
         4MNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7aeKq35mmTIUN+fGFa1jZeWofe0W3T+gZsntbEXTBh4=;
        fh=833eazwMBQ/ecAkJe1Ne9GB+2E2aDQFyo8VMdUIwDP4=;
        b=CcZJZPjhagSKhLPJT6uHaENphEdrsyAvhs4RA9h6MZZzy6+dVoEtrrjLNfJf7Hurxe
         tTG7vaXUH+/9GxL0enArJe4XtIQQU85189ZhI0tTeGre/zYZhIPBtg05HCclE25hL8/G
         gE16VgZcgVKOn/S0/pX52v42v5AfqS0sJTPsFdnjhEHkDV4no4VmjqoclPurT+drpPg7
         z0WFpOkV9FL070AEto9rM2rtqnFtk8Dg9HZzstIhJLbLW1lhc+4f+dW1lOmwOxtAswKs
         LNAxNMmyAuCUkgdoByKN10aILsxumnNdedLWCYRzZamnbqO05J4mZhJ3By3reLtUJBuI
         8xlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/Bb+9Dw";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k13-20020adfb34d000000b0032d8bad6e2asor1309135wrd.0.2023.10.13.00.49.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 00:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/Bb+9Dw";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697183390; x=1697788190; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aeKq35mmTIUN+fGFa1jZeWofe0W3T+gZsntbEXTBh4=;
        b=Y/Bb+9DwKMi3Z0zpsv0URTozMlkD7Gw1X/xinFl/U9bRHfEny7atub7d+ELHXwBais
         VRC7A5nvOgPEDZ9SXrrm2nd4xq0Wy2wTKg5tQL1b1+TO/clzEyZkcdpmlN3grd+IUEVJ
         2k5InnF/Zwv+3iFCZnW0IfisfVV1GUQwndwMDyqKsA3GHwguUIkI5IPq6qttUczrjNeV
         poPBIOyG2H2CHXMJFY9zWAttz964jihlnBooO339lgnNObzve5XTLRZblx7tX8u0fUHh
         90XcCTL0Ew1bmZUXFt3gF1tMZ//mP53lpCmENJGztNb9dTeWFNaUQYNRSN8BeXr1n4eh
         X3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183390; x=1697788190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aeKq35mmTIUN+fGFa1jZeWofe0W3T+gZsntbEXTBh4=;
        b=ICXREKqCVyOAsF5TF9RPbu+yIidXcqG+rUij6R3HEpXzejpgEE65r1oz69dM+SzZOk
         7iYItXOtwo1Nzc/kfiq+kDfnZUAo+0qL4EDgAAv4q2F5eQMCDIB9eNUtl5KzlgqUaTy1
         IGMtWsdYKk/TjLmvAIkO+4WEPU4FQm7h/E1rtsC6Hmbhn3YDPLOnZXBRBsHC1tqSknpI
         ZrRHZpBIXBM9ORqQIcTKyCaWnU5WWRYXBVSjicd5lrGFOf49PNhJoAsqT8q55uU14FT5
         vSq16xjbqXPe31e9Q0c6VSMc37S5aEb4x72JgW1z/ApKGoAf030qT4y8TnQ/WaK9nkf+
         Buig==
X-Gm-Message-State: AOJu0Yyk1wivYW7q8oT8uRkvNa8MwA6du/lLbyo1885j95KJfT3O3IE3
	lsToXV6AxzR9mtXgQJ3iDuNTjl4E
X-Google-Smtp-Source: AGHT+IFELsz3uCt0tiTm+VEqnfXz+EDHiO9BNF6vnJTsWChhcLiftpgY6NUn4jcUngww3YefDO7x3A==
X-Received: by 2002:a05:6000:1cc:b0:32d:819c:5da6 with SMTP id t12-20020a05600001cc00b0032d819c5da6mr6967311wrx.21.1697183390123;
        Fri, 13 Oct 2023 00:49:50 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr. [109.242.226.170])
        by smtp.gmail.com with ESMTPSA id m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:49:49 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 03/78] fpu/softfloat: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:07 +0300
Message-Id: <f329886becdeaa9a0b7cc2d19a02b3973266151b.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EUelCwnF50Hp

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 fpu/softfloat-parts.c.inc | 8 ++++----
 fpu/softfloat.c           | 7 ++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a44649f4f4..df64cc7a29 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -138,166 +138,166 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
 /*
  * Round and uncanonicalize a floating-point number by parts. There
  * are FRAC_SHIFT bits that may require rounding at the bottom of the
  * fraction; these bits will be removed. The exponent will be biased
  * by EXP_BIAS and must be bounded by [EXP_MAX-1, 0].
  */
 static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
                                    const FloatFmt *fmt)
 {
     const int exp_max = fmt->exp_max;
     const int frac_shift = fmt->frac_shift;
     const uint64_t round_mask = fmt->round_mask;
     const uint64_t frac_lsb = round_mask + 1;
     const uint64_t frac_lsbm1 = round_mask ^ (round_mask >> 1);
     const uint64_t roundeven_mask = round_mask | frac_lsb;
     uint64_t inc;
     bool overflow_norm = false;
     int exp, flags = 0;
 
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
         if (N > 64 && frac_lsb == 0) {
             inc = ((p->frac_hi & 1) || (p->frac_lo & round_mask) != frac_lsbm1
                    ? frac_lsbm1 : 0);
         } else {
             inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1
                    ? frac_lsbm1 : 0);
         }
         break;
     case float_round_ties_away:
         inc = frac_lsbm1;
         break;
     case float_round_to_zero:
         overflow_norm = true;
         inc = 0;
         break;
     case float_round_up:
         inc = p->sign ? 0 : round_mask;
         overflow_norm = p->sign;
         break;
     case float_round_down:
         inc = p->sign ? round_mask : 0;
         overflow_norm = !p->sign;
         break;
     case float_round_to_odd:
         overflow_norm = true;
-        /* fall through */
+        fallthrough;
     case float_round_to_odd_inf:
         if (N > 64 && frac_lsb == 0) {
             inc = p->frac_hi & 1 ? 0 : round_mask;
         } else {
             inc = p->frac_lo & frac_lsb ? 0 : round_mask;
         }
         break;
     default:
         g_assert_not_reached();
     }
 
     exp = p->exp + fmt->exp_bias;
     if (likely(exp > 0)) {
         if (p->frac_lo & round_mask) {
             flags |= float_flag_inexact;
             if (frac_addi(p, p, inc)) {
                 frac_shr(p, 1);
                 p->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
                 exp++;
             }
             p->frac_lo &= ~round_mask;
         }
 
         if (fmt->arm_althp) {
             /* ARM Alt HP eschews Inf and NaN for a wider exponent.  */
             if (unlikely(exp > exp_max)) {
                 /* Overflow.  Return the maximum normal.  */
                 flags = float_flag_invalid;
                 exp = exp_max;
                 frac_allones(p);
                 p->frac_lo &= ~round_mask;
             }
         } else if (unlikely(exp >= exp_max)) {
             flags |= float_flag_overflow;
             if (s->rebias_overflow) {
                 exp -= fmt->exp_re_bias;
             } else if (overflow_norm) {
                 flags |= float_flag_inexact;
                 exp = exp_max - 1;
                 frac_allones(p);
                 p->frac_lo &= ~round_mask;
             } else {
                 flags |= float_flag_inexact;
                 p->cls = float_class_inf;
                 exp = exp_max;
                 frac_clear(p);
             }
         }
         frac_shr(p, frac_shift);
     } else if (unlikely(s->rebias_underflow)) {
         flags |= float_flag_underflow;
         exp += fmt->exp_re_bias;
         if (p->frac_lo & round_mask) {
             flags |= float_flag_inexact;
             if (frac_addi(p, p, inc)) {
                 frac_shr(p, 1);
                 p->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
                 exp++;
             }
             p->frac_lo &= ~round_mask;
         }
         frac_shr(p, frac_shift);
     } else if (s->flush_to_zero) {
         flags |= float_flag_output_denormal;
         p->cls = float_class_zero;
         exp = 0;
         frac_clear(p);
     } else {
         bool is_tiny = s->tininess_before_rounding || exp < 0;
 
         if (!is_tiny) {
             FloatPartsN discard;
             is_tiny = !frac_addi(&discard, p, inc);
         }
 
         frac_shrjam(p, !fmt->m68k_denormal - exp);
 
         if (p->frac_lo & round_mask) {
             /* Need to recompute round-to-even/round-to-odd. */
             switch (s->float_rounding_mode) {
             case float_round_nearest_even:
                 if (N > 64 && frac_lsb == 0) {
                     inc = ((p->frac_hi & 1) ||
                            (p->frac_lo & round_mask) != frac_lsbm1
                            ? frac_lsbm1 : 0);
                 } else {
                     inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1
                            ? frac_lsbm1 : 0);
                 }
                 break;
             case float_round_to_odd:
             case float_round_to_odd_inf:
                 if (N > 64 && frac_lsb == 0) {
                     inc = p->frac_hi & 1 ? 0 : round_mask;
                 } else {
                     inc = p->frac_lo & frac_lsb ? 0 : round_mask;
                 }
                 break;
             default:
                 break;
             }
             flags |= float_flag_inexact;
             frac_addi(p, p, inc);
             p->frac_lo &= ~round_mask;
         }
 
         exp = (p->frac_hi & DECOMPOSED_IMPLICIT_BIT) && !fmt->m68k_denormal;
         frac_shr(p, frac_shift);
 
         if (is_tiny && (flags & float_flag_inexact)) {
             flags |= float_flag_underflow;
         }
         if (exp == 0 && frac_eqz(p)) {
             p->cls = float_class_zero;
         }
     }
     p->exp = exp;
     float_raise(flags, s);
 }
@@ -1051,219 +1051,219 @@ static void partsN(round_to_int)(FloatPartsN *a, FloatRoundMode rmode,
 /*
  * Returns the result of converting the floating-point value `a' to
  * the two's complement integer format. The conversion is performed
  * according to the IEC/IEEE Standard for Binary Floating-Point
  * Arithmetic---which means in particular that the conversion is
  * rounded according to the current rounding mode. If `a' is a NaN,
  * the largest positive integer is returned. Otherwise, if the
  * conversion overflows, the largest integer with the same sign as `a'
  * is returned.
  */
 static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
                                      int scale, int64_t min, int64_t max,
                                      float_status *s)
 {
     int flags = 0;
     uint64_t r;
 
     switch (p->cls) {
     case float_class_snan:
         flags |= float_flag_invalid_snan;
-        /* fall through */
+        fallthrough;
     case float_class_qnan:
         flags |= float_flag_invalid;
         r = max;
         break;
 
     case float_class_inf:
         flags = float_flag_invalid | float_flag_invalid_cvti;
         r = p->sign ? min : max;
         break;
 
     case float_class_zero:
         return 0;
 
     case float_class_normal:
         /* TODO: N - 2 is frac_size for rounding; could use input fmt. */
         if (parts_round_to_int_normal(p, rmode, scale, N - 2)) {
             flags = float_flag_inexact;
         }
 
         if (p->exp <= DECOMPOSED_BINARY_POINT) {
             r = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
         } else {
             r = UINT64_MAX;
         }
         if (p->sign) {
             if (r <= -(uint64_t)min) {
                 r = -r;
             } else {
                 flags = float_flag_invalid | float_flag_invalid_cvti;
                 r = min;
             }
         } else if (r > max) {
             flags = float_flag_invalid | float_flag_invalid_cvti;
             r = max;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     float_raise(flags, s);
     return r;
 }
 
 /*
  *  Returns the result of converting the floating-point value `a' to
  *  the unsigned integer format. The conversion is performed according
  *  to the IEC/IEEE Standard for Binary Floating-Point
  *  Arithmetic---which means in particular that the conversion is
  *  rounded according to the current rounding mode. If `a' is a NaN,
  *  the largest unsigned integer is returned. Otherwise, if the
  *  conversion overflows, the largest unsigned integer is returned. If
  *  the 'a' is negative, the result is rounded and zero is returned;
  *  values that do not round to zero will raise the inexact exception
  *  flag.
  */
 static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
                                       int scale, uint64_t max, float_status *s)
 {
     int flags = 0;
     uint64_t r;
 
     switch (p->cls) {
     case float_class_snan:
         flags |= float_flag_invalid_snan;
-        /* fall through */
+        fallthrough;
     case float_class_qnan:
         flags |= float_flag_invalid;
         r = max;
         break;
 
     case float_class_inf:
         flags = float_flag_invalid | float_flag_invalid_cvti;
         r = p->sign ? 0 : max;
         break;
 
     case float_class_zero:
         return 0;
 
     case float_class_normal:
         /* TODO: N - 2 is frac_size for rounding; could use input fmt. */
         if (parts_round_to_int_normal(p, rmode, scale, N - 2)) {
             flags = float_flag_inexact;
             if (p->cls == float_class_zero) {
                 r = 0;
                 break;
             }
         }
 
         if (p->sign) {
             flags = float_flag_invalid | float_flag_invalid_cvti;
             r = 0;
         } else if (p->exp > DECOMPOSED_BINARY_POINT) {
             flags = float_flag_invalid | float_flag_invalid_cvti;
             r = max;
         } else {
             r = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
             if (r > max) {
                 flags = float_flag_invalid | float_flag_invalid_cvti;
                 r = max;
             }
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     float_raise(flags, s);
     return r;
 }
 
 /*
  * Like partsN(float_to_sint), except do not saturate the result.
  * Instead, return the rounded unbounded precision two's compliment result,
  * modulo 2**(bitsm1 + 1).
  */
 static int64_t partsN(float_to_sint_modulo)(FloatPartsN *p,
                                             FloatRoundMode rmode,
                                             int bitsm1, float_status *s)
 {
     int flags = 0;
     uint64_t r;
     bool overflow = false;
 
     switch (p->cls) {
     case float_class_snan:
         flags |= float_flag_invalid_snan;
-        /* fall through */
+        fallthrough;
     case float_class_qnan:
         flags |= float_flag_invalid;
         r = 0;
         break;
 
     case float_class_inf:
         overflow = true;
         r = 0;
         break;
 
     case float_class_zero:
         return 0;
 
     case float_class_normal:
         /* TODO: N - 2 is frac_size for rounding; could use input fmt. */
         if (parts_round_to_int_normal(p, rmode, 0, N - 2)) {
             flags = float_flag_inexact;
         }
 
         if (p->exp <= DECOMPOSED_BINARY_POINT) {
             /*
              * Because we rounded to integral, and exp < 64,
              * we know frac_low is zero.
              */
             r = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
             if (p->exp < bitsm1) {
                 /* Result in range. */
             } else if (p->exp == bitsm1) {
                 /* The only in-range value is INT_MIN. */
                 overflow = !p->sign || p->frac_hi != DECOMPOSED_IMPLICIT_BIT;
             } else {
                 overflow = true;
             }
         } else {
             /* Overflow, but there might still be bits to return. */
             int shl = p->exp - DECOMPOSED_BINARY_POINT;
             if (shl < N) {
                 frac_shl(p, shl);
                 r = p->frac_hi;
             } else {
                 r = 0;
             }
             overflow = true;
         }
 
         if (p->sign) {
             r = -r;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     if (overflow) {
         flags = float_flag_invalid | float_flag_invalid_cvti;
     }
     float_raise(flags, s);
     return r;
 }
 
 /*
  * Integer to float conversions
  *
  * Returns the result of converting the two's complement integer `a'
  * to the floating-point format. The conversion is performed according
  * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
  */
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 027a8e576d..e16e1896ee 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1811,56 +1811,57 @@ static bool floatx80_unpack_canonical(FloatParts128 *p, floatx80 f,
 static floatx80 floatx80_round_pack_canonical(FloatParts128 *p,
                                               float_status *s)
 {
     const FloatFmt *fmt = &floatx80_params[s->floatx80_rounding_precision];
     uint64_t frac;
     int exp;
 
     switch (p->cls) {
     case float_class_normal:
         if (s->floatx80_rounding_precision == floatx80_precision_x) {
             parts_uncanon_normal(p, s, fmt);
             frac = p->frac_hi;
             exp = p->exp;
         } else {
             FloatParts64 p64;
 
             p64.sign = p->sign;
             p64.exp = p->exp;
             frac_truncjam(&p64, p);
             parts_uncanon_normal(&p64, s, fmt);
             frac = p64.frac;
             exp = p64.exp;
         }
         if (exp != fmt->exp_max) {
             break;
         }
         /* rounded to inf -- fall through to set frac correctly */
+        fallthrough;
 
     case float_class_inf:
         /* x86 and m68k differ in the setting of the integer bit. */
         frac = floatx80_infinity_low;
         exp = fmt->exp_max;
         break;
 
     case float_class_zero:
         frac = 0;
         exp = 0;
         break;
 
     case float_class_snan:
     case float_class_qnan:
         /* NaNs have the integer bit set. */
         frac = p->frac_hi | (1ull << 63);
         exp = fmt->exp_max;
         break;
 
     default:
         g_assert_not_reached();
     }
 
     return packFloatx80(p->sign, exp, frac);
 }
 
 /*
  * Addition and subtraction
  */
@@ -2668,35 +2669,35 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
 static void parts_float_to_ahp(FloatParts64 *a, float_status *s)
 {
     switch (a->cls) {
     case float_class_snan:
         float_raise(float_flag_invalid_snan, s);
-        /* fall through */
+        fallthrough;
     case float_class_qnan:
         /*
          * There is no NaN in the destination format.  Raise Invalid
          * and return a zero with the sign of the input NaN.
          */
         float_raise(float_flag_invalid, s);
         a->cls = float_class_zero;
         break;
 
     case float_class_inf:
         /*
          * There is no Inf in the destination format.  Raise Invalid
          * and return the maximum normal with the correct sign.
          */
         float_raise(float_flag_invalid, s);
         a->cls = float_class_normal;
         a->exp = float16_params_ahp.exp_max;
         a->frac = MAKE_64BIT_MASK(float16_params_ahp.frac_shift,
                                   float16_params_ahp.frac_size + 1);
         break;
 
     case float_class_normal:
     case float_class_zero:
         break;
 
     default:
         g_assert_not_reached();
     }
 }
@@ -3190,53 +3191,53 @@ static int64_t float128_to_int64_scalbn(float128 a, FloatRoundMode rmode,
 static Int128 float128_to_int128_scalbn(float128 a, FloatRoundMode rmode,
                                         int scale, float_status *s)
 {
     int flags = 0;
     Int128 r;
     FloatParts128 p;
 
     float128_unpack_canonical(&p, a, s);
 
     switch (p.cls) {
     case float_class_snan:
         flags |= float_flag_invalid_snan;
-        /* fall through */
+        fallthrough;
     case float_class_qnan:
         flags |= float_flag_invalid;
         r = UINT128_MAX;
         break;
 
     case float_class_inf:
         flags = float_flag_invalid | float_flag_invalid_cvti;
         r = p.sign ? INT128_MIN : INT128_MAX;
         break;
 
     case float_class_zero:
         return int128_zero();
 
     case float_class_normal:
         if (parts_round_to_int_normal(&p, rmode, scale, 128 - 2)) {
             flags = float_flag_inexact;
         }
 
         if (p.exp < 127) {
             int shift = 127 - p.exp;
             r = int128_urshift(int128_make128(p.frac_lo, p.frac_hi), shift);
             if (p.sign) {
                 r = int128_neg(r);
             }
         } else if (p.exp == 127 && p.sign && p.frac_lo == 0 &&
                    p.frac_hi == DECOMPOSED_IMPLICIT_BIT) {
             r = INT128_MIN;
         } else {
             flags = float_flag_invalid | float_flag_invalid_cvti;
             r = p.sign ? INT128_MIN : INT128_MAX;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     float_raise(flags, s);
     return r;
 }
@@ -3617,54 +3618,54 @@ static uint64_t float128_to_uint64_scalbn(float128 a, FloatRoundMode rmode,
 static Int128 float128_to_uint128_scalbn(float128 a, FloatRoundMode rmode,
                                          int scale, float_status *s)
 {
     int flags = 0;
     Int128 r;
     FloatParts128 p;
 
     float128_unpack_canonical(&p, a, s);
 
     switch (p.cls) {
     case float_class_snan:
         flags |= float_flag_invalid_snan;
-        /* fall through */
+        fallthrough;
     case float_class_qnan:
         flags |= float_flag_invalid;
         r = UINT128_MAX;
         break;
 
     case float_class_inf:
         flags = float_flag_invalid | float_flag_invalid_cvti;
         r = p.sign ? int128_zero() : UINT128_MAX;
         break;
 
     case float_class_zero:
         return int128_zero();
 
     case float_class_normal:
         if (parts_round_to_int_normal(&p, rmode, scale, 128 - 2)) {
             flags = float_flag_inexact;
             if (p.cls == float_class_zero) {
                 r = int128_zero();
                 break;
             }
         }
 
         if (p.sign) {
             flags = float_flag_invalid | float_flag_invalid_cvti;
             r = int128_zero();
         } else if (p.exp <= 127) {
             int shift = 127 - p.exp;
             r = int128_urshift(int128_make128(p.frac_lo, p.frac_hi), shift);
         } else {
             flags = float_flag_invalid | float_flag_invalid_cvti;
             r = UINT128_MAX;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     float_raise(flags, s);
     return r;
 }
-- 
2.39.2
