Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A4AFB44A6
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:34:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Cr-0000Gt-Qs; Fri, 24 Apr 2026 00:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Cl-00087p-CL
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:51 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Cj-00030t-8p
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:50 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7dcd9061b1aso3230550a34.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005107; x=1777609907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3n7fQN+iJBwqx2ETIvTw92Xcf+8pXw422MS+4i6nNsM=;
 b=EkJa14i6pPUh2dl/Ka0LqHrkVMuN8yncHhPwRBqpm0sRccvpbS68HNgASK/GRKKt/a
 Z/UuZ+2oaH+4bJRad1a3sUFc6srbX3gmwg6DqCJBu2jUsJ5AT2vGovjZ99i6Y2cI8fAQ
 FK1v2qeW4uhqiSsOwj8GGMqowUC0jRNXAb9bl/QSS13DPx2dXubKp3UktgVSz13CIglt
 j2HOF2RmPjWYh6jotUqP8zfU4F5QScu2SWxVaFQRP04Tbcf0Pv7vIsiMwuNNoq+ew+WL
 S3k4KQBGI/sX+tR5+858FHaicvJetnWCkiNFql5SI4hw73wSGGuZBn+XUI7Z8rB5xExA
 MS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005107; x=1777609907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3n7fQN+iJBwqx2ETIvTw92Xcf+8pXw422MS+4i6nNsM=;
 b=KgbdVegV1sP8YQinJ6oHyea0TDIsRtX2HTjE7JLIdLUtsNtHDOv4tfZWxEH8JbK4XC
 KGUyp8n7I+0Myx/0JkIQDt1UL+TX36qs7AGn6kAvpQ6XISZukF3nVAHCJtUxHfZ84pVh
 Y0jrirCfn5ArEZlLeWjWzc3RpPCE7SzFZYi4h8OXQVvc/RFP8UScEPjp6H+i0zrdI3Dl
 /+0/UMS1Y0v9Hwol9jPfqMrSo9fWlrWdQPJCHifx87gugub0VYDd/lRUsB72dLw8vJy1
 0nAtl9Avj6qiBp7YOP+xaq5iYgZd6WQ2/WFj03OZmavveKCqujmNnFeP8wCgnWRpHo+W
 psXQ==
X-Gm-Message-State: AOJu0YzqDgMRWSfIl4vS/Ug2oYSTggtzVuAX1jQWWnUkfuO+PP/bTGGW
 xWM/jRIbFULHus0P+iW92RhP0XidskRiZxqcb2r4j1EGap70ytcWOCPTGZUFaYWw/5dopQSpgTq
 HR6L3hfg=
X-Gm-Gg: AeBDiesMdtPP+7NQpVdUUxlZ+wF2FQGYxD1U8ksOowH33Kgpcmo0bS7y2CmuWi0gGd1
 t9sHJCAQI/ClQxIZLe/WF7jmd2dPh2QHy4y2bTEIGF8T/IiglyZMHp1d5EwfNrL3opO9c3B4bci
 LzMwE52k9wB0iGXRpAYodS+d6iGimr/5e0sMjOui1fQFcyxp9fGs6WXR2Z3sRmctlvh5VL34wrd
 ABdodG6CiOEnE/FeszCvNENL9KVVIZpl5tHQNmtcl7qO37yLHug/J4J7sLbpQwn7P5S5R0i2Xll
 kD+yGv04DTkE5FjYiWYQNmb+8OPhBoieGBq7uBGUBhRDJMZRvzMMRysO1OPx24xc7/uufY7PIS2
 egzRt5ugwK7zEGjORdK22HyoPSygHMPWswt62QsKkiJ0QHWPv4L/RtVRtQb3X5+r+e21sr+dLSY
 arOKcxd9HT/vvmbZn0xeihkN6n57OXqirQbIRNsHaZUsjLsK2ENrBhd/KeNtXX+0iO6I0d8Prn
X-Received: by 2002:a05:6830:82cd:b0:7dc:d0e3:5bc1 with SMTP id
 46e09a7af769-7dcd0e371efmr10508695a34.13.1777005106722; 
 Thu, 23 Apr 2026 21:31:46 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:31:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 20/40] fpu: Add conversions between float16 and float8
 formats
Date: Fri, 24 Apr 2026 14:29:54 +1000
Message-ID: <20260424043014.46305-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
 include/fpu/softfloat.h |  8 +++++++-
 fpu/softfloat.c         | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 6f86848b7e..70e25fa811 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -196,16 +196,22 @@ float128 uint128_to_float128(Int128, float_status *status);
 float8_e4m3 float4_e2m1_to_float8_e4m3(float4_e2m1, float_status *status);
 
 bfloat16 float8_e4m3_to_bfloat16(float8_e4m3, int scale, float_status *status);
+float16 float8_e4m3_to_float16(float8_e4m3, int scale, float_status *status);
 float8_e4m3 bfloat16_to_float8_e4m3(bfloat16, int scale,
                                     bool sat, float_status *status);
+float8_e4m3 float16_to_float8_e4m3(float16, int scale,
+                                   bool sat, float_status *status);
 float8_e4m3 float32_to_float8_e4m3(float32, int scale,
                                    bool sat, float_status *status);
 
 bfloat16 float8_e5m2_to_bfloat16(float8_e5m2, int scale, float_status *status);
+float16 float8_e5m2_to_float16(float8_e5m2, int scale, float_status *status);
 float8_e5m2 bfloat16_to_float8_e5m2(bfloat16, int scale,
                                     bool sat, float_status *status);
+float8_e5m2 float16_to_float8_e5m2(float16, int scale,
+                                   bool sat, float_status *status);
 float8_e5m2 float32_to_float8_e5m2(float32, int scale,
-                                    bool sat, float_status *status);
+                                   bool sat, float_status *status);
 
 /*----------------------------------------------------------------------------
 | Software half-precision conversion routines.
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index bcec7d38c8..013b6e1ee2 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2958,6 +2958,15 @@ float8_e4m3 float4_e2m1_to_float8_e4m3(float4_e2m1 a, float_status *s)
     return float8_e4m3_round_pack_canonical(&p, s, false);
 }
 
+float16 float8_e4m3_to_float16(float8_e4m3 a, int scale, float_status *s)
+{
+    FloatParts64 p;
+
+    float8_e4m3_unpack_canonical(&p, a, s);
+    parts_scalbn(&p, scale, s);
+    return float16_round_pack_canonical(&p, s);
+}
+
 bfloat16 float8_e4m3_to_bfloat16(float8_e4m3 a, int scale, float_status *s)
 {
     FloatParts64 p;
@@ -2967,6 +2976,15 @@ bfloat16 float8_e4m3_to_bfloat16(float8_e4m3 a, int scale, float_status *s)
     return bfloat16_round_pack_canonical(&p, s);
 }
 
+float16 float8_e5m2_to_float16(float8_e5m2 a, int scale, float_status *s)
+{
+    FloatParts64 p;
+
+    float8_e5m2_unpack_canonical(&p, a, s);
+    parts_scalbn(&p, scale, s);
+    return float16_round_pack_canonical(&p, s);
+}
+
 bfloat16 float8_e5m2_to_bfloat16(float8_e5m2 a, int scale, float_status *s)
 {
     FloatParts64 p;
@@ -2976,6 +2994,26 @@ bfloat16 float8_e5m2_to_bfloat16(float8_e5m2 a, int scale, float_status *s)
     return bfloat16_round_pack_canonical(&p, s);
 }
 
+float8_e4m3 float16_to_float8_e4m3(float16 a, int scale,
+                                   bool saturate, float_status *s)
+{
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    parts_scalbn(&p, scale, s);
+    return float8_e4m3_round_pack_canonical(&p, s, saturate);
+}
+
+float8_e5m2 float16_to_float8_e5m2(float16 a, int scale,
+                                   bool saturate, float_status *s)
+{
+    FloatParts64 p;
+
+    float16_unpack_canonical(&p, a, s);
+    parts_float_to_e5m2(&p, s, scale, saturate);
+    return float8_e5m2_round_pack_canonical(&p, s, saturate);
+}
+
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-- 
2.43.0


