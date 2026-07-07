Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8850CC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1uy-00080g-T5; Tue, 07 Jul 2026 05:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1ux-00080A-V3
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:16:39 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1uv-0003Uy-Lu
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:16:39 -0400
Received: from localhost (unknown [89.92.102.124])
 (Authenticated sender: emmanuel.blot@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4FCF02003E3;
 Tue,  7 Jul 2026 11:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1783415793;
 bh=wVyQypJS8eFWMt97Tzf3CwXflR/o6buon7NoH2DyGqQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ZTZSMx1js28GK0b5lZ3lnKxR9qgbJJ9Qh0zzy8JA/NCKM9GPnLGmWdg2yCeJsRbfg
 /1tUh/vUaHyU0VIYwFetGj83LuhU8Olc+dZnX0WkpMhvVJ0Ipcyv/vuA0tk04gRQFN
 ygN0zO7wKpib1KkeM6bEMnkQqf5fxJwFP3GJNXFxPQPpg0DsVLJ9DTZujIdO1TXGID
 cZ3YJ7/iIaMMfmgHOtzPSLDRfcAkN4qX7UTHwdSfPaLJS0EGDnIdfyyb1hENeTBiZk
 uuH91x706I56zA3yE9lOYDTIe3qiOSWMWve9XP2LOdWJd5/gCoDcubt9DjbSsDKUM0
 wUObAI7AMHpkA==
From: Emmanuel Blot <emmanuel.blot@free.fr>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Alexander Hansen <alexander.hansen@9elements.com>,
 William de Abreu Pinho <williampinho@meta.com>,
 Emmanuel Blot <eblot@meta.com>, qemu-arm@nongnu.org
Subject: [PATCH v6 0/9] Add new device emulation for TI ADC128D818
Date: Tue,  7 Jul 2026 11:15:53 +0200
Message-ID: <20260707091609.97759-1-emmanuel.blot@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.27.42.2; envelope-from=emmanuel.blot@free.fr;
 helo=smtp2-g21.free.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

hw/sensor: Add new device emulation for TI ADC128D818

This is a 12-bit, 8-channel ADC I2C device, which is used on several
OpenBMC platforms.

QOM properties can be used to change input ADC values and external VREF at
run time.

Add it to AST2600-based Anacapa machine, along with some functional tests
that use QOM properties to inject voltage values into analog inputs.

Datasheet: https://www.ti.com/lit/gpn/ADC128D818

To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@mailo.com>
Cc: Fabiano Rosas <farosas@suse.de>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Troy Lee <leetroy@gmail.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Kane Chen <kane_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Alexander Hansen <alexander.hansen@9elements.com>
Cc: William de Abreu Pinho <williampinho@meta.com>
Cc: Emmanuel Blot <eblot@meta.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>

---
Changes in v6:
- Update wait_adc128d818_value in tests/functional/arm/test_aspeed_anacapa.py
  to reduce timeout and max number of retries to read from adc128d818
- Replace UTF08 EM DASH characters with ASCII ones in tests/functional/arm/test_aspeed_anacapa.py
- Link to v5: https://lore.kernel.org/qemu-devel/20260701-i2c-adc128d818-anacapa-v5-0-fe8292d86b38@free.fr

Changes in v5:
- Change author/committer/signed-off-by address to circumvent SMTP issues
- Link to v4: https://lore.kernel.org/qemu-devel/20260701-i2c-adc128d818-anacapa-v4-0-89d6a2febb26@meta.com

Changes in v4:
- Better follow QEMU coding style (lowercase hex number, signed integer
constants, parent object variable name in Device)
- Split adc128d818 test large commit into smaller ones
- Link to v3: https://lore.kernel.org/qemu-devel/20260627-i2c-adc128d818-anacapa-v3-0-cfb94270a980@meta.com

Changes in v3:
- Update anacapa test image with proper DTB
- Make I2C device in i2c_slave_create_simple a child of the I2C bus
- Simplify tests/functional/arm/test_aspeed_anacapa.py
- Use g_test_message rather than fprintf
- Keep review trailers
- Link to v2: https://lore.kernel.org/qemu-devel/20260617-i2c-adc128d818-anacapa-v2-0-fd38764f0465@meta.com

Changes in v2:
- Remove clang-format useless comment sections
- Link to v1: https://lore.kernel.org/qemu-devel/20260612-i2c-adc128d818-anacapa-v1-0-9e4640cd164b@meta.com


Emmanuel Blot (9):
  hw/sensor: adc128d818: add 12-bit 8-channel ADC device
  tests/qtest: adc128d818: add test harness and register access
  tests/qtest: adc128d818: test voltage and temperature conversion
  tests/qtest: adc128d818: test limit interrupts
  tests/qtest: adc128d818: test operating modes and power control
  hw/i2c: parent slaves created with i2c_slave_create_simple
  hw/arm/aspeed: anacapa: use ASCII in comments
  hw/arm: anacapa: add ADC128D818 devices
  test/functional: anacapa: test ADC128D818

 hw/arm/Kconfig                              |   1 +
 hw/arm/aspeed_ast2600_anacapa.c             |  27 +-
 hw/i2c/core.c                               |   3 +
 hw/sensor/Kconfig                           |   4 +
 hw/sensor/adc128d818.c                      | 696 ++++++++++++++++
 hw/sensor/meson.build                       |   1 +
 hw/sensor/trace-events                      |   8 +
 include/hw/i2c/i2c.h                        |   7 +-
 include/hw/sensor/adc128d818.h              |  14 +
 tests/functional/arm/test_aspeed_anacapa.py |  68 +-
 tests/qtest/adc128d818-test.c               | 856 ++++++++++++++++++++
 tests/qtest/meson.build                     |   1 +
 12 files changed, 1671 insertions(+), 15 deletions(-)
 create mode 100644 hw/sensor/adc128d818.c
 create mode 100644 include/hw/sensor/adc128d818.h
 create mode 100644 tests/qtest/adc128d818-test.c

-- 
2.50.1

