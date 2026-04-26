Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA59DFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:53:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzkd-0000x1-5i; Sun, 26 Apr 2026 09:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjx-0000Ao-SI
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:44 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjv-0000KE-68
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b2429f98d0so54305295ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210898; x=1777815698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMksPAG3r8+VLSRLaiSYmqjI0xhM/jgzuN3RWr1+Zpg=;
 b=mL6Lp/FXRdIbe6Dp7R/cL99R40N40c2qphu/LUMvmMq/aMnc5KgDntplGteauGDQVl
 f4x+Iw2eeDvo3F8DQgR5g8AN8gD5WaY2mbTCoJzmGxXiYr9qw2BDWu3moVDNBXyI0sAZ
 ymaMmDvtZJAqSDo2Kc16JEizUMUNUdUQTReTVj3tvflAhWz3moL9s0muqVLxp+EbgWZW
 Twzl9OuMZNEbWppUmmsg0fskzYJdt8/t6B+REVA5/EkP/1hqEoeLfB3iIOqSnXejj03I
 XHvliUasX0MUTVWSv0MUd4CU63AqAYnXgUfYIciIiaYHdXXOz3/qwz3N68r/94zXcVz9
 hnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210898; x=1777815698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PMksPAG3r8+VLSRLaiSYmqjI0xhM/jgzuN3RWr1+Zpg=;
 b=Fx0+MvsyW03BlGhh30S/htCHDhDTFqB1qRi332UFk2FmXGJ9PJfe6R4YWdLZGQNzw1
 Y9jgj/lhmnKBDmoF6bY2nBTUtgxtlHSP6MWCx+1IDFD3qdN7S2yeCUnFBwjfnCSpHrd1
 wfxNSBctVesWOB531esXRximnJ+K2HTfzzwBPiSemO4QX8ThuvO6ySCrurKHYfx//BiV
 491Q+tImwIMKIYnRxjl4f+AUzyiFCZxI3dUEFVWKDx/yrrbOAakmASXdyCilfirtoPG6
 LtIB8XMmS3VXWzDqI4U72lUrDjP4lVJarFvZaxWbWWlTft1Gnxd58SqIvHw1CqaVjHSS
 CxWQ==
X-Gm-Message-State: AOJu0YxKaTxEBWoJeLGsmfyau7h1OxG2wodTw2uQBeIoUzH8wmyZq3u1
 DXUl4hL+pqqlyVvAgbWPg1ZddmU384JaHhA7k8q4tsu0G0YAAATNor4waiSpazko2zc=
X-Gm-Gg: AeBDietiodWVryL+enl/zF6HElj/7R3TmV/dItALN3dPpaEB4yv/KEGzQwu19xZnHS7
 oH3I1n1Qqq73UVljVc5OMbapcHCGeLexd0ErFEoin1t8/6adb8DzTWqJXmIrZEoFS4d3OKotvR7
 +bFcHaGmF1GNJt1/eebXn3XEV9pK3Xt6LkgVf+UYUeMXU9HNlW+2DmskCmSuQVWo21pdBuhllT7
 Q9zgfBxvXKbUbb2YLUN8J6yV3qQvJ8HXn7GsO02u3TWdExRHKcB3LqSzPlMrpk55q6L4h2oRUxY
 x3sma2bceLgrfSovwEp6ZBO96XFiymZUCnjFF4HP23ezvAeF5IvlLsGqpr8/LdXu8+sulTZr5LB
 Xit/lX873KDMlQRx4I0gZGXBT7np+2TKvAKHXpgrdYaPD+4xdqBxA0AptiYQKigQCxGKegnzFoO
 ZPo4YJ8IEpr1jEU5Bi2LQrcUiZhoZCne0nIdudIHUd
X-Received: by 2002:a17:902:bcc8:b0:2b7:af0e:5942 with SMTP id
 d9443c01a7336-2b7af0e8224mr102957755ad.26.1777210897505; 
 Sun, 26 Apr 2026 06:41:37 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 34/84] fpu: Return struct from float8_e4m3_unpack_canonical
Date: Sun, 26 Apr 2026 23:39:11 +1000
Message-ID: <20260426134002.865628-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Inline float8_e4m3_unpack_raw at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c1d0140484..c1b03f30ab 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -646,11 +646,6 @@ static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static void QEMU_FLATTEN float8_e4m3_unpack_raw(FloatParts64 *p, float8_e4m3 f)
-{
-    *p = unpack_raw64(&float8_e4m3_params, f);
-}
-
 static void QEMU_FLATTEN float8_e5m2_unpack_raw(FloatParts64 *p, float8_e5m2 f)
 {
     *p = unpack_raw64(&float8_e5m2_params, f);
@@ -1475,11 +1470,11 @@ static FloatParts64 float4_e2m1_unpack_canonical(float4_e2m1 f, float_status *s)
     return p;
 }
 
-static void float8_e4m3_unpack_canonical(FloatParts64 *p, float8_e4m3 f,
-                                         float_status *s)
+static FloatParts64 float8_e4m3_unpack_canonical(float8_e4m3 f, float_status *s)
 {
-    float8_e4m3_unpack_raw(p, f);
-    parts64_canonicalize(p, s, &float8_e4m3_params);
+    FloatParts64 p = unpack_raw64(&float8_e4m3_params, f);
+    parts64_canonicalize(&p, s, &float8_e4m3_params);
+    return p;
 }
 
 static void float8_e5m2_unpack_canonical(FloatParts64 *p, float8_e5m2 f,
@@ -2701,9 +2696,7 @@ float8_e4m3 float4_e2m1_to_float8_e4m3(float4_e2m1 a, float_status *s)
 
 bfloat16 float8_e4m3_to_bfloat16(float8_e4m3 a, float_status *s)
 {
-    FloatParts64 p;
-
-    float8_e4m3_unpack_canonical(&p, a, s);
+    FloatParts64 p = float8_e4m3_unpack_canonical(a, s);
     parts64_float_to_float(&p, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
-- 
2.43.0


