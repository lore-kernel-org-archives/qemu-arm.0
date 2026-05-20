Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A9CCD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:22:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZD-0001ZV-Op; Wed, 20 May 2026 13:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ4-0001PD-SM
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ1-0001xZ-FK
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-3665b67ed66so3347375a91.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297514; x=1779902314; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNRh84rUAghqHenrq+0cUxy5mrPbxSwReJ+c+zbc2c0=;
 b=T51fXMyzBHgM9tR+FV3NOj9iEUhqfpDHbMC7b1gu2Afug/RgXy4k/2PXlB4Vmt2M8J
 /kBRsviKZKEYtTDYdMtZm5nPidJUieAZvlMpIWLstt5fWP3MjX3WsNc2MAP4ci6oJ8jG
 UcfptZj3i0vLuZ5XAiheFOn5MB6r1sZu3D0hPTNQp1VFGvqvykXzWF3sKs34A6cqg/B5
 ZQSKZvm2ayM70dgx+QvbNzrk8PzjmBBf3UDfo7nwEWRYtkiv7XZHR/AwqZBq2Lmd925Z
 jJdCh37lJQUIb7I0apWkuyclFguwoM+IhbbOtTmcLl5S3iJaLocbRmy+lP38CtBIFdId
 HXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297514; x=1779902314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gNRh84rUAghqHenrq+0cUxy5mrPbxSwReJ+c+zbc2c0=;
 b=qnVp+BH+/QT8biWRh5FLeSxCemHpXQfdPfiPZiIPCXjKOQSJB7pI0Bp1yniu7ioq3G
 iQ3LxEobJHy89cHBIKMU3UuSUEsHjCFyB3dVEFazIbH2Yt8YWspF+djPnL9zzStzIFHQ
 0bdN48PQu38nZbKq9G0nPd625SOw6UdcS2SYS++XU7NPVcFydbelIXWSZcCUEcruNWDm
 x0M1Ywc+xWX9iegfhlQmGe7zGWRgJnQnYz2nyec0ToPJdudzjH9/CJfDDT/f9IRnIu+g
 2L1ZPfKq353+auNUd9YLdVs/ZPZ1lKuIGYQugAzps4gv4jAYFaFTT2NhFCHv6UaYurwc
 Dv3w==
X-Gm-Message-State: AOJu0YxsJZ3CfMXebFCnVKMKHVItcJchUeEYnX3ekMEAZ70Wz++L3TsY
 kgumWl365RL1q2qjsU59XRVwUWPeu0di24cRm/yn+NCUuRxcorhRJCvK2cuDVivf3DU=
X-Gm-Gg: Acq92OFakCOQ9aNim3MupgwXtQiT+eZS+pxWFf8SSYVWVoBHaFsGC9L9uLArxNOmiHj
 fRYVAl0QlNwRy9t52HFIIvm7rVn431bpoJHDuKRhLCgcG87XC/7Gk7ILEFJLrAYQc5td/6KPE3t
 6YX/TpftP9YjnFKoUmXD9S2yplSUrPHWwx1BaTUW5MZfp7vX94AOx0VLnJe6SKspItUBwpqo35j
 3cVtNjbfgw6+moSMj/++SDmYtWKcRZVyD/Pn0bP0n6Gp7oe63ojIxnapi9w4+5OsrN33CLUca5L
 KJAFbQKSy87VUefiHiMZdqZTgE6Av5vlgQv9qHqwsO1//Ajt11pfTanZ9HdOTVngQMmYJIymuaC
 MP0ixdlfDF1iBqJ2oJaMgYWJ0oxFoqzi7OZYbzwN3sFcq+vkH5L/aEbrXTugdhlEdJW4tvCyTQH
 TQQw2ZUWR7QxDebI9nAZEnB8OQTfSUV7bVRWPRQ70=
X-Received: by 2002:a17:90a:602:b0:369:96e8:c8ae with SMTP id
 98e67ed59e1d1-36996e8d08dmr11515642a91.19.1779297513805; 
 Wed, 20 May 2026 10:18:33 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 16/30] fpu: Use get_floatx80_behaviour everywhere
Date: Wed, 20 May 2026 10:18:06 -0700
Message-ID: <20260520171820.848839-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 include/fpu/softfloat.h        | 10 ++++++----
 fpu/softfloat.c                |  2 +-
 fpu/softfloat-parts.c.inc      |  4 ++--
 fpu/softfloat-specialize.c.inc |  2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 4ae4ddc799..e08d1c374d 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1018,7 +1018,7 @@ static inline bool floatx80_is_infinity(floatx80 a, float_status *status)
     bool intbit = a.low >> 63;
 
     if (!intbit &&
-        !(status->floatx80_behaviour & floatx80_pseudo_inf_valid)) {
+        !(get_floatx80_behaviour(status) & floatx80_pseudo_inf_valid)) {
         return false;
     }
     return (a.high & 0x7fff) == 0x7fff && !(a.low << 1);
@@ -1112,6 +1112,8 @@ static inline bool floatx80_unordered_quiet(floatx80 a, floatx80 b,
 *----------------------------------------------------------------------------*/
 static inline bool floatx80_invalid_encoding(floatx80 a, float_status *s)
 {
+    FloatX80Behaviour rule = get_floatx80_behaviour(s);
+
     if ((a.low >> 63) || (a.high & 0x7fff) == 0) {
         /* Anything with the Integer bit set or the exponent 0 is valid */
         return false;
@@ -1119,12 +1121,12 @@ static inline bool floatx80_invalid_encoding(floatx80 a, float_status *s)
 
     if ((a.high & 0x7fff) == 0x7fff) {
         if (a.low) {
-            return !(s->floatx80_behaviour & floatx80_pseudo_nan_valid);
+            return !(rule & floatx80_pseudo_nan_valid);
         } else {
-            return !(s->floatx80_behaviour & floatx80_pseudo_inf_valid);
+            return !(rule & floatx80_pseudo_inf_valid);
         }
     } else {
-        return !(s->floatx80_behaviour & floatx80_unnormal_valid);
+        return !(rule & floatx80_unnormal_valid);
     }
 }
 
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index d2a9f97089..f774ff278c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1578,7 +1578,7 @@ floatx80 floatx80_round_pack_canonical(FloatParts128 *p, float_status *s)
 
     case float_class_inf:
         /* x86 and m68k differ in the setting of the integer bit. */
-        frac = s->floatx80_behaviour & floatx80_default_inf_int_bit_is_zero ?
+        frac = get_floatx80_behaviour(s) & floatx80_default_inf_int_bit_is_zero ?
             0 : (1ULL << 63);
         exp = fmt->exp_max;
         break;
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 7311c3696e..fd3e79fd3e 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -213,7 +213,7 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
      * how we uncanonicalize results.
      */
     bool has_pseudo_denormals = fmt->has_explicit_bit &&
-        (status->floatx80_behaviour & floatx80_pseudo_denormal_valid);
+        (get_floatx80_behaviour(status) & floatx80_pseudo_denormal_valid);
 
     if (unlikely(p->exp == 0)) {
         if (likely(fracN(eqz)(p))) {
@@ -420,7 +420,7 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
     } else {
         bool is_tiny = s->tininess_before_rounding || exp < 0;
         bool has_pseudo_denormals = fmt->has_explicit_bit &&
-            (s->floatx80_behaviour & floatx80_pseudo_denormal_valid);
+            (get_floatx80_behaviour(s) & floatx80_pseudo_denormal_valid);
 
         if (!is_tiny) {
             FloatPartsN discard;
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 0b527302a5..4b6c17e433 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -221,7 +221,7 @@ floatx80 floatx80_default_inf(bool zSign, float_status *status)
      * Whether the Integer bit is set in the default Infinity is
      * target dependent.
      */
-    bool z = status->floatx80_behaviour & floatx80_default_inf_int_bit_is_zero;
+    bool z = get_floatx80_behaviour(status) & floatx80_default_inf_int_bit_is_zero;
     return packFloatx80(zSign, 0x7fff, z ? 0 : (1ULL << 63));
 }
 
-- 
2.43.0


