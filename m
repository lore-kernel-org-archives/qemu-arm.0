Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4399813wre;
        Tue, 29 May 2018 23:41:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKdEIody6NmM/Gk+oBAM911Kf4N/ZZDyOmtbwP2rCrgUP4o3Qb4ivoxaOO2cGTcuWvaMhWQ
X-Received: by 2002:a37:678b:: with SMTP id b133-v6mr1258960qkc.54.1527662494765;
        Tue, 29 May 2018 23:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662494; cv=none;
        d=google.com; s=arc-20160816;
        b=velu3L11xKTw0a978sKPDGBAhxB8ZmyC1iTbhXYQkjgUjIDF+Iw+VbdnqiQ5nKsp8l
         7KpNDzBHRNpd/GJUlOiIp73egazbKFjKw2C7rxOIoniScq+fkqud1U3Ralr2VaVc2Jdf
         PSIgRQIhqeyqm+R77CpLtSzlNoofGQ9AC2AwYgXWvRxTLvAqbfCwQqJHOyVBX7B+/XgF
         TU/87DqZr+GU16cZrynroSuwQxkRvgPUexuPVEinkHNMqB16b2DOyMNDTiwTzP7EFyul
         QxLSzeVbd9DITjuqvYUgd3uZr5PS/DfyJ+6mr2Int+97Bc0MQt1KltLuUnaSnDM4Laom
         ij7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=0JR8zvtxURI18hxuBbjtirh3IEB4w6bQjgnuT61DFdo=;
        b=DAATdeGL8Lrg/FjJQkyLYRQCuNsbjfuatIfET89IryF0WlGvaH4Mg9iURyWK2lrrpD
         U9PqcS48Q0b+jk2tw0tb+NZ8mnYinYFzRQtk13Oflglw5MYKYVYs56h/09wZs7SSDEhT
         rU+X3oQ/OMeQy/B65hWLB9Rl3NgIWlFdENbjiIxk1KwxbfepON+OGpnWcb1SzqHFsCv5
         fNp/ZrbLMGyqs7QeMunEn0PVxfEC0Wo0MW8GndhzleTjYypK0poP3LdwAZm0VnUkNSy+
         AL+DzntAaIp5WxSbWYxnDnbkxiDi2XpEb1QPDhxa6T5H032+FfG4CdkaxnFUKNfDg36u
         5arA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si822822qvb.41.2018.05.29.23.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:41:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNune-0002CB-70
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunS-0002Ac-5b
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunO-00013v-8Z
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:22 -0400
Received: from 4.mo6.mail-out.ovh.net ([87.98.184.159]:42076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNunO-00011g-2f
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:18 -0400
Received: from player159.ha.ovh.net (unknown [10.109.105.97])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 7B52B15CA5B
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:41:08 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 687024800B2;
	Wed, 30 May 2018 08:40:59 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 08:40:42 +0200
Message-Id: <20180530064049.27976-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5153243877037148945
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.184.159
Subject: [Qemu-arm] [PATCH v7 0/7] aspeed: add a witherspoon-bmc machine
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
X-TUID: yQPIDWM7hBpA

Hello

This series adds a new Aspeed machine to emulate the BMC of a
Witherspoon system. It also extends the other Aspeed machines with I2C
devices and adds a simple model for the pca9552 LED blinker present on
the Witherspoon board.

Thanks,

C.

Changes since v6:

 - removed code duplication in the pca9552 test
 - removed the ROM memory region catching invalid writes

C=C3=A9dric Le Goater (7):
  aspeed: remove ignore_memory_transaction_failures on all boards
  aspeed: add support for the witherspoon-bmc board
  aspeed: add an I2C RTC device to all machines
  smbus: add a smbus_eeprom_init_one() routine
  aspeed: Add EEPROM I2C devices
  misc: add pca9552 LED blinker model
  aspeed: add the pc9552 chips to the witherspoon machine

 default-configs/arm-softmmu.mak |   1 +
 include/hw/i2c/smbus.h          |   1 +
 include/hw/misc/pca9552.h       |  32 ++++++
 include/hw/misc/pca9552_regs.h  |  32 ++++++
 tests/libqos/i2c.h              |   2 +
 hw/arm/aspeed.c                 |  88 ++++++++++++++-
 hw/i2c/smbus_eeprom.c           |  16 ++-
 hw/misc/pca9552.c               | 240 ++++++++++++++++++++++++++++++++++=
++++++
 tests/pca9552-test.c            | 116 +++++++++++++++++++
 tests/tmp105-test.c             |   2 -
 hw/misc/Makefile.objs           |   1 +
 tests/Makefile.include          |   2 +
 12 files changed, 523 insertions(+), 10 deletions(-)
 create mode 100644 include/hw/misc/pca9552.h
 create mode 100644 include/hw/misc/pca9552_regs.h
 create mode 100644 hw/misc/pca9552.c
 create mode 100644 tests/pca9552-test.c

--=20
2.13.6

