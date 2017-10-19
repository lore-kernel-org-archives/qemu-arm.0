Received: by 10.223.197.9 with SMTP id q9csp6921711wrf;
        Thu, 19 Oct 2017 08:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Rcpu/MwgpwuDsyk5MljlwQUnyXpdfC/f6AgYPrSa/ZwLf2ZYEMKbSDdsdN6NZNpMrC/uEy
X-Received: by 10.200.23.82 with SMTP id u18mr2532053qtk.163.1508426177272;
        Thu, 19 Oct 2017 08:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508426177; cv=none;
        d=google.com; s=arc-20160816;
        b=Dv5udQ5TqZMJyVnq/VgbvpJeEX99CnX6QcvbcLp/W5avNRxW3ES5a5vvDwUAUdeqHK
         K15Uh1RPrS0NHeHRUcK545zZ8AoOghM/5ZaPrIWsx2l03kcju2auGU/rt7wmd/wDMQ+1
         AzcXM1ho9BepDogVNWFTZ8loA/g3M3y1S/VfQbcWosrgjpZ/oqjIpIPIa58/5iwNOeT5
         4ALdld+7jhc6CdsKg8ZIIs7Vt69+5ru/jh0TS/5M4KAz3ubKt3LIMTqjALNj+0n6P5rh
         ac4H6sN+u/PJ3T0nZC/Rn1NARgzke+0Rcpvm/M65JNegj46gTyPa0zXhj3kjSVIalVc5
         hi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bfRAe46P0Ja7Anbl+RS4WSevSQmKLkygwOQ1TJ3I6CE=;
        b=fnuOMCJWsmSrOB2134ALyorKUlKEaZl+AUT9e6znp8EdOMje19DY+knKum4ZPCCALi
         ZUgzwCjCE798zhe5HzMkn0uqpIRMx4bEzw8Xr/aCQLh7m3GQ5Hxrf0IzEeij0m//jq2n
         wwIcRcgIav1L9JgcS67TYVFlqd6YahKyG5x3GqehPk211TxUQHIrWD/iaJHIYZTMi/K8
         pG0kY3XR/yDC0/XIhn+wRSlI8A3dP2mZl8WEtsSBsBExrP+TKIZY0IM1CdFYy4BadYxk
         lLdHb5HNnvcT+0+9fAOSakEUHvtGZfgk5JvH5PgX46Ek4n2leQvZhvZJ1oaoQQrqLOKo
         P08w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4si10157026qtd.447.2017.10.19.08.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CYQ-0003MV-VA
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:16:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CWJ-0001lr-GZ
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CWF-0001of-Gl
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:14:03 -0400
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]:45641)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5CWF-0001nh-A0
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:59 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 58BEF14614D
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 17:13:58 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 266C580087;
	Thu, 19 Oct 2017 17:13:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:12:49 +0200
Message-Id: <20171019151249.13663-9-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019151249.13663-1-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13922315300976429841
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.182.191
Subject: [Qemu-arm] [PATCH v5 8/8] aspeed: add the pc9552 chips to the
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
X-TUID: bHRkRIvw9gN3

The pca9552 LED blinkers on the Witherspoon machine are used for leds
but also as GPIOs to control fans and GPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 246bf3ff67e6..f06ce68624c7 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -394,6 +394,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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
@@ -406,6 +408,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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

