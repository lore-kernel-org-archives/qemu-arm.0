Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1487825wru;
        Mon, 16 Jul 2018 06:10:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfJn88HNLKDhC3MTJ758amQUxZp1w05B3Zl/A7sdgYRF20U1cPPXtjM55vhM0Ucbum9VOet
X-Received: by 2002:a37:2b28:: with SMTP id r40-v6mr14380566qkh.286.1531746629934;
        Mon, 16 Jul 2018 06:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746629; cv=none;
        d=google.com; s=arc-20160816;
        b=q8wtAZ00IUBNRGOW2DGSrdJLqQlntul8x0mzGyT2Y8pNiVWoQ7uNY/5TmWkLV6xV3T
         h5ubWo3b0/1gXk59ARh+8R5TIApx40ji8AlRVIZpbc5+ve4pKWyw4t1KoTAn721fOdC9
         ROgj5j1/51oYkUiD1Yb+bCVHeVfHzFEwTxKUl95wLGzihyQ7ND2kVvGMwBjFt0LhOIfS
         4Av9ZCGMs8IUZoiyRIdU0cKnONMdzPqhrsJDw+0nTHQLauT+t3F2gnIX2qPxzQAhkdzq
         RLXcwEYK+7sy74aIE7d/ZUAcweRXJ0DdpimYJG4Tr5brvxZO/EfvFR6y5VWYqAXRC+N6
         G1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=G/LDMNqtMRVJEhnbG9sTfSwXgpfJusFmn3+uSH44K+s=;
        b=unx4keWwtEa70hJARFuqXul62GO4MLbSSHoaT62vfYPlbwmtlk73aiCXsRhnYyFs54
         u8AeGSh+q9DxLVTE5rPad3OY2aUUwevOEMjrIu6OUmXrhcRQvAmWQAu5ZAE2JxlHKEZa
         4GkqfciQ/0VHyfNwkhnYafzUV4pWG8CbjfGhtGtrihUHQmaUX+z94kSxCcowou/vv7uD
         DouM72D3yWwrtWmXTKPIjW8BswG6yD51aB9K7NpGLyJ1AkccJItc9cnIeDxNPLZgSk6J
         D9l/ESEvFLFkyU8Dq1Uurr3FrDVz3IYGHp6wES67PwcTJnPNT3ICTwljP1xDm1NLcwy2
         k38Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u124-v6si4324129qkb.25.2018.07.16.06.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3Gn-0001Je-7l
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:10:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36X-0001DU-MZ
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36W-00026Z-Aj
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48584 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36W-00026T-4f; Mon, 16 Jul 2018 08:59:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9761081A4EBC;
	Mon, 16 Jul 2018 12:59:51 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03FA31C589;
	Mon, 16 Jul 2018 12:59:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:25 +0200
Message-Id: <1531745974-17187-9-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 16 Jul 2018 12:59:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 16 Jul 2018 12:59:51 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 08/17] hw/arm/fsl-imx6: Fix introspection
 problems with the "fsl, imx6" device
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
X-TUID: WMkbR9Sbz98e

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx6.c | 56 ++++++++++++++++++++-----------------------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 4f51bd9..7b7b97f 100644
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
+                                "cortex-a9-" TYPE_ARM_CPU, &error_abort, NULL);
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

