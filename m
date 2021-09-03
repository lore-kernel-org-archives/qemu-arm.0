Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1606527lfb;
        Fri, 3 Sep 2021 12:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuYksm3Eqqg6BiXW+11qtn0lprvPaT9+1CXIvxbL/e/xHUN6udx+3WTLg3vrq7maWqq+9z
X-Received: by 2002:a5d:8784:: with SMTP id f4mr504597ion.48.1630698359491;
        Fri, 03 Sep 2021 12:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630698359; cv=none;
        d=google.com; s=arc-20160816;
        b=yAgcyYF4IxtamtdYfGqlUwZP+B8LjOzDSZ6GSBaYPMguL1CsXGjqW9ltvEK9knS5fA
         lRiGXrjX+thFTwYX1BKnS/YlnTXcqmF4C5Oj1B5WRvSM/H3N+7nUlr/SdIi+DBVHGqds
         mlyUYsRIzfyfVIWA8A/KHxyDHyfxZ6AwrkKwfG1NYQoi+q3RcMORbfPctlbxnHE/hkyk
         P/evRJxbWoim2nivV5kHP6wZ4GRQUissWodfoORrRjCF3M8S7pkxMA4I1QoGG72p76A2
         E5J1sl7xYNpI+1oPgbCO9OLKm2Xcvmwng/lP8QV4xe3aWLTZLsFoPo3GD+TSpbBvrpDV
         0Akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=cze1a0LetRNVAoDTjITFF9toofaLUoDwMSAm69Gf/JE=;
        b=orF9+zIszFJ0rwNcX4DeAKDZirlj2ijC15YKHGAncO2jiRGfm3Ak5PHENUcP7T69JK
         3c7Ly+sYFa4x3owpLtFgRHWV5EP3qFNTGBNuy3/740yvk58C2/hJYLifOvUoR3SjE585
         JS55lrINhgyZbXrdIssf2Pz+hnI58gN4nbQTB77rbGpjLMQRCoO3zpjcss3NOY1OhWaD
         yTQkrxroPpx0xpj1mSIgcaq02fAAOuQOj6rVEhi9JOPI9NUxCyasL8mgFyHPj7JfXLOM
         gNsqIIY5VUG4Bjh2K24udl7yfiSwxnNLCMRyVtxm63pcR7cL0zTsoRO8pExVg9IUxwCi
         a1jA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e43si293099jai.58.2021.09.03.12.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMF8Q-0004hA-Ic
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF41-00040T-SS
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:25 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:46435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF3x-0002EW-Jk
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E72AE200FB;
 Fri,  3 Sep 2021 19:41:10 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00554399cb2-b15e-4992-a51e-961bc0883cf8,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/14] aspeed queue
Date: Fri, 3 Sep 2021 21:40:54 +0200
Message-ID: <20210903194108.131403-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 112cc02d-c77f-4a06-8bf1-8e09f8552cbf
X-Ovh-Tracer-Id: 8815233322417097510
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeikeeklefguddvieejueejhfehfeejtdelgedtheetjeetuddutdejfeejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ap1dwNY3DsG7

The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20210903

for you to fetch changes up to 907796622b2a6b945c87641d94e254ac898b96ae:

  hw/arm/aspeed: Add Fuji machine type (2021-09-03 18:43:16 +0200)

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
 hw/arm/aspeed.c                  | 178 +++++++++++++++++++++++++++++--
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
 15 files changed, 525 insertions(+), 76 deletions(-)
 create mode 100644 hw/sensor/dps310.c
