Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F410CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 16:33:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waFg5-0006eq-G3; Thu, 18 Jun 2026 12:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg2-0006cj-Nf
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:15 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg0-0006Kt-WD
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso7452395e9.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781800391; x=1782405191; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qRghoEzzaqnT/q55wrmtp243bhaPoBJCEWZUBRS8v6M=;
 b=hQ+th3iNhKwTMtfQeZi9OnR3+/VuXKl7kijG0EJAu252BP0/Km0J1D8qiZgFdE1ddj
 ziWhh2qIHvGOQ5N0SJ9i2VE5yvHfB3E2MBx7MUbauZmJVa8nViPgs41GWRGZaqqJf+4U
 sIYCF3XEEU10GuKw9WG15Siro85AnzHG8yCZZuWdQx6G4f/AYdbuTTGXHTfxSZ4Dg+2t
 LsaPisRukLaI1s0S+4cQMSHrZEa01tvSHugsh+XAh4dAZ6BXPm1zv5e+nlUauhWXavg0
 jtiK/UdmS+gIBHgGMVAZ8KG7Kts1pstkh5w161PpYn5MYjvY+ZJr+kjArHKeLn0fZ6aE
 I+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781800391; x=1782405191;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qRghoEzzaqnT/q55wrmtp243bhaPoBJCEWZUBRS8v6M=;
 b=cEYZUxncHnx9wdJCyu9CccrH4LkC9vI5zyX8UCrsbQ8WvSj3Z/yxJnaZ0CCsjc9qmQ
 xsuX6QGuBQgAPWhKqG7XERwBIWrW1CIWLav/98MLjGGZdUWJQuqSA29xZtSzz5CXEmSq
 GT9xwm0DpgYdSl+9ySy/+MvHjhMWH1VZdemQ/CGyHdxz+UwTEdPEDwz/I4M2FiARTuLd
 u7BtSeuRmXHC2XvtzFj4To0/NwoakReJlDW3YjLrmqrWLVVZHltHTxGKQS7a3SPKu1IP
 ilnIAGocOlZcfyK2KhSlqM1EY0t6FoKbwkDpHNg4DpdHl2B+p4m98FP0LJ3PnKXlvfKQ
 KrhQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Z4CzmdxtNk1vRfntGOlCZUGR84CofJyXG7lSjii+g63M/PE/Ou5EqoIQkJ3mdZL2oJ65UVovnlw==@nongnu.org
X-Gm-Message-State: AOJu0Yx9YVjSzK4FtUgjuWp754FUyZx+eS7vb5TDKfJyfBe8H2HA7RnF
 WUxLAgcxZJzyLk6Sg9cRv/nS+WPkFy9I/8etPhMjD7mFNMz+z9hhXZv4XS142DZ+lkc=
X-Gm-Gg: AfdE7ck99/BHXG2w+3BnerQ+Be4i+D3bD1pXGcUKyZTbIlkMCiVZGbhBUXiwlB0n9x6
 rbbDKKun3zPQG3uXkE0iZNIb/fb9lTEWDMgNEbsnYEN/CXC6FUC0/R+HWK/U4HoZYWdz1SG6AhR
 o/QvMcr+HPgwTigZk6g+EUS0v84Qg0fA225HvuxTDPDhNsH81UjAaPMUQqLb/IkDq/FUCHMNJ7X
 EnZSEEgvkV4jaPLmvbGBRjhMnI96LlFVqFE+LATfTXYG5tH/p1hBV3P36pnscDNTR9qJt42DISi
 J72LhXgtEoCHBmSzmzDbljMjakZYZ8WQXKdJscLsLrYPKSfSJx45lUPiGssTi3y19zMC3EFF7dw
 aP2XnZ55cdG1ZaJ1tMkH2F8wQILHloigI9PRAqspAkgCEisDcFt9MkRAoLXTyeTyTb+1/1fB099
 Bznd8dEOwaIXYxrQ==
X-Received: by 2002:a05:600c:19ca:b0:492:324d:e93f with SMTP id
 5b1f17b1804b1-4923fc77b19mr2072525e9.36.1781800391210; 
 Thu, 18 Jun 2026 09:33:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:b52:6a9:569d:e33e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc426e1sm26942f8f.29.2026.06.18.09.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 09:33:10 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v3 0/6] target/arm: Add aarch64 GPC3 bypass windows
Date: Thu, 18 Jun 2026 17:33:03 +0100
Message-Id: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8dNGoC/23MSw6CMBSF4a2QO7amD1qoI/dhHOBtCzVKSWsaD
 WHvFiaGxOE5yffPkGz0NsGpmiHa7JMPYxniUAEO3dhb4k3ZwClXVPKW3J8dkn5CcSOsbZw2DTp
 qDBQwRev8e4tdrmUPPr1C/GztzNb3byYzQokRNdYKJVXanR9+7GI4htjD2sn8ZxUVO8uLZUyiZ
 FoorfjOLsvyBRF5El3hAAAA
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x336.google.com
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

Adds the GPC bypass windows defined in D9.2 of the Arm ARM. D9.8 (the 
APAS instruction) is not implemented yet.

A large part of this is testing. To test GPC effectively, we need to
check that memory accesses are causing exceptions, or not causing exceptions
as appropriate. For some tests, boot.S is altered to record certain
exceptions and continue executing the test. An alternative would be
to use gdbstub to break on locations inside the vector table and continue,
but this requires significant coordination between the C test binary and
Python test driver, so has been avoided for now.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
Changes in v3:
- ptw.c: Simplified GPC address checks
- boot.S: Renamed 'ALT' to 'LOGGING' to better reflect its intended use,
  types and sizes for exported symbols
- A few formatting fixes
- Link to v2: https://lore.kernel.org/qemu-devel/20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org

Changes in v2:
- ptw.c changes have been rewritten after a number of faults were found
- boot.S: Align exception_log to page
- target/arm/helper.c: flush all caches and remove redundant mask
- Switch on of GPC3 moved after feature implementation
- Link to v1: https://lore.kernel.org/qemu-devel/20260528-jmac-gpc3b-v1-0-d34c46c5069f@linaro.org

---
Jim MacArthur (6):
      target/arm/tcg/cpu64.c: Extra test for GPC3.
      target/arm: Setup new registers for GPC3
      target/arm/ptw.c: Add Granule Bypass Windows
      target/arm/cpu-features.h: x-rme now means GPC3
      tests/tcg/aarch64/system: Alternative boot object for exception logging
      tests/tcg/aarch64/system/gpc-test.c: Basic test for granule protection check

 target/arm/cpu-features.h                 |   5 +
 target/arm/cpu.h                          |   7 ++
 target/arm/helper.c                       |  19 ++++
 target/arm/ptw.c                          |  77 ++++++++++++++
 target/arm/tcg/cpu64.c                    |   4 +-
 tests/tcg/aarch64/Makefile.softmmu-target |  22 +++-
 tests/tcg/aarch64/system/boot.S           |  65 ++++++++++++
 tests/tcg/aarch64/system/boot.h           |  14 +++
 tests/tcg/aarch64/system/gpc-test.c       | 165 ++++++++++++++++++++++++++++++
 9 files changed, 371 insertions(+), 7 deletions(-)
---
base-commit: b0df6e2f2c6c45df8d4d286933799c623e124d98
change-id: 20260528-jmac-gpc3b-187f9d7cf0dd

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


