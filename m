Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4074044lfq;
        Wed, 20 Jan 2021 01:28:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydZiVij9uYXZSFwLDMX8QH5IanecuIC9GWM/Z5POFRABXs3Ylv/qE9WVjtxvcSdQ7lnQzo
X-Received: by 2002:a25:70c5:: with SMTP id l188mr12371054ybc.45.1611134890564;
        Wed, 20 Jan 2021 01:28:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611134890; cv=none;
        d=google.com; s=arc-20160816;
        b=fyCWJ9BA6e1lEP8brtvdFNZzF729jQ9Fo5SKEHapaWW95S4PFItG3L9uuL3cATd2DZ
         6DeMibeGM2NdQo78y++14KVkJEaeMY4uh9JN/hX1gBWR6P3dArX0k2fO5nfwHmYfvkR9
         b00Cft1GYFqoqFT7B1TNuMbc+ZRYjFFl4HOeC2dsaIiMwOVIjyBfc8nJgE7CZxkMGylt
         o52o+MdRCqdmBQaQQz0sicB4pVRkY0jvHt94jJBaGNmcNu/eLPvgmVPvvnVCtFQJRgOT
         LJyJWzlvIof0RVpcoSUNtlsZ3wXF1prnphEt7ONrD6h3QZ3w5FrZJqK0PnW08MZH+yuX
         Rm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=vEZQ1y1NFv0BYfclNl3dBsXayOat5WWlg5bfIXSoTYA=;
        b=1HAe0E0VEF1ap3mEELNc8OuihSVNGDKuqCSJdGSMKAIa5lDeH0+zJMiY+SW0DAvC4U
         LmIVcHiF/JkCs9B4qBbj/R2nHAvYx2XBy1F+wG1DjoQXVh1bhSQbTKPSBiD1w3kbPsXy
         h+t8lcgOdSfbQki95V34z5PaxMzClGu8YcOxmWjAuML98YrMZk0QS6MfxHGuNEC1nlXP
         FAQOSCPOSfErJAmzYH78tvGwppGs6rgK8FgRzaZzii0EG7mVWHdETxPZqfBLw5pDAfYJ
         qUsVB9jQLiJdUqCJNY5Qtv4xk1UoylEw7rxCTqrSfLtHx9cwxNJ0QWP1biYh9ojtL/yt
         0PjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=An9qOYzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si1273427ybo.179.2021.01.20.01.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 01:28:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=An9qOYzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l29mb-0000uX-Qe
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 04:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mS-0000sV-Bg
 for qemu-arm@nongnu.org; Wed, 20 Jan 2021 04:28:00 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:42642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mO-000561-U9
 for qemu-arm@nongnu.org; Wed, 20 Jan 2021 04:28:00 -0500
Received: by mail-lf1-x133.google.com with SMTP id b26so33226760lff.9
 for <qemu-arm@nongnu.org>; Wed, 20 Jan 2021 01:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vEZQ1y1NFv0BYfclNl3dBsXayOat5WWlg5bfIXSoTYA=;
 b=An9qOYzcBaft+pwc8SwyMU1x8szv07tmYUaHXWtMx0rhfMbbtbd8lrVoS8KPaVCbYz
 0zbfXBQmx80bffjo18xV6hHO+74gMNV/TFdPxJNzTLuPvJwXrAASpb1D/KE8/dGOR/oH
 E9kpTLJU9EfrVi0yu0lDPJJgaPRbIFcqGhbY/7tnFVwbaPXW/U3iL7SvhaNd8RatvVBz
 zWZJhGJi9uxly7M9JAMMJxDPJC3pT9FaJQJgnionDfOko6YcxKL1t6uirH9j6reWFjxZ
 JGZYj4Ueyv/zL2F/YMVJKHUZys/+smAVNnMaiNobiaHv3M0WU1oJeVTjusw9uHC8LpBu
 MiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vEZQ1y1NFv0BYfclNl3dBsXayOat5WWlg5bfIXSoTYA=;
 b=kCAEP7+9noy4n55Gpfvg1GKArduXLPt/XC7G3mRAD1EW8/CrYJLUsAyX7M/efOBA/e
 R5WdJjpnSrfd0xrrgiVRSJNNVIV6qvebVnk1FgcwW7J6DonKntUddJTKbevf7Onw55DC
 GaU1GIq3NqwvlHoghzfwDs2aHFS002BpQ1Rn2UezB2suaaUZIsrF/UVUwysQQPZvTyy7
 L5+v4wc4J+2wpSm7cjC6O4rzfPic+O8PsrAOvrZyfoiYXfvhpOZNmc4/biTDQtlnlfHh
 szEAMGQ6/D6xpXf36ItAGtnhFD1mD0lzFLOGVs039hUyuI6B4T0SsGCo1HYgxsnrg+4P
 xRKQ==
X-Gm-Message-State: AOAM5327oOWfvxquyWT+/P9tjVw5AngVVdFWqOUGXtXix4qLwRakqwuI
 LUR1mhMFBvoBbABOILS/azZNaOxJ9lRKWQ==
X-Received: by 2002:a19:991:: with SMTP id 139mr3774083lfj.637.1611134874895; 
 Wed, 20 Jan 2021 01:27:54 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id r81sm147479lff.215.2021.01.20.01.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:27:54 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv8 2/3] arm-virt: refactor gpios creation
Date: Wed, 20 Jan 2021 12:27:47 +0300
Message-Id: <20210120092748.14789-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120092748.14789-1-maxim.uvarov@linaro.org>
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
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
X-TUID: gW44mC/ZxCY0

No functional change. Just refactor code to better
support secure and normal world gpios.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/virt.c | 64 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3..c427ce5f81 100644
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
@@ -847,21 +873,17 @@ static void create_gpio(const VirtMachineState *vms)
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
+    if (gpio != VIRT_GPIO) {
+        /* Mark as not usable by the normal world */
+        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+    }
     g_free(nodename);
+
+    /* Child gpio devices */
+    if (gpio == VIRT_GPIO) {
+        create_gpio_keys(vms, pl061_dev, phandle);
+    }
 }
 
 static void create_virtio_devices(const VirtMachineState *vms)
@@ -1990,7 +2012,7 @@ static void machvirt_init(MachineState *machine)
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
-        create_gpio(vms);
+        create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
      /* connect powerdown request */
-- 
2.17.1

