Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp583237lfc;
        Tue, 19 Nov 2019 06:12:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpHLk+NE2I+JNMmUkQTsrnRzyQ0aAan7BhbwsY5mI7dKrxKoldsaBUGSHl+5dlZPArb7/D
X-Received: by 2002:ac8:e03:: with SMTP id a3mr32867941qti.169.1574172753077;
        Tue, 19 Nov 2019 06:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172753; cv=none;
        d=google.com; s=arc-20160816;
        b=RMLjR8PKKBvariBQyY+EujDuMC1r6V8fk3rtOsKDIwTad9IZFaeBAalZROT8Yj/KMC
         DAjCakpzjF8U8cQwuKZCQ2N0RQftYsZpb0PNeFbHnMcSdoEsTHBpJR2QNoVo4Q+ktiHG
         s+w5fj3GuOzKf1pJZdY/YCnGT27zw1R3ZrgzJ120Rrktpe9ZJ8J8Q10qkChdGm8x5+7f
         pP4SOxthiIBxNI/F0iUR9zPAySP+yUkTBtWP1qGIzJaeoMOvV0mrrMIydGaWHMZjWjW2
         mOeBDG3jPYpY/cjx68PhLMtiUS5b5YkAAV83qlijNILcd8sOcsowOfGuxZE6YuGSCCQ5
         ZROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=O9XARf8uJH9RvkEBT1lK2CE9NoZeT1qBg8Ao/xdD8FY=;
        b=wYQywP1NekP1/4hHPzO3NGoShAeIb6Y4GmMD2w1dyPesrv53kilvDRo/pXRlUHza1D
         UciSZQKjSXO/WRR9ugLmbk3Yrg8UHvx4E3wu6qeaQLYN+/Gsl8VxWHg3lZCguuIMR+c4
         9/x7/Fwrt6oU//BW4VnT3M/DkzepRjWVGNSc+y3HccFQKWyZMD+xPBpCrKMDgWm867zH
         KZ0nelZ/YBUtd8pHIwYIvpDJwTebln5/Jf1a09qWb/1qUCJkHtN/GfnVhDnWC3WE661P
         QSda7HqVrdjbsfGgPCPC/877VRj2g6FlH0jKUBKzrSbVHKxSNz496vPYsl4sP/BT5g5X
         djpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si14335026qtn.97.2019.11.19.06.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:12:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4F6-0004xN-Dg
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4Ex-0004vi-Tb
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:12:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4Ew-0004wo-Gz
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:12:23 -0500
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:44608)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4Ew-0004vv-AU
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:12:22 -0500
Received: from player795.ha.ovh.net (unknown [10.109.159.222])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id C220E19BDCA
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 15:12:19 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 8F5EBC18A6C7;
 Tue, 19 Nov 2019 14:12:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 00/17] aspeed: extensions and fixes
Date: Tue, 19 Nov 2019 15:11:54 +0100
Message-Id: <20191119141211.25716-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17889142144973507345
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.38.232
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JOJUrvs2jSkR

Hi,

Here is a series adding :

 - support for pool buffer transfers in the I2C controller
 - fixes for the AST2600 and for the SMC controller
 - a new Tacoma BMC board using the AST2600 SoC.
 - misc small cleanups

Thanks,

C.


C=C3=A9dric Le Goater (12):
  aspeed/i2c: Add support for pool buffer transfers
  aspeed/i2c: Check SRAM enablement on AST2500
  aspeed: Add a DRAM memory region at the SoC level
  aspeed/i2c: Add support for DMA transfers
  aspeed/i2c: Add trace events
  aspeed/smc: Restore default AHB window mapping at reset
  aspeed/smc: Do not map disabled segment on the AST2600
  aspeed/smc: Add AST2600 timings registers
  aspeed: Remove AspeedBoardConfig array and use AspeedMachineClass
  aspeed: Add support for the tacoma-bmc board
  aspeed: Change the "scu" property definition
  aspeed: Change the "nic" property definition

Joel Stanley (4):
  aspeed/sdmc: Make ast2600 default 1G
  aspeed/scu: Fix W1C behavior
  watchdog/aspeed: Improve watchdog timeout message
  watchdog/aspeed: Fix AST2600 frequency behaviour

PanNengyuan (1):
  gpio: fix memory leak in aspeed_gpio_init()

 include/hw/arm/aspeed.h          |  24 +-
 include/hw/arm/aspeed_soc.h      |   1 +
 include/hw/i2c/aspeed_i2c.h      |  16 ++
 include/hw/ssi/aspeed_smc.h      |   1 +
 include/hw/watchdog/wdt_aspeed.h |   1 +
 hw/arm/aspeed.c                  | 259 ++++++++++--------
 hw/arm/aspeed_ast2600.c          |  25 +-
 hw/arm/aspeed_soc.c              |  22 +-
 hw/gpio/aspeed_gpio.c            |   1 +
 hw/i2c/aspeed_i2c.c              | 439 +++++++++++++++++++++++++++++--
 hw/misc/aspeed_scu.c             |  19 +-
 hw/misc/aspeed_sdmc.c            |   6 +-
 hw/net/ftgmac100.c               |  19 +-
 hw/ssi/aspeed_smc.c              |  63 +++--
 hw/timer/aspeed_timer.c          |  17 +-
 hw/watchdog/wdt_aspeed.c         |  41 ++-
 hw/i2c/trace-events              |   9 +
 17 files changed, 744 insertions(+), 219 deletions(-)

--=20
2.21.0

