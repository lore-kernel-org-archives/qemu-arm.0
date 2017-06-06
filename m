Received: by 10.25.0.23 with SMTP id 23csp1484140lfa;
        Tue, 6 Jun 2017 01:54:27 -0700 (PDT)
X-Received: by 10.55.154.134 with SMTP id c128mr27558323qke.231.1496739266901;
        Tue, 06 Jun 2017 01:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496739266; cv=none;
        d=google.com; s=arc-20160816;
        b=fPHxyUHsR7pBOVyHj6ijOrnXrhahEIPulG8d4dvhwW5qpSC0HTyHk7WE0UgYqk1ybh
         vOEIQQfBf0ePSHNkoOd8hzA4v0b8ybudW4ZtcnSfBkgMrR6SqmfMVbVulg40tcfeqCvL
         oJLB4LyIn8nqtegMc1KaIiF5XLgF9CDg18N75WUKdFJUqCBhx8wwmPtbhE5oD4bIvd1D
         BEYAtNwpIfTTKMgnSMdgsPueaOk1pQ5ybrLuCpVGpHzX8yqpcZ4Z3sukFtQC3gZoA7S+
         vXGfeNGF+5guN6fVpoPzfbWlYrdFolCNYSXkgQXPuUoXjCDoJTlbnAyCQ6k412NOITCa
         jO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=c83+KK0kw1RdJYG6+EJWc8YXveXvkaJwAmSzWgU7qk8=;
        b=OL8lugHYRP/aApN7bf8786h9SNKUzHxL0SIdDEfCAMnJUdKQLqNGH4xXwwWAaIWOnY
         OPQSu7etcgbHzsG/EwCNzevVQGT3qs4Im1RzFhs6zilPf8LE09j9p+l5ycEweIpGFvus
         z3wEeKIa/cNNrJ0kqZjgWPsWFAJgHSwVB8fnZNZdmkhazyJ8lfQoJq2lHIYep1IaAoGA
         Fi8Uli1LKLKvyFF7WkdBNDGng1bN9cFhlfzQYHgNAyEx16CBNv0Z7LwSuLYmbv70gHdZ
         m3ZcjKQAIDNxDRfVsxAqvtrN2KFCJga+b1lDfJYJ6i900eEjl87dDxI2s7eW2jQh6O5o
         T5Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si35428598qtc.99.2017.06.06.01.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Jun 2017 01:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIAFs-0005Hz-3p
	for alex.bennee@linaro.org; Tue, 06 Jun 2017 04:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dIAFj-0005E2-Ky
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:54:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dIAFg-0004jH-HK
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:54:15 -0400
Received: from 18.mo7.mail-out.ovh.net ([188.165.56.163]:32854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dIAFg-0004iK-Ag
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:54:12 -0400
Received: from player762.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id D91F759284
	for <qemu-arm@nongnu.org>; Tue,  6 Jun 2017 10:54:10 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
	[90.89.238.153]) (Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id B6835E009D;
	Tue,  6 Jun 2017 10:54:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  6 Jun 2017 10:53:50 +0200
Message-Id: <1496739230-32109-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496739230-32109-1-git-send-email-clg@kaod.org>
References: <1496739230-32109-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7904380296447429393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrheelgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.56.163
Subject: [Qemu-arm] [PATCH v2 2/2] aspeed: add a temp sensor device on I2C
 bus 3
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KAATIiFHG8fT

Temperatures can be changed from the monitor with :

	(qemu) qom-set /machine/unattached/device[2] temperature0 12000

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e824ea87a9af..155eeb242b8a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -239,10 +239,19 @@ static void aspeed_board_init(MachineState *machine=
,
 static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
+    DeviceState *dev;
=20
     /* The palmetto platform expects a ds3231 RTC but a ds1338 is
      * enough to provide basic RTC features. Alarms will be missing */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338",=
 0x68);
+
+    /* add a TMP423 temperature sensor */
+    dev =3D i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
+                           "tmp423", 0x4c);
+    object_property_set_int(OBJECT(dev), 31000, "temperature0", &error_a=
bort);
+    object_property_set_int(OBJECT(dev), 28000, "temperature1", &error_a=
bort);
+    object_property_set_int(OBJECT(dev), 20000, "temperature2", &error_a=
bort);
+    object_property_set_int(OBJECT(dev), 110000, "temperature3", &error_=
abort);
 }
=20
 static void palmetto_bmc_init(MachineState *machine)
--=20
2.7.4

