Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3698723qtb;
        Wed, 2 Jul 2025 05:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNb0Lx4u0K0MuwZ+EeDapect4k/zH2svy1KF7OpxlquVMMkvSsi1/MrsnKknR47EGRy0KvJ4dGFlAEcA==@linaro.org
X-Google-Smtp-Source: AGHT+IESYaCTqJLoXCl1NXibIR+1fW/3tVinDtbbb7m2EYjz6jcfrVT9kCkrE6RP7ZH23glkNAO6
X-Received: by 2002:ac8:59c5:0:b0:4a3:e3df:f9d4 with SMTP id d75a77b69052e-4a97698958dmr41945391cf.26.1751459130211;
        Wed, 02 Jul 2025 05:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459130; cv=none;
        d=google.com; s=arc-20240605;
        b=b0ElQ74ehaJXCLHydKR3ZdwqqPwJ4Do/+Ap71CW3DwsHIktEq12NmmNoe8cZ7Xsd/o
         6oKpw40k485xG4T8OUnUHIjqyvYU7sycfhDulT1uVajvntGj8RzYqCsqDsgm9gJnzG8m
         H5TjDWghqJCesd+o/n7YCDrpqfGge42zIMRNycW6fRiQLcV2GrcgeWXYMl8vo2ZlAa0l
         Utpx+eaGQqKHUSPsl/Jbwflf3u4qr1amwmBafdUbQnc5JvGzEfCcl+YadMyP9EHhUdcD
         CDXVdTGcehAViDPASP9KOJt+ZJjp9DCMyUE/GQEmHkN+nwzJotTKqp8e90lGqRbMlPPz
         69Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tFSiC0+11dXo7FuOpfNgMNVi+oIVpV/+XgXfRFy8NQA=;
        fh=s400U+Tx6cQDhtn+2Oey97pyo8KpW6wmR0wxZgTa8vk=;
        b=hG3fj35rWbvx8mJrt050joCNEid8uSeVuR7DcvWp7IOV72JpZl9M88CTr6sZCPFaY1
         GzQUKYB94LERzaC+Pr45LHXgEzxxryAO5++fxroK4n4FYNrZO2Szt0BE717GHuYaeVpu
         0d2CxOSH3XyFYtE+pmq84RFl9ZOLEVihApBUCjIW7cj0NoweiH/Lz2Q/xZRlTZcgOgWh
         e4UqhQrhzwnaD1UcceUp5rMmGjYavoX78MDqfOvtSG10whEoRrWIIu398oOnNX1XHPZ0
         7PSSDo0wg6c++dcqtSbjxcXgAP12y2PeK/63RecXckGne5BoOvMbTln9quhKf5wyaPaj
         8eVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d93NKuar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc57a266si131839011cf.653.2025.07.02.05.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d93NKuar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwUb-00057B-DX; Wed, 02 Jul 2025 08:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwUI-00051N-E1
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:56 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwTw-0007FZ-KC
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:53 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2eaf96c7579so2837217fac.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751458947; x=1752063747; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFSiC0+11dXo7FuOpfNgMNVi+oIVpV/+XgXfRFy8NQA=;
 b=d93NKuarKN0RspXo1JmAiXszxTUGTMwrrnUVKbZhxRiCrOEpqSu8yIgOj2vGFrBuoP
 puur3uBnuj12+RtzQAHbNssRUsImzKxK3XH8T1HLOMsP9esyL8O+VmJIQOQdIE+efzY0
 HjyWdUEqaImSuMnfuWEDG8hE99XUXbXpCFgwLbjt1/dlUQddlcZL9FMiMzJv8zLC1UWN
 z5xAz4+VTWs+bAXYgQ1XciXHIS1ujHfFcunxpv1JdriaRMcY84cOFa2Dzt0QEpSNwinK
 r5rToMhH10xQKMvT53nei8GjFEmjujh1o5Mex+53arK4yFyh+1w/+eskZ/3ojhh2f3+e
 KwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751458947; x=1752063747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tFSiC0+11dXo7FuOpfNgMNVi+oIVpV/+XgXfRFy8NQA=;
 b=PPXF10jC0FdjcAnF2bQjeJqUiNyxtBUIy8uTdcm6P3VLF5eDxdZVrNYew+Hj6TrSwa
 j7fWceOVzFh3ZE+SXyLdQYN8qEOfpFVl0lr0jmF2nXWYE3QFuH0iGLGTQXH7hYpAVQu7
 X6GJExBqCh0EwjmeCam0ZdQJUIGWBQizLlJXrbFweGaQADjj0dcD/zTtzZ/I4XcvQg9L
 mC2WfxTqRPwzsXY16VLnc8Gk+GEoeIYy/I2RXXpV0i8oaxWJWguDJ1KBuiRcCNhgDjGE
 2LCIpqayGL2NQC03qYQB1eX87R9I837Y6L6ez+xSJAdD0pfh1JNKjnOZ0L4FtWRTSYqn
 SmHA==
X-Gm-Message-State: AOJu0YwFoGKqurDSXGIFbMhx/b3ac902tJFTsbmXcVgux4ArjM4eHl+U
 bcrLTJTQ7FgAFrpup4OyMQrZnl9kH856yAGmS+OCOSlfZ6++0tNjEW2Iu5nG6o3S/34=
X-Gm-Gg: ASbGncvML0rO5zVmZhGf4W4BHjBStI3RM5lEyEbrsZzd3mUj0sr7YVIcDL72mdrtupk
 sToWACQbFkFGq/XKrCUhPfc3mhNhKXs7RJ/abMhVsrZM+9BG5FRaMSnRk9bkOqRMMLSqAXKM8yV
 Ez9jLib33MZbAw6t/I5d41k7qQx4EDKHUXOtr8CNS5QE+1Z9fylx0H/lKjK2oxKOFLrUIpCY+tl
 hSE+zrGuTyhRljJ1Dz6B5dgOrzjMg99c0leGLkTzkfEGFyAXIJNZd+wJixdV6jAkWuUeV3e9MRA
 F4YVIkV3kJn1I1fjZLIRAfl/ngCUJOodn+B7PLGfVFzqVwgRdIdNTDci3/CB0HQ6GJ/wmg==
X-Received: by 2002:a05:6871:282:b0:2bc:7811:5bb8 with SMTP id
 586e51a60fabf-2f5a8c8e55emr1903291fac.18.1751458946733; 
 Wed, 02 Jul 2025 05:22:26 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1bd3sm3785013fac.28.2025.07.02.05.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:22:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v3 09/10] target/arm: Fix bfdotadd_ebf vs nan selection
Date: Wed,  2 Jul 2025 06:22:12 -0600
Message-ID: <20250702122213.758588-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702122213.758588-1-richard.henderson@linaro.org>
References: <20250702122213.758588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d3PjLNXw4z6t

Implement FPProcessNaNs4 within f16_dotadd, rather than
simply letting NaNs propagate through the function.

Cc: qemu-stable@nongnu.org
Fixes: 0e1850182a1 ("target/arm: Implement FPCR.EBF=1 semantics for bfdotadd()")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_helper.c | 75 ++++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 986eaf8ffa..21c6175d2e 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2989,31 +2989,62 @@ float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2, float_status *fpst)
 float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2,
                      float_status *fpst, float_status *fpst_odd)
 {
-    /*
-     * Compare f16_dotadd() in sme_helper.c, but here we have
-     * bfloat16 inputs. In particular that means that we do not
-     * want the FPCR.FZ16 flush semantics, so we use the normal
-     * float_status for the input handling here.
-     */
-    float64 e1r = float32_to_float64(e1 << 16, fpst);
-    float64 e1c = float32_to_float64(e1 & 0xffff0000u, fpst);
-    float64 e2r = float32_to_float64(e2 << 16, fpst);
-    float64 e2c = float32_to_float64(e2 & 0xffff0000u, fpst);
-    float64 t64;
+    float32 s1r = e1 << 16;
+    float32 s1c = e1 & 0xffff0000u;
+    float32 s2r = e2 << 16;
+    float32 s2c = e2 & 0xffff0000u;
     float32 t32;
 
-    /*
-     * The ARM pseudocode function FPDot performs both multiplies
-     * and the add with a single rounding operation.  Emulate this
-     * by performing the first multiply in round-to-odd, then doing
-     * the second multiply as fused multiply-add, and rounding to
-     * float32 all in one step.
-     */
-    t64 = float64_mul(e1r, e2r, fpst_odd);
-    t64 = float64r32_muladd(e1c, e2c, t64, 0, fpst);
+    /* C.f. FPProcessNaNs4 */
+    if (float32_is_any_nan(s1r) || float32_is_any_nan(s1c) ||
+        float32_is_any_nan(s2r) || float32_is_any_nan(s2c)) {
+        if (float32_is_signaling_nan(s2r, fpst)) {
+            t32 = s2r;
+        } else if (float32_is_signaling_nan(s2c, fpst)) {
+            t32 = s2c;
+        } else if (float32_is_signaling_nan(s2r, fpst)) {
+            t32 = s2r;
+        } else if (float32_is_signaling_nan(s2c, fpst)) {
+            t32 = s2c;
+        } else if (float32_is_any_nan(s2r)) {
+            t32 = s2r;
+        } else if (float32_is_any_nan(s2c)) {
+            t32 = s2c;
+        } else if (float32_is_any_nan(s2r)) {
+            t32 = s2r;
+        } else {
+            t32 = s2c;
+        }
+        /*
+         * FPConvertNaN(FPProcessNaN(t32)) will be done as part
+         * of the final addition below.
+         */
+    } else {
+        /*
+         * Compare f16_dotadd() in sme_helper.c, but here we have
+         * bfloat16 inputs. In particular that means that we do not
+         * want the FPCR.FZ16 flush semantics, so we use the normal
+         * float_status for the input handling here.
+         */
+        float64 e1r = float32_to_float64(s1r, fpst);
+        float64 e1c = float32_to_float64(s1c, fpst);
+        float64 e2r = float32_to_float64(s2r, fpst);
+        float64 e2c = float32_to_float64(s2c, fpst);
+        float64 t64;
 
-    /* This conversion is exact, because we've already rounded. */
-    t32 = float64_to_float32(t64, fpst);
+        /*
+         * The ARM pseudocode function FPDot performs both multiplies
+         * and the add with a single rounding operation.  Emulate this
+         * by performing the first multiply in round-to-odd, then doing
+         * the second multiply as fused multiply-add, and rounding to
+         * float32 all in one step.
+         */
+        t64 = float64_mul(e1r, e2r, fpst_odd);
+        t64 = float64r32_muladd(e1c, e2c, t64, 0, fpst);
+
+        /* This conversion is exact, because we've already rounded. */
+        t32 = float64_to_float32(t64, fpst);
+    }
 
     /* The final accumulation step is not fused. */
     return float32_add(sum, t32, fpst);
-- 
2.43.0

