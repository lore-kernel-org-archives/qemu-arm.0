Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp12839ejc;
        Thu, 2 Mar 2023 09:44:35 -0800 (PST)
X-Google-Smtp-Source: AK7set86cgRdi78i7BDNa7kqT8pFXOGsJ4F9xYsba9pVoVLjv4vRcjchAamcY8m04Ujm2dDQRdTZ
X-Received: by 2002:a05:622a:412:b0:3bd:16cf:2f37 with SMTP id n18-20020a05622a041200b003bd16cf2f37mr17697751qtx.60.1677779075836;
        Thu, 02 Mar 2023 09:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677779075; cv=none;
        d=google.com; s=arc-20160816;
        b=kuKv8Wx6A4l4hHXdV5Y4ZP/PJt2bhh3wKRJUeLjh4nGWgwt6z68/cvnylwjYrKcCxe
         Ly3Kv9gVdC2IfUlK0cCTvgoskv8ubWWpwzo8BuwvWPUn653JJPS5IP9N2PpP9ZySrtZD
         ZZ5T8cZlutuff3TNwIKOf7WpXzNOdTHBGVemQ5mphcIP+unGhwS77vzgtITdRzgTF9Iz
         DMuCRhhXRKaHs0+Ntuw8QI+7cZd2TZLy4CNpSiu5Zy3xrMNGmfCaiZVo87c059Sy262q
         kET5NLqU9fh2MCk5qIJpIluRq4XsY/ORyiQzBxsC/x9zx7r3IOFZoY6gscysQ4UVtCxZ
         PbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=nF7adRtNWz0qqb5BnCJb3wA/dsXUld9bRu3yiSm7sjY=;
        b=fzueGbeoHVIh5wFBxD4kv2kXXqB/Yr0ZfZHvoGHoAaN0zB+kgOFyBlnRJYBW2CwJ3X
         uUmn+6lXyPigwCo8Cfr/vy++F2jskmXNxwE2DHlQHNQz2ph/3caAgyolCKuW2gRdATWo
         VWkzgC/RXr+SNkCvBQu09s2t7He1xTxqW7LtAXFF1tRHNMWyhyxSNdPQBF4Nm+gadaFe
         yjcERGnyOjeRg5evQCohbwWgwnVtp9chktQ56DY1iHzd/V0cW2bsgPYd/TdD8uPS4f1L
         dgHVP3pR6Ml8MypiVrIsBaC/6KrJ3OW7xoCsAVVZ3zif/yPZFgD03ZqQNKNdn+tT5jfv
         h1dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05622a164f00b003b86b3ff783si110253qtj.273.2023.03.02.09.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXmwy-0004tf-M8; Thu, 02 Mar 2023 12:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwf-0004Wp-Ur; Thu, 02 Mar 2023 12:42:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwe-0002jW-3f; Thu, 02 Mar 2023 12:42:21 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMS4dm6z4x80;
 Fri,  3 Mar 2023 04:42:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMQ6c8wz4x5X;
 Fri,  3 Mar 2023 04:42:10 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/11] aspeed queue
Date: Thu,  2 Mar 2023 18:41:55 +0100
Message-Id: <20230302174206.2434673-1-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HEpqHPsFRVfe

The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff11fe06b:

  Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu into staging (2023-03-01 19:19:20 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20230302

for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94da:

  aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57:50 +0100)

----------------------------------------------------------------
aspeed queue:

* fix for the Aspeed I2C slave mode
* a new I2C echo device from Klaus and its associated test in avocado.
* initial SoC cleanups to allow the use of block devices instead of
  drives on the command line.
* new facebook machines and eeprom fixes for the Fuji
* readline fix

----------------------------------------------------------------
Cédric Le Goater (4):
      tests/avocado/machine_aspeed.py: Add an I2C slave test
      aspeed: Introduce a spi_boot region under the SoC
      aspeed: Add a boot_rom overlap region in the SoC spi_boot container
      aspeed/smc: Replace SysBus IRQs with GPIO lines

Dongli Zhang (1):
      readline: fix hmp completion issue

Karthikeyan Pasupathi (2):
      hw/arm/aspeed: Adding new machine Yosemitev2 in QEMU
      hw/arm/aspeed: Adding new machine Tiogapass in QEMU

Klaus Jensen (2):
      hw/i2c: only schedule pending master when bus is idle
      hw/misc: add a toy i2c echo device

Sittisak Sinprem (2):
      hw/at24c : modify at24c to support 1 byte address mode
      aspeed/fuji : correct the eeprom size

 docs/system/arm/aspeed.rst      |   2 +
 hw/arm/aspeed_eeprom.h          |   6 ++
 include/hw/arm/aspeed_soc.h     |   5 ++
 include/hw/i2c/i2c.h            |   2 +
 hw/arm/aspeed.c                 | 159 ++++++++++++++++++++++++++++------------
 hw/arm/aspeed_ast2600.c         |  13 ++++
 hw/arm/aspeed_eeprom.c          |  45 ++++++++++++
 hw/arm/aspeed_soc.c             |  14 ++++
 hw/arm/fby35.c                  |   8 +-
 hw/i2c/aspeed_i2c.c             |   2 +
 hw/i2c/core.c                   |  37 ++++++----
 hw/misc/i2c-echo.c              | 156 +++++++++++++++++++++++++++++++++++++++
 hw/nvram/eeprom_at24c.c         |  30 +++++++-
 hw/ssi/aspeed_smc.c             |   5 +-
 monitor/hmp.c                   |   8 +-
 hw/misc/meson.build             |   2 +
 tests/avocado/machine_aspeed.py |  10 +++
 17 files changed, 421 insertions(+), 83 deletions(-)
 create mode 100644 hw/misc/i2c-echo.c
