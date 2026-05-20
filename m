Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA39CD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:22:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZg-0001v7-LI; Wed, 20 May 2026 13:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZD-0001Yp-3P
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ6-0001zj-DY
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-36974217d4eso3215115a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297519; x=1779902319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vUC9cAbO+O9/DBX4sEI5SDbdyF9kYUZGrauZeyxTeRs=;
 b=rneYRC7aOMD0FlkKOjddVNGKJvhjOvZXDuXC4VRZYnen9pNyrp9QdK8nhheijlMp8v
 /av//zYhbRBu/kKxPAYXXFic68eCsqn99C4pnkujt342s5SBkMuBWsDwMretwLus4zV6
 Lx0LTCOw1IU7IBKshapZgIWCWzkFSO8TWRrlhCrl8VrEvZPoRNlTcfoXF++oKEziKYFb
 lhNOXckltkMKU43iPlhNed7XbEOg9r3I/eiqH0B/rEgviU4IB3b41GkBMUCQJI5OQKbD
 yeN4fESWMUaoExRr1zafAOnGV95jZ+E1B64uR04mP4MgEt9/REu3d/Y1chrnqiJJ1LNg
 lHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297519; x=1779902319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vUC9cAbO+O9/DBX4sEI5SDbdyF9kYUZGrauZeyxTeRs=;
 b=Z7lejijYaR6ZwAqkde+VGjfd07IAsN0Z0WslW5GFej67D/e0QnJezfzeShBMXvWcz7
 xaYyxN5+wCppouf1L7rqZAt1xkuLKaszJuzBcSAQgc4v7mxOvNTZasTZ3rkT5PmjitCk
 FPrtgNjQO5a73DqBoi/ArG9xoFImD+1kSi1e8Bqki2OhZJNO/Li7YQoin6F4ngV5NC4/
 GV2hJTtU2zPcU/bdITwK4dQlUP3pR3r4VeMMm2WlaSsaybzDY57PwxyOdGP2Ox+3vMoI
 eQ1TFLCGFRTRCOxq21daERVJtP8rppVqrup+9CxApK+K8Bxkig6I0GP7GVZKAzzMc7As
 6fYA==
X-Gm-Message-State: AOJu0YzPoAHHqEMnXXHAe4b8GPp9Iw8n762cMPnEa96CHtWp3r2dCiWM
 FkuYbqaYBht+fHaaiSJq9SQpkGE1p8FXnhm/Gc5gSYG3tsAChv1DoK0voSAwQ+mI9Cc=
X-Gm-Gg: Acq92OGM4SVC91+HQS6w3hgRR2VtNtyogBr9zhe0NOWx5169Dj2ey2OT5SZpczCLRwr
 R1jIlZ36JQzMlNN7lDTTm71KZCKg8hAR4p+Zdjv5bYD3Mhg5cJitIkipY6poRfQb5d73dgyluoF
 tNLtIWAcZOpbEBHAqhs7ZhApMhm9ErCynDfKsj2cugICtrq1lZdQCfYO4TqcZ9V3Bn+VJpzcu6g
 88z0YGQIWpkk4jjnb9l2Ca9twKjcqMuaTjCcNIY2/rBcRrJtlB8v694Q5wldjL8I6hh5ymti8Ef
 YSedOralKLe0D1Ww5oJDJ98b5a+Jpuk9qqwmJ5hAZ4KENfbDdZ5aAHSYSMaICPCFQJrfGNqnvjz
 +IJO31SHg4ZX0o8X/fmXGJkNroguX0IESk9Byhht00zJdxgBSOdmu9RAf0QVREjUijh+SqLAQ8U
 XSvDvoHt/p4naujOJXNhXUrpvZdYa9
X-Received: by 2002:a17:90b:4d01:b0:366:3ac:f725 with SMTP id
 98e67ed59e1d1-36951cab229mr23453857a91.25.1779297518797; 
 Wed, 20 May 2026 10:18:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 24/30] fpu: Use get_default_nan_mode everywhere
Date: Wed, 20 May 2026 10:18:14 -0700
Message-ID: <20260520171820.848839-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.c | 12 ++++++------
 target/arm/tcg/vfp_helper.c | 24 ++++++++++++------------
 target/m68k/softfloat.c     |  2 +-
 fpu/softfloat-parts.c.inc   |  8 ++++----
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index dd1f9c6dc6..6505ee3c94 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -273,11 +273,11 @@ uint32_t HELPER(frecpx_f16)(uint32_t a, float_status *fpst)
         float16 nan = a;
         if (float16_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            if (!fpst->default_nan_mode) {
+            if (!get_default_nan_mode(fpst)) {
                 nan = float16_silence_nan(a, fpst);
             }
         }
-        if (fpst->default_nan_mode) {
+        if (get_default_nan_mode(fpst)) {
             nan = float16_default_nan(fpst);
         }
         return nan;
@@ -305,11 +305,11 @@ float32 HELPER(frecpx_f32)(float32 a, float_status *fpst)
         float32 nan = a;
         if (float32_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            if (!fpst->default_nan_mode) {
+            if (!get_default_nan_mode(fpst)) {
                 nan = float32_silence_nan(a, fpst);
             }
         }
-        if (fpst->default_nan_mode) {
+        if (get_default_nan_mode(fpst)) {
             nan = float32_default_nan(fpst);
         }
         return nan;
@@ -337,11 +337,11 @@ float64 HELPER(frecpx_f64)(float64 a, float_status *fpst)
         float64 nan = a;
         if (float64_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            if (!fpst->default_nan_mode) {
+            if (!get_default_nan_mode(fpst)) {
                 nan = float64_silence_nan(a, fpst);
             }
         }
-        if (fpst->default_nan_mode) {
+        if (get_default_nan_mode(fpst)) {
             nan = float64_default_nan(fpst);
         }
         return nan;
diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 495ce8a329..8d3f6e3a2e 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -690,11 +690,11 @@ uint32_t HELPER(recpe_f16)(uint32_t input, float_status *fpst)
         float16 nan = f16;
         if (float16_is_signaling_nan(f16, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            if (!fpst->default_nan_mode) {
+            if (!get_default_nan_mode(fpst)) {
                 nan = float16_silence_nan(f16, fpst);
             }
         }
-        if (fpst->default_nan_mode) {
+        if (get_default_nan_mode(fpst)) {
             nan =  float16_default_nan(fpst);
         }
         return nan;
@@ -743,11 +743,11 @@ static float32 do_recpe_f32(float32 input, float_status *fpst, bool rpres)
         float32 nan = f32;
         if (float32_is_signaling_nan(f32, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            if (!fpst->default_nan_mode) {
+            if (!get_default_nan_mode(fpst)) {
                 nan = float32_silence_nan(f32, fpst);
             }
         }
-        if (fpst->default_nan_mode) {
+        if (get_default_nan_mode(fpst)) {
             nan =  float32_default_nan(fpst);
         }
         return nan;
@@ -802,11 +802,11 @@ float64 HELPER(recpe_f64)(float64 input, float_status *fpst)
         float64 nan = f64;
         if (float64_is_signaling_nan(f64, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            if (!fpst->default_nan_mode) {
+            if (!get_default_nan_mode(fpst)) {
                 nan = float64_silence_nan(f64, fpst);
             }
         }
-        if (fpst->default_nan_mode) {
+        if (get_default_nan_mode(fpst)) {
             nan =  float64_default_nan(fpst);
         }
         return nan;
@@ -945,11 +945,11 @@ uint32_t HELPER(rsqrte_f16)(uint32_t input, float_status *s)
         float16 nan = f16;
         if (float16_is_signaling_nan(f16, s)) {
             float_raise(float_flag_invalid, s);
-            if (!s->default_nan_mode) {
+            if (!get_default_nan_mode(s)) {
                 nan = float16_silence_nan(f16, s);
             }
         }
-        if (s->default_nan_mode) {
+        if (get_default_nan_mode(s)) {
             nan =  float16_default_nan(s);
         }
         return nan;
@@ -994,11 +994,11 @@ static float32 do_rsqrte_f32(float32 input, float_status *s, bool rpres)
         float32 nan = f32;
         if (float32_is_signaling_nan(f32, s)) {
             float_raise(float_flag_invalid, s);
-            if (!s->default_nan_mode) {
+            if (!get_default_nan_mode(s)) {
                 nan = float32_silence_nan(f32, s);
             }
         }
-        if (s->default_nan_mode) {
+        if (get_default_nan_mode(s)) {
             nan =  float32_default_nan(s);
         }
         return nan;
@@ -1056,11 +1056,11 @@ float64 HELPER(rsqrte_f64)(float64 input, float_status *s)
         float64 nan = f64;
         if (float64_is_signaling_nan(f64, s)) {
             float_raise(float_flag_invalid, s);
-            if (!s->default_nan_mode) {
+            if (!get_default_nan_mode(s)) {
                 nan = float64_silence_nan(f64, s);
             }
         }
-        if (s->default_nan_mode) {
+        if (get_default_nan_mode(s)) {
             nan =  float64_default_nan(s);
         }
         return nan;
diff --git a/target/m68k/softfloat.c b/target/m68k/softfloat.c
index f5d683bcc5..99c2dcbe8c 100644
--- a/target/m68k/softfloat.c
+++ b/target/m68k/softfloat.c
@@ -35,7 +35,7 @@ static floatx80 propagateFloatx80NaNOneArg(floatx80 a, float_status *status)
         a = floatx80_silence_nan(a, status);
     }
 
-    if (status->default_nan_mode) {
+    if (get_default_nan_mode(status)) {
         return floatx80_default_nan(status);
     }
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 6a67e6af2c..bef47a932d 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -20,14 +20,14 @@ FloatPartsN partsN(return_nan)(const FloatPartsN *a, float_status *s)
     switch (a->cls) {
     case float_class_snan:
         float_raise(float_flag_invalid | float_flag_invalid_snan, s);
-        if (s->default_nan_mode) {
+        if (get_default_nan_mode(s)) {
             return partsN(default_nan)(s);
         } else {
             return partsN(silence_nan)(a, s);
         }
         break;
     case float_class_qnan:
-        if (s->default_nan_mode) {
+        if (get_default_nan_mode(s)) {
             return partsN(default_nan)(s);
         }
         break;
@@ -49,7 +49,7 @@ FloatPartsN partsN(pick_nan)(const FloatPartsN *a, const FloatPartsN *b,
         have_snan = true;
     }
 
-    if (s->default_nan_mode) {
+    if (get_default_nan_mode(s)) {
         return partsN(default_nan)(s);
     }
 
@@ -134,7 +134,7 @@ static FloatPartsN partsN(pick_nan_muladd)(const FloatPartsN *a,
         float_raise(float_flag_invalid | float_flag_invalid_imz, s);
     }
 
-    if (s->default_nan_mode) {
+    if (get_default_nan_mode(s)) {
         /*
          * We guarantee not to require the target to tell us how to
          * pick a NaN if we're always returning the default NaN.
-- 
2.43.0


