Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4309244wrg;
        Sat, 25 May 2019 08:13:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyquqXjMHACmKOwF10oFcCTNOeyftfluH02FJrL1EFm+Rc5WZ2uDRr2lhFxtntLyb5mO1tJ
X-Received: by 2002:ab0:7453:: with SMTP id p19mr9049663uaq.15.1558797197180;
        Sat, 25 May 2019 08:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558797197; cv=none;
        d=google.com; s=arc-20160816;
        b=0n05aUN9WTV1S4a822daNY5pSugZ9PmpyL8EiS1m0wRDdyjlZKfG+IXLh4pzhpyRLL
         UZO6Ny+vlFYqLGP9giF0wy7h7iRqipFjcF7v9yMtH7LwZTUVqpxHr1QfV6UQ8RSAyjDi
         ygenCqgzr99gnqGjYFVnR5Kd/tD5PhDxwNDi8ECHprr+zziERyRlWq1gl7iLhtDu8T+w
         VaJ74iInW4PiyGH8kdHOUx3VnlqGurAgBBZT69q/2QxF+2kXHxHN9Ff+Db1kDYiHD68r
         aHF3uDuw4UI++OsGjddPoEGI0V20Zr94Cl9so2Gp87/OcYbvQosdL18qxd6TMESNP15+
         GO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=HYm6MzxABhkiPeUwsJe0Si6wFntyRKjIZ4nWboA1gSQ=;
        b=RtGcAcQOb3SUUu3WG/wdM9u62zY23r6Ny84i6N3QNRWkLqfTMwpC173/nSTCd+o2AQ
         vn4Z8JorGK1BR7C2q56dVLS3FYjh4D5y9EqEedBppoLDaSM3XujWsOxhaE9ZpTBQ2B7z
         2ZdPLz1TRuSaAGVFAjJ1s7PSmq8nJHxvjnZbGuen1ttD/ToeQS3U3DMHWxW8cNtS8IG8
         oaK1C2/JLhohJoqoA4r+ise49BK5puNRRUfmmMomgaorn4U6sT7VmffpQhhLQFZJoaTA
         faSNY6YUX8/p/yeXV6IRsSZP3AXZPD73D3LRX/6vrUGfGCRdcNSyFUYH6HMgTX9zZUNT
         8uWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si2072910vsp.214.2019.05.25.08.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYMG-0005Gm-KJ
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:13:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYM4-0005Fr-5u
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYM2-00017Z-Vp
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:04 -0400
Received: from 5.mo178.mail-out.ovh.net ([46.105.51.53]:35410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYM2-0000wy-9s
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:02 -0400
Received: from player698.ha.ovh.net (unknown [10.109.160.76])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id E0886665C0
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:12:52 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 866E6625A6BA;
	Sat, 25 May 2019 15:12:46 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:22 +0200
Message-Id: <20190525151241.5017-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6589892155795213073
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.51.53
Subject: [Qemu-arm] [PATCH 00/19] aspeed: machine extensions and fixes
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XAmJHpPoJCJR

Hello,

This series improves the current models of the Aspeed machines in QEMU
and adds new ones. It also prepares ground for the future Aspeed SoC.
You will find patches for :

 - per SoC mappings of the memory space and the interrupt number space=20
 - a RTC model from Joel
 - support for multiple CPUs and NICs
 - fixes for the timer model from Joel, Andrew and Christian
 - DMA support for the SMC controller, which was reworked to use a RAM
   container region as suggested by Peter in September 2018

It is based on Eduardo's series" Machine Core queue, 2019-05-24"

  http://patchwork.ozlabs.org/patch/1105091/

I have included Philippe's patch (comes first) in this patchset for
reference only.

Thanks,

C.

Andrew Jeffery (3):
  aspeed/timer: Status register contains reload for stopped timer
  aspeed/timer: Fix match calculations
  aspeed/timer: Provide back-pressure information for short periods

Christian Svensson (2):
  aspeed/timer: Ensure positive muldiv delta
  aspeed/smc: Calculate checksum on normal DMA

C=C3=A9dric Le Goater (10):
  aspeed: add a per SoC mapping for the interrupt space
  aspeed: add a per SoC mapping for the memory space
  aspeed: introduce a configurable number of CPU per machine
  aspeed: add support for multiple NICs
  aspeed/smc: add a 'sdram_base' propertie
  aspeed: remove the "ram" link
  aspeed: add a RAM memory region container
  aspeed/smc: add support for DMAs
  aspeed/smc: add DMA calibration settings
  aspeed/smc: inject errors in DMA checksum

Joel Stanley (3):
  hw: timer: Add ASPEED RTC device
  hw/arm/aspeed: Add RTC to SoC
  aspeed/timer: Fix behaviour running Linux

Philippe Mathieu-Daud=C3=A9 (1):
  hw/arm/aspeed: Use object_initialize_child for correct ref. counting

 include/hw/arm/aspeed.h         |   1 +
 include/hw/arm/aspeed_soc.h     |  48 ++++-
 include/hw/ssi/aspeed_smc.h     |   9 +
 include/hw/timer/aspeed_rtc.h   |  31 +++
 include/hw/timer/aspeed_timer.h |   1 +
 hw/arm/aspeed.c                 |  35 ++--
 hw/arm/aspeed_soc.c             | 283 ++++++++++++++++++----------
 hw/misc/aspeed_scu.c            |   6 +
 hw/ssi/aspeed_smc.c             | 323 +++++++++++++++++++++++++++++++-
 hw/timer/aspeed_rtc.c           | 180 ++++++++++++++++++
 hw/timer/aspeed_timer.c         |  84 ++++++---
 hw/timer/Makefile.objs          |   2 +-
 hw/timer/trace-events           |   4 +
 13 files changed, 854 insertions(+), 153 deletions(-)
 create mode 100644 include/hw/timer/aspeed_rtc.h
 create mode 100644 hw/timer/aspeed_rtc.c

--=20
2.20.1

