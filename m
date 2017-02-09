Received: by 10.25.77.65 with SMTP id a62csp334732lfb;
        Thu, 9 Feb 2017 05:53:58 -0800 (PST)
X-Received: by 10.200.49.167 with SMTP id h36mr2706735qte.11.1486648438828;
        Thu, 09 Feb 2017 05:53:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si8012904qke.324.2017.02.09.05.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 05:53:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbpAa-0008VD-6O
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 08:53:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cbp5y-0004hG-MX
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:49:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cbp5x-0001k6-RI
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:49:10 -0500
Received: from 8.mo53.mail-out.ovh.net ([87.98.185.57]:48524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cbp5x-0001jG-Kn
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:49:09 -0500
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 8D2523846B
	for <qemu-arm@nongnu.org>; Thu,  9 Feb 2017 14:49:08 +0100 (CET)
Received: from zorba.kaod.org.com
	(dslb-088-064-225-204.088.064.pools.vodafone-ip.de [88.64.225.204])
	(Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id B3677620085;
	Thu,  9 Feb 2017 14:49:02 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  9 Feb 2017 14:47:38 +0100
Message-Id: <1486648058-520-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486648058-520-1-git-send-email-clg@kaod.org>
References: <1486648058-520-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8310267214239140625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrkeehgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.185.57
Subject: [Qemu-arm] [PATCH 4/4] aspeed/smc: use a modulo to check segment
 limits
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
X-TUID: Dk7OG+uQj8yx

The size of a segment is not necessarily a power of 2.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 70177078a8f2..cb515730c5ad 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -475,15 +475,15 @@ static uint32_t aspeed_smc_check_segment_addr(const=
 AspeedSMCFlash *fl,
     AspeedSegments seg;
=20
     aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + fl->id], &seg);
-    if ((addr & (seg.size - 1)) !=3D addr) {
+    if ((addr % seg.size) !=3D addr) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid address 0x%08x for CS%d segment : "
                       "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
                       s->ctrl->name, addr, fl->id, seg.addr,
                       seg.addr + seg.size);
+        addr %=3D seg.size;
     }
=20
-    addr &=3D seg.size - 1;
     return addr;
 }
=20
--=20
2.7.4

