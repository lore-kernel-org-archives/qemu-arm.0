Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB1BCCD1A5
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 11:05:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBAAQ-0001jj-AZ; Tue, 21 Oct 2025 07:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBAAM-0001il-BP
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 07:04:34 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBAAK-0003GK-Bf
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 07:04:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47114a40161so11604965e9.3
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761044669; x=1761649469; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8vv9/PEKtlnIDMF7ULGPxN0cdBSG0BVV0CmxG/jvMKQ=;
 b=V03Yuj/T7OHMHX35yeb756wRfYv7vgDo411NgOYF0t0by4kd64oShefRulMFBo+o5D
 AfBR37eQcLUREMlmRvYRil5UhOCyuuav4IgPqbAevcu1b2uqHtHphoWDSzM214LhIQOh
 VW40/VrMrl2QByTPu9DjWHIYM52ILNS6Nmfhp844zM2ml3S7lfSL0+uDJ6xFvtA2+R/q
 3pAin5vqeui0MKZX3T1X9KQMC9GbsHxqLUQqYyG8i656l6V5RxKjBoyKYIIMit8JfHuH
 LrV8XaCHTBL8MJ9og16EuvyLzoncDChs6CNcHiTmAfInsT+3cudEjx0nJUQguzK5+jlF
 pf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761044669; x=1761649469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vv9/PEKtlnIDMF7ULGPxN0cdBSG0BVV0CmxG/jvMKQ=;
 b=rgzA9gOenSfUCuhxV6XjD4NqPCIqKiwlmat5uzkhqoCjZ2h28TvWYU/BGJBA2JE6Nq
 0dIKZntrPAdox3NaurTmu95/CgGdnrsgAXM4xtQiD86M/+e2eZHsgBy+NgW2em9AnhUu
 vaZ7KjSe9VVFDS1OJA4i4I32HaW2iiKUZHs0To32ZNfY6QDPjCuc83yh0iFHJb3wgB9G
 TX3d6hI/zoMFKMxjOaahAMpbEmW/k6FLnsdhiBtyUoK36SD4ZV7IkA7DQbwPRiZV5t6L
 jdCbD3mCzKBpvq41tlpGSHmUiczj8JqNEjEE9UBl7YXMzGt0Tm8efHR27oasoTJDPWHx
 B8RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTAj26GcjobwdvX5A7TXs44OjNFMDNWd+ynD2suoCk7w4Y7Ob5UMaFtRvSzA9ONWpvSFol3aPbHw==@nongnu.org
X-Gm-Message-State: AOJu0YwX9Ou5Pq4FsVyLmYMrsc4NtHQOb5hN3XSQTFGtKvrxyt5IRH4T
 GOzJkKRUUzuY1FwhwRTMQXghmJsyZtYZwTvG/us5/zFL1n5KP29bNACFWYHCLRsk5es=
X-Gm-Gg: ASbGncuX9IZSp5PPF2xHc6VArENj6Ee8Gq28gJP3qFII1FHg8TYAjxGKuEX+2IXkhoZ
 uj7temGWVsV4DZDIbeU11wRqLFII8G4B1fxuGFrn8OX93c9hWzGKSo0nixTeJ9+EvloLtc8FPCY
 Th7ye0F3Vh9d8j4j8RRI8/NeeONaoggoCe/NjrIt4jmkliL2MgHMWigEemUr4OCXZP/xRNkh89/
 e0JjSYeKTr0wpfGUB+S/YMtlwjXEwVNWoMJh21UeVF/oWD5BoZX9g/61yMo0n3d3nrVDI0AHL5D
 UJezGDXE76renC0Cw82rmerDrn5QPTccpalseDXaGe2ZzPWZ29F84I0xezgqgdUO1puseMElXDn
 SXDg00yAvhxGfUbAf9nkkF+qf9NPOhBExQc9G5y5t3M4nu1p41angJcH2Gg1qgz2rMd/99g1vcG
 +LM1lLmhrF551pxhGJKwOQ8HFUbKF2fJ/i6dNMYB8U7YgE6g67Nw==
X-Google-Smtp-Source: AGHT+IGB+0YzsJHVRX/3U55NHWvcBKArwVcVnTolWAKZQazTpcc+LydtphPE38wdTc/ZbSViVDe04g==
X-Received: by 2002:a05:600d:420f:b0:471:131f:85b7 with SMTP id
 5b1f17b1804b1-4711787dcbdmr117863165e9.15.1761044669496; 
 Tue, 21 Oct 2025 04:04:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d26affsm13793315e9.12.2025.10.21.04.04.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 04:04:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm/aspeed: Remove ast2700fc self-aliasing
Date: Tue, 21 Oct 2025 13:04:27 +0200
Message-ID: <20251021110427.93991-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Remove pointless alias to the very same machine:

  $ qemu-system-aarch64 -M help | fgrep ast2700fc
  ast2700fc            ast2700 full core support (alias of ast2700fc)
  ast2700fc            ast2700 full core support

Fixes: a74faf35efc ("hw/arm: Introduce ASPEED AST2700 A1 full core machine")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast27x0-fc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index a61ecff3909..463dd30cc5d 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -180,7 +180,6 @@ static void ast2700fc_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->alias = "ast2700fc";
     mc->desc = "ast2700 full core support";
     mc->init = ast2700fc_init;
     mc->no_floppy = 1;
-- 
2.51.0


