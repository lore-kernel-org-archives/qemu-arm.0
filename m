Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2526FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:50:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpX-00084I-UR; Sun, 26 Apr 2026 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoD-0005vE-I7
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:11 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzo9-0001Wm-9F
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2a7a9b8ed69so79492915ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211158; x=1777815958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcYkneR9Skc297NkyUYU49GZmHwypHS79RqQoM9N3gU=;
 b=Qp08v51X2cXEixNbLglx4d0822xcAUOPaGfIAhl2UkH5oXEOOAPuvnQc33hPQwFhdL
 wnQj5Reh6pgkhO8y9QWxrBmDx3j49wjuajvBGnx9kC06SyawWgHPVDr5Jboj6Gxobz9V
 /uNvTigUgKsU8TnfQfZA0F6ZyBOc7vOt7xFwqs9s7JNlpz1R3jGTnJQG62xdMSDwsJny
 LXBM9gAkKhmoFkWHXnckwJxVzNKMjAQNXKCfICGJIIUNUAzQxOxZ6DEI2GIZqRZ5f0Mf
 wk/HW6rVp3dIamBHl/UrmNqTPBaosjD76UbbWYFCSm6TWyyZBYtqpcy/huXIUTv73VWO
 jjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211158; x=1777815958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RcYkneR9Skc297NkyUYU49GZmHwypHS79RqQoM9N3gU=;
 b=jTaz1kYgsM/1MnORTDT1RgRal1CJFiBSVur7lsuFD4set3+XnAlkdX+vqEqxgWNLri
 pvCcSYFMOX3GmwLkopUl08axRNS7i/d8Q516MCUZZbV8aIbP9And1QQCCFDvTlmY15/3
 78NJgtcNw0NcwSAUaWzJTx4SJ2otmWqQ+rsX1tQyB0ozS1umd8KZjIj7s/sSOYvVvi5j
 aSN4nNd8TxmZ+TovFZaVK0Qzz8aBYqQwVGwaFX31X+ePrBY/PPwA4h2wd186wvB6mntE
 Iy04q02N8yLth6GOa7ZWtDBoLfAHm0ZdwRa38mMg2kEDyYV0hkkkAsgR1FUuFuf9Ualz
 DMcw==
X-Gm-Message-State: AOJu0YyrByPO4xDXbcrlDRnWUp/ir0cTO+1bu5n+Hs4kwl8LscA2Fsla
 ZrTIRDZ1aZQm1xZSQoikBGhcwcAtMh6UaXUzrogaPWPUi+ZXkaghwLntJ0whpMzaFU1HL5UrUBH
 57CJDAdU=
X-Gm-Gg: AeBDievzi+4ME+coi/7oOsCyACwOxPV4MEa1IXQFzAQtSgMQARlkjDu+A2p+fAFz53L
 ILNxg+xc44/KjJslhD+tL5Ah5TIAvISsEDhowk2LFf5OZMel7MffhWav1Joeql/CwEYeY/P1aGs
 if3Z0aPYyxxOMrPyaVCXzxwkygkTN6kcfYtmuLXnyEeLKAdcTfmYY+r9slandbIje3ymssJpnb0
 /tYSjh8/iDeTSW/O9yu2ktzLT4AUzA3ohIhD3lqLR4AxiJSs0O9+Unty1+1NdND6AcmPSMbrRxN
 q7YxGaeezVGfxr3eqAUtOvJB3EsghZKjAKXFwXEDyz9jy7E/z6UsrLx81ajwGCIfgusZ2DXL0h3
 O/EzK7Bo6dDKH1sL1w7ysuHeWd61XfD+KD+fH2sBNy+oseG9raFenX/88Sx2z0dR+nL7lTyMUoJ
 0SH+wbq8ABTwLzUf2LrsmfcaXXrMGUBPESWvkRbJzo
X-Received: by 2002:a17:902:8b87:b0:2b0:a980:367c with SMTP id
 d9443c01a7336-2b5f9eb0513mr305330515ad.2.1777211158070; 
 Sun, 26 Apr 2026 06:45:58 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 62/84] fpu: Return struct from parts{64,128}_return_nan
Date: Sun, 26 Apr 2026 23:39:39 +1000
Message-ID: <20260426134002.865628-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 14 +++++++-------
 fpu/softfloat-parts.c.inc | 15 ++++++++-------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 9c1e6fdce4..7d67e25c17 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2378,7 +2378,7 @@ static void parts_float_to_e5m2(FloatParts64 *a, float_status *s, bool saturate)
     switch (a->cls) {
     case float_class_snan:
     case float_class_qnan:
-        parts64_return_nan(a, s);
+        *a = parts64_return_nan(a, s);
         break;
 
     case float_class_inf:
@@ -2405,7 +2405,7 @@ static void parts_float_to_e5m2(FloatParts64 *a, float_status *s, bool saturate)
 static void parts64_float_to_float(FloatParts64 *a, float_status *s)
 {
     if (is_nan(a->cls)) {
-        parts64_return_nan(a, s);
+        *a = parts64_return_nan(a, s);
     }
     if (a->cls == float_class_denormal) {
         float_raise(float_flag_input_denormal_used, s);
@@ -2415,7 +2415,7 @@ static void parts64_float_to_float(FloatParts64 *a, float_status *s)
 static void parts128_float_to_float(FloatParts128 *a, float_status *s)
 {
     if (is_nan(a->cls)) {
-        parts128_return_nan(a, s);
+        *a = parts128_return_nan(a, s);
     }
     if (a->cls == float_class_denormal) {
         float_raise(float_flag_input_denormal_used, s);
@@ -2441,7 +2441,7 @@ static FloatParts64 parts128_to_parts64(FloatParts128 *b, float_status *s)
     case float_class_qnan:
         /* Discard the low bits of the NaN. */
         r.frac = b->frac_hi;
-        parts64_return_nan(&r, s);
+        r = parts64_return_nan(&r, s);
         break;
     default:
         break;
@@ -2461,7 +2461,7 @@ static FloatParts128 parts64_to_parts128(FloatParts64 *b, float_status *s)
     switch (r.cls) {
     case float_class_qnan:
     case float_class_snan:
-        parts128_return_nan(&r, s);
+        r = parts128_return_nan(&r, s);
         break;
     case float_class_denormal:
         float_raise(float_flag_input_denormal_used, s);
@@ -4458,7 +4458,7 @@ static void parts64_log2(FloatParts64 *a, float_status *s, const FloatFmt *fmt)
             break;
         case float_class_snan:
         case float_class_qnan:
-            parts64_return_nan(a, s);
+            *a = parts64_return_nan(a, s);
             return;
         case float_class_zero:
             float_raise(float_flag_divbyzero, s);
@@ -5067,7 +5067,7 @@ float32 float32_exp2(float32 a, float_status *status)
             break;
         case float_class_snan:
         case float_class_qnan:
-            parts64_return_nan(&xp, status);
+            xp = parts64_return_nan(&xp, status);
             return float32_round_pack_canonical(&xp, status);
         case float_class_inf:
             return xp.sign ? float32_zero : a;
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 4733755f35..ef46dd740c 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -15,25 +15,26 @@
  * indicated otherwise.
  */
 
-static void partsN(return_nan)(FloatPartsN *a, float_status *s)
+static FloatPartsN partsN(return_nan)(const FloatPartsN *a, float_status *s)
 {
     switch (a->cls) {
     case float_class_snan:
         float_raise(float_flag_invalid | float_flag_invalid_snan, s);
         if (s->default_nan_mode) {
-            *a = partsN(default_nan)(s);
+            return partsN(default_nan)(s);
         } else {
-            *a = partsN(silence_nan)(a, s);
+            return partsN(silence_nan)(a, s);
         }
         break;
     case float_class_qnan:
         if (s->default_nan_mode) {
-            *a = partsN(default_nan)(s);
+            return partsN(default_nan)(s);
         }
         break;
     default:
         g_assert_not_reached();
     }
+    return *a;
 }
 
 static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
@@ -941,7 +942,7 @@ static void partsN(sqrt)(FloatPartsN *a, float_status *status,
             break;
         case float_class_snan:
         case float_class_qnan:
-            partsN(return_nan)(a, status);
+            *a = partsN(return_nan)(a, status);
             return;
         case float_class_zero:
             return;
@@ -1263,7 +1264,7 @@ static void partsN(round_to_int)(FloatPartsN *a, FloatRoundMode rmode,
     switch (a->cls) {
     case float_class_qnan:
     case float_class_snan:
-        partsN(return_nan)(a, s);
+        *a = partsN(return_nan)(a, s);
         break;
     case float_class_zero:
     case float_class_inf:
@@ -1656,7 +1657,7 @@ static void partsN(scalbn)(FloatPartsN *a, int n, float_status *s)
     switch (a->cls) {
     case float_class_snan:
     case float_class_qnan:
-        partsN(return_nan)(a, s);
+        *a = partsN(return_nan)(a, s);
         break;
     case float_class_zero:
     case float_class_inf:
-- 
2.43.0


