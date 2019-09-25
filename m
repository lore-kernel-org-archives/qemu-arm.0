Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp874481wrp;
        Wed, 25 Sep 2019 07:34:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylkXJHbuLGyyDBwPznqqIPnLVaSFkU+jrQJQYOYdyKwDjLC9lwsrAGUYgTCtpv1WgtUm0x
X-Received: by 2002:a05:620a:1136:: with SMTP id p22mr3830609qkk.287.1569422043882;
        Wed, 25 Sep 2019 07:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569422043; cv=none;
        d=google.com; s=arc-20160816;
        b=n8B59hcTrOzRH/ujpuYREwplAomsNtAxV+GRDztbmKmRxyaR/WBVK9TuD+BUsyqcU3
         87C1CytDxFbfTtqjaqRsH5COXI/p3wQYts9Zfsth9BgWobVp/B7/8+YxIE1BecVYuQKl
         xvcuS1nJ626m/0VOK5NMS8dwJ1TBL3uk00btPiZgtJ8RpnzTG2yJTemOSfRtBwfkFVFn
         L5PcJmqa8QlbQKWF52oE4DJjtiExgQc3PifVYEA2MeLTuf+PbD9FRcbcwes68aL7F24r
         b3/6vbpUNt7edXQ6qb+WJ4S1bx49SHX0QhaKKJoWR3fuR7Z7l+W0Y9zUqFY+JEuTY6Eu
         br6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=02+g9R82RfRfVv6BwzTvtcer2Kh14WPI3fk7aty+Eio=;
        b=ZeVyXQTzICxYB6QjF201XvZ9H/g6I+7raMx6Ud9lPO4yN88w2yfmw05ejBEjX5wrJX
         YZEpYm+BTVWses7fIKY6vxXK9JkPVM3UlNjm6k0iTWq4vn+UZ2LH6biVRhE4hMTqAByE
         BqIUxgpI7VG9qtmIZChGkYODcnsRQAyBtf9Gfa0FyEoD+AFi1+qYeqQ+cMlJHQmnmHo8
         NIRioCAsyvP1+6T9fQGFHyZ/gmCX0RSZABwTadn4JUgEgAoWGNaEwjiOwRY4RAwSQerM
         jLFRT/5qMEEzVQbUEFZViIwloI1xGO8RpstOjs1bgKbSsf9ToPKhTGSIwBtDFfANrP2z
         i0rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si3822979qve.197.2019.09.25.07.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8Mj-0003IN-L1
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8Lu-0003Df-8W
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8Lr-0000Ay-OH
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:08 -0400
Received: from 4.mo6.mail-out.ovh.net ([87.98.184.159]:60096)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8Lr-00009g-Ad
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:07 -0400
Received: from player786.ha.ovh.net (unknown [10.108.57.211])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id AC2AC1E2D94
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:33:04 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id B216DA4D3A70;
 Wed, 25 Sep 2019 14:32:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 00/23] aspeed: Add support for the AST2600 SoC
Date: Wed, 25 Sep 2019 16:32:25 +0200
Message-Id: <20190925143248.10000-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8836062469594712849
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.184.159
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
X-TUID: CfsDoc5kdYRw

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

Changes since v1:

 - better SMC model, proof tested against Linux and Aspeed drivers
   used on HW bringup
 - new w25q512jv flash model for the AST2600 EVB
 - removed the use of "cntfrq" property not yet merged
 - tuned the HW strapping values of the AST2600 EVB

Amithash Prasad (1):
  aspeed/wdt: Check correct register for clock source

C=C3=A9dric Le Goater (15):
  aspeed/timer: Introduce an object class per SoC
  aspeed/timer: Add support for control register 3
  aspeed/timer: Add AST2600 support
  aspeed/timer: Add support for IRQ status register on the AST2600
  aspeed/sdmc: Introduce an object class per SoC
  watchdog/aspeed: Introduce an object class per SoC
  aspeed/smc: Introduce segment operations
  aspeed/smc: Add AST2600 support
  aspeed/i2c: Introduce an object class per SoC
  aspeed/i2c: Add AST2600 support
  aspeed: Introduce an object class per SoC
  aspeed/soc: Add AST2600 support
  m25p80: Add support for w25q512jv
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

 include/hw/arm/aspeed.h          |   1 +
 include/hw/arm/aspeed_soc.h      |  29 +-
 include/hw/i2c/aspeed_i2c.h      |  20 +-
 include/hw/misc/aspeed_scu.h     |   7 +-
 include/hw/misc/aspeed_sdmc.h    |  20 +-
 include/hw/net/ftgmac100.h       |  17 +
 include/hw/sd/aspeed_sdhci.h     |  34 ++
 include/hw/ssi/aspeed_smc.h      |   4 +
 include/hw/timer/aspeed_timer.h  |  18 ++
 include/hw/watchdog/wdt_aspeed.h |  19 +-
 hw/arm/aspeed.c                  |  42 ++-
 hw/arm/aspeed_ast2600.c          | 523 +++++++++++++++++++++++++++++++
 hw/arm/aspeed_soc.c              | 199 +++++++-----
 hw/block/m25p80.c                |   1 +
 hw/gpio/aspeed_gpio.c            | 142 ++++++++-
 hw/i2c/aspeed_i2c.c              | 106 ++++++-
 hw/misc/aspeed_scu.c             | 194 +++++++++++-
 hw/misc/aspeed_sdmc.c            | 250 +++++++++++----
 hw/net/ftgmac100.c               | 162 ++++++++++
 hw/sd/aspeed_sdhci.c             | 198 ++++++++++++
 hw/ssi/aspeed_smc.c              | 177 +++++++++--
 hw/timer/aspeed_timer.c          | 213 +++++++++++--
 hw/watchdog/wdt_aspeed.c         | 153 +++++----
 hw/arm/Makefile.objs             |   2 +-
 hw/sd/Makefile.objs              |   1 +
 25 files changed, 2253 insertions(+), 279 deletions(-)
 create mode 100644 include/hw/sd/aspeed_sdhci.h
 create mode 100644 hw/arm/aspeed_ast2600.c
 create mode 100644 hw/sd/aspeed_sdhci.c

--=20
2.21.0

