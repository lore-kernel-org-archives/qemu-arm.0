Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp154663wrq;
        Thu, 21 Jun 2018 15:40:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL2phciepBHNrCLxmgvl188ECZ51Z3h5AS5oOV3qCIPAL89pGsBvURbvd6WnGNkiAif5L++
X-Received: by 2002:a0c:9dc3:: with SMTP id p3-v6mr24669635qvf.211.1529620841765;
        Thu, 21 Jun 2018 15:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529620841; cv=none;
        d=google.com; s=arc-20160816;
        b=f7NnUmIwBG2mRGb2w2El4JU9EhvPTqufBV7eTjAV+lnrilTuQqdDpGrYdh6uPylVhv
         Q4lLh7mqgzGLqCwAiyU1wZlMzQAjD+BpMVJENH4AZ1ExXjmqzO2gokWeIX1qey6Lt7Ke
         CSktRorHmAMHTRbna94cmNDgYgFTBKSMloROjMwga7KFSLHLrLbITyIS0x7gLlkaDKDD
         u0OAgC257Xo63MRi0uwUaS7yAkFyEcevR4wM2DNzj2IhTUqE57CstPyB5AmL7ZuA5knC
         7+h6NV5kjC+xBpfSftZx07qkQ/59Wd3M16aOxH51YHwM/Or+5t50KTjt9cAjJouE4OMm
         o3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tvVicA1wSMs7iA5do4sTgzBAp8OBe52+caH/kikDlHU=;
        b=hPsaExxnFA4OH2c86/mjoMhzbYu6YY2jh+vOgTpBzgXywsH2MyW3lm2eCmK0RqOPAL
         NSx43rJdnOzhjMY3dk1dhTsIBQZ9OrIgHg/SEzdq1j9mYFHer4FyE/Yg1KPEFuOk/6oM
         1hwB+RiNYTVODGmiyWqGXHjxEsFT5Alx1KgV+n584hmub1TAPHLfQo8pQlHchMCL2YYc
         n6rLZzIVXtt/8t5v8KANSebn6XtAlu9eJXv9yBUrHeubyXPtue6jO6JO1sFOC03AaT/e
         BDympUnLrltWoL6UFVnXGwVa/YrDosqtwrEQPtueHNY9pKJO0KNoOMRUP0oqEORTTvf5
         tAWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t127-v6si5742474qkc.292.2018.06.21.15.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 15:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW8Ft-0000p8-5x
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 18:40:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fW8FU-0000Yw-6z
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 18:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fW8FS-0001sT-Tz
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 18:40:16 -0400
Received: from 10.mo177.mail-out.ovh.net ([46.105.73.133]:54403)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fW8FS-0001sF-AQ
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 18:40:14 -0400
Received: from player696.ha.ovh.net (unknown [10.109.108.13])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id D01C4B684D
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 00:40:12 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player696.ha.ovh.net (Postfix) with ESMTPSA id 8BA083C007E;
	Fri, 22 Jun 2018 00:40:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2018 00:39:45 +0200
Message-Id: <20180621223946.20738-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180621223946.20738-1-clg@kaod.org>
References: <20180621223946.20738-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2975753454427081536
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.73.133
Subject: [Qemu-arm] [PATCH 2/3] aspeed: initialize the SCU controller first
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
X-TUID: VXgNG2xGJYJ3

The System Control Unit should be initialized first as it drives all
the configuration of the SoC and other device models.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
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

