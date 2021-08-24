Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2587941lfg;
        Tue, 24 Aug 2021 01:07:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSz70mid6KrdRT/YXp8sQl1ameDmlLtJzxV52Hm9WOfxth9e/XiUpdmSldmvt7SpaKT3VV
X-Received: by 2002:ad4:5b8b:: with SMTP id 11mr3494649qvp.51.1629792474740;
        Tue, 24 Aug 2021 01:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629792474; cv=none;
        d=google.com; s=arc-20160816;
        b=lCkvW1fJa4MWaPV4U+QkudxVqUUr5S5UkAfUPpC1JHVaN3VOLufOqr2UcqJk2FqGSu
         CjAQPUV4fKgDq1fypQkoLxl6lI0Ea/X5dZkGqRl5yp+M3AA92k118s6aC07ZuDYv6z0b
         0E5Myyo4rqsvROnoWVIE17wOdnMzzoCX3YRakbNxWLDrujQw4nL7V3DhMnMN7XNbXZeq
         7Igh9xJXUrbZQrb4KPN+BWYEW9ZA/mHSTIkavT8v9xWwQV9xCKGIqc/+7YqCUmHT4snA
         0dav8qOPDspDsDEhymHx0bFtvuzZSMJkWYle9VwEPNmxqqyploo8rpDR2D6f9D09Ux4i
         ka8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature:content-transfer-encoding:content-language;
        bh=488FdktC25b59shTkyydSjAZFwFXtIVI1NeYQtCarJM=;
        b=rXvIx3eRlpKkpx+FRWwa2Tu6mW9LCiHYejdW+7N/2rfNxRotIm/rvOLMk6I9Rljem/
         IBubldkRIXd3SWYdg/QVa6P00GHbeoB6S6A3kxY0QWzkrtPjrA1Corlt+885DiQoCShu
         7bg6evlgVGwB76NxsAhRiYeSvwQZ0RinenH/T7K6lJleW+brm2HyBFTNozm75oCNQDmD
         lQGm+xuv5+bmN74exLmg5T7mJKQTum3arIJBrAb+x1d0vvzSrVTYj6XgetjCN5qtOh0L
         KG0KTGFdzkkkUnKCvL2F7aoV3kjAI3jckjvZ7fB0KOO//HCw7W9HH/op+loGr1uzCjY8
         z1jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=E9+JFCsQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si8863409qtq.187.2021.08.24.01.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 01:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=E9+JFCsQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIRTO-00022M-1t
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 04:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRm-00087H-Hs; Tue, 24 Aug 2021 04:06:15 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:30469
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRk-0000rk-HA; Tue, 24 Aug 2021 04:06:14 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629792368; h=from:subject:to:date:message-id;
 bh=3DVtK3itrU9c0bVp5HnUYaNuJjxSEgrv/Tdtck0BBFs=;
 b=E9+JFCsQxY8fhTHyi45ziPDsddkIahna2x3n/FeRkhxsXzKYKiBYojizicgkLY6dUl3ienof0Vj
 F9I55M/nYMBaKnKExholyI5BQt+1AdXUen0stv1JkrAuY78E6TjoMLiGxPOmD1nPzRFn+ORTUi/2j
 R0+HhOnU2ouVSLW+qQA=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 16:06:07 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH v4 4/4] hw/arm/virt: Add PL330 DMA controller and connect
 with SMMU v3
Thread-Topic: [PATCH v4 4/4] hw/arm/virt: Add PL330 DMA controller and
 connect with SMMU v3
Thread-Index: AdeYvuPb5jrD2nkhTsC7HveRK1dFuw==
Date: Tue, 24 Aug 2021 08:06:06 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FABF6@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.182]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--7.254300-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j906IEoxqhfz

Add PL330 DMA controller to test SMMU v3 connection and function.
The default SID for PL330 is 1 but we test other values, it works well.

Signed-off-by: Li, Chunming <chunming.li@verisilicon.com>
---
 hw/arm/virt.c         | 92 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c3fd30e07..8180e4a33 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -143,6 +143,7 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_GIC_REDIST] =3D         { 0x080A0000, 0x00F60000 },
     [VIRT_UART] =3D               { 0x09000000, 0x00001000 },
     [VIRT_RTC] =3D                { 0x09010000, 0x00001000 },
+    [VIRT_DMA] =3D                { 0x09011000, 0x00001000 },
     [VIRT_FW_CFG] =3D             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
@@ -188,6 +189,7 @@ static const int a15irqmap[] =3D {
     [VIRT_GPIO] =3D 7,
     [VIRT_SECURE_UART] =3D 8,
     [VIRT_ACPI_GED] =3D 9,
+    [VIRT_DMA] =3D 10,
     [VIRT_MMIO] =3D 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] =3D 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] =3D 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -205,7 +207,7 @@ static const char *valid_cpus[] =3D {
 };
=20
 static const uint16_t smmuv3_sidmap[] =3D {
-
+    [VIRT_DMA] =3D 1,
 };
=20
 static bool cpu_type_valid(const char *cpu)
@@ -793,6 +795,92 @@ static void create_uart(const VirtMachineState *vms, i=
nt uart,
     g_free(nodename);
 }
=20
+static void create_dma(const VirtMachineState *vms)
+{
+    int i;
+    char *nodename;
+    hwaddr base =3D vms->memmap[VIRT_DMA].base;
+    hwaddr size =3D vms->memmap[VIRT_DMA].size;
+    int irq =3D vms->irqmap[VIRT_DMA];
+    int sid =3D vms->sidmap[VIRT_DMA];
+    const char compat[] =3D "arm,pl330\0arm,primecell";
+    const char irq_names[] =3D "abort\0dma0\0dma1\0dma2\0dma3\0dma4\0dma5\=
0dma6\0dma7";
+    DeviceState *dev;
+    MachineState *ms =3D MACHINE(vms);
+    SysBusDevice *busdev;
+    DeviceState *smmuv3_dev;
+    SMMUState *smmuv3_sys;
+    Object *smmuv3_memory;
+
+    dev =3D qdev_new("pl330");
+
+    if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
+        smmuv3_dev =3D vms->smmuv3;
+        smmuv3_sys =3D ARM_SMMU(smmuv3_dev);
+        g_autofree char *memname =3D g_strdup_printf("%s-peri-%d[0]",
+                                                   smmuv3_sys->mrtypename,
+                                                   sid);
+
+        smmuv3_memory =3D object_property_get_link(OBJECT(smmuv3_dev),
+                                memname, &error_abort);
+
+        object_property_set_link(OBJECT(dev), "memory",
+                                 OBJECT(smmuv3_memory),
+                                 &error_fatal);
+    } else {
+        object_property_set_link(OBJECT(dev), "memory",
+                                 OBJECT(get_system_memory()),
+                                 &error_fatal);
+    }
+
+    qdev_prop_set_uint8(dev, "num_chnls",  8);
+    qdev_prop_set_uint8(dev, "num_periph_req",  4);
+    qdev_prop_set_uint8(dev, "num_events",  16);
+    qdev_prop_set_uint8(dev, "data_width",  64);
+    qdev_prop_set_uint8(dev, "wr_cap",  8);
+    qdev_prop_set_uint8(dev, "wr_q_dep",  16);
+    qdev_prop_set_uint8(dev, "rd_cap",  8);
+    qdev_prop_set_uint8(dev, "rd_q_dep",  16);
+    qdev_prop_set_uint16(dev, "data_buffer_dep",  256);
+
+    busdev =3D SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, base);
+
+    for (i =3D 0; i < 9; ++i) {
+        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(vms->gic, irq + i))=
;
+    }
+
+    nodename =3D g_strdup_printf("/pl330@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compa=
t));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                    GIC_FDT_IRQ_TYPE_SPI, irq, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 4, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 5, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 6, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 7, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 8, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI);
+
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-names", irq_names,
+                     sizeof(irq_names));
+
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle)=
;
+    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
+
+    if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "iommus",
+                               vms->iommu_phandle, sid);
+        qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
+    }
+
+    g_free(nodename);
+}
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -2081,6 +2169,8 @@ static void machvirt_init(MachineState *machine)
=20
     create_pcie(vms);
=20
+    create_dma(vms);
+
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)=
) {
         vms->acpi_dev =3D create_acpi_ged(vms);
     } else {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index d3402a43d..f307b2658 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -72,6 +72,7 @@ enum {
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
+    VIRT_DMA,
     VIRT_FW_CFG,
     VIRT_PCIE,
     VIRT_PCIE_MMIO,
--=20


