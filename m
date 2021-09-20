Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1857847lfp;
        Mon, 20 Sep 2021 01:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKLcSdeLxksHcFjSWrEfIk6K7CFmO2N58lxRk7taH1Rs432iXc4v7z24NJu09I7RnaAUfm
X-Received: by 2002:a05:6e02:d05:: with SMTP id g5mr17099710ilj.34.1632125555198;
        Mon, 20 Sep 2021 01:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632125555; cv=none;
        d=google.com; s=arc-20160816;
        b=MtACqei5hX0zmhXZv7DXCil42g+SsJyLptTOxzdNIhVw+FVqHPY9xcgspLjbpujZuw
         flxFym3uZQV4x62k5Rhmtd0M8TS7Dgh76nVW71aRW0pFMHB9L15IYFpLuJ05OLV4jtvi
         Um+quRkNTm8nkWcJNu4QtQcR3RXn4VmiIy/KRZ/RK33uk1FXBUlyqQVMnb+wOwGfcXzo
         yM4dhVRwAup5VEBgvuj588kXJHZltYagikB73nSCXsf0syhzuG5gi1A8EiFV2P2Qgsuw
         +UCjocUY6dGQbLun59toHDWJGO5nHHMWNtm7SKSttSTCAUl6TwVY+eG+DaSIjDDVrg9m
         d7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=niugUUM0eJep4nUu6mYrj11KigxQTDXah8FmivS/iU0=;
        b=ixgPfUdVIVrF18r6OblrsnnJZheuVHngFKCCdKEqsLDyFbeeWJTIzd6I90J2p5XbiO
         8MInn1JmYfGdqOvsq56Kv/PM8iv8c+RhJttb9pE4vvdrgQCrvUJmrl3Imu4sqiUUodIC
         27l4JP0WoHMEMsbtYZwpjJQMKOkUcWyswy/zRXbt5Aj6w2/icb3j25uUwYxmm3uVAf0j
         zEtX4KteICa8iLwXkVmH3jKscOC1b7xjmpNJmT0usNxRd5EiWBxk5P5sr+3KgbVX3NGx
         H+husxIgkoS7NyfzncXf7lbi0j0Sx/8K6ZhxsAZu/UD4XElZSTyfl4Ba8eRVsRkIcNFJ
         8viQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si12412735ior.13.2021.09.20.01.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEPi-0007vG-HN
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMu-0004OH-3d
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:43 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:43081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMp-0003fD-Vg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 78C6E20678;
 Mon, 20 Sep 2021 08:09:30 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005bd7a584e-64d2-4952-b4c9-9b947f140017,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/14] aspeed queue
Date: Mon, 20 Sep 2021 10:09:14 +0200
Message-ID: <20210920080928.1055567-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 50330f64-3485-44dc-af7b-26d75ed4d920
X-Ovh-Tracer-Id: 4736097961739127590
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeikeeklefguddvieejueejhfehfeejtdelgedtheetjeetuddutdejfeejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wboQTjGdxJFL

The following changes since commit c99e34e537f13a431a80e3e414e5904e9dd0a116:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.2-pull-request' into staging (2021-09-16 21:09:18 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20210920

for you to fetch changes up to febbe308bf9477767ca92e8ed5f265b0001fcef9:

  hw/arm/aspeed: Add Fuji machine type (2021-09-20 08:50:59 +0200)

----------------------------------------------------------------
Aspeed patches :

* MAC enablement fixes (Guenter)
* Watchdog  and pca9552 fixes (Andrew)
* GPIO fixes (Joel)
* AST2600A3 SoC and DPS310 models (Joel)
* New Fuji BMC machine (Peter)

----------------------------------------------------------------
Andrew Jeffery (3):
      watchdog: aspeed: Sanitize control register values
      watchdog: aspeed: Fix sequential control writes
      misc/pca9552: Fix LED status register indexing in pca955x_get_led()

Guenter Roeck (2):
      hw: arm: aspeed: Enable eth0 interface for aspeed-ast2600-evb
      hw: arm: aspeed: Enable mac0/1 instead of mac1/2 for g220a

Joel Stanley (6):
      hw: aspeed_gpio: Simplify 1.8V defines
      hw: aspeed_gpio: Clarify GPIO controller name
      arm/aspeed: rainier: Add i2c eeproms and muxes
      aspeed: Emulate the AST2600A3
      hw/misc: Add Infineon DPS310 sensor model
      arm/aspeed: Add DPS310 to Witherspoon and Rainier

Peter Delevoryas (3):
      hw/arm/aspeed: Initialize AST2600 UART clock selection registers
      hw/arm/aspeed: Allow machine to set UART default
      hw/arm/aspeed: Add Fuji machine type

 include/hw/arm/aspeed.h          |   1 +
 include/hw/arm/aspeed_soc.h      |   1 +
 include/hw/misc/aspeed_scu.h     |   2 +
 include/hw/watchdog/wdt_aspeed.h |   1 +
 hw/arm/aspeed.c                  | 182 +++++++++++++++++++++++++++++--
 hw/arm/aspeed_ast2600.c          |  14 +--
 hw/arm/aspeed_soc.c              |   8 +-
 hw/gpio/aspeed_gpio.c            |  97 +++++++++--------
 hw/misc/aspeed_scu.c             |  40 +++++--
 hw/misc/pca9552.c                |   2 +-
 hw/sensor/dps310.c               | 225 +++++++++++++++++++++++++++++++++++++++
 hw/watchdog/wdt_aspeed.c         |  26 ++++-
 hw/arm/Kconfig                   |   1 +
 hw/sensor/Kconfig                |   4 +
 hw/sensor/meson.build            |   1 +
 15 files changed, 529 insertions(+), 76 deletions(-)
 create mode 100644 hw/sensor/dps310.c
