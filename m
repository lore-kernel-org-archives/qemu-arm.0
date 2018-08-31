Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp441526wrd;
        Fri, 31 Aug 2018 03:39:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdbeiw87Jj3LjDGdrbeGmoZC6KoLm/JdnB4kLfvbu5/nrauoUh3xhhAIes42UF0BVawo4axM
X-Received: by 2002:a37:95c4:: with SMTP id x187-v6mr14526302qkd.195.1535711952748;
        Fri, 31 Aug 2018 03:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535711952; cv=none;
        d=google.com; s=arc-20160816;
        b=AeOph6T0Pbg9h1bG70aKYHAylCm5cX5/1Xip7QiMwpffFiClOXkjIrRtWYpUDoADhZ
         o1mT1s1oTbJa0QxvSK3SRquCADbDBJkApi21cOnrwSJunhKuvMES6aneQXhMbucZ1W9u
         yfZi9Q1N4TG7vhB5jYuO9QAR2G9Gw/6tmViGxpSydDmIQ2zA1H+xOsXl7iGd7D/ju+2H
         45LrV2ZN4a7Ir+xhZigEhb7RLxIJqmhDS0+9rKS1DxRLvkpDNqKn+dLPRMh9MNqm9Lv7
         oeUp6hu8dV2fxK9ltHuNZEjFEZaCWqXLk40JLSlOGXTILPvehO591IDltbLs2c7DahaQ
         qf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=JzHv9NND1KPZ8bnwyl2WqsQHL9UzaHuZvbDyjVS3A5w=;
        b=obcp+eKojzYLWmHDo6HCkE6EuAuEW3GGXCYiv8o+3n4rPNwQUh8ZXGVxFdkmctbyfD
         J+RIZQJ1JPnuPyXqalMRM3z8Vx2Mm6ZMh6XT7qrhXyj/3XQShfK3vZD9ZbsIYBAoGvJH
         nSTHajX9gqg7r4M/tgS9YFxio9WcO7HgGLWGMp+pIOGf9vv47iTigXeuoEmpyf5hRBA+
         Gj5lmK8w1WTrPUlsPFU05LME7nTVqEd57g8gxNip7OGNdrP7YPAFpfgNnNtZXdMxVHvH
         UEKDTZDNZnxy2yyLs0WeYRmuyjgfqVpaWRRfQmfQKHdFp0aP3ZIDmfAeVmiCIGwxc3Uo
         mFHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b37-v6si347242qkb.397.2018.08.31.03.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgpc-0002oX-5A
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:39:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgp0-0002Uh-Ol
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgox-0001Vs-II
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:38:34 -0400
Received: from 10.mo7.mail-out.ovh.net ([178.33.250.56]:39788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgox-0001VP-79
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:38:31 -0400
Received: from player168.ha.ovh.net (unknown [10.109.159.222])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id E1835CF18C
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 12:38:29 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 363E94200B1;
	Fri, 31 Aug 2018 12:38:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:07 +0200
Message-Id: <20180831103816.13479-1-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1919659344200239936
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.250.56
Subject: [Qemu-arm] [PATCH 00/11] aspeed: misc fixes and enhancements (SMC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QD5PfzMZvbZa

Hello,

This series adds a couple of cleanups and two main features to the
Aspeed machines :

 - a 'mmio-exec' property to boot directly from a memory region alias
   of the FMC flash module using MMIO execution. This is not activated
   by default because boot time needs to be improved on recent
   firmwares.

 - support for DMA to access the flash modules. Our primary need is
   the checksum calculation which is used to evaluate the best clock
   settings for reads.

Thanks,

C.

C=C3=A9dric Le Goater (11):
  aspeed/timer: fix compile breakage with clang 3.4.2
  hw/arm/aspeed: change the FMC flash model of the AST2500 evb
  hw/arm/aspeed: Add an Aspeed machine class
  hw/arm/aspeed: add a 'mmio-exec' property to boot from the FMC flash
    module
  aspeed/smc: fix some alignment issues
  aspeed/smc: fix default read value
  aspeed/smc: add a 'sdram_base' and 'max-ram-size' properties
  aspeed/smc: add support for DMAs
  aspeed/smc: add DMA calibration settings
  aspeed/smc: inject errors in DMA checksum
  aspeed/smc: Add dummy data register

 include/hw/arm/aspeed.h         |  48 ++++++
 include/hw/ssi/aspeed_smc.h     |   4 +
 include/hw/timer/aspeed_timer.h |   3 +-
 hw/arm/aspeed.c                 | 255 +++++++++++++------------------
 hw/arm/aspeed_soc.c             |  28 ++--
 hw/ssi/aspeed_smc.c             | 263 ++++++++++++++++++++++++++++++--
 hw/timer/aspeed_timer.c         |   1 -
 7 files changed, 428 insertions(+), 174 deletions(-)
 create mode 100644 include/hw/arm/aspeed.h

--=20
2.17.1

