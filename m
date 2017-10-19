Received: by 10.223.197.9 with SMTP id q9csp7031871wrf;
        Thu, 19 Oct 2017 10:08:54 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Q7lstXHl3a++3l4wTfjoGRkONctELyCX/Sy1/S3H6TIzv/DSJ4x0aZtkWSuZ2uv1eKljWz
X-Received: by 10.80.240.92 with SMTP id u28mr2494328edl.5.1508432934552;
        Thu, 19 Oct 2017 10:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508432934; cv=none;
        d=google.com; s=arc-20160816;
        b=ZmfTy5UhKjI9qGwAyE3oosoa3z2UpOXcyQkE+jZrMYS4EtujK0DzqjghXUvRR6z7PY
         JaUUbEVvXxuQAhC6OxxsRZUhkS5mc+nd6dH23FpK4Zi3eTGmmjKJBgtWj4XrgYX4Tiat
         SdsQoQr2IOMomrEfZHOOjyuiKO/C/yLJBapMAwg1A1symS8FXETHWaIn9WWw0KFWk/D+
         kdEnDopMiiqUop8raDbgT9vZ2WLSCV3hPOJatjA/CNgxgGfAfHNYpAU1+GSoT8+QXAak
         u5y3ggEa/B2g0DQ1FCQP3dwBRYg7STbhcoF+xkNRHVRZBHhDFp4XOXXqhT7BOfVVcuny
         Lrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=McMOt7cU/9WS6H8PfTN0iBHcbYUUegcl75fF9/4raeo=;
        b=wKSFnje1Oc4iNlr0US3jHeskR70G/hm7Mlg6hJQ0UF2G1wqzn73HFEtrDDOJ4h7ozs
         2vgbEWWqMcbIzW7Thv2fhDBoh6RTBo5XUoQ3auxHsNiHV3rHWi9xCNh2ZmLRPDmkRRpJ
         04EW889fwbCQTh7aN9rMxHwpLsHVTp/sg4EJ4rZpWBogdanTD4h0trdALtBWNfMj+Oz/
         sZ3wgFhdrn7ivvvcSYohcPAoU79jTxk7h4+VK4EaGQwOsv3uDB4kkZFPQq6asjjPWwYN
         rO5hxIiiIJ8TwQydsTcXYSKMNRIdO8kYIioTqBOVLjcqM0s9R0kgPfyNsl4n2x376Y7h
         +qvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 94si392138edb.327.2017.10.19.10.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 10:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5EJR-0003qA-Cz
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 13:08:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DoZ-0001n0-16
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DoU-0003sQ-RN
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:59 -0400
Received: from 2.mo5.mail-out.ovh.net ([178.33.109.111]:52107)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5DoU-0003s5-Kf
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:54 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 9EBEC146226
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 18:36:53 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 6D7E68006F;
	Thu, 19 Oct 2017 18:36:46 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:35:46 +0200
Message-Id: <20171019163546.2039-9-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019163546.2039-1-clg@kaod.org>
References: <20171019163546.2039-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15322653309537520401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.109.111
Subject: [Qemu-arm] [PATCH v6 8/8] aspeed: add the pc9552 chips to the
 witherspoon machine
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9/sIpOnA9uF

The pca9552 LED blinkers on the Witherspoon machine are used for leds
but also as GPIOs to control fans and GPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index df7f266800ba..0e2a4fa62c26 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -397,6 +397,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
     AspeedSoCState *soc =3D &bmc->soc;
     uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
=20
@@ -409,6 +411,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
=20
     smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
                           eeprom_buf);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552=
",
+                     0x60);
 }
=20
 static void witherspoon_bmc_init(MachineState *machine)
--=20
2.13.6

