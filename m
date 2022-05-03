Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1223875lfj;
        Tue, 3 May 2022 00:00:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAy/xmVRXtptbBseosb7tCTFmp0fMzhGiXgae+FSIH7x4qV6MyQ3qikoCPkUDeQwqybru5
X-Received: by 2002:ac8:5b51:0:b0:2f3:8654:53b2 with SMTP id n17-20020ac85b51000000b002f3865453b2mr13593045qtw.300.1651561229667;
        Tue, 03 May 2022 00:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651561229; cv=none;
        d=google.com; s=arc-20160816;
        b=OWxe95vihtRH52+UwPVTy9UX4f84QBiEbOL+D/rY6TybICrXtV4vYbM5jrNxWdSy6c
         GVdDDLBQd6RMN+UEU0MZ9H2XRfmQuwa3RTUDGiRuUkJmWzz4t6fyZuUVDYvlEAKgqGHh
         QRioDZ3/ZJRQkjKBm/z8hw0LkUX3sxSlbOSvwl2OrVhEV8lgn2ck8XHStye/a8/sjaCu
         zXZOQ/C4V/+wR1N1CPB1uHQpKG1ia/nhTAYvxfTkx5M6l7+YcW3pF3MFRsrjmYj1oEU5
         AGPcjoOpINOgAxzzM+UP+e93A/ed0j7vjV6c0Na4fnzRdb7L5YvzQeW2lIUCtgW7n+Fe
         uguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=M5Bxz6Wy7wE4F3s8xNw9zFDUYWrVijV9jito0myYFxo=;
        b=luw33IcHyaR+GvhxHt4evGxQbjNOdF/KDC7uqOq7dlZuzJMnNdD73MwSaoyyPuLqCb
         83MgsVTto8yrptw488o15o7hGzcaa1IID/2LVo4APchCGkBF4vYTdZ4FfmY5TPLT3Loy
         sNN5CIertJ59AtsWpGaowO/Oi5Ws5tn7PDZB8Z81iNbrX64xz8s5HfnX0oKFh8fkTtGt
         zPcLgjv+AF8fqFfikTmlvR1MEPhcPgDzcjX8PJu7oyFP0HPqdqrSIeLulOiT32potLNZ
         IfVjqbzdo8Ijx4o4FxbfAKHKk93MpY8O9I7xceanayYm9CcPK3J1nSNsu5129kJBBYpa
         5CHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05622a148e00b002f38fda08a9si6385830qtx.580.2022.05.03.00.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmWL-0002zQ-2N
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUx-0002yN-AL; Tue, 03 May 2022 02:59:03 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUv-0007Ro-Bo; Tue, 03 May 2022 02:59:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrR11fcNz4ySb;
 Tue,  3 May 2022 16:58:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrQz4lLnz4yST;
 Tue,  3 May 2022 16:58:51 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/19] aspeed queue
Date: Tue,  3 May 2022 08:58:29 +0200
Message-Id: <20220503065848.125215-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: REG6ls5ld34P

The following changes since commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65:

  Merge tag 'pull-9p-20220501' of https://github.com/cschoenebeck/qemu into staging (2022-05-01 07:48:11 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220503

for you to fetch changes up to e056c52233910ef156e6d790ce41b33cd838bad6:

  aspeed/hace: Support AST1030 HACE (2022-05-03 07:17:20 +0200)

----------------------------------------------------------------
aspeed queue:

* New AST1030 SoC and eval board
* Accumulative mode support for HACE controller
* GPIO fix and unit test
* Clock modeling adjustments for the AST2600
* Dummy eMMC Boot Controller model
* Change of AST2500 EVB and AST2600 EVB flash model (for quad IO)

----------------------------------------------------------------
Jae Hyun Yoo (1):
      hw/arm/aspeed: fix AST2500/AST2600 EVB fmc model

Jamin Lin (2):
      aspeed: Add an AST1030 eval board
      test/avocado/machine_aspeed.py: Add ast1030 test case

Joel Stanley (2):
      aspeed: sbc: Correct default reset values
      aspeed: Add eMMC Boot Controller stub

Peter Delevoryas (1):
      hw/gpio/aspeed_gpio: Fix QOM pin property

Steven Lee (13):
      hw: aspeed_scu: Add AST2600 apb_freq and hpll calculation function
      hw: aspeed_scu: Introduce clkin_25Mhz attribute
      aspeed/adc: Add AST1030 support
      aspeed/smc: Add AST1030 support
      aspeed/wdt: Fix ast2500/ast2600 default reload value
      aspeed/wdt: Add AST1030 support
      aspeed/timer: Add AST1030 support
      aspeed/scu: Add AST1030 support
      aspeed/soc : Add AST1030 support
      aspeed/hace: Support HMAC Key Buffer register.
      aspeed/hace: Support AST2600 HACE
      tests/qtest: Add test for Aspeed HACE accumulative mode
      aspeed/hace: Support AST1030 HACE

 include/hw/adc/aspeed_adc.h      |   1 +
 include/hw/arm/aspeed_soc.h      |   4 +
 include/hw/misc/aspeed_hace.h    |   7 +
 include/hw/misc/aspeed_scu.h     |  45 ++++++
 include/hw/timer/aspeed_timer.h  |   1 +
 include/hw/watchdog/wdt_aspeed.h |   3 +
 hw/adc/aspeed_adc.c              |  16 +++
 hw/arm/aspeed.c                  |  70 ++++++++-
 hw/arm/aspeed_ast10x0.c          | 299 +++++++++++++++++++++++++++++++++++++++
 hw/arm/aspeed_ast2600.c          |   6 +
 hw/gpio/aspeed_gpio.c            |   2 +-
 hw/misc/aspeed_hace.c            | 159 ++++++++++++++++++++-
 hw/misc/aspeed_sbc.c             |   7 +-
 hw/misc/aspeed_scu.c             | 108 +++++++++++++-
 hw/ssi/aspeed_smc.c              | 157 ++++++++++++++++++++
 hw/timer/aspeed_timer.c          |  17 +++
 hw/watchdog/wdt_aspeed.c         |  34 ++++-
 tests/qtest/aspeed_gpio-test.c   |  87 ++++++++++++
 tests/qtest/aspeed_hace-test.c   | 147 +++++++++++++++++++
 hw/arm/meson.build               |   6 +-
 tests/avocado/machine_aspeed.py  |  36 +++++
 tests/qtest/meson.build          |   3 +-
 22 files changed, 1199 insertions(+), 16 deletions(-)
 create mode 100644 hw/arm/aspeed_ast10x0.c
 create mode 100644 tests/qtest/aspeed_gpio-test.c
 create mode 100644 tests/avocado/machine_aspeed.py
