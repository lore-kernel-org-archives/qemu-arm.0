Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1872588wru;
        Thu, 9 Aug 2018 06:02:31 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx/OmoSSf4mX6bGaWfxCECuHhVyNK6b5K+hEiduPx76ur5vBHWfcg1ZqCI4/t+MluA1e8oH
X-Received: by 2002:a81:9ad8:: with SMTP id r207-v6mr992796ywg.333.1533819751251;
        Thu, 09 Aug 2018 06:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819751; cv=none;
        d=google.com; s=arc-20160816;
        b=Ecke4eTdimKK49x8l9lC/caHQ1tNHzlDr1ZUr68ag/vdCNvQINB7SxwPkkKtF7f5NJ
         IVRS7H1yOK3oLnUoTpha4k/vrqsdTwlaHBq52upq8u7m6ONjt7pb1ZJt1Tfr56XCqhXi
         31ao3la/xys3CEQs53T8gfpMzpSOb9rQXOllJI45MiAa1xJMDpgT1H7ozxJl3qMMfl8a
         NlgSFWUv/8dWTFktvFaqV48nrfak3s7wFsda0FB7gbK3KMJfIT+71FQvZ2etaJzbwg4M
         ZD5W94YaiL9WII+y521lFTLvaObOF1EP7IwOvS2VtmvXCk/cpJvuU+wm13Yi09pvElLw
         rm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bFG2wbnbPklJEMhvUvAdU7jC1qZyHSVU7O4rXXClIPI=;
        b=UZ274cYST4QVJM86X1un8f4tKMG94MeckNGI+nT+tXkEhsySJukQsbtpOfzar7ITr6
         rK7howSrpwAZW8dmjtfmXTuPdq51TLjUMrcQ2TILnATW+dsX1QiaVSBaWBlA4tULBkB8
         xaFn4nfp68KCMoYxkNDf82oWm83bsytz9bfc7q2duJbkF2Z0Jm8uL6Ex4nz9mrRr8szJ
         Z4sffmc/NNRryqNAOT5H+9zioS/RXB3ark+/kxJOF7Tv3JxRSWB8yTvS06JR4LcCZg/T
         Cm7Jd+8vy7vo1SDJEbeUaajijRpZ+Ps8yOmEInL7SGQVVag42x0vlQGDJgfKLyH45rec
         gGBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si1784619ybg.17.2018.08.09.06.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkaE-0006Lm-N1
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:02:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZN-0005vQ-Ht
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZM-0003Lu-30
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:37 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZL-0003LA-P5; Thu, 09 Aug 2018 09:01:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZK-0003MN-Og; Thu, 09 Aug 2018 14:01:34 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:15 +0100
Message-Id: <20180809130115.28951-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 16/16] hw/arm/mps2-tz: Create PL081s and MSCs
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VyrcyrrKwynG

The AN505 FPGA image includes four PL081 DMA controllers, each
of which is gated by a Master Security Controller that allows
the guest to prevent a non-secure DMA controller from accessing
memory that is used by secure guest code. Create and wire
up these devices.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 101 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 7 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 22180c56fb7..7d92bc5fe1c 100644
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
@@ -273,6 +276,65 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
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
+    init_sysbus_child(OBJECT(mms), mscname, msc, sizeof(mms->msc[0]),
+                      TYPE_TZ_MSC);
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
+    init_sysbus_child(OBJECT(mms), name, dma, sizeof(mms->dma[0]), TYPE_PL081);
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
@@ -299,13 +361,14 @@ static void mps2tz_common_init(MachineState *machine)
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
@@ -406,10 +469,10 @@ static void mps2tz_common_init(MachineState *machine)
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
@@ -490,12 +553,32 @@ static void mps2tz_common_init(MachineState *machine)
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
@@ -516,6 +599,10 @@ static const TypeInfo mps2tz_info = {
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
2.17.1

