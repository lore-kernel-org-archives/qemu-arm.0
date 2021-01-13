Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp282382lfq;
        Wed, 13 Jan 2021 01:42:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl9W7CfmhjTq1JuQoDPMVzZJVrsIKEVcmwtzgn0xpP1EL9fvhw9ivEZbCX2WjKEu/rtsZn
X-Received: by 2002:a25:d641:: with SMTP id n62mr2137484ybg.132.1610530958335;
        Wed, 13 Jan 2021 01:42:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610530958; cv=none;
        d=google.com; s=arc-20160816;
        b=cn7QDUKNggbMgjyoQWZChJP82wa3sW2W+ZuBci0lIRWgpgN8huAxaf0Hx+mEfsLCSM
         r1nVG1kvzM0XuXLTVwKCRmMvDrjDQrg8tlzRsc/HcS8gvO45R9h8Vx90/qJ7E453HhBQ
         oNCd0aX9Jv4vZaM5xdkxs+RO8tMHoEfuAMwdCGichaeJ2+FuNAZpKvld4uS/Ok5d0aPi
         ZV1EvZEZaSr9Plb5wA8qoCQZvWHxLgho3pBVlbKEZ6klo6oSV1C0D2dFY7PTn5POwawL
         QzLbKabiQRWrjORCE7eojjh8c6qstc4nN7UWaEYdFn91UtFrkJKTs1VAPc2LZ1ZCOLUh
         rYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=fFyVX6J1ILAOgA0Eulrp2aeUvo2NLh3SrrXtPKRjlKw=;
        b=CMeDNhGtObjxsJinbkQ4MvgdEA1P5YXlQVvDF3a+vcZfZQTVMSE+FEK5Y7fZlBDg0n
         CJR2Re1jS1+hFdQqRbuxuDGLrVCIjt3Lct4M3/3FnpNUVPYKqc/L980j8a11KMIgznY/
         1U0aprIp4WqpshoJc99OeNyuOxfn1Y9U4iAAXXPUrnnp3z7YgL4+sI+xzJgSeoK6rnWo
         BrGoHr7qGAw4PK04tHGgfc5RxTwjIyCbD90AH2r6itotLKnRFqL5BbaiVsb/NcnrSAap
         AsarADmFa/3mD4T2pu2Rm6QU/N4wjgOoMDEZxJR2eyGG4usXXPOYYLxYqjCx5Yjr6rmk
         yokw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SRuAK+Uv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p62si1699205yba.216.2021.01.13.01.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 01:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SRuAK+Uv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzcfl-0002f1-PY
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 04:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXr-0001BK-D5
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 04:34:29 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXp-0004Gt-PY
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 04:34:27 -0500
Received: by mail-lj1-x22f.google.com with SMTP id b10so1773680ljp.6
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 01:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fFyVX6J1ILAOgA0Eulrp2aeUvo2NLh3SrrXtPKRjlKw=;
 b=SRuAK+UvGGY611lzwj/Yq2QDDWB7JD4IDOk3uNMol1xARqXT+7/ochCNJd5VkLfBF+
 FeWJ7EsYFTt6wE84YSjfbS6rV4fJz6ZnvZFr6KlkcP8AylWmSR9hcKGCWOgEaCVrj2mt
 l2CWaOLO5nOa92C4LILviqDNurHJXRFrGNEMv3aYjDcLEVz+VxiSwI4EhG/20vbA+34X
 28TO1juult7kci9UHqzA/HEG4sfmkedQRJUvibMa49w0orQUoeieFOMgSigD4oLVptZA
 jDR+zs7pnbquxj6Z9t5d/Kbf5tezOnWv4yYP7s9O94rruDceIGSp3Xm/3e0Y7Xbn+6nT
 pB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fFyVX6J1ILAOgA0Eulrp2aeUvo2NLh3SrrXtPKRjlKw=;
 b=MFl4rZ9Q4Bw+lhJGAK5ClTJkrdRzelAGLtVcRScPauKNAd92l5oU4IDVW+gAsNKfN/
 LM1YlGkmc8QSMrNMrKw7jSgtbiNo+0CAXNNAMkhjAwRuwBpFaGgndHf+e/QhKGB4i4tr
 rdzUtEhy/J+37Y7smFdUNCCZx1nHa/GcBSit9bh+9o1GApzqYlZBl4xhBxQqGNK/BBlw
 md0/1+2nxTrjwLIiVtZJmLTM4pbBdmIJnPwF8CZ4RsDPfbrmxvCQwaSZRznF77y0eBW0
 jyybaYdz6+PzECun54ry3I89O538aCA4J7GV20VRyYBg1nyQQVg4zFVw/4LfxZTPhgxm
 ZA/w==
X-Gm-Message-State: AOAM530w0NVKWU29vm70n22tctOdr+2DCVyN6LBeLUSsnWXnQx1NTix8
 28n/TFi5pWybb6Q8dEClU2VVHxX7z5okxg==
X-Received: by 2002:a2e:9214:: with SMTP id k20mr539848ljg.45.1610530463883;
 Wed, 13 Jan 2021 01:34:23 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c3sm127472ljk.88.2021.01.13.01.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 01:34:23 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv5 2/3] arm-virt: add secure pl061 for reset/power down
Date: Wed, 13 Jan 2021 12:34:16 +0300
Message-Id: <20210113093417.11606-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113093417.11606-1-maxim.uvarov@linaro.org>
References: <20210113093417.11606-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22f.google.com
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
X-TUID: sU5+vjg1NPiq

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
index 96985917d3..d38a7d5d2f 100644
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

