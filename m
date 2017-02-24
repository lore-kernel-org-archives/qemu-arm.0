Received: by 10.25.0.147 with SMTP id 141csp766224lfa;
        Fri, 24 Feb 2017 08:40:38 -0800 (PST)
X-Received: by 10.55.157.137 with SMTP id g131mr3900308qke.80.1487954438520;
        Fri, 24 Feb 2017 08:40:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v1si5984414qki.194.2017.02.24.08.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 08:40:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:38415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chIv5-0003OG-Tg
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 11:40:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chIuv-0003Mk-IT
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 11:40:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chIus-0001AJ-Vd
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 11:40:25 -0500
Received: from bee.antfield.fr ([188.165.75.195]:53514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1chIus-00019m-MC; Fri, 24 Feb 2017 11:40:22 -0500
From: Clement Deschamps <clement.deschamps@antfield.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487954420; bh=YUKjlK7HJyhAmLZzS2kdReJIf9YxZ4bIzB/yVBmqphk=;
	h=From:To:Cc:Subject:Date:From;
	b=ovIIa2MpJ2fFhHLdwDIBn4owdowhlje+tipuivKi896B0HU/ZwkAJ3OoLGrgOZ5kD
	3/J/PV5dFWO3Q/f6Ym412yyyq9jTZWre/Ge6g4+IixzjnbRaDEt+UDc6wlaB3cOxp/
	0E/m8ZUfgz6EzfOExU5hQCNt91iHdUWkwPPJ7rr0=
To: qemu-devel@nongnu.org
Date: Fri, 24 Feb 2017 17:40:17 +0100
Message-Id: <20170224164021.9066-1-clement.deschamps@antfield.fr>
X-Mailer: git-send-email 2.11.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: [Qemu-arm] [PATCH v3 0/4] bcm2835: add sdhost and gpio controllers
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
X-TUID: k/nd2ztPJHOa

This patches add the Arasan SDHost controller and the GPIO controller to the BCM2835/36 platforms.

This patches have been tested with raspbian 2015-09-24 (which uses the SDHCI controller),
and raspbian 2017-01-11 (which dynamically switches to the SDHost controller).


I spotted an issue with the raspi2 platform, but it is not related to this patch.
The CP15 timer frequency is set to 19.20MHz in the raspbian kernel DTB.
There is a constant (GTIMER_SCALE) in target/arm/internals.h which seems to tell that the timer is at 62.5MHz.
This causes problems:
- The sleep command entered in guest lasts around 1/3 of the time it is supposed to last.
- The cursor is blinking faster that it should
- The systemd timeouts expire too early.          
- ...

Did you already have this issue on another platform ?
Should the frequency in the DTB be dynamically replaced depending on the GTIMER_SCALE value ?
Or should the constant GTIMER_SCALE be platform dependent ?


v2:
- implements the GPIO controller for supporting SD controller selection via alternate functions of GPIOs 48-53

v3:
- removed unneeded alias (sd-bus-2)
- changed license to GPLv2 'or later'
- moved the sdbus_reparent_card() function to hw/sd/core.c
- added 'readonly' state propagation in sdbus_reparent_card()
- the gpio controller is now exposing an sdbus and has 2 references to sdbus of sdhci and sdhost controllers

Clement Deschamps (4):
  bcm2835_sdhost: add bcm2835 sdhost controller
  hw/sd: add card-reparenting function
  bcm2835_gpio: add bcm2835 gpio controller
  bcm2835: add sdhost and gpio controllers

 hw/arm/bcm2835_peripherals.c         |  43 +++-
 hw/gpio/Makefile.objs                |   1 +
 hw/gpio/bcm2835_gpio.c               | 353 ++++++++++++++++++++++++++++
 hw/sd/Makefile.objs                  |   1 +
 hw/sd/bcm2835_sdhost.c               | 429 +++++++++++++++++++++++++++++++++++
 hw/sd/core.c                         |  30 +++
 include/hw/arm/bcm2835_peripherals.h |   4 +
 include/hw/gpio/bcm2835_gpio.h       |  39 ++++
 include/hw/sd/bcm2835_sdhost.h       |  48 ++++
 include/hw/sd/sd.h                   |   1 +
 10 files changed, 947 insertions(+), 2 deletions(-)
 create mode 100644 hw/gpio/bcm2835_gpio.c
 create mode 100644 hw/sd/bcm2835_sdhost.c
 create mode 100644 include/hw/gpio/bcm2835_gpio.h
 create mode 100644 include/hw/sd/bcm2835_sdhost.h

-- 
2.11.1

