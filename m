Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2458ACD5BAB
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:22:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkaE-0002QZ-9P; Wed, 20 May 2026 13:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZF-0001aX-8y
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ8-00020p-BG
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-368f25ff4c4so2701190a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297521; x=1779902321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cZFFZPDMpbzdsj37a9/p1FZxebig9+4EbrHozdK8lKs=;
 b=FGBHIIsWjAWHTiYfsJzsz7B1BL+Mh13/bavrT+MWum8lksazwMyMjnN3FiCrns7fhp
 D6VsvfP5oxeg/P6xq8v3IILet2ZkafpZOcXGz/fmSPYqZ7HoUz78vASQPgKPGcruzHqC
 JVvOz0KNiopJP8TIaDfl7O3XQh9lzXWP9XBck6JvEU9W+rDAsK12IxmEK9dkCcjeIbKd
 5JzEimVk0VhUMjz8ZpM6Q8OuJJQMP3gyn0QL0yyE9sSrAwRWllTHgiL1N+Ul5ZjdVnsx
 rzO96Obf94zee0MIh7OCfOTOOE04YnxvfnZ/8yKQC+A7NhUo+R8RJ46xg388rIbGcMqP
 X1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297521; x=1779902321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cZFFZPDMpbzdsj37a9/p1FZxebig9+4EbrHozdK8lKs=;
 b=cajVxFEr3V5IyYzQNItVPOrpAU6bqByXzACPI16bBeV7fstD4dotrFLatzk1NbSU8F
 St3PUQP97XMYnFA7oldSemO3kKNn+Nc/Oif/ltS3LrS8Mik7JcMgtkym1n+yIpEyXHS3
 PROJgMgZnGunlZWlbW+lPwH/7uLEK4fyTM/KoFSUVccEpC9YPpoxjAZAQxZkbuCZjRlP
 JotFsPa0ldu3sDVOdlJ9bSZ5TxIMHri6Zhhc0WURHhGTcEcsOg3DiVngoqWSyuTBiQ61
 SZR6yWglS5YnBBjOlVfv7F3DTYXceJbvpNWXZCt9kVRS7I6gmzTTdnwC3d8W17RZeVWA
 aeAw==
X-Gm-Message-State: AOJu0YxUfLGVOHVA4BQcGYoOWFMFtKL+7zGcve3NEtqJOiSAvWmJB10n
 SNusfHvTCvxlQC91cEGcnSMLo8XesT1LzA4zxpWzVCmibobnZbgLOJbYYjQLxMe9260RbV7DdMG
 UbSX9W9M=
X-Gm-Gg: Acq92OE7/Sa5M6iQnkjsofyjnABLtz1kcuem7eqaSZZrNa0eTdub/CG1HtKMX8p2rsH
 ZEoIr5QlGrq0jsu+C+xqUKk5ZHwB+xw8V6gswuPBYVuQeznDWo/fffXhA8Y7KXcncYwvuaq6uVr
 cx/JprJqwpafs6uB9zZVHihqdY3goeOUdQh8PXmWRa588mm9XUVcEFQGu0GdtMtC/50yabYOvFq
 z+sdnOo/6MGubr2R2aVL+twarkZDgLcYnylRpiLshudnmHm/nqqNXCm2UG+LZu7onHS3eLWfSGH
 Z5qgrWyyNtmcwn781yL8UxF7QGYp5EhC41Gvw2ghYLIPptfPq/e+63FSeBruzDXjxAUAu5e2qxq
 psOWENWPisyVVcvNrWZVNDOkB1WjEKHuCvWsePlg20RRn2q9qNasH4TzqzKqAjr2e5eCGs60/5/
 2MK1Xw6GLBGQjkbQj9K+JKwdkjlmH/eRIkBY363LE=
X-Received: by 2002:a17:90b:2f08:b0:369:996d:282c with SMTP id
 98e67ed59e1d1-369996d2ea1mr16182128a91.9.1779297520833; 
 Wed, 20 May 2026 10:18:40 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 27/30] fpu: Reorg float_status
Date: Wed, 20 May 2026 10:18:17 -0700
Message-ID: <20260520171820.848839-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Use bitfields to compress float_status from 18 bytes down to 8 bytes.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 53 ++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 67b7f38aef..c5a6684763 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -327,7 +327,7 @@ typedef enum __attribute__((__packed__)) {
      * This is a flag which can be ORed in with any of the above
      * DNaN behaviour options.
      */
-    float_infzeronan_suppress_invalid = (1 << 7),
+    float_infzeronan_suppress_invalid = (1 << 2),
 } FloatInfZeroNaNRule;
 
 /*
@@ -402,22 +402,39 @@ typedef enum __attribute__((__packed__)) {
  */
 
 typedef struct float_status {
-    FloatExceptionFlags float_exception_flags;
-    FloatRoundMode float_rounding_mode;
-    FloatX80RoundPrec floatx80_rounding_precision;
-    FloatX80Behaviour floatx80_behaviour;
-    Float2NaNPropRule float_2nan_prop_rule;
-    Float3NaNPropRule float_3nan_prop_rule;
-    FloatInfZeroNaNRule float_infzeronan_rule;
-    FloatSNaNRule float_snan_rule;
-    bool tininess_before_rounding;
+    FloatExceptionFlags float_exception_flags : 16;
+
+    /*
+     * Floating point status controls.
+     * Items that, in general, may be updated by writes to an architectural
+     * floating point control register.
+     */
+    FloatRoundMode float_rounding_mode : 3;
+    FloatX80RoundPrec floatx80_rounding_precision : 2;
     /* should denormalised results go to zero and set output_denormal_flushed? */
-    bool flush_to_zero;
-    /* do we detect and flush denormal results before or after rounding? */
-    bool ftz_before_rounding;
+    bool flush_to_zero : 1;
     /* should denormalised inputs go to zero and set input_denormal_flushed? */
-    bool flush_inputs_to_zero;
-    bool default_nan_mode;
+    bool flush_inputs_to_zero : 1;
+    /* should default nans be produced instead of propagating an input nan? */
+    bool default_nan_mode : 1;
+    /* should overflowed results subtract re_bias to its exponent? */
+    bool rebias_overflow : 1;
+    /* should underflowed results add re_bias to its exponent? */
+    bool rebias_underflow : 1;
+
+    /*
+     * Floating point behaviour controls.
+     * Items that, in general, will be set at cpu realization because
+     * the behaviour is baked into the specific hardware implementation.
+     */
+    bool tininess_before_rounding : 1;
+    /* do we detect and flush denormal results before or after rounding? */
+    bool ftz_before_rounding : 1;
+    FloatSNaNRule float_snan_rule : 2;
+    Float2NaNPropRule float_2nan_prop_rule : 3;
+    Float3NaNPropRule float_3nan_prop_rule : 7;
+    FloatInfZeroNaNRule float_infzeronan_rule: 3;
+    FloatX80Behaviour floatx80_behaviour : 5;
     /*
      * The pattern to use for the default NaN. Here the high bit specifies
      * the default NaN's sign bit, and bits 6..0 specify the high bits of the
@@ -427,11 +444,7 @@ typedef struct float_status {
      * this to the correct non-zero value, or we will assert when trying to
      * create a default NaN.
      */
-    uint8_t default_nan_pattern;
-    /* should overflowed results subtract re_bias to its exponent? */
-    bool rebias_overflow;
-    /* should underflowed results add re_bias to its exponent? */
-    bool rebias_underflow;
+    unsigned default_nan_pattern : 8;
 } float_status;
 
 #endif /* SOFTFLOAT_TYPES_H */
-- 
2.43.0


