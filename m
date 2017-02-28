Received: by 10.25.0.147 with SMTP id 141csp1438608lfa;
        Tue, 28 Feb 2017 07:17:42 -0800 (PST)
X-Received: by 10.31.54.85 with SMTP id d82mr1032937vka.25.1488295062767;
        Tue, 28 Feb 2017 07:17:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d18si754226uab.63.2017.02.28.07.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Feb 2017 07:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cijX2-00048s-8R
	for alex.bennee@linaro.org; Tue, 28 Feb 2017 10:17:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cijJx-0000lt-Nu
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:04:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cijJt-0001LQ-Ub
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:04:09 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cijJt-0001HT-Ot; Tue, 28 Feb 2017 10:04:05 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cijBI-0003I2-FQ; Tue, 28 Feb 2017 14:55:12 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 28 Feb 2017 14:55:07 +0000
Message-Id: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/4] handle reparenting of SD cards for rpi2
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KrBat8cYw/OO

These patches are a respin of Clement's work on the
rpi2 sd controller/gpio. They fix the valgrind issue that
I was seeing because we got reparenting of the card wrong.

This patchset adds a new qdev patch which makes the
qdev_set_parent_bus() function do most of the work of
unplugging and replugging if the device was already on
a bus. In particular it calls bus_remove_child() which does
a lot of things that the previous "just call object_unparent"
attempt didn't do.

Comments on whether this makes sense to people welcome.
I'm still kind of hoping we can squeeze this into 2.9;
comments on whether that would be unwise also welcome.

thanks
-- PMM


Clement Deschamps (3):
  hw/sd: add card-reparenting function
  bcm2835_gpio: add bcm2835 gpio controller
  bcm2835: add sdhost and gpio controllers

Peter Maydell (1):
  qdev: Have qdev_set_parent_bus() handle devices already on a bus

 hw/gpio/Makefile.objs                |   1 +
 include/hw/arm/bcm2835_peripherals.h |   4 +
 include/hw/gpio/bcm2835_gpio.h       |  39 ++++
 include/hw/sd/sd.h                   |  11 ++
 hw/arm/bcm2835_peripherals.c         |  43 ++++-
 hw/core/qdev.c                       |  14 ++
 hw/gpio/bcm2835_gpio.c               | 353 +++++++++++++++++++++++++++++++++++
 hw/sd/core.c                         |  27 +++
 8 files changed, 490 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/gpio/bcm2835_gpio.h
 create mode 100644 hw/gpio/bcm2835_gpio.c

-- 
2.7.4

