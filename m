Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413130njb;
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqOhgldCChHkKqDOKJeaOuYziFKW43XQy7GvZTFqeGua5dr3BYVOLttFJLL9jgC5UxuoNUngXqIMCLjg==@linaro.org
X-Received: by 2002:a5d:64ab:0:b0:385:d525:c8f5 with SMTP id ffacd0b85a97d-385d525cc07mr343338f8f.7.1732790606149;
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790606; cv=none;
        d=google.com; s=arc-20240605;
        b=jhOIfK5y+gOrq0G/35r2cfI5rcr69mIK36HeUxSq5Pd6qQNys02TXNEPMX33EcHchp
         RIdpk+ZyyhKrbJiORuWYqtiZbedawBImF47qv/umPJ1vMSsCvFSds+c4mVOvHNX0Kgnq
         iv+MwslK1FB4kdbSxmj6VYug6HFDGA3UuB9sOSNGivjSxAUWFtS20fazDjte04q/trt1
         NlY0NUzHosFNs3YuMWHO1Nz0LUtnfjJ34Hm9JNxoiZzMmtcoaSZNlr5FL4mWqrn9JaUv
         9GgaY+BCpZW2Evh3+WmhIJnoYumA+lqZE5vIuLnuKI+s5svcqUcm2d3VEgFOxUx5E1AN
         PmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BAfGDHXWne3fztjzcjDJwPhcKYYDiakCa5ET2Yl4WTw=;
        fh=AJdFG3Eqzzsy/vHxM7ukfYXiuZa71boJx44dedz/YtM=;
        b=bDjIVSWZwN/lLC3jiakzME7hge93GioNPpG1qTZ5ePb/aNgzhwgnOZExSRoSD5PMBG
         G7Yp67cQ5XBg3gm2WkB2kF1HkkreTiDCuVkcncrNuqWBgkSbGApZZQ5PFATMaOLfFw8e
         rFmsoIKlppAkLoOh3yYRDed+WP3L+dHb/C/+rGT4LIfKfsJjbsYcyK4m5+mM5kCM09AM
         BXPczcjBCBLIYi3OxkxNE3O5Aan/RzXZu8FVDKcHqgzcXXCJwW34ssn3+A/I1gEF/Vhp
         GRxr7/IBRWf1p3M1cAJK4qKCBUYREcrk8m3e1F3ti+Pn+4MKEZERskfbxcA+rgU3XNCz
         tR5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWR1r+Tg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd35fb3sor332592f8f.3.2024.11.28.02.43.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWR1r+Tg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790605; x=1733395405; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAfGDHXWne3fztjzcjDJwPhcKYYDiakCa5ET2Yl4WTw=;
        b=NWR1r+Tgz++WwATpFo8d/QldoqnnbDv54qdaUYgnVIbj0XFM6Brzkkxfc4ygVog1An
         hWvAtcgZsZBL9/36ATWWXOpozdrMJQP6Qxxt2UhG5LxnlZviYMQ8YIagBgsn6khYsPLq
         WoSwgLbpUwBKak1tI+eszGy46z29yjc3+TOLiTpY3bmCQE2Nhv5q3Ny0FtbaWr2T90LQ
         meD7K53KjWPZ2AKhJGK+K75pX4NiIUEBBQXDRY377fq032hosdkkllOYgJSbBexpm1D1
         hTZre7bABUc1UsaBjAmmdq/FxnuLa71oFTYDYBlOo6Yeg3gz/uomCxLog6RJiVgqBHdD
         1oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790605; x=1733395405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAfGDHXWne3fztjzcjDJwPhcKYYDiakCa5ET2Yl4WTw=;
        b=Fg25/jtAk4MF11XPtbPST0MJoa7Z4rATl7bSw7gKfk9O1QyLiAJaAjzvJ9/oJCHr49
         vtDExvyeW6CYwQltYhZkK9RPLoRrO3sEd934aKXOuzduxSIaw+PIsvCacncsgb8UpGzz
         0CmTV9A00dwjvcoVwA/EPYbCquE7cW91bteEydJRSMBcmmsd0tqyv1LlxnZJBkQqpUfJ
         nuE2phLTfaxyxoj2uQwRIr5tzrlHOMX7P/avgcV6AeKBK6kreRXQ1KxV2CDJqSP9GDcg
         RshC2NG6aO1/V8rKcGgWS4Ke/TBRn4HI2t0v0BwacoHb8tejLEsabf88zdUsApulI8r1
         jL5A==
X-Forwarded-Encrypted: i=1; AJvYcCUqs9bkj+yo5FhlUjSOn3gJcurGssOBuSd4NUFIrvFXOsI9+EBwCTKBpL75pmJDgEShuEQspbBjFieyxA==@linaro.org
X-Gm-Message-State: AOJu0YzwCG2Eucyqp+5Xx7hWj5B477c20wVAkuYezIcTKoKUzCuznRHW
	Li8jlibsG+xHGRAMJFrxkz8DUPnnPKvNH8Y0ajfLE5HWCsxbB2kLF7DL4WCfXGLB/Q==
X-Gm-Gg: ASbGnctZCfj0dRuYEAa6T8Ybzc1GpKCpSWCTqLoUcnVex+XMpY2IuC9zcDwv49Vljx3
	chJohWMaVvbk5mrqt2JxuHXvnR9UP/VajP30Egz3I/TvARKjNKZVeZ7oOila3KGCcN2mJnuSavN
	8IW7hefMoYgWm+6Z5bI6No0BCmSziFASe0TuvzdQ2NFh74SRgY9nSn8XxLxDjKRh+tGesUW/1DH
	BC4N/WAODq4d5G2w3hG0Nu6M+/Fi4XIgR61NhF4GBKE7icylwYNKqg=
X-Google-Smtp-Source: AGHT+IF9NBOcitC4nIP+QcER1/u30JABGG9B8fbDoXJRqPKqrPkYIpnhfRfjvnQEOI1z2Tf/I2u4sg==
X-Received: by 2002:a5d:6487:0:b0:382:5030:7b94 with SMTP id ffacd0b85a97d-385c6eb8f37mr4826560f8f.13.1732790605524;
        Thu, 28 Nov 2024 02:43:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:25 -0800 (PST)
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
Subject: [PATCH for-10.0 14/25] softfloat: Allow runtime choice of NaN propagation for muladd
Date: Thu, 28 Nov 2024 10:42:59 +0000
Message-Id: <20241128104310.3452934-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NPF+ubQ64YHL

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
 include/fpu/softfloat-types.h   |  37 ++++++++
 fpu/softfloat-specialize.c.inc  | 160 +++++++++++++-------------------
 3 files changed, 112 insertions(+), 96 deletions(-)

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
index 27a1c96754d..79220f8c67f 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -207,6 +207,42 @@ typedef enum __attribute__((__packed__)) {
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
+ * For QEMU, the multiply-add operation is A * B + C.
+ *
+ * NB: we don't list all 12 possibilities here or implement them
+ * in pickNaNMulAdd; if your architecture needs one of the missing
+ * combinations you should add it.
+ */
+typedef enum __attribute__((__packed__)) {
+    /* No propagation rule specified */
+    float_3nan_prop_none = 0,
+    /* Prefer SNaN over QNaN, then operand A over B over C */
+    float_3nan_prop_s_abc,
+    /* Prefer SNaN over QNaN, then operand C over A over B */
+    float_3nan_prop_s_cab,
+    /* Prefer SNaN over QNaN, then operand C over B over A */
+    float_3nan_prop_s_cba,
+    /* Prefer A over B over C regardless of SNaN vs QNaN */
+    float_3nan_prop_abc,
+    /* Prefer A over C over B regardless of SNaN vs QNaN */
+    float_3nan_prop_acb,
+    /* Prefer C over B over A regardless of SNaN vs QNaN */
+    float_3nan_prop_cba,
+} Float3NaNPropRule;
+
 /*
  * Rule for result of fused multiply-add 0 * Inf + NaN.
  * This must be a NaN, but implementations differ on whether this
@@ -241,6 +277,7 @@ typedef struct float_status {
     FloatRoundMode float_rounding_mode;
     FloatX80RoundPrec floatx80_rounding_precision;
     Float2NaNPropRule float_2nan_prop_rule;
+    Float3NaNPropRule float_3nan_prop_rule;
     FloatInfZeroNaNRule float_infzeronan_rule;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? */
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 3e4ec938b25..d7c0c90ea65 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -475,6 +475,7 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
                          bool infzero, float_status *status)
 {
+    Float3NaNPropRule rule = status->float_3nan_prop_rule;
     /*
      * We guarantee not to require the target to tell us how to
      * pick a NaN if we're always returning the default NaN.
@@ -500,27 +501,44 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
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
+        if (snan_bit_is_one(status)) {
+            rule = float_3nan_prop_s_abc;
+        } else {
+            rule = float_3nan_prop_s_cab;
+        }
+#elif defined(TARGET_LOONGARCH64)
+        rule = float_3nan_prop_s_cab;
+#elif defined(TARGET_PPC)
+        /*
+         * If fRA is a NaN return it; otherwise if fRB is a NaN return it;
+         * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
+         */
+        rule = float_3nan_prop_acb;
+#elif defined(TARGET_S390X)
+        rule = float_3nan_prop_s_abc;
+#elif defined(TARGET_SPARC)
+        rule = float_3nan_prop_s_cba;
+#elif defined(TARGET_XTENSA)
+        if (status->use_first_nan) {
+            rule = float_3nan_prop_abc;
+        } else {
+            rule = float_3nan_prop_cba;
+        }
+#else
+        rule = float_3nan_prop_abc;
+#endif
+    }
+
+    switch (rule) {
+    case float_3nan_prop_s_abc:
         if (is_snan(a_cls)) {
             return 0;
         } else if (is_snan(b_cls)) {
@@ -534,8 +552,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             return 2;
         }
-    } else {
-        /* Prefer sNaN over qNaN, in the c, a, b order. */
+    case float_3nan_prop_s_cab:
         if (is_snan(c_cls)) {
             return 2;
         } else if (is_snan(a_cls)) {
@@ -549,68 +566,21 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             return 1;
         }
-    }
-#elif defined(TARGET_LOONGARCH64)
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
-#elif defined(TARGET_PPC)
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
-#elif defined(TARGET_S390X)
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
-#elif defined(TARGET_SPARC)
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
-#elif defined(TARGET_XTENSA)
-    /*
-     * For Xtensa, the (inf,zero,nan) case sets InvalidOp and returns
-     * an input NaN if we have one (ie c).
-     */
-    if (status->use_first_nan) {
+    case float_3nan_prop_s_cba:
+        if (is_snan(c_cls)) {
+            return 2;
+        } else if (is_snan(b_cls)) {
+            return 1;
+        } else if (is_snan(a_cls)) {
+            return 0;
+        } else if (is_qnan(c_cls)) {
+            return 2;
+        } else if (is_qnan(b_cls)) {
+            return 1;
+        } else {
+            return 0;
+        }
+    case float_3nan_prop_abc:
         if (is_nan(a_cls)) {
             return 0;
         } else if (is_nan(b_cls)) {
@@ -618,7 +588,15 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             return 2;
         }
-    } else {
+    case float_3nan_prop_acb:
+        if (is_nan(a_cls)) {
+            return 0;
+        } else if (is_nan(c_cls)) {
+            return 2;
+        } else {
+            return 1;
+        }
+    case float_3nan_prop_cba:
         if (is_nan(c_cls)) {
             return 2;
         } else if (is_nan(b_cls)) {
@@ -626,19 +604,9 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             return 0;
         }
+    default:
+        g_assert_not_reached();
     }
-#else
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
-#endif
 }
 
 /*----------------------------------------------------------------------------
-- 
2.34.1
