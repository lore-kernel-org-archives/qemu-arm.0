Received: by 10.223.197.9 with SMTP id q9csp7006857wrf;
        Thu, 19 Oct 2017 09:42:25 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QelD5ECsnLTljY7Nm85BVzmf09R9HK5D4Y3++LND3KYQ7e0WJa7/oHju7GZUbkWM5cFNKe
X-Received: by 10.55.25.85 with SMTP id k82mr2635298qkh.223.1508431345337;
        Thu, 19 Oct 2017 09:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508431345; cv=none;
        d=google.com; s=arc-20160816;
        b=rltaztKU8Kpx96iCZEXFVgbR63uUlcNtW4MVqIp0tID6TbWO5X7LfUlqZ8OKy1Imxy
         Qm2heSEkGvBCswxbzPDqVbYU/JlMxVPIhDKduUgOCRjXfR66EidOTlvDvnVf3I6gXQrv
         AYrk+yqi9sxny8D06wDIBeYoKaWR9k0xZRY9mYmklvdR25lTYfINVNdCEuPtEWXHNNyZ
         l6jnz06kNUPNNFeWV2a2IyDvfXQixuA80iagk8VkDvBohab52Xt+IpS65lLOJ2hBeFhy
         KeWvmWwZEei2MseF4RAa4sfUvKun2EVd9mt7oow6F3Dq5Elz1mKShUG6o9NWcPh/PVM0
         NMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=cRQeTMgs+F/urWe+7xr9sNXZybviOL8WfBxUyHtkUKs=;
        b=YGh7hvL2TmXLK84sQPdJuYNt1w8RX0gVcitu1wt3R+Wc1irPuJLG6WtxYxjqDdm87u
         PxxyumdKbJeRpC1DcJDEFecnrLzQU0OO+Izw6HyeWWmhWlZ++0Vdz4LebzGBWiNWZAAb
         2w7GvkOylj4KbL1qSZk3PC40V17JaNJw8JTWGqlAZ3DiIetBngnKTtrSvYTccI1L8iWE
         vdyCSm2u7m3ymW9kUD+iG5A9tuzf3WhkIYhRuhMNSYlAMhFKVV5OoE5yJAbnr+/IqB3C
         rpzDCfD7J07f2ZYrd4xgD+7OKHIwonwCxRj3t7YQibwrCRS+zfMcqFke9SarCmJwAYCf
         s/hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y41si3084649qty.434.2017.10.19.09.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 09:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Dtn-0005gC-1L
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 12:42:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Dne-00011L-VV
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DnZ-0003JO-Us
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:02 -0400
Received: from 6.mo5.mail-out.ovh.net ([178.32.119.138]:49707)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5DnZ-0003In-Ok
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:35:57 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 2E08B1461D8
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 18:35:56 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 9A6778007E;
	Thu, 19 Oct 2017 18:35:49 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:35:38 +0200
Message-Id: <20171019163546.2039-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15306609234974575377
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.119.138
Subject: [Qemu-devel] [PATCH v6 0/8] aspeed: add a witherspoon-bmc machine
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
X-TUID: 5l/T5r0Q5zOf

Hello,

This series adds a new Aspeed machine to emulate the BMC of a
Witherspoon system. It also extends the other Aspeed machines with I2C
devices and adds a simple model for the pca9552 LED blinker present on
the witherspoon board.

Thanks,

C.

Changes since v5:

 - created the ROM memory region even if there is no file backend
   specified by the user

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
  aspeed: remove ignore_memory_transaction_failures on all boards
  aspeed: add support for the witherspoon-bmc board
  aspeed: add an I2C RTC device to all machines
  smbus: add a smbus_eeprom_init_one() routine
  aspeed: Add EEPROM I2C devices
  misc: add pca9552 LED blinker model
  aspeed: add the pc9552 chips to the witherspoon machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 | 139 ++++++++++++++++++---
 hw/i2c/smbus_eeprom.c           |  16 ++-
 hw/misc/Makefile.objs           |   1 +
 hw/misc/pca9552.c               | 259 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/i2c/smbus.h          |   1 +
 include/hw/misc/pca9552.h       |  33 +++++
 tests/Makefile.include          |   2 +
 tests/pca9552-test.c            | 131 ++++++++++++++++++++
 9 files changed, 560 insertions(+), 23 deletions(-)
 create mode 100644 hw/misc/pca9552.c
 create mode 100644 include/hw/misc/pca9552.h
 create mode 100644 tests/pca9552-test.c

--=20
2.13.6

