Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp347786lfq;
        Thu, 14 Jan 2021 06:52:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2m2izMtFomvg92tzOZ7Mqg9YHbxwiWnIigrJnrVmrVhZVBRGJoi5+P39EvQk2VdrkPAxw
X-Received: by 2002:a25:3b93:: with SMTP id i141mr10945217yba.499.1610635939700;
        Thu, 14 Jan 2021 06:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610635939; cv=none;
        d=google.com; s=arc-20160816;
        b=vMwklrCJ9rgl/oUIFehkEwvUnN7nEmz+O/FOJODU/NN+9eeU0o1tPQTOBDo6QK9t8f
         8Q9nL92ej0JU0jFMautR1b9EGF7KkwMnuBVoZPbg7fO53dACyL9ApCqoL+jvSyRHXAz/
         FuqrIv8PCRduO6XD8Z0Y1iY1JTd3Qqefdas1eiXswMdbkdIzel70sr82QLVayuWsZFFp
         sUpMxck1vzVG+sIFPEBK0gwLqUyakf7pGCUXdFr/3VBmdzyYnt6VDum4i37a73hM1NYE
         WUGlWOgQ0TinRY0ffEX9W5ygbaeBmYfhF2lramL6DwNygAIAPjWiYfRUZ0ewNfHIYYXg
         isYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=GLJ1M8gnJdgfUFe1l9HibzCxyIIEXe/s/L5DY+OCXTc=;
        b=bEJYbk4JML/XSDGviGLAyDhn+wpd/i9xAUINFO+ZDRoA0bAzLAzZPhUZF9LAOouWMo
         j9seNzazhF/M8E1D6dK8pKFQayNeSsb7UegvPFIvJFcPGtXsp8PbHFFqRdqHhMFrEvSb
         NcE9HEMMsRc83CnNbtOqPgugKtyUHh9Whie39UQPXj4WU1rJ1mzDHdVG5BGAKELia1ld
         ZyHmAa8uTIvpMxCJTCzajcH9/2FJ05/FO9ifvB7GOKPtZMGGViDz8QA+h2f0Z8B6Z1hU
         OaKH+xcEmf0au5Z18epE2+3Td/QkrIVyf98sAsTJbIacDc31HUAs6ZDeNZc6eYOIN2Fe
         v96w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yccVeNTk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si5135305ybe.391.2021.01.14.06.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 06:52:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yccVeNTk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l03z1-0001cc-1F
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 09:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xT-0008HX-41
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:43 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:37119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xP-0003xp-Fy
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:42 -0500
Received: by mail-lf1-x135.google.com with SMTP id o17so8404576lfg.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GLJ1M8gnJdgfUFe1l9HibzCxyIIEXe/s/L5DY+OCXTc=;
 b=yccVeNTkX7JqO7D2fwGTGVFNEGanxgpg12WMFY3+1xzD+iVzhSVASjIOQ1eAqoS0k1
 WVwmrgVuQR1ZcX5BC21tfcN3Yzi2NBPqqppcvr4vURlmJh+7akNe/cCNxGHwiHIBK3bA
 WXS+dldLB4z+Ps63gSgR5Xpj1K+BPVG5jlrZIUuxXTxPwVnk6VutwzL0I0OxI8hzN1Yn
 /s8pILaPRJB+CCZVMCucfy7dKSpEYe+lo7Gi9CSj0CXnD2qPNvicC835UUJDNl4HHij+
 uwVBowAiDAkIgkHu+bllk1oNr98eWJkhaNgBUAjHgoyu5VyZP33pX4hsfwmviYk0KvkN
 XBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GLJ1M8gnJdgfUFe1l9HibzCxyIIEXe/s/L5DY+OCXTc=;
 b=FbN3Hv+c67db+g9ninXQJg3Kjg4zJhlfOw9iFYjyxrm7YxjBy//kXumL3bm31Q0soB
 BIcYVUnHeJBzqShosdtgmjLZieIFGy6KZxcJVG6I3FzHJ8Ro5LIOpyGxTpey5cfJA1J5
 MZoVg9Snzm57sI1XAuK+Q2LbUdIVIXOcM20eLn4+figV6CWxTLTN7Cly9+u7A11CO6zo
 BcznQFUACsuUYLfZbWjBD0HPkSC/ti2CI47LwNuF+jNYirl+fJnXXcRc2GxYbi7sX0EP
 h7YjGRgMOCEsfBDjulYpJGE8QA4tswbLQoRgSb+C6ux1I84BKed7hvEyf9bF6qQ+73kX
 n+TA==
X-Gm-Message-State: AOAM530GgJ3LtYc0TQJTGCo9Bvgxstxf2EDpMFgUIJlJdzd98v/kGpfN
 dlakkvZwlS9S9WMswqssKtPnEw==
X-Received: by 2002:a19:6a18:: with SMTP id u24mr3514564lfu.111.1610635837959; 
 Thu, 14 Jan 2021 06:50:37 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id p5sm567229lfj.295.2021.01.14.06.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:50:37 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv6 2/3] arm-virt: add secure pl061 for reset/power down
Date: Thu, 14 Jan 2021 17:50:31 +0300
Message-Id: <20210114145032.8457-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114145032.8457-1-maxim.uvarov@linaro.org>
References: <20210114145032.8457-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: j42ddU1ioxcS

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware). Connect it
with gpio-pwr driver.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  2 ++
 3 files changed, 37 insertions(+)

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
index 96985917d3..6f3ec15985 100644
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
@@ -864,6 +865,32 @@ static void create_gpio(const VirtMachineState *vms)
     g_free(nodename);
 }
 
+#define ATF_GPIO_POWEROFF 3
+#define ATF_GPIO_REBOOT   4
+
+static void create_gpio_secure(const VirtMachineState *vms, MemoryRegion *mem)
+{
+    DeviceState *gpio_pwr_dev;
+    SysBusDevice *s;
+    hwaddr base = vms->memmap[VIRT_SECURE_GPIO].base;
+    DeviceState *pl061_dev;
+
+    /* Secure pl061 */
+    pl061_dev = qdev_new("pl061");
+    s = SYS_BUS_DEVICE(pl061_dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
+
+    /* gpio-pwr */
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
+
+    /* connect secure pl061 to gpio-pwr */
+    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
+    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
+}
+
 static void create_virtio_devices(const VirtMachineState *vms)
 {
     int i;
@@ -1993,6 +2020,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio(vms);
     }
 
+    if (vms->secure && !vmc->no_secure_gpio) {
+        create_gpio_secure(vms, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2608,8 +2639,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
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

