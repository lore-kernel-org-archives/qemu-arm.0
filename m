Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp739453wrd;
        Mon, 20 Aug 2018 07:17:08 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyi3IPQmPeE1YvH5ToyQg9pipojNDCz7XW7xARr5nJ+aO5d9GDteAp/7mhYdY6Y6GFQcXVX
X-Received: by 2002:a0c:ab43:: with SMTP id i3-v6mr41537024qvb.87.1534774627925;
        Mon, 20 Aug 2018 07:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774627; cv=none;
        d=google.com; s=arc-20160816;
        b=Nu2FELA7rnzzvNza3DWDEDJ/XafkP1p/jrXgWxMhW2/puFtCr5xp92PNZabRABqf+Z
         Kb+wZnGhlAsvMXeNbG89ntSDs5GM9AwqjwDhNOyPcvTj5yAL26co1UlEdzMDmHGd93gU
         +XLzf6PaDxgUR9iD8xC5rJX1O00T9/jKXuP2xcWwiPn5AirQIJNwdzlZwM6U0T7NqJHj
         4/92EiOw8iWQ+X9ckrggt8CCoCo1OUTVWmt0zggP9QYGtL4mPrXNqB3R4wxKB0t2JEjW
         2oCrnOGjQ7QXVV+kG4KLD0APjvrQ4e95A1jOGFU2iLSHesM74ZAyXcxNl+uroWof+R8m
         QxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kFUZOduBQqC6QFzfC5DUJzffKhQVbQMYDWWD5ALkbAc=;
        b=0HRaSltL+2imEpnuctgBFW+Zd2L3qQBTRLEgNYOUVesJcJNE68sutAgYS7oXyRmRgT
         goBBEQSG3O58rJ2ssnWHg7hz9KYNoIkQmfW63nkIMo2GqdC8GVDySvPuATs+rgpp70IN
         OqDcO5581AT56+lfWyGAW2NSglaGmC+AJXKX2LjrppIEZV9IBrDZteJddgphEaCXi+Qe
         FYOrG3D3XcNYE0AhDcf1UmlmTA/iXkBAwqNSy8EkP/8ZeaXHh0+t9480IH4+o0xVJEwF
         gG907EEsg0VHTjKjgLBPaysGUpiiVN58uT0RC2Cu3qA7K34mHceeXzyMKURaLIvRgH0d
         nDhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x59-v6si3420069qte.381.2018.08.20.07.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frkzT-0008TH-Ba
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:17:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuC-0003by-2o
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuA-0007Lf-Tv
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:40 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkuA-0007Jz-I5; Mon, 20 Aug 2018 10:11:38 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frku6-0003Rn-OK; Mon, 20 Aug 2018 15:11:34 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:08 +0100
Message-Id: <20180820141116.9118-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 14/22] hw/arm/mps2-tz: Create PL081s and MSCs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOqg2zMX3rFK

The AN505 FPGA image includes four PL081 DMA controllers, each
of which is gated by a Master Security Controller that allows
the guest to prevent a non-secure DMA controller from accessing
memory that is used by secure guest code. Create and wire
up these devices.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2 changes:
 - use 'sizeof(*msc)', 'sizeof(*dma)' as suggested
   by Phillipe in code review
 - s/init_sysbus_child/sysbus_init_child_obj/, required by
   rebase on current master
---
 hw/arm/mps2-tz.c | 100 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 93 insertions(+), 7 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index dc0f34abe53..d810e51a1b4 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -45,7 +45,9 @@
 #include "hw/misc/mps2-scc.h"
 #include "hw/misc/mps2-fpgaio.h"
 #include "hw/misc/tz-mpc.h"
+#include "hw/misc/tz-msc.h"
 #include "hw/arm/iotkit.h"
+#include "hw/dma/pl080.h"
 #include "hw/devices.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
@@ -75,8 +77,9 @@ typedef struct {
     UnimplementedDeviceState i2c[4];
     UnimplementedDeviceState i2s_audio;
     UnimplementedDeviceState gpio[4];
-    UnimplementedDeviceState dma[4];
     UnimplementedDeviceState gfx;
+    PL080State dma[4];
+    TZMSC msc[4];
     CMSDKAPBUART uart[5];
     SplitIRQ sec_resp_splitter;
     qemu_or_irq uart_irq_orgate;
@@ -263,6 +266,64 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
 }
 
+static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
+                              const char *name, hwaddr size)
+{
+    PL080State *dma = opaque;
+    int i = dma - &mms->dma[0];
+    SysBusDevice *s;
+    char *mscname = g_strdup_printf("%s-msc", name);
+    TZMSC *msc = &mms->msc[i];
+    DeviceState *iotkitdev = DEVICE(&mms->iotkit);
+    MemoryRegion *msc_upstream;
+    MemoryRegion *msc_downstream;
+
+    /*
+     * Each DMA device is a PL081 whose transaction master interface
+     * is guarded by a Master Security Controller. The downstream end of
+     * the MSC connects to the IoTKit AHB Slave Expansion port, so the
+     * DMA devices can see all devices and memory that the CPU does.
+     */
+    sysbus_init_child_obj(OBJECT(mms), mscname, msc, sizeof(*msc), TYPE_TZ_MSC);
+    msc_downstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(&mms->iotkit), 0);
+    object_property_set_link(OBJECT(msc), OBJECT(msc_downstream),
+                             "downstream", &error_fatal);
+    object_property_set_link(OBJECT(msc), OBJECT(mms),
+                             "idau", &error_fatal);
+    object_property_set_bool(OBJECT(msc), true, "realized", &error_fatal);
+
+    qdev_connect_gpio_out_named(DEVICE(msc), "irq", 0,
+                                qdev_get_gpio_in_named(iotkitdev,
+                                                       "mscexp_status", i));
+    qdev_connect_gpio_out_named(iotkitdev, "mscexp_clear", i,
+                                qdev_get_gpio_in_named(DEVICE(msc),
+                                                       "irq_clear", 0));
+    qdev_connect_gpio_out_named(iotkitdev, "mscexp_ns", i,
+                                qdev_get_gpio_in_named(DEVICE(msc),
+                                                       "cfg_nonsec", 0));
+    qdev_connect_gpio_out(DEVICE(&mms->sec_resp_splitter),
+                          ARRAY_SIZE(mms->ppc) + i,
+                          qdev_get_gpio_in_named(DEVICE(msc),
+                                                 "cfg_sec_resp", 0));
+    msc_upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(msc), 0);
+
+    sysbus_init_child_obj(OBJECT(mms), name, dma, sizeof(*dma), TYPE_PL081);
+    object_property_set_link(OBJECT(dma), OBJECT(msc_upstream),
+                             "downstream", &error_fatal);
+    object_property_set_bool(OBJECT(dma), true, "realized", &error_fatal);
+
+    s = SYS_BUS_DEVICE(dma);
+    /* Wire up DMACINTR, DMACINTERR, DMACINTTC */
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in_named(iotkitdev,
+                                                    "EXP_IRQ", 58 + i * 3));
+    sysbus_connect_irq(s, 1, qdev_get_gpio_in_named(iotkitdev,
+                                                    "EXP_IRQ", 56 + i * 3));
+    sysbus_connect_irq(s, 2, qdev_get_gpio_in_named(iotkitdev,
+                                                    "EXP_IRQ", 57 + i * 3));
+
+    return sysbus_mmio_get_region(s, 0);
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -289,13 +350,14 @@ static void mps2tz_common_init(MachineState *machine)
                              &error_fatal);
 
     /* The sec_resp_cfg output from the IoTKit must be split into multiple
-     * lines, one for each of the PPCs we create here.
+     * lines, one for each of the PPCs we create here, plus one per MSC.
      */
     object_initialize(&mms->sec_resp_splitter, sizeof(mms->sec_resp_splitter),
                       TYPE_SPLIT_IRQ);
     object_property_add_child(OBJECT(machine), "sec-resp-splitter",
                               OBJECT(&mms->sec_resp_splitter), &error_abort);
-    object_property_set_int(OBJECT(&mms->sec_resp_splitter), 5,
+    object_property_set_int(OBJECT(&mms->sec_resp_splitter),
+                            ARRAY_SIZE(mms->ppc) + ARRAY_SIZE(mms->msc),
                             "num-lines", &error_fatal);
     object_property_set_bool(OBJECT(&mms->sec_resp_splitter), true,
                              "realized", &error_fatal);
@@ -396,10 +458,10 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "ahb_ppcexp1",
             .ports = {
-                { "dma0", make_unimp_dev, &mms->dma[0], 0x40110000, 0x1000 },
-                { "dma1", make_unimp_dev, &mms->dma[1], 0x40111000, 0x1000 },
-                { "dma2", make_unimp_dev, &mms->dma[2], 0x40112000, 0x1000 },
-                { "dma3", make_unimp_dev, &mms->dma[3], 0x40113000, 0x1000 },
+                { "dma0", make_dma, &mms->dma[0], 0x40110000, 0x1000 },
+                { "dma1", make_dma, &mms->dma[1], 0x40111000, 0x1000 },
+                { "dma2", make_dma, &mms->dma[2], 0x40112000, 0x1000 },
+                { "dma3", make_dma, &mms->dma[3], 0x40113000, 0x1000 },
             },
         },
     };
@@ -480,12 +542,32 @@ static void mps2tz_common_init(MachineState *machine)
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
 }
 
+static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
+                               int *iregion, bool *exempt, bool *ns, bool *nsc)
+{
+    /*
+     * The MPS2 TZ FPGA images have IDAUs in them which are connected to
+     * the Master Security Controllers. Thes have the same logic as
+     * is used by the IoTKit for the IDAU connected to the CPU, except
+     * that MSCs don't care about the NSC attribute.
+     */
+    int region = extract32(address, 28, 4);
+
+    *ns = !(region & 1);
+    *nsc = false;
+    /* 0xe0000000..0xe00fffff and 0xf0000000..0xf00fffff are exempt */
+    *exempt = (address & 0xeff00000) == 0xe0000000;
+    *iregion = region;
+}
+
 static void mps2tz_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(oc);
 
     mc->init = mps2tz_common_init;
     mc->max_cpus = 1;
+    iic->check = mps2_tz_idau_check;
 }
 
 static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
@@ -506,6 +588,10 @@ static const TypeInfo mps2tz_info = {
     .instance_size = sizeof(MPS2TZMachineState),
     .class_size = sizeof(MPS2TZMachineClass),
     .class_init = mps2tz_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_IDAU_INTERFACE },
+        { }
+    },
 };
 
 static const TypeInfo mps2tz_an505_info = {
-- 
2.18.0

