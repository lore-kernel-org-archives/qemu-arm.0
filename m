Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99A1CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:19:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZB-0001Y8-UL; Wed, 20 May 2026 13:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZA-0001Vr-B0
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:44 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ4-0001yv-Cp
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:44 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-36974221f93so2743048a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297516; x=1779902316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CkGcitbVj7Tw/zFQo/cJKaPLwAnxuxCUWUlpY6Me2M=;
 b=JdBCnpGW3cOPhOjD97g+KCpBgBaQeYUDkunHl6gVrVGO/lYincfvRym2ftjDCkN7ZY
 B5qhC2u+z9RsZPJsZ/sgZHszrVMfqFjLeBAEwsRVzyDo8zZGzqruns5Phnhlsb2zi4iC
 H+sb/7NSA5Arhw7I2FfE8DuFyi7sfglGqU6ErfWtZ4u7SY/zqbLgQ39UJ34qQlVH7ZSm
 cTtbViwt1xXnxF9EHdNfs8nUazTvgTQ2BM805JmtvII7PAhW6N21Jl6tL1k1j1ezo8Y0
 MFOLl+Bs9GFigWE7eN4rJJ2szVuBbgT0FbBEb+kmrhizmY6cFVb1RNpimPW4Yb7p2KyB
 qzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297516; x=1779902316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7CkGcitbVj7Tw/zFQo/cJKaPLwAnxuxCUWUlpY6Me2M=;
 b=LrJQTEtHDeFaSSR4aHGzItAKP6LoERUYqnUcUl9M6a1L1Hl2VLjE+2x1ozPG7bpwNX
 A1EfcqF9jaUo9YcSX/LJU5z5lY++lYbLDpFd78sc/YEl2QJjzzst/ZC8qf4SdSGn57uH
 eKJk+P4vyN/28v87seMttzWWW5XLC3/JbabxJsoS12zrdxb+26YZJ+BefcBC0ROctQzm
 dW3/985zOUgCOP0IhNXK4bQFwNbzmCsCAkqXcHRClZIKqPHxuCQCXOcVENhpq+efh5z6
 3eXTFYg5jwZlQt9yYsTXHODr1o1Ao1WsQ+/79QKcJeGi6Pyc7ml3Ue5KyWe0PA/gSgEF
 D8jw==
X-Gm-Message-State: AOJu0Yz8raKoQ6a4UfQamlv+fhI81w7ilHX/euNSvNSbBnqep8qUNLjF
 doVh3ajUCodAcAoK7BNEc5T6ko2DVxDFqfM765d8FJB5UgDonmDA+mj+rwIlIYFvZW0Bew6hOxi
 RIIpVYeA=
X-Gm-Gg: Acq92OHhmqjIaEUHQ8y1FBA1h3Nwpmaaj9epv+1oBj0QTCfp3f88zMUAtcja2xrDA/I
 lTahMv/5OnArqAMo9/dOJL+uJJSuz+ncGCTUmtncyegklq78UWTflc0IZBI2pL/6yRqLLxiNP1F
 Bd2xGw+e2A+zKnxdlzw7B1zQMNOwJXZC3SXWMKSV1hCvmpsEDOUaztEbih3dOiXH60SFdhzeLAY
 ClZ+GAEtEsGrJQ8GYxmQjYGfBwodYJzSk7wBX06L9plMvwZjBa0OVdMU5sryL+Nom/gTaCbplhG
 1ieTlebCYivyR17z4kUwH+MRknArU0aQGAj7u1ht1en5BWyYGVYs6AmhNFyQ8Qteva7pGAi3cFV
 nlCZtXaJ33cQxx4rtFkJxol3zCO5BgRheQrFsigmRwdCpja4Y0skN53wsDWH9EixzrMTsVZrQ32
 RgNONkYSAZCFiY3e87Rv3rkmbOXhrZ
X-Received: by 2002:a17:90b:3505:b0:368:9da3:c496 with SMTP id
 98e67ed59e1d1-36951ca7638mr24829565a91.24.1779297516353; 
 Wed, 20 May 2026 10:18:36 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 20/30] fpu: Use accessors for tininess_before_rounding
Date: Wed, 20 May 2026 10:18:10 -0700
Message-ID: <20260520171820.848839-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Rename get_float_detect_tininess to get_tininess_before_rounding
and move to softfloat.c, as there are no external users.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-helpers.h | 5 -----
 fpu/softfloat.c                 | 4 ++--
 tests/fp/fp-test.c              | 2 +-
 fpu/softfloat-parts.c.inc       | 2 +-
 fpu/softfloat-specialize.c.inc  | 5 +++++
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 95edd22842..395ce67abf 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -132,11 +132,6 @@ static inline void set_snan_rule(FloatSNaNRule val, float_status *status)
     status->float_snan_rule = val;
 }
 
-static inline bool get_float_detect_tininess(const float_status *status)
-{
-    return status->tininess_before_rounding;
-}
-
 static inline FloatRoundMode get_float_rounding_mode(const float_status *status)
 {
     return status->float_rounding_mode;
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index f774ff278c..c7c750f284 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -4923,7 +4923,7 @@ floatx80 roundAndPackFloatx80(FloatX80RoundPrec roundingPrecision, bool zSign,
                 float_raise(float_flag_output_denormal_flushed, status);
                 return packFloatx80(zSign, 0, 0);
             }
-            isTiny = status->tininess_before_rounding
+            isTiny = get_tininess_before_rounding(status)
                   || (zExp < 0 )
                   || (zSig0 <= zSig0 + roundIncrement);
             shift64RightJamming( zSig0, 1 - zExp, &zSig0 );
@@ -4997,7 +4997,7 @@ floatx80 roundAndPackFloatx80(FloatX80RoundPrec roundingPrecision, bool zSign,
             return floatx80_default_inf(zSign, status);
         }
         if ( zExp <= 0 ) {
-            isTiny = status->tininess_before_rounding
+            isTiny = get_tininess_before_rounding(status)
                   || (zExp < 0)
                   || !increment
                   || (zSig0 < UINT64_C(0xFFFFFFFFFFFFFFFF));
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 326a1201f3..16ffd36e6f 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -1011,7 +1011,7 @@ void run_test(void)
 
                     verCases_tininessCode = 0;
                     slowfloat_detectTininess = tmode;
-                    qsf.tininess_before_rounding = sf_tininess_to_qemu(tmode);
+                    set_float_detect_tininess(sf_tininess_to_qemu(tmode), &qsf);
 
                     if (attrs & FUNC_EFF_TININESSMODE ||
                         ((attrs & FUNC_EFF_TININESSMODE_REDUCEDPREC) &&
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 1e92251761..1c726cb86e 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -418,7 +418,7 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
         exp = 0;
         fracN(clear)(p);
     } else {
-        bool is_tiny = s->tininess_before_rounding || exp < 0;
+        bool is_tiny = get_tininess_before_rounding(s) || exp < 0;
         bool has_pseudo_denormals = fmt->has_explicit_bit &&
             (get_floatx80_behaviour(s) & floatx80_pseudo_denormal_valid);
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 4b6c17e433..0b62b0e907 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -79,6 +79,11 @@ this code that are retained.
  * version 2 or later. See the COPYING file in the top-level directory.
  */
 
+static inline bool get_tininess_before_rounding(const float_status *status)
+{
+    return status->tininess_before_rounding;
+}
+
 /*----------------------------------------------------------------------------
 | For the deconstructed floating-point with fraction FRAC, return true
 | if the fraction represents a signalling NaN; otherwise false.
-- 
2.43.0


