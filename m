Received: by 10.223.172.38 with SMTP id v35csp390883wrc;
        Wed, 20 Sep 2017 00:04:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA/iKoMl3kjiYECYbRc8xtFxxuBozYcAiiPuViPWfVJpQ53nUamqKKQa3+VdFD2C0zgX5U9
X-Received: by 10.55.110.132 with SMTP id j126mr1369358qkc.104.1505891068116;
        Wed, 20 Sep 2017 00:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505891068; cv=none;
        d=google.com; s=arc-20160816;
        b=LF9XcyLhmjtg90sPU678JPpcXkMa8SFLH5Lr+mWUYjou1503lTFRSYxO1EPdw1eKy6
         ATGRvQ50f4RAK3v5xkU2wR7ppaFpd8FOHhb74gDXmEGGuqh6WHUO0C2Z2him/2YNTAKN
         G2chO7cz3p+rG21H3NPR6l7cdNPhzw/B8EK2TptCLsmIuS5rtGOll73KN+ZyOERAFqJw
         WA6rOBV9pkba97CFjAUr4ulFr31oa8iBc0PFJ2hPOH5AaQY1kVnDP2qRpMt+b6kefHj0
         PE8wB9DD+nMrPu000RUGHWOfo5zydhgxBz21e2AACvn9xXPnA9WMGS2zW5vS9Q/uHmXM
         eKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3QwN4PyDEbAFk8Rigmb/oxdmAhHg1E6GewxTaEXu/U0=;
        b=hDAf1Vlw2fLm5ciZ6PsoB1P0Dwk30bR6g6mwBIS0t7+Fm4Grd1Vlrf2ewHHbUT5tWW
         mgaEzL9fwCaHoQ2z9ROJpdJX//PWueprgMPT2AtiPdbXeW/szuXzdD8maPZVQHkp8G8X
         axe5C0r931bhbg2H2XSmeOyS5L3LXamminrVRF+Hul/SJbOG0dvfAbJ8e03MemX79Fub
         Vz4dmx+U6S/4Wpd1wJdDqa2RLHgXyx8+t0Yc8T78l9XZRgu8UgfXhxuZzVHjphyCwmQa
         CCuUHH5qlMxrkAerJkgrFe4w+2miRYeO7XHkbBIbv8OlPbV1Se88+z6oEP5bHsf2IXTD
         D5aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b48si1278323qtk.166.2017.09.20.00.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 00:04:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duZ3Z-00069w-Pz
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 03:04:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1d-00051C-8g
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 03:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1Z-0000HO-9k
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 03:02:25 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:59857)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duZ1Y-0000FC-LP
	for qemu-devel@nongnu.org; Wed, 20 Sep 2017 03:02:21 -0400
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 41DE8AA495
	for <qemu-devel@nongnu.org>; Wed, 20 Sep 2017 09:02:19 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id 053A450009A;
	Wed, 20 Sep 2017 09:02:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Sep 2017 09:01:32 +0200
Message-Id: <20170920070135.31379-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170920070135.31379-1-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1331658115682896657
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.172.75
Subject: [Qemu-devel] [PATCH v2 3/6] smbus: add a smbus_eeprom_init_one()
 routine
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
X-TUID: xgSqT70jWQ0C

This is an helper routine to add a single EEPROM on an I2C bus. It can
be directly used by smbus_eeprom_init() which adds a certain number of
EEPROMs on mips and x86 machines.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/smbus_eeprom.c  | 16 +++++++++++-----
 include/hw/i2c/smbus.h |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index b13ec0fe7a2a..2d24a4cd59bf 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -140,6 +140,16 @@ static void smbus_eeprom_register_types(void)
=20
 type_init(smbus_eeprom_register_types)
=20
+void smbus_eeprom_init_one(I2CBus *smbus, uint8_t address, uint8_t *eepr=
om_buf)
+{
+    DeviceState *dev;
+
+    dev =3D qdev_create((BusState *) smbus, "smbus-eeprom");
+    qdev_prop_set_uint8(dev, "address", address);
+    qdev_prop_set_ptr(dev, "data", eeprom_buf);
+    qdev_init_nofail(dev);
+}
+
 void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
                        const uint8_t *eeprom_spd, int eeprom_spd_size)
 {
@@ -150,10 +160,6 @@ void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
     }
=20
     for (i =3D 0; i < nb_eeprom; i++) {
-        DeviceState *eeprom;
-        eeprom =3D qdev_create((BusState *)smbus, "smbus-eeprom");
-        qdev_prop_set_uint8(eeprom, "address", 0x50 + i);
-        qdev_prop_set_ptr(eeprom, "data", eeprom_buf + (i * 256));
-        qdev_init_nofail(eeprom);
+        smbus_eeprom_init_one(smbus, 0x50 + i, eeprom_buf + (i * 256));
     }
 }
diff --git a/include/hw/i2c/smbus.h b/include/hw/i2c/smbus.h
index 544bbc19574f..666cdeb04c07 100644
--- a/include/hw/i2c/smbus.h
+++ b/include/hw/i2c/smbus.h
@@ -77,6 +77,7 @@ int smbus_read_block(I2CBus *bus, uint8_t addr, uint8_t=
 command, uint8_t *data);
 int smbus_write_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_=
t *data,
                       int len);
=20
+void smbus_eeprom_init_one(I2CBus *smbus, uint8_t address, uint8_t *eepr=
om_buf);
 void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
                        const uint8_t *eeprom_spd, int size);
=20
--=20
2.13.5

