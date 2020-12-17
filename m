Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1301138lfq;
        Thu, 17 Dec 2020 05:57:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt3Zop+ICn20T1FHsYKEES9px3mZbMD2vOACNHDGNeoAw7mc88lrK6sNKPFonywgeXhWij
X-Received: by 2002:a25:383:: with SMTP id 125mr3232462ybd.120.1608213470931;
        Thu, 17 Dec 2020 05:57:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608213470; cv=none;
        d=google.com; s=arc-20160816;
        b=UdElQfSa0qOq89eam5tYhaIld5b8ptX1b7DAVQiBm41UFpLjWZAK6qjF6OSkPKnu0A
         0mcjKOE732qAK/qqhqXktPZEp/xVFiQPCqwvGOcO47zhJoDZOPCF7R7KUk8oHcYTyor0
         7BYl/CgwHVjLFhNIlsKoW1tC5l+DZeGvvSQdE9ZlGKjHfQpceQrhj9pysqjH9tP28lDb
         AQLxhVwkajxv4VPYnype8pw+wXEEz8zEGuP4Umpt4fuflePKvg4hg1yB30q4nlJq/VSp
         D/PwdJObwRrW+dmVMGt2chZQBUQAiTKtvYSVnPJBQXMVhBnw6CyP831h/KXwA2TWaNtd
         UTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=zK29gl89aiEqHVybhB8M63sFl8kr3tsfqE9jGc8pkOI=;
        b=ZPBsCtNhKoSpZClNY9h4OKV6rK8FyKQnwGGOg7BOnG39TTVuM8+MebhgbHVb3O43QX
         JjFQIQSJzTdUqhbB9HLwH0tosJBqsGKueob9AL1tPYey/Jlf0rr2R/j+1nNQy++6FgTl
         x9MpGtctB05EmpTIwPt+/5289qf8FPe9NIvLoq2OWls6kPZoqmxqdxEyWW0cvAmHiabx
         lI/lkyagb6vT2ZajUe2TWQ0BZNUkEQmmiGqLtpRtJHRPJgln1V4GC6BSSRDcCoeqHtDE
         SWTyleZt0gF4HIouULd/oMOUHVC2X4tpGJvTE+B35FSikfz6g2U4ENtlwrUpSOlSKTvN
         azCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntnzhzHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si4755006ybg.128.2020.12.17.05.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Dec 2020 05:57:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntnzhzHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kptmw-0006hQ-9h
	for alex.bennee@linaro.org; Thu, 17 Dec 2020 08:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kptmh-0006gv-KH
 for qemu-arm@nongnu.org; Thu, 17 Dec 2020 08:57:37 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:45191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kptmb-0003BW-RW
 for qemu-arm@nongnu.org; Thu, 17 Dec 2020 08:57:33 -0500
Received: by mail-lf1-x12f.google.com with SMTP id x20so38013652lfe.12
 for <qemu-arm@nongnu.org>; Thu, 17 Dec 2020 05:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=zK29gl89aiEqHVybhB8M63sFl8kr3tsfqE9jGc8pkOI=;
 b=ntnzhzHq4rDYpUMblcZfzMgUPECn38Iq4NOcqob4tFecj2qvKWIUYgpRgbj89a66iz
 FT9V4IFVnqVRV1+JlHvjWtPNtA21s3tUXTcbcgk6I+5RQv0byAXLsKjaKCOBIHmYlwb7
 9tO7WusyylZfTtNWTIjCtiI/1zRMFdNJ51M+QEzBQmuXojsMCiVeaLsboGowGH1cWvXD
 gTfvwiyuJCnfYH8zSN7d1OLAZzZsjjn9BDoSls/sQ8+EYAtwJJ1vw/Cws7iy+/cU3lnq
 CLtJknQ3PeDtJ9cQCe+WbHo+FH3NK2L77allNn2gYL3avnidLWg4eW88a+LB7ayK/WsA
 buAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zK29gl89aiEqHVybhB8M63sFl8kr3tsfqE9jGc8pkOI=;
 b=QnoKke2RsYrog6Len2tSR/9gSBrG4Q4VQZcv5VUDh08NwC4iJQe9c/2uIkJg74q4Mg
 wKbpZ/9fWPFsCqJLbbrHXDGncrcA1X9CCKZVcKA35KFZJm+HYoQAz2lObDpbcnOqxK0c
 zlANEE+nnZgaE1cPvaGwTfRiYxV0b2BXkuNd5Boe+1BNsObGV6YKBn40a+aeuWx2rBRp
 GGi2BfS8e690QAC0IbGEYEHmOOZBHXVZBCBzkP4reQnkEpquH+66qBdysNLKhHCGh2qP
 AMp7MwBnQV0WLyF8HMWCchYOb7zMMWO6TlD0FcrOT2Af62q9J9lgXYCcl4Dwg2JMKxdJ
 CuIQ==
X-Gm-Message-State: AOAM5312k6TiJri3fMLTgvhRNRoL4iu/JdQm6LrcWJMLY1CQ1/55Bb/K
 cMunjKcD7OeMlwkFBnAXMelyiqdb5d+rTQ==
X-Received: by 2002:ac2:46e4:: with SMTP id q4mr14281326lfo.413.1608213447167; 
 Thu, 17 Dec 2020 05:57:27 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id q2sm593613lfn.67.2020.12.17.05.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:57:26 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] arm-virt: add secure pl061 for reset/power down
Date: Thu, 17 Dec 2020 16:57:13 +0300
Message-Id: <20201217135713.9715-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, peter.maydell@linaro.org,
 francois.ozog@linaro.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EzDVR2s1UfEV

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware).
Use the same gpio 3 and gpio 4 which were used by
non acpi variant of linux power control gpios.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 This patch works together with ATF patch:
	https://github.com/muvarov/arm-trusted-firmware/commit/dd4401d8eb8e0f3018b335b81ce7a96d6cb16d0f	

 Previus discussion for reboot issue was here:
	https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html

 Regards,
 Maxim.


 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 24 +++++++++++++
 hw/gpio/Kconfig       |  3 ++
 hw/gpio/gpio_pwr.c    | 83 +++++++++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build   |  1 +
 include/hw/arm/virt.h |  1 +
 6 files changed, 113 insertions(+)
 create mode 100644 hw/gpio/gpio_pwr.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0a242e4c5d..13cc42dcc8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM_VIRT
     select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
+    select GPIO_PWR
     select PLATFORM_BUS
     select SMBIOS
     select VIRTIO_MMIO
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3..eff0345303 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -147,6 +147,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
+    [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
@@ -189,6 +190,7 @@ static const int a15irqmap[] = {
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
     [VIRT_ACPI_GED] = 9,
+    [VIRT_SECURE_GPIO] = 10,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -864,6 +866,24 @@ static void create_gpio(const VirtMachineState *vms)
     g_free(nodename);
 }
 
+static void create_gpio_secure(const VirtMachineState *vms)
+{
+    DeviceState *pl061_dev;
+    static DeviceState *gpio_pwr_dev;
+
+    hwaddr base = vms->memmap[VIRT_SECURE_GPIO].base;
+    int irq = vms->irqmap[VIRT_SECURE_GPIO];
+
+    pl061_dev = sysbus_create_simple("pl061", base,
+                                     qdev_get_gpio_in(vms->gic, irq));
+
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1,
+                                        qdev_get_gpio_in(pl061_dev, 3));
+
+    qdev_connect_gpio_out(pl061_dev, 3, qdev_get_gpio_in(gpio_pwr_dev, 3));
+    qdev_connect_gpio_out(pl061_dev, 4, qdev_get_gpio_in(gpio_pwr_dev, 4));
+}
+
 static void create_virtio_devices(const VirtMachineState *vms)
 {
     int i;
@@ -1993,6 +2013,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio(vms);
     }
 
+    if (vms->secure) {
+        create_gpio_secure(vms);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index b6fdaa2586..f0e7405f6e 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -8,5 +8,8 @@ config PL061
 config GPIO_KEY
     bool
 
+config GPIO_PWR
+    bool
+
 config SIFIVE_GPIO
     bool
diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
new file mode 100644
index 0000000000..dded12381b
--- /dev/null
+++ b/hw/gpio/gpio_pwr.c
@@ -0,0 +1,83 @@
+/*
+ * GPIO qemu power controller
+ *
+ * Copyright (c) 2020 Linaro Limited
+ *
+ * Author: Maxim Uvarov <maxim.uvarov@linaro.org>
+ *
+ * Virtual gpio driver which can be used on top of pl061
+ * to reboot and shutdown qemu virtual machine. One of use
+ * case is gpio driver for secure world application (ARM
+ * Trusted Firmware.).
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_GPIOPWR "gpio-pwr"
+OBJECT_DECLARE_SIMPLE_TYPE(GPIO_PWR_State, GPIOPWR)
+
+struct GPIO_PWR_State {
+    SysBusDevice parent_obj;
+    qemu_irq irq;
+};
+
+static void gpio_pwr_set_irq(void *opaque, int irq, int level)
+{
+    GPIO_PWR_State *s = (GPIO_PWR_State *)opaque;
+
+    qemu_set_irq(s->irq, 1);
+
+    if (level) {
+        return;
+    }
+
+    switch (irq) {
+    case 3:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        break;
+    case 4:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        break;
+    default:
+        printf("qemu; gpio_pwr: unknown interrupt %d lvl %d\n",
+               irq, level);
+    }
+}
+
+
+static void gpio_pwr_realize(DeviceState *dev, Error **errp)
+{
+    GPIO_PWR_State *s = GPIOPWR(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+    qdev_init_gpio_in(dev, gpio_pwr_set_irq, 8);
+}
+
+static void gpio_pwr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = gpio_pwr_realize;
+}
+
+static const TypeInfo gpio_pwr_info = {
+    .name          = TYPE_GPIOPWR,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(GPIO_PWR_State),
+    .class_init    = gpio_pwr_class_init,
+};
+
+static void gpio_pwr_register_types(void)
+{
+    type_register_static(&gpio_pwr_info);
+}
+
+type_init(gpio_pwr_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 5c0a7d7b95..79568f00ce 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
 softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_gpio.c'))
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index abf54fab49..77a4523cc7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -81,6 +81,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_SECURE_GPIO,
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
-- 
2.17.1

