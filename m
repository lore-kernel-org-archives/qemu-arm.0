Received: by 10.223.197.9 with SMTP id q9csp806986wrf;
        Fri, 13 Oct 2017 07:31:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDOjHP4oYKXSJhEunz47kI/dTsska1rv+F7vSyMloz6nHHgiJXLz0aPyqJw+llXqZVe5Bt+
X-Received: by 10.176.19.34 with SMTP id g31mr1326654uae.104.1507905110751;
        Fri, 13 Oct 2017 07:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507905110; cv=none;
        d=google.com; s=arc-20160816;
        b=tFLVeKmDmQSmythv3df25K6mHpwdY0jELGE1DF3i/W3BLYnt50aDaFNXwu6jWQtLet
         sD7GSBf1y5730NDmOc+esH9K3DKD4VjkK2EKmkaL5O4JfdMWlr3YVAseFTHejhthWir2
         etSC0naf5wvllthkEuiwuxJswnRoGgBPHG45rfOD8bUlyUlQ+QClfwCQ7/PQUYwbYic3
         PoZZ6eUj9kqJyJt2dQMm5XgYA2rcDzWk9/9h3bsgigXg38kylRe/MOgEM9LqtfGnZ4zE
         VTgHJPNNY7AaZcgXPhzKeSR0Y81M1D6KY/pgBhZAgj15ruZumUZusHm7zAoalHkY5tC8
         ejfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=o3orAfdXlvz8a5VcYrCY4RadJhcJKH/6Dun3FHXW3uo=;
        b=nSs7HFY8zLPttPtDSRQB3D7+urkJfIUYDMyDLp/W545d9Nb6hqGh4n9aiKynscVZuO
         uMXpViJtZg8Rpas0c0ydpGM1/dO12Rx/BgSYpie1d10NNz86DzLdb6NYs53N3E7KVrF5
         I4flpPHTaQePS4k+QqQFka6FsdBkRzrywywvUG7p/Yoy7BpPqLD3MPdqrWgEvisp3BP2
         L9KZFY7n2b3CPgcpNg1i0jev9T4rlQyIS3UoISDinhmnKjeOiRIODA4LH6Tde4gHH2xK
         UcWGlXb8L0B0kCWAZ/BRs5lYYZOXMoDAVIdx++99++ky0lLtu1jNJ+7BfextvM+3knjk
         J9cA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s31si303207uas.253.2017.10.13.07.31.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 07:31:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e3108-0006kS-AO
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 10:31:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30xw-00052r-AP
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30xn-0000Wc-UZ
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:27 -0400
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:46593)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e30xn-0000S8-O6
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:23 -0400
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 92105E5BB7
	for <qemu-arm@nongnu.org>; Fri, 13 Oct 2017 16:29:14 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id C0E5448007D;
	Fri, 13 Oct 2017 16:29:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Oct 2017 16:28:46 +0200
Message-Id: <20171013142852.916-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14824161126811994897
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtdeigdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.40.29
Subject: [Qemu-arm] [PATCH v3 0/6] aspeed: add a witherspoon-bmc machine
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
X-TUID: 5ai+M8jM7U0a

Hello,

This series adds a new Aspeed machine to emulate the BMC of a
Witherspoon system. It also extends the other Aspeed machines with I2C
devices and adds a simple model for the pca9552 LED blinker present on
the witherspoon board.

Thanks,

C.

Changes since v2:

 - removed comments on the I2C buffer size pf the PCA9552 device.
 - removed 'ignore_memory_transaction_failures' flag on the
   witherspoon machine.
  =20
Changes since v1:

 - introduced smbus_eeprom_init_one()

C=C3=A9dric Le Goater (6):
  aspeed: add support for the witherspoon-bmc board
  aspeed: add an I2C RTC device to all machines
  smbus: add a smbus_eeprom_init_one() routine
  aspeed: Add EEPROM I2C devices
  misc: add pca9552 LED blinker model
  aspeed: add the pc9552 chips to the witherspoon machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |  85 ++++++++++++++++
 hw/i2c/smbus_eeprom.c           |  16 ++-
 hw/misc/Makefile.objs           |   1 +
 hw/misc/pca9552.c               | 212 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/i2c/smbus.h          |   1 +
 include/hw/misc/pca9552.h       |  32 ++++++
 7 files changed, 343 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/pca9552.c
 create mode 100644 include/hw/misc/pca9552.h

--=20
2.13.6

