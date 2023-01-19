Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296644ejc;
        Thu, 19 Jan 2023 04:36:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuDVvyusSaMksPy5WzDsWuyENLzmos572v9o28Ex8Qo+GXx46Z1eJBtSUWrd9ErEGdco1nV
X-Received: by 2002:ac8:754d:0:b0:3ae:95c:8486 with SMTP id b13-20020ac8754d000000b003ae095c8486mr12655186qtr.64.1674131804235;
        Thu, 19 Jan 2023 04:36:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131804; cv=none;
        d=google.com; s=arc-20160816;
        b=fXiu9I+mLKQCy0ldqQMlRNrCBngF1HzpJIBaYo7QwgbsgbeF90l1LR4aJ8BmGYsox5
         IVewIdBNCJPSEQgOKwx/w0wpQ22OrG1XhcUedPRAuWXZ722Y4bdh2zi0yM/Vo6UJsdAj
         JsbcW8mpXVdA9Ez24RfPUpAgIn/8aSGkt/XTwGcJp0xkfu3kmE3UjWaj2HeC7u7k9bE5
         Fy/0DHvfyPWfVRpRGj4b8HRIzKNfZi73b+GAXQf1DtDzGCoX/GeBPt2UFS6OK9CZfDTH
         pJvgTxqCpvdD3idef+Iivrcu2SPXqGNDavOOy/t0agUAsNQguPlSCdrw6x8QR3GOI024
         PrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=WcrBz9p3aO/ebkjlMueA3aUaCDtSRTjY8kVrKIzFbhw=;
        b=FQzZi9RKQY4Waqwbdi7DU4+WAOqmZLhWAQMxBO6H1Vgay11CavntplgfnV3xRM43Yr
         hWU+DPop0HPeW7HPSWn5RzWYtzopn6L7JXdv9Ji3MhmLQYuqEMb6nnooBBnogRLw6rcV
         9MUoRYLwcrxoiUadyFZRex6t+ki9AVGkt/rdhohIPMzqeqBw9QJac9lESmbFNTJ7S/5P
         ckbbvX/J0W6vi/f8DMKkHeCBBB66xCb5Yb0/Ywd5A93SVZ83Oe1gtg9uoK5pUhA51MWj
         xXLR8EUkIb7DVucLGHKVxstEk+EoVscpVfBYj1gZfmi74oH5jdYClMObG8oAApaFLj/u
         Q4rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb18-20020a05622a481200b003a4f3f7927bsi4258882qtb.335.2023.01.19.04.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:36:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU8W-0006IU-5R; Thu, 19 Jan 2023 07:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8U-0006Ht-CE; Thu, 19 Jan 2023 07:35:18 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8R-0007SW-Pr; Thu, 19 Jan 2023 07:35:17 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXR59WRz4xHV;
 Thu, 19 Jan 2023 23:35:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXP6H4xz4x1D;
 Thu, 19 Jan 2023 23:35:01 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 00/25] aspeed: Various extensions, fixes and cleanups
Date: Thu, 19 Jan 2023 13:34:24 +0100
Message-Id: <20230119123449.531826-1-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jWKj84w2Qa2q

Hello,

Here are the patches I have collected so far that I plan to include in
the next Aspeed PR for QEMU 8.0. Most have been reviewed but not all,
so please take a look, specially the one on VFP registers.

* various small cleanups and fixes
* new variant of the supermicrox11-bmc machine using an ast2500-a1 SoC
* at24c_eeprom extension to define eeprom contents with static arrays
* ast10x0 model and test improvements
* avocado update of images to use the latest

Thanks,

C. 

Cédric Le Goater (6):
  m25p80: Improve error when the backend file size does not match the device
  tests/avocado/machine_aspeed.py: update buildroot tests
  tests/avocado/machine_aspeed.py: Mask systemd services to speed up SDK boot
  hw/arm/boot: Export write_bootloader for Aspeed machines
  hw/core/loader: Remove declarations of option_rom_has_mr/rom_file_has_mr
  target/arm: Allow users to set the number of VFP registers

Guenter Roeck (2):
  aspeed: Add Supermicro X11 SPI machine type
  m25p80: Add the is25wp256 SFPD table

Joel Stanley (1):
  avocado/boot_linux_console.py: Update ast2600 test

Peter Delevoryas (5):
  hw/arm: Extract at24c_eeprom_init helper from Aspeed and Nuvoton boards
  hw/arm/aspeed: Replace aspeed_eeprom_init with at24c_eeprom_init
  hw/nvram/eeprom_at24c: Add init_rom field and at24c_eeprom_init_rom helper
  hw/arm/aspeed: Add aspeed_eeprom.c
  hw/nvram/eeprom_at24c: Make reset behavior more like hardware

Philippe Mathieu-Daudé (10):
  hw/watchdog/wdt_aspeed: Rename MMIO region size as 'iosize'
  hw/watchdog/wdt_aspeed: Extend MMIO range to cover more registers
  hw/watchdog/wdt_aspeed: Log unimplemented registers as UNIMP level
  hw/misc/aspeed_hace: Do not crash if address_space_map() failed
  hw/arm/aspeed_ast10x0: Add various unimplemented peripherals
  hw/arm/aspeed_ast10x0: Map I3C peripheral
  hw/arm/aspeed_ast10x0: Map the secure SRAM
  hw/arm/aspeed_ast10x0: Map HACE peripheral
  hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
  tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on AST1030 board

Stephen Longfield (1):
  hw/net: Fix read of uninitialized memory in ftgmac100

 hw/arm/aspeed_eeprom.h              |  19 +++
 hw/block/m25p80_sfdp.h              |   2 +
 include/hw/arm/aspeed_soc.h         |  14 +++
 include/hw/arm/boot.h               |  24 ++++
 include/hw/loader.h                 |   3 -
 include/hw/nvram/eeprom_at24c.h     |  39 ++++++
 include/hw/watchdog/wdt_aspeed.h    |   4 +-
 target/arm/cpu.h                    |   2 +
 hw/arm/aspeed.c                     | 184 ++++++++++++++++------------
 hw/arm/aspeed_ast10x0.c             |  83 ++++++++++++-
 hw/arm/aspeed_ast2600.c             |   6 +-
 hw/arm/aspeed_eeprom.c              |  81 ++++++++++++
 hw/arm/aspeed_soc.c                 |   4 +-
 hw/arm/boot.c                       |  34 ++---
 hw/arm/npcm7xx_boards.c             |  20 +--
 hw/block/m25p80.c                   |   7 +-
 hw/block/m25p80_sfdp.c              |  40 ++++++
 hw/misc/aspeed_hace.c               |  21 +++-
 hw/net/ftgmac100.c                  |   4 +-
 hw/nvram/eeprom_at24c.c             |  59 +++++++--
 hw/watchdog/wdt_aspeed.c            |  24 +++-
 target/arm/cpu.c                    |  31 +++++
 hw/arm/meson.build                  |   1 +
 tests/avocado/boot_linux_console.py |  12 +-
 tests/avocado/machine_aspeed.py     |  60 +++++++--
 25 files changed, 602 insertions(+), 176 deletions(-)
 create mode 100644 hw/arm/aspeed_eeprom.h
 create mode 100644 include/hw/nvram/eeprom_at24c.h
 create mode 100644 hw/arm/aspeed_eeprom.c

-- 
2.39.0

