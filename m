Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5678CFA753
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Nov 2025 09:35:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vMNXw-0004bD-Im; Fri, 21 Nov 2025 04:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vMNXu-0004aM-Oe
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 04:35:15 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vMNXt-00040c-Af
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 04:35:14 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42b38de7940so885383f8f.3
 for <qemu-arm@nongnu.org>; Fri, 21 Nov 2025 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763717712; x=1764322512; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lscgF91ypRxV9/SV8iyaXiAxCk048Dx6xn/+pJER6kE=;
 b=oDZ0FevemFFkOhbOWWO2b9xbMh/qwbcqYx0Yz3z235bhXumYxdPfdzvmUZ5kw7NchQ
 IOl3ej3sJ3tpGcJ4xNoUYuF+B9CI3rUrnluvtPPDMIZ8jh5gjQD4YeOTqWVmy7OhWXCX
 AJ8mYrf7hHkcf7LGkD15KMYANPhKCMzabGzQ2vsmpP70mPrLwHfqzvQHDveBNnnFZlgr
 IAV6/vJkxBiI0eJjtaGQciykvBHkvSO9+iO2t1U7SqQQO9tRZz9NpK1y+0i+tZnWpMEB
 eVNwhjUr/FATC11AJYBUuzGvtgkDlndSFz2ihfXQCURznlzirifX/omQRXgzYfRGoG+Q
 vQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763717712; x=1764322512;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lscgF91ypRxV9/SV8iyaXiAxCk048Dx6xn/+pJER6kE=;
 b=aterrZwj0F7j/2XYlskBxOrpcFaTwjT6vxpEqSmO5J6EXszkYvlIDXQ+tXEIQbMG9u
 ry3+UmYoKwj8faNO51+3IFf1QfvLMCauZ41aQDSqgmP5CTl3Em81YvbNAZy+CWtuk6DP
 BZDfubnUZ8FZqkJKPW46/SstEQ0ndvymD/HFlkTotBFEyqgetgicCu7VHJoWowIe7kIg
 kzrAuNo27d+PIrrzQvM4Cpe+uxMHQuNn7WPF4VPbY0RaK5LZ3E1KbyFuMxfpE/MvpEPp
 0/vXGwb66atHn5urh3ugESDmXdpC2fZ091UYmyJQQK2C2q04ZITsqbQ1zVEgLuFbY6F9
 sWUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYuwUHScqThwHbgrmnYRfQyfohVUrYN6YS6CFBa+FczmaB7zz4aIL3dolecVVEeSxufsFI8uNjBg==@nongnu.org
X-Gm-Message-State: AOJu0Yxo3MDWbmTlOJsEnR5rBs3xQpfZvZBpt3slFT9JgotRcTagVB1t
 RVq08svWgDWrs4cxgAPSXkrUrpcyHR7BpFbpQeZoi6zaTaDpPAlzPDBc/XCE6mnqFDM=
X-Gm-Gg: ASbGncvAOmtVtzn6HCHL2ov8ObEBF68kan5D848J/W/cOj3GfNcn5oJiXmw4+3SicPQ
 unB7IfVE5+pBh9Kp2mJo3AmSgtufJ21Lss0prdwXHQHgKfxZkoPAj7io6y0pWru2lpodQxedmt4
 NV2QDVKL0ntTL7DoE4duIoVKZVr6SQDP1W5C/KGPoXr3+Hr7x+IidTvTRCYkZgZNYEmlTHr/F99
 NlFp0KiSu4PrJ2ZUaA54HM81l2PzJFTni0rNyiFsaU63i3AQdN9TjpBj9OhcoXVea6mtfaB47hj
 OsTsgQpflwQcSvbD2Pol+0mLGBj3jeLEvTddRZVupXoKGc6goWIfY9Ymp/AdmyzU8faf8js4/jw
 T2l7nda1U5zSAipxtNzZbqnA8tZjHCzrYygxra6he5skghkZMfFjXylPyPYh2M38JKZM+A0ylLI
 1OLxB2k4gKeP4vXdOsp+0r5Lg/ILk44u28Cmf6/6mrCXGUeCNGtYv8o5VadJyK
X-Google-Smtp-Source: AGHT+IGwrnp1eKx+lCMYDkfzoWz7Aj53lG/PrYMZiv0/816IlixTS3nqNyNxnBoTzfOOi9EMY49siA==
X-Received: by 2002:a05:6000:40cc:b0:42b:4223:e63c with SMTP id
 ffacd0b85a97d-42cc1ab8944mr1545447f8f.11.1763717711814; 
 Fri, 21 Nov 2025 01:35:11 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fba201sm9965392f8f.32.2025.11.21.01.35.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Nov 2025 01:35:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/display/exynos4210_fimd: Remove duplicated definition
Date: Fri, 21 Nov 2025 10:35:09 +0100
Message-ID: <20251121093509.25088-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

FIMD_VIDWADD0_END is defined twice, keep only one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/exynos4210_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index c61e0280a7c..6b1eb43987c 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -131,7 +131,6 @@
 /* Frame buffer address registers */
 #define FIMD_VIDWADD0_START         0x00A0
 #define FIMD_VIDWADD0_END           0x00C4
-#define FIMD_VIDWADD0_END           0x00C4
 #define FIMD_VIDWADD1_START         0x00D0
 #define FIMD_VIDWADD1_END           0x00F4
 #define FIMD_VIDWADD2_START         0x0100
-- 
2.51.0


