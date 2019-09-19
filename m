Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp581743wrp;
        Wed, 18 Sep 2019 22:50:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIARbqOgVRBj8JHVR1Ygkm3UsEOn/Q0R2xh3nV/gZcy0BX44iiQNyH8Vy7Jf74klah9j+A
X-Received: by 2002:aa7:c749:: with SMTP id c9mr14330616eds.232.1568872231537;
        Wed, 18 Sep 2019 22:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568872231; cv=none;
        d=google.com; s=arc-20160816;
        b=nm4U5Y+ltQyYdk/Y0O0xy6al8wc+oHUMLAy0Ur2+Ijekqv3PrptvJe8luLdN3LUYsk
         VE4O59qYImxTFGSQiLFn2u24frgnsoADP05qOFrOoIomD0VF2fok2WhP2SpPdW/LXyAl
         7S40nMcw8JAQUupPdSiHUsGS1E4iuLJRTlLqmh70C8cnx+8CrIVkp+YI9vRt/P1zUntn
         +WVX7DcpIcypblIUqGgDPKz02WELthqgrCiUmNYgGbEEWSndAVuGlWMsliMH2zE4Tlbh
         +FAC67IXNuP3AYsXl/8km6QVu10S2pfBO2L2zOH5th/sMfP80uoD/WetCWcM+9QMU4ed
         XXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=3s4bumUwrsvSlJs3tBiueGeIxdtyFCDttQ+NFSM2QfM=;
        b=OrlXdV2P0Ah1TTygLe70WFwrYco30tM8c/FDmsxze+PCnL24lkwFqbSaKHNnpQEVq/
         l91dZ1+jUp1ozYjEF7XqIxEwoi/tlwsCStUzeZm3q7brQXMTH9Lc7nBY35nQ18MhwZhq
         dSTjYiBMFc4ojM2PhJdsXFb2Whws/HniZ3CgUukBZQlW9mH9aRV6mXgvpqCFnsztaA/q
         cGcpRf8q4HouS3kzxB35+T0nh0vE1brUNFqlW/8mPQkwMLWqeQyqGZx86unBwe3LmYpI
         xqVhlsV2tAt1IXshR3bE3h9GYZHPpF6dKsLev0CI0hV49V+nzD+zUpbtN8pJskn0K+Yt
         Wnrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si3957256ejq.98.2019.09.18.22.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 22:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iApKo-0000HD-72
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 01:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApKb-0000Ge-2v
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:50:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApKZ-0007QL-Id
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:50:16 -0400
Received: from 5.mo178.mail-out.ovh.net ([46.105.51.53]:46784)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApKZ-0007P8-Cq
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:50:15 -0400
Received: from player788.ha.ovh.net (unknown [10.108.57.44])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 4B12E796DC
 for <qemu-arm@nongnu.org>; Thu, 19 Sep 2019 07:50:13 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 9B3C79F172A3;
 Thu, 19 Sep 2019 05:50:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:49:41 +0200
Message-Id: <20190919055002.6729-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1662954162933959441
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.51.53
Subject: [Qemu-arm] [PATCH 00/21] aspeed: Add support for the AST2600 SoC
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mXlfQ1F2jwHG

Hello,

The series starts with a watchdog fix and a new model for the SDHCI
controller. Follows the code for the AST2600 SoC.

Most of the Aspeed models are reworked with an object class to
introduce the AST2600 variant. A model for the AST2600 SoC and a
simple AST2600 EVB machine is proposed at the end of the series. It
can boot the OpenBMC firmware image which is currently used for HW
bringup.

Thanks,

C.

Amithash Prasad (1):
  aspeed/wdt: Check correct register for clock source

C=C3=A9dric Le Goater (13):
  aspeed/timer: Introduce an object class per SoC
  aspeed/timer: Add support for control register 3
  aspeed/timer: Add AST2600 support
  aspeed/timer: Add support for IRQ status register on the AST2600
  aspeed/sdmc: Introduce an object class per SoC
  watchdog/aspeed: Introduce an object class per SoC
  aspeed/smc: Add AST2600 support
  aspeed/i2c: Introduce an object class per SoC
  aspeed/i2c: Add AST2600 support
  aspeed: Introduce an object class per SoC
  aspeed/soc: Add AST2600 support
  aspeed: Add an AST2600 eval board
  aspeed: add support for the Aspeed MII controller of the AST2600

Eddie James (1):
  hw/sd/aspeed_sdhci: New device

Joel Stanley (5):
  hw: aspeed_scu: Add AST2600 support
  aspeed/sdmc: Add AST2600 support
  hw: wdt_aspeed: Add AST2600 support
  aspeed: Parameterise number of MACs
  aspeed/soc: Add ASPEED Video stub

Rashmica Gupta (1):
  hw/gpio: Add in AST2600 specific implementation

 include/hw/arm/aspeed_soc.h      |  29 +-
 include/hw/i2c/aspeed_i2c.h      |  20 +-
 include/hw/misc/aspeed_scu.h     |   7 +-
 include/hw/misc/aspeed_sdmc.h    |  20 +-
 include/hw/net/ftgmac100.h       |  17 +
 include/hw/sd/aspeed_sdhci.h     |  34 ++
 include/hw/ssi/aspeed_smc.h      |   2 +
 include/hw/timer/aspeed_timer.h  |  18 ++
 include/hw/watchdog/wdt_aspeed.h |  19 +-
 hw/arm/aspeed.c                  |  37 ++-
 hw/arm/aspeed_ast2600.c          | 522 +++++++++++++++++++++++++++++++
 hw/arm/aspeed_soc.c              | 199 +++++++-----
 hw/gpio/aspeed_gpio.c            | 142 ++++++++-
 hw/i2c/aspeed_i2c.c              | 106 ++++++-
 hw/misc/aspeed_scu.c             | 192 +++++++++++-
 hw/misc/aspeed_sdmc.c            | 250 +++++++++++----
 hw/net/ftgmac100.c               | 162 ++++++++++
 hw/sd/aspeed_sdhci.c             | 198 ++++++++++++
 hw/ssi/aspeed_smc.c              | 129 +++++++-
 hw/timer/aspeed_timer.c          | 213 +++++++++++--
 hw/watchdog/wdt_aspeed.c         | 153 +++++----
 hw/arm/Makefile.objs             |   2 +-
 hw/sd/Makefile.objs              |   1 +
 23 files changed, 2204 insertions(+), 268 deletions(-)
 create mode 100644 include/hw/sd/aspeed_sdhci.h
 create mode 100644 hw/arm/aspeed_ast2600.c
 create mode 100644 hw/sd/aspeed_sdhci.c

--=20
2.21.0

