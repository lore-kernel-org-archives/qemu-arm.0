Received: by 10.25.0.6 with SMTP id 6csp1262937lfa;
        Sun, 14 May 2017 22:52:03 -0700 (PDT)
X-Received: by 10.55.96.3 with SMTP id u3mr4009697qkb.47.1494827523495;
        Sun, 14 May 2017 22:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494827523; cv=none;
        d=google.com; s=arc-20160816;
        b=fdpv/GMcIwpAbTLRRlivfU+i0GfCLnQOgVf0csXLr2hDift+WZsJl6Zdn1AKaKJxbf
         M/92w5WNFcjXjkNPlw9Si2fUXpY0VQU5kfs5btJRPBxhz9x+4k/JemFvC4Tyh01uNLdi
         Br99wuf1CYZFajmdnfSsjt5y/C06+C96hR+yGGpSBUw1QgQX+gaAmqxyOBGU/b2V3GRU
         7Steb3d3LnFluztuqJ7aMpQhH0eJIstWKrqpt4PAxHoDawTEAu8Uu+rirUpEJhMQDtf2
         6Jz2T5yNfr6wZxaaQH3q2cH05qbtShZzVKB4pWUp+dv0ltpJrs087xVeXkG2uXUGvgKi
         E08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=c83+KK0kw1RdJYG6+EJWc8YXveXvkaJwAmSzWgU7qk8=;
        b=FND/oiwHvZY4/m3gEvOT5njUCEHtqxsKHhXdPDvyDKismukW09kUZ7nwJEFd35sPIR
         E5pA4noXFtHFFlKn31wbQJJ8EhGETaf3JlCgcojtUzKSyFI2Y+TyJK2O63o2FuB8mm5E
         bL7/Svqoud/Q5+8Sdo34dYATVgX2RnthoyV5m5rk9857bD/U9SLz5re86srPJu9d7GD6
         /WIfPKKqnETASDqkNF2ZpDaPKhhmRprlLLb8vVgHCCfp7P588SOES49Pe8UyKhOrAYru
         STbn6AjFSOWCO8f6lgJ4VTj1eXDppa8UVeIovfTnMd7pXzAU6aoh2viK9pHok+N+YdHJ
         lXUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5si10048700qkh.318.2017.05.14.22.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 May 2017 22:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dA8vK-0008GJ-T2
	for alex.bennee@linaro.org; Mon, 15 May 2017 01:52:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8vB-0008AO-49
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8v6-0001Jf-Lz
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:53 -0400
Received: from 2.mo4.mail-out.ovh.net ([46.105.72.36]:40427)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dA8v6-0001JM-G1
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:48 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 6B03C640A5
	for <qemu-arm@nongnu.org>; Mon, 15 May 2017 07:51:47 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 4E11774006B;
	Mon, 15 May 2017 07:51:43 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2017 07:51:16 +0200
Message-Id: <1494827476-1487-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494827476-1487-1-git-send-email-clg@kaod.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4752142033359899409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedruddvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.72.36
Subject: [Qemu-arm] [PATCH 6/6] aspeed: add a temp sensor device on I2C bus 3
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
X-TUID: dNrhvwzuzYZQ

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

