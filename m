Received: by 10.223.197.9 with SMTP id q9csp6633094wrf;
        Thu, 19 Oct 2017 03:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SxOijjHv363AIzG4S/NnWsOH7PjophGzb3Zf0DlKrcHB0b/RSOL+lYQW1BKlSa9JKqTiJ/
X-Received: by 10.200.40.120 with SMTP id 53mr1276928qtr.164.1508407637029;
        Thu, 19 Oct 2017 03:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407637; cv=none;
        d=google.com; s=arc-20160816;
        b=mKWp8Z157FZIMIuU7tlKETFX5YO9RfHZP6T36DkyoQ3vR8sU7Wu23liqswLiuU6f7l
         l/HOmaXEdKsv7sNniiW43fJSALx4GudIJ4R6Z2p6JGTzb1bAx3WORO4VimuUL5+7blqf
         zOGhuS0VLDFt650MhG4MoZO/TKu74StliFXOdFAuiVtAvcH1tHS4BZPuVARo12yJz1CZ
         b8/Ue99RoitLGAl6lGQSZwkJjtEGyjWNWAK6+EPaNlTQs/9ZGfBzq2KqmEsl2KST9dxg
         m5wOuN5jShtEguSaTYALAAE1vaWEQRGU16MVyqUXdbOGQsnjiRZarTGaeAGTFdDm3kWB
         d5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=q3lWNaR6bLrdpf0dyFePxO1aNyJDWY1EKen+AX/8WAw=;
        b=Mjo/55bLHfFXIyXHPrR3+DDMPDCHM5dMjvdm8NysHYeJPItNAGn1rBWux3zKP7rP4r
         4ilBeRCWsYPRZjDMn9GqHr5m/GO9DuDkfXyEJfDP5m81MBMCMkFLNUgy1B1oZB7Uj+nE
         aqpMf87AaV8AiRggAx9e/Mhp74CqKcYllgkrFBOIdP0atb5v8kdnZG4W4e8GF6TMkioa
         CEyBJRmB3i8Ezr2MHZsRjvz3mYAnPfoxdyzdiXS/wDF5cH/egjh1mNpDT3rTe1QQlq5I
         j7BK/BPdXn4gG0xeMLqFdW/FyR7+dZ+51/Giuz6o3nNIwfziz6GZwP1Nrg1OXQqDcopT
         mNPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s45si5446966qtk.103.2017.10.19.03.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57jO-0004Ti-PJ
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:07:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57hF-00036i-KA
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:05:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57hC-0008Mt-Vn
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:05:01 -0400
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:55353)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57hC-0008LT-Px
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:58 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 4BC30141817
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 12:04:57 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 1749480093;
	Thu, 19 Oct 2017 12:04:50 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:07 +0200
Message-Id: <20171019100410.26239-6-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019100410.26239-1-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8703487757119228689
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.174.144
Subject: [Qemu-devel] [PATCH v4 5/8] smbus: add a smbus_eeprom_init_one()
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
X-TUID: YbtRLaIwbzBg

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

