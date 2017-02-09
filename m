Received: by 10.25.77.65 with SMTP id a62csp332338lfb;
        Thu, 9 Feb 2017 05:49:04 -0800 (PST)
X-Received: by 10.55.31.24 with SMTP id f24mr2734806qkf.221.1486648144107;
        Thu, 09 Feb 2017 05:49:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m195si8004073qke.332.2017.02.09.05.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 05:49:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbp5p-0004X0-Qe
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 08:49:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cbp5l-0004Wo-T6
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:48:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cbp5i-0001W5-Oo
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:48:57 -0500
Received: from 9.mo53.mail-out.ovh.net ([87.98.186.128]:58982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cbp5i-0001Sj-Ip
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:48:54 -0500
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 0BA1738389
	for <qemu-arm@nongnu.org>; Thu,  9 Feb 2017 14:48:45 +0100 (CET)
Received: from zorba.kaod.org.com
	(dslb-088-064-225-204.088.064.pools.vodafone-ip.de [88.64.225.204])
	(Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 232C3620074;
	Thu,  9 Feb 2017 14:48:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  9 Feb 2017 14:47:34 +0100
Message-Id: <1486648058-520-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8303793290598714129
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrkeehgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.186.128
Subject: [Qemu-arm] [PATCH 0/4] aspeed: miscellaneous small fixes
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9UlhMf7DrnI

Hello,

Here is a short series fixing small issues in the SMC controller model
of the Aspeed SoC.

Thanks,

C.=20

C=C3=A9dric Le Goater (4):
  aspeed: check for negative values returned by blk_getlength()
  aspeed: remove useless comment on controller segment size
  aspeed/smc: handle dummies only in fast read mode
  aspeed/smc: use a modulo to check segment limits

 hw/arm/aspeed.c     | 22 +++++++++++++++-------
 hw/ssi/aspeed_smc.c | 13 ++++++++-----
 2 files changed, 23 insertions(+), 12 deletions(-)

--=20
2.7.4

