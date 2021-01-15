Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp131241lfq;
        Fri, 15 Jan 2021 02:12:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZCActjtcBMl4g6QOE0B/QKiPjoIeVTmtZyl+wNGPkPX1R5uXoX6luPD1QWvy44GOxpHF6
X-Received: by 2002:a5b:b45:: with SMTP id b5mr16970366ybr.355.1610705569149;
        Fri, 15 Jan 2021 02:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610705569; cv=none;
        d=google.com; s=arc-20160816;
        b=b1oqsHASOFCaHXqHL9lpPJ96nHW1Y8D4FY1lBCDWLNAdspKrM+WkSK3i6SaNPA6kXs
         +ZDy8PBhczBhJRiJACfpqs3BnXeQWE9R274wQV5FodKb3Cy8mA2MouXrY+P/kfZDq6X/
         JHgCT+P2DZSYgt+OvqeLU0AkC69Ou95niP++MY7qFZ6qbrN4RAe7XUtlUw9tJBOZ7aB8
         NHOolNVJH4pkspWgoHEYDGKaMmHoRKq3kCTyoOXcVpe0mzEkMr1NdLp4P2IS+LcX9p/a
         uIcfGsWs+J40RTG1eo6+3zsoNaxfXh2L4NjJqHXJDjNAehy65G5oEJgvX34lp73o0in8
         bTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=vPPgth0B34ZUMkGOdod6Wf0uamyx/ibqO+NcA2Qoz+4=;
        b=yQ46FokOd+i2LgO8tiZASgUB+b/L0AieiXXxbCBjT0SuNX5aGXRi8jk3mfbESjjJxh
         Eb3UXrrJfeFkFiUbKKcAD7d8VIALpnGAX2V7NVusgSRlzUij9tDL2rg0S64QXNDb74uu
         Hd/I9yBD+csY6TOK4bYBM0ym7e85ar2PDY+tfY3HLV1lOO8HDHRS8bYx0VlN/iZgAXu/
         VSt7O5LUNt3tLV9VeJWSdCxDh9MPeoU8pWC/t9MyIAFpy01mg4bS2UFnDj8VTLT705XA
         SS2E9MtYPRzIi8Bgv6hfAWqzb8IIlnG1bXZ6cyeLstHUNdIMwr5MQgO4tIu76gD9rn+D
         CCKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vyVXSAhW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w67si7668821ybe.353.2021.01.15.02.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 02:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vyVXSAhW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0M64-0005DC-FG
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 05:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4v-00046P-37
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:11:37 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4t-0001zY-AM
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:11:36 -0500
Received: by mail-lf1-x133.google.com with SMTP id u25so12376133lfc.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vPPgth0B34ZUMkGOdod6Wf0uamyx/ibqO+NcA2Qoz+4=;
 b=vyVXSAhWZLP0JtUAx3EhagzMrkwBE88m0PJrrMKnTIH6CpijqX1STSBZMDylcptlK8
 EQKCXdTSUolCeWUf7zNDSmaHMWoY3hkJ8t8HWbMAmfVd3uUUPDL/WmTd7iVNxdbFR1lP
 5+9/t+/hlYa9S37ZDBsitVC+/TTqAB/hs0LV04dem0AmAQ5Z+M6VsIcLHfG8UbVu4J/b
 cIZyXWwpDXL+r3tRw6IXkqSacYpE/jOtSqagse/GC5qsNFhm60igZ077oQGkfsTn1EbL
 idyZrCdgUAk8XNw/kV09KRn26KQNQHy1kPS2jV9Hb3oqwv81aooAmJmRlZFc7EiZx66K
 96QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vPPgth0B34ZUMkGOdod6Wf0uamyx/ibqO+NcA2Qoz+4=;
 b=DcHY9v7B3Ymph1TeMOX9xVSrXd61D6ZVZtc10xAnjAR1mQTTs+4BzqIfTihxjPWBAT
 tUJ0M/X/5NoHoS7jrb0rGVQ1j9DsK4p9E2iSu/njSQ06fY2xtMvFg6H3Oqu6k38vCT+j
 029+HMOpB/5fhqcDzMbIMRzM04BqHFMyT8GApydVTDaf4QxdKc74lBg4uEn29wobMDmX
 8Mhm4Ca71XZta6czXsOJH3Cxn3GngC7hfXLqUoYSQeUPF3hKwVLn8gFTHvPhnm20s8j0
 DzgTqi/couyJgpFHrY+jxydEUq444TdI3cW0rVnKInOzRCCHzHF2Fgjhptd/7IejUK8w
 iUdQ==
X-Gm-Message-State: AOAM530XirMFgnV90ZY8BvGFuMbYN/sOOf9iFAaEBrAHqrZvGWKjOeMy
 T503Hw00kGlzXQef9EsdIFYlQbrjvLRmsQ==
X-Received: by 2002:a19:8316:: with SMTP id f22mr5323495lfd.10.1610705493784; 
 Fri, 15 Jan 2021 02:11:33 -0800 (PST)
Received: from localhost.localdomain ([91.193.178.207])
 by smtp.gmail.com with ESMTPSA id a15sm731886lji.105.2021.01.15.02.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:11:33 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv7 2/3] arm-virt: refactor gpios creation
Date: Fri, 15 Jan 2021 13:11:25 +0300
Message-Id: <20210115101126.4259-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115101126.4259-1-maxim.uvarov@linaro.org>
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TJ2BhUH1sgin

No functional change. Just refactor code to better
support secure and normal world gpios.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/virt.c | 67 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 20 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3..26bb66e8e1 100644
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
@@ -847,21 +873,22 @@ static void create_gpio(const VirtMachineState *vms)
     qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
 
-    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
-                                        qdev_get_gpio_in(pl061_dev, 3));
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
+    if (gpio == VIRT_GPIO) {
+        qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
+    } else {
+        /* Mark as not usable by the normal world */
+        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
 
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
-                            "label", "GPIO Key Poweroff");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
-                          KEY_POWER);
-    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
-                           "gpios", phandle, 3, 0);
+        qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
+                                nodename);
+    }
     g_free(nodename);
+
+    /* Child gpio devices */
+    if (gpio == VIRT_GPIO) {
+        create_gpio_keys(vms, pl061_dev, phandle);
+    }
 }
 
 static void create_virtio_devices(const VirtMachineState *vms)
@@ -1990,7 +2017,7 @@ static void machvirt_init(MachineState *machine)
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
-        create_gpio(vms);
+        create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
      /* connect powerdown request */
-- 
2.17.1

