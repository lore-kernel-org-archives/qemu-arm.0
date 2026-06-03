Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB48CD6E57
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 18:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUqIX-0000ZC-1Z; Wed, 03 Jun 2026 14:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIQ-0000XT-VI
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIP-0003Yj-24
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso20290085e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780511186; x=1781115986; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6RwiudhEWA7LbPZR+jTN6zMMB0hfCg8/CZoYlqSchzk=;
 b=Je7R8ZiNyVrp+ENH6TzEzcfamivmY33DqK8GsIur/o56m6IImFt2J2XuuEmxd1LS1b
 DGQ51WL7xShg1I34IsY7Fx+NQZuw1n8+GNj2fh1oeo+7ilTQ7Unrhp9SpLqSf5jg6/bH
 5LD2lNeOX/3xFu+jkHvWuIDCHelsneS8YlevSTyiMQep0OxYVjSgBfbBmA2eJsft0DKK
 QmrhC5pSGQqQpTiuKvpR6C+wOrkPdj9EH0CfyvigjgkBPng8U0xIddfR7wUdqrvzqEhm
 DExqiSL0jCxYr0oDrptnHR7GY18R9sCHTU6H2wrR934lX2pXuU3zudDtA/X3mmA9S1up
 zYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780511186; x=1781115986;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RwiudhEWA7LbPZR+jTN6zMMB0hfCg8/CZoYlqSchzk=;
 b=pW7y82fwLB1iU7JZ+ly8b9rO7+m7wL7HiFUsgZJ/C7QkU58dMlL4UNHFCDxJZ/TwzZ
 lWn1z0gs1tx2dgwr0a60nhj0irXSp0oswJrY1cBLB/sRIL0yo4S+A8HvthF2Oq5Qopyr
 HVzSwsYc+qlxhTiSXRVwsrgYXGht1QClNqZc6YtvN+85N7AV1sv8hwJrlMXc89rNI5rx
 QThLepYknxNvbgPE7PJeyVUwJpM11ikYdOLSS2XcpKyZBvkeMCcjmOp5ALrkK+1HJTRF
 C9Cuza7QADPNEvGeFPHxXYUxWLqJZQt3HH0dCpCPOPvjFa4JfyaLU7Y8N3+PxROio79S
 pljA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Elyc/A4LjP/D41NOyfiecgGriF2gL+uIa2AvIlqVKG4iCIwdynzL/XsqZc44LS1ubakJmyCe1fg==@nongnu.org
X-Gm-Message-State: AOJu0YwXk31d/+pBdpcSEiYDv8BVvVh3GWqdsldKXLxjlrlUPJtZ/AZz
 rhNal/1t09P42BjVGQBe1wMWYqRJLyBosfw6me7t8I6nmUzE8yV+qQ7fFixAyUm+ULdzaRJzqj/
 NFaST7P4=
X-Gm-Gg: Acq92OG8RZsExyJL8Cnh1KnILTKFBSI7sxz610tx1IAoCehJp0c/pbwNDc0jKFG0JN7
 mr4Xz3EseIJRFdnSfV/OceX/dyLF8vSM92qCkVAdUdXJRDrhuLiazQyCcgh9w7xfXbHY/itOwLt
 eyF4UnyBRps6Dk1ADeA/BuYIn9VqavIE8gEiO1bSS/6+2EkQIuuSm4HiPT7sZhzkYyyJdq/C3pB
 7nW6OUDUj64cGHU6c0X/8IR9jaocgjc22ibM2X8okp0d6h4wfmivZB/35qI7ta6RaOCsNvKGagV
 HovTLw+nr7R1xQ8TS77MWSREZbn4J9KLmFWUoJcJRwP6WImfR+Vn8jwMOA38aDJz96KEvjPEo4x
 4RkUGLKkm2PiIWQMRtkRnzdUpfP4N/nd55pBE4v0iZLW6D+XUhV/jfrs2aMvkOv6xPzRc59RH1q
 vaZDp6EXDJYno2bPcvefy5+wYLRrGn1qBx2x0BLQ==
X-Received: by 2002:a05:600c:c84:b0:490:389:7644 with SMTP id
 5b1f17b1804b1-490b5fe0e36mr76438755e9.17.1780511185963; 
 Wed, 03 Jun 2026 11:26:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:d530:6a6b:58a7:e220])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm9793127f8f.13.2026.06.03.11.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 11:26:25 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v2 0/6] target/arm: Add aarch64 GPC3 bypass windows
Date: Wed, 03 Jun 2026 19:26:19 +0100
Message-Id: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxxIGoC/23MSw7CIBSF4a00dywGaEsfI/dhOkBevUahAUM0D
 XsXO3b4n+R8OyQT0SSYmx2iyZgw+Br81IBapXeGoK4NnHJBez6S+1Mq4jbV3ggbBzvpQVmqNdT
 DFo3F94Fdl9orpleIn8PO7Lf+ZTIjlOi2U51QPRWTvTzQyxjOITpYSilfR9nlxKUAAAA=
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x334.google.com
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
 target/arm/ptw.c                          |  81 +++++++++++++++
 target/arm/tcg/cpu64.c                    |   4 +-
 tests/tcg/aarch64/Makefile.softmmu-target |  22 +++-
 tests/tcg/aarch64/system/boot.S           |  62 +++++++++++
 tests/tcg/aarch64/system/boot.h           |  14 +++
 tests/tcg/aarch64/system/gpc-test.c       | 165 ++++++++++++++++++++++++++++++
 9 files changed, 372 insertions(+), 7 deletions(-)
---
base-commit: 405c32d2b18a683ba36301351af75125d9afda08
change-id: 20260528-jmac-gpc3b-187f9d7cf0dd

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


