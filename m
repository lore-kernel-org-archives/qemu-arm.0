Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4401659wre;
        Tue, 29 May 2018 23:44:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKNneLYT8Xsuz+/sjaB2fO60O5blOq0t1AGWval/AHtvEYeN6R44etPL66fehBGZFzVZ2qG
X-Received: by 2002:a0c:a244:: with SMTP id f62-v6mr1299535qva.76.1527662671091;
        Tue, 29 May 2018 23:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662671; cv=none;
        d=google.com; s=arc-20160816;
        b=czP72agCaE+dtvXG2Irvdc3PNeo3FlY+B/rT/uNUaH1OTeW1lYUVKn9MxPA6/Zj+IU
         Ec6Fv0U92LBrPdqBNc2kkwx+tmrhM9Qs7ZL9ZTYx24ZlU1HLVWFjs2smo0JTDqjyGLmc
         9nfJFyBXCAnwidg6EU1T8jg9aRo0WKel7k7avO6uaYKzhF3GkkzL5CmkGXhA92DhTpM2
         WNtsVgq5Mhjxzj1eYyVWvag2zCD6qZakqJUv9SPXNp8TwneWo82D0mRI9YgnDcqzD/Qn
         3hwvQQkNQ3ghD0E8TIWjm2R4wujjynod+kEDf8KZHe5gh4RcKMAWjAmBTK9Ivq65dZXw
         cC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bgAWQk7yVgQ8wstQ8AO2xLVnt8IyNRZhZqI4Lg3xMAI=;
        b=gqNskn1mK+39DsTf2LB80Ul6M79zP0GCJJEIqQqZFUrnrMTnXaTAz60SJw4Hey1Za4
         pjO2/ar0mCjVFK0vmE3hBnNkp/M4OGZABy190ina9mxaDyZy5cXIPIuU5iKmWONaVYb4
         yimguYZ3+euy9Va55EwGrcsgWfqemu/dP5ZkkLpQUI8mYJCwPRLrXUXk3mtur7wTEHgh
         h1ikR15K6snVFMDZhAqsTlBc2TMKnUN5daAv7F+TX6CiIy2aPmlYTkLdEXruFc6S4N7r
         7LQj3nVYjLV5ogheW3ShI5bhQTylVj7+42px6eMGFk6yOfcRSW0u2nzTsFUeXlk1bMre
         aeSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i49-v6si711378qtf.45.2018.05.29.23.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuqU-0004Kj-KT
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:44:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuo8-0002mT-Pp
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuo4-0001K7-Sy
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:42:04 -0400
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:38173)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNuo4-0001JM-MP
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:42:00 -0400
Received: from player159.ha.ovh.net (unknown [10.109.105.106])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 1A3A7C91A6
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 08:41:58 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id ADBEA4800B1;
	Wed, 30 May 2018 08:41:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 08:40:49 +0200
Message-Id: <20180530064049.27976-8-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530064049.27976-1-clg@kaod.org>
References: <20180530064049.27976-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5167317625425595153
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.79.46
Subject: [Qemu-devel] [PATCH v7 7/7] aspeed: add the pc9552 chips to the
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
X-TUID: jWL0Wj1zgeS3

The pca9552 LED blinkers on the Witherspoon machine are used for leds
but also as GPIOs to control fans and GPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2ad94b494ed2..e28170b7e1d8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -385,6 +385,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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
@@ -397,6 +399,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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

