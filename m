Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4075846lfq;
        Wed, 20 Jan 2021 01:31:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmM/OYGOAPA3AMQvUOXIkO9DXKxrtJ+S1QUzc2GmefsXmIx9cQvmjItNsEO7uOJKL72vTM
X-Received: by 2002:a25:1046:: with SMTP id 67mr12553375ybq.220.1611135069763;
        Wed, 20 Jan 2021 01:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611135069; cv=none;
        d=google.com; s=arc-20160816;
        b=cvPyzAQjdG/N+RxNqxgOazbYFOZdrMwMgfZU545pM265bIjFMaNixBhds/tum8J3HJ
         9Hb29Z5Ip7tSkbJRdfjc2YpLv2GYCsl8P8CifTxU2S9U3A/cpod+uP48kwpluH0JCv1q
         YikkvEKoRduHgzRzo6TbKep2fd138+G9G9XvRg9FyhDwfMPSj/BiKbrXyhjUNaV6L9Et
         UXAEhn8wAU9b/AzoKoEGnEI5L8h7i0mB7tisFAtoRUcsI8KbGI11dVEBw8WoEG+ah5aB
         ogpgEFlHyrHsseMRotoSBPcdODUCwG1J4JY7wVjZu53DGPh9WvBMpUY01kIw0gCFDq0w
         w8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=nyATO8LViNbtJAlpgYG4nBlTtGVbfXPoadAOe5B+tpw=;
        b=R4zt6RTXhxAOzHDQUopEafD/B6B9uZi3MfhvS9PcKhC7q1MNJoAIbLmWwRibUeRtBs
         MxcS6sJyj62JdAikslwHyTIDltC5DU+6AUGDqYJ7dWrvCH26blg9/WSIhbTOoNlcl7UU
         4iiX6bugxaNuPqptG7MDlkPHV2/25o1334dDH86Ch1ybpzO6r4IiOY/14QT5U2/b79Y1
         1U2ZhyeQIdXfOZD2e1/3mo9As6k1/w3cJ6Q00R8irxAkYdNdZw5MRRMwzFugqjFrC9+M
         rCGzEvR43Nt0VWqZ2NiX/r0F4xK45s0O4hIUxkj60rG/i+NdsN02SXzKNdUP7NUtwbMB
         JKMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FeHkgiFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si94528ybe.106.2021.01.20.01.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 01:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FeHkgiFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l29pV-0003mX-4l
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 04:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mU-0000wD-AR
 for qemu-arm@nongnu.org; Wed, 20 Jan 2021 04:28:02 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:41664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mQ-00056F-HT
 for qemu-arm@nongnu.org; Wed, 20 Jan 2021 04:28:02 -0500
Received: by mail-lf1-x131.google.com with SMTP id s26so33160820lfc.8
 for <qemu-arm@nongnu.org>; Wed, 20 Jan 2021 01:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nyATO8LViNbtJAlpgYG4nBlTtGVbfXPoadAOe5B+tpw=;
 b=FeHkgiFL+Fqz/wKvODdXMXYqEbs8/4CqVnO+3nx31pdBGfH2tCQTLcS1kXkmvZT5sa
 rypEJZ3HxEDcvwC8X3SfbXXPUT1GZfSq/mEScbw73g0f9DGHwToS1O9E6dp2QkJ3nJH0
 p4XqvLsP9azFOrJnmur9JjmELvj//HmY1TW7SRo3v14fgEnRiH6D6o/9y+TRBboxaaRz
 aittoJmJnRcMsNyJesNrAKYBY+RA7EI88mmFKJaQFpvhpNIYYIGwIqhT7Cr95gcdy/e/
 paX5zk8pp8/YXz5LHbdPE7UIrkilfOHiW4jCa3fWoOB+XOpzYB6qcHX1CQ1aRpwW/tzq
 RT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nyATO8LViNbtJAlpgYG4nBlTtGVbfXPoadAOe5B+tpw=;
 b=cWmXWZfaTJy3v84jRqxFEq/aMr8oDKRNMRLdfi8TNtyynnKZd/xPNuBSE07EKMB/qw
 NzNZi55Tl0rlQJwcfcW+0uERGXCqPLceCgJxk43T+V3ItRzaukVshBdqUUf9TKeX77JF
 H3dI/WuWY4rypckDQGmjezTxR/D5BaYfUtHYYFJrzH0Wg8YuDHoQW7Q/PmsImzb47V0I
 DOZjjD8UP6BqzMKM79Cokpy9fnHWlwtF1g6zPMBXY2Okc6UY5bfUsgxMMyvc4T48hOxv
 CvOfbSgxlkyaZNibTx5o7637sFnZR5SZDmUiHOvFiPYfxILS1bC25TnggVjZIwqmvWD2
 KUMg==
X-Gm-Message-State: AOAM531cdMyIbZGAsMH8ztlTpW4l0K/fUgyEkm5pe1wfgPWFApILRYAg
 jwKSS1vIDcDPTinsgyQ4js6N5RRdvo8FbQ==
X-Received: by 2002:a19:7ed2:: with SMTP id z201mr1918924lfc.310.1611134876232; 
 Wed, 20 Jan 2021 01:27:56 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id r81sm147479lff.215.2021.01.20.01.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:27:55 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
Date: Wed, 20 Jan 2021 12:27:48 +0300
Message-Id: <20210120092748.14789-4-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120092748.14789-1-maxim.uvarov@linaro.org>
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
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
X-TUID: pjQqL6tcq5l9

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware). Connect it
with gpio-pwr driver.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  2 ++
 3 files changed, 50 insertions(+)

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
index c427ce5f81..060a5f492e 100644
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
+#define SECURE_GPIO_REBOOT   1
+
+static void create_gpio_pwr(const VirtMachineState *vms,
+                            DeviceState *pl061_dev,
+                            uint32_t phandle)
+{
+    DeviceState *gpio_pwr_dev;
+
+    /* gpio-pwr */
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
+
+    /* connect secure pl061 to gpio-pwr */
+    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_REBOOT,
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
+                           "gpios", phandle, SECURE_GPIO_REBOOT, 0);
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "status", "disabled");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "secure-status",
+                            "okay");
+}
+
 static void create_gpio_devices(const VirtMachineState *vms, int gpio,
                                 MemoryRegion *mem)
 {
@@ -883,6 +921,8 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     /* Child gpio devices */
     if (gpio == VIRT_GPIO) {
         create_gpio_keys(vms, pl061_dev, phandle);
+    } else {
+        create_gpio_pwr(vms, pl061_dev, phandle);
     }
 }
 
@@ -2015,6 +2055,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
+    if (vms->secure && !vmc->no_secure_gpio) {
+        create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2630,8 +2674,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
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

