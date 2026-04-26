Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AF2FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:50:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzkE-0000No-B4; Sun, 26 Apr 2026 09:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjs-0008Pc-FU
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:36 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjq-0000H1-To
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:36 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2a9296b3926so54882195ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210892; x=1777815692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftntJNMSr0Al9uQHHp51tG7x8A4jpjGmGU9o5FpGbUc=;
 b=U7YryfphSxk4nPLdWBkg7z0GMBQRBIwPTnK8xapplKu+DC5Zu2CE3Jx9AAc/NSswZ3
 UBncaFJkMwOQeJoxx/1J5Den+WkxoSE6gaNK2XIbTlZC+UE3GgAZY/UBlj9xZfLkRFrp
 TE7MqTARMlr6pGx6Eqelm+bqw95db+qZ8bvmu6O14P1nKLPk6QivFPYosbodzw6fbrz5
 P3erIYGNHqR+AWyfrF90fjNFtr70Y7t57ZV7KmITdCzaj+p9v4cpuqZi0Smp7CwpuAIw
 QGS4u2og6P0qwhPZpx1rrbw+ooel2avtV68pxhvLuXyBpd0aC95QEPzt9zrp2p3XgZ0f
 GD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210892; x=1777815692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ftntJNMSr0Al9uQHHp51tG7x8A4jpjGmGU9o5FpGbUc=;
 b=cgZiEZ9q+eyQ0AVo97Bwl0hxO17m4C2X9AdP1unC8Ak7lmUotKISzDMa7rLf76ZU+g
 JQh18uXuZBNCPnMVgZFAFDtBzbalrcndg3jb7m9Yo28Ps8wDCcwkU6RplVO/WeZCNsM5
 /NVrS4meJkIKQU8mLXmqWlLEVp0dMI26TMA8fJAMZpHudTatAi3DQx8S7McPbuYYX8wK
 FvtGlV+fXp0QgZUXTAJ7ZqDirNTYwXcO1iWa31d/GvcZIeDcwaeh9DqZBP2DfXeTkzgH
 16jBjK/cWMnigCUmOdqzA7SHqlBNe+taWj/sRwtzvNN0MSioqTnSNuUuIxxEWLPWqo7E
 J3CA==
X-Gm-Message-State: AOJu0Yy7Er6d1JFjmuVSvyFGpOu8U/hHJ6GajJU4XPy7IlIieCUwQr52
 Jg+ldEeuXbELV2+4qDVM6jke7eu9QI6AFzjC8BL+IcXQ96pyOf5Mc7mz5XRFEz/Cv9U=
X-Gm-Gg: AeBDievkmdOY160bePuFj284Q5ANP8Yqs9EUM8wAMkCSzqWQvlF7RXFwKpKndWIVZ9y
 1nUghKOt7zOQ7+I4ytuQXJ+k41G+186TkF0I/M5cuhaO/NkwSVGlq9OLbW/IxCDGNZXxD7i80aO
 3cy2OQ7QhHuDQFg5LEqaBdgBacSOp/9k/A3znx2QtBQj6ZrI7NgKYQjLPK9AFrwYoI77T2KFu5Z
 bXMhZkmVs2jGJbwhmNLv+LPleMPGTL8mdN10Iji8ZFUlX9wj8KIKicsEeQSXr3q2HqYmMLq5VLS
 5nU8yTlP+NfyB0w52Lbcv3MMfoj714qbNZvKKewiM8/+whss2DktKk2gHobmSpFcIKDpcMfZwlk
 ybe/tODoV2jRiq4kP2AURKcTzyMxyvTFn36RtyTPVqClXrTY6lb1grFe3fwCQZDEK7VSekElpyt
 XGds5Oq2wKrpmvPiNIbUifLlg0Mmg6QrRRAIumgD+f
X-Received: by 2002:a17:902:cec6:b0:2b2:49a7:a5ca with SMTP id
 d9443c01a7336-2b5f9e8f561mr402948115ad.5.1777210892321; 
 Sun, 26 Apr 2026 06:41:32 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 32/84] fpu: Return structure from unpack_raw64
Date: Sun, 26 Apr 2026 23:39:09 +1000
Message-ID: <20260426134002.865628-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 fpu/softfloat.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6cca31af30..99b1cce894 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -633,12 +633,12 @@ static const FloatFmt floatx80_params[3] = {
 };
 
 /* Unpack a float to parts, but do not canonicalize.  */
-static void unpack_raw64(FloatParts64 *r, const FloatFmt *fmt, uint64_t raw)
+static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
 {
     const int f_size = fmt->frac_size;
     const int e_size = fmt->exp_size;
 
-    *r = (FloatParts64) {
+    return (FloatParts64) {
         .cls = float_class_unclassified,
         .sign = extract64(raw, f_size + e_size, 1),
         .exp = extract64(raw, f_size, e_size),
@@ -648,37 +648,37 @@ static void unpack_raw64(FloatParts64 *r, const FloatFmt *fmt, uint64_t raw)
 
 static void QEMU_FLATTEN float4_e2m1_unpack_raw(FloatParts64 *p, float4_e2m1 f)
 {
-    unpack_raw64(p, &float4_e2m1_params, f);
+    *p = unpack_raw64(&float4_e2m1_params, f);
 }
 
 static void QEMU_FLATTEN float8_e4m3_unpack_raw(FloatParts64 *p, float8_e4m3 f)
 {
-    unpack_raw64(p, &float8_e4m3_params, f);
+    *p = unpack_raw64(&float8_e4m3_params, f);
 }
 
 static void QEMU_FLATTEN float8_e5m2_unpack_raw(FloatParts64 *p, float8_e5m2 f)
 {
-    unpack_raw64(p, &float8_e5m2_params, f);
+    *p = unpack_raw64(&float8_e5m2_params, f);
 }
 
 static void QEMU_FLATTEN float16_unpack_raw(FloatParts64 *p, float16 f)
 {
-    unpack_raw64(p, &float16_params, f);
+    *p = unpack_raw64(&float16_params, f);
 }
 
 static void QEMU_FLATTEN bfloat16_unpack_raw(FloatParts64 *p, bfloat16 f)
 {
-    unpack_raw64(p, &bfloat16_params, f);
+    *p = unpack_raw64(&bfloat16_params, f);
 }
 
 static void QEMU_FLATTEN float32_unpack_raw(FloatParts64 *p, float32 f)
 {
-    unpack_raw64(p, &float32_params, f);
+    *p = unpack_raw64(&float32_params, f);
 }
 
 static void QEMU_FLATTEN float64_unpack_raw(FloatParts64 *p, float64 f)
 {
-    unpack_raw64(p, &float64_params, f);
+    *p = unpack_raw64(&float64_params, f);
 }
 
 static void QEMU_FLATTEN floatx80_unpack_raw(FloatParts128 *p, floatx80 f)
-- 
2.43.0


