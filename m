Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp428990wrq;
        Fri, 13 Jul 2018 01:33:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcrxx/XpqV/C0KgiqDDfYRf/nheCGU1ieQ5UGlAywrbZ7ad5NYkYEWZ46EomOZ3q6SnusDm
X-Received: by 2002:a0c:a90b:: with SMTP id y11-v6mr5996772qva.208.1531470789043;
        Fri, 13 Jul 2018 01:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470789; cv=none;
        d=google.com; s=arc-20160816;
        b=QpvJU6Lp1rB3UtSir9OK8MQzlYFgV4PaNYwHN4YMQXEuzGauFpwLxieokTBig3LkJe
         bHcF4zCgAW/KUPTPvT4QgMpNFadoZTQRoXdr78Nt74KLdlKcicA4S+M1LwW8txiV+pbH
         aLNy/3ASD1qsl8KUtEkFqTiqe3SbNJQhhTRxZ5+Pjg0ZGeEfBT7xSX+ST5E0q5R2xtKv
         jy4hp9CY/7AOHTvYTq+DQ8y9JKBgegQXtd1s9+nj5OXA605jJTFtcux+q/xRPoIfHhnm
         lxhIJQd8cGb2V33v4rNfdumHGEqLOY0OiA54ULEGJb5IgOS2HgspT/RroFe8J5CHsw5Q
         q8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8LYjPhMq6jHV+CPTGuWpgq0IKH6Gmc/mxOTTxUQvQZk=;
        b=042YiqLRMjEJmH9AR9b2AhFr4vmrhyJzkcyrAnosly8ZiAtgXtXtULShJGpyeE9SX6
         E1uo3Std3cz8NW3I06C32QaJddb8iwAFbTwQAnmArYyOKiA+cOXvRaFi+Si1Ecd8hB4v
         xU9RTvldv0AfJROEYw3Q0cld5ANgWrT5CwwHUuyTeYsASZqmElqkVPp2Zv5CYl69YM9j
         HWsO3ZutRcKl6P0ioJ2HBcjxD6op89+8DSSFu7wDZDeiNVkRcPzMsMDkodnGwwkESXZ+
         UbwyvuwBs/zUWsclbGvC8TVAeNqiLlVm07jp4iZ2sO7GkxCFOU+5cs+nSiBLlixmoQIU
         TjgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l16-v6si967059qvk.282.2018.07.13.01.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtVk-0005vc-GS
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:33:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtR8-0002av-Cj
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 04:28:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtR7-0004qO-74
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 04:28:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46346 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtR4-0004lv-Ai; Fri, 13 Jul 2018 04:28:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC3F3C12AA;
	Fri, 13 Jul 2018 08:28:17 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 987A62026D6B;
	Fri, 13 Jul 2018 08:28:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:38 +0200
Message-Id: <1531470464-21522-11-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 13 Jul 2018 08:28:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 13 Jul 2018 08:28:17 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v2 10/16] hw/arm/fsl-imx6: Fix introspection
 problems with the "fsl, imx6" device
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ihn1M/SFyRI

Running QEMU with valgrind indicates a problem here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'fsl,imx6'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==32417== Invalid read of size 8
==32417==    at 0x618A7A: qdev_print (qdev-monitor.c:686)
==32417==    by 0x618A7A: qbus_print (qdev-monitor.c:719)
==32417==    by 0x452B38: handle_hmp_command (monitor.c:3446)
[...]

Use the new sysbus_init_child_obj() and object_initialize_child() to make
sure that the objects are removed correctly when the parent gets destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx6.c | 56 ++++++++++++++++++++-----------------------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 4f51bd9..26ca61f 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -38,73 +38,57 @@ static void fsl_imx6_init(Object *obj)
     int i;
 
     for (i = 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
-        object_initialize(&s->cpu[i], sizeof(s->cpu[i]),
-                          "cortex-a9-" TYPE_ARM_CPU);
         snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_property_add_child(obj, name, OBJECT(&s->cpu[i]), NULL);
+        object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
+                                "cortex-a9-" TYPE_ARM_CPU, NULL);
     }
 
-    object_initialize(&s->a9mpcore, sizeof(s->a9mpcore), TYPE_A9MPCORE_PRIV);
-    qdev_set_parent_bus(DEVICE(&s->a9mpcore), sysbus_get_default());
-    object_property_add_child(obj, "a9mpcore", OBJECT(&s->a9mpcore), NULL);
+    sysbus_init_child_obj(obj, "a9mpcore", &s->a9mpcore, sizeof(s->a9mpcore),
+                          TYPE_A9MPCORE_PRIV);
 
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX6_CCM);
-    qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
-    object_property_add_child(obj, "ccm", OBJECT(&s->ccm), NULL);
+    sysbus_init_child_obj(obj, "ccm", &s->ccm, sizeof(s->ccm), TYPE_IMX6_CCM);
 
-    object_initialize(&s->src, sizeof(s->src), TYPE_IMX6_SRC);
-    qdev_set_parent_bus(DEVICE(&s->src), sysbus_get_default());
-    object_property_add_child(obj, "src", OBJECT(&s->src), NULL);
+    sysbus_init_child_obj(obj, "src", &s->src, sizeof(s->src), TYPE_IMX6_SRC);
 
     for (i = 0; i < FSL_IMX6_NUM_UARTS; i++) {
-        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_IMX_SERIAL);
-        qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "uart%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->uart[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->uart[i], sizeof(s->uart[i]),
+                              TYPE_IMX_SERIAL);
     }
 
-    object_initialize(&s->gpt, sizeof(s->gpt), TYPE_IMX6_GPT);
-    qdev_set_parent_bus(DEVICE(&s->gpt), sysbus_get_default());
-    object_property_add_child(obj, "gpt", OBJECT(&s->gpt), NULL);
+    sysbus_init_child_obj(obj, "gpt", &s->gpt, sizeof(s->gpt), TYPE_IMX6_GPT);
 
     for (i = 0; i < FSL_IMX6_NUM_EPITS; i++) {
-        object_initialize(&s->epit[i], sizeof(s->epit[i]), TYPE_IMX_EPIT);
-        qdev_set_parent_bus(DEVICE(&s->epit[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "epit%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->epit[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->epit[i], sizeof(s->epit[i]),
+                              TYPE_IMX_EPIT);
     }
 
     for (i = 0; i < FSL_IMX6_NUM_I2CS; i++) {
-        object_initialize(&s->i2c[i], sizeof(s->i2c[i]), TYPE_IMX_I2C);
-        qdev_set_parent_bus(DEVICE(&s->i2c[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "i2c%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->i2c[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->i2c[i], sizeof(s->i2c[i]),
+                              TYPE_IMX_I2C);
     }
 
     for (i = 0; i < FSL_IMX6_NUM_GPIOS; i++) {
-        object_initialize(&s->gpio[i], sizeof(s->gpio[i]), TYPE_IMX_GPIO);
-        qdev_set_parent_bus(DEVICE(&s->gpio[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "gpio%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->gpio[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->gpio[i], sizeof(s->gpio[i]),
+                              TYPE_IMX_GPIO);
     }
 
     for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
-        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_IMX_USDHC);
-        qdev_set_parent_bus(DEVICE(&s->esdhc[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "sdhc%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->esdhc[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->esdhc[i], sizeof(s->esdhc[i]),
+                              TYPE_IMX_USDHC);
     }
 
     for (i = 0; i < FSL_IMX6_NUM_ECSPIS; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]), TYPE_IMX_SPI);
-        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "spi%d", i + 1);
-        object_property_add_child(obj, name, OBJECT(&s->spi[i]), NULL);
+        sysbus_init_child_obj(obj, name, &s->spi[i], sizeof(s->spi[i]),
+                              TYPE_IMX_SPI);
     }
 
-    object_initialize(&s->eth, sizeof(s->eth), TYPE_IMX_ENET);
-    qdev_set_parent_bus(DEVICE(&s->eth), sysbus_get_default());
-    object_property_add_child(obj, "eth", OBJECT(&s->eth), NULL);
+    sysbus_init_child_obj(obj, "eth", &s->eth, sizeof(s->eth), TYPE_IMX_ENET);
 }
 
 static void fsl_imx6_realize(DeviceState *dev, Error **errp)
-- 
1.8.3.1

