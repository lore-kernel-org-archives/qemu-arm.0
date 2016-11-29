Received: by 10.25.150.194 with SMTP id y185csp2418209lfd;
        Tue, 29 Nov 2016 07:58:52 -0800 (PST)
X-Received: by 10.200.40.55 with SMTP id 52mr28124464qtq.283.1480435131935;
        Tue, 29 Nov 2016 07:58:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si35229399qkd.140.2016.11.29.07.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:58:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkny-00013S-MB
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:58:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbz-0007K5-Hu
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbu-0005CY-1Y
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:27 -0500
Received: from 18.mo1.mail-out.ovh.net ([46.105.35.72]:39211)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkbt-0005Bp-Rf
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:21 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 982471F8BD
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:46:20 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 00BFF120094;
	Tue, 29 Nov 2016 16:46:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:49 +0100
Message-Id: <1480434248-27138-12-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11730751132256078609
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.35.72
Subject: [Qemu-arm] [PATCH for-2.9 11/30] aspeed/scu: fix SCU region size
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
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HQEy4RoVRmKj

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/misc/aspeed_scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 34e86385d837..95022d3607ad 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -86,7 +86,7 @@
 #define BMC_DEV_ID           TO_REG(0x1A4)
=20
 #define PROT_KEY_UNLOCK 0x1688A8A8
-#define SCU_IO_REGION_SIZE 0x20000
+#define SCU_IO_REGION_SIZE 0x1000
=20
 static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] =3D {
      [SYS_RST_CTRL]    =3D 0xFFCFFEDCU,
--=20
2.7.4

