Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D610EEA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:18:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3SZ-0000P7-Se; Tue, 21 Apr 2026 01:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Re-00083b-6j
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:51 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RZ-0006YD-FC
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:45 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-c795f096fa5so1515922a12.3
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748479; x=1777353279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3n7fQN+iJBwqx2ETIvTw92Xcf+8pXw422MS+4i6nNsM=;
 b=AwG7b1PqEY5KAEXw7my+WFv9gnV1M8AYN8ewWiw6XBBOpxCnHVIhzJo/JexnqI94c3
 dmGEmoU3Kq5hbsxbToW1Ll3T/omlcJZlP771L0d443FzKl/ZJCKMW82StoF9oILm8rad
 s25B+iLZvXh0Evh6ETu8Ow/dx43fchO6JRogIIECReg/+V1Hr5lLLFFodeKqtMuJpuQZ
 n9Mo9Gr069ujiVofgksJfVkxMA8DTryE+y7Ciq5zXI5XTLrRPxKgIT4rnYwD1JS8FKTR
 TNSIudTmJkm/PU2YlsZEVZ2TNgWu9QzXtDqfXq8akodReMcXs229JUViYgEnKxLBzhHB
 OpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748479; x=1777353279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3n7fQN+iJBwqx2ETIvTw92Xcf+8pXw422MS+4i6nNsM=;
 b=U1L0JQ3jhYNwpwBUvOpRIGTvuOF2MY10zqtE07MM2PLTzZuBXr/AcI/aOB3yqWsjlp
 vDvH5CMThDFZiLLtP7FWin+gdvtReMYRyOIBlm+nnHje4s1k53erpoZyscSkpxudC6t3
 KZR3XyiQQ4bh2axhcwVoPqY3WTB6XXtBxerE3brzt4PO0BsjcOZfq9eUufUQpwgYrO3e
 jXSNwQqN7ehRn41nupbr5epaLlfMmNckbW5X+dHK418hK8v8exzN3i1tuiOhWfeub/6N
 nQXF6l9V4esawARQQX1ecn/mmNZXH+nYVYQQ5iYZFQ9bxPcOqOQ2SJuD/b+QmqTNGQvw
 pEbg==
X-Gm-Message-State: AOJu0YxBzwS/Wghbgb2hxI4SaqGanCUzGseZxufN60npCsVdviRPcKCq
 YSbgFWgjnWza7mccECsKAiI1HXcoq/YZt/NPI4MJxjwx0fr65w3XwgKyhqQDzWpM4p0=
X-Gm-Gg: AeBDievbYAqRvol9G8iIAI9YCPOBsZLlaJhHt4wWU5kjBd5f1frKyxM9Vh84jxGrRp0
 7WkJEZDSD9sV5kFDepfRVbH1VDrsleoWx7JONTvOj/KN1p3orDMJAnirbcV4GqpE/0CXPlVdEa2
 9QmanisLCzOh0sG1GbviF/26bMzY5EdmwR9gqve+jlUsEpEAkDZ4jZRKrTCXP8NUc7h6Rel3JXt
 6aDIyKxzRBCZLxz+DpxE04Zb+2RWJZ+UtT5YhvamSje1TxvxV60s7T8G6TR37xE5tmRpqKRCqf5
 pdVqdmRSKVgoIinrMXnDO9vIw0RZPOJ6acripQR5aeocXe/j+YixA5mei30BByL3xu+FBv0WXa1
 gaby/H17gVuN01dfEgcuyDVt8gDGzHTaz5KU59WqZGwLvq7Fr085N4PwgA+adf9orybpbZLUeii
 +NsbtrJ8xQns9CqGhyPDHovchfXgRUZ2pckOtVdbi7
X-Received: by 2002:a17:90a:d40d:b0:35b:e5ce:73bb with SMTP id
 98e67ed59e1d1-361403d61d5mr16697701a91.1.1776748479388; 
 Mon, 20 Apr 2026 22:14:39 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/37] fpu: Add conversions between float16 and float8 formats
Date: Tue, 21 Apr 2026 15:13:29 +1000
Message-ID: <20260421051346.41106-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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


