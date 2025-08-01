Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D442EC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 23:32:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhzC9-0004a4-8y; Fri, 01 Aug 2025 19:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8y-0007ZO-No
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:33 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8t-0005yo-R7
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-31f28d0495fso2806842a91.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 16:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090786; x=1754695586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7GETELPD3VGF6/REM63Q115JGqnxMS395y7OJ9SbQ4=;
 b=UtbeL64Q4oEwONbZrVuq/W3RUvdtptWnpoxfcocB/uWZ0nH7eeFWEf42whHT0eDZvx
 PMpAZ7FLjQV8evWj1MNYLAHkJOiYCQf9AiQG2zd0YUt+K2SIcQlgR4dgyDYNzGSY+f+X
 K9sVorIkMcLhK0oN+wLur9Yx19FGdx1KFq3kgNcTUALyDppvFHO4UVwZmaQqYSqpK43I
 qRuv8x1jv1djMz0WJLrK6NPhMp8rIPzV9QFBRoyHyVSVATD6mjA9DdTcLkp29Uat0p40
 Y3t58In4CLoF9042gBVQEz+lSfCVF+N3JtWZIcY7db7j2G8CDxQYnj8hA0ciLFPC5biL
 ZMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090786; x=1754695586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N7GETELPD3VGF6/REM63Q115JGqnxMS395y7OJ9SbQ4=;
 b=sJ8mcdjoCyjIhegFcYbAuBe3wPlCw+bWTD0QzPpvxrmsIeOMFJb9ANWfG/cEoCkaX5
 GU/bWljifCLpSYXM5YNS5ECdhCKqxfpDexE4+MMiikm59FH3YNIs9qQZnPN1CANevwR6
 YupoHy1U0HzZ9/EeLBgucJK6AUxUzghZV1+cvpgBt2OPHb0I6Iv12xZwde2YD5Pzfp7Y
 ic2MCqDoQg4sH5Kee83lO3pyGy5G3S71TRUpvnjgL+xWXmOiGhIgVw5wiuWZyWFhrxas
 GKiQUbr5BW/DLlv6hZ9dJUXBq8ECf96jcwICdjyjXwGKlph0v9mr2fZEuwadZ7V/THLs
 lgEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbDyjRnQ4q807qw79TIR1phQE+jwLgEy8XQFK0bPXctupnMai8WhIsfXbTnxCqHZejMpzCmhQaSw==@nongnu.org
X-Gm-Message-State: AOJu0YyYhTRtzzI6csxulzlbYGO2hajiXN1QfGSOI+fgkCd6WFiNRJE+
 1ElUgZSjyLSWJzTSF/1k6eAFmR+SntZnt7RWYV6Qb8eSmPrnXGW2IZA/Tx3iFRVhboE=
X-Gm-Gg: ASbGnctijZJYs6Jcogh+REwc6uTYRW1+ZGYpwJLXwgnbv7Mg2XBBBr+dw3aVrpb11wo
 QMnpfRl+hqrxCozd8JNuUstZUIsEUhbiW8PaR8wzChqSf8lJQ9VlXSQLBJh1/37gooHsx8eU9Oe
 YehV4CWknT33fUAX53YXG4dx4IxVpOfX545eIqOY2qyjd+VU9FJfrgtADstcv9JiGiVsivKStNW
 RlqewjtFkMbLjWVoygnK3/ox4Pic2Py9kDHxNBxkvvEuXVXNqqPc7xUlwAOVPam0kkyCPRWM7ZS
 t06XuUMjSCub+OviXnNGUuHensieEPdDtLLM6MQDxw0axg9S1Bp3wB49E6Xjl6Xf7dsL2VO9P8n
 9q+SAXgvqtnTNGS4e9gbJm/y59bx1oKHI
X-Google-Smtp-Source: AGHT+IH2af2WInt5f2Qq+AzuMxiJX5IfdBZc7F36cB9L/iI/rwfU7tZ/q2Wk1+nFJgN4BKGnIZSH2g==
X-Received: by 2002:a17:90b:390f:b0:313:176b:3d4b with SMTP id
 98e67ed59e1d1-321162c8d4cmr1720581a91.22.1754090786452; 
 Fri, 01 Aug 2025 16:26:26 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 11/11] semihosting/arm-compat-semi: compile once in system
 and per target for user mode
Date: Fri,  1 Aug 2025 16:26:09 -0700
Message-ID: <20250801232609.2744557-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1033.google.com
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

We don't have any target dependency left in system mode, so we can
compile once.

User mode depends on qemu.h, which is duplicated between linux and bsd,
so we can't easily compile it once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index bb0db323937..99f10e2e2bb 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -12,9 +12,10 @@ system_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'stubs-system.c',
 ))
 system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+  if_true: files('arm-compat-semi.c'),
   if_false: files('arm-compat-semi-stub.c'))
 
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_USER_ONLY'],
                 if_true: files('syscalls.c'))
-specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
+specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING', 'CONFIG_USER_ONLY'],
 		if_true: files('arm-compat-semi.c'))
-- 
2.47.2


