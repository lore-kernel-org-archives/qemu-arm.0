Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp430837wrq;
        Fri, 13 Jul 2018 01:35:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdHcU1N0auTlopPtj685xpALz3lUBtYxyu67uCW1mdN4k9VBftk8Le3BCop42H79153eK/0
X-Received: by 2002:a37:e216:: with SMTP id g22-v6mr4658545qki.61.1531470940333;
        Fri, 13 Jul 2018 01:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470940; cv=none;
        d=google.com; s=arc-20160816;
        b=PkeaHuKqoZbxgIMIYQIDgfm1u/gKTIeNWOzqex3UrKJakDHQ+nkjiX8LJP4nrQj0qV
         hepHj0vnhngxtLaPJykv/dfBSjKXlgFLhWL1kA/1kxOlx91qHDXF90i3Mk8O98Qv4zmW
         yszc6WXEAvCh4d75j+hDHLrzBflCh9VmK8uweGUglT5AabXhPyJLTYm07p1sr5zBCLy1
         C8SFsIP51wwqsY72LJkeriaYD3v4xAp8nmPL75gQTzr9qqNKXc6lzulzGOW2X/Pwi54a
         0M0db1E8VCEEdbMoKKa5cxqsXt8bdVPfFoXY2ADCJu9qN+KIoLfwP0J2BRk2gmUpmGvI
         zAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3kk5k0GrHdTQy7iZxJStFeZNr/v/e+Z0WrkknnTwid4=;
        b=cRycQlrYKDtU1UZJ2j8GiKLzkXuGTlEvmRx5rstsDaukADjVPagj8VvwXd/xeBsmix
         5+IY3OmJ46aFrUy4MHIVL3rW58Jr/7Jp3uhTdwGjinN3qQeIyEnG59rVyQKurwPHdWPU
         KjFjzTPJ6/XMlg4UlqLHFRxnu6CP7wMXJ6uO4fK88iuVIs1Nu6WU8keK6ZEeSLGklKot
         oVcmGMpKlwqcIDYEcimr5TEQEWCrIdeELoKCpB1gcBJQIg9j5J+/RlNjDx5xW0wymLFe
         v3T42tiuH3MhQvMUGGYa6BRQzQJDwDV9aSLF0gyvtqK6u5bxlZSeL2dlT/TGhCPTLGgT
         lqhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15-v6si1160883qtn.130.2018.07.13.01.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtYB-00007z-Np
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:35:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtR9-0002bo-3o
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtR7-0004rA-I7
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56488 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtR7-0004qI-C0; Fri, 13 Jul 2018 04:28:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDB3F402382F;
	Fri, 13 Jul 2018 08:28:20 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46CAB2026D6B;
	Fri, 13 Jul 2018 08:28:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:39 +0200
Message-Id: <1531470464-21522-12-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:21 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 11/16] hw/arm/fsl-imx7: Fix introspection
 problems with the "fsl, imx7" device
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e3MZwktiLAg7

Running QEMU with valgrind indicates a problem here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'fsl,imx7'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==27284== Invalid read of size 8
==27284==    at 0x618F7A: qdev_print (qdev-monitor.c:686)
==27284==    by 0x618F7A: qbus_print (qdev-monitor.c:719)
==27284==    by 0x452B38: handle_hmp_command (monitor.c:3446)
[...]

Use the new sysbus_init_child_obj() and object_initialize_child() to make
sure that the objects are removed correctly when the parent gets destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx7.c | 96 +++++++++++++++++++------------------------------------
 1 file changed, 32 insertions(+), 64 deletions(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 44fde03..4aad720 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -30,157 +30,125 @@
 
 static void fsl_imx7_init(Object *obj)
 {
-    BusState *sysbus = sysbus_get_default();
     FslIMX7State *s = FSL_IMX7(obj);
     char name[NAME_SIZE];
     int i;
 
 
     for (i = 0; i < MIN(smp_cpus, FSL_IMX7_NUM_CPUS); i++) {
-        object_initialize(&s->cpu[i], sizeof(s->cpu[i]),
-                          ARM_CPU_TYPE_NAME("cortex-a7"));
         snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_property_add_child(obj, name, OBJECT(&s->cpu[i]),
-                                  &error_fatal);
+        object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
+                                ARM_CPU_TYPE_NAME("cortex-a7"), &error_fatal);
     }
 
     /*
      * A7MPCORE
      */
-    object_initialize(&s->a7mpcore, sizeof(s->a7mpcore), TYPE_A15MPCORE_PRIV);
-    qdev_set_parent_bus(DEVICE(&s->a7mpcore), sysbus);
-    object_property_add_child(obj, "a7mpcore",
-                              OBJECT(&s->a7mpcore), &error_fatal);
+    sysbus_init_child_obj(obj, "a7mpcore", &s->a7mpcore, sizeof(s->a7mpcore),
+                          TYPE_A15MPCORE_PRIV);
 
     /*
      * GPIOs 1 to 7
      */
     for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
-        object_initialize(&s->gpio[i], sizeof(s->gpio[i]),
-                          TYPE_IMX_GPIO);
-        qdev_set_parent_bus(DEVICE(&s->gpio[i]), sysbus);
         snprintf(name, NAME_SIZE, "gpio%d", i);
-        object_property_add_child(obj, name,
-                                  OBJECT(&s->gpio[i]), &error_fatal);
+        sysbus_init_child_obj(obj, name, &s->gpio[i], sizeof(s->gpio[i]),
+                          TYPE_IMX_GPIO);
     }
 
     /*
      * GPT1, 2, 3, 4
      */
     for (i = 0; i < FSL_IMX7_NUM_GPTS; i++) {
-        object_initialize(&s->gpt[i], sizeof(s->gpt[i]), TYPE_IMX7_GPT);
-        qdev_set_parent_bus(DEVICE(&s->gpt[i]), sysbus);
         snprintf(name, NAME_SIZE, "gpt%d", i);
-        object_property_add_child(obj, name, OBJECT(&s->gpt[i]),
-                                  &error_fatal);
+        sysbus_init_child_obj(obj, name, &s->gpt[i], sizeof(s->gpt[i]),
+                              TYPE_IMX7_GPT);
     }
 
     /*
      * CCM
      */
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX7_CCM);
-    qdev_set_parent_bus(DEVICE(&s->ccm), sysbus);
-    object_property_add_child(obj, "ccm", OBJECT(&s->ccm), &error_fatal);
+    sysbus_init_child_obj(obj, "ccm", &s->ccm, sizeof(s->ccm), TYPE_IMX7_CCM);
 
     /*
      * Analog
      */
-    object_initialize(&s->analog, sizeof(s->analog), TYPE_IMX7_ANALOG);
-    qdev_set_parent_bus(DEVICE(&s->analog), sysbus);
-    object_property_add_child(obj, "analog", OBJECT(&s->analog), &error_fatal);
+    sysbus_init_child_obj(obj, "analog", &s->analog, sizeof(s->analog),
+                          TYPE_IMX7_ANALOG);
 
     /*
      * GPCv2
      */
-    object_initialize(&s->gpcv2, sizeof(s->gpcv2), TYPE_IMX_GPCV2);
-    qdev_set_parent_bus(DEVICE(&s->gpcv2), sysbus);
-    object_property_add_child(obj, "gpcv2", OBJECT(&s->gpcv2), &error_fatal);
+    sysbus_init_child_obj(obj, "gpcv2", &s->gpcv2, sizeof(s->gpcv2),
+                          TYPE_IMX_GPCV2);
 
     for (i = 0; i < FSL_IMX7_NUM_ECSPIS; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]), TYPE_IMX_SPI);
-        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "spi%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->spi[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->spi[i], sizeof(s->spi[i]),
+                              TYPE_IMX_SPI);
     }
 
 
     for (i = 0; i < FSL_IMX7_NUM_I2CS; i++) {
-        object_initialize(&s->i2c[i], sizeof(s->i2c[i]), TYPE_IMX_I2C);
-        qdev_set_parent_bus(DEVICE(&s->i2c[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "i2c%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->i2c[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->i2c[i], sizeof(s->i2c[i]),
+                              TYPE_IMX_I2C);
     }
 
     /*
      * UART
      */
     for (i = 0; i < FSL_IMX7_NUM_UARTS; i++) {
-            object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_IMX_SERIAL);
-            qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus);
             snprintf(name, NAME_SIZE, "uart%d", i);
-            object_property_add_child(obj, name, OBJECT(&s->uart[i]),
-                                      &error_fatal);
+            sysbus_init_child_obj(obj, name, &s->uart[i], sizeof(s->uart[i]),
+                                  TYPE_IMX_SERIAL);
     }
 
     /*
      * Ethernet
      */
     for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
-            object_initialize(&s->eth[i], sizeof(s->eth[i]), TYPE_IMX_ENET);
-            qdev_set_parent_bus(DEVICE(&s->eth[i]), sysbus);
             snprintf(name, NAME_SIZE, "eth%d", i);
-            object_property_add_child(obj, name, OBJECT(&s->eth[i]),
-                                      &error_fatal);
+            sysbus_init_child_obj(obj, name, &s->eth[i], sizeof(s->eth[i]),
+                                  TYPE_IMX_ENET);
     }
 
     /*
      * SDHCI
      */
     for (i = 0; i < FSL_IMX7_NUM_USDHCS; i++) {
-            object_initialize(&s->usdhc[i], sizeof(s->usdhc[i]),
-                              TYPE_IMX_USDHC);
-            qdev_set_parent_bus(DEVICE(&s->usdhc[i]), sysbus);
             snprintf(name, NAME_SIZE, "usdhc%d", i);
-            object_property_add_child(obj, name, OBJECT(&s->usdhc[i]),
-                                      &error_fatal);
+            sysbus_init_child_obj(obj, name, &s->usdhc[i], sizeof(s->usdhc[i]),
+                              TYPE_IMX_USDHC);
     }
 
     /*
      * SNVS
      */
-    object_initialize(&s->snvs, sizeof(s->snvs), TYPE_IMX7_SNVS);
-    qdev_set_parent_bus(DEVICE(&s->snvs), sysbus);
-    object_property_add_child(obj, "snvs", OBJECT(&s->snvs), &error_fatal);
+    sysbus_init_child_obj(obj, "snvs", &s->snvs, sizeof(s->snvs),
+                          TYPE_IMX7_SNVS);
 
     /*
      * Watchdog
      */
     for (i = 0; i < FSL_IMX7_NUM_WDTS; i++) {
-            object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_IMX2_WDT);
-            qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus);
             snprintf(name, NAME_SIZE, "wdt%d", i);
-            object_property_add_child(obj, name, OBJECT(&s->wdt[i]),
-                                      &error_fatal);
+            sysbus_init_child_obj(obj, name, &s->wdt[i], sizeof(s->wdt[i]),
+                                  TYPE_IMX2_WDT);
     }
 
     /*
      * GPR
      */
-    object_initialize(&s->gpr, sizeof(s->gpr), TYPE_IMX7_GPR);
-    qdev_set_parent_bus(DEVICE(&s->gpr), sysbus);
-    object_property_add_child(obj, "gpr", OBJECT(&s->gpr), &error_fatal);
+    sysbus_init_child_obj(obj, "gpr", &s->gpr, sizeof(s->gpr), TYPE_IMX7_GPR);
 
-    object_initialize(&s->pcie, sizeof(s->pcie), TYPE_DESIGNWARE_PCIE_HOST);
-    qdev_set_parent_bus(DEVICE(&s->pcie), sysbus);
-    object_property_add_child(obj, "pcie", OBJECT(&s->pcie), &error_fatal);
+    sysbus_init_child_obj(obj, "pcie", &s->pcie, sizeof(s->pcie),
+                          TYPE_DESIGNWARE_PCIE_HOST);
 
     for (i = 0; i < FSL_IMX7_NUM_USBS; i++) {
-        object_initialize(&s->usb[i],
-                          sizeof(s->usb[i]), TYPE_CHIPIDEA);
-        qdev_set_parent_bus(DEVICE(&s->usb[i]), sysbus);
         snprintf(name, NAME_SIZE, "usb%d", i);
-        object_property_add_child(obj, name,
-                                  OBJECT(&s->usb[i]), &error_fatal);
+        sysbus_init_child_obj(obj, name, &s->usb[i], sizeof(s->usb[i]),
+                              TYPE_CHIPIDEA);
     }
 }
 
-- 
1.8.3.1

