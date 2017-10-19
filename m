Received: by 10.223.197.9 with SMTP id q9csp6632406wrf;
        Thu, 19 Oct 2017 03:06:27 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SlF39KL+nGLvRLUDbRGb56nSATzTtHyfecNNBdzVGJ3exNBYqxVi1hhy0H7LbOLh3+2yKg
X-Received: by 10.55.93.7 with SMTP id r7mr1193807qkb.35.1508407587678;
        Thu, 19 Oct 2017 03:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407587; cv=none;
        d=google.com; s=arc-20160816;
        b=QRHDPTmPEcDV75/AsI0eHFH/w5/SNTOfV0OpnSUcmPIPqTpt+IQxC36eN2B7boJWO/
         SroxCywzhsnJ91ZXUAM0yOZh1Zojgvh6eDjiwkNAA+uh/xqOWx0y3Yme3u1xHKHWWCf4
         u42C+TqCgOXOWm9i77OgmFQUpreE0yWb5g498YksbcBejcFOULU/9SeWnbXUzr2bTkyh
         j6UBAHfhCuWBNKkLGl+nrjrW8ZfnwgsAagwXvSOFvq++pqjIFKw7dHwyYAJgiGJtLts3
         rPGVE9kbloXHCVyV11IAxbr5LYc460aPeRY4iFuZkw6y9Is3JQf/REodk7CKn6DBmvoy
         VHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=R34qqT0vQxFjKnp5O/AZhe1lM1QY2m8oHvpfsBdNKCM=;
        b=rEcxbxcf+J9NQACvmDWYpJzAwPqdQdyEaGCf8Y1LZ/Z5DGf7f998JiQzKvtdwy4FUA
         GFuthRbD47ZWWMmfHINYBB0gIZeeGZWpPyfebnLCd0eP3OOiDSY4V2QO95pxRxTVQOV+
         NA4EbXLfr9oFCLkxawPKcqETBLuZ7Tm+HFWUC8QXcQCaBqJeMSp07iFh/W7AviZucfw6
         YvqLPwawX0DN4aDO/TRREPLxePVxqc6UfJ/0lA7JFuYG4Ai/ocszKjJ2BGQBWoyr+Btg
         Nn3GNzpgjwSkq0phRZ6ZarMv1iLdbfhkxpCU5jofnC3lL92fYwgESj2Kt7xR80QKjmd0
         O7ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z123si1517723qke.389.2017.10.19.03.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57ib-0003lU-CB
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:06:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57gl-0002la-6J
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57gf-0007pc-BQ
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:31 -0400
Received: from 5.mo5.mail-out.ovh.net ([87.98.173.103]:44150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57gf-0007nj-5g
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:25 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 59D11145A05
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 12:04:22 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id EA5AC8006F;
	Thu, 19 Oct 2017 12:04:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:02 +0200
Message-Id: <20171019100410.26239-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8693354656085150481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.103
Subject: [Qemu-devel] [PATCH v4 0/8] aspeed: add a witherspoon-bmc machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fN23IMWgypwJ

Hello,

This series adds a new Aspeed machine to emulate the BMC of a
Witherspoon system. It also extends the other Aspeed machines with I2C
devices and adds a simple model for the pca9552 LED blinker present on
the witherspoon board.

Thanks,

C.

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
  aspeed: introduce a dummy ROM device to catch invalid writes
  aspeed: remove ignore_memory_transaction_failures on all boards
  aspeed: add support for the witherspoon-bmc board
  aspeed: add an I2C RTC device to all machines
  smbus: add a smbus_eeprom_init_one() routine
  aspeed: Add EEPROM I2C devices
  misc: add pca9552 LED blinker model
  aspeed: add the pc9552 chips to the witherspoon machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 | 112 ++++++++++++++++-
 hw/i2c/smbus_eeprom.c           |  16 ++-
 hw/misc/Makefile.objs           |   1 +
 hw/misc/pca9552.c               | 259 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/i2c/smbus.h          |   1 +
 include/hw/misc/pca9552.h       |  33 +++++
 tests/Makefile.include          |   2 +
 tests/pca9552-test.c            | 131 ++++++++++++++++++++
 9 files changed, 548 insertions(+), 8 deletions(-)
 create mode 100644 hw/misc/pca9552.c
 create mode 100644 include/hw/misc/pca9552.h
 create mode 100644 tests/pca9552-test.c

--=20
2.13.6

