Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1026332lfh;
        Wed, 25 May 2022 09:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySh5zx5VP2HeHYbpufhblctbYBzIg7RvCZraT9ZXJx6j3TwR/1LD7fYuP7QO6C9qEk/IUs
X-Received: by 2002:a05:6214:1cc4:b0:435:b8a0:1fe9 with SMTP id g4-20020a0562141cc400b00435b8a01fe9mr27012057qvd.54.1653495136002;
        Wed, 25 May 2022 09:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495135; cv=none;
        d=google.com; s=arc-20160816;
        b=fOT/yo+nzVZnHhqEvPhBEaf7Efu0lRFBsnlTo5owuUtq9XHfaQsB0ZeAaTKrIUJ5wj
         54RNaG1avoC0niHekyCD7Q6NqsbA+M3x+JrIKMJZiifjTqy5j7NS3cJ7KFwh5CHTFuen
         pEvz4VNVFblOCHIcUGTUHvkJW14qBnHmWH3316X5LFOyfxnhtGTOx/NRsBOFlmL5/EHu
         P+jNQtiVIk+OuXrEJ6mdzSeOY+e3fLZgT3X8myCihghkozvOM3aiUUi97Y9LU454Gyts
         nz4F8F7ih2z8bKoNa7Rbj4QVvEXuGCQT25F9GFrSDbZx2aJurQ7ZynikS3Ccr7VHKd3p
         DkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=UJ0GSrS4ifBwWpI4AZRP2pLMFxYHP36IIRhK1yH1Yqs=;
        b=r8jjdQB5fDRXsXyx1TclWtwQQZLBie6+fF9IK7cBjtg/MPWi9kRxM3QBgu7H2y4uSs
         +yuMe1U7MnniDGnxQex0vmJr+lyxRJrEOy8n1xEa4dMy6CeDqCUOVmxh4p2HYXP5Ro+U
         HQ+H9VXJ99cvPESt1hQ9rI6vCDVs362Y/Jf5/yX6HLjkIuqxOpRR1JWVvq5I3537BdME
         a0GSwFqFUkALFs6gW7MQySzIzuqt5RO7YfsNXIkyR5RA77IuQR+OhQiPjFmlyB7DSqEe
         nxVXs7gNu/oChiZCgoaS+151mTf7LlET5l9Rqo3pYPUbQESFdGU8g4TG0PK8Qs/aDjbk
         fHFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n76-20020a37404f000000b006a35fe2cb75si1283176qka.489.2022.05.25.09.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttcJ-0001bZ-V1
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSM-00073F-MZ; Wed, 25 May 2022 12:01:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:37653
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSK-00048Q-Jp; Wed, 25 May 2022 12:01:54 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRB5Ytjz4xZv;
 Thu, 26 May 2022 02:01:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bR913zDz4xXj;
 Thu, 26 May 2022 02:01:40 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/15] aspeed queue
Date: Wed, 25 May 2022 18:01:21 +0200
Message-Id: <20220525160136.556277-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P+w20qGxfXsY

The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:

  Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220525

for you to fetch changes up to 52bcd997800fab67d57bea6d93e368f6f7a93b24:

  hw/arm/aspeed: Add i2c devices for AST2600 EVB (2022-05-25 16:22:37 +0200)

----------------------------------------------------------------
aspeed queue:

* Aspeed GPIO model extensions
* GPIO support for the Aspeed AST1030 SoC
* New fby35 machine (AST2600 based)
* Extra unit tests for the GPIO and SMC models
* Initialization of all UART with serial devices
* AST2600 EVB and Documentation update

----------------------------------------------------------------
Cédric Le Goater (1):
      aspeed: Introduce a get_irq AspeedSoCClass method

Howard Chiu (1):
      hw/arm/aspeed: Add i2c devices for AST2600 EVB

Iris Chen (1):
      hw: m25p80: allow write_enable latch get/set

Jamin Lin (5):
      docs: add minibmc section in aspeed document
      hw/gpio Add GPIO read/write trace event.
      hw/gpio: Add ASPEED GPIO model for AST1030
      hw/gpio support GPIO index mode for write operation.
      hw/gpio: replace HWADDR_PRIx with PRIx64

Peter Delevoryas (7):
      hw/arm/aspeed: Add fby35 machine type
      docs: aspeed: Add fby35 board
      hw: aspeed: Add missing UART's
      hw: aspeed: Add uarts_num SoC attribute
      hw: aspeed: Ensure AST1030 respects uart-default
      hw: aspeed: Introduce common UART init function
      hw: aspeed: Init all UART's with serial devices

 docs/system/arm/aspeed.rst     |  62 ++++++++++
 include/hw/arm/aspeed_soc.h    |  13 +++
 include/hw/gpio/aspeed_gpio.h  |  16 ++-
 tests/qtest/libqtest.h         |  22 ++++
 hw/arm/aspeed.c                |  74 +++++++++++-
 hw/arm/aspeed_ast10x0.c        |  48 ++++++--
 hw/arm/aspeed_ast2600.c        |  32 +++--
 hw/arm/aspeed_soc.c            |  46 ++++++--
 hw/block/m25p80.c              |   1 +
 hw/gpio/aspeed_gpio.c          | 257 ++++++++++++++++++++++++++++++++++++++---
 tests/qtest/aspeed_gpio-test.c |  40 ++-----
 tests/qtest/aspeed_smc-test.c  |  43 +++++++
 tests/qtest/libqtest.c         |  24 ++++
 hw/gpio/trace-events           |   4 +
 14 files changed, 607 insertions(+), 75 deletions(-)
