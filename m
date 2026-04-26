Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DED2FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:57:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzkj-0001e4-Nu; Sun, 26 Apr 2026 09:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzk3-0000Fj-IY
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:48 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzk0-0000LQ-61
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a9296b3926so54882425ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210903; x=1777815703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCLbppciWZ3KadA9Q4n94dtnAIRgxxa5V98lrrbPK64=;
 b=Vq+ExdUmaI4hVE7O42OwVRJQcqs44pc95PGlC/kC4c5aXOt2htO0UjZK+BW6jW6QJ6
 zpHy+5JDMEuRuOesORg5g+/vfzUF7UTBCdX0V2pJp3zDtXMSelbNAGBCqHXv9TMHAtSp
 6KoGM2gd41zAsPgjNrFCVRK8/sgCrsdpvDaQqxlo6cJZD5HDg96lTsfIs1atec/4NuUM
 tUrPU6UiFoHeZa/a76pz7ygIbBMtI+7oAi3ze/nDuE5Fr31f0jJ8tDSojVLJC1Js6t5k
 ncz+/MhUt6U/OCSbTDH5VI/4pxeNRkD8S5wn3iP7+KjDFTl4F6TG4eyZ2vflMhsyFSjz
 UUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210903; x=1777815703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XCLbppciWZ3KadA9Q4n94dtnAIRgxxa5V98lrrbPK64=;
 b=kbcWwB4q1Z3DPTSvPTLIrtnMtxfR1FVNl4RFmzS7RyvSowEQp0vs59wJsMpGXS+LMl
 Gvy79RhCBjlIZbQbwxMTkKhBFxWr7BU+7SmOLGpPTowJFU5PxbYOYU8WpQU7JhMTEl9z
 6v3v65+JCVAuFqRzcFOGPV45AcibYfz9Ezd3r3rtWYxBmGz2ktYRG/e4735M1BMHjy+m
 cP7sxO92hLhQuzFeem7g4mQ1qzXJElvwOpxWrzhEn6IRw3j4CsyMe+PMXYoJI3KDKozo
 1vEEWBO/8RV4nap36IbnkJKI6go34w2eQobgWJSC4CHkePzPDFJKWo5sHPcwyFM9+FGv
 M4jQ==
X-Gm-Message-State: AOJu0Yxwfx09uykKwmHIGjWiYRg5rPN3P3qB8FKWJO7nJdr0WvYukINy
 IwGbYCICZVoCrEASXQ+ZhvS4eSAkgs7FUHq9X3g2JSuTzp507SAjdhkVEUny8gmYwDgVEFz2hxU
 hSBgVNeA=
X-Gm-Gg: AeBDiesNxFJ62VSBmuCCWmmq7btTTsOb1ngxNfkIJ596xoeYPWTD98SJpgJ1Z/49ouB
 eTudD459WokYw57cb+KSfde/QCji9u4w23MWu0XqB6ZXMOGTw4RjdTY4HKmIK2Y3u+9Yj6QlonW
 t22OduA5OlrGdcvv9YJSegaUe3IJk8agIWJ0zkGQcunuIqUfy1/XuBa8bLy3KChbLi0Bh58drnW
 6rEiIANQRp6e+xrFmafai9NpnBu9V44L/633YLA5gLIZyfY8InADQQjk6BWcEbbMTm1BGaQ+VKv
 uyhn3yYmxDPFWdzOyGQChDi0jtEQ/D3tU/dPxFSK6hvCgrJ24qYYLV3wY3roomJD08QPKVIwZkE
 AnIs2ZG/bGg1wxkUtNQAsigGwInFMKATmCtqwqLiZ5aydgpKTFmg5ynsXqPyaSQ4g1SLBQQdAMg
 UB/6fF+GZyIk574wYZM3ES0JEx59UErPvWltZK2knD
X-Received: by 2002:a17:902:d706:b0:2b0:b016:773f with SMTP id
 d9443c01a7336-2b5f9eb2233mr281413615ad.11.1777210902738; 
 Sun, 26 Apr 2026 06:41:42 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 36/84] fpu: Inline float16_unpack_raw into callers
Date: Sun, 26 Apr 2026 23:39:13 +1000
Message-ID: <20260426134002.865628-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index bc6450954e..cdf95a8517 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -646,11 +646,6 @@ static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static void QEMU_FLATTEN float16_unpack_raw(FloatParts64 *p, float16 f)
-{
-    *p = unpack_raw64(&float16_params, f);
-}
-
 static void QEMU_FLATTEN bfloat16_unpack_raw(FloatParts64 *p, bfloat16 f)
 {
     *p = unpack_raw64(&bfloat16_params, f);
@@ -1482,7 +1477,7 @@ static FloatParts64 float8_e5m2_unpack_canonical(float8_e5m2 f, float_status *s)
 static void float16a_unpack_canonical(FloatParts64 *p, float16 f,
                                       float_status *s, const FloatFmt *params)
 {
-    float16_unpack_raw(p, f);
+    *p = unpack_raw64(&float16_params, f);
     parts64_canonicalize(p, s, params);
 }
 
@@ -4978,9 +4973,8 @@ bfloat16 bfloat16_default_nan(float_status *status)
 
 float16 float16_silence_nan(float16 a, float_status *status)
 {
-    FloatParts64 p;
+    FloatParts64 p = unpack_raw64(&float16_params, a);
 
-    float16_unpack_raw(&p, a);
     p.frac <<= float16_params.frac_shift;
     parts64_silence_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
@@ -5049,9 +5043,8 @@ static bool parts_squash_denormal(FloatParts64 p, float_status *status)
 float16 float16_squash_input_denormal(float16 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts64 p;
+        FloatParts64 p = unpack_raw64(&float16_params, a);
 
-        float16_unpack_raw(&p, a);
         if (parts_squash_denormal(p, status)) {
             return float16_set_sign(float16_zero, p.sign);
         }
-- 
2.43.0


