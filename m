Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B744FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:48:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGznO-0005RC-IA; Sun, 26 Apr 2026 09:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznL-0005If-EY
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznJ-0001GI-HK
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:11 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b23fcf90b2so89126155ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211108; x=1777815908; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QysjQPlG+quCcTNk8MlI/u+wQMnFH+nnF7tjS6d1GzM=;
 b=L7lnjkT965UddlrqWDViZH97Bw43vt1Bu2CR9pQTCGbO9H71TdMmwAHfxB2gAxghji
 6D2pLsFSn2Jh5YEdQnCU2gc/YF9o3rcLfFiJAWrguNxNj2yPVb7TfeLYLZPPaBVngtjW
 oxO3nVlTxzW9iPUlRyxf4TQRwacwxTbox8QFuSHUTYTg8zdRsqvgDG2uB/IExZzmfOeU
 6hTUgRzqcHPXB4xpMdTlZhrjz0KnDK/fXY133JPR/8DbAO02z61kHzeXPoAajUBY0NUM
 0OtBigrDa4gVMkkR23rxPEnYe7M4/rV7I0C85kdGVneiMcYnOHlKspBJUDUasUVRekxe
 nPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211108; x=1777815908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QysjQPlG+quCcTNk8MlI/u+wQMnFH+nnF7tjS6d1GzM=;
 b=l49wwqbI5342Bz9rfcEkKiY3cIwTamMBGgFej46jbHpqWqFa871U6yMTe+UeEUscqh
 eO2yILURFd8w3WbUaUcdMkdhMSqeR4hvyHQu/WmV32nOp2H6c0EvwRPsKYUMjfZxFXPO
 7LwGcP5NUl+y3WukCmQzoDT9L6RSybSr+julczzB/djpj4eZV3I0uj4eGaLxnECCaKrU
 d1mMrNY76xpYmGNUuw8VrLTVFSdgaRd4aSJrBZUtZQ9BidSajIF2BluwKclABzFQ5yYM
 9Lv4YCCUU8obNfcb9BuAVWm8uJF0gTzrHJfyro5AeWUMQ6HSNyshP8YkXMqDIGY73B7O
 3Ghw==
X-Gm-Message-State: AOJu0YyZHED5g2fhTUsyFjd0a0rtAARf4nJSk9mENI+yHPQ1Vc8K3ksN
 VrWl1SshaWkFJ1nmzKImckEyWU4wtPxCkDp+ucPae9XQgyJzVZ+n1X0JxyuUTMlov3LiN5AJVlG
 0ObEjN8M=
X-Gm-Gg: AeBDies4qepOpqYaQ/bvevGS+sj2eSufUMP2WzOR176Vg99H947uvcMPDWlvPGlgsSf
 mTahKH35L1jxWdbUdB+CHWwIijabSSBlo4jNYzx+PBOT8bD+9jOa0LHidUy+Qn1pbac6pohWuLl
 B+mw+hs3NRhAWhl1WjK3dmRtt78M4l38pj3eiBmidB4imcPTrckrrMmIIZlJJibvmRNwdjZqIHy
 Dtz45g4aVxoiR4JzXsT09qu8vp0YSfP/2dJ2TsUMopmlxRTZDAQ2594elzMofziGqciiO1Tjxa+
 VLta7GODQ4CE9j0bVc7o4fJX/GhWwOUM/SS+B9G8+6o6nUqv67y1xk6g/2bezIZpejfCC2DINkA
 kknO8YCkQhUFDdFsvdh+sRvzsY8l23IEROamchx1FxEZTvvLSRndTYZIlp4Zglq5/wu0df5emeq
 wbWpyrk2QqnV/GCzUD8Esik+xmI/IiYOjCvL5fFG8y
X-Received: by 2002:a17:903:b06:b0:2b2:5491:e32b with SMTP id
 d9443c01a7336-2b5f9f2bd43mr407843025ad.23.1777211107991; 
 Sun, 26 Apr 2026 06:45:07 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 44/84] fpu: Inline floatx80_unpack_raw into only caller
Date: Sun, 26 Apr 2026 23:39:21 +1000
Message-ID: <20260426134002.865628-45-richard.henderson@linaro.org>
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
 fpu/softfloat.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b3208c1891..5412fd0360 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -646,16 +646,6 @@ static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static void QEMU_FLATTEN floatx80_unpack_raw(FloatParts128 *p, floatx80 f)
-{
-    *p = (FloatParts128) {
-        .cls = float_class_unclassified,
-        .sign = extract32(f.high, 15, 1),
-        .exp = extract32(f.high, 0, 15),
-        .frac_hi = f.low
-    };
-}
-
 static void QEMU_FLATTEN float128_unpack_raw(FloatParts128 *p, float128 f)
 {
     const int f_size = float128_params.frac_size - 64;
@@ -1626,7 +1616,12 @@ static bool floatx80_unpack_canonical(FloatParts128 *p, floatx80 f,
         return false;
     }
 
-    floatx80_unpack_raw(p, f);
+    *p = (FloatParts128) {
+        .cls = float_class_unclassified,
+        .sign = extract32(f.high, 15, 1),
+        .exp = extract32(f.high, 0, 15),
+        .frac_hi = f.low
+    };
 
     if (likely(p->exp != floatx80_params[floatx80_precision_x].exp_max)) {
         parts128_canonicalize(p, s, &floatx80_params[floatx80_precision_x]);
-- 
2.43.0


