Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1528692lfc;
        Tue, 12 Oct 2021 00:51:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVqyW5lMgkBbDowt2ZxD9eSkhNa/0/6cXZJpsUa2Tp41GMaCKUzv92Vn967F/Sr1CuqyCc
X-Received: by 2002:a02:620b:: with SMTP id d11mr22276626jac.69.1634025066241;
        Tue, 12 Oct 2021 00:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634025066; cv=none;
        d=google.com; s=arc-20160816;
        b=qmZH8yFsToGukFT3CLkG6sTabXs52AuxQobX+PthdvPxVhY65ICooD4DidcSw3Hsw2
         kqNylXDmVI9VSEQequG/zxJ20oH75ZAeeqPUxfE6+qbi/9t2eIG43DHOOoIXKrATNmY+
         Xx9cvnW0EEiG5gVDgg1d+XBFF+sEa72okOnIH/mPvHaFQnIJMEMY/gb7rsY2kI+XJZ9b
         eK9dT1SSdSJ3/ScuxnoDqYsqQP1PZHbscP4mjlFWDnCOYdfD+TmhaxqNMfNRP/eoXXZE
         BHlyqCF5xqDFtqXQsg9d49O4A2QOX10JxNrwcaVNMZ3NXxVmPaOCmKc+mm4MrUfWGLJ/
         wsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=NFGPJ0kQEDDe9EpuzBBWLp9WY1uQKgtks2ZsLGzDGxU=;
        b=XfarEY+XEV4bFaa6hexeqS+3aeOAab3S1S35D35idflycdCitd/cmWwSS/OfeeUW6E
         8NB4uOlJOqF2cJcTi047dN23rYDpFZhF0ln1CJDCxwzaFZqbpuc0f4rT99iT7WAwT5pm
         e5YkKfXZcShWdjFzvkB4Q17nUgsSU77iK+LlLmnVy3Jpm5t8UPcQozd0Ty1M3g/arMpD
         kQtlcWzKILJXRnyjy5JcIfkrYrPxDtPqQIVDn6tw+nD/Ygniylms+ay5FHbW4ojmgFLB
         NNf4E2SYbTAIXV4tOdYk4gPr9QxKGV8XM7ahWHOh0F9QGJ6oxi+Q3s+hJJy9Ydp8J6LJ
         514g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g124si7434246jab.72.2021.10.12.00.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCYz-0008ED-EX
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCMG-0000Xc-R5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:58 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:54851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM3-0004wp-Gb
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 27BB92111C;
 Tue, 12 Oct 2021 07:37:31 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006a434bfd8-f1cd-49e3-a73b-028b8ae84292,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/18] aspeed queue
Date: Tue, 12 Oct 2021 09:37:10 +0200
Message-ID: <20211012073728.257748-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: feb3354c-8048-43f6-8079-8e7d91f41f9c
X-Ovh-Tracer-Id: 4267723598869728038
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeikeeklefguddvieejueejhfehfeejtdelgedtheetjeetuddutdejfeejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: cTKbc0HnrCS+

The following changes since commit c09124dcb8401a0d635b4a52b295e9b3fc12392a:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2021-10-11 08:15:32 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20211012

for you to fetch changes up to e2804a1ec97ceede14b69a2a6e9a8b5dfa0b15c2:

  aspeed/smc: Dump address offset in trace events (2021-10-12 08:20:08 +0200)

----------------------------------------------------------------
Aspeed patches :

* I2C QOMify (Cedric)
* SMC model cleanup and QOMify (Cedric)
* ADC model (Peter and Andrew)
* GPIO fixes (Peter)

----------------------------------------------------------------
Andrew Jeffery (2):
      hw/adc: Add basic Aspeed ADC model
      hw/arm: Integrate ADC model into Aspeed SoC

Cédric Le Goater (14):
      aspeed/smc: Add watchdog Control/Status Registers
      aspeed/smc: Introduce aspeed_smc_error() helper
      aspeed/smc: Stop using the model name for the memory regions
      aspeed/smc: Drop AspeedSMCController structure
      aspeed/smc: Remove the 'flash' attribute from AspeedSMCFlash
      aspeed/smc: Remove the 'size' attribute from AspeedSMCFlash
      aspeed/smc: Rename AspeedSMCFlash 'id' to 'cs'
      aspeed/smc: QOMify AspeedSMCFlash
      aspeed/smc: Add default reset values
      aspeed/smc: Introduce a new addr_width() class handler
      aspeed/smc: Remove unused attribute 'irqline'
      aspeed/i2c: QOMify AspeedI2CBus
      aspeed/wdt: Add trace events
      aspeed/smc: Dump address offset in trace events

Peter Delevoryas (2):
      hw: aspeed_gpio: Fix pin I/O type declarations
      hw: aspeed_gpio: Fix GPIO array indexing

 include/hw/adc/aspeed_adc.h   |   55 ++
 include/hw/arm/aspeed_soc.h   |    2 +
 include/hw/gpio/aspeed_gpio.h |    5 +-
 include/hw/i2c/aspeed_i2c.h   |    8 +-
 include/hw/ssi/aspeed_smc.h   |   82 ++-
 hw/adc/aspeed_adc.c           |  427 ++++++++++++++++
 hw/arm/aspeed.c               |   18 +-
 hw/arm/aspeed_ast2600.c       |   22 +-
 hw/arm/aspeed_soc.c           |   15 +-
 hw/gpio/aspeed_gpio.c         |   88 ++--
 hw/i2c/aspeed_i2c.c           |  101 +++-
 hw/ssi/aspeed_smc.c           | 1134 +++++++++++++++++++++++------------------
 hw/watchdog/wdt_aspeed.c      |    5 +
 hw/adc/meson.build            |    1 +
 hw/adc/trace-events           |    3 +
 hw/watchdog/trace-events      |    4 +
 16 files changed, 1352 insertions(+), 618 deletions(-)
 create mode 100644 include/hw/adc/aspeed_adc.h
 create mode 100644 hw/adc/aspeed_adc.c
