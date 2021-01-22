Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1218852lfb;
        Fri, 22 Jan 2021 13:52:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7cM6ryAgGhweEq6yS896utuFEDo1Hx8NIyL0602bX29KtN9VigHdBp/PNCyjj/jLwEJ/a
X-Received: by 2002:a25:bb93:: with SMTP id y19mr9751405ybg.498.1611352376664;
        Fri, 22 Jan 2021 13:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611352376; cv=none;
        d=google.com; s=arc-20160816;
        b=C8o1GK+5HE9q7J1cDs5c1yzUoNHG67Fh+yIlNYoVy21M8WMhlaWtgIiGP/qfu7sI70
         FE91+klNam/v5cKR+bjKwDNQ7S1a6B1Vn380VUURYcL4O8bZFnYAPoAdhmLrMCFm6Kr7
         EhRx2LwoX6HcbKgefgbvUp6IHPqxCbtLvXqXiuGO1UPI70tYBmeqEhuZPmrWLhGvj0DH
         BY5oIVAEaGE5qxFp8ad8+Y4McY8KPebH9tMtW6t7R5qDVxqJ00xLJ40Nma+CLNIYWJ+m
         BC9cJEHndjK/IQbYUkUXFKFNRykwjfXwER5K1J7Q2XK2AILeqSKPH/pQpgp4LnHZccbw
         GLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=uWdb+6sbsmmk4J0dROkTnS6VgjAUEcnwu8MSo63pZwk=;
        b=QxBqNhHUR1d5jcFHqWCxmfD7lNrfTkqt/AVKIcDWYuK4okj8UO1KbTZVVljGWqWBxJ
         78yJgSmck7UoM/ZeI8+RYZLe50mCjkP0hrgMeXlI7n004+QLL3BDMKtBBNNruyQe9G0H
         qNLsw89KpXCgQWFQq2LofGYHJv5FnvWwGnGCFeFs/3b50yu+0yi5xKdXiWEr/wzBcNnA
         5K0dM0oux3poDD41srDUMUvIFnQnUvlDSrHw49qWskFWmEe8muptVQcKG99yxIbCkUQ7
         zBwwU7Id55ALMwfJpVcK9p9MzTVwQcXyW7tLcFoqOXQs5Vy/JsAaylqtUHpCy0DRx/oQ
         XI7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ShykAJE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si5726457ybm.303.2021.01.22.13.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 13:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ShykAJE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l34MS-0000hJ-2A
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 16:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34MA-0000Tz-2Q
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:38 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M6-0007J0-Qb
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:37 -0500
Received: by mail-lj1-x231.google.com with SMTP id b10so8217306ljp.6
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 13:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uWdb+6sbsmmk4J0dROkTnS6VgjAUEcnwu8MSo63pZwk=;
 b=ShykAJE8kUjlLlXhyDShniXiaA+p21UBg6Kzv2lgVpkCA/VnqX4GMkFo6h9EYHfGv6
 YM1F9UTNFVNyRrX+Ek/HJwnM/lePQL3tr4lNWGbjiZGTplGKSLWfVRV0DNtR9J/p1llA
 jE73GqjtvypjCqZ/bCEsdpAXUkvnsJgttLjt4enu8D6x6ODSbH9uXtVPC6Bih14ykPu4
 PrfJdwgTdODUkzqC8W4ZCJZxNFQ3JJZd0/TgmbaqSTYH2CZUEbqgDIXY2QFrmxNZuGKv
 LjhOC0zpZNquxHjQyba+fPebkttp41964q+/FlyBMTUJrNhDhYVKu3GG9hL1NtADmDJ1
 GjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uWdb+6sbsmmk4J0dROkTnS6VgjAUEcnwu8MSo63pZwk=;
 b=nkC+O9IMLe2UJ3mXrF8t/+HZ0VMtipb+7dMu74syAdqV5bNziEn8p5WaLNQqa4yjf1
 nnlH1gjDY/pGLav13wruCanKNr3b9noEFDySYdL12/CwsFrte0zAs0nBFNqGIUbnF+ag
 pmtYzNicX78SyF9bHJMzcSVAb0xg5gR2bsx851KL8wzkhQdJ+fACXUiNf/iPS3uK+Nz+
 3Q1hc9Qb28kOUzNm0h7z0OEAM+ixtBFw/U/HNVORtUvDW0hyjdH1kMTDIk5od0+Roj5V
 JDEKnjE4Sx+AgBGvitHTqluMVyrgRhSd0yl/48UebuRDkS0ZNdP/5g2Mws//J9HpahtR
 SDgA==
X-Gm-Message-State: AOAM530NVNUabzX8A055c9Mp32DkPSKoeHFvwBCqAUQxEN6wpLjHa+GJ
 0RDdcyVQqT+h2rDkwGolNnuXpSY2i+iJXg==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr3509585ljh.403.1611352352593; 
 Fri, 22 Jan 2021 13:52:32 -0800 (PST)
Received: from localhost.localdomain ([176.59.42.245])
 by smtp.gmail.com with ESMTPSA id a11sm1019890lfl.22.2021.01.22.13.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:52:31 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv9 2/3] arm-virt: refactor gpios creation
Date: Sat, 23 Jan 2021 00:52:21 +0300
Message-Id: <20210122215222.8320-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122215222.8320-1-maxim.uvarov@linaro.org>
References: <20210122215222.8320-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x231.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PAnobZErcI6e

No functional change. Just refactor code to better
support secure and normal world gpios.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 57 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3..a135316741 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -820,17 +820,43 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
-static void create_gpio(const VirtMachineState *vms)
+static void create_gpio_keys(const VirtMachineState *vms,
+                             DeviceState *pl061_dev,
+                             uint32_t phandle)
+{
+    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
+                                        qdev_get_gpio_in(pl061_dev, 3));
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
+                            "label", "GPIO Key Poweroff");
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
+                          KEY_POWER);
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
+                           "gpios", phandle, 3, 0);
+}
+
+static void create_gpio_devices(const VirtMachineState *vms, int gpio,
+                                MemoryRegion *mem)
 {
     char *nodename;
     DeviceState *pl061_dev;
-    hwaddr base = vms->memmap[VIRT_GPIO].base;
-    hwaddr size = vms->memmap[VIRT_GPIO].size;
-    int irq = vms->irqmap[VIRT_GPIO];
+    hwaddr base = vms->memmap[gpio].base;
+    hwaddr size = vms->memmap[gpio].size;
+    int irq = vms->irqmap[gpio];
     const char compat[] = "arm,pl061\0arm,primecell";
+    SysBusDevice *s;
 
-    pl061_dev = sysbus_create_simple("pl061", base,
-                                     qdev_get_gpio_in(vms->gic, irq));
+    pl061_dev = qdev_new("pl061");
+    s = SYS_BUS_DEVICE(pl061_dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
     uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
     nodename = g_strdup_printf("/pl061@%" PRIx64, base);
@@ -847,21 +873,10 @@ static void create_gpio(const VirtMachineState *vms)
     qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
 
-    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
-                                        qdev_get_gpio_in(pl061_dev, 3));
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
-
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
-                            "label", "GPIO Key Poweroff");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
-                          KEY_POWER);
-    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
-                           "gpios", phandle, 3, 0);
     g_free(nodename);
+
+    /* Child gpio devices */
+    create_gpio_keys(vms, pl061_dev, phandle);
 }
 
 static void create_virtio_devices(const VirtMachineState *vms)
@@ -1990,7 +2005,7 @@ static void machvirt_init(MachineState *machine)
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
-        create_gpio(vms);
+        create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
      /* connect powerdown request */
-- 
2.17.1

