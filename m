Received: by 10.223.150.237 with SMTP id u100csp2802991wrb;
        Mon, 6 Nov 2017 08:08:10 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RgWRZSCFi8quT1BU9gpx9Z2s3Oq3D+xX5QBndJJCMGGvr4KztimRuJEJJEGKMLPA4qGr5w
X-Received: by 10.13.226.196 with SMTP id l187mr10384778ywe.103.1509984490351;
        Mon, 06 Nov 2017 08:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984490; cv=none;
        d=google.com; s=arc-20160816;
        b=hpHHRQLx6gAr/HsUEiFAivhrDVzVJ/qbKr7SxhRfTvmZsyzRU2cx8saMth00Wx5Bnr
         F13trXuWOMSs8kmU/3H1u9yUu/S5bA9Z8PqukPRrmJGC8h7lDCFG2roIgq4o2JUFaalQ
         v6wiCNGq7F0ccH1X2/AwU37LXgxqsEcpqB/pxadJ+JxLwvZ3kcpuMoZZloE/uESSdPjy
         a+QH/YmESCzZ6O4Vh9xljYsFsfcbAwWGJi1+mo4qgBt41ZQv/zOJ9MyE/juVUrKcuB0c
         O8NyhDiITkCBK49yodThIVi2FGkNaXzA1WcBmY3oEwA6VvTYHMaafhBKTyxRp05VGjka
         7ASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Nrk2FSIJl2M/oyWaLQFUmbTlOtytyKN9K+uqhAHgPoM=;
        b=Pcv7iraH7Q0x7QecifMIIauaxXc0A8WI8SN7bN12PEmWlsX6A0ObUj0hX21ntTBbs5
         HiofPxCBo93K3beEVaU/BKyXCivBrX30TIs9KqLly2MGoo/fIThf8t7Wd96Viu/678/S
         szZr9JJiQe6Qtsv6TFJZUe0JCN94+KSS3rMLJ5cInGHhrkDuZGKpgrhHu7lAM9nOHHlA
         Sz4B6NmKpmXoM9GH5m4f/RmKN2xWoUtznuE1BsVbQRTDC1Fl7QcSVZ4QiStGyRX+doOZ
         VvTbJpQNhswrAce6UN0YAzg5grMzEfAG8SjCv67S+jf4bt06AcRJ5Cx8SNh3/Oulq5uS
         GeYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sFXgqdpm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d63si2727113ybd.6.2017.11.06.08.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:08:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sFXgqdpm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjwX-00074u-H5
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:08:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje6-0007YI-Js
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje3-0000l7-1v
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:06 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:44215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBje2-0000kX-MU; Mon, 06 Nov 2017 10:49:02 -0500
Received: by mail-pg0-x241.google.com with SMTP id j3so8526026pga.1;
	Mon, 06 Nov 2017 07:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Nrk2FSIJl2M/oyWaLQFUmbTlOtytyKN9K+uqhAHgPoM=;
	b=sFXgqdpmPb1myJFjdf8mS/8rIYxvG6oZ7YjgOk3ThjC9A2j+UspRRwLEtoN3rXNn90
	kT/iL+5k8LaLxCs0gBTr/2pF7Llv3zWLAkQVePRUn8WggrZvhM3NxIcBws5d3WdT/DE2
	iF6eM9dG8u2m6xKIYYbR/Q8IiKhKcGtXXY94avijMgbT9Hpa/xmxAqwHRbgdUKGjY7p1
	Km0PMx1GpXmWLrxw40vCIS8ei67tcpksFiZORaOWGzOT3CUNPkXBIS9t34oX2GbJxyi5
	tH9mjVdFwpOyCU/1FEaOtmY+lelt4wFdicsUgXwdTW97+d9Gbnqjqtz4CHPX8Wgcgo23
	7ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Nrk2FSIJl2M/oyWaLQFUmbTlOtytyKN9K+uqhAHgPoM=;
	b=nuhLRFl6xmxQ4uqgNU7pMNZ3sIejY9OPUaji3KM92Htu7GHhBjVE3+Y4kUP5QdqgPb
	OHHgQ/D/AhtbCj3/A/IXbtGnFHPgoTdPGUEZrCDFpOhFpdKe4j8GPkdP8ZGme+C54c4J
	QUYwzZghkpqf5RiL7b4dmLSs1E8XXExBw1TOubLJafXYlWw6g4wxW7DJyo6uETkc6oXv
	nP89x2u2+yF/N6h5K+Qi62nW14jNaKS+mtxHGTKd73Ua9UoQtL4vSmQYmFoZHgUBHX/O
	WwyWMFV+9O0c5YdlIcIQxq9HXlIebZXCNz09CAf0zqIIzGKiL+WNE+7eK6Lut9AHmVMq
	fpVw==
X-Gm-Message-State: AMCzsaXbyDAGi2OOy1r2rDgjhG70TB3NRh8cO82YPMi4LC74diqGkmu7
	Z4V3pKBlPX/eEDml6h3Ca1FuZMXlvuc=
X-Received: by 10.98.72.151 with SMTP id q23mr17003423pfi.169.1509983341331;
	Mon, 06 Nov 2017 07:49:01 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.49.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:49:00 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:12 -0800
Message-Id: <20171106154813.19936-30-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v3 29/30] i.MX: Add i.MX7 SOC implementation.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SD4w8tqOYwnV

The following interfaces are partially or fully emulated:

    * up to 2 Cortex A9 cores (SMP works with PSCI)
    * A7 MPCORE (identical to A15 MPCORE)
    * 4 GPTs modules
    * 7 GPIO controllers
    * 2 IOMUXC controllers
    * 1 CCM module
    * 1 SVNS module
    * 1 SRC module
    * 1 GPCv2 controller
    * 4 eCSPI controllers
    * 4 I2C controllers
    * 7 i.MX UART controllers
    * 2 FlexCAN controllers
    * 2 Ethernet controllers (FEC)
    * 3 SD controllers (USDHC)
    * 4 WDT modules
    * 1 SDMA module
    * 1 GPR module
    * 2 USBMISC modules
    * 2 ADC modules
    * 1 PCIe controller

Tested to boot and work with upstream Linux (4.13+) guest.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   2 +
 hw/arm/fsl-imx7.c               | 646 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx7.h       | 233 +++++++++++++++
 4 files changed, 882 insertions(+)
 create mode 100644 hw/arm/fsl-imx7.c
 create mode 100644 include/hw/arm/fsl-imx7.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 225ebbd90a..a2f318d6dd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -118,6 +118,7 @@ CONFIG_ALLWINNER_A10=y
 CONFIG_FSL_IMX6=y
 CONFIG_FSL_IMX31=y
 CONFIG_FSL_IMX25=y
+CONFIG_FSL_IMX7=y
 
 CONFIG_IMX_I2C=y
 
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 459a3fa6be..f379ddc74b 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,3 +19,5 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
+obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o
+
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
new file mode 100644
index 0000000000..da4b3e395e
--- /dev/null
+++ b/hw/arm/fsl-imx7.c
@@ -0,0 +1,646 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 SoC definitions
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * Based on hw/arm/fsl-imx6.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/arm/fsl-imx7.h"
+#include "sysemu/sysemu.h"
+#include "qemu/error-report.h"
+
+#define NAME_SIZE 20
+
+static void fsl_imx7_init(Object *obj)
+{
+    BusState *sysbus = sysbus_get_default();
+    FslIMX7State *s = FSL_IMX7(obj);
+    char name[NAME_SIZE];
+    int i;
+
+    if (smp_cpus > FSL_IMX7_NUM_CPUS) {
+        error_report("%s: Only %d CPUs are supported (%d requested)",
+                     TYPE_FSL_IMX7, FSL_IMX7_NUM_CPUS, smp_cpus);
+        exit(1);
+    }
+
+    for (i = 0; i < smp_cpus; i++) {
+        object_initialize(&s->cpu[i], sizeof(s->cpu[i]),
+                          "cortex-a7-" TYPE_ARM_CPU);
+        snprintf(name, NAME_SIZE, "cpu%d", i);
+        object_property_add_child(obj, name, OBJECT(&s->cpu[i]),
+                                  &error_fatal);
+    }
+
+    /*
+     * A7MPCORE
+     */
+    object_initialize(&s->a7mpcore, sizeof(s->a7mpcore), TYPE_A15MPCORE_PRIV);
+    qdev_set_parent_bus(DEVICE(&s->a7mpcore), sysbus);
+    object_property_add_child(obj, "a7mpcore",
+                              OBJECT(&s->a7mpcore), &error_fatal);
+
+    object_initialize(&s->dap, sizeof(s->dap), TYPE_A7MPCORE_DAP);
+    qdev_set_parent_bus(DEVICE(&s->dap), sysbus);
+    object_property_add_child(obj, "a7mpcore-dap",
+                              OBJECT(&s->dap), &error_fatal);
+
+    /*
+     * GPIOs 1 to 7
+     */
+    for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
+        object_initialize(&s->gpio[i], sizeof(s->gpio[i]),
+                          TYPE_IMX_GPIO);
+        qdev_set_parent_bus(DEVICE(&s->gpio[i]), sysbus);
+        snprintf(name, NAME_SIZE, "gpio%d", i);
+        object_property_add_child(obj, name,
+                                  OBJECT(&s->gpio[i]), &error_fatal);
+    }
+
+    /*
+     * IOMUXC and IOMUXC_LPSR
+     */
+    for (i = 0; i < FSL_IMX7_NUM_IOMUXCS; i++) {
+        object_initialize(&s->iomuxc[i], sizeof(s->iomuxc[i]),
+                          TYPE_IMX7_IOMUXC);
+        qdev_set_parent_bus(DEVICE(&s->iomuxc[i]), sysbus);
+        snprintf(name, NAME_SIZE, "iomuxc%d", i);
+        object_property_add_child(obj, name,
+                                  OBJECT(&s->iomuxc[i]), &error_fatal);
+    }
+
+    /*
+     * GPT1, 2, 3, 4
+     */
+    for (i = 0; i < FSL_IMX7_NUM_GPTS; i++) {
+        object_initialize(&s->gpt[i], sizeof(s->gpt[i]), TYPE_IMX7_GPT);
+        qdev_set_parent_bus(DEVICE(&s->gpt[i]), sysbus);
+        snprintf(name, NAME_SIZE, "gpt%d", i);
+        object_property_add_child(obj, name, OBJECT(&s->gpt[i]),
+                                  &error_fatal);
+    }
+
+    /*
+     * CCM
+     */
+    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX7_CCM);
+    qdev_set_parent_bus(DEVICE(&s->ccm), sysbus);
+    object_property_add_child(obj, "ccm", OBJECT(&s->ccm), &error_fatal);
+
+    /*
+     * GPCv2
+     */
+    object_initialize(&s->gpcv2, sizeof(s->gpcv2), TYPE_IMX_GPCV2);
+    qdev_set_parent_bus(DEVICE(&s->gpcv2), sysbus);
+    object_property_add_child(obj, "gpcv2", OBJECT(&s->gpcv2), &error_fatal);
+
+    for (i = 0; i < FSL_IMX7_NUM_ECSPIS; i++) {
+        object_initialize(&s->spi[i], sizeof(s->spi[i]), TYPE_IMX_SPI);
+        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+        snprintf(name, NAME_SIZE, "spi%d", i + 1);
+        object_property_add_child(obj, name, OBJECT(&s->spi[i]), NULL);
+    }
+
+
+    for (i = 0; i < FSL_IMX7_NUM_I2CS; i++) {
+        object_initialize(&s->i2c[i], sizeof(s->i2c[i]), TYPE_IMX_I2C);
+        qdev_set_parent_bus(DEVICE(&s->i2c[i]), sysbus_get_default());
+        snprintf(name, NAME_SIZE, "i2c%d", i + 1);
+        object_property_add_child(obj, name, OBJECT(&s->i2c[i]), NULL);
+    }
+
+    /*
+     * UART
+     */
+    for (i = 0; i < FSL_IMX7_NUM_UARTS; i++) {
+            object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_IMX_SERIAL);
+            qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus);
+            snprintf(name, NAME_SIZE, "uart%d", i);
+            object_property_add_child(obj, name, OBJECT(&s->uart[i]),
+                                      &error_fatal);
+    }
+
+    /*
+     * FlexCAN1 and 2
+     */
+
+    for (i = 0; i < FSL_IMX7_NUM_FLEXCANS; i++) {
+            object_initialize(&s->flexcan[i],
+                              sizeof(s->flexcan[i]), TYPE_IMX_FLEXCAN);
+            qdev_set_parent_bus(DEVICE(&s->flexcan[i]), sysbus);
+            snprintf(name, NAME_SIZE, "flexcan%d", i);
+            object_property_add_child(obj, name, OBJECT(&s->flexcan[i]),
+                                      &error_fatal);
+    }
+
+    /*
+     * Ethernet
+     */
+    for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
+            object_initialize(&s->eth[i], sizeof(s->eth[i]), TYPE_IMX_ENET);
+            qdev_set_parent_bus(DEVICE(&s->eth[i]), sysbus);
+            snprintf(name, NAME_SIZE, "eth%d", i);
+            object_property_add_child(obj, name, OBJECT(&s->eth[i]),
+                                      &error_fatal);
+    }
+
+    /*
+     * SDHCI
+     */
+    for (i = 0; i < FSL_IMX7_NUM_USDHCS; i++) {
+            object_initialize(&s->usdhc[i], sizeof(s->usdhc[i]),
+                              TYPE_IMX_USDHC);
+            qdev_set_parent_bus(DEVICE(&s->usdhc[i]), sysbus);
+            snprintf(name, NAME_SIZE, "usdhc%d", i);
+            object_property_add_child(obj, name, OBJECT(&s->usdhc[i]),
+                                      &error_fatal);
+    }
+
+    /*
+     * SNVS
+     */
+    object_initialize(&s->snvs, sizeof(s->snvs), TYPE_IMX7_SNVS);
+    qdev_set_parent_bus(DEVICE(&s->snvs), sysbus);
+    object_property_add_child(obj, "snvs", OBJECT(&s->snvs), &error_fatal);
+
+    /*
+     * SRC
+     */
+    object_initialize(&s->src, sizeof(s->src), TYPE_IMX7_SRC);
+    qdev_set_parent_bus(DEVICE(&s->src), sysbus);
+    object_property_add_child(obj, "src", OBJECT(&s->src), &error_fatal);
+
+    /*
+     * Watchdog
+     */
+    for (i = 0; i < FSL_IMX7_NUM_WDTS; i++) {
+            object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_IMX2_WDT);
+            qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus);
+            snprintf(name, NAME_SIZE, "wdt%d", i);
+            object_property_add_child(obj, name, OBJECT(&s->wdt[i]),
+                                      &error_fatal);
+    }
+
+    /*
+     * SDMA
+     */
+    object_initialize(&s->sdma, sizeof(s->sdma), TYPE_IMX_SDMA);
+    qdev_set_parent_bus(DEVICE(&s->sdma), sysbus);
+    object_property_add_child(obj, "sdma", OBJECT(&s->sdma), &error_fatal);
+
+    /*
+     * GPR
+     */
+    object_initialize(&s->gpr, sizeof(s->gpr), TYPE_IMX7_GPR);
+    qdev_set_parent_bus(DEVICE(&s->gpr), sysbus);
+    object_property_add_child(obj, "gpr", OBJECT(&s->gpr), &error_fatal);
+
+    object_initialize(&s->pcie, sizeof(s->pcie), TYPE_DESIGNWARE_PCIE_HOST);
+    qdev_set_parent_bus(DEVICE(&s->pcie), sysbus);
+    object_property_add_child(obj, "pcie", OBJECT(&s->pcie), &error_fatal);
+
+    for (i = 0; i < FSL_IMX7_NUM_USBS; i++) {
+        object_initialize(&s->usb[i],
+                          sizeof(s->usb[i]), TYPE_CHIPIDEA);
+        qdev_set_parent_bus(DEVICE(&s->usb[i]), sysbus);
+        snprintf(name, NAME_SIZE, "usb%d", i);
+        object_property_add_child(obj, name,
+                                  OBJECT(&s->usb[i]), &error_fatal);
+
+        object_initialize(&s->usbmisc[i],
+                          sizeof(s->usbmisc[i]), TYPE_IMX_USBMISC);
+        qdev_set_parent_bus(DEVICE(&s->usbmisc[i]), sysbus);
+        snprintf(name, NAME_SIZE, "usbmisc%d", i);
+        object_property_add_child(obj, name,
+                                  OBJECT(&s->usbmisc[i]), &error_fatal);
+    }
+
+    for (i = 0; i < FSL_IMX7_NUM_ADCS; i++) {
+        object_initialize(&s->adc[i], sizeof(s->adc[i]), TYPE_IMX7_ADC);
+        qdev_set_parent_bus(DEVICE(&s->adc[i]), sysbus);
+        snprintf(name, NAME_SIZE, "adc%d", i);
+        object_property_add_child(obj, name,
+                                  OBJECT(&s->adc[i]), &error_fatal);
+    }
+
+    /*
+     * LCD
+     */
+    object_initialize(&s->lcdif, sizeof(s->lcdif), TYPE_IMX_LCDIF);
+    qdev_set_parent_bus(DEVICE(&s->lcdif), sysbus);
+    object_property_add_child(obj, "lcdif", OBJECT(&s->lcdif), &error_fatal);
+
+}
+
+static void fsl_imx7_realize(DeviceState *dev, Error **errp)
+{
+    FslIMX7State *s = FSL_IMX7(dev);
+    Object *o;
+    int i;
+    qemu_irq irq;
+
+    for (i = 0; i < smp_cpus; i++) {
+        o = OBJECT(&s->cpu[i]);
+
+        object_property_set_int(o, QEMU_PSCI_CONDUIT_SMC,
+                                "psci-conduit", &error_abort);
+
+        /* On uniprocessor, the CBAR is set to 0 */
+        if (smp_cpus > 1) {
+            object_property_set_int(o, FSL_IMX7_A7MPCORE_ADDR,
+                                    "reset-cbar", &error_abort);
+        }
+
+        if (i) {
+            /* Secondary CPUs start in PSCI powered-down state */
+            object_property_set_bool(o, true,
+                                     "start-powered-off", &error_abort);
+        }
+
+        object_property_set_bool(o, true, "realized", &error_abort);
+    }
+
+    /*
+     * A7MPCORE
+     */
+    object_property_set_int(OBJECT(&s->a7mpcore), smp_cpus, "num-cpu",
+                            &error_abort);
+    object_property_set_int(OBJECT(&s->a7mpcore),
+                            FSL_IMX7_MAX_IRQ + GIC_INTERNAL,
+                            "num-irq", &error_abort);
+
+    object_property_set_bool(OBJECT(&s->a7mpcore), true, "realized",
+                             &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX7_A7MPCORE_ADDR);
+
+    for (i = 0; i < smp_cpus; i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
+        DeviceState  *d   = DEVICE(qemu_get_cpu(i));
+
+        irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
+        sysbus_connect_irq(sbd, i, irq);
+        irq = qdev_get_gpio_in(d, ARM_CPU_FIQ);
+        sysbus_connect_irq(sbd, i + smp_cpus, irq);
+    }
+
+    object_property_set_bool(OBJECT(&s->dap), true, "realized",
+                             &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dap), 0, FSL_IMX7_A7MPCORE_DAP_ADDR);
+
+    /*
+     * GPT1, 2, 3, 4
+     */
+    for (i = 0; i < FSL_IMX7_NUM_GPTS; i++) {
+        static const hwaddr FSL_IMX7_GPTn_ADDR[FSL_IMX7_NUM_GPTS] = {
+            FSL_IMX7_GPT1_ADDR,
+            FSL_IMX7_GPT2_ADDR,
+            FSL_IMX7_GPT3_ADDR,
+            FSL_IMX7_GPT4_ADDR,
+        };
+
+        s->gpt[i].ccm = IMX_CCM(&s->ccm);
+        object_property_set_bool(OBJECT(&s->gpt[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt[i]), 0, FSL_IMX7_GPTn_ADDR[i]);
+    }
+
+    for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
+        static const hwaddr FSL_IMX7_GPIOn_ADDR[FSL_IMX7_NUM_GPIOS] = {
+            FSL_IMX7_GPIO1_ADDR,
+            FSL_IMX7_GPIO2_ADDR,
+            FSL_IMX7_GPIO3_ADDR,
+            FSL_IMX7_GPIO4_ADDR,
+            FSL_IMX7_GPIO5_ADDR,
+            FSL_IMX7_GPIO6_ADDR,
+            FSL_IMX7_GPIO7_ADDR,
+        };
+
+        object_property_set_bool(OBJECT(&s->gpio[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, FSL_IMX7_GPIOn_ADDR[i]);
+    }
+
+    /*
+     * IOMUXC and IOMUXC_LPSR
+     */
+    for (i = 0; i < FSL_IMX7_NUM_IOMUXCS; i++) {
+        static const hwaddr FSL_IMX7_IOMUXCn_ADDR[FSL_IMX7_NUM_IOMUXCS] = {
+            FSL_IMX7_IOMUXC_ADDR,
+            FSL_IMX7_IOMUXC_LPSR_ADDR,
+        };
+
+        object_property_set_bool(OBJECT(&s->iomuxc[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->iomuxc[i]), 0,
+                        FSL_IMX7_IOMUXCn_ADDR[i]);
+    }
+
+    /*
+     * CCM
+     */
+    object_property_set_bool(OBJECT(&s->ccm), true, "realized", &error_abort);
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, FSL_IMX7_CCM_ADDR);
+
+    /*
+     * GPCv2
+     */
+    object_property_set_bool(OBJECT(&s->gpcv2), true,
+                             "realized", &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpcv2), 0, FSL_IMX7_GPC_ADDR);
+
+    /* Initialize all ECSPI */
+    for (i = 0; i < FSL_IMX7_NUM_ECSPIS; i++) {
+        static const hwaddr FSL_IMX7_SPIn_ADDR[FSL_IMX7_NUM_ECSPIS] = {
+            FSL_IMX7_ECSPI1_ADDR,
+            FSL_IMX7_ECSPI2_ADDR,
+            FSL_IMX7_ECSPI3_ADDR,
+            FSL_IMX7_ECSPI4_ADDR,
+        };
+
+        static const hwaddr FSL_IMX7_SPIn_IRQ[FSL_IMX7_NUM_ECSPIS] = {
+            FSL_IMX7_ECSPI1_IRQ,
+            FSL_IMX7_ECSPI2_IRQ,
+            FSL_IMX7_ECSPI3_IRQ,
+            FSL_IMX7_ECSPI4_IRQ,
+        };
+
+        /* Initialize the SPI */
+        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                        FSL_IMX7_SPIn_ADDR[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_SPIn_IRQ[i]));
+    }
+
+    for (i = 0; i < FSL_IMX7_NUM_I2CS; i++) {
+        static const hwaddr FSL_IMX7_I2Cn_ADDR[FSL_IMX7_NUM_I2CS] = {
+            FSL_IMX7_I2C1_ADDR,
+            FSL_IMX7_I2C2_ADDR,
+            FSL_IMX7_I2C3_ADDR,
+            FSL_IMX7_I2C4_ADDR,
+        };
+
+        static const hwaddr FSL_IMX7_I2Cn_IRQ[FSL_IMX7_NUM_I2CS] = {
+            FSL_IMX7_I2C1_IRQ,
+            FSL_IMX7_I2C2_IRQ,
+            FSL_IMX7_I2C3_IRQ,
+            FSL_IMX7_I2C4_IRQ,
+        };
+
+        object_property_set_bool(OBJECT(&s->i2c[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, FSL_IMX7_I2Cn_ADDR[i]);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_I2Cn_IRQ[i]));
+    }
+
+    /*
+     * UART
+     */
+    for (i = 0; i < FSL_IMX7_NUM_UARTS; i++) {
+        static const hwaddr FSL_IMX7_UARTn_ADDR[FSL_IMX7_NUM_UARTS] = {
+            FSL_IMX7_UART1_ADDR,
+            FSL_IMX7_UART2_ADDR,
+            FSL_IMX7_UART3_ADDR,
+            FSL_IMX7_UART4_ADDR,
+            FSL_IMX7_UART5_ADDR,
+            FSL_IMX7_UART6_ADDR,
+            FSL_IMX7_UART7_ADDR,
+        };
+
+        static const int FSL_IMX7_UARTn_IRQ[FSL_IMX7_NUM_UARTS] = {
+            FSL_IMX7_UART1_IRQ,
+            FSL_IMX7_UART2_IRQ,
+            FSL_IMX7_UART3_IRQ,
+            FSL_IMX7_UART4_IRQ,
+            FSL_IMX7_UART5_IRQ,
+            FSL_IMX7_UART6_IRQ,
+            FSL_IMX7_UART7_IRQ,
+        };
+
+
+        if (i < MAX_SERIAL_PORTS) {
+            qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hds[i]);
+        }
+
+        object_property_set_bool(OBJECT(&s->uart[i]), true, "realized",
+                                 &error_abort);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, FSL_IMX7_UARTn_ADDR[i]);
+
+        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_UARTn_IRQ[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0, irq);
+    }
+
+    for (i = 0; i < FSL_IMX7_NUM_FLEXCANS; i++) {
+        static const hwaddr FSL_IMX7_FLEXCANn_ADDR[FSL_IMX7_NUM_FLEXCANS] = {
+            FSL_IMX7_FLEXCAN1_ADDR,
+            FSL_IMX7_FLEXCAN2_ADDR,
+        };
+
+        object_property_set_bool(OBJECT(&s->flexcan[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->flexcan[i]), 0,
+                        FSL_IMX7_FLEXCANn_ADDR[i]);
+    }
+
+    /*
+     * Ethernet
+     */
+    for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
+        static const hwaddr FSL_IMX7_ENETn_ADDR[FSL_IMX7_NUM_ETHS] = {
+            FSL_IMX7_ENET1_ADDR,
+            FSL_IMX7_ENET2_ADDR,
+        };
+
+        object_property_set_uint(OBJECT(&s->eth[i]), FSL_IMX7_ETH_NUM_TX_RINGS,
+                                 "tx-ring-num", &error_abort);
+        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
+        object_property_set_bool(OBJECT(&s->eth[i]), true, "realized",
+                                 &error_abort);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0, FSL_IMX7_ENETn_ADDR[i]);
+
+        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_ENET_IRQ(i, 0));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 0, irq);
+        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_ENET_IRQ(i, 3));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 1, irq);
+    }
+
+    /*
+     * USDHC
+     */
+    for (i = 0; i < FSL_IMX7_NUM_USDHCS; i++) {
+        static const hwaddr FSL_IMX7_USDHCn_ADDR[FSL_IMX7_NUM_USDHCS] = {
+            FSL_IMX7_USDHC1_ADDR,
+            FSL_IMX7_USDHC2_ADDR,
+            FSL_IMX7_USDHC3_ADDR,
+        };
+
+        static const int FSL_IMX7_USDHCn_IRQ[FSL_IMX7_NUM_USDHCS] = {
+            FSL_IMX7_USDHC1_IRQ,
+            FSL_IMX7_USDHC2_IRQ,
+            FSL_IMX7_USDHC3_IRQ,
+        };
+
+        object_property_set_bool(OBJECT(&s->usdhc[i]), true, "realized",
+                                 &error_abort);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
+                        FSL_IMX7_USDHCn_ADDR[i]);
+
+        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_USDHCn_IRQ[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usdhc[i]), 0, irq);
+    }
+
+    /*
+     * SNVS
+     */
+    object_property_set_bool(OBJECT(&s->snvs), true, "realized", &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->snvs), 0, FSL_IMX7_SNVS_ADDR);
+
+    /*
+     * SRC
+     */
+    object_property_set_bool(OBJECT(&s->src), true, "realized", &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->src), 0, FSL_IMX7_SRC_ADDR);
+
+    /*
+     * Watchdog
+     */
+    for (i = 0; i < FSL_IMX7_NUM_WDTS; i++) {
+        static const hwaddr FSL_IMX7_WDOGn_ADDR[FSL_IMX7_NUM_WDTS] = {
+            FSL_IMX7_WDOG1_ADDR,
+            FSL_IMX7_WDOG2_ADDR,
+            FSL_IMX7_WDOG3_ADDR,
+            FSL_IMX7_WDOG4_ADDR,
+        };
+
+        object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",
+                                 &error_abort);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX7_WDOGn_ADDR[i]);
+    }
+
+    /*
+     * SDMA
+     */
+    object_property_set_bool(OBJECT(&s->sdma), true, "realized", &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdma), 0, FSL_IMX7_SDMA_ADDR);
+
+    object_property_set_bool(OBJECT(&s->gpr), true, "realized",
+                             &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpr), 0, FSL_IMX7_GPR_ADDR);
+
+    object_property_set_bool(OBJECT(&s->pcie), true,
+                             "realized", &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pcie), 0, FSL_IMX7_PCIE_REG_ADDR);
+
+    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTA_IRQ);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 0, irq);
+    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTB_IRQ);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 1, irq);
+    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTC_IRQ);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 2, irq);
+    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTD_IRQ);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 3, irq);
+
+
+    for (i = 0; i < FSL_IMX7_NUM_USBS; i++) {
+        static const hwaddr FSL_IMX7_USBMISCn_ADDR[FSL_IMX7_NUM_USBS] = {
+            FSL_IMX7_USBMISC1_ADDR,
+            FSL_IMX7_USBMISC2_ADDR,
+            FSL_IMX7_USBMISC3_ADDR,
+        };
+
+        static const hwaddr FSL_IMX7_USBn_ADDR[FSL_IMX7_NUM_USBS] = {
+            FSL_IMX7_USB1_ADDR,
+            FSL_IMX7_USB2_ADDR,
+            FSL_IMX7_USB3_ADDR,
+        };
+
+        static const hwaddr FSL_IMX7_USBn_IRQ[FSL_IMX7_NUM_USBS] = {
+            FSL_IMX7_USB1_IRQ,
+            FSL_IMX7_USB2_IRQ,
+            FSL_IMX7_USB3_IRQ,
+        };
+
+        object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
+                        FSL_IMX7_USBn_ADDR[i]);
+
+        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_USBn_IRQ[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0, irq);
+
+        object_property_set_bool(OBJECT(&s->usbmisc[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usbmisc[i]), 0,
+                        FSL_IMX7_USBMISCn_ADDR[i]);
+    }
+
+    for (i = 0; i < FSL_IMX7_NUM_ADCS; i++) {
+        static const hwaddr FSL_IMX7_ADCn_ADDR[FSL_IMX7_NUM_ADCS] = {
+            FSL_IMX7_ADC1_ADDR,
+            FSL_IMX7_ADC2_ADDR,
+        };
+
+        object_property_set_bool(OBJECT(&s->adc[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc[i]), 0,
+                        FSL_IMX7_ADCn_ADDR[i]);
+    }
+
+    /*
+     * LCD
+     */
+    object_property_set_bool(OBJECT(&s->lcdif), true,
+                             "realized", &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lcdif), 0, FSL_IMX7_LCDIF_ADDR);
+}
+
+static void fsl_imx7_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = fsl_imx7_realize;
+
+    /* Reason: Uses serial_hds and nd_table in realize() directly */
+    dc->user_creatable = false;
+    dc->desc = "i.MX7 SOC";
+}
+
+static const TypeInfo fsl_imx7_type_info = {
+    .name = TYPE_FSL_IMX7,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(FslIMX7State),
+    .instance_init = fsl_imx7_init,
+    .class_init = fsl_imx7_class_init,
+};
+
+static void fsl_imx7_register_types(void)
+{
+    type_register_static(&fsl_imx7_type_info);
+}
+type_init(fsl_imx7_register_types)
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
new file mode 100644
index 0000000000..9a36ee5dc7
--- /dev/null
+++ b/include/hw/arm/fsl-imx7.h
@@ -0,0 +1,233 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 SoC definitions
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef FSL_IMX7_H
+#define FSL_IMX7_H
+
+#include "hw/arm/arm.h"
+#include "hw/arm/coresight.h"
+#include "hw/cpu/a15mpcore.h"
+#include "hw/intc/imx_gpcv2.h"
+#include "hw/misc/imx7_ccm.h"
+#include "hw/misc/imx7_snvs.h"
+#include "hw/misc/imx7_iomuxc.h"
+#include "hw/misc/imx7_adc.h"
+#include "hw/misc/imx_flexcan.h"
+#include "hw/misc/imx7_gpr.h"
+#include "hw/misc/imx7_src.h"
+#include "hw/misc/imx6_src.h"
+#include "hw/misc/imx2_wdt.h"
+#include "hw/gpio/imx_gpio.h"
+#include "hw/char/imx_serial.h"
+#include "hw/timer/imx_gpt.h"
+#include "hw/timer/imx_epit.h"
+#include "hw/i2c/imx_i2c.h"
+#include "hw/gpio/imx_gpio.h"
+#include "hw/dma/imx_sdma.h"
+#include "hw/sd/sdhci.h"
+#include "hw/usb/imx-usbmisc.h"
+#include "hw/ssi/imx_spi.h"
+#include "hw/net/imx_fec.h"
+#include "hw/pci-host/designware.h"
+#include "hw/usb/chipidea.h"
+#include "hw/display/imx_lcdif.h"
+#include "exec/memory.h"
+#include "cpu.h"
+
+#define TYPE_FSL_IMX7 "fsl,imx7"
+#define FSL_IMX7(obj) OBJECT_CHECK(FslIMX7State, (obj), TYPE_FSL_IMX7)
+
+enum FslIMX7Configuration {
+    FSL_IMX7_NUM_CPUS         = 2,
+    FSL_IMX7_NUM_UARTS        = 7,
+    FSL_IMX7_NUM_ETHS         = 2,
+    FSL_IMX7_ETH_NUM_TX_RINGS = 3,
+    FSL_IMX7_NUM_USDHCS       = 3,
+    FSL_IMX7_NUM_WDTS         = 4,
+    FSL_IMX7_NUM_GPTS         = 4,
+    FSL_IMX7_NUM_IOMUXCS      = 2,
+    FSL_IMX7_NUM_GPIOS        = 7,
+    FSL_IMX7_NUM_I2CS         = 4,
+    FSL_IMX7_NUM_ECSPIS       = 4,
+    FSL_IMX7_NUM_FLEXCANS     = 2,
+    FSL_IMX7_NUM_USBS         = 3,
+    FSL_IMX7_NUM_ADCS         = 2,
+};
+
+typedef struct FslIMX7State {
+    /*< private >*/
+    DeviceState    parent_obj;
+
+    /*< public >*/
+    ARMCPU             cpu[FSL_IMX7_NUM_CPUS];
+    A15MPPrivState     a7mpcore;
+    A7MPCoreDAPState   dap;
+    IMXGPTState        gpt[FSL_IMX7_NUM_GPTS];
+    IMXGPIOState       gpio[FSL_IMX7_NUM_GPIOS];
+    IMX7IOMUXCState    iomuxc[FSL_IMX7_NUM_IOMUXCS];
+    IMX7CCMState       ccm;
+    IMX7SNVSState      snvs;
+    IMX7SRCState       src;
+    IMXGPCv2State      gpcv2;
+    IMXSPIState        spi[FSL_IMX7_NUM_ECSPIS];
+    IMXI2CState        i2c[FSL_IMX7_NUM_I2CS];
+    IMXSerialState     uart[FSL_IMX7_NUM_UARTS];
+    IMXFlexCANState    flexcan[FSL_IMX7_NUM_FLEXCANS];
+    IMXFECState        eth[FSL_IMX7_NUM_ETHS];
+    SDHCIState         usdhc[FSL_IMX7_NUM_USDHCS];
+    IMX2WdtState       wdt[FSL_IMX7_NUM_WDTS];
+    IMXSDMAState       sdma;
+    IMX7GPRState       gpr;
+    IMXUSBMiscState    usbmisc[FSL_IMX7_NUM_USBS];
+    ChipideaState      usb[FSL_IMX7_NUM_USBS];
+    IMX7ADCState       adc[FSL_IMX7_NUM_ADCS];
+    IMXLCDState        lcdif;
+    DesignwarePCIEHost pcie;
+} FslIMX7State;
+
+enum FslIMX7MemoryMap {
+    FSL_IMX7_MMDC_ADDR            = 0x80000000,
+    FSL_IMX7_MMDC_SIZE            = 2 * 1024 * 1024 * 1024UL,
+
+    FSL_IMX7_GPIO1_ADDR           = 0x30200000,
+    FSL_IMX7_GPIO2_ADDR           = 0x30210000,
+    FSL_IMX7_GPIO3_ADDR           = 0x30220000,
+    FSL_IMX7_GPIO4_ADDR           = 0x30230000,
+    FSL_IMX7_GPIO5_ADDR           = 0x30240000,
+    FSL_IMX7_GPIO6_ADDR           = 0x30250000,
+    FSL_IMX7_GPIO7_ADDR           = 0x30260000,
+
+    FSL_IMX7_IOMUXC_LPSR_GPR_ADDR = 0x30270000,
+
+    FSL_IMX7_WDOG1_ADDR           = 0x30280000,
+    FSL_IMX7_WDOG2_ADDR           = 0x30290000,
+    FSL_IMX7_WDOG3_ADDR           = 0x302A0000,
+    FSL_IMX7_WDOG4_ADDR           = 0x302B0000,
+
+    FSL_IMX7_IOMUXC_LPSR_ADDR     = 0x302C0000,
+
+    FSL_IMX7_GPT1_ADDR            = 0x302D0000,
+    FSL_IMX7_GPT2_ADDR            = 0x302E0000,
+    FSL_IMX7_GPT3_ADDR            = 0x302F0000,
+    FSL_IMX7_GPT4_ADDR            = 0x30300000,
+
+    FSL_IMX7_IOMUXC_ADDR          = 0x30330000,
+    FSL_IMX7_IOMUXC_GPR_ADDR      = 0x30340000,
+
+    FSL_IMX7_CCM_ADDR             = 0x30360000,
+    FSL_IMX7_SNVS_ADDR            = 0x30370000,
+
+    FSL_IMX7_SRC_ADDR             = 0x30390000,
+
+    FSL_IMX7_ADC1_ADDR            = 0x30610000,
+    FSL_IMX7_ADC2_ADDR            = 0x30620000,
+
+    FSL_IMX7_GPC_ADDR             = 0x303A0000,
+
+    FSL_IMX7_I2C1_ADDR            = 0x30A20000,
+    FSL_IMX7_I2C2_ADDR            = 0x30A30000,
+    FSL_IMX7_I2C3_ADDR            = 0x30A40000,
+    FSL_IMX7_I2C4_ADDR            = 0x30A50000,
+
+    FSL_IMX7_ECSPI1_ADDR          = 0x30820000,
+    FSL_IMX7_ECSPI2_ADDR          = 0x30830000,
+    FSL_IMX7_ECSPI3_ADDR          = 0x30840000,
+    FSL_IMX7_ECSPI4_ADDR          = 0x30630000,
+
+    FSL_IMX7_LCDIF_ADDR           = 0x30730000,
+
+    FSL_IMX7_UART1_ADDR           = 0x30860000,
+    /*
+     * Some versions of the reference manual claim that UART2 is @
+     * 0x30870000, but experiments with HW + DT files in upstream
+     * Linux kernel show that not to be true and that block is
+     * acutally located @ 0x30890000
+     */
+    FSL_IMX7_UART2_ADDR           = 0x30890000,
+    FSL_IMX7_UART3_ADDR           = 0x30880000,
+    FSL_IMX7_UART4_ADDR           = 0x30A60000,
+    FSL_IMX7_UART5_ADDR           = 0x30A70000,
+    FSL_IMX7_UART6_ADDR           = 0x30A80000,
+    FSL_IMX7_UART7_ADDR           = 0x30A90000,
+
+    FSL_IMX7_FLEXCAN1_ADDR        = 0x30A00000,
+    FSL_IMX7_FLEXCAN2_ADDR        = 0x30A10000,
+
+    FSL_IMX7_ENET1_ADDR           = 0x30BE0000,
+    FSL_IMX7_ENET2_ADDR           = 0x30BF0000,
+
+    FSL_IMX7_USB1_ADDR            = 0x30B10000,
+    FSL_IMX7_USBMISC1_ADDR        = 0x30B10200,
+    FSL_IMX7_USB2_ADDR            = 0x30B20000,
+    FSL_IMX7_USBMISC2_ADDR        = 0x30B20200,
+    FSL_IMX7_USB3_ADDR            = 0x30B30000,
+    FSL_IMX7_USBMISC3_ADDR        = 0x30B30200,
+
+    FSL_IMX7_USDHC1_ADDR          = 0x30B40000,
+    FSL_IMX7_USDHC2_ADDR          = 0x30B50000,
+    FSL_IMX7_USDHC3_ADDR          = 0x30B60000,
+
+    FSL_IMX7_SDMA_ADDR            = 0x30BD0000,
+
+    FSL_IMX7_A7MPCORE_ADDR        = 0x31000000,
+    FSL_IMX7_A7MPCORE_DAP_ADDR    = 0x30000000,
+
+    FSL_IMX7_PCIE_REG_ADDR        = 0x33800000,
+    FSL_IMX7_PCIE_REG_SIZE        = 16 * 1024,
+
+    FSL_IMX7_GPR_ADDR             = 0x30340000,
+};
+
+enum FslIMX7IRQs {
+    FSL_IMX7_USDHC1_IRQ   = 22,
+    FSL_IMX7_USDHC2_IRQ   = 23,
+    FSL_IMX7_USDHC3_IRQ   = 24,
+
+    FSL_IMX7_UART1_IRQ    = 26,
+    FSL_IMX7_UART2_IRQ    = 27,
+    FSL_IMX7_UART3_IRQ    = 28,
+    FSL_IMX7_UART4_IRQ    = 29,
+    FSL_IMX7_UART5_IRQ    = 30,
+    FSL_IMX7_UART6_IRQ    = 16,
+
+    FSL_IMX7_ECSPI1_IRQ   = 31,
+    FSL_IMX7_ECSPI2_IRQ   = 32,
+    FSL_IMX7_ECSPI3_IRQ   = 33,
+    FSL_IMX7_ECSPI4_IRQ   = 34,
+
+    FSL_IMX7_I2C1_IRQ     = 35,
+    FSL_IMX7_I2C2_IRQ     = 36,
+    FSL_IMX7_I2C3_IRQ     = 37,
+    FSL_IMX7_I2C4_IRQ     = 38,
+
+    FSL_IMX7_USB1_IRQ     = 43,
+    FSL_IMX7_USB2_IRQ     = 42,
+    FSL_IMX7_USB3_IRQ     = 40,
+
+    FSL_IMX7_PCI_INTA_IRQ = 122,
+    FSL_IMX7_PCI_INTB_IRQ = 123,
+    FSL_IMX7_PCI_INTC_IRQ = 124,
+    FSL_IMX7_PCI_INTD_IRQ = 125,
+
+    FSL_IMX7_UART7_IRQ    = 126,
+
+#define FSL_IMX7_ENET_IRQ(i, n)  ((n) + ((i) ? 100 : 118))
+
+    FSL_IMX7_MAX_IRQ      = 128,
+};
+
+#endif /* FSL_IMX7_H */
-- 
2.13.6

