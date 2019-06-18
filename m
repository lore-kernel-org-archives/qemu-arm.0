Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3969542wrg;
        Tue, 18 Jun 2019 10:18:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUdgM0kNJl34L7ntiUovFyXRz1z4cofARzXjer27qSEceJAfqYje7ZbQEpGHxEZIHPIco6
X-Received: by 2002:a37:48c7:: with SMTP id v190mr28109839qka.350.1560878306456;
        Tue, 18 Jun 2019 10:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560878306; cv=none;
        d=google.com; s=arc-20160816;
        b=wz83H2tRun4PdUWNQk07aTwJD2JkEee4MgTaJ7SaYyBPuniCTJoMJuor1dSUb9+VCJ
         NsAPRB1toD+dA8cN8+kq5BaMh8AQCEPR2NlaCDASqsLBr5u6hovC3oo9zLF+0CKEdsHS
         pYjxHV7b/6dFwOM6w1PVsyZ/6lhuXNjVP8oEz/OnoyCnn9StLhNBW6Pwv6qXvuyhUsxk
         4laaMybMwP2JHhne4Wer7Nl9zROjmpNSN03nc94GDUnLLV0Wm1CUXyeI97WEOzTcuaKC
         dL8Z6xcK1XAYMID5w5JFI+W0jC4kNYZr9Hb8ZXEegrUOP4OI8UyO0LnxZV7NqKLam7EF
         /y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ihZ0jJuaKNFutww/3d2vyUvcJalSbtBjuwe+UZ43vqE=;
        b=yfRtdXJ8xIhWNAUu9PBesNh36vafEVR+/P2bYslb2CzyA3sdHzNrdj6hwMSeKzSuWF
         qGfUMGtiUaivqpzDz2NhlpqcdccLnYZ7aQAyM8cTJu+QN168lfDkSmFT2OTr2cn6zlT2
         tljU+0S/zBwSvOAMc1IcmZaqpNMPXX4xgMVqq7MUArUZOo26TsnSYL1041KQLV5G4NGZ
         ckigjg79ki+uquS24hWo4dWnQlWXE9F7cFyocKAuhcLb+W0vQmHcB/i1lFip0xh6b1rs
         jusWfoZUqK5CF//Nf7nep3R4Kc0B2TbQeSn/NAF69uCDonnZ6VzPqSM2tsdjIqfOjFOU
         p+Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si702117qtb.115.2019.06.18.10.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHkX-0001HZ-V8
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60279)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHMq-0007uw-3v
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHMo-0003pR-Pu
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:53:55 -0400
Received: from 1.mo177.mail-out.ovh.net ([178.33.107.143]:35817)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHMm-0003M0-Vd
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 12:53:53 -0400
Received: from player157.ha.ovh.net (unknown [10.108.54.52])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 2AFF6FD93B
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 18:53:26 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 3FFDC6EB5068;
 Tue, 18 Jun 2019 16:53:20 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:50 +0200
Message-Id: <20190618165311.27066-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1659013514218474257
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.107.143
Subject: [Qemu-devel] [PATCH v2 00/21] aspeed: machine extensions and fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sx7iJ8SAyJZS

Hello,

This series improves the current models of the Aspeed machines in QEMU
and adds new ones. It also prepares ground for the future Aspeed SoC.
You will find patches for :

 - per SoC mappings of the memory space and the interrupt number space
 - support for multiple CPUs (improved)
 - support for multiple NICs
 - a RTC model from Joel
 - a basic XDMA model from Eddie
 - support for multiple CPUs and NICs
 - fixes for the irq and timer models from Joel, Andrew and Christian
 - DMA support for the SMC controller, which was reworked to use a RAM
   container region as suggested by Peter in September 2018
 - new swift-bmc machine from Adriana (P9' processor)


Thanks,

C.

Changes since v1:

 - reworked the CPU logic to put the number of CPUs under the SoC
 - introduced a "inject-failure" property as suggested by Philippe


Adriana Kobylak (1):
  aspeed: Add support for the swift-bmc board

Andrew Jeffery (4):
  aspeed/timer: Status register contains reload for stopped timer
  aspeed/timer: Fix match calculations
  aspeed/timer: Provide back-pressure information for short periods
  aspeed: vic: Add support for legacy register interface

Christian Svensson (2):
  aspeed/timer: Ensure positive muldiv delta
  aspeed/smc: Calculate checksum on normal DMA

C=C3=A9dric Le Goater (10):
  aspeed: add a per SoC mapping for the interrupt space
  aspeed: add a per SoC mapping for the memory space
  aspeed: introduce a configurable number of CPU per machine
  aspeed: add support for multiple NICs
  aspeed: remove the "ram" link
  aspeed: add a RAM memory region container
  aspeed/smc: add a 'sdram_base' property
  aspeed/smc: add support for DMAs
  aspeed/smc: add DMA calibration settings
  aspeed/smc: inject errors in DMA checksum

Eddie James (1):
  hw/misc/aspeed_xdma: New device

Joel Stanley (3):
  hw: timer: Add ASPEED RTC device
  hw/arm/aspeed: Add RTC to SoC
  aspeed/timer: Fix behaviour running Linux

 include/hw/arm/aspeed_soc.h     |  53 ++++-
 include/hw/misc/aspeed_xdma.h   |  30 +++
 include/hw/ssi/aspeed_smc.h     |  10 +
 include/hw/timer/aspeed_rtc.h   |  31 +++
 include/hw/timer/aspeed_timer.h |   1 +
 hw/arm/aspeed.c                 |  78 +++++++-
 hw/arm/aspeed_soc.c             | 268 +++++++++++++++++++-------
 hw/intc/aspeed_vic.c            | 105 ++++++----
 hw/misc/aspeed_scu.c            |   6 +
 hw/misc/aspeed_xdma.c           | 165 ++++++++++++++++
 hw/ssi/aspeed_smc.c             | 330 +++++++++++++++++++++++++++++++-
 hw/timer/aspeed_rtc.c           | 180 +++++++++++++++++
 hw/timer/aspeed_timer.c         |  84 +++++---
 hw/misc/Makefile.objs           |   1 +
 hw/misc/trace-events            |   3 +
 hw/timer/Makefile.objs          |   2 +-
 hw/timer/trace-events           |   4 +
 17 files changed, 1188 insertions(+), 163 deletions(-)
 create mode 100644 include/hw/misc/aspeed_xdma.h
 create mode 100644 include/hw/timer/aspeed_rtc.h
 create mode 100644 hw/misc/aspeed_xdma.c
 create mode 100644 hw/timer/aspeed_rtc.c

--=20
2.21.0

