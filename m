Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp69189lfp;
        Wed, 13 Jul 2022 00:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u17LSu8SVhKVPKS8xJ5Jjz2fxDwwuE+SpE+7SNnuTWrFKgdrBxFuFrGq31kKRT4ecaLONL
X-Received: by 2002:a05:620a:439c:b0:6b5:93c5:64b2 with SMTP id a28-20020a05620a439c00b006b593c564b2mr1481092qkp.398.1657698848107;
        Wed, 13 Jul 2022 00:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657698848; cv=none;
        d=google.com; s=arc-20160816;
        b=PK9swbiwsdmpBDI6zvCSXYc9hdvNANgkZqj4PKDGF/3kOc/FiXUpDQl6I2/PQm20Pi
         xFXP9O2L8r1bhLfZAW3XoamBBKjN32BUmygMPtXyn6yF3PVMnFLGtlthGHN4OoYtpUnV
         QPiNst/QtGOTsLeun3OFucg3c5A8U+Gdx2rNS++4qpU1NzZCk2ChMv9k0PrpAkSReS1D
         /NKS0fDqh6gsYy01zSr+mH06Ciw88xZPdBikg3GpsgwzDVTQ7ly9VZ0BRfIoDhnbSiww
         BDb0L1BNCriKWMekfNwjS5nMCPEWGoHp9SqdO9qroo6YwygyzkH2KDcLvhNq2C0ovBng
         8qNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=Qfa0lsOlJ3V6eRspH0XznFMC5sfjUfp7Tbau5sqEt+U=;
        b=veLVa0mMmRd7iljo5WcRYQF5ItznIfRUoUCCvia+SziMJLcxARXxBym0mREvFSoFPb
         uzMt52ScSz5Y3tdKF2KcfDdsG6Adr+pL53kjQiP2ek918RiE4QUOLUQyqXF3lAmvGG8O
         yHByB2TI9tcUHeYrhK+/x7t2hSH/f2342DKKFK2Tbfa/QDUFXzvaKB9wIzpIV1dnHcs0
         bo2dn5F3bvgSSaZvTUL0iCEKWi9jedlO2TbCK5EGiv83FnikMT6bTRALVTrq5o80GHx5
         IXBl6UQ9lopOHpLT99xUZGMOAUBmIyxx2hUlj/JUazbIxk6QTb1KNu9l0pS2Q1kyhSm1
         BiEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a056214076800b004730e1f92d7si7374056qvz.84.2022.07.13.00.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 00:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXCB-0007oc-JQ
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 03:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBK-0007nl-Jd; Wed, 13 Jul 2022 03:53:14 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBI-0002VU-FT; Wed, 13 Jul 2022 03:53:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVGl5312z4ySb;
 Wed, 13 Jul 2022 17:53:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVGj6GRKz4ySW;
 Wed, 13 Jul 2022 17:53:01 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/19] aspeed queue
Date: Wed, 13 Jul 2022 09:52:36 +0200
Message-Id: <20220713075255.2248923-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: 3et22ztnDjH2

The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f82:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-12 14:12:15 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220713

for you to fetch changes up to 053b2ee5629d1b822127cc454634ec272624bab2:

  aspeed: Add fby35-bmc slot GPIO's (2022-07-13 08:16:46 +0200)

----------------------------------------------------------------
aspeed queue:

* New ISL69259 device model
* New fby35 multi-SoC machine (AST1030 BIC + AST2600 BMC)
* Aspeed GPIO fixes
* Extension of m25p80 with write protect bits
* More avocado tests using the Aspeed SDK

----------------------------------------------------------------
Cédric Le Goater (3):
      aspeed: fby35: Add a bootrom for the BMC
      docs: aspeed: Minor updates
      test/avocado/machine_aspeed.py: Add SDK tests

Iris Chen (2):
      hw: m25p80: Add Block Protect and Top Bottom bits for write protect
      hw: m25p80: add tests for BP and TB bit write protect

Joel Stanley (1):
      aspeed: sbc: Allow per-machine settings

Peter Delevoryas (13):
      hw/i2c/pmbus: Add idle state to return 0xff's
      hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
      hw/sensor: Add Renesas ISL69259 device model
      aspeed: Create SRAM name from first CPU index
      aspeed: Refactor UART init for multi-SoC machines
      aspeed: Make aspeed_board_init_flashes public
      aspeed: Add fby35 skeleton
      aspeed: Add AST2600 (BMC) to fby35
      aspeed: Add AST1030 (BIC) to fby35
      docs: aspeed: Add fby35 multi-SoC machine section
      qtest/aspeed_gpio: Add input pin modification test
      hw/gpio/aspeed: Don't let guests modify input pins
      aspeed: Add fby35-bmc slot GPIO's

 docs/system/arm/aspeed.rst       |  62 ++++++++++++-
 include/hw/arm/aspeed_soc.h      |   9 +-
 include/hw/i2c/pmbus_device.h    |   7 ++
 include/hw/misc/aspeed_sbc.h     |  13 +++
 include/hw/sensor/isl_pmbus_vr.h |   5 ++
 hw/arm/aspeed.c                  |  38 ++++++--
 hw/arm/aspeed_ast10x0.c          |  13 ++-
 hw/arm/aspeed_ast2600.c          |  13 ++-
 hw/arm/aspeed_soc.c              |  55 ++++++++----
 hw/arm/fby35.c                   | 188 +++++++++++++++++++++++++++++++++++++++
 hw/block/m25p80.c                | 102 ++++++++++++++++++---
 hw/gpio/aspeed_gpio.c            |  15 ++--
 hw/i2c/pmbus_device.c            |   9 ++
 hw/misc/aspeed_sbc.c             |  42 ++++++++-
 hw/sensor/isl_pmbus_vr.c         |  40 +++++++++
 tests/qtest/aspeed_gpio-test.c   |  27 ++++++
 tests/qtest/aspeed_smc-test.c    | 111 +++++++++++++++++++++++
 MAINTAINERS                      |   1 +
 hw/arm/meson.build               |   3 +-
 tests/avocado/machine_aspeed.py  |  68 ++++++++++++++
 20 files changed, 764 insertions(+), 57 deletions(-)
 create mode 100644 hw/arm/fby35.c
