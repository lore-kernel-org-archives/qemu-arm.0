Received: by 10.223.172.38 with SMTP id v35csp389047wrc;
        Wed, 20 Sep 2017 00:02:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAMMSAoC2qhFxkoXtezHenVxRlU7ACohQ5iR8YjWNESfZpUMEOmQr7ZOpIMVnD/7IBnp+2f
X-Received: by 10.55.75.75 with SMTP id y72mr5551637qka.118.1505890937894;
        Wed, 20 Sep 2017 00:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505890937; cv=none;
        d=google.com; s=arc-20160816;
        b=sxj5DSQnQDUjlfSIjpST/UX8h11Sp+7xWLvFy2N7BEaeSZdxnvwVzTM6YvAfl9AQIk
         D+wVcS1sT48Zri9Dmd9TZhy3baEkkeCyU6J9fXVZX9hwtj2hc4rmreLdxc8tj3fZLbYC
         aMI+MBcyJCIPg8fPYZ51S3PFPbi5qLKYHW621Ek3+i0bbZBERIAWxXvvcSsblPACujHs
         SFMhnoMDSKvT8xrTYy38WdRYKgV+B5W0bRJOePeLWORiiM7/puSEJwFHJk9vgNZqTVnF
         +vKYxyOWLNJknzt9uylidp8ufB0Pxx6ZL4Be1PTuB9HC8jRN7VogDUHtSLpY7OQ+YIRJ
         yEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=o9BBC5J8m/ba38aSAcq0PrKKdr0YE3dkeZX1UMCz9qI=;
        b=ob/dXnksD8hdmVhHU6xuQA2V+juhniPtnjPhkJqP5fyY0rc0t8mkiVkj1WmDb6y+4M
         EJnDYici/qBYso+dCiyftv0fsb1VmEtlyNpwbMhNbniWW9BktDEnWpemhj7W7fqlV/v1
         D67hDnU2kPUGuzrFfm8I8uUoFR+pv8a0m6Kd0Ps8c7LaAjn+8e6F50ZdjwxmLqDugMbY
         zHxA0riR9vKWZGeZmYaHEDXcU9cPmm5/fDVktaV+FRcerUjzDbdD8j49j5IbuCbxgFXo
         MI+qjM2oBG/Ye+AXu1j2dKpMcQp9zlYadqCQWGF0bMnxuhkzUqtC/HlqRMupKsrZ6k9E
         Vz8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2si1255232qkf.128.2017.09.20.00.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 00:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duZ1T-0004n7-Lj
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 03:02:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1H-0004mx-Ja
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 03:02:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1D-0008Ps-DK
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 03:02:03 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:35839)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duZ1D-0008O5-8D
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 03:01:59 -0400
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id AB521AC92F
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 09:01:57 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 7D8AB5000A6;
	Wed, 20 Sep 2017 09:01:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Sep 2017 09:01:29 +0200
Message-Id: <20170920070135.31379-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1325465666701986577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.48.182
Subject: [Qemu-arm] [PATCH v2 0/6] aspeed: add a witherspoon-bmc machine
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
X-TUID: PL9Wv6k+YvyG

Hello,

This series adds a new Aspeed machine to emulate the BMC of a
Witherspoon system. It also extends the other Aspeed machines with I2C
devices and adds a simple model for the pca9552 LED blinker present on
the witherspoon board.

Thanks,

C.

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
2.13.5

