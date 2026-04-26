Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E8FFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:53:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpY-0008B3-KQ; Sun, 26 Apr 2026 09:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoX-00067s-LP
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:29 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoV-0001dz-Vo
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:25 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so70773685ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211182; x=1777815982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hheroKdVLCGDtCk2AAibf10Z6m4QN+uSO6ssI9+89yQ=;
 b=QxKqJB7NpSJ5FPD6leC6HXRu9vw7WuAhgZktVaBzHFU2TU7dte1CFBf42dtQFUWIVi
 KNp3b4a/721aZ2L+smanaJokDgeoBvV4pWLB2uDHD8wP9rP1n3mKtSu2NsMgua671P4U
 KUFIItZfSpJWu7LQEgkJfceR4iOCQPEb/MQHFBx4oDZEvivB28KUNCubF9p5yK+KKPYb
 yNR1rKh3CPQyL6IhWY3Pkf+y0dfXgrWFd9xoM749yIZF0ClkgEfSx13z+Ogzz9dDLP5E
 pixwQp6L4UhpQX36fhS6qH89Hj/NBWKhluQsqskGvAkErqB6FRrQfcOvWVyTiZwIr63t
 i5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211182; x=1777815982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hheroKdVLCGDtCk2AAibf10Z6m4QN+uSO6ssI9+89yQ=;
 b=RT8D68xkaYXr6Wh4UizQHpp5jYNJV8DbYS3uZuXQT3WksR1PVB0rLmAf5tF58VKIbB
 xiiijEsSLlY7Qk+iBAYALFyujLaAV74Xl5uPtYmrA3VbfOExPynzIa+1/Vq25MqsHYyD
 hRR+Df74quiJ41EZ3OytoSOfNbXzZD9kMlZ29hW08eV9bBdjgqjlU8xJ6uxvTMnoyUhT
 1aCiU9xqnmGkc731aAwTEaEwNMEmqWbdhVdYlYLU/kmz3fX0C3ubBvwlfXfV3xyt3E4j
 4F5/9eijVurunsICHG0LUGOxn6Kj0oSfaON5JpQBrvky/x0NvToVraUPz+lxmRkOo02n
 l2cw==
X-Gm-Message-State: AOJu0Yzq2XqJ3fSfnvXrPau2Yjz3m8yuyLQ7Cv9SQVZLszkUc9CpY1xy
 AEXV52hHt0amyovfmMrqYPsnkBpzsQxsUFbr1Qg7ULut+1HZhPdTG3Zz2y5Bu3bZT1w=
X-Gm-Gg: AeBDieu31GZGvFUyHCmZKl+Fup9Q+9wEBFeXFhphbXKmNTL1kH21cgGuqYIIWZ3DacJ
 kpW+rzVfitN35v9jbDtF+0i3HX1cagKYvhWpmP9yG0gosB9RIrm8k+Mv0cd4eKgdcf3HZjMXOFr
 IGQvEUy/KD56zkSqFAdO2gZ5AKGSH5CGEbBTaGDiMeM7+bZXnJPKDYM07RCxLM8s0/s2FiW/fRw
 YzlYTYP4xSM4/b0QONFKvAAM+sFFdbyiTovE/CMQRhXpqfnAmhGvmQXlB316+48VAPjVD7P64j9
 cynADoWW36mO/d2CTHb9VR1bfrzYkKW+ZObR62VBC6eMzMeoiWmgMqCwYkztdneMDc6c2ohIYd0
 /K2JwMOqvdY7CLth5UinUu8HnUmfib0drjW3l5fQMlVHpwbRLaBxy1Ko7BBHukzXeL5x2LOqHJU
 +IBNdasZDs8Vpm6ODZb5KjLXByP9IxC0N0BMMOSvvr
X-Received: by 2002:a17:902:b405:b0:2b0:b7c6:4ae7 with SMTP id
 d9443c01a7336-2b5f9dba8d3mr219433885ad.1.1777211182197; 
 Sun, 26 Apr 2026 06:46:22 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 71/84] fpu: Export parts{64,128}_round_to_int
Date: Sun, 26 Apr 2026 23:39:48 +1000
Message-ID: <20260426134002.865628-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 include/fpu/softfloat-parts.h | 9 +++++++++
 fpu/softfloat-parts.c.inc     | 8 ++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/fpu/softfloat-parts.h b/include/fpu/softfloat-parts.h
index 5460f5c592..5b71809541 100644
--- a/include/fpu/softfloat-parts.h
+++ b/include/fpu/softfloat-parts.h
@@ -187,4 +187,13 @@ FloatParts128 parts128_div(const FloatParts128 *a, const FloatParts128 *b,
 void parts64_round_canonical(FloatParts64 *p, float_status *s,
                              const FloatFmt *fmt);
 
+FloatParts64 parts64_round_to_int(const FloatParts64 *a,
+                                  FloatRoundMode rmode,
+                                  int scale, float_status *s,
+                                  const FloatFmt *fmt);
+FloatParts128 parts128_round_to_int(const FloatParts128 *a,
+                                    FloatRoundMode rmode,
+                                    int scale, float_status *s,
+                                    const FloatFmt *fmt);
+
 #endif
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index cc142ff5a5..87460306f4 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1255,10 +1255,10 @@ static bool partsN(round_to_int_normal)(FloatPartsN *a, FloatRoundMode rmode,
     return true;
 }
 
-static FloatPartsN partsN(round_to_int)(const FloatPartsN *a,
-                                        FloatRoundMode rmode,
-                                        int scale, float_status *s,
-                                        const FloatFmt *fmt)
+FloatPartsN partsN(round_to_int)(const FloatPartsN *a,
+                                 FloatRoundMode rmode,
+                                 int scale, float_status *s,
+                                 const FloatFmt *fmt)
 {
     switch (a->cls) {
     case float_class_qnan:
-- 
2.43.0


