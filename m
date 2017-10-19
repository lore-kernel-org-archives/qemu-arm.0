Received: by 10.223.197.9 with SMTP id q9csp7007806wrf;
        Thu, 19 Oct 2017 09:43:33 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Qdq2E6iaV/W0v9hg+lbLhwIuDT691jgAqguN85MPkv83x4vd+P1HJ9lYkVUQEsnBLmh6D+
X-Received: by 10.55.221.11 with SMTP id n11mr2881168qki.175.1508431413505;
        Thu, 19 Oct 2017 09:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508431413; cv=none;
        d=google.com; s=arc-20160816;
        b=KiFqelzBM1J5r5z1sTagMPlvUj54EOulpOa/APIsXMMV6Q1Oe8RzUx4e/LDg+QYC26
         oRdMszMfnikDeaOaVbDZ34uv18BtV/6urK37AApogpsV03j1VsWvKAeLyfTaWHX/Nkzh
         7sewMPK6YL4Jv3qpa8hKWUDKGAxPk9FcGCCU2dqq5kLKlP609DCISNSmRhaAcauXRGpe
         9qI8PDkRZTnG6P4Q17uvKmhNEpOFm8EyPDmt8UD+9Qz8/NBOa3y0cDsSgTQ6e3rrwAW2
         2lws+jUVO9ZskE4PHUZoX18+/dbUIbnjGeJ6uUdTwwu3HLmQWEUX4ZPk3aviLFwzjVby
         I7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=q3lWNaR6bLrdpf0dyFePxO1aNyJDWY1EKen+AX/8WAw=;
        b=xW3Q1Cfea32JKv/vXKXFXTBeFFeiCAz2bLfUeFjaTDklT4J/CA4zwT+ZJo/8dRPr3n
         TiOV8ngtpeRKJh2580FOqWF+9/nZ457gc+zmkXPWOu2n2NOQ21wB9iKu7YmIX9Yjsxdb
         F/KEFNU2HjIc6o73nhk+Kh2QMfvsTfPyFcn9G+kcPWNAludjhNilPhvEMZ4OhkUo2zbq
         isTR7Bq6Rjauj0kUZmJeqUicYcm5cP/cxbiBH2CetTEexAwC8dzHHt7SX0IQpq7+EJ+2
         k1uPpLhAlm0x1OU6bAt+Afbhdu9lKorGKTEYeCA91UDlYeb3vdBTmsIKRJeZGObA8nrS
         Bxtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b190si11840740qkd.189.2017.10.19.09.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 09:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Dut-0006yu-Bd
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 12:43:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DoA-0001Rj-AD
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Do9-0003gR-8p
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:34 -0400
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]:49273)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5Do9-0003fy-3b
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:33 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 0EC0E146210
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 18:36:32 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id D0A2980086;
	Thu, 19 Oct 2017 18:36:24 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:35:43 +0200
Message-Id: <20171019163546.2039-6-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019163546.2039-1-clg@kaod.org>
References: <20171019163546.2039-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15316742336289934097
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.182.191
Subject: [Qemu-arm] [PATCH v6 5/8] smbus: add a smbus_eeprom_init_one()
 routine
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
X-TUID: EiGRTuYwiTTD

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

