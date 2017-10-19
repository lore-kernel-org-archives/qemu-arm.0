Received: by 10.223.197.9 with SMTP id q9csp6925547wrf;
        Thu, 19 Oct 2017 08:20:01 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TMlooCH5KnF1XRdRL+4EJy6le4hDrWBcoV3RgP/Zh6l1vqP5fZwwPozr3Z/6zd7H3T7ZP7
X-Received: by 10.200.3.150 with SMTP id t22mr2703967qtg.156.1508426401581;
        Thu, 19 Oct 2017 08:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508426401; cv=none;
        d=google.com; s=arc-20160816;
        b=eFA7KYo4DOVtlgVOK9/apzOSdZ1oACqrekmf80TgAQpedP1NYGw4Rq4N7pDCXltJsj
         R/TmVlmu0COR9n/VU4juhJzHai/5s5x8oBoqMjk3k/P/QTOboL+iPIpx6ZIeB6QxNj4X
         M7pVn1uX1X3ZP7RR/Lw0uogMfIwnZtaKFcD0yHQ/yimauDmvZK8fZqmCrFqVz6e8ag63
         vBiRD5iM1ZgrdwvCfCX+d2Alf2QW7HVaLnzBP/etVvUy39Qf9wj889V438TNRoIEHT/J
         /w8eSs+6LbVtq1FCNXeO1GrjipR52lZUWDh5J81aQdO4EdZacojbIJSAWJcpn6E4Hrh8
         BO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=q3lWNaR6bLrdpf0dyFePxO1aNyJDWY1EKen+AX/8WAw=;
        b=QW7TMKwDVTTij902wCzakpDVhZ1jTXLXgULwSkRcp7Rnx0ejSWagZyXTsuFO4kB6+5
         v/dzurcBAP4yC3T0qIjzGdMaN2cF/0JsfN0x/H/ndeTx0kcWur3Knv61bMQEud3NMUEu
         mB5aKIvNGpsdDRxa9tlqTn0dgjKzutq9w5l2uJljs9m4K4Dl9qSsbI2qpIpFM4xi3IDa
         26TOzAyPYK4JT8T9rgPizBynHDTCJvlou7kkOnk1I6pA0KoNuaNkO0s0JVe1kIFv05WM
         zLz1UFGzHE47AiWI5J9JMmB0Cj8HUuxgYSuGWc6M2VV1VTbE7RyeDttCIzXi+u3kW4mt
         FI6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y81si4916956qka.241.2017.10.19.08.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Cc3-0005dy-B0
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:19:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVx-0001SV-TO
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 11:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVt-0001X0-T8
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 11:13:41 -0400
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:41439)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5CVt-0001WN-My
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 11:13:37 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id BB6DB145E8A
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 17:13:36 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 87F488007A;
	Thu, 19 Oct 2017 17:13:29 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:12:46 +0200
Message-Id: <20171019151249.13663-6-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019151249.13663-1-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13916122852545432337
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.52.148
Subject: [Qemu-devel] [PATCH v5 5/8] smbus: add a smbus_eeprom_init_one()
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
X-TUID: Ps7ev8nQRJgX

This is an helper routine to add a single EEPROM on an I2C bus. It can
be directly used by smbus_eeprom_init() which adds a certain number of
EEPROMs on mips and x86 machines.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
2.13.6

