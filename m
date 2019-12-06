Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1032631lff;
        Fri, 6 Dec 2019 09:21:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7sNTrLWzZGLEpPOFhHrlZZlaz+NrBHJsLaPwnugTJS6+fOO7FG+3dRhvFZZLngNIZMa4u
X-Received: by 2002:aed:3fce:: with SMTP id w14mr14458020qth.0.1575652876752;
        Fri, 06 Dec 2019 09:21:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575652876; cv=none;
        d=google.com; s=arc-20160816;
        b=wmVJOq4fWbZU9uoEYP/vuaWKcovQ1a4SXSpvfqi3l81O4uJKUxRtJw0jpMu1lvgyA5
         T3cUF9lm8CIpLCvTp3s+12/2skEvpHdLp6x4pMade3bxuk1vsK0VQvhgvOVIxg5A0M/B
         gWTLtSeggsjY5DW4/DbAu6pM4CZAf3S79oTNo8qgNFHRkq2/RUorbBDD7x/qMfagGSeY
         caIVxJR9g6pOG7wCEGE75WFmQ16RdwF2YKWRzKkuNJ582jjLKOIQ4kQc3c95WXvb1mwF
         dThkf2vH/DOSMGo4H9ElBDJs+y30KhQBTK34/UBGuZzwcIQmL9TsKBiuZxHxNZie2NMC
         TYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LOn4/rsQbtWBKdgDyXeGLcG/9R2mNlOXmomdSUKqcV0=;
        b=DD7ZNFry+hFthkdIndpKLGmMtPhcMZyibx7O8q//zwFRcUrRAlWs/e6FvwL1xREgLV
         aYW2ZlhvKrJSuLppr0KYH7Xe6vKY9hGR/bpowsbfPGKP7pHo8m3KKwpHPoAtRLDmb222
         Q5romvSCThjIweN5L9dj5NIbEzk5oTHfyhuFoD3MLOt77PAL67euDPPltxtiOe9TlS9k
         FhQ/CyL9o8v1zzVx0KuuF8T5NmcqQozuIb9Y2E1IninPRfrxBqifgdKZ0k3UUdJ8iTiP
         cLPpx9g4HK2UWJLpiGDmuFA4JszTTOJlyp++NxMe3s3/ofCzViHxiQrkhvW7gnGUiqrl
         4t6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HmH5oSYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si9445537qkf.364.2019.12.06.09.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 09:21:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HmH5oSYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idHI3-000329-Ne
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 12:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1idGNw-0001nW-V2
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 11:23:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1idGNv-0001lV-3c
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 11:23:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28344
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1idGNu-0001kK-Rx
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 11:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575649394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LOn4/rsQbtWBKdgDyXeGLcG/9R2mNlOXmomdSUKqcV0=;
 b=HmH5oSYuqssmhvT6m4wOzqeplpvzw8X3I7Ctdrbtem45b0iexQec+WzUpvbFoK3gfiqB8l
 WflbeEnlQnCrx9wdndgQ12GtsQCuqy2MoINlo1CWWVQDG3JQq13Oo2YRPBJVIc43uBnqij
 wcArj0pDKclXyJlr71qFUkW7O9et1n8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-3_OFbeCnPamw2S0sF3uzJg-1; Fri, 06 Dec 2019 11:23:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C7761005512;
 Fri,  6 Dec 2019 16:23:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-212.brq.redhat.com [10.40.204.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8FFE6EE3B;
 Fri,  6 Dec 2019 16:23:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm/sbsa-ref: Simplify by moving the gic in the machine
 state
Date: Fri,  6 Dec 2019 17:23:03 +0100
Message-Id: <20191206162303.30338-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3_OFbeCnPamw2S0sF3uzJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OtBsNYxKjlKq

Make the gic a field in the machine state, and instead of filling
an array of qemu_irq and passing it around, directly call
qdev_get_gpio_in() on the gic field.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: make DeviceState *gic a field in SBSAMachineState (Peter)
---
 hw/arm/sbsa-ref.c | 86 +++++++++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 27046cc284..5853bdee5c 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -89,6 +89,7 @@ typedef struct {
     void *fdt;
     int fdt_size;
     int psci_conduit;
+    DeviceState *gic;
     PFlashCFI01 *flash[2];
 } SBSAMachineState;
=20
@@ -328,10 +329,9 @@ static void create_secure_ram(SBSAMachineState *sms,
     memory_region_add_subregion(secure_sysmem, base, secram);
 }
=20
-static void create_gic(SBSAMachineState *sms, qemu_irq *pic)
+static void create_gic(SBSAMachineState *sms)
 {
     unsigned int smp_cpus =3D MACHINE(sms)->smp.cpus;
-    DeviceState *gicdev;
     SysBusDevice *gicbusdev;
     const char *gictype;
     uint32_t redist0_capacity, redist0_count;
@@ -339,25 +339,25 @@ static void create_gic(SBSAMachineState *sms, qemu_ir=
q *pic)
=20
     gictype =3D gicv3_class_name();
=20
-    gicdev =3D qdev_create(NULL, gictype);
-    qdev_prop_set_uint32(gicdev, "revision", 3);
-    qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
+    sms->gic =3D qdev_create(NULL, gictype);
+    qdev_prop_set_uint32(sms->gic, "revision", 3);
+    qdev_prop_set_uint32(sms->gic, "num-cpu", smp_cpus);
     /*
      * Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec=
).
      */
-    qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
-    qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+    qdev_prop_set_uint32(sms->gic, "num-irq", NUM_IRQS + 32);
+    qdev_prop_set_bit(sms->gic, "has-security-extensions", true);
=20
     redist0_capacity =3D
                 sbsa_ref_memmap[SBSA_GIC_REDIST].size / GICV3_REDIST_SIZE;
     redist0_count =3D MIN(smp_cpus, redist0_capacity);
=20
-    qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
-    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
+    qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
+    qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count=
);
=20
-    qdev_init_nofail(gicdev);
-    gicbusdev =3D SYS_BUS_DEVICE(gicdev);
+    qdev_init_nofail(sms->gic);
+    gicbusdev =3D SYS_BUS_DEVICE(sms->gic);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
     sysbus_mmio_map(gicbusdev, 1, sbsa_ref_memmap[SBSA_GIC_REDIST].base);
=20
@@ -383,15 +383,15 @@ static void create_gic(SBSAMachineState *sms, qemu_ir=
q *pic)
=20
         for (irq =3D 0; irq < ARRAY_SIZE(timer_irq); irq++) {
             qdev_connect_gpio_out(cpudev, irq,
-                                  qdev_get_gpio_in(gicdev,
+                                  qdev_get_gpio_in(sms->gic,
                                                    ppibase + timer_irq[irq=
]));
         }
=20
         qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",=
 0,
-                                    qdev_get_gpio_in(gicdev, ppibase
+                                    qdev_get_gpio_in(sms->gic, ppibase
                                                      + ARCH_GIC_MAINT_IRQ)=
);
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
-                                    qdev_get_gpio_in(gicdev, ppibase
+                                    qdev_get_gpio_in(sms->gic, ppibase
                                                      + VIRTUAL_PMU_IRQ));
=20
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_=
IRQ));
@@ -402,13 +402,9 @@ static void create_gic(SBSAMachineState *sms, qemu_irq=
 *pic)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
-
-    for (i =3D 0; i < NUM_IRQS; i++) {
-        pic[i] =3D qdev_get_gpio_in(gicdev, i);
-    }
 }
=20
-static void create_uart(const SBSAMachineState *sms, qemu_irq *pic, int ua=
rt,
+static void create_uart(const SBSAMachineState *sms, int uart,
                         MemoryRegion *mem, Chardev *chr)
 {
     hwaddr base =3D sbsa_ref_memmap[uart].base;
@@ -420,15 +416,15 @@ static void create_uart(const SBSAMachineState *sms, =
qemu_irq *pic, int uart,
     qdev_init_nofail(dev);
     memory_region_add_subregion(mem, base,
                                 sysbus_mmio_get_region(s, 0));
-    sysbus_connect_irq(s, 0, pic[irq]);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
 }
=20
-static void create_rtc(const SBSAMachineState *sms, qemu_irq *pic)
+static void create_rtc(const SBSAMachineState *sms)
 {
     hwaddr base =3D sbsa_ref_memmap[SBSA_RTC].base;
     int irq =3D sbsa_ref_irqmap[SBSA_RTC];
=20
-    sysbus_create_simple("pl031", base, pic[irq]);
+    sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic, irq));
 }
=20
 static DeviceState *gpio_key_dev;
@@ -442,13 +438,14 @@ static Notifier sbsa_ref_powerdown_notifier =3D {
     .notify =3D sbsa_ref_powerdown_req
 };
=20
-static void create_gpio(const SBSAMachineState *sms, qemu_irq *pic)
+static void create_gpio(const SBSAMachineState *sms)
 {
     DeviceState *pl061_dev;
     hwaddr base =3D sbsa_ref_memmap[SBSA_GPIO].base;
     int irq =3D sbsa_ref_irqmap[SBSA_GPIO];
=20
-    pl061_dev =3D sysbus_create_simple("pl061", base, pic[irq]);
+    pl061_dev =3D sysbus_create_simple("pl061", base,
+                                     qdev_get_gpio_in(sms->gic, irq));
=20
     gpio_key_dev =3D sysbus_create_simple("gpio-key", -1,
                                         qdev_get_gpio_in(pl061_dev, 3));
@@ -457,7 +454,7 @@ static void create_gpio(const SBSAMachineState *sms, qe=
mu_irq *pic)
     qemu_register_powerdown_notifier(&sbsa_ref_powerdown_notifier);
 }
=20
-static void create_ahci(const SBSAMachineState *sms, qemu_irq *pic)
+static void create_ahci(const SBSAMachineState *sms)
 {
     hwaddr base =3D sbsa_ref_memmap[SBSA_AHCI].base;
     int irq =3D sbsa_ref_irqmap[SBSA_AHCI];
@@ -471,7 +468,7 @@ static void create_ahci(const SBSAMachineState *sms, qe=
mu_irq *pic)
     qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(sms->gic, =
irq));
=20
     sysahci =3D SYSBUS_AHCI(dev);
     ahci =3D &sysahci->ahci;
@@ -484,16 +481,16 @@ static void create_ahci(const SBSAMachineState *sms, =
qemu_irq *pic)
     }
 }
=20
-static void create_ehci(const SBSAMachineState *sms, qemu_irq *pic)
+static void create_ehci(const SBSAMachineState *sms)
 {
     hwaddr base =3D sbsa_ref_memmap[SBSA_EHCI].base;
     int irq =3D sbsa_ref_irqmap[SBSA_EHCI];
=20
-    sysbus_create_simple("platform-ehci-usb", base, pic[irq]);
+    sysbus_create_simple("platform-ehci-usb", base,
+                         qdev_get_gpio_in(sms->gic, irq));
 }
=20
-static void create_smmu(const SBSAMachineState *sms, qemu_irq *pic,
-                        PCIBus *bus)
+static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
 {
     hwaddr base =3D sbsa_ref_memmap[SBSA_SMMU].base;
     int irq =3D  sbsa_ref_irqmap[SBSA_SMMU];
@@ -507,11 +504,12 @@ static void create_smmu(const SBSAMachineState *sms, =
qemu_irq *pic,
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i =3D 0; i < NUM_SMMU_IRQS; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
+                           qdev_get_gpio_in(sms->gic, irq + 1));
     }
 }
=20
-static void create_pcie(SBSAMachineState *sms, qemu_irq *pic)
+static void create_pcie(SBSAMachineState *sms)
 {
     hwaddr base_ecam =3D sbsa_ref_memmap[SBSA_PCIE_ECAM].base;
     hwaddr size_ecam =3D sbsa_ref_memmap[SBSA_PCIE_ECAM].size;
@@ -555,7 +553,8 @@ static void create_pcie(SBSAMachineState *sms, qemu_irq=
 *pic)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
=20
     for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
+                           qdev_get_gpio_in(sms->gic, irq + 1));
         gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
     }
=20
@@ -574,7 +573,7 @@ static void create_pcie(SBSAMachineState *sms, qemu_irq=
 *pic)
=20
     pci_create_simple(pci->bus, -1, "VGA");
=20
-    create_smmu(sms, pic, pci->bus);
+    create_smmu(sms, pci->bus);
 }
=20
 static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size=
)
@@ -598,7 +597,6 @@ static void sbsa_ref_init(MachineState *machine)
     bool firmware_loaded;
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
-    qemu_irq pic[NUM_IRQS];
=20
     if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
         error_report("sbsa-ref: CPU type other than the built-in "
@@ -695,22 +693,22 @@ static void sbsa_ref_init(MachineState *machine)
=20
     create_secure_ram(sms, secure_sysmem);
=20
-    create_gic(sms, pic);
+    create_gic(sms);
=20
-    create_uart(sms, pic, SBSA_UART, sysmem, serial_hd(0));
-    create_uart(sms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
+    create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
+    create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
     /* Second secure UART for RAS and MM from EL0 */
-    create_uart(sms, pic, SBSA_SECURE_UART_MM, secure_sysmem, serial_hd(2)=
);
+    create_uart(sms, SBSA_SECURE_UART_MM, secure_sysmem, serial_hd(2));
=20
-    create_rtc(sms, pic);
+    create_rtc(sms);
=20
-    create_gpio(sms, pic);
+    create_gpio(sms);
=20
-    create_ahci(sms, pic);
+    create_ahci(sms);
=20
-    create_ehci(sms, pic);
+    create_ehci(sms);
=20
-    create_pcie(sms, pic);
+    create_pcie(sms);
=20
     sms->bootinfo.ram_size =3D machine->ram_size;
     sms->bootinfo.nb_cpus =3D smp_cpus;
--=20
2.21.0

