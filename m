Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF55AFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:50:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGznU-0005br-BB; Sun, 26 Apr 2026 09:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznP-0005SG-Hh
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:16 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznN-0001Ie-VD
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:15 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b24fdac394so90574425ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211113; x=1777815913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWzy2wmG/YVpmfySiB9DM04usKyzulFCXbIVFWan6xA=;
 b=U9bqov9EG0OoaBzJHnHARYSASxo1JlSfzeGb7pDkZ1FZ4D8+EJZE8ntvsc6NtFZvmX
 UjijVSBemaU0aL9eH4/fsn/qc0eTXCOa8ZYn/Ewx6N+9BxxuIVuUWv7GvrK7njKGuylh
 MqiFHqvL8cYgbGYED6qpnz+8vsO0Wea3sJWN0eB06FIb71fBcPmbnunjBedEsH8GckO9
 TZR/CDx61QKkn9+YxigELDqQvIpFesv2WNo/hMKgo3KI8mijSTFhFEyg6B1ZnYIFxbr6
 yxuCB7ArM/5piqru5xq5ZFre+U6HTcZXQ9lO3WjIZUnebswwww6YahOOxxP5Jsi44aj7
 iBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211113; x=1777815913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JWzy2wmG/YVpmfySiB9DM04usKyzulFCXbIVFWan6xA=;
 b=jrMJStNs4GoF+tGMkZmHzi6yLZUHIyQNpSO1iaBakcoNLunHaVCV/ElRt9uijtB2GY
 9g0L5SXweKdWTARIG379TCLynra5yLa9YlgCC4e+DIprWptS0buDo39aMvRs92MojqEq
 FSt+osGQ8oI1r6UJWmassD8GXPCSXK96BmNH1n4AhgpF7ZzgBEtRhnPkHw0eIEmlmiKK
 XBrxO8Jvm4NtTbL4myUy+97q57oLOaAlSycBMUKruQhUhQApNSQfxIQCeNLTtNELlW+8
 96mvHhsdOseVGcwFot3EwB4EiZ3YvAbunJbfmAEKghaDoiCtCwTXtFQvYKV91qLJ2Ojt
 GHug==
X-Gm-Message-State: AOJu0Yx39f9iK+QRDVrY8kT5tdyyOf/S2zThMR8K4X7AtNKG+wzX9fs7
 A5WwLN1opeYo+EeI6E+yHNuLAS4KYBSo7fGpgo6dVHsGgXrmO1fYTtQ+4LvmDfb4yZc=
X-Gm-Gg: AeBDievSPBRe/lMYq16TA0FcJa1Ep4pqRXAOTWWUoQLwTZrKI7PLsjIP9/36kgZQh2g
 +l8uj+jxVknEO6wNy8bucg/WeKeBriJpZKA50Gi1gpQ4BNS523pftycLAVNb58O8qJGz8bKzEUS
 0rwxE08MH1DZ3l6vWJFfpVZ0H25tBnDVlpLyv25L3+zxPm3IPUrwGi8kPZqYtAGeiUIbL0KFDU2
 XDOKo4ekouZCSeS02ZnWGWBnykdvW73GoRoGHTiokO5v9hLY3NceR+YC0jhk6yAWGS2mHsQAS5e
 OnrdVzNQYqa4eEa7kC7mxVDUAfQimvyW+UMvPA5DUGNr+g+EVdJxfB+c2riy0ya4H38emX4T7rr
 GvbSheBUnaod2OJFnMVOt+ZKydWb2qi3IJYIBBhRZGyufj6aJ1KI60kN7g018ipWle5HatSp4bN
 jJ2iG/aZAoAOhJNbustywbBNbgFq7TC5kgjHJCs33c
X-Received: by 2002:a17:902:efc1:b0:2b4:5dff:30fd with SMTP id
 d9443c01a7336-2b5f9eb0501mr284546525ad.4.1777211111665; 
 Sun, 26 Apr 2026 06:45:11 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 45/84] fpu: Return struct from float128_unpack_raw
Date: Sun, 26 Apr 2026 23:39:22 +1000
Message-ID: <20260426134002.865628-46-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5412fd0360..a9c91fb8a4 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -646,12 +646,12 @@ static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static void QEMU_FLATTEN float128_unpack_raw(FloatParts128 *p, float128 f)
+static FloatParts128 float128_unpack_raw(float128 f)
 {
     const int f_size = float128_params.frac_size - 64;
     const int e_size = float128_params.exp_size;
 
-    *p = (FloatParts128) {
+    return (FloatParts128) {
         .cls = float_class_unclassified,
         .sign = extract64(f.high, f_size + e_size, 1),
         .exp = extract64(f.high, f_size, e_size),
@@ -1586,7 +1586,7 @@ static float64 float64r32_round_pack_canonical(FloatParts64 *p,
 static void float128_unpack_canonical(FloatParts128 *p, float128 f,
                                       float_status *s)
 {
-    float128_unpack_raw(p, f);
+    *p = float128_unpack_raw(f);
     parts128_canonicalize(p, s, &float128_params);
 }
 
@@ -4845,9 +4845,8 @@ bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
 
 float128 float128_silence_nan(float128 a, float_status *status)
 {
-    FloatParts128 p;
+    FloatParts128 p = float128_unpack_raw(a);
 
-    float128_unpack_raw(&p, a);
     frac128_shl(&p, float128_params.frac_shift);
     parts128_silence_nan(&p, status);
     frac128_shr(&p, float128_params.frac_shift);
-- 
2.43.0


