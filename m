Received: by 10.223.197.9 with SMTP id q9csp6634015wrf;
        Thu, 19 Oct 2017 03:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+T47YLwYJiiKKaOLGzStm8ZCLEsIWEUw9ShLk2ktXY1V6SRK2dXp4bFq4/EdKXKOPzWo0A6
X-Received: by 10.55.221.68 with SMTP id n65mr1189471qki.27.1508407698642;
        Thu, 19 Oct 2017 03:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407698; cv=none;
        d=google.com; s=arc-20160816;
        b=lSm3fYI4KgeWb0CCzVwZzajmUXzAxM+AldS1RedLIYE5v2ZYQEi77okU4kMNXB7DlN
         RMB+0sQBHMcpRZmy7667bbpKN5AOdoOJljh7kHTAxF2JlTlgQvG859BNzMzjSuny/5iI
         kd07ExcdVaTN49pd4w2nU51Erl23bsTMo9hWNAA9ToIW+5TP8PPSPb8jyuC9gOGfNPsG
         L/jddPav3m435dwW/GEzB/pmpnnY31a8v/hw1Sn0QkvpsgFyOkm0NUUUEmS/Xn/yhERq
         5b1dBv8jlH2T4b7hvDC0ErxB2zOzK8iZGzquijisiTjUayWwdPCK8i2JUJ4DnBtIg3Td
         4QvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nXf4S09mR7tSH5YJETlVM4IHoCZyh6dO5/ikXEM4XoU=;
        b=HuxBv4n0IHJpzEjV/Ys5fH1NnehLFa3htfKVqDEkIsAwxeaTl6GvXnYztS8rop1gKU
         8oQY5GGFNqmDoPeXbN2CFcdnFB08INPPnewtiCg+iDUACWzLsKQhXHd3SfoTkeLAZ+VL
         Jx6eXQDlDS8kQTzXnIlxwn95lObI3sAec4+3QvTF/QQKb0RpnS3Dmd9iCVt1mP5jn9EW
         j5zL4a5HZmu7slsU90WMj4vE8IUGfmozWgB2NAZNRwfaESKXxr57NAAehwQGl3oThnKQ
         rge9RkAKA5F9QLMcs5FVBjyEWi76A52CahkATeV7kZNujREElIIwgrXP6yFpmN9irtvQ
         O4SA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n42si1642960qtk.304.2017.10.19.03.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57kO-0005jI-B9
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:08:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57hR-0003IH-Ol
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 06:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57hJ-0008Ss-Tt
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 06:05:13 -0400
Received: from 5.mo5.mail-out.ovh.net ([87.98.173.103]:40403)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57hJ-0008Rr-O2
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 06:05:05 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 805D3144047
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 12:05:04 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 476A38007B;
	Thu, 19 Oct 2017 12:04:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:08 +0200
Message-Id: <20171019100410.26239-7-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019100410.26239-1-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8705458083310832401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.103
Subject: [Qemu-arm] [PATCH v4 6/8] aspeed: Add EEPROM I2C devices
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
X-TUID: Tp2xzLy6QyNu

The Aspeed boards have at least one EEPROM to hold the Vital Product
Data (VPD).

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8683388e632c..2e08eb49f443 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -17,6 +17,7 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/boards.h"
+#include "hw/i2c/smbus.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
@@ -279,11 +280,15 @@ static void palmetto_bmc_i2c_init(AspeedBoardState =
*bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
     DeviceState *dev;
+    uint8_t *eeprom_buf =3D g_malloc0(32 * 1024);
=20
     /* The palmetto platform expects a ds3231 RTC but a ds1338 is
      * enough to provide basic RTC features. Alarms will be missing */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338",=
 0x68);
=20
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), 0x50=
,
+                          eeprom_buf);
+
     /* add a TMP423 temperature sensor */
     dev =3D i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
                            "tmp423", 0x4c);
@@ -320,6 +325,10 @@ static const TypeInfo palmetto_bmc_type =3D {
 static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
+    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), 0x50=
,
+                          eeprom_buf);
=20
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x4d);
@@ -389,6 +398,7 @@ static const TypeInfo romulus_bmc_type =3D {
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
+    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
@@ -399,6 +409,9 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
     /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 i=
s
      * good enough */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
+                          eeprom_buf);
 }
=20
 static void witherspoon_bmc_init(MachineState *machine)
--=20
2.13.6

