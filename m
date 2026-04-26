Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B919BFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:47:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjl-0008LP-0H; Sun, 26 Apr 2026 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjj-0008Jl-B8
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:27 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjh-0000Dn-Rk
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2ad9516a653so46570795ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210884; x=1777815684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uX4W4f3ESISb9ujW2ooHyoaGSdD4F+8cVRxxDBse7J4=;
 b=DOGryLiBpFG/vILCGL7BiwtAdR6f9Akc2qMda4KynmlywHlF55oAMPzR7UWt1HF5sL
 u+hhKHLQMZqFnPivCPHRXx9FxmOvb+EOQXcYBp4yRvgqrjVMANY1BljDQGpPQZOxwHfS
 qDUnsYqvH6RlG06HNkRLAoPvekeQm1Q2THVT+qrqX3R2LJFw9FpLybigWQBLpjUSOkK7
 UGSnh9o3HcIsjobhLvtSixo4mz429/EBa6hWdy4oQiELos0Eg1Zdp9pqVSEAYRe5VmEd
 KZsFuYEx71LmbZzHmcY+MTlko/tax6Ck1UnikXK4BD2dE9rO6Z2F7OdHyGqlnsAytzoY
 Y0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210884; x=1777815684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uX4W4f3ESISb9ujW2ooHyoaGSdD4F+8cVRxxDBse7J4=;
 b=KN6yZxtMmvslPAS2MWRTngtWymTkfzT/jmUqBcaSGfS9CROPBHD7sVuXhn41f80o5W
 qmlbmWViEHWJMOoI0M43I+uvOkLlNCVYa7MBjkUdsDXTxrsjZrr85WNjdhgdFMiJOFGf
 P6Ei/HaNahnjq6fTSRJI/YgcFWNDt2OaOhQolnBrykuSW7749CDyzgTIL2fAJwM3nbla
 PnKG+PUFZdUrpayxZRCcOQg7GI/gya0UKrG/hk2SsEX+FTMvkdULVaKB5uJxwbQKOLfR
 16/TQqOHlhwcegrEErKIQyunOG/xwz7uNQvkSnpTOisajailDVGWHM9ORGoqN0D7zVpC
 xnFw==
X-Gm-Message-State: AOJu0YwnqkcxZGV7XD1nn0YQacQOkfSED/8EQUiwj1rkmwjRMRFr6VF6
 pw0Qkfb0R7ZXnn6j52ST6hw9UE91uuoUimOpxr6tHVrp5B1LjnDMdo85kGnS+BymtO1iV9LSR/x
 CZjTK+88=
X-Gm-Gg: AeBDievSeDF5OGHNN/VsJJyk7QGG7r5V145SKkjLw7c9nuzi8jwR8PGA4Ch2e8CTPcV
 VTJaL50R8Zn37HhwSYUrQAtVjTwNmbLbRqn6Yf1Lr2c4SjhDVJQU1hsXrItUUnm8v4BcGQ0xoIA
 NUDPodNxLMFZJ9a31AwIhTdlI4BKHa9X8Ed9zXGStk6zj+cwHHdVzGcoP2tYcKy5Sj4wo48J4MG
 DzY9hT25g0d43cNuhmGj8LeCdU9IwjuHCOogaRp+sKdwSAbITW2xtY5t2VDQGdiXOG2/AzGYZw0
 RYMqxiGsPLtFYK5VQ2g+Q4zajL/eJNdg+QnpafZIw+9xw13YwhUqbt2PcNr+7UXBwsK3/nFXPwV
 b+orTPN5QqDJAajEg9Iq0yMlxuMkR1oekwGWgZmGUCY5nTm0l1h40CKsmgvjvgfUCBSOnWNxxsD
 5QXOpEYk+M4C6fduhc8G8YS+K8OIjEPBwNFjpeOte7
X-Received: by 2002:a17:902:e546:b0:2b2:490c:410e with SMTP id
 d9443c01a7336-2b5f9e5db09mr379567365ad.7.1777210884458; 
 Sun, 26 Apr 2026 06:41:24 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 29/84] fpu: Drop PARTS_GENERIC_64_128{_256}
Date: Sun, 26 Apr 2026 23:39:06 +1000
Message-ID: <20260426134002.865628-30-richard.henderson@linaro.org>
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

These macros are no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b1c2f884fc..d077e8da69 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -770,15 +770,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
 *----------------------------------------------------------------------------*/
 #include "softfloat-specialize.c.inc"
 
-#define PARTS_GENERIC_64_128(NAME, P) \
-    _Generic((P), FloatParts64 *: parts64_##NAME, \
-                  FloatParts128 *: parts128_##NAME)
-
-#define PARTS_GENERIC_64_128_256(NAME, P) \
-    _Generic((P), FloatParts64 *: parts64_##NAME, \
-                  FloatParts128 *: parts128_##NAME, \
-                  FloatParts256 *: parts256_##NAME)
-
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
-- 
2.43.0


