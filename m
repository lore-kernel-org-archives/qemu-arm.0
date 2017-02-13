Received: by 10.25.77.65 with SMTP id a62csp901052lfb;
        Mon, 13 Feb 2017 06:53:03 -0800 (PST)
X-Received: by 10.55.180.5 with SMTP id d5mr21719118qkf.266.1486997583709;
        Mon, 13 Feb 2017 06:53:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7si7394899qkf.131.2017.02.13.06.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 06:53:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdHzx-00058W-2M
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 09:53:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cdHst-0007Hk-Oa
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cdHsp-00023N-Kk
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:45:43 -0500
Received: from 16.mo4.mail-out.ovh.net ([188.165.55.104]:37119)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cdHsp-000230-Di
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:45:39 -0500
Received: from player772.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id BD4F44A1CE
	for <qemu-arm@nongnu.org>; Mon, 13 Feb 2017 15:45:37 +0100 (CET)
Received: from zorba.ttt.fr.ibm.com (deibp9eh1--blueice1n3.emea.ibm.com
	[195.212.29.165]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id D3BD93F8;
	Mon, 13 Feb 2017 15:44:32 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2017 15:44:20 +0100
Message-Id: <1486997062-23227-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14291610469684775697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrleefgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.55.104
Subject: [Qemu-arm] [PATCH 0/2] aspeed/smc: add support for DMAs
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eOdnNjUBEWgD

Hello,

Here is a short series adding support for DMAs to the SMC controller
of the Aspeed SoCs. It uses coroutines to spawn the DMA requests in
bottom halves. This method is inspired from the block layer, the code
looks nice but maybe, this is unnecessarily complex. Paolo, could you
provide some feedback ?

Thanks,

C.=20

C=C3=A9dric Le Goater (2):
  aspeed/smc: add a 'sdram_base' property
  aspeed/smc: add support for DMAs

 hw/arm/aspeed_soc.c         |   5 +-
 hw/ssi/aspeed_smc.c         | 233 ++++++++++++++++++++++++++++++++++++++=
++++--
 include/hw/ssi/aspeed_smc.h |   3 +
 3 files changed, 233 insertions(+), 8 deletions(-)

--=20
2.7.4

