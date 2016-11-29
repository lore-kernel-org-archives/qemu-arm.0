Received: by 10.25.150.194 with SMTP id y185csp2414179lfd;
        Tue, 29 Nov 2016 07:50:01 -0800 (PST)
X-Received: by 10.55.156.138 with SMTP id f132mr24376110qke.177.1480434600991;
        Tue, 29 Nov 2016 07:50:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n84si35205383qkn.163.2016.11.29.07.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:50:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkfP-0001dl-QO
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:49:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkb7-0006bT-0j
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkb2-0004au-Ny
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:33 -0500
Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]:38469)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkb2-0004aB-HJ
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:28 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 7C1961F8A8
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:45:27 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id E6909120084;
	Tue, 29 Nov 2016 16:45:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:42 +0100
Message-Id: <1480434248-27138-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11715832955747863313
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.96.102
Subject: [Qemu-arm] [PATCH for-2.9 04/30] aspeed: remove
 cannot_destroy_with_object_finalize_yet
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
X-TUID: UlCQG+Xj7tkn

With commit ce5b1bbf624b ("exec: move cpu_exec_init() calls to realize
functions"), we can now remove cannot_destroy_with_object_finalize_yet.

Suggested-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index db145e201451..3a6b91f14b45 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -251,12 +251,6 @@ static void aspeed_soc_class_init(ObjectClass *oc, v=
oid *data)
=20
     sc->info =3D (AspeedSoCInfo *) data;
     dc->realize =3D aspeed_soc_realize;
-
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet =3D true;
 }
=20
 static const TypeInfo aspeed_soc_type_info =3D {
--=20
2.7.4

