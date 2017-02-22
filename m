Received: by 10.25.0.147 with SMTP id 141csp919921lfa;
        Wed, 22 Feb 2017 03:23:58 -0800 (PST)
X-Received: by 10.55.113.129 with SMTP id m123mr32899230qkc.47.1487762638241;
        Wed, 22 Feb 2017 03:23:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si652163qtf.78.2017.02.22.03.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 03:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:51537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgV1X-0001zs-EB
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 06:23:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cgV1T-0001zR-Ql
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 06:23:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cgV1Q-0006OO-N2
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 06:23:51 -0500
Received: from bee.antfield.fr ([188.165.75.195]:41862)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1cgV1Q-0006Nu-Dk; Wed, 22 Feb 2017 06:23:48 -0500
From: Clement Deschamps <clement.deschamps@antfield.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487762626; bh=2XGbmOp1/rBZAyEpa47u8o89u50RbeQnDm8DQiXJQlM=;
	h=From:To:Cc:Subject:Date:From;
	b=TDzfezAHhQmg8rGg8DUa3p8FwwefoqhIHfCfbgXbRmgqbkMH0RHC5dAikBAWBFBEY
	VpryvY3aLbdWILzWTm98gLWFOgllf+hzlfNeNsD3wIOwPkevZvvZiBDBf6FXTdtoq2
	A617e8MXG9JnS2ta1wjPj1DbqHxVGg63F5RYJ78Q=
To: qemu-devel@nongnu.org
Date: Wed, 22 Feb 2017 12:23:35 +0100
Message-Id: <20170222112338.25492-1-clement.deschamps@antfield.fr>
X-Mailer: git-send-email 2.11.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: [Qemu-arm] [PATCH v2 0/3] add sdhost and gpio controllers to the
 bcm2835 platform
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	andrew.baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aXNqevc8e90I

This patches add the Arasan SDHost controller and the GPIO controller to the BCM2835/36 platforms.

This patches have been tested with raspbian 2015-09-24 (which uses the SDHCI controller),
and raspbian 2017-01-11 (which dynamically switches to the SDHost controller).

Note: In order to properly boot the kernel, you will first need to apply the
BCM2835 hardware RNG patch submitted recently.

v2:
- implements the GPIO controller for supporting SD controller selection via alternate functions of GPIOs 48-53

Clement Deschamps (3):
  bcm2835_sdhost: add bcm2835 sdhost controller
  bcm2835_gpio: add bcm2835 gpio controller
  bcm2835: add sdhost and gpio controllers

 hw/arm/bcm2835_peripherals.c         |  44 ++++
 hw/gpio/Makefile.objs                |   1 +
 hw/gpio/bcm2835_gpio.c               | 361 +++++++++++++++++++++++++++++
 hw/sd/Makefile.objs                  |   1 +
 hw/sd/bcm2835_sdhost.c               | 429 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   4 +
 include/hw/gpio/bcm2835_gpio.h       |  38 ++++
 include/hw/sd/bcm2835_sdhost.h       |  48 ++++
 8 files changed, 926 insertions(+)
 create mode 100644 hw/gpio/bcm2835_gpio.c
 create mode 100644 hw/sd/bcm2835_sdhost.c
 create mode 100644 include/hw/gpio/bcm2835_gpio.h
 create mode 100644 include/hw/sd/bcm2835_sdhost.h

-- 
2.11.1

