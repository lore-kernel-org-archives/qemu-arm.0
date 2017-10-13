Received: by 10.223.197.9 with SMTP id q9csp805180wrf;
        Fri, 13 Oct 2017 07:30:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCxKcHtOtGoqbVl7qvd2UVaGW1rvtv3V9F9mXpyEGuQ4GQJIBDH7q3zroPfBBpXoHJzwZVM
X-Received: by 10.200.52.85 with SMTP id v21mr2301070qtb.2.1507905006375;
        Fri, 13 Oct 2017 07:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507905006; cv=none;
        d=google.com; s=arc-20160816;
        b=zQULQ+fhTSq24OM6+SfcEWRocrhfpbZ2YzyVwplWqLSP3OI8a3FoaLNNtLiD+uxy1j
         gwkExq0P0qXBhzQ/LjkrVkHyKaLk2R/cR0DykgwFg6xMiMHca7S9CFDR2CyhUJZOPkeE
         26frJ4p6Hr9YY6AKmsVa9Nj3i8G5L6CbvAd0/2X0iQW6NTjQbPNP8F3nMdjJVW45Bi9W
         NOpJfkDNJsKV6rlMX3wSmd/uQ5teH99y9gLDc5AoknJlDFYz/G3FmLlz1QmrGiHAwlYs
         IJs/XOBODKSxjBKDg/KXLvakfuw6OqeKXe67GrfUZNHNQYfX/H7+aEWfXK3xk1DpQvXN
         aZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=q3lWNaR6bLrdpf0dyFePxO1aNyJDWY1EKen+AX/8WAw=;
        b=nN/Qz14OWc4o95HD9vkCVZdvMpAGSMgh+TT7MwGGBU9Zh8IDVy6bJiVh+qoAjk062m
         ffBNP4b3jBQs1dybd0TWAlFL0epraRblW6i6NOCRcQZbsgJ9e2RUxPeP+dEuxRCi+2fF
         EtD9+8cZNvfqbx9h2KKr9CqR3aTjTALoPzIWg2bKVQCP8WVv4ZAUV5MQedBWAMpgGp1Y
         Z+514sv5WGkrAuq/zjkBiKfjha+n8ySdbtupxw+mxullJOqn3bVRAtqwzSwM7nClFa4u
         4/5C/5d++qk2098c3rq+Vl5s0OUoIOpdF84Yh2+qzLmOtYsNsuaVRR1Uw/KvqhwtJOb+
         NAQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g48si901668qtk.317.2017.10.13.07.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 07:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e30yR-0005H0-Ty
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 10:30:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30y8-0005D2-3n
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30y4-0000hG-3b
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:44 -0400
Received: from 1.mo4.mail-out.ovh.net ([178.33.248.196]:34905)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e30y3-0000fI-T6
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:40 -0400
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id A6887E7A53
	for <qemu-arm@nongnu.org>; Fri, 13 Oct 2017 16:29:38 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 7303B48009C;
	Fri, 13 Oct 2017 16:29:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Oct 2017 16:28:49 +0200
Message-Id: <20171013142852.916-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171013142852.916-1-clg@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14830916523426286353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtdeigdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.248.196
Subject: [Qemu-arm] [PATCH v3 3/6] smbus: add a smbus_eeprom_init_one()
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
X-TUID: H413kh687Uki

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

