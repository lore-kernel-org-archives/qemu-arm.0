Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3606866lfq;
        Tue, 12 Jan 2021 06:39:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfamghhELCPN1YD6iJHAhlWRWQsvjEqtTvEPXCD4NJ4S+CTRWk+IqgugPQVbOF8ybVd9yV
X-Received: by 2002:a25:d341:: with SMTP id e62mr6828063ybf.495.1610462349583;
        Tue, 12 Jan 2021 06:39:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610462349; cv=none;
        d=google.com; s=arc-20160816;
        b=JVrADd/VDGJqcwojheJvrL8Q5Mw1HyBarZ0xiapRvtf1VoB8LluPKA7t4VpdHD8Vkc
         /cO143+6zBQEXTpuIhSMM0D4/ntF0Gk+w8ejDtohsY7gftgQUFDtjkAFx5yRhYHRM3BO
         yFM8H4uhrTVYB8OE1eGcuvRbo7dRQ+h8F5PVtK0lyaZvyQB3//WjHKmJrjCf4GcvuNRD
         EuPXFtXEDWFer7o5D/YaO36BbxCAKXU9aGsXtaGvDODT2pBkRyjf9yxqOCHIB7HtYcMN
         kYfzh5ie1GtjqzF5EoOQ1Sbev1vd2H6KoaKBy81YpnEdOlK0XK1rDpEEpFhjCZJnVr9g
         0QQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=QCSkSvV5HRs0ULOp7vuKE7k9WF5Xyng96RKUNvE/TUM=;
        b=pi5xM3jUo5kpyVThC7gg+zNLdN6qb5/uiQgeKwH/th1tu5CC9sUqE9FfG+RoO/bDFg
         fH1Js4jygK3mgeQcJvVpdxA7Ouaf/aJ65fVQ8NqXeuk+9NNDBhs3Aps+l+ifM15Ydinj
         kEDlOLWcyXEmblnrmz7wb/yVtdDXBZ3BsaSFnWzPR99swK0Fv6AN6ZAaogOBzErey5Vh
         ruFj0Pg2RmMUhdwfOrQEDUjCdvyOQrjiaShdjNoZyh3Thds4PZD7JG/5ccQQpAukU8dv
         EfKCyqkuYhdxFigfYfbxkwd8zeVbMTPEXP2AM6ucv5l2vFMViyfhbsTbc6qv2irv4uOI
         8vqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tgMgHDpU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si2975563ybl.171.2021.01.12.06.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 06:39:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tgMgHDpU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzKpA-0004ii-V8
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 09:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhS-0006Dv-Ev
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 09:31:11 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhO-0004fj-EU
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 09:31:10 -0500
Received: by mail-lj1-x22b.google.com with SMTP id y22so3030766ljn.9
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QCSkSvV5HRs0ULOp7vuKE7k9WF5Xyng96RKUNvE/TUM=;
 b=tgMgHDpUWkiKkpPbA5daH9ZlFpD91A1MeXp5VyAwmDGM/n1ugUxSAB3NekkkiVe9+v
 Nk/Wi1YgrPRW09n7Ht8aftDtkskvt3hW7iWzJeYClm5jdkG2A0YOW8rQe9EC0N1fGwHe
 ILjdR1LYNqeT2Wtsmka3cOmqE2CgCUL+sIQoxQ9um5lRQnEM85ZD0E8eMK6sIKvRsFX0
 NajjQek+WKze7BBZM+JbhYGtrUKb0o30Gfyw4swZxftSO2GOWQNxR8aYHejiKfLzDzUM
 ESVGK+HVY1i97xAejZOgdCCA7T1S9spNJP+FgEy8wkvcj7392ENm+2z9k9igvOAmi1v2
 Ug6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QCSkSvV5HRs0ULOp7vuKE7k9WF5Xyng96RKUNvE/TUM=;
 b=KMSDGFKKd1PJXnrkaqeHc9p9jZYKxQ9m6Cskvx4Kk/OdaWm0g15a3Pg2oQqypZ3LnX
 3jKK6OIuGmU8BQ/XVkeu4FIhNNvwiwFIiFf1ZwdLeH5NbhA9Vt3puMAfRJpb2SXIG3S4
 XRqQatHOTnZtesPvDuGhh7HbE9JB91okKGZC0rjTy1KgOnG09uLKYwnG8Tm/AZqUWT0s
 j36mRqUzcBS2gwaJedEMWZpmRf1f0pXbyd3A2d0mBYrG4XdawFCsw1sBc3KTFxmMqfHP
 JE4NXGcbH4W689efdsm6tStqL9NEjcvX0HDAEAuURQm6dvolN/EIdEEdqO0zEY58UPxa
 Wlbg==
X-Gm-Message-State: AOAM530TwcHmQJJXpw46UabMRI0wNXdKlvmnTOHSh9Menp642i1YAExc
 Ra4/c63tHTRCGrpgQse4OOrFIoHzmlYX4w==
X-Received: by 2002:a2e:7307:: with SMTP id o7mr2110422ljc.452.1610461864211; 
 Tue, 12 Jan 2021 06:31:04 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c24sm365499ljn.116.2021.01.12.06.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:31:03 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
Date: Tue, 12 Jan 2021 17:30:58 +0300
Message-Id: <20210112143058.12159-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112143058.12159-1-maxim.uvarov@linaro.org>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22b.google.com
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
Cc: peter.maydell@linaro.org, Maxim Uvarov <maxim.uvarov@linaro.org>,
 f4bug@amsat.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GlwBUXNlrd8Y

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware). Connect it
with gpio-pwr driver.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 40 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  3 +++
 3 files changed, 44 insertions(+)

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
index 96985917d3..19605390c2 100644
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
 
+    if (vms->secure && vms->secure_gpio) {
+        create_gpio_secure(vms, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2567,6 +2598,12 @@ static void virt_instance_init(Object *obj)
         vms->its = true;
     }
 
+    if (vmc->no_secure_gpio) {
+        vms->secure_gpio = false;
+    }  else {
+        vms->secure_gpio = true;
+    }
+
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
@@ -2608,8 +2645,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
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
index abf54fab49..a140e75444 100644
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
@@ -136,6 +138,7 @@ struct VirtMachineState {
     FWCfgState *fw_cfg;
     PFlashCFI01 *flash[2];
     bool secure;
+    bool secure_gpio;
     bool highmem;
     bool highmem_ecam;
     bool its;
-- 
2.17.1

