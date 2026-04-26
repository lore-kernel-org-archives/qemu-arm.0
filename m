Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9B5FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:57:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpW-0007j1-0P; Sun, 26 Apr 2026 09:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzo9-0005uX-GC
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:07 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznv-0001S9-FB
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:50 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b25cf1b5f0so51283795ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211146; x=1777815946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnOhdCDKdTLE0gzKOWv8m2ElmA3lCf51L6yu2wpzeJk=;
 b=qTOazqVWZ+ea7obniPuOA/1jYGkwM47Zn3Vhjexk1z1qbgQrdmHRcRgJWtq+RzlQzZ
 B2rxJYaB/VGCJ3sepiUEvuarEdpsxYi5xEIW2QwqgIaFVL2+tak9nydDsqGX1Hs0DY6l
 g0kFCLrDAQmnJ6MnlTOF9saSJsuBXO4GBpxslY1+r8Hxl/d4irvoLZTU3UycO5ztVioy
 KR6iEcl1Du54UDFm6JwB9pujLdW99GvxdqNba4pm9t5ElnT/jCW6gYSl78EFA4riUiyK
 VlVvwXPXRL9oM8oo7pwMWIHX0VzLhi0awujVbl1+VV1S8sgCrDYMZ3Jsjnq0wU2IwRpv
 H6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211146; x=1777815946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FnOhdCDKdTLE0gzKOWv8m2ElmA3lCf51L6yu2wpzeJk=;
 b=p4U4PAIaS+fn02enXvCDFEAYQo5bv0MFcHTwV2//PGpeBOr7iuHhhqECMbSLqAUswJ
 fuU+mJ8Dx0c1yVB52GCroyGlTyS4et6IjSRihdtM6/YNpC+YraWKfUVewGmTv39ikb/y
 SO9fmSWUbM4BpPqkuI/YGIVnLvMgT4UFE9ZWRefWnllAKf9U2Zs7Qm4jkUBJvf7KVz1k
 szTCatHJQSOMaF5nn1LC8mfuH2t9B7VQHW1/DXMgpwmwlJAN0rssoP68TrrA6/E56JWT
 eS+PIZqY+IUUVsKuDrwuBXKLxsehWlrpX+wC/QFKQf75JEnqscoIvKDuE36pdAgoo2P8
 o1AQ==
X-Gm-Message-State: AOJu0YwQRLT6or4GLjlp2Z7K/l7mYZ5dQGERyszBD8Pxk9xjXMOWh2Bk
 kLNA/s0ZoqNX4x3BGk0F6hpFKCpkZ3Fd+0OFfSrC3YAoNg2sbfZuA+6ClhojsVporGI=
X-Gm-Gg: AeBDievqFOfZ8IWxXh2N4ogf4WGvAb7N/2Eh+JJQCDJOaisxOMo27uqty+SOl2cd7YC
 lU+bg6MyNgQF6fzcSGQRWUEqjWBLuYp/yJwxaHb5UhtvNwa/t7JpS5lVn5OZb3OYrDNjlS5DpdR
 mK2kkvCldXsQgF5VAZ0YKjpu7b+IaOumjzsZ3fhjNYQ1l5CaKDoTCE7woQ+O/0Z7jWakdBW6kfX
 v8cbXSon7LwigOC+HKNYvcFtiUKZocriBMvUPkNovK1hAtAlGw4OQfbLRRtcIZ1rPqi/TfmQO0E
 aqltB3jJ2Fm3xTAbkXA+yaiRGo/ZsaWokNF8gjcXnrOmF0GtAkkbWDAz2z/g1LSM/zkwQTfd/st
 VghEBbsOyR1qFjDDpzZz9BCVOMYZBWrG3zyN8H6h9ebri9s/AEYwAQ5avGFPPv5l8hCuaVfbbgU
 ufMpfzy3b/wi6W6U5W+gqHRy+RmbAyvsDMGiIPi9g2
X-Received: by 2002:a17:903:487:b0:2b2:49a7:a5bc with SMTP id
 d9443c01a7336-2b5f9f534e4mr297029925ad.39.1777211145647; 
 Sun, 26 Apr 2026 06:45:45 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 57/84] fpu: Split FloatParts{64,128} to softfloat-parts.h
Date: Sun, 26 Apr 2026 23:39:34 +1000
Message-ID: <20260426134002.865628-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Begin exposing the intermediate representation of softfloat.
Start with just the representation structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-parts.h | 88 +++++++++++++++++++++++++++++++++++
 fpu/softfloat.c               | 69 +--------------------------
 2 files changed, 90 insertions(+), 67 deletions(-)
 create mode 100644 include/fpu/softfloat-parts.h

diff --git a/include/fpu/softfloat-parts.h b/include/fpu/softfloat-parts.h
new file mode 100644
index 0000000000..13c1f3d2d6
--- /dev/null
+++ b/include/fpu/softfloat-parts.h
@@ -0,0 +1,88 @@
+/*
+ * Floating point intermediate representation
+ *
+ * The code in this source file is derived from release 2a of the SoftFloat
+ * IEC/IEEE Floating-point Arithmetic Package. Those parts of the code (and
+ * some later contributions) are provided under that license, as detailed below.
+ * It has subsequently been modified by contributors to the QEMU Project,
+ * so some portions are provided under:
+ *  the SoftFloat-2a license
+ *  the BSD license
+ *  GPL-v2-or-later
+ *
+ * Any future contributions to this file after December 1st 2014 will be
+ * taken to be licensed under the Softfloat-2a license unless specifically
+ * indicated otherwise.
+ */
+
+#ifndef SOFTFLOAT_PARTS_H
+#define SOFTFLOAT_PARTS_H
+
+/*
+ * Classify a floating point number. Everything above float_class_qnan
+ * is a NaN so cls >= float_class_qnan is any NaN.
+ *
+ * Note that we canonicalize denormals, so most code should treat
+ * class_normal and class_denormal identically.
+ */
+
+typedef enum __attribute__ ((__packed__)) {
+    float_class_unclassified,
+    float_class_zero,
+    float_class_normal,
+    float_class_denormal, /* input was a non-squashed denormal */
+    float_class_inf,
+    float_class_qnan,  /* all NaNs from here */
+    float_class_snan,
+} FloatClass;
+
+#define float_cmask(bit)  (1u << (bit))
+
+enum {
+    float_cmask_zero    = float_cmask(float_class_zero),
+    float_cmask_normal  = float_cmask(float_class_normal),
+    float_cmask_denormal = float_cmask(float_class_denormal),
+    float_cmask_inf     = float_cmask(float_class_inf),
+    float_cmask_qnan    = float_cmask(float_class_qnan),
+    float_cmask_snan    = float_cmask(float_class_snan),
+
+    float_cmask_infzero = float_cmask_zero | float_cmask_inf,
+    float_cmask_anynan  = float_cmask_qnan | float_cmask_snan,
+    float_cmask_anynorm = float_cmask_normal | float_cmask_denormal,
+};
+
+/*
+ * Structure holding all of the decomposed parts of a float.
+ * The exponent is unbiased and the fraction is normalized.
+ *
+ * The fraction words are stored in big-endian word ordering,
+ * so that truncation from a larger format to a smaller format
+ * can be done simply by ignoring subsequent elements.
+ */
+
+typedef struct {
+    FloatClass cls;
+    bool sign;
+    int32_t exp;
+    union {
+        /* Routines that know the structure may reference the singular name. */
+        uint64_t frac;
+        /*
+         * Routines expanded with multiple structures reference "hi" and "lo"
+         * depending on the operation.  In FloatParts64, "hi" and "lo" are
+         * both the same word and aliased here.
+         */
+        uint64_t frac_hi;
+        uint64_t frac_lo;
+    };
+} FloatParts64;
+
+typedef struct {
+    FloatClass cls;
+    bool sign;
+    int32_t exp;
+    uint64_t frac_hi;
+    uint64_t frac_lo;
+} FloatParts128;
+
+#endif
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 8c4263bfe6..cd75df3160 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -83,6 +83,7 @@ this code that are retained.
 #include <math.h>
 #include "qemu/bitops.h"
 #include "fpu/softfloat.h"
+#include "fpu/softfloat-parts.h"
 
 /* We only need stdlib for abort() */
 
@@ -396,39 +397,6 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
     return soft(ua.s, ub.s, s);
 }
 
-/*
- * Classify a floating point number. Everything above float_class_qnan
- * is a NaN so cls >= float_class_qnan is any NaN.
- *
- * Note that we canonicalize denormals, so most code should treat
- * class_normal and class_denormal identically.
- */
-
-typedef enum __attribute__ ((__packed__)) {
-    float_class_unclassified,
-    float_class_zero,
-    float_class_normal,
-    float_class_denormal, /* input was a non-squashed denormal */
-    float_class_inf,
-    float_class_qnan,  /* all NaNs from here */
-    float_class_snan,
-} FloatClass;
-
-#define float_cmask(bit)  (1u << (bit))
-
-enum {
-    float_cmask_zero    = float_cmask(float_class_zero),
-    float_cmask_normal  = float_cmask(float_class_normal),
-    float_cmask_denormal = float_cmask(float_class_denormal),
-    float_cmask_inf     = float_cmask(float_class_inf),
-    float_cmask_qnan    = float_cmask(float_class_qnan),
-    float_cmask_snan    = float_cmask(float_class_snan),
-
-    float_cmask_infzero = float_cmask_zero | float_cmask_inf,
-    float_cmask_anynan  = float_cmask_qnan | float_cmask_snan,
-    float_cmask_anynorm = float_cmask_normal | float_cmask_denormal,
-};
-
 /* Flags for parts_minmax. */
 enum {
     /* Set for minimum; clear for maximum. */
@@ -474,40 +442,7 @@ static inline bool is_anynorm(FloatClass c)
     return float_cmask(c) & float_cmask_anynorm;
 }
 
-/*
- * Structure holding all of the decomposed parts of a float.
- * The exponent is unbiased and the fraction is normalized.
- *
- * The fraction words are stored in big-endian word ordering,
- * so that truncation from a larger format to a smaller format
- * can be done simply by ignoring subsequent elements.
- */
-
-typedef struct {
-    FloatClass cls;
-    bool sign;
-    int32_t exp;
-    union {
-        /* Routines that know the structure may reference the singular name. */
-        uint64_t frac;
-        /*
-         * Routines expanded with multiple structures reference "hi" and "lo"
-         * depending on the operation.  In FloatParts64, "hi" and "lo" are
-         * both the same word and aliased here.
-         */
-        uint64_t frac_hi;
-        uint64_t frac_lo;
-    };
-} FloatParts64;
-
-typedef struct {
-    FloatClass cls;
-    bool sign;
-    int32_t exp;
-    uint64_t frac_hi;
-    uint64_t frac_lo;
-} FloatParts128;
-
+/* FloatParts256 is entirely internal, for parts128_mul* */
 typedef struct {
     FloatClass cls;
     bool sign;
-- 
2.43.0


