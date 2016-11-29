Received: by 10.25.150.194 with SMTP id y185csp2414200lfd;
        Tue, 29 Nov 2016 07:50:02 -0800 (PST)
X-Received: by 10.237.44.97 with SMTP id f88mr23926703qtd.11.1480434602837;
        Tue, 29 Nov 2016 07:50:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si27790385qte.286.2016.11.29.07.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:50:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkfR-0001fn-Kn
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:50:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkaz-0006VP-La
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkav-0004Vt-N7
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:25 -0500
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:42850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkav-0004V0-Gk
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:21 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id D69881F889
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:45:19 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 55A55120084;
	Tue, 29 Nov 2016 16:45:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:41 +0100
Message-Id: <1480434248-27138-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11713581156551789329
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.158.110
Subject: [Qemu-arm] [PATCH for-2.9 03/30] aspeed: QOMify the CPU object and
 attach it to the SoC
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
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3zqrkxRiVEEL

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c         | 17 ++++++++++++++---
 include/hw/arm/aspeed_soc.h |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index e14f5c217eab..db145e201451 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -87,9 +87,13 @@ static void aspeed_soc_init(Object *obj)
 {
     AspeedSoCState *s =3D ASPEED_SOC(obj);
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
+    char *cpu_typename;
     int i;
=20
-    s->cpu =3D cpu_arm_init(sc->info->cpu_model);
+    cpu_typename =3D g_strdup_printf("%s-" TYPE_ARM_CPU, sc->info->cpu_m=
odel);
+    object_initialize(&s->cpu, sizeof(s->cpu), cpu_typename);
+    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    g_free(cpu_typename);
=20
     object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
     object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
@@ -146,6 +150,13 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         ASPEED_SOC_IOMEM_BASE, &s->iomem=
, -1);
=20
+    /* CPU */
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
     if (err) {
@@ -154,9 +165,9 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, ASPEED_SOC_VIC_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
-                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
-                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
=20
     /* Timer */
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &e=
rr);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 5406b498d7ef..6f1b679c97b1 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -27,7 +27,7 @@ typedef struct AspeedSoCState {
     DeviceState parent;
=20
     /*< public >*/
-    ARMCPU *cpu;
+    ARMCPU cpu;
     MemoryRegion iomem;
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
--=20
2.7.4

