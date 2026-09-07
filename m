Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68115C79FA7
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cQa-00078g-Q6; Mon, 07 Sep 2026 12:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cQW-00078B-CQ
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:42:37 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cQT-0002iu-Cy
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:42:36 -0400
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso35675395e9.3
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799350; x=1789404150;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6tWzPFGQRSS7XrQCVt25xN+ZuJWN0aM3i6SqhCf8OKU=;
 b=Qu9/6WUK9R8P2DhdMBANM7UO2NKqfK/LkyIfI3Bs98HGJzpwWrJ8n30p5aekjzm2jL
 RVJHhu20OpK769NFg2sxxuWPYcEucHGLzzDisgOunqReT/aMbGyFIxz5xcKWHMAd2Cw7
 ZfWszqhNiX0SdjagX4R7qZ6aLt8iCCGcRonvWahAZ+/CVdeg0OYasEhsTcvW+n9kEGup
 czuCFrUbMID18cSf2qGtvlUUnwE/KbGjDhBSzqnbQ9cth7NtSmLU1Y6SsP2mZA0g4u4I
 6hzCtrI2n30gpkWs+14Ms9K3YNArpilIa0F7yXcxX1dMqcB3U43J3Wig6FZWs2SuZctG
 NYjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFIx0L6/WD6UlYhr9VXCSH/QZFI1pL2KEdTe37AnNFz9S+N0PQL3WvsBuLK1U+rF6Le0AZIIUpGQ==@nongnu.org
X-Gm-Message-State: AFuF++lmC397/1UWCMl+aMZuoqw9ekbQAzmE4dxP6cWrtG96nRmKyKFs
 W1OT28rd1MtkdOlACacyAdccxxblxZeuUvJspcWmZ7krOUNvXCpFZrvy
X-Gm-Gg: AYBFou3huT9Qg5H7i0Wkcir4Xv06qQ0/oczlQiPxGYGsjxxgAWFrSG5oc3uBvm1WdCn
 ils+VNt+KGJMdBle1wfvKiEmUFL/y/mPoeKzsCgNKbPYLDelGI+J8sXMQGYLGIWFAOqgbaZmKvY
 kEx7Lz8G5UVH+LcISRVKG5Qbr1y41XvVqSMxstgdtqHCAkR96Z40eCeE81afe3XcIRRxCI3wzKk
 gDMXkIWLrP42D1ulc/oufWTriROdh1fesRNOV0aWknpJjp4FGJspRKKIlM6OWod7ERdB746rwn0
 X/46DOM1kN8BU98YHqSIkCenrusnk9uJhmCktQ0LFdTqFvkLmknryWvXNBBLcodn7WqCOT0QFwX
 8E6JX6PzZQODJU65byuU95QweR7Y5QITxOKKo6NJ4hoiWSdsHgIJPDxhD9RYGEp58n9nPVaz2am
 8JkL2tQrag4HaMudolXdJR9gjzhfx1Q20jiQu8Eo0Eet/imOe9h9Z+sAtUL5M0QC3RPwxjBT6bA
 Hx8bu9QMwCDXJxuWCBEl2ngyA4nomd/5D0=
X-Received: by 2002:a05:600c:c162:b0:49d:16dc:e721 with SMTP id
 5b1f17b1804b1-49d16dce7aamr30367125e9.24.1788799349891; 
 Mon, 07 Sep 2026 09:42:29 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858dd90e1fsm28952149f8f.28.2026.09.07.09.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:42:29 -0700 (PDT)
Subject: [PATCH 00/50] Aspeed: I2C device models and the Minerva BMC
 machine
Date: Mon, 07 Sep 2026 18:41:50 +0200
Message-Id: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVpSfxdRSzaMRiJkpZGIu6uW
 H6L9y7w5Jg8NMkFjgJ7Xm2EShPASduRBPfRkMmskLUshVlQLGzJBS2wV7kuVYW1NBCLzdHA53d
 ru9/+MDPh/i7gvh85j1wBbwAAAA==
X-Change-ID: 20260907-bmc-minerva-cd13a718c90b
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799319; l=7063;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=z6Q1L4LTVT0oSBgWubT80KHK0LzAca+0pFUYStBfAmc=;
 b=TUrHfeiOWjazS7D9P2V5ATPuNDSjZnYTj47gSnqvDYvGGC2nLxEqZJCyEaGa+M1jtQZqBGqYw
 KOhHeiOBJUvC+BTZQt1M0tXcUot75D/Ei6SF7/K/YSPwX5LB3+t/0Y0
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.45; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f45.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add the minerva-bmc machine and the I2C device models it needs.

Based on legoater/aspeed-next, at:
  1c05d7e94d ("tests/functional: aspeed: optionally check the device
  tree model on boot")

New models:

  INA230   TI 36V current-shunt and power monitor
  INA238   TI 85V current-shunt, power and temperature monitor
  DS1339   RTC, a DS1338 variant
  PCA9545  4-channel I2C mux with per-channel interrupt inputs

The INA devices derive current and power from the shunt voltage and
their calibration registers. ALERT output is supported. Measurements
come in through QOM properties; however, conversion delay is not
modelled.

Introduce a device class to manage different variants of the DS1338
register map, such as the DS1339. Improve the DS1338 implementation
with a Resettable reset, support for the clock-halt bit, and a
"persist-on-reset" property keeping the registers across a reset.

The minerva-bmc machine is derived from the platform device tree and
instantiates every device that is supported in QEMU. FRU EEPROMs are
sanitised images taken from real hardware.

New qtests for the DS1339, INA230, INA238 and PCA9545, plus DS1338
cases for the register map, and a functional test booting OpenBMC on
minerva-bmc.

The docs now mention the previously missing catalina-bmc and
sanmiguel-bmc machines, and the title has been simplified.

One thing worth a second opinion: the PCA954x muxes now have a
VMStateDescription, which changes the migration stream for the
existing PCA9546 and PCA9548. The DS1338 vmstate also goes from
version 2 to 3, but older streams still load fine.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
Emmanuel Blot (50):
      docs/system/arm/aspeed: add the catalina-bmc machine
      docs/system/arm/aspeed: add the sanmiguel-bmc machine
      hw/arm: sanmiguel: remove the second SPI flash controller
      hw/i2c: pca954x: drop unused header inclusions
      hw/i2c: pca954x: add PCA9545 4-channel mux model
      hw/i2c: pca954x: migrate mux state
      tests/qtest: pca9545: add mux test
      hw/rtc: ds1338: move TYPE_DS1338 to a public header
      hw: ds1338: use the TYPE_DS1338 constant instead of the "ds1338" string
      hw/rtc: ds1338: implement Resettable reset
      hw/rtc: ds1338: prefix the file-local helpers with ds1338_
      hw/rtc: ds1338: parameterise the register map via a device class
      hw/rtc: ds1338: program the clock from the time registers
      hw/rtc: ds1338: implement the DS1338 clock-halt bit
      hw/rtc: ds1338: refresh the user registers on a read rollover only
      hw/rtc: ds1338: add a persist-on-reset property
      tests/qtest: ds1338: cover the DS1338-specific register map
      tests/qtest: ds1338: cover the power-on register defaults
      tests/qtest: ds1338: cover the clock-halt bit
      tests/qtest: ds1338: cover persist-on-reset
      tests/qtest: ds1338: cover the reserved bits of the time registers
      hw/rtc: ds1338: add DS1339 variant
      tests/qtest: ds1339: add RTC test
      tests/qtest: ds1339: cover power-on defaults and reserved-bit masking
      tests/qtest: ds1339: cover oscillator stop/restart and time programming
      tests/qtest: ds1339: cover the Century bit
      tests/qtest: ds1339: cover the end-of-month rollover
      tests/qtest: ds1339: cover the 12-hour format
      tests/qtest: ds1339: cover the day-of-week counter
      tests/qtest: ds1339: cover persist-on-reset
      tests/qtest: ds1339: cover the migration round trip
      hw/sensor: ina230: add current/voltage/power monitor
      tests/qtest: ina230: add current/voltage/power monitor test
      tests/qtest: ina230: cover voltage injection and power derivation
      tests/qtest: ina230: cover the ALERT limit functions and CVRF
      tests/qtest: ina230: cover the injection-property limits
      tests/qtest: ina230: cover operating modes and triggered conversions
      tests/qtest: ina230: cover ALERT latch persistence
      tests/qtest: ina230: cover a cleared calibration per channel
      hw/sensor: ina238: add current/voltage/power monitor
      tests/qtest: ina238: add current/voltage/power monitor test
      tests/qtest: ina238: cover voltage/temperature injection and derivation
      tests/qtest: ina238: cover the ALERT path and conversion-ready flag
      tests/qtest: ina238: cover the injection-property limits
      tests/qtest: ina238: cover the operating modes
      tests/qtest: ina238: cover conversion-ready and alert-latch semantics
      tests/qtest: ina238: cover a cleared calibration per channel
      hw/arm: minerva: add Facebook BMC machine
      hw/arm: minerva: populate EEPROM data
      tests/functional/arm: minerva: add BMC boot test

 docs/system/arm/aspeed.rst                  |   7 +-
 hw/arm/Kconfig                              |   2 +
 hw/arm/aspeed_ast2400_palmetto.c            |   4 +-
 hw/arm/aspeed_ast2400_supermicrox11.c       |   4 +-
 hw/arm/aspeed_ast2500_romulus.c             |   4 +-
 hw/arm/aspeed_ast2500_supermicro-x11spi.c   |   4 +-
 hw/arm/aspeed_ast2500_witherspoon.c         |   4 +-
 hw/arm/aspeed_ast2600_bletchley.c           |   3 +-
 hw/arm/aspeed_ast2600_catalina.c            |   2 +-
 hw/arm/aspeed_ast2600_minerva.c             | 856 ++++++++++++++++++++++++++++
 hw/arm/aspeed_ast2600_sanmiguel.c           |   7 +-
 hw/arm/meson.build                          |   1 +
 hw/arm/realview.c                           |   3 +-
 hw/arm/versatilepb.c                        |   3 +-
 hw/i2c/i2c_mux_pca954x.c                    |  98 +++-
 hw/ppc/e500.c                               |   3 +-
 hw/riscv/tt_atlantis.c                      |   3 +-
 hw/rtc/ds1338.c                             | 427 +++++++++++---
 hw/sensor/Kconfig                           |   8 +
 hw/sensor/ina230.c                          | 597 +++++++++++++++++++
 hw/sensor/ina238.c                          | 802 ++++++++++++++++++++++++++
 hw/sensor/meson.build                       |   2 +
 hw/sensor/trace-events                      |  14 +
 include/hw/i2c/i2c_mux_pca954x.h            |   1 +
 include/hw/rtc/ds1338.h                     |  21 +
 include/hw/sensor/ina230.h                  |  14 +
 include/hw/sensor/ina238.h                  |  14 +
 tests/functional/arm/meson.build            |   2 +
 tests/functional/arm/test_aspeed_minerva.py |  30 +
 tests/qtest/ds1338-test.c                   | 191 ++++++-
 tests/qtest/ds1339-test.c                   | 581 +++++++++++++++++++
 tests/qtest/ina230-test.c                   | 602 +++++++++++++++++++
 tests/qtest/ina238-test.c                   | 806 ++++++++++++++++++++++++++
 tests/qtest/meson.build                     |   4 +
 tests/qtest/pca9545-test.c                  | 116 ++++
 35 files changed, 5125 insertions(+), 115 deletions(-)
---
base-commit: 1c05d7e94da04129ea16147074fe73158fb85ff9
change-id: 20260907-bmc-minerva-cd13a718c90b

Best regards,
--  
Emmanuel Blot <emmanuel.blot@free.fr>


