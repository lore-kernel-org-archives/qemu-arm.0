Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1085964njx;
        Fri, 25 Oct 2024 07:12:58 -0700 (PDT)
X-Received: by 2002:a05:6512:6c3:b0:533:46cc:a71e with SMTP id 2adb3069b0e04-53b23e9d2e4mr4155517e87.54.1729865577942;
        Fri, 25 Oct 2024 07:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865577; cv=none;
        d=google.com; s=arc-20240605;
        b=i8GxhhWp39rPbh4F7jSVNccc7TNYaMgNzBo8ZBYqW0hgGAxXpAuJBDGHytHaAGa6cP
         1emz3FsovuZZotqx3M9WaUrkYu2zU+Q5bGC242hF7g9yY+3fPJ0uk1i5Dc9rYJa/2U3L
         XZZP8cNjZnbgsBiSJnocp3MmXH5CetkXw0wP9H6lc9xaYAtXpZUYtpfBx2ptXbDer+8e
         8CVoK/b3Evf+Yy01Otl+WQD9GM75zDVsA+lrgbaesQZ5v1epUHZBfGMhN9v8gSL9HYMr
         0qkMZ1MxUblzlp4XxyEbsGgFXnQj5lyu0xfQija6pPIatKlRhgibyCKLKVZe98NEeFZ1
         6dSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=noOStqS92L5He4WhIYZl74MdTVJ5AKWtfARpcTTpidc=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=jFAOXIaJ2Q6xRTyZBGluwnTfV8mn9e3UN6AA2fE8Ae8aoVshY1Wr0Od8vRdQHggmLu
         53T9s1vNhXz5OFfa1XK1VGUDfe+KESPnYr92KUiY3svUOaeBi8foFoRqfmKMiFSBANsu
         SG5VTD7vDIgTDoi5OSIpAE62H99g1grQIpDNuKNw4whWorn6K5XjT8FUPlgA93crz89R
         XetM6nSQYBciA2yHYDnTnZtXyeSHF/ek6aCkc3KCjIav4gyJ3DtMY11Hes/ZxcVgrMts
         +drTkM5O3PQgWMgLZhrULBtFagpvcDhCY+EzKxFz3ZddWF1AkO1M4qEeulULv8t9x6a3
         XjKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gnmffg7a;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53b2e1bcb82sor359926e87.21.2024.10.25.07.12.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gnmffg7a;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865577; x=1730470377; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noOStqS92L5He4WhIYZl74MdTVJ5AKWtfARpcTTpidc=;
        b=Gnmffg7a4YvSS2J0P/nwvYlXiqbUNQZV0y9NVIX/MbzB0jbS9GR0nbmnvDTv0J7rp8
         cRq2ZUhe4oIKcVITlfVkOtYcryCXNQ8c/RETKm1giKeOOlyxrVcytihwRE+rWco5WFCD
         Jkqn1qOdltW+gUgFHXwAQv/z/UriZquoLUTq1NH5x4qG8W/6dmZXgXgs9mu6S8e9pYCr
         Ehy4VTKYK1KNwMGBvWK7sIHCw+Dfta+spZxwRU+SW6Ra4U/+VQJCwHcDJMD95UBHJpoX
         TABQc3frQoGzGzFBxM5an4c9F+XL00RvXf9m8S6Q9fy4OuD7IF44frd2BdYBGsWbl5GR
         Vx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865577; x=1730470377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noOStqS92L5He4WhIYZl74MdTVJ5AKWtfARpcTTpidc=;
        b=fvUVL5tyjSmumYJg4ccs2Ki3crV2jET6oMcwdP/6H8ZievkQBqnXVKVNbW44mD9vev
         2XpB9m7nT5jzf32BSwtVbRnwvw2ykCHDOs9I2WcSdTJ/uNGL3K4jga8VsF0qYFbM0Of8
         FBoYyFcwQQg4Xxr/Htk1qEV0EvRY9Caewmlu+txbiQKhgU8QJyiah/HY7XPSh9UNnfpp
         WzrSzuSWkqrt0Rp0zV4ViFl4IE9RuIsGY05LmpOGx9LHHtE87nLhYsp+GNB4sG7B31sM
         +q5RFeMG6LiU/X0pTuHP/xcewM2LqsjruAPhex7AboAyE7OrKFhKcOd5FzUgaauRnv/c
         cgVw==
X-Gm-Message-State: AOJu0YxjY01qIZ5564n/yBW7qC7LKV/pF2J47I5CdfMLQPg4ao5FFZEF
	RWP/BJXpC0LinFm+eTwl71qWmPFUgpMilePqvdhVJjyM8evZxMWHdS6LcR+guqmGkA==
X-Google-Smtp-Source: AGHT+IEeTDoH+lv09QPl3M7voGp1ePYFrgCHuZNvYkKI6PkEGUSkS+m2xyZ4/tfaTm+qUHXOaX/VXQ==
X-Received: by 2002:a05:6512:1048:b0:53b:1f90:576f with SMTP id 2adb3069b0e04-53b23dfcfb6mr3139601e87.22.1729865577170;
        Fri, 25 Oct 2024 07:12:57 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:12:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 01/21] softfloat: Allow 2-operand NaN propagation rule to be set at runtime
Date: Fri, 25 Oct 2024 15:12:34 +0100
Message-Id: <20241025141254.2141506-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JUu17ofGLiTE

IEEE 758 does not define a fixed rule for which NaN to pick as the
result if both operands of a 2-operand operation are NaNs.  As a
result different architectures have ended up with different rules for
propagating NaNs.

QEMU currently hardcodes the NaN propagation logic into the binary
because pickNaN() has an ifdef ladder for different targets.  We want
to make the propagation rule instead be selectable at runtime,
because:
 * this will let us have multiple targets in one QEMU binary
 * the Arm FEAT_AFP architectural feature includes letting
   the guest select a NaN propagation rule at runtime
 * x86 specifies different propagation rules for x87 FPU ops
   and for SSE ops, and specifying the rule in the float_status
   would let us emulate this, instead of wrongly using the
   x87 rules everywhere

In this commit we add an enum for the propagation rule, the field in
float_status, and the corresponding getters and setters.  We change
pickNaN to honour this, but because all targets still leave this
field at its default 0 value, the fallback logic will pick the rule
type with the old ifdef ladder.

It's valid not to set a propagation rule if default_nan_mode is
enabled, because in that case there's no need to pick a NaN; all the
callers of pickNaN() catch this case and skip calling it.  So we can
already assert that we don't get into the "no rule defined" codepath
for our four targets which always set default_nan_mode: Hexagon,
RiscV, SH4 and Tricore, and for the one target which does not have FP
at all: avr.  These targets will not need to be updated to call
set_float_2nan_prop_rule().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Reindent means a couple of slightly long lines in comments,
but those will move again in a later patch, so seemed clearer to
not re-wrap the comment and then re-rewrap it later.
---
 include/fpu/softfloat-helpers.h |  11 ++
 include/fpu/softfloat-types.h   |  42 ++++++
 fpu/softfloat-specialize.c.inc  | 229 ++++++++++++++++++--------------
 3 files changed, 185 insertions(+), 97 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 94cbe073ec5..453188de70b 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -75,6 +75,12 @@ static inline void set_floatx80_rounding_precision(FloatX80RoundPrec val,
     status->floatx80_rounding_precision = val;
 }
 
+static inline void set_float_2nan_prop_rule(Float2NaNPropRule rule,
+                                            float_status *status)
+{
+    status->float_2nan_prop_rule = rule;
+}
+
 static inline void set_flush_to_zero(bool val, float_status *status)
 {
     status->flush_to_zero = val;
@@ -126,6 +132,11 @@ get_floatx80_rounding_precision(float_status *status)
     return status->floatx80_rounding_precision;
 }
 
+static inline Float2NaNPropRule get_float_2nan_prop_rule(float_status *status)
+{
+    return status->float_2nan_prop_rule;
+}
+
 static inline bool get_flush_to_zero(float_status *status)
 {
     return status->flush_to_zero;
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 0884ec4ef7a..5cd5a0d0ae1 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -170,6 +170,47 @@ typedef enum __attribute__((__packed__)) {
     floatx80_precision_s,
 } FloatX80RoundPrec;
 
+/*
+ * 2-input NaN propagation rule. Individual architectures have
+ * different rules for which input NaN is propagated to the output
+ * when there is more than one NaN on the input.
+ *
+ * If default_nan_mode is enabled then it is valid not to set a
+ * NaN propagation rule, because the softfloat code guarantees
+ * not to try to pick a NaN to propagate in default NaN mode.
+ *
+ * For transition, currently the 'none' rule will cause us to
+ * fall back to picking the propagation rule based on the existing
+ * ifdef ladder. When all targets are converted it will be an error
+ * not to set the rule in float_status unless in default_nan_mode,
+ * and we will assert if we need to handle an input NaN and no
+ * rule was selected.
+ */
+typedef enum __attribute__((__packed__)) {
+    /* No propagation rule specified */
+    float_2nan_prop_none = 0,
+    /* Prefer SNaN over QNaN, then operand A over B */
+    float_2nan_prop_s_ab,
+    /* Prefer SNaN over QNaN, then operand B over A */
+    float_2nan_prop_s_ba,
+    /* Prefer A over B regardless of SNaN vs QNaN */
+    float_2nan_prop_ab,
+    /* Prefer B over A regardless of SNaN vs QNaN */
+    float_2nan_prop_ba,
+    /*
+     * This implements x87 NaN propagation rules:
+     * SNaN + QNaN => return the QNaN
+     * two SNaNs => return the one with the larger significand, silenced
+     * two QNaNs => return the one with the larger significand
+     * SNaN and a non-NaN => return the SNaN, silenced
+     * QNaN and a non-NaN => return the QNaN
+     *
+     * If we get down to comparing significands and they are the same,
+     * return the NaN with the positive sign bit (if any).
+     */
+    float_2nan_prop_x87,
+} Float2NaNPropRule;
+
 /*
  * Floating Point Status. Individual architectures may maintain
  * several versions of float_status for different functions. The
@@ -181,6 +222,7 @@ typedef struct float_status {
     uint16_t float_exception_flags;
     FloatRoundMode float_rounding_mode;
     FloatX80RoundPrec floatx80_rounding_precision;
+    Float2NaNPropRule float_2nan_prop_rule;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? */
     bool flush_to_zero;
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 4e279b9bc40..fae6794a152 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -390,118 +390,153 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
 static int pickNaN(FloatClass a_cls, FloatClass b_cls,
                    bool aIsLargerSignificand, float_status *status)
 {
-#if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
-    defined(TARGET_LOONGARCH64) || defined(TARGET_S390X)
-    /* ARM mandated NaN propagation rules (see FPProcessNaNs()), take
-     * the first of:
-     *  1. A if it is signaling
-     *  2. B if it is signaling
-     *  3. A (quiet)
-     *  4. B (quiet)
-     * A signaling NaN is always quietened before returning it.
-     */
-    /* According to MIPS specifications, if one of the two operands is
-     * a sNaN, a new qNaN has to be generated. This is done in
-     * floatXX_silence_nan(). For qNaN inputs the specifications
-     * says: "When possible, this QNaN result is one of the operand QNaN
-     * values." In practice it seems that most implementations choose
-     * the first operand if both operands are qNaN. In short this gives
-     * the following rules:
-     *  1. A if it is signaling
-     *  2. B if it is signaling
-     *  3. A (quiet)
-     *  4. B (quiet)
-     * A signaling NaN is always silenced before returning it.
-     */
-    if (is_snan(a_cls)) {
-        return 0;
-    } else if (is_snan(b_cls)) {
-        return 1;
-    } else if (is_qnan(a_cls)) {
-        return 0;
-    } else {
-        return 1;
-    }
-#elif defined(TARGET_PPC) || defined(TARGET_M68K)
-    /* PowerPC propagation rules:
-     *  1. A if it sNaN or qNaN
-     *  2. B if it sNaN or qNaN
-     * A signaling NaN is always silenced before returning it.
-     */
-    /* M68000 FAMILY PROGRAMMER'S REFERENCE MANUAL
-     * 3.4 FLOATING-POINT INSTRUCTION DETAILS
-     * If either operand, but not both operands, of an operation is a
-     * nonsignaling NaN, then that NaN is returned as the result. If both
-     * operands are nonsignaling NaNs, then the destination operand
-     * nonsignaling NaN is returned as the result.
-     * If either operand to an operation is a signaling NaN (SNaN), then the
-     * SNaN bit is set in the FPSR EXC byte. If the SNaN exception enable bit
-     * is set in the FPCR ENABLE byte, then the exception is taken and the
-     * destination is not modified. If the SNaN exception enable bit is not
-     * set, setting the SNaN bit in the operand to a one converts the SNaN to
-     * a nonsignaling NaN. The operation then continues as described in the
-     * preceding paragraph for nonsignaling NaNs.
-     */
-    if (is_nan(a_cls)) {
-        return 0;
-    } else {
-        return 1;
-    }
-#elif defined(TARGET_SPARC)
-    /* Prefer SNaN over QNaN, order B then A. */
-    if (is_snan(b_cls)) {
-        return 1;
-    } else if (is_snan(a_cls)) {
-        return 0;
-    } else if (is_qnan(b_cls)) {
-        return 1;
-    } else {
-        return 0;
-    }
-#elif defined(TARGET_XTENSA)
+    Float2NaNPropRule rule = status->float_2nan_prop_rule;
+
     /*
-     * Xtensa has two NaN propagation modes.
-     * Which one is active is controlled by float_status::use_first_nan.
+     * We guarantee not to require the target to tell us how to
+     * pick a NaN if we're always returning the default NaN.
      */
-    if (status->use_first_nan) {
+    assert(!status->default_nan_mode);
+
+    if (rule == float_2nan_prop_none) {
+        /* target didn't set the rule: fall back to old ifdef choices */
+#if defined(TARGET_AVR) || defined(TARGET_HEXAGON) \
+    || defined(TARGET_RISCV) || defined(TARGET_SH4) \
+    || defined(TARGET_TRICORE)
+        g_assert_not_reached();
+#elif defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA) || \
+    defined(TARGET_LOONGARCH64) || defined(TARGET_S390X)
+        /*
+         * ARM mandated NaN propagation rules (see FPProcessNaNs()), take
+         * the first of:
+         *  1. A if it is signaling
+         *  2. B if it is signaling
+         *  3. A (quiet)
+         *  4. B (quiet)
+         * A signaling NaN is always quietened before returning it.
+         */
+        /*
+         * According to MIPS specifications, if one of the two operands is
+         * a sNaN, a new qNaN has to be generated. This is done in
+         * floatXX_silence_nan(). For qNaN inputs the specifications
+         * says: "When possible, this QNaN result is one of the operand QNaN
+         * values." In practice it seems that most implementations choose
+         * the first operand if both operands are qNaN. In short this gives
+         * the following rules:
+         *  1. A if it is signaling
+         *  2. B if it is signaling
+         *  3. A (quiet)
+         *  4. B (quiet)
+         * A signaling NaN is always silenced before returning it.
+         */
+        rule = float_2nan_prop_s_ab;
+#elif defined(TARGET_PPC) || defined(TARGET_M68K)
+        /*
+         * PowerPC propagation rules:
+         *  1. A if it sNaN or qNaN
+         *  2. B if it sNaN or qNaN
+         * A signaling NaN is always silenced before returning it.
+         */
+        /*
+         * M68000 FAMILY PROGRAMMER'S REFERENCE MANUAL
+         * 3.4 FLOATING-POINT INSTRUCTION DETAILS
+         * If either operand, but not both operands, of an operation is a
+         * nonsignaling NaN, then that NaN is returned as the result. If both
+         * operands are nonsignaling NaNs, then the destination operand
+         * nonsignaling NaN is returned as the result.
+         * If either operand to an operation is a signaling NaN (SNaN), then the
+         * SNaN bit is set in the FPSR EXC byte. If the SNaN exception enable bit
+         * is set in the FPCR ENABLE byte, then the exception is taken and the
+         * destination is not modified. If the SNaN exception enable bit is not
+         * set, setting the SNaN bit in the operand to a one converts the SNaN to
+         * a nonsignaling NaN. The operation then continues as described in the
+         * preceding paragraph for nonsignaling NaNs.
+         */
+        rule = float_2nan_prop_ab;
+#elif defined(TARGET_SPARC)
+        /* Prefer SNaN over QNaN, order B then A. */
+        rule = float_2nan_prop_s_ba;
+#elif defined(TARGET_XTENSA)
+        /*
+         * Xtensa has two NaN propagation modes.
+         * Which one is active is controlled by float_status::use_first_nan.
+         */
+        if (status->use_first_nan) {
+            rule = float_2nan_prop_ab;
+        } else {
+            rule = float_2nan_prop_ba;
+        }
+#else
+        rule = float_2nan_prop_x87;
+#endif
+    }
+
+    switch (rule) {
+    case float_2nan_prop_s_ab:
+        if (is_snan(a_cls)) {
+            return 0;
+        } else if (is_snan(b_cls)) {
+            return 1;
+        } else if (is_qnan(a_cls)) {
+            return 0;
+        } else {
+            return 1;
+        }
+        break;
+    case float_2nan_prop_s_ba:
+        if (is_snan(b_cls)) {
+            return 1;
+        } else if (is_snan(a_cls)) {
+            return 0;
+        } else if (is_qnan(b_cls)) {
+            return 1;
+        } else {
+            return 0;
+        }
+        break;
+    case float_2nan_prop_ab:
         if (is_nan(a_cls)) {
             return 0;
         } else {
             return 1;
         }
-    } else {
+        break;
+    case float_2nan_prop_ba:
         if (is_nan(b_cls)) {
             return 1;
         } else {
             return 0;
         }
-    }
-#else
-    /* This implements x87 NaN propagation rules:
-     * SNaN + QNaN => return the QNaN
-     * two SNaNs => return the one with the larger significand, silenced
-     * two QNaNs => return the one with the larger significand
-     * SNaN and a non-NaN => return the SNaN, silenced
-     * QNaN and a non-NaN => return the QNaN
-     *
-     * If we get down to comparing significands and they are the same,
-     * return the NaN with the positive sign bit (if any).
-     */
-    if (is_snan(a_cls)) {
-        if (is_snan(b_cls)) {
-            return aIsLargerSignificand ? 0 : 1;
-        }
-        return is_qnan(b_cls) ? 1 : 0;
-    } else if (is_qnan(a_cls)) {
-        if (is_snan(b_cls) || !is_qnan(b_cls)) {
-            return 0;
+        break;
+    case float_2nan_prop_x87:
+        /*
+         * This implements x87 NaN propagation rules:
+         * SNaN + QNaN => return the QNaN
+         * two SNaNs => return the one with the larger significand, silenced
+         * two QNaNs => return the one with the larger significand
+         * SNaN and a non-NaN => return the SNaN, silenced
+         * QNaN and a non-NaN => return the QNaN
+         *
+         * If we get down to comparing significands and they are the same,
+         * return the NaN with the positive sign bit (if any).
+         */
+        if (is_snan(a_cls)) {
+            if (is_snan(b_cls)) {
+                return aIsLargerSignificand ? 0 : 1;
+            }
+            return is_qnan(b_cls) ? 1 : 0;
+        } else if (is_qnan(a_cls)) {
+            if (is_snan(b_cls) || !is_qnan(b_cls)) {
+                return 0;
+            } else {
+                return aIsLargerSignificand ? 0 : 1;
+            }
         } else {
-            return aIsLargerSignificand ? 0 : 1;
+            return 1;
         }
-    } else {
-        return 1;
+    default:
+        g_assert_not_reached();
     }
-#endif
 }
 
 /*----------------------------------------------------------------------------
-- 
2.34.1
