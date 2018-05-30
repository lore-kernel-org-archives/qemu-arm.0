Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4400332wre;
        Tue, 29 May 2018 23:42:27 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIqFfc+UrqiRF6A9gny6IuYQghYoNeCS7bhNTi76SA8DN+jzcPlnxG80rTEbvYbYO0iZdeE
X-Received: by 2002:a0c:d10f:: with SMTP id a15-v6mr1311814qvh.234.1527662547613;
        Tue, 29 May 2018 23:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662547; cv=none;
        d=google.com; s=arc-20160816;
        b=ulbTyAUHC/eurQojA+F7X26wRlCaLxo2bhQWW5PZ5KCWJGJlGSi7zkioaoDxhCauts
         Z7ixTDhUYGtEQs9OPyfuRrcW5p9O+NwaUZdIPX7xfp3qdhz8MOE3PQv5YPvcFkonxVBW
         nlW/+2gc5v3Q+zXVRyG4cNu8V8rQfMA8yJ7N10aeswn5q3lNZl4KFjjIMTYvKFGIm9KY
         GyNPS6I1zftpK6SleOy3dUFaZZ/j7QqIZF3okv4y59vxOt91oYNEun2stNh4jICGnt8/
         k8VFoHkbo9oBh2GQB0B4Md8j9rZjQ7hrAxrfOiDzmMCx6f4Tx3rYz7Csy/ujBHk+gmLX
         eVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=wgw6a5ONYRLbT1Ge4O2EKIV2K4zM6gav7LOPagRr1DY=;
        b=Il9XJ+8RYQHPZxVvEv6r5xeCVmsY0Z+BZ4zkPc0C3Rzp4TJSAEI7AAKxuUGUiGTWdt
         ZF2vSKimiu4DDXRLM1eL1rL16DVFb1a5Q2i6TqvyaAymH8iPTV0GLZNZxO67FjJsqCV/
         MvX4CwQLXwJ49OI8aoyHQCXXtW+7HjdHSxWppsh8xbLatWYWuOeVYOEJ2s8i7ie1Vy9F
         ZwJieVleYVt0ppNR9KtfKlEbT7wRVFKVE2xYjYF/T/kIhxgLHevvBHqKE+JFnPvA+Ap7
         ooYWWLSCLLsgxYZyVILuVRrIBv5uyP5yS0d6F7N8jWDr+ADoV8Tl4oXWVLEn0fzOvTX/
         8nXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m42-v6si505406qvm.136.2018.05.29.23.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuoS-0002s9-Qg
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:42:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunm-0002UY-Ot
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuni-0001CA-Qz
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:42 -0400
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:46680)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNuni-0001Bm-Jn
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:38 -0400
Received: from player159.ha.ovh.net (unknown [10.109.122.61])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 1ACE1100069
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:41:37 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id D30D04800AC;
	Wed, 30 May 2018 08:41:29 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 08:40:46 +0200
Message-Id: <20180530064049.27976-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530064049.27976-1-clg@kaod.org>
References: <20180530064049.27976-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5161406651646708497
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.38.232
Subject: [Qemu-arm] [PATCH v7 4/7] smbus: add a smbus_eeprom_init_one()
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
X-TUID: LfvnNMZOXWJT

This is an helper routine to add a single EEPROM on an I2C bus. It can
be directly used by smbus_eeprom_init() which adds a certain number of
EEPROMs on mips and x86 machines.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 include/hw/i2c/smbus.h |  1 +
 hw/i2c/smbus_eeprom.c  | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

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
--=20
2.13.6

