Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp727861lfp;
        Thu, 14 Jul 2022 08:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tEsE7QcB5QedKQ2sswP54s2JuXmNrY8zw/4vIIvHWTBw54R4SXiiVld5fg+fuoPO3ySLd0
X-Received: by 2002:ad4:5bcf:0:b0:473:75ec:9f75 with SMTP id t15-20020ad45bcf000000b0047375ec9f75mr8535321qvt.36.1657813641603;
        Thu, 14 Jul 2022 08:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657813641; cv=none;
        d=google.com; s=arc-20160816;
        b=xHSWZTD8/ZnE9+36JRo7k5+pFJNN0LefnpcydmJr2FNH4qNFaK3Zc9my+lIVdzV/4h
         DfTWlu0kxGnhiz+u5cMHCGCCnL3GQ4hkIxbQv6l7VeWJ6cO4P1i0A3j9kjbL/9N04etl
         O0qN2uwpBB2TVf9jCz9dzpZC7K2Mt3BIJKb4bYbSDgnYrp8JpDyoXtGASLZtRNOt+zIY
         UFWYk3FCYAlAOz+lsOova7oIJoG4WBOLEDYczdB6V+7A1j3AvWp7Xrsy/sKNsOJTpUzG
         YIu3ZcnjrYWhdsvt99kz1iU3/wl/6jmiG1GCSG4Rtrv1w82tt/JTZ/CyYy/DUxN/RVrC
         sXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=OwTAJyZYRGetbGGSG71N53LQM4W4HThLxeGXYiihEQg=;
        b=r37Gcb89sGyNMfleqf+8PeFNgIfNNUOs1Slff2hyWLqfBK+XXPZL+vCmaTuygx41A4
         WRlhRNHzs2ikwl/lpjZOg0rvJEq20shAg41cD6Kha0BCRD2nesaymSrNsO8j7a7lwFfv
         ozMCnSra77K9OhQtxf9C91VoGTbuRWFaM14DYMNqm6ishpcIKA0GmOB4ttX8tv/nFSdb
         38NJa8+lskEjtA9qgKw8pK4gv0DDdRm0QGo/9xnXNpoyOn2gPxrQb/c4nPPZCtJ8NHPW
         R+G2cg5ZfElKxXHDFsutBL1z6o6CXEHE43GShcL/w06+cp9PSt7VLpjUbj6nm9gCgfGt
         TuEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020ac8610d000000b00304bbc4768esi1173627qtm.176.2022.07.14.08.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC13h-0006Kb-4w
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11c-0005Ep-3s; Thu, 14 Jul 2022 11:45:13 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11a-0000L3-2H; Thu, 14 Jul 2022 11:45:11 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJht3Vddz4xht;
 Fri, 15 Jul 2022 01:45:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJhr6sMQz4xhp;
 Fri, 15 Jul 2022 01:45:00 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL v2 00/19] aspeed queue
Date: Thu, 14 Jul 2022 17:44:37 +0200
Message-Id: <20220714154456.2565189-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: pLjOiivvs/iG

The following changes since commit 08c9f7eec7002dac2da52c8265eb319aba381c86:

  Merge tag 'darwin-20220712' of https://github.com/philmd/qemu into staging (2022-07-14 09:30:55 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220714

for you to fetch changes up to f0418558302ef9e140681e04250fc1ca265f3140:

  aspeed: Add fby35-bmc slot GPIO's (2022-07-14 16:24:38 +0200)

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
