Received: by 10.223.197.9 with SMTP id q9csp6918708wrf;
        Thu, 19 Oct 2017 08:13:30 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RF24JWodj/H7u3XcKoL0+5xHRltH2mhwm2NBIXc0b2Pj1LYJ79CGOhDZQRaU9gHRqfG5I7
X-Received: by 10.55.221.68 with SMTP id n65mr2433140qki.27.1508426010242;
        Thu, 19 Oct 2017 08:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508426010; cv=none;
        d=google.com; s=arc-20160816;
        b=u+FZJn8JyElaWLXNJoKP3aCR/treOpFX3UfQTGFrnqYDQ71iKLE/66VHMVyYwn3ejb
         yhKimTm4UUU/t+EB//alOLAL/nAzoKSZjeOs+GVbBeu+ASwtvxjnXEq0r2Jpzw1NYteL
         Ovo0rNrg4I+ois85MMRD0lObW6g4sRxzdd4ldi6Q3o5faFx3fvcNwyRAv5nbtskeDHUi
         kRw8EkX8Cituw2EQBfZSkefaiouPwDOTXKTPIRIjPofuamYinlq4L9UBgqIlX7NZzz1E
         qCMFPCbzZL3QGwtDNFCy8DHOv6W89XsTAz5lrY5aMTuzTUGyC65mamuSbm0sz8ddJv7o
         f4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=+9odtd9sKo1uvO5eIpyEzJpIESJfTns5fGYyriCxbdM=;
        b=zOZLK9Z0s78Qjp3eaRx8p/XIvgAo9D3UbCYfrOzG6smrURruoTVC/9C6RIjVlPxvXa
         hIy1XiJL1mGr+5fkoea6tvGl5x0ycd8d2ViLYPRc7Ziyq4Koa05tSJ0kvqgt5BEmJs0B
         1enxAEYtMThU+pxLeej1dmK0VBGUn+lWyc1weLHGI/PTFNDda3mnIyXrTIkubefBkBUv
         OjW8Bq2oNFIXQ+L7RhWnEZ0r4qrg0xK51wpDSzymPEWUpJrpDb29Wd/Opr3+m7M7v8+V
         l1AFwREXGExBEInWgbkUc4ZtXzb1aGm2pox24Gi4AKZqSLa7b9ucqOGxg8yOZwpAjiVx
         In8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a4si1544734qkc.153.2017.10.19.08.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:13:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CVk-00019e-0b
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:13:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVQ-00019T-LN
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVM-00016L-Is
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:08 -0400
Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]:51418)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5CVM-00015M-C6
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:04 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id E0531145E8A
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 17:13:00 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id DA86B8008A;
	Thu, 19 Oct 2017 17:12:52 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:12:41 +0200
Message-Id: <20171019151249.13663-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13905989752713349905
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.96.204
Subject: [Qemu-arm] [PATCH v5 0/8] aspeed: add a witherspoon-bmc machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZNOHqPIOYFEM

Hello,

This series adds a new Aspeed machine to emulate the BMC of a
Witherspoon system. It also extends the other Aspeed machines with I2C
devices and adds a simple model for the pca9552 LED blinker present on
the witherspoon board.

Thanks,

C.

Changes since v4:

 - use a ROM memory region

Changes since v3:

 - introduce a dummy ROM device to catch invalid writes
 - removed 'ignore_memory_transaction_failures' on all Aspeed machines
 - reworked PCA9552 device :
   . simpler I2C handles
   . auto-increment support
   . unit test

Changes since v2:

 - removed comments on the I2C buffer size pf the PCA9552 device.
 - removed 'ignore_memory_transaction_failures' flag on the
   witherspoon machine.
  =20
Changes since v1:

 - introduced smbus_eeprom_init_one()

C=C3=A9dric Le Goater (8):
  aspeed: use a ROM memory region to catch invalid writes
  aspeed: remove ignore_memory_transaction_failures all boards
  aspeed: add support for the witherspoon-bmc board
  aspeed: add an I2C RTC device to all machines
  smbus: add a smbus_eeprom_init_one() routine
  aspeed: Add EEPROM I2C devices
  misc: add pca9552 LED blinker model
  aspeed: add the pc9552 chips to the witherspoon machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 | 110 ++++++++++++++++-
 hw/i2c/smbus_eeprom.c           |  16 ++-
 hw/misc/Makefile.objs           |   1 +
 hw/misc/pca9552.c               | 259 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/i2c/smbus.h          |   1 +
 include/hw/misc/pca9552.h       |  33 +++++
 tests/Makefile.include          |   2 +
 tests/pca9552-test.c            | 131 ++++++++++++++++++++
 9 files changed, 544 insertions(+), 10 deletions(-)
 create mode 100644 hw/misc/pca9552.c
 create mode 100644 include/hw/misc/pca9552.h
 create mode 100644 tests/pca9552-test.c

--=20
2.13.6

