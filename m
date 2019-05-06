Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2470162wrh;
        Mon, 6 May 2019 07:24:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4AmQh1fgnh4MeCrIg/LfDKCbQjHVuMlIXv1DZ0XSTbuWvKs559PfsPBNb/P1AdROnQSzt
X-Received: by 2002:a5d:654a:: with SMTP id z10mr18860588wrv.153.1557152653626;
        Mon, 06 May 2019 07:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557152653; cv=none;
        d=google.com; s=arc-20160816;
        b=PzTY3Ra44/fALvE2c6yETX7aZAQSAiUr9/faZZWj5AyBR6ZB7JfZwo6zGJYgAFlo+n
         3u5J7OWokFC9/26o+WPD94xMFUJI1aCVmmrwh6srF0Twn0bctQ2rD2KQZvrpCCo4HB9a
         SCgpvJxw9K/gv2Cy5saN1kcpPNWiG5kD9PzZ89StqJFemM92f68O16BlVq3tHEKcEp0J
         oJfRLr03seeSHlRuNl4SCgk3ZY7IwfSlzvy/V+blxcRGZuZQXb39i7+S9T0ehekIMz9g
         ia1mfa6b7Z8b7vfRRWSHRZNqGO+/jCZ3K/62h1Qh2d5zG3YBP9fuyS85VXCrLw98G5Ox
         j2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+ppLBQKI4qo1Ik7PtMYHrqlYvvLddDrJr7uZQbzSTsg=;
        b=Bxvx0CEO1a+HtEsnNQUa2A5QFvgLuRD0IPlW1kOfrU14Mq66cv+AlsndUhiQHXpjbA
         +k/TfijfCldY8/Wc8sH1kcxxQd7VSsbrvgJwLzJNH8xAWr2fNNJtuzfmd/+WfnOd0Csh
         05LKG+HUR9nhs2RNemPlU7QgrmqRxQaUiXiq8CfS7UTV50ZXW7+GpGXX5tp+gDLSAUPt
         i+eJ6JnkfhtPyxnFJQszIlOewvCG8E4oXzbIHGnljl9S8A/MBES7YBGy0vps+K8CYRY8
         k0iQPPkCXcueFe6gWZnwBkbm/99OBOfQcq80JSAkiXDtKfR6CCCOwGBDpFLHeqrvDAI/
         OH1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si6814040wme.76.2019.05.06.07.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 07:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNeXM-0003gd-Kf
	for alex.bennee@linaro.org; Mon, 06 May 2019 10:24:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNeUX-0001QL-Ko
	for qemu-arm@nongnu.org; Mon, 06 May 2019 10:21:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNeUW-0004qQ-FZ
	for qemu-arm@nongnu.org; Mon, 06 May 2019 10:21:17 -0400
Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]:58066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hNeUW-0004p7-70
	for qemu-arm@nongnu.org; Mon, 06 May 2019 10:21:16 -0400
Received: from player779.ha.ovh.net (unknown [10.108.54.72])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 9B3EA18F156
	for <qemu-arm@nongnu.org>; Mon,  6 May 2019 16:21:14 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id 69DDB55A998D;
	Mon,  6 May 2019 14:21:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  6 May 2019 16:20:42 +0200
Message-Id: <20190506142042.28096-4-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506142042.28096-1-clg@kaod.org>
References: <20190506142042.28096-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4817162753632275217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.165.38
Subject: [Qemu-arm] [PATCH v2 3/3] aspeed: use sysbus_init_child_obj() to
 initialize children
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dNc9ZJZF31Ye

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 50 ++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index bd83618ceba9..4b705afd096a 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -172,12 +172,11 @@ static void aspeed_soc_init(Object *obj)
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
-    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    object_initialize_child(obj, "cpu", OBJECT(&s->cpu), sizeof(s->cpu),
+                            sc->info->cpu_type, &error_abort, NULL);
=20
-    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
-    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
-    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
+    sysbus_init_child_obj(obj, "scu", OBJECT(&s->scu), sizeof(s->scu),
+                          TYPE_ASPEED_SCU);
     qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
                          sc->info->silicon_rev);
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
@@ -187,36 +186,29 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key", &error_abort);
=20
-    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
-    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
-    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "vic", OBJECT(&s->vic), sizeof(s->vic),
+                          TYPE_ASPEED_VIC);
=20
-    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
-    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
+    sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
+                          sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
     object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
                                    OBJECT(&s->scu), &error_abort);
-    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
=20
-    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
-    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
-    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+    sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
+                          TYPE_ASPEED_I2C);
=20
-    object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
-    object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
-    qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
+    sysbus_init_child_obj(obj, "fmc", OBJECT(&s->fmc), sizeof(s->fmc),
+                          sc->info->fmc_typename);
     object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
                               &error_abort);
=20
     for (i =3D 0; i < sc->info->spis_num; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]),
-                          sc->info->spi_typename[i]);
-        object_property_add_child(obj, "spi[*]", OBJECT(&s->spi[i]), NUL=
L);
-        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
+                              sizeof(s->spi[i]), sc->info->spi_typename[=
i]);
     }
=20
-    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
-    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
-    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
+    sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc)=
,
+                          TYPE_ASPEED_SDMC);
     qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
                          sc->info->silicon_rev);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
@@ -225,16 +217,14 @@ static void aspeed_soc_init(Object *obj)
                               "max-ram-size", &error_abort);
=20
     for (i =3D 0; i < sc->info->wdts_num; i++) {
-        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT=
);
-        object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), NUL=
L);
-        qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
+                              sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
         qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
                                     sc->info->silicon_rev);
     }
=20
-    object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC10=
0);
-    object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), N=
ULL);
-    qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbus_get_default());
+    sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
+                          sizeof(s->ftgmac100), TYPE_FTGMAC100);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
--=20
2.20.1

