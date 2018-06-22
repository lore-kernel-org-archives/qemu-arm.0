Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp540986wrq;
        Fri, 22 Jun 2018 01:01:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdcOmah2LDCyYpeqEZDuXDJnLh70ZuIlMDYCqdwtfvlY6oCCMwWi62gLqlHGhtU/BtBmlRJ
X-Received: by 2002:a0c:c584:: with SMTP id a4-v6mr445854qvj.11.1529654460835;
        Fri, 22 Jun 2018 01:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529654460; cv=none;
        d=google.com; s=arc-20160816;
        b=qcmj0kq5bUl78YEVxNE6cpCcTfguoYhFijRfrrlMElFqeUSzGSffeteoesHN8OKPv9
         IcNWEhULEuqOnzHDTRwSB3X4sUYJCCgXuhNys5vDNSaabhUjqNPWWqgGVffXKg8FcINq
         ytpgaCtiWFSFQRWdzH1NecfNwRIPesx13Tt3hedfIO+L0GkUJEkZ+lo/apaNm2wfOP0H
         WUaecSaHHgmN0wmbKkv/QtJTIgqds3rrl9mj/+x8UBTChnb14XxvBM1uqvtF+EPduyDD
         3ztRK7CGWSij6D9hSjluXxC8iuMIG4FNv1+3Rpseyh29T4XiRYiKKl605LLhJn08IJeQ
         fydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=czpe1kUOqJ24YB6eUdz4F2oIS8+rcRVt2rZ1olj+rGI=;
        b=FWv2TS/foCRqv5dZnKDVX5yzIRX14gpui32uA5dRu1Oy9ZVgaqkhYuuViU1BCBMXin
         Kw9aAk2UMH8sL6vsXhwM8N5rmgo62JoZdBzfnSryTvb2tcAx3pJEuoeiKdIE4iopAsgJ
         2DG8RYkOQ6Or3RmSp+jsV+UUXjKvkwtanuHx18MjP+YcmILH/jjaABITCGTaTi2crKRi
         sL7uTNeeydHTliLBA4T9nFAoCn2YkXBq+HcBi5tJ0X2pdA7Y7dRGoK1A0uoiG0QQLFc5
         pyY7d8Y3WNVTYbGKOQX9NjbS33YrOA5ZfARUVtMx99FhLm43o6MgFXJZOOKrOY8Mc4Ra
         k3tA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z40-v6si2251508qtz.186.2018.06.22.01.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 01:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWH08-0000fK-DO
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 04:01:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwg-0006Wu-3O
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwe-0008Ry-SE
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:25 -0400
Received: from 7.mo173.mail-out.ovh.net ([46.105.44.159]:41834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fWGwe-0008QX-L6
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:24 -0400
Received: from player168.ha.ovh.net (unknown [10.109.122.68])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 67E3CC66DD
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 09:57:23 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 23B4B4200B0;
	Fri, 22 Jun 2018 09:57:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2018 09:56:59 +0200
Message-Id: <20180622075700.5923-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180622075700.5923-1-clg@kaod.org>
References: <20180622075700.5923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12385743402124872512
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.44.159
Subject: [Qemu-arm] [PATCH v2 2/3] aspeed: initialize the SCU controller
 first
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hSvZsARyr8IY

The System Control Unit should be initialized first as it drives all
the configuration of the SoC and other device models.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_soc.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 1955a892f4a4..7cc05ee27ea4 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -109,18 +109,6 @@ static void aspeed_soc_init(Object *obj)
     object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
     object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
=20
-    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
-    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
-    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
-
-    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
-    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
-    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
-
-    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
-    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
-    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
-
     object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
     object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
     qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
@@ -133,6 +121,18 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key", &error_abort);
=20
+    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
+    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
+    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
+
+    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
+    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
+    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
+
+    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
+    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
+    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
@@ -195,6 +195,14 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     memory_region_add_subregion(get_system_memory(), ASPEED_SOC_SRAM_BAS=
E,
                                 &s->sram);
=20
+    /* SCU */
+    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
+
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
     if (err) {
@@ -219,14 +227,6 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* SCU */
-    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
-
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hd(0)) {
         qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4=
]);
--=20
2.13.6

