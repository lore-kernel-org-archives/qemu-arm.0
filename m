Received: by 10.25.0.147 with SMTP id 141csp113281lfa;
        Mon, 20 Feb 2017 09:36:22 -0800 (PST)
X-Received: by 10.237.33.67 with SMTP id 61mr20255436qtc.37.1487612182117;
        Mon, 20 Feb 2017 09:36:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d22si13368760qkc.321.2017.02.20.09.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 09:36:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:40129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfrsr-00053h-GD
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 12:36:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cfrrP-0004O5-Rt
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:34:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cfrrP-0007Fv-0M
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:34:51 -0500
Received: from bee.antfield.fr ([188.165.75.195]:46326)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1cfrrK-0007ET-08; Mon, 20 Feb 2017 12:34:46 -0500
From: Clement Deschamps <clement.deschamps@antfield.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487612083; bh=n3GAhG3z4+lq5GGBx9W6uoN4Se4lwgOE62wiOPnVP/M=;
	h=From:To:Cc:Subject:Date:From;
	b=J6oGf/CFD+JAYypjiXdzOSwJjmsplR53xY6kxEF0BiTiLT5le9TYS3G9omVczoC3H
	DnNanWUTr6IhKUuitMJi9GJi/JlKqWLJOGK/NyxbpZ/KSnxpioXqyfEKTOCNEEYeMN
	ILophVkaMR4J26iKPkQaWcV8cTmq+5PplR/Is2Ww=
To: qemu-devel@nongnu.org
Date: Mon, 20 Feb 2017 18:34:28 +0100
Message-Id: <20170220173430.31630-1-clement.deschamps@antfield.fr>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: [Qemu-devel] [PATCH 0/2] add bcm2835 sdhost controller to bcm2835
 platform
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	andrew.baumann@microsoft.com, gregory.estrade@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q82IRr3Rg64C

This patches add the Arasan SD controller to the BCM2835/36 platforms.

The BCM2835/36/37 have 2 SD controllers.

The first one has an SDHCI interface and is already supported in QEMU
(hw/sd/sdhci.c), the second one is an IP from Arasan.

The latest versions of raspbian (since 2016) have a linux kernel which is using
the Arasan SD controller for better performances, and thus are not working with
the current version of QEMU.

This patch can be tested with the latest version of raspbian (2017-01-11-raspbian-jessie):
1. Extract kernel7.img and bcm2709-rpi-2-b.dtb from the first partition of 2017-01-11-raspbian-jessie.img
2. Run qemu-system-arm -M raspi2 -kernel kernel7.img -dtb bcm2709-rpi-2-b.dtb -append "rw root=/dev/mmcblk0p2 console=ttyAMA0 rootwait" -sd 2017-01-11-raspbian-jessie.img -sd 2017-01-11-raspbian-jessie.img

On the real hardware, both SD controllers are wired to the same SD card.
Selection is done via multi-function pins through the GPIO controller.  I'm not
sure what would be the good solution to emulate this in QEMU.  For now on we
pass two sd cards on the command line which is not ideal.

Note: In order to properly boot the kernel, you will first need to apply the
BCM2835 hardware RNG patch submitted recently.

Once raspbian has booted, the mouse and keyboard cannot be used in the
graphical environment because the USB is not yet implemented in the raspberry
pi emulation. Gregory Estrade and Andrew Baumann both worked on the USB
implementation, their work is available on Andrew's github.


Best regards,

Clement Deschamps

Clement Deschamps (2):
  bcm2835_sdhost: add bcm2835 sdhost controller
  bcm2835: add bcm2835_sdhost to bcm2835 platform

 hw/arm/bcm2835_peripherals.c         |  24 ++
 hw/arm/bcm2836.c                     |   7 +
 hw/arm/raspi.c                       |  13 +-
 hw/sd/Makefile.objs                  |   1 +
 hw/sd/bcm2835_sdhost.c               | 429 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/sd/bcm2835_sdhost.h       |  48 ++++
 7 files changed, 523 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/bcm2835_sdhost.c
 create mode 100644 include/hw/sd/bcm2835_sdhost.h

-- 
2.11.0

