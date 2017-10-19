Received: by 10.223.197.9 with SMTP id q9csp6635777wrf;
        Thu, 19 Oct 2017 03:10:28 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SzPk71iD1nI4N3pdnIeX2cJT0pLTZzA/D2WQCBXaNeP2r69KXVdVEJSqI6iBWQ+icG/BmY
X-Received: by 10.200.2.158 with SMTP id p30mr1373696qtg.255.1508407828219;
        Thu, 19 Oct 2017 03:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407828; cv=none;
        d=google.com; s=arc-20160816;
        b=L5nIZTuag9Y/2XpOO/Nm93uQIyMSPL4uDIMxerpZ6nYp7DJcWXezFeqSNPXqlPPK6s
         ak31UFtSAX+hhq8Sf33knSagOiUymA/XYrZqhLFeymcjLkSYSbjJ8uM1Hn4H9YbVwG+x
         xlv9wnRZTNoqX86ULtX9q0CUNeGbQD7J8lEmNnWsg7Y0gtw7ehoZ87BIEsEU2uXcnvuT
         /8fatTIKkQKLYFugMKVOmUPYqNYVyP5F8m1JbGwI+CTuG+TbXLPOA5zc7B0XQOr9WPl7
         8i09+qmClaQWekUWNr2iDAnq78dpBirANuzA/OtHjFSzOfwgj7rpT8yvRrawrenxygMu
         DqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=H0Mu3yIzQ+oCSPjJ0r/K3RvHgHGDeul/ysxMDMGdcno=;
        b=n6v23xhLHhhUOSmdbcbVCTR9baj/8jFADPeoPeczBZRJQDkzCcsbdFlnX9CsDOhmMQ
         VeQ5KWiuLW0wcUIyIJjwBNs6tCWFQs6fCIOS2c7x8JpI85/iz1517ZZX3grHgSqdK5wD
         9m1HdkAWbRMoTqyq9Zo5kkI6nAUsiLiicN4IGRkoHV1jU6zdDCu8x3sU6KlON5PVPx9R
         zlOhAII/IvWvZQknLVk/UTepWNUamLiUOcjsNRa7nhq6kRFn0b1l1QZW0ZY4YdKZd89O
         Xi32QTuOz++rIQ/3OJE/PKdS7J8QZaiRWRpZmMUuf9YKS3Agwr2qIpnNee2Yah0gBn58
         H2Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si3428962qkx.439.2017.10.19.03.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57mT-0007nh-Uq
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:10:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57hc-0003Sv-Hp
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57hZ-0000Nu-SH
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:05:24 -0400
Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239]:58866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57hZ-0000MZ-KL
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:05:21 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id D8280145684
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 12:05:18 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id A73CA80099;
	Thu, 19 Oct 2017 12:05:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:10 +0200
Message-Id: <20171019100410.26239-9-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019100410.26239-1-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8709398732239309585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 91.121.55.239
Subject: [Qemu-devel] [PATCH v4 8/8] aspeed: add the pc9552 chips to the
 witherspoon machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BouwcOCMs5aK

The pca9552 LED blinkers on the Witherspoon machine are used for leds
but also as GPIOs to control fans and GPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2e08eb49f443..217461081085 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -400,6 +400,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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
@@ -412,6 +414,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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

