Received: by 10.25.150.194 with SMTP id y185csp2429865lfd;
        Tue, 29 Nov 2016 08:19:28 -0800 (PST)
X-Received: by 10.55.78.146 with SMTP id c140mr24476978qkb.55.1480436367919;
        Tue, 29 Nov 2016 08:19:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1si27903822qtc.299.2016.11.29.08.19.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:19:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBl7u-0000wP-EN
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:19:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdq-0000P4-Cp
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:48:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdm-0005r4-C6
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:48:22 -0500
Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]:33414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkdm-0005qo-5x
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:48:18 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4D7731F5D3
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:48:16 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id BECE11200B7;
	Tue, 29 Nov 2016 16:48:08 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:44:04 +0100
Message-Id: <1480434248-27138-27-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11763402227990629137
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.96.102
Subject: [Qemu-devel] [PATCH for-2.9 26/30] aspeed/smc: use flash model
 option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u6jMxEaMSbpc

so that we can change the flash model from the command line.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a92c2f1c362b..f4232ce42cd0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -138,6 +138,8 @@ static void aspeed_board_init_flashes(AspeedSMCState =
*s, const char *flashtype,
         DriveInfo *dinfo =3D drive_get_next(IF_MTD);
         qemu_irq cs_line;
=20
+        flashtype =3D dinfo && dinfo->model ? dinfo->model : flashtype;
+
         /*
          * FIXME: check that we are not using a flash module exceeding
          * the controller segment size
--=20
2.7.4

