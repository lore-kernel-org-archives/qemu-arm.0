Received: by 10.80.163.71 with SMTP id 65csp1196761edn;
        Sun, 25 Sep 2016 13:36:16 -0700 (PDT)
X-Received: by 10.55.156.213 with SMTP id f204mr17898687qke.148.1474835775968;
        Sun, 25 Sep 2016 13:36:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a48si12426981qta.99.2016.09.25.13.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Sep 2016 13:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1boG9n-0003Dq-HC
	for alex.bennee@linaro.org; Sun, 25 Sep 2016 16:36:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jakub@jermar.eu>) id 1boG9i-0003BN-Ez
	for qemu-arm@nongnu.org; Sun, 25 Sep 2016 16:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jakub@jermar.eu>) id 1boG9g-0006dp-75
	for qemu-arm@nongnu.org; Sun, 25 Sep 2016 16:36:09 -0400
Received: from tmave.modry.cz ([82.208.58.129]:34676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jakub@jermar.eu>)
	id 1boG9a-0006Zc-E7; Sun, 25 Sep 2016 16:36:02 -0400
Received: from 93-153-64-87.tmcz.cz ([93.153.64.87] helo=gorgo.localdomain)
	by tmave.modry.cz with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.86_2)
	(envelope-from <jakub@jermar.eu>)
	id 1boG97-0004Zz-NV; Sun, 25 Sep 2016 22:35:58 +0200
From: =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub@jermar.eu>
To: qemu-devel@nongnu.org
Date: Sun, 25 Sep 2016 22:35:12 +0200
Message-Id: <1474835712-13628-1-git-send-email-jakub@jermar.eu>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.7.4"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 82.208.58.129
Subject: [Qemu-arm] [PATCH v2] hw/arm: Fix Integrator/CM initialization
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
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub@jermar.eu>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ++ZQhY9qSqYo

This is a multi-part message in MIME format.
--------------2.7.4
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


Initialization of a class instance cannot depend on its own properties
as these are not yet set.  Move parts of integratorcm_init() that depend
on the "memsz" property to the newly added integratorcm_realize().

This fixes: https://bugs.launchpad.net/qemu/+bug/1624726

Signed-off-by: Jakub Jermar <jakub@jermar.eu>
---
 hw/arm/integratorcp.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)


--------------2.7.4
Content-Type: text/x-patch; name="v2-0001-hw-arm-Fix-Integrator-CM-initialization.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline; filename="v2-0001-hw-arm-Fix-Integrator-CM-initialization.patch"

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 96dc150..039812a 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -252,6 +252,26 @@ static void integratorcm_init(Object *obj)
     /* ??? What should the high bits of this value be?  */
     s->cm_auxosc = 0x0007feff;
     s->cm_sdram = 0x00011122;
+    memcpy(integrator_spd + 73, "QEMU-MEMORY", 11);
+    s->cm_init = 0x00000112;
+    s->cm_refcnt_offset = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24,
+                                   1000);
+    memory_region_init_ram(&s->flash, obj, "integrator.flash", 0x100000,
+                           &error_fatal);
+    vmstate_register_ram_global(&s->flash);
+
+    memory_region_init_io(&s->iomem, obj, &integratorcm_ops, s,
+                          "integratorcm", 0x00800000);
+    sysbus_init_mmio(dev, &s->iomem);
+
+    integratorcm_do_remap(s);
+    /* ??? Save/restore.  */
+}
+
+static void integratorcm_realize(DeviceState *d, Error **errp)
+{
+    IntegratorCMState *s = INTEGRATOR_CM(d);
+
     if (s->memsz >= 256) {
         integrator_spd[31] = 64;
         s->cm_sdram |= 0x10;
@@ -267,20 +287,6 @@ static void integratorcm_init(Object *obj)
     } else {
         integrator_spd[31] = 2;
     }
-    memcpy(integrator_spd + 73, "QEMU-MEMORY", 11);
-    s->cm_init = 0x00000112;
-    s->cm_refcnt_offset = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24,
-                                   1000);
-    memory_region_init_ram(&s->flash, obj, "integrator.flash", 0x100000,
-                           &error_fatal);
-    vmstate_register_ram_global(&s->flash);
-
-    memory_region_init_io(&s->iomem, obj, &integratorcm_ops, s,
-                          "integratorcm", 0x00800000);
-    sysbus_init_mmio(dev, &s->iomem);
-
-    integratorcm_do_remap(s);
-    /* ??? Save/restore.  */
 }
 
 /* Integrator/CP hardware emulation.  */
@@ -633,6 +639,7 @@ static void core_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->props = core_properties;
+    dc->realize = integratorcm_realize;
 }
 
 static const TypeInfo core_info = {

--------------2.7.4--


