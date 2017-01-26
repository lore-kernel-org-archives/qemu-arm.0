Received: by 10.25.77.65 with SMTP id a62csp322260lfb;
        Thu, 26 Jan 2017 09:38:05 -0800 (PST)
X-Received: by 10.55.66.68 with SMTP id p65mr3822838qka.187.1485452285734;
        Thu, 26 Jan 2017 09:38:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g41si1613426qtb.257.2017.01.26.09.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 09:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWnzn-0005ho-2C
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 12:38:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cWnzh-0005hg-CD
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 12:38:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cWnzc-0003fI-Rg
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 12:37:57 -0500
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:36741)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cWnzc-0003dt-LW
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 12:37:52 -0500
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id B85DD952A2
	for <qemu-arm@nongnu.org>; Thu, 26 Jan 2017 18:37:48 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player773.ha.ovh.net (Postfix) with ESMTPSA id AC1BC600084;
	Thu, 26 Jan 2017 18:37:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2017 18:37:29 +0100
Message-Id: <1485452251-1593-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3741365392477031185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrheehgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.52.148
Subject: [Qemu-arm] [PATCH v2 0/2] Aspeed watchdog controller model
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GeJwWB+rTrnb

Hello,

The Aspeed SoC includes a set of watchdog timers using 32-bit
decrement counters. This patchset provides a model for this controller
and adds the first watchdog to the Aspeed SoC model. A second watchdog
exists and is used on real HW to boot from a second flash module
containing a golden image of the firmware. This is not supported yet
in qemu.

The main benefit today of this model is to enables reboot/reset of a
guest from U-Boot and Linux.

Thanks,

C.

C=C3=A9dric Le Goater (2):
  wdt: Add Aspeed watchdog device model
  aspeed: add a watchdog controller

 hw/arm/aspeed_soc.c              |  13 +++
 hw/watchdog/Makefile.objs        |   1 +
 hw/watchdog/wdt_aspeed.c         | 225 +++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/aspeed_soc.h      |   2 +
 include/hw/watchdog/wdt_aspeed.h |  32 ++++++
 5 files changed, 273 insertions(+)
 create mode 100644 hw/watchdog/wdt_aspeed.c
 create mode 100644 include/hw/watchdog/wdt_aspeed.h

--=20
2.7.4

