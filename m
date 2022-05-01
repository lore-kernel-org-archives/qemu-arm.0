Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp275656lfj;
        Sun, 1 May 2022 11:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSUT6PmJ+jwBE34FCxdAoOmHPln9SSFA5gSvQKQgJ4VKqnWKdsAFyDMjd+dbz0L5AhI2k0
X-Received: by 2002:a05:6214:20eb:b0:446:6ffe:7237 with SMTP id 11-20020a05621420eb00b004466ffe7237mr7034613qvk.29.1651428479540;
        Sun, 01 May 2022 11:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651428479; cv=none;
        d=google.com; s=arc-20160816;
        b=HkbvrmbLREpmI8txh3N0/gp/auCEmPm+PNDFhfujuDgp6B4ij6xhEZ+DCajJIuMXSF
         tawjAJ6UEK8f2SC8s6oMYQgQfFCs6dsY6CMbrl+kP1X4G63QYF9wVJ+qGXV4q/QSTmJS
         Y9UhreoKiE5rbNLZby1ea9fMwI5Ljz0k22MFXEcwX5xovl9aBTSCsJQwZZtipaM/SVBI
         jTb1Yfz0c0Bd4+nFroHcM7gI/rs3jD2Bqwd/+Ox9WkXj8R0gczZEPR2Lxgl4BQRrs+s0
         6qr/eBY4+HFqGQSS+TM0yfLEJ0Hwlz13E2GS9MR2DTGw+lZInPlThFlNZywH4aASKsWP
         jAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=FsFFMghFPIVUtc/RNeYhPbcvOSmhPRly+W3PnnOdRqs=;
        b=i3psdD2AHo338Eq5wFg+JeCik+3tx46bd2n+RIRVjMmW9JWwS05jxyatB//guxakNJ
         +v4HdwTpmVBLduvNPeMP4tK3W3vfz8NPJndhFSRocNt40HR4EJfNMTS0liMa6e9yznzO
         GrqdhSECNEs6LXHu5ZvILFUWWSgHcl0RIBDss32wJgZ8rveqKMf0WHFBgHCRSgdAQbBL
         qEMzpTo9hooe8FvE5ZapkjILMGt8D19XIEdaAvt+6uj4MANM3gCLRy0TC2NZvimP+UEY
         Dd5QMqkINjPu4pjFVJtOMQR7i5Y7lma94j4HEDOE48gTuo8yhI4QKkB3SQm8g0z8q8wJ
         J12w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=R4KB6B3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z140-20020a376592000000b0069fd3904aedsi911935qkb.643.2022.05.01.11.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 May 2022 11:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=R4KB6B3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlDzC-0007jO-R5
	for alex.bennee@linaro.org; Sun, 01 May 2022 14:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@web.de>)
 id 1nlDyS-000734-0N; Sun, 01 May 2022 14:07:12 -0400
Received: from mout.web.de ([212.227.15.14]:48199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan.kiszka@web.de>)
 id 1nlDyQ-00081M-1t; Sun, 01 May 2022 14:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1651428426;
 bh=EK+Nd3HrCu2Q3vhwZTo952T/A31WqzQV30a1i1wUlsU=;
 h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
 b=R4KB6B3SVUm+oSHCzPYmmqyFpePPKJrc+Q3eODZ77Wn5Uq14e19JdFjwNXh19yg5p
 /svHvLwbpdfxUr4237sp6jEXYOST17L7gRc/B4seJFc5WAKRZUfy0iG2Q5ltsubKHA
 ertKIkSaAzMnhNTuIgbasZenGPuzq4B8MvyhnvS8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.102.122]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQyl-1nMjDN1pJT-00Y5EL; Sun, 01
 May 2022 20:07:06 +0200
Message-ID: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
Date: Sun, 1 May 2022 20:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] hw/arm: virt: Add SBSA watchdog
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L68wGUAjY68kk+kubslSaDs/2FMLWO24Q6qEapqrKSVattMiWA4
 S9BwZ32D9gsOEUaPZMsY4Log7byy26BqIZZhgMGOKqh6fWfHlOwzJQnkj9TUGYvaH0dMny5
 zRuUch5LCuTFcac71rDNSFpCEE+OjED1zAUBE/b2xulFAujBc36BiCYLw/5oCUJuC1vTs85
 FPGRU4otRAvY1f3jSsNQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1yeS6MU6+E8=:8qKvD1bhYJTb031LBko+lC
 YfZwtBXJFhNqEZQppx+R/cnixuoFkdzZjMy2g0DMkOpQ6WN52QggEZisNtypg2omELfRfpnTq
 mNXYr+QUrtgMY7mctqzAgiDczYFvOh1daz+QZA6RPazeVZaeWoa35VsbRsPQJlg5Wwrioy2Im
 XZ24GC+MUxPqDyGBaXSX4PK1AT5Mpzw5ZmWro/H3RDkjSvSjx4E4DH2uNEI+Vmn+jfkA0/IVf
 /bRSsAs7Wcn5YhIa0qFtf1AjKW5+YP94YEDCUUjsEZS99eU/2eB8JzdBRfAIpR2kJmiDhJgxb
 kZKbo5rStmJwFpgq5rfAEfRMBaxiQ3rC+63C+z9yqQM8QdYmlkUz27YMjRvMd3EO+G1hmsZGP
 1LGNYN63QIRUy/dWaVDnonfULEatErUOmHcWx4OBiZmfdJiyh+ifni153hO3nXWghSU6+QH0s
 I22AP20QB0xDm6hIpP7fQWEfTucd/4cM1H3RVN+XfIselWmi407ccfd7Y6eZZxcqO2CRoeXNg
 iaqRQfNmIttsbL6HcUTU5wS45s/C9t5gOmUTLUHrPYfFxpQUOQt9CBgXrhYdcQNirK1rVijSW
 rbTFFbfxQoWlbPU0qdZiFaL48Yp/yOD/k9Gpt5MmVVUNP/+phRyvxma3vYmMzE2iagP6ISsuC
 p3v3xK39WE4T553w5Ez3sFkA6xLMzSeWJrmK02waljyKR/LFf2RWpCYiOgtvZ322I7P4gATjS
 GPRooU3DH5wW7VfNh3FKPttAr0APxZNVpGwjOTG6W0gb6h8ilPkqMjdyu0gd9K61NiTfeRlrS
 2lLGfdOxsTqcxcowPT+jykzTlebQYEiEKhiLfnS2WFPSr+Fq4XHdYf5uRxtV9K8adjD5mWnUQ
 rXjw/CIdyd40Ix2MTx5/8CWX6xuomxrYcs+gX6H1ywatca8hXoQMXI+YkROR8atbED6/nFd/k
 hCb0UK02XMnxcOk86UuVlura11dGOYpyTB6Epa0GhlDux4EqbixIrvnsc7wvR5U/kYPYwWQ6q
 gosz1p4DJRm14fWvY93FWXKEmPHvDwgynyXM8mTy7qztqDKqFeU9X2V+iEcjXDEk6f47r0EGm
 tZ/PtdJ/pps4W8=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=jan.kiszka@web.de;
 helo=mout.web.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f/R4kRXox+wx

From: Jan Kiszka <jan.kiszka@siemens.com>

The virt machine lacks a watchdog so far while the sbsa-ref has a simple
model that is also supported by Linux and even U-Boot. Let's take it to
allow, e.g., system integration tests of A/B software update under
watchdog monitoring.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
=2D--

An alternative could be sp805. However, QEMU has no support for that
device yet.

 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 35 +++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  3 +++
 3 files changed, 39 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 97f3b38019..8df04a3533 100644
=2D-- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_APEI
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
+    select WDT_SBSA

 config CHEETAH
     bool
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f94278935f..a7b85438a8 100644
=2D-- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -78,6 +78,7 @@
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
+#include "hw/watchdog/sbsa_gwdt.h"
 #include "qemu/guest-random.h"

 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
@@ -154,6 +155,8 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_NVDIMM_ACPI] =3D        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =3D             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =3D        { 0x090b0000, 0x00001000 },
+    [VIRT_GWDT_CONTROL] =3D       { 0x090c0000, 0x00001000 },
+    [VIRT_GWDT_REFRESH] =3D       { 0x090d0000, 0x00001000 },
     [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that si=
ze */
     [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
@@ -190,6 +193,7 @@ static const int a15irqmap[] =3D {
     [VIRT_GPIO] =3D 7,
     [VIRT_SECURE_UART] =3D 8,
     [VIRT_ACPI_GED] =3D 9,
+    [VIRT_GWDT_WS0] =3D 10,
     [VIRT_MMIO] =3D 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] =3D 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] =3D 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -902,6 +906,35 @@ static void create_rtc(const VirtMachineState *vms)
     g_free(nodename);
 }

+static void create_wdt(const VirtMachineState *vms)
+{
+    hwaddr cbase =3D vms->memmap[VIRT_GWDT_CONTROL].base;
+    hwaddr csize =3D vms->memmap[VIRT_GWDT_CONTROL].size;
+    hwaddr rbase =3D vms->memmap[VIRT_GWDT_REFRESH].base;
+    hwaddr rsize =3D vms->memmap[VIRT_GWDT_REFRESH].size;
+    DeviceState *dev =3D qdev_new(TYPE_WDT_SBSA);
+    SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
+    int irq =3D vms->irqmap[VIRT_GWDT_WS0];
+    const char compat[] =3D "arm,sbsa-gwdt";
+    MachineState *ms =3D MACHINE(vms);
+    char *nodename;
+
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 1, cbase);
+    sysbus_mmio_map(s, 0, rbase);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
+
+    nodename =3D g_strdup_printf("/watchdog@%" PRIx64, cbase);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(comp=
at));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, cbase, 2, csize, 2, rbase, 2, rsize);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    g_free(nodename);
+}
+
 static DeviceState *gpio_key_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
@@ -2240,6 +2273,8 @@ static void machvirt_init(MachineState *machine)

     create_rtc(vms);

+    create_wdt(vms);
+
     create_pcie(vms);

     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms=
)) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 15feabac63..7f295f771e 100644
=2D-- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -86,6 +86,9 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_GWDT_WS0,
+    VIRT_GWDT_CONTROL,
+    VIRT_GWDT_REFRESH,
     VIRT_LOWMEMMAP_LAST,
 };

=2D-
2.34.1
