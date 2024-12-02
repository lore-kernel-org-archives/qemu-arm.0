Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801918njk;
        Mon, 2 Dec 2024 05:14:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCzmzDpds2khgMRQ9iMRt1y5xKdIm7mVoOh/Owdx+5uYFR0o92J3sbJKTjTJQtPr7mpOX+Jw8Vewqz9w==@linaro.org
X-Received: by 2002:a05:6000:2b02:b0:385:e2c4:1f8d with SMTP id ffacd0b85a97d-385e2c4211fmr5204461f8f.19.1733145255629;
        Mon, 02 Dec 2024 05:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145255; cv=none;
        d=google.com; s=arc-20240605;
        b=Me7z90wyvTmkBAGNhxPT/c++Hqq0wuaKTGHkC/AK6beogSVqGYpUUALhqdFKiZLEpG
         g1HrX+OMDaLKRtCpAn0UB7IQtoSnMF502lzH8411vQtkAsYYCT4HN01DNSUGCDLM65p+
         YSzxLL77NMMVoJOxgIYBEAyvVn6t+R714J7cpCo+vTMueukXrfPT0gZZqZEPVy5hFqL8
         Xde7rBWGOsKZYIzDo9OZa/ZczkyoXdFW9k5jRiAAq/rv2qNDe5oAYl8H1SqkcEHL6lsG
         GKK+0zma7XNd15B5qgdBenT88uCmtyB8g9yFpnqONYBqxtW+cAN9rv4E2NRSRPwzLKJ9
         N+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z7XmwuWfuj/+3cn8NxGnH6Ft8d9tN3X6vv1sP/vbV6k=;
        fh=DTvf0F5OmoQIbh9qhZ9giT4uHUmIEc9nhjwZVGFETao=;
        b=Nk4/jGaJIK/87H3IA5yLaDVUtrU65eU1YxGP0gBkTnx16TQNw12IMcBf6pGaAh86ME
         GmIndrSe60C+FAvrCTs/zhmMWeZxBSEpD1t/ftvp/EIldCJs7Yo6KDsRC6a58gdf0daV
         ZVA1dG8Y1DlMBHxpykOINN4NpI0P8INYawL60menrxtRHhegedmzyBD2N7KVIy89dF4p
         FOYb7JpmCt/pnkWzZpAvtqapwb85MYQ/oblKBqA/JZydRlNyQuKID2mH/c9VR0dz0FbR
         63u+d3+iypgyCBZXhDUSPenlPqxFkpo7JP93pVjwcmNvhWy2AX7vmuQPGhYbdrhfneKZ
         AEXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0JW3iH4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a0764sor31299325e9.10.2024.12.02.05.14.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0JW3iH4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145255; x=1733750055; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7XmwuWfuj/+3cn8NxGnH6Ft8d9tN3X6vv1sP/vbV6k=;
        b=r0JW3iH4YTQ3GQx5N8bcE1WxSwwLHY4tRG2a6RRAOBC478YILIX//NjYfzxogOydG/
         Wq7rgYLJIAJg8gwrSVf9XFNO7Fb1JoVH5wnwZOBIWQvv8smCBEduat2JaAqlKFK7RRNF
         5JNgo9tRABrY+1Ppt5S73/BjPVcPBbR8YJMP+FWcvoFX5Uw3zQPSd9M6sE9OIv9G0Z0I
         e4Lj79+pAs4dwK3XYNQ55EkAJyS3nCrGZHHG9Gnxin7qw5LDudAl+FNBLACBy4xtIRY+
         AZQ78FY1IRgwCNmItOCTqnzRLfjrOpXDMQrbFVsD87RfYUWr3kMSeX5uiQ3EJgJAjGk9
         kh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145255; x=1733750055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7XmwuWfuj/+3cn8NxGnH6Ft8d9tN3X6vv1sP/vbV6k=;
        b=wmW42Q4w2UBb2cJXHXjJrxCg+As7G2jBGdAOXUoLUfv0XOl4wDLqJ2wxNAfsp6vTab
         N49XocRCS109mBzWxIgAmcpapAMezKv8HPmD/BKw8Yo7JFMkXmhQfisZa/fp5iQg2ALD
         0BYzdMmtkHKMSBg/oeDT9n1AgRqJWIaGAnep7SjgMZoAYnOyDNFMF6LlZWxCX/EvZ33i
         MoV96CQlVNgQdA6q82tjwXETaoJMByRlCJ11tNQN4XfQVGxotZ95m5ulPgUZfJwriv2r
         TdcCy5osqCI3kKvskclyJ0Ns9HAxnLFLcbocP6ZQWeNA44HGy6iRlSfbTXS/hRX9Qo6I
         w4RA==
X-Forwarded-Encrypted: i=1; AJvYcCUVz9A1BIOVVO9fDAiL0CxGgLeXUhm8nepfLA7rkFMwqFCgdYOR/6vChHa29TDYhkBtAIKa+PxXyNbtrw==@linaro.org
X-Gm-Message-State: AOJu0YxE9gQYiP+4rtOPZpK9kri9sZrk5P7Wv6GU1J9Zt9ZvwgNUJ/Bx
	UzOWSCzn1sUiONVgx/H1AEtFmmK8aygooQg0VB0Wh5TZA7U607vl/val6icYuNL8zg==
X-Gm-Gg: ASbGncvCkKK1wNWoz9BvsiqfrpygfSmbQ9ej7Aw46ITH8KIDLlyCr9SjHOkjTTbaMjQ
	jyNYzkckT1p+OtOLXagK+4IIThmInG5yG3C93rvWJ9X8bxg+se6+GdSohy9CnObUXyAkNwFDqOP
	aXf9a+Xo4dkG+BXDQs7CVStNCuM7oTh5LSMTXn2v58gIdA79GzctBIjwqHcnrFzZdEETkJuRkic
	w/Wrk42wJcsJEMyh3CxV1korwSwlNecNOOpieF+XcR315HCf2Co5dM=
X-Google-Smtp-Source: AGHT+IHuCgYLAC+G8pAY6KaNZRqdT6XuEHXiSzxTCFZDbws5goSdNGlJHHv/ugbET65/ZZ6ADDjoPA==
X-Received: by 2002:a05:6000:210f:b0:385:ee59:44eb with SMTP id ffacd0b85a97d-385ee5946d0mr4043467f8f.33.1733145254552;
        Mon, 02 Dec 2024 05:14:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:14 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 15/54] softfloat: Allow runtime choice of NaN propagation for muladd
Date: Mon,  2 Dec 2024 13:13:08 +0000
Message-Id: <20241202131347.498124-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WWQGWKCrFxrX

IEEE 758 does not define a fixed rule for which NaN to pick as the
result if both operands of a 3-operand fused multiply-add operation
are NaNs.  As a result different architectures have ended up with
different rules for propagating NaNs.

QEMU currently hardcodes the NaN propagation logic into the binary
because pickNaNMulAdd() has an ifdef ladder for different targets.
We want to make the propagation rule instead be selectable at
runtime, because:
 * this will let us have multiple targets in one QEMU binary
 * the Arm FEAT_AFP architectural feature includes letting
   the guest select a NaN propagation rule at runtime

In this commit we add an enum for the propagation rule, the field in
float_status, and the corresponding getters and setters.  We change
pickNaNMulAdd to honour this, but because all targets still leave
this field at its default 0 value, the fallback logic will pick the
rule type with the old ifdef ladder.

It's valid not to set a propagation rule if default_nan_mode is
enabled, because in that case there's no need to pick a NaN; all the
callers of pickNaNMulAdd() catch this case and skip calling it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat-helpers.h |  11 +++
 include/fpu/softfloat-types.h   |  55 +++++++++++
 fpu/softfloat-specialize.c.inc  | 167 ++++++++------------------------
 3 files changed, 107 insertions(+), 126 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 0bf44dc6087..cf06b4e16bf 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -81,6 +81,12 @@ static inline void set_float_2nan_prop_rule(Float2NaNPropRule rule,
     status->float_2nan_prop_rule = rule;
 }
 
+static inline void set_float_3nan_prop_rule(Float3NaNPropRule rule,
+                                            float_status *status)
+{
+    status->float_3nan_prop_rule = rule;
+}
+
 static inline void set_float_infzeronan_rule(FloatInfZeroNaNRule rule,
                                              float_status *status)
 {
@@ -143,6 +149,11 @@ static inline Float2NaNPropRule get_float_2nan_prop_rule(float_status *status)
     return status->float_2nan_prop_rule;
 }
 
+static inline Float3NaNPropRule get_float_3nan_prop_rule(float_status *status)
+{
+    return status->float_3nan_prop_rule;
+}
+
 static inline FloatInfZeroNaNRule get_float_infzeronan_rule(float_status *status)
 {
     return status->float_infzeronan_rule;
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 47bb22c4e25..d9f0797edaf 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -80,6 +80,8 @@ this code that are retained.
 #ifndef SOFTFLOAT_TYPES_H
 #define SOFTFLOAT_TYPES_H
 
+#include "hw/registerfields.h"
+
 /*
  * Software IEC/IEEE floating-point types.
  */
@@ -207,6 +209,58 @@ typedef enum __attribute__((__packed__)) {
     float_2nan_prop_x87,
 } Float2NaNPropRule;
 
+/*
+ * 3-input NaN propagation rule, for fused multiply-add. Individual
+ * architectures have different rules for which input NaN is
+ * propagated to the output when there is more than one NaN on the
+ * input.
+ *
+ * If default_nan_mode is enabled then it is valid not to set a NaN
+ * propagation rule, because the softfloat code guarantees not to try
+ * to pick a NaN to propagate in default NaN mode.  When not in
+ * default-NaN mode, it is an error for the target not to set the rule
+ * in float_status if it uses a muladd, and we will assert if we need
+ * to handle an input NaN and no rule was selected.
+ *
+ * The naming scheme for Float3NaNPropRule values is:
+ *  float_3nan_prop_s_abc:
+ *    = "Prefer SNaN over QNaN, then operand A over B over C"
+ *  float_3nan_prop_abc:
+ *    = "Prefer A over B over C regardless of SNaN vs QNAN"
+ *
+ * For QEMU, the multiply-add operation is A * B + C.
+ */
+
+/*
+ * We set the Float3NaNPropRule enum values up so we can select the
+ * right value in pickNaNMulAdd in a data driven way.
+ */
+FIELD(3NAN, 1ST, 0, 2)   /* which operand is most preferred ? */
+FIELD(3NAN, 2ND, 2, 2)   /* which operand is next most preferred ? */
+FIELD(3NAN, 3RD, 4, 2)   /* which operand is least preferred ? */
+FIELD(3NAN, SNAN, 6, 1)  /* do we prefer SNaN over QNaN ? */
+
+#define PROPRULE(X, Y, Z) \
+    ((X << R_3NAN_1ST_SHIFT) | (Y << R_3NAN_2ND_SHIFT) | (Z << R_3NAN_3RD_SHIFT))
+
+typedef enum __attribute__((__packed__)) {
+    float_3nan_prop_none = 0,     /* No propagation rule specified */
+    float_3nan_prop_abc = PROPRULE(0, 1, 2),
+    float_3nan_prop_acb = PROPRULE(0, 2, 1),
+    float_3nan_prop_bac = PROPRULE(1, 0, 2),
+    float_3nan_prop_bca = PROPRULE(1, 2, 0),
+    float_3nan_prop_cab = PROPRULE(2, 0, 1),
+    float_3nan_prop_cba = PROPRULE(2, 1, 0),
+    float_3nan_prop_s_abc = float_3nan_prop_abc | R_3NAN_SNAN_MASK,
+    float_3nan_prop_s_acb = float_3nan_prop_acb | R_3NAN_SNAN_MASK,
+    float_3nan_prop_s_bac = float_3nan_prop_bac | R_3NAN_SNAN_MASK,
+    float_3nan_prop_s_bca = float_3nan_prop_bca | R_3NAN_SNAN_MASK,
+    float_3nan_prop_s_cab = float_3nan_prop_cab | R_3NAN_SNAN_MASK,
+    float_3nan_prop_s_cba = float_3nan_prop_cba | R_3NAN_SNAN_MASK,
+} Float3NaNPropRule;
+
+#undef PROPRULE
+
 /*
  * Rule for result of fused multiply-add 0 * Inf + NaN.
  * This must be a NaN, but implementations differ on whether this
@@ -241,6 +295,7 @@ typedef struct float_status {
     FloatRoundMode float_rounding_mode;
     FloatX80RoundPrec floatx80_rounding_precision;
     Float2NaNPropRule float_2nan_prop_rule;
+    Float3NaNPropRule float_3nan_prop_rule;
     FloatInfZeroNaNRule float_infzeronan_rule;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? */
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index a769c71f545..b4f3f0efa82 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -475,6 +475,10 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
                          bool infzero, bool have_snan, float_status *status)
 {
+    FloatClass cls[3] = { a_cls, b_cls, c_cls };
+    Float3NaNPropRule rule = status->float_3nan_prop_rule;
+    int which;
+
     /*
      * We guarantee not to require the target to tell us how to
      * pick a NaN if we're always returning the default NaN.
@@ -500,145 +504,56 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         }
     }
 
+    if (rule == float_3nan_prop_none) {
 #if defined(TARGET_ARM)
-
-    /* This looks different from the ARM ARM pseudocode, because the ARM ARM
-     * puts the operands to a fused mac operation (a*b)+c in the order c,a,b.
-     */
-    if (is_snan(c_cls)) {
-        return 2;
-    } else if (is_snan(a_cls)) {
-        return 0;
-    } else if (is_snan(b_cls)) {
-        return 1;
-    } else if (is_qnan(c_cls)) {
-        return 2;
-    } else if (is_qnan(a_cls)) {
-        return 0;
-    } else {
-        return 1;
-    }
+        /*
+         * This looks different from the ARM ARM pseudocode, because the ARM ARM
+         * puts the operands to a fused mac operation (a*b)+c in the order c,a,b
+         */
+        rule = float_3nan_prop_s_cab;
 #elif defined(TARGET_MIPS)
-    if (snan_bit_is_one(status)) {
-        /* Prefer sNaN over qNaN, in the a, b, c order. */
-        if (is_snan(a_cls)) {
-            return 0;
-        } else if (is_snan(b_cls)) {
-            return 1;
-        } else if (is_snan(c_cls)) {
-            return 2;
-        } else if (is_qnan(a_cls)) {
-            return 0;
-        } else if (is_qnan(b_cls)) {
-            return 1;
+        if (snan_bit_is_one(status)) {
+            rule = float_3nan_prop_s_abc;
         } else {
-            return 2;
+            rule = float_3nan_prop_s_cab;
         }
-    } else {
-        /* Prefer sNaN over qNaN, in the c, a, b order. */
-        if (is_snan(c_cls)) {
-            return 2;
-        } else if (is_snan(a_cls)) {
-            return 0;
-        } else if (is_snan(b_cls)) {
-            return 1;
-        } else if (is_qnan(c_cls)) {
-            return 2;
-        } else if (is_qnan(a_cls)) {
-            return 0;
-        } else {
-            return 1;
-        }
-    }
 #elif defined(TARGET_LOONGARCH64)
-    /* Prefer sNaN over qNaN, in the c, a, b order. */
-    if (is_snan(c_cls)) {
-        return 2;
-    } else if (is_snan(a_cls)) {
-        return 0;
-    } else if (is_snan(b_cls)) {
-        return 1;
-    } else if (is_qnan(c_cls)) {
-        return 2;
-    } else if (is_qnan(a_cls)) {
-        return 0;
-    } else {
-        return 1;
-    }
+        rule = float_3nan_prop_s_cab;
 #elif defined(TARGET_PPC)
-    /* If fRA is a NaN return it; otherwise if fRB is a NaN return it;
-     * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
-     */
-    if (is_nan(a_cls)) {
-        return 0;
-    } else if (is_nan(c_cls)) {
-        return 2;
-    } else {
-        return 1;
-    }
+        /*
+         * If fRA is a NaN return it; otherwise if fRB is a NaN return it;
+         * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
+         */
+        rule = float_3nan_prop_acb;
 #elif defined(TARGET_S390X)
-    if (is_snan(a_cls)) {
-        return 0;
-    } else if (is_snan(b_cls)) {
-        return 1;
-    } else if (is_snan(c_cls)) {
-        return 2;
-    } else if (is_qnan(a_cls)) {
-        return 0;
-    } else if (is_qnan(b_cls)) {
-        return 1;
-    } else {
-        return 2;
-    }
+        rule = float_3nan_prop_s_abc;
 #elif defined(TARGET_SPARC)
-    /* Prefer SNaN over QNaN, order C, B, A. */
-    if (is_snan(c_cls)) {
-        return 2;
-    } else if (is_snan(b_cls)) {
-        return 1;
-    } else if (is_snan(a_cls)) {
-        return 0;
-    } else if (is_qnan(c_cls)) {
-        return 2;
-    } else if (is_qnan(b_cls)) {
-        return 1;
-    } else {
-        return 0;
-    }
+        rule = float_3nan_prop_s_cba;
 #elif defined(TARGET_XTENSA)
-    /*
-     * For Xtensa, the (inf,zero,nan) case sets InvalidOp and returns
-     * an input NaN if we have one (ie c).
-     */
-    if (status->use_first_nan) {
-        if (is_nan(a_cls)) {
-            return 0;
-        } else if (is_nan(b_cls)) {
-            return 1;
+        if (status->use_first_nan) {
+            rule = float_3nan_prop_abc;
         } else {
-            return 2;
+            rule = float_3nan_prop_cba;
         }
-    } else {
-        if (is_nan(c_cls)) {
-            return 2;
-        } else if (is_nan(b_cls)) {
-            return 1;
-        } else {
-            return 0;
-        }
-    }
 #else
-    /* A default implementation: prefer a to b to c.
-     * This is unlikely to actually match any real implementation.
-     */
-    if (is_nan(a_cls)) {
-        return 0;
-    } else if (is_nan(b_cls)) {
-        return 1;
-    } else {
-        return 2;
-    }
+        rule = float_3nan_prop_abc;
 #endif
+    }
+
+    assert(rule != float_3nan_prop_none);
+    if (have_snan && (rule & R_3NAN_SNAN_MASK)) {
+        /* We have at least one SNaN input and should prefer it */
+        do {
+            which = rule & R_3NAN_1ST_MASK;
+            rule >>= R_3NAN_1ST_LENGTH;
+        } while (!is_snan(cls[which]));
+    } else {
+        do {
+            which = rule & R_3NAN_1ST_MASK;
+            rule >>= R_3NAN_1ST_LENGTH;
+        } while (!is_nan(cls[which]));
+    }
+    return which;
 }
 
 /*----------------------------------------------------------------------------
-- 
2.34.1
