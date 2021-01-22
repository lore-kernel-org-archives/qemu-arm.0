Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1220354lfb;
        Fri, 22 Jan 2021 13:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAF8rkbL050cz5O51pp5E6GLlwtmTCT11dg8LNOhCOJtQVrkTVprUO1VdcX2mGo/c7OlH1
X-Received: by 2002:a25:b5cd:: with SMTP id d13mr9589590ybg.252.1611352551310;
        Fri, 22 Jan 2021 13:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611352551; cv=none;
        d=google.com; s=arc-20160816;
        b=NCp4qTS5Sy0yG3m30OM4mf8WWZra8LsPAQB6y/ELuc9w7gZGsMC0sA/M4K7VjBdfE1
         e6+rWUa+MYCSe/osLksbxCdAuA6t594cVID6yio4p2NMW53qYna8CnQAkC42Lw+U7m0Y
         7TkG6qfiS+Xbhdjv+iCRt05ly9USwX3uDDanwBhgZ9FwOweVNm6D+XcaOaO/ufJFhUFw
         dialAk0tKPDFQvjn/gGzlhqvaO7JPbC/U3wZny9OT2C2lFpe9kuoCNT4aP1A0sOh9U1Q
         twEFuv4x1rmjkrU/QUyOaX2RKiqAjmM0ENbILTEgmxr1gn3lKAO6oxgVX0lSA5zAnls1
         1PiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=y83FKmfAevaqL/bT3eQ9Kizu2g5zyv6mjKfgMLLGBsI=;
        b=AGDEzs0m1IbBS7UIkw38ZTM1VqYG2CbU1RkblAPkGsY7agJ5igdA64fo4dfV0VlwnF
         8NcIZxg13fWvpZ866hWcqpKcTCClWawrrAeFHMqi9D4oyZuAMDhEAS64Sg/SzPnn0SJJ
         8WrFcubjv7FirM55FMg7p0f8jz969KGK1DZCb+MDjIOsn5SjH8gNKN0swU+eh3GeX/+k
         y+LSR4rrnWUdx66WLrpumcfWWU85m3DdGroWRPsop8TqRip1r5lO9Y/dZ66fB2n0IyXB
         N+dOx/7Qyf/wHMOpbk3YzGdF+Xc7IPR1kEE+grwoULJDFaDR6aJ2a0en01qWp3CYMqwu
         Lb/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ynW0Cd96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l127si2697452ybl.265.2021.01.22.13.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 13:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ynW0Cd96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l34PG-00032I-Nq
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 16:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34MB-0000VY-7o
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:40 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M8-0007K7-6Z
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:39 -0500
Received: by mail-lf1-x131.google.com with SMTP id o13so9616408lfr.3
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 13:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y83FKmfAevaqL/bT3eQ9Kizu2g5zyv6mjKfgMLLGBsI=;
 b=ynW0Cd96y7x+l/7G7ZuvhAafDiywFudoEgVor06Sbo/qmOBuKg/6ceoAFXrOwzn0qq
 YNgxDGKTsUZf78rksym/K7CqI+0ZpQQ8Mm/gJWPFridnL0edomEEm0NB5o6ZYJ3CFfHD
 cwjaBmKbCnlo+0Swi8RrWCfijstUAeL8S4HjD6Oq/IzLLNPrx7OT6b7O++/44ewVBgwM
 q+G/O8Ax/y81/eAQq3rtjPy4te+wU0QGeBNjfkyiVIM01wKqnUJg2iSw8m5jr/jfZ/pf
 tD9KGz5QBbdBxj+14fPECvwjKNdpNmYAn/y16kQw4VhvNIf4iIMch6Ogaoy77KxlZPP0
 kmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y83FKmfAevaqL/bT3eQ9Kizu2g5zyv6mjKfgMLLGBsI=;
 b=EbfXgCjRmrDAVIM6+sNqlqMQQ7WKjbDTKgua+g5wk45BbAsSH1HqLdTusCpEgs3wcj
 8wDyng5KO7gGakX/ueyijqoM4BPsCnFfmq33aHw0xnnXKxl+/4wuhSOq3qKZ2J8eLEPF
 CwkXnxlyBkDTEwkhYkb1xAtygrsHjAU+SNyedkKiykIuUkVp9+yXDvcQYwOYNe3mdzpb
 FxFSNfzCCMAu3WPC94frw+ijyp1VqJH7BbjWgfhSshD/Oum2wnCXV+5gQoIklZFdfrr7
 SvACQqbbaFTsB6qOPo0wi9Rx27DZFn6t/wmwCAGGS3eMqoyOL42FUF/WgqynNDl3Phn2
 dDNQ==
X-Gm-Message-State: AOAM530+n1zuFR1QC4/+k+LX9x15RgTODG7FGR9OtT+BDT/tS2Ufr92I
 jI2LB+9ufvowHczUf2GF8qg1tzaZrmqwqg==
X-Received: by 2002:a05:6512:2248:: with SMTP id
 i8mr3005375lfu.632.1611352354311; 
 Fri, 22 Jan 2021 13:52:34 -0800 (PST)
Received: from localhost.localdomain ([176.59.42.245])
 by smtp.gmail.com with ESMTPSA id a11sm1019890lfl.22.2021.01.22.13.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:52:33 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv9 3/3] arm-virt: add secure pl061 for reset/power down
Date: Sat, 23 Jan 2021 00:52:22 +0300
Message-Id: <20210122215222.8320-4-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122215222.8320-1-maxim.uvarov@linaro.org>
References: <20210122215222.8320-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x131.google.com
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
X-TUID: jLIHxKxMbKIU

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware). Connect it
with gpio-pwr driver.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 56 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  2 ++
 3 files changed, 58 insertions(+), 1 deletion(-)

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
index a135316741..bc99b5419d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
+    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -841,6 +842,43 @@ static void create_gpio_keys(const VirtMachineState *vms,
                            "gpios", phandle, 3, 0);
 }
 
+#define SECURE_GPIO_POWEROFF 0
+#define SECURE_GPIO_RESET    1
+
+static void create_secure_gpio_pwr(const VirtMachineState *vms,
+                                   DeviceState *pl061_dev,
+                                   uint32_t phandle)
+{
+    DeviceState *gpio_pwr_dev;
+
+    /* gpio-pwr */
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
+
+    /* connect secure pl061 to gpio-pwr */
+    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_RESET,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
+    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_POWEROFF,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-poweroff");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "compatible",
+                            "gpio-poweroff");
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-poweroff",
+                           "gpios", phandle, SECURE_GPIO_POWEROFF, 0);
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "status", "disabled");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "secure-status",
+                            "okay");
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-restart");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "compatible",
+                            "gpio-restart");
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-restart",
+                           "gpios", phandle, SECURE_GPIO_RESET, 0);
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "status", "disabled");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "secure-status",
+                            "okay");
+}
+
 static void create_gpio_devices(const VirtMachineState *vms, int gpio,
                                 MemoryRegion *mem)
 {
@@ -873,10 +911,19 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
 
+    if (gpio != VIRT_GPIO) {
+        /* Mark as not usable by the normal world */
+        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+    }
     g_free(nodename);
 
     /* Child gpio devices */
-    create_gpio_keys(vms, pl061_dev, phandle);
+    if (gpio == VIRT_GPIO) {
+        create_gpio_keys(vms, pl061_dev, phandle);
+    } else {
+        create_secure_gpio_pwr(vms, pl061_dev, phandle);
+    }
 }
 
 static void create_virtio_devices(const VirtMachineState *vms)
@@ -2008,6 +2055,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
+    if (vms->secure && !vmc->no_secure_gpio) {
+        create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2623,8 +2674,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
 static void virt_machine_5_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    vmc->no_secure_gpio = true;
 }
 DEFINE_VIRT_MACHINE(5, 2)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index abf54fab49..6f6c85ffcf 100644
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
@@ -127,6 +128,7 @@ struct VirtMachineClass {
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
+    bool no_secure_gpio;
 };
 
 struct VirtMachineState {
-- 
2.17.1

