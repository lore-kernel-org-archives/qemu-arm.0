Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CE1CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 03:22:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1cYe-00008Y-AR; Wed, 24 Sep 2025 23:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1cYc-00006p-JE
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 23:22:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1cYR-00088B-9z
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 23:22:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f2ae6fadb4so425673f8f.1
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 20:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758770514; x=1759375314; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tnyi33IajyywLiwqk0hFaeDi2TC1JFPW7M4x0i1cEBo=;
 b=HpmPvyzm2dtn6AQWFN/0K99bdczyjATZSFQkNwyxO2KSzhanDysVaTDuFDMNRB9fFa
 l09xslzeiKrEaZlaxEBOHhb5qkKOPnKA8ajk4Ef4jZFaQzHl5YN7ZaIP4d8ogDGOIka/
 Hu1LkTRQt7QmSfdC7NROYwYknzW/IN7H5AQuky+49/gCydZVpB7U1DjqOEPehoijA19M
 t2RG33V0CxUb8oQKwH3uiibgnwCKSGYLfmV1tHQSPnRntDz6ROtMnBVdUsc0GMRHdLOj
 9omKBrbBoXAeEnqPYy8lSWQvJIBTW+uOLiDKc3bFZeosULkJL85ItSVGS0uXtLbCVQo4
 2QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758770514; x=1759375314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tnyi33IajyywLiwqk0hFaeDi2TC1JFPW7M4x0i1cEBo=;
 b=R+I4jOe0daM5y0IXrNlN5Z6wLUo6KVFMHsmk//m1kD1ZzzSUzXx/M2+7zUkGY5Xzim
 oi6ZkrJNgKj6/pY3izeIGWo+uEXsGStHey/suGiPpwIxQBZ3XS2IpCCxnSYTSQtK2Q96
 ijJXQHD2TctZQpwy4cKsyUQulwkOnPzwDMa2uJ9xbs9PlAxhqLNnbr3oD+rI5EcMEt3I
 XaXnMvF1s+iELtiT96+nbPw84+mn2ctz2l97isM/WwRSwY2DLUNJRUTpviwxjfABmjlV
 HjUshMT62CL1ATKNMbG+2I/9VnqpCTR5tyUVduii5Bb0dTCaxepj8R5kWoTGtWAbtNyZ
 0+OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmtr/gCU2fvpopnaSn1GTaCkNzVmsghac5taIQoxJFpkkz1DXpsGqZiV10mzfm2PIYobO1ebb61Q==@nongnu.org
X-Gm-Message-State: AOJu0YxKsRtUeBy5zvjzOgArdgD5HGhcEysTL4umSAA8u3Hj9DP2j+kq
 /3owfJZz/unjmvPHnb32v40Tmo5PKYCgSpe2VkfdiA8MxBgHtB5OAbCk1u223tNn0LY=
X-Gm-Gg: ASbGncvja8P+etoiNGvQKW5GYPXsJQ5WogrTmarjPS5NUBO8eEOJJTRmX/xrY/BAL5+
 H0Zxw+tLjbEZKW4ly+84IzgrCwpG8f6x+8oANvWhuDQiMn5K0Ew8NFRCaYKn0Df0c5tuvt4SXV1
 2UQhykt3AO7DWrIuzSZctcicqcq5tB+45IGUITJcr1QuPrAPPoMicvmj4yRrVmp72gbkXtaSdKt
 PzO98AOqn4+dTQONdkyCZnLmaqpEYwUkCYG1bK7Gz4NKWbdfPiNp6yr70p0HYB+ICG2LSnhFWaN
 olaBrD7slxfJUpZ04PitKL6I6fKmI3awuiB/p5FGCLZvd9WYps1QeR7CjGnRV1zfRA2OdMEylhq
 nBNDELinGlz4d5g1uSGuaNhnqvSF9r8WTB4QDGE5hpOYGaul95U+idwLdDAw0euZO/q3Xn6K0
X-Google-Smtp-Source: AGHT+IG1qt9WN+89+sBmkYf0GKiCUK+sf3TrtT14E/eBdQnYlFnFut1WoaFROlUm9pDjnFeWRuL5Iw==
X-Received: by 2002:a05:6000:25c3:b0:3b7:8da6:1bb4 with SMTP id
 ffacd0b85a97d-40e4accc86fmr1646939f8f.58.1758770513688; 
 Wed, 24 Sep 2025 20:21:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fac4a5e41sm1066296f8f.0.2025.09.24.20.21.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 20:21:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/arm: Replace magic GIC values by proper definitions
Date: Thu, 25 Sep 2025 05:21:51 +0200
Message-ID: <20250925032151.73250-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Prefer the FIELD_DP64() macro and self-describing GIC
definitions over magic values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c44294711f8..da8aa7b9d08 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5184,7 +5184,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     uint64_t pfr1 = GET_IDREG(&cpu->isar, ID_PFR1);
 
     if (env->gicv3state) {
-        pfr1 |= 1 << 28;
+        pfr1 = FIELD_DP64(pfr1, ID_PFR1, GIC, 1);
     }
     return pfr1;
 }
@@ -5195,7 +5195,7 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
     uint64_t pfr0 = GET_IDREG(&cpu->isar, ID_AA64PFR0);
 
     if (env->gicv3state) {
-        pfr0 |= 1 << 24;
+        pfr0 = FIELD_DP64(pfr0, ID_AA64PFR0, GIC, 1);
     }
     return pfr0;
 }
-- 
2.51.0


