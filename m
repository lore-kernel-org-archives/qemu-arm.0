Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413034njb;
        Thu, 28 Nov 2024 02:43:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUY5Sl2xoyr38jNY/9T6DMEkwCTT5AuE9MbRI/pcr5nWI1HCQGZDuNPY5UxCNa4+asG3oCOLoT4J9iZaA==@linaro.org
X-Received: by 2002:a05:600c:3546:b0:42f:823d:dde9 with SMTP id 5b1f17b1804b1-434a9df6de4mr52179175e9.21.1732790596240;
        Thu, 28 Nov 2024 02:43:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790596; cv=none;
        d=google.com; s=arc-20240605;
        b=Bb2Fx7XKdp4cuTbdBtybCdjBJWZMuptVB9q9o/7zDOkZpS1xi6cK0ARl/iuAdTKwbK
         d3lCt0DR5DfOIKARnnfo5P/Dl/w3jhEJBb1kLt9HEtag3/wVL31Cr+rcP1or/32a4Mm8
         rC/G+LqXxq3JRZl1L1KT4mQkxqeTGW+eTnmqkNS14TFIH1DhkZysSWVxM5JrxbbV8p9r
         9h1BN9j3nl4cVHESpOblcmi6Z2PFPrwpAcyzFxfXLk1VM5oOJtCnseipfgiYKXVYyLFf
         C3vZ0fstS7O8DQp8gEH9Uc4ousLsBAtY5FnSrYjBf58Xw9FY8cIpH1TfoTcHtBQ+eqYq
         b7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XbqQkBG4nS4k6Fnk766q2xcLuZrRdjETQUTauBBIIX8=;
        fh=DVCr3fozk0gafB7DgKnfqiDkPzv15TmwrVXMKITUsP4=;
        b=lg7EyZco9tSCSVen0DetpXY0IncsiaT7GQQyTodtT7brecewE0lidhBHyqjFD6xnFJ
         KZZrr9Jg6CyZ+PHUdqbD1A6Z8god3daCrCfmcZotlz2pehkQb15lb2rCmHQHG68j1oky
         ciZMi65htJngkYKM6rXw7cfJ+PylKVeCjGRQ3rS+RUeoK/sdCot5Q34xupa6KW2nHkpJ
         R8hnDaR/6n4rQvsPAy5vYSgXRZMdzlhSE7aGRg4CVksyTPGmFFf5inm4zybV/1URiHoE
         DxAxwBT5r0nz10PAzAKY5zJCuowzXxiHuibcSDrelJ+oPmlgK0mOAwjiNcwdMAUAup8q
         qbMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gfVXq4XC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a2f56sor5017375e9.11.2024.11.28.02.43.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gfVXq4XC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790596; x=1733395396; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbqQkBG4nS4k6Fnk766q2xcLuZrRdjETQUTauBBIIX8=;
        b=gfVXq4XC7SZsEwoaz+tPGKhK5WLbZk1FQIfTKXEkSMHG2HDoWyaYBt0OkGhX/Wtfkb
         kW1TuRZ5ZGXDJR5R1OwS6/U/duZe5uLXKzMLTXsEcK4XqPGVvxxfdqHztOlbKcQs0vfs
         /rf1By4YJvnMM/QG4+OQHBuX+4jGFTRiFe2C8yueRBD8J7RfXC40iiShPS4w6Q8MGUyv
         dJdSqRYB/EHYqYp04Mjm4Pt7WCxn92mDdo+xEHwtlRkRSzFHBdNdklZ8bVsNI0NyDwmR
         wVC5eOG+LeT+Anf11Fe3II10nIKGT/d2Yea//PskLrogRVnS6n6Viavw7amHkJxx0vkd
         yuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790596; x=1733395396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbqQkBG4nS4k6Fnk766q2xcLuZrRdjETQUTauBBIIX8=;
        b=gQhDPN3HC5+7ueTbckP+S4pQCKRfUBDQbmiJu52V+N1iqzMNzNRkRlminoS5xbF3kp
         /wPh/kD9SyK58FqIm6O7PB0KHO7WowiINwWBWzROGGu++uQ2D7aDj+fJi5s9Iei+9kYQ
         rOURLZ+U8XFh6kleSrkKMN/sKUkJ6ob40h41YxNwmoGw9jCqc2Rm0/njODL+xPeYIFvP
         lYzculV51G9WPGDtyA5Vqb94hRyL0LNOVn7EA+lNTyf500qNu/CFYUeleP4GanOTttIJ
         lqY0yjWHduWOUT5dQ5pD5euaix8t5ONyA3aq3nbQLjKM3BpleOJbZrtfQoG8CisXiA3h
         fzeA==
X-Forwarded-Encrypted: i=1; AJvYcCWK2s0NuC0xz71jCGVrwVO+yyaDmmpDhyzeaDVu1AhRavt6Lww9J5luRv4tDwkRH28aSKvEbF9kYVOsvA==@linaro.org
X-Gm-Message-State: AOJu0YwVKajdlpGrhNjas8tNsmRf1dfe1s2QdWPa+b3qAsGQdcvwnXyN
	LutK2QsJYk3BQl9LCj+/SJJxxfEaa2ansevFedevvb4wEEl2TB2odOQPcDzEvwJ9PA==
X-Gm-Gg: ASbGncu38kUp+LOfrX02bjFWNloHm5aBe7+hACfEf7h4+87dU3FOaP5hBLNs9e+dsUW
	H5Al7E5bLEvzHT/2l+z1X43anWPfI1p9cieHnfL50IIM6YPbNMpV+xKfKpKW1uBedW29NpNO95x
	oFAMNGGJ47qVUtljvX1UJ/Alk8pwrABXzflyMeRCOfivE0OFm35x1ls89ou9EjwA1rbX5nxjRxs
	jKV4e8nIRn9x/90vmPzKxDsRNoHlV+SThpbOtUsbqj7TKr5ROqg/J4=
X-Google-Smtp-Source: AGHT+IFd3mlPBDdVk3zjWvVp53gbvmNrA7mV68de8ZqL8Sneu4L6ggQoBbXs/tvpPx5knqDrUg0L6A==
X-Received: by 2002:a5d:5f8f:0:b0:382:41ad:d8d1 with SMTP id ffacd0b85a97d-385c6ee21c7mr5998188f8f.53.1732790595577;
        Thu, 28 Nov 2024 02:43:15 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH for-10.0 03/25] softfloat: Allow runtime choice of inf * 0 + NaN result
Date: Thu, 28 Nov 2024 10:42:48 +0000
Message-Id: <20241128104310.3452934-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UBK5RfuDtygJ

IEEE 758 does not define a fixed rule for what NaN to return in
the case of a fused multiply-add of inf * 0 + NaN. Different
architectures thus do different things:
 * some return the default NaN
 * some return the input NaN
 * Arm returns the default NaN if the input NaN is quiet,
   and the input NaN if it is signalling

We want to make this logic be runtime selected rather than
hardcoded into the binary, because:
 * this will let us have multiple targets in one QEMU binary
 * the Arm FEAT_AFP architectural feature includes letting
   the guest select a NaN propagation rule at runtime

In this commit we add an enum for the propagation rule, the field in
float_status, and the corresponding getters and setters.  We change
pickNaNMulAdd to honour this, but because all targets still leave
this field at its default 0 value, the fallback logic will pick the
rule type with the old ifdef ladder.

Note that four architectures both use the muladd softfloat functions
and did not have a branch of the ifdef ladder to specify their
behaviour (and so were ending up with the "default" case, probably
wrongly): i386, HPPA, SH4 and Tricore.  SH4 and Tricore both set
default_nan_mode, and so will never get into pickNaNMulAdd().  For
HPPA and i386 we retain the same behaviour as the old default-case,
which is to not ever return the default NaN.  This might not be
correct but it is not a behaviour change.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat-helpers.h | 11 ++++
 include/fpu/softfloat-types.h   | 23 +++++++++
 fpu/softfloat-specialize.c.inc  | 91 ++++++++++++++++++++++-----------
 3 files changed, 95 insertions(+), 30 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 453188de70b..0bf44dc6087 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -81,6 +81,12 @@ static inline void set_float_2nan_prop_rule(Float2NaNPropRule rule,
     status->float_2nan_prop_rule = rule;
 }
 
+static inline void set_float_infzeronan_rule(FloatInfZeroNaNRule rule,
+                                             float_status *status)
+{
+    status->float_infzeronan_rule = rule;
+}
+
 static inline void set_flush_to_zero(bool val, float_status *status)
 {
     status->flush_to_zero = val;
@@ -137,6 +143,11 @@ static inline Float2NaNPropRule get_float_2nan_prop_rule(float_status *status)
     return status->float_2nan_prop_rule;
 }
 
+static inline FloatInfZeroNaNRule get_float_infzeronan_rule(float_status *status)
+{
+    return status->float_infzeronan_rule;
+}
+
 static inline bool get_flush_to_zero(float_status *status)
 {
     return status->flush_to_zero;
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 8f39691dfd0..27a1c96754d 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -207,6 +207,28 @@ typedef enum __attribute__((__packed__)) {
     float_2nan_prop_x87,
 } Float2NaNPropRule;
 
+/*
+ * Rule for result of fused multiply-add 0 * Inf + NaN.
+ * This must be a NaN, but implementations differ on whether this
+ * is the input NaN or the default NaN.
+ *
+ * You don't need to set this if default_nan_mode is enabled.
+ * When not in default-NaN mode, it is an error for the target
+ * not to set the rule in float_status if it uses muladd, and we
+ * will assert if we need to handle an input NaN and no rule was
+ * selected.
+ */
+typedef enum __attribute__((__packed__)) {
+    /* No propagation rule specified */
+    float_infzeronan_none = 0,
+    /* Result is never the default NaN (so always the input NaN) */
+    float_infzeronan_dnan_never = 0,
+    /* Result is always the default NaN */
+    float_infzeronan_dnan_always,
+    /* Result is the default NaN if the input NaN is quiet */
+    float_infzeronan_dnan_if_qnan,
+} FloatInfZeroNaNRule;
+
 /*
  * Floating Point Status. Individual architectures may maintain
  * several versions of float_status for different functions. The
@@ -219,6 +241,7 @@ typedef struct float_status {
     FloatRoundMode float_rounding_mode;
     FloatX80RoundPrec floatx80_rounding_precision;
     Float2NaNPropRule float_2nan_prop_rule;
+    FloatInfZeroNaNRule float_infzeronan_rule;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? */
     bool flush_to_zero;
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 81a67eb67b5..f5b422e07b5 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -475,6 +475,8 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
                          bool infzero, float_status *status)
 {
+    FloatInfZeroNaNRule rule = status->float_infzeronan_rule;
+
     /*
      * We guarantee not to require the target to tell us how to
      * pick a NaN if we're always returning the default NaN.
@@ -482,14 +484,68 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * specify.
      */
     assert(!status->default_nan_mode);
+
+    if (rule == float_infzeronan_none) {
+        /*
+         * Temporarily fall back to ifdef ladder
+         */
 #if defined(TARGET_ARM)
-    /* For ARM, the (inf,zero,qnan) case sets InvalidOp and returns
-     * the default NaN
-     */
-    if (infzero && is_qnan(c_cls)) {
-        return 3;
+        /*
+         * For ARM, the (inf,zero,qnan) case returns the default NaN,
+         * but (inf,zero,snan) returns the input NaN.
+         */
+        rule = float_infzeronan_dnan_if_qnan;
+#elif defined(TARGET_MIPS)
+        if (snan_bit_is_one(status)) {
+            /*
+             * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
+             * case sets InvalidOp and returns the default NaN
+             */
+            rule = float_infzeronan_dnan_always;
+        } else {
+            /*
+             * For MIPS systems that conform to IEEE754-2008, the (inf,zero,nan)
+             * case sets InvalidOp and returns the input value 'c'
+             */
+            rule = float_infzeronan_dnan_never;
+        }
+#elif defined(TARGET_PPC) || defined(TARGET_SPARC) || \
+    defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
+    defined(TARGET_I386) || defined(TARGET_LOONGARCH)
+        /*
+         * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
+         * case sets InvalidOp and returns the input value 'c'
+         */
+        /*
+         * For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
+         * to return an input NaN if we have one (ie c) rather than generating
+         * a default NaN
+         */
+        rule = float_infzeronan_dnan_never;
+#elif defined(TARGET_S390X)
+        rule = float_infzeronan_dnan_always;
+#endif
     }
 
+    if (infzero) {
+        /*
+         * Inf * 0 + NaN -- some implementations return the default NaN here,
+         * and some return the input NaN.
+         */
+        switch (rule) {
+        case float_infzeronan_dnan_never:
+            return 2;
+        case float_infzeronan_dnan_always:
+            return 3;
+        case float_infzeronan_dnan_if_qnan:
+            return is_qnan(c_cls) ? 3 : 2;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+#if defined(TARGET_ARM)
+
     /* This looks different from the ARM ARM pseudocode, because the ARM ARM
      * puts the operands to a fused mac operation (a*b)+c in the order c,a,b.
      */
@@ -508,13 +564,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     }
 #elif defined(TARGET_MIPS)
     if (snan_bit_is_one(status)) {
-        /*
-         * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
-         * case sets InvalidOp and returns the default NaN
-         */
-        if (infzero) {
-            return 3;
-        }
         /* Prefer sNaN over qNaN, in the a, b, c order. */
         if (is_snan(a_cls)) {
             return 0;
@@ -530,10 +579,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
             return 2;
         }
     } else {
-        /*
-         * For MIPS systems that conform to IEEE754-2008, the (inf,zero,nan)
-         * case sets InvalidOp and returns the input value 'c'
-         */
         /* Prefer sNaN over qNaN, in the c, a, b order. */
         if (is_snan(c_cls)) {
             return 2;
@@ -550,11 +595,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         }
     }
 #elif defined(TARGET_LOONGARCH64)
-    /*
-     * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
-     * case sets InvalidOp and returns the input value 'c'
-     */
-
     /* Prefer sNaN over qNaN, in the c, a, b order. */
     if (is_snan(c_cls)) {
         return 2;
@@ -570,11 +610,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         return 1;
     }
 #elif defined(TARGET_PPC)
-    /* For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
-     * to return an input NaN if we have one (ie c) rather than generating
-     * a default NaN
-     */
-
     /* If fRA is a NaN return it; otherwise if fRB is a NaN return it;
      * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
      */
@@ -586,10 +621,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         return 1;
     }
 #elif defined(TARGET_S390X)
-    if (infzero) {
-        return 3;
-    }
-
     if (is_snan(a_cls)) {
         return 0;
     } else if (is_snan(b_cls)) {
-- 
2.34.1
