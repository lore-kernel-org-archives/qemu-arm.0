Received: by 10.223.172.38 with SMTP id v35csp4815407wrc;
        Tue, 19 Sep 2017 04:29:04 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCJX2kapMs59pr6hgeeI2AedUky3bFZAzfKGxdQFwjBVxzB3XVRYMIUDI9j6BHi9IFzj4s8
X-Received: by 10.55.79.68 with SMTP id d65mr1451814qkb.110.1505820544550;
        Tue, 19 Sep 2017 04:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505820544; cv=none;
        d=google.com; s=arc-20160816;
        b=VPEamRFvwhrHCP0+FCSch+y0DB2oe2rM3p7a1agjOfZrEa7rGiqu8rijb1JM7oYp6O
         7BpXm7Z3vfqXnZWKFXxsH7+pTwlJGaseXMflLciCVvx8nYFycGqC2rUue3K3ESTiE1Cr
         46XmbsSpBWjdFdzWw+9dfiYhJuXGQwSOIWgH5boo8juUlTni6L/pQwP50YSrAE73ETam
         7okrnSva4fhdeORz6Re9GGwyXgg2jznDSi5VqY1/lM5Brhz7ehOp27HkM1+hbiFXPifh
         fPBLrdvUYBbMUJzYkJ0pbj3GXdRVn0k2HxGWz7AquAhulQHJaqbh4w8g4jVzOOMNOq70
         W16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hOblAI95huThItZI/Ugi4abzzRPMaIEhFE4TjKdKnCU=;
        b=BS05iiz3mWOt71epV/0jzL/IOtaG4NfzBS6jQEHBaybUj12X7gH/QXdg0LGmBoTmQj
         JtBxxCSVwk84ufeYeMCN9ufq+Oc4k2VROlmj0kPLrbb0BbER0JleLP8PqvWRQ29Dn6xE
         YHLaLhbv+q4IkEI2zrQvJC8ll42EsRyhh+HAPHbVUGvi+1hlFoHtTdAs4pT0tn+vXj0M
         gBfdK5WdWBLhrPzOtEPzgq8y7QQ2KMC4I70Qde9HqlzFQBQAvopLTapVxd8Ynz65tiZS
         XNEI7e5Lac+d0dx0MoeLHLTgY85vbWx3XW30Za16ggEzIOQvVNlizyLRotNwoxim/VoX
         HYpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si9025225qkb.46.2017.09.19.04.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 04:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duGi6-0003AT-85
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 07:29:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgT-0002BN-1K
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 07:27:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgP-0006Mk-Tu
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 07:27:21 -0400
Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140]:46810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duGgP-0006Lp-Mo
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 07:27:17 -0400
Received: from player716.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6DF70632BF
	for <qemu-devel@nongnu.org>; Tue, 19 Sep 2017 13:27:16 +0200 (CEST)
Received: from zorba.kaod.org.com (deibp9eh1--blueice1n2.emea.ibm.com
	[195.212.29.164]) (Authenticated sender: clg@kaod.org)
	by player716.ha.ovh.net (Postfix) with ESMTPSA id 0468C56009F;
	Tue, 19 Sep 2017 13:27:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 13:26:43 +0200
Message-Id: <20170919112645.8574-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919112645.8574-1-clg@kaod.org>
References: <20170919112645.8574-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 18380315983409482513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheejgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.43.140
Subject: [Qemu-devel] [PATCH 3/5] aspeed: Add EEPROM I2C devices
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PqQ01AYUBfeY

The Aspeed boards have at least one EEPROM to hold the Vital Product
Data (VPD).

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 362b683e9021..3e74970d7ad2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -251,6 +251,17 @@ static void aspeed_board_init(MachineState *machine,
     arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
 }
=20
+static void aspeed_i2c_add_eeprom(I2CBus *bus, uint8_t address, size_t s=
ize)
+{
+    uint8_t *eeprom_buf =3D g_malloc0(size);
+    DeviceState *dev;
+
+    dev =3D qdev_create((BusState *) bus, "smbus-eeprom");
+    qdev_prop_set_uint8(dev, "address", address);
+    qdev_prop_set_ptr(dev, "data", eeprom_buf);
+    qdev_init_nofail(dev);
+}
+
 static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -260,6 +271,9 @@ static void palmetto_bmc_i2c_init(AspeedBoardState *b=
mc)
      * enough to provide basic RTC features. Alarms will be missing */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338",=
 0x68);
=20
+    aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), 0x50=
,
+                          256 * 1024);
+
     /* add a TMP423 temperature sensor */
     dev =3D i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
                            "tmp423", 0x4c);
@@ -298,6 +312,9 @@ static void ast2500_evb_i2c_init(AspeedBoardState *bm=
c)
 {
     AspeedSoCState *soc =3D &bmc->soc;
=20
+    aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), 0x50=
,
+                          8 * 1024);
+
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x4d);
=20
@@ -377,6 +394,9 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
     /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 i=
s
      * good enough */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
+
+    aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
+                          8 * 1024);
 }
=20
 static void witherspoon_bmc_init(MachineState *machine)
--=20
2.13.5

