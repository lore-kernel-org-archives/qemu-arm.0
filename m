Received: by 10.25.0.147 with SMTP id 141csp59038lfa;
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
X-Received: by 10.28.184.133 with SMTP id i127mr10454527wmf.49.1487604968778;
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id m80si12753770wmi.31.2017.02.20.07.36.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfq0W-0005gv-8h; Mon, 20 Feb 2017 15:36:08 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 04/11] armv7m: Use QOMified armv7m object in armv7m_init()
Date: Mon, 20 Feb 2017 15:35:58 +0000
Message-Id: <1487604965-23220-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
X-TUID: H+6UIbyQd7aH

Make the legacy armv7m_init() function use the newly QOMified
armv7m object rather than doing everything by hand.

We can return the armv7m object rather than the NVIC from
armv7m_init() because its interface to the rest of the
board (GPIOs, etc) is identical.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c | 49 ++++++++++++-------------------------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 56d02d4..36f213c 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -131,21 +131,6 @@ static void bitband_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
-static void armv7m_bitband_init(void)
-{
-    DeviceState *dev;
-
-    dev = qdev_create(NULL, TYPE_BITBAND);
-    qdev_prop_set_uint32(dev, "base", 0x20000000);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x22000000);
-
-    dev = qdev_create(NULL, TYPE_BITBAND);
-    qdev_prop_set_uint32(dev, "base", 0x40000000);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x42000000);
-}
-
 /* Board init.  */
 
 static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] = {
@@ -283,35 +268,25 @@ static void armv7m_reset(void *opaque)
 
 /* Init CPU and memory for a v7-M based board.
    mem_size is in bytes.
-   Returns the NVIC array.  */
+   Returns the ARMv7M device.  */
 
 DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
                       const char *kernel_filename, const char *cpu_model)
 {
-    ARMCPU *cpu;
-    CPUARMState *env;
-    DeviceState *nvic;
+    DeviceState *armv7m;
 
     if (cpu_model == NULL) {
-	cpu_model = "cortex-m3";
+        cpu_model = "cortex-m3";
     }
-    cpu = cpu_arm_init(cpu_model);
-    if (cpu == NULL) {
-        fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
-    }
-    env = &cpu->env;
-
-    armv7m_bitband_init();
-
-    nvic = qdev_create(NULL, "armv7m_nvic");
-    qdev_prop_set_uint32(nvic, "num-irq", num_irq);
-    env->nvic = nvic;
-    qdev_init_nofail(nvic);
-    sysbus_connect_irq(SYS_BUS_DEVICE(nvic), 0,
-                       qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
-    armv7m_load_kernel(cpu, kernel_filename, mem_size);
-    return nvic;
+
+    armv7m = qdev_create(NULL, "armv7m");
+    qdev_prop_set_uint32(armv7m, "num-irq", num_irq);
+    qdev_prop_set_string(armv7m, "cpu-model", cpu_model);
+    /* This will exit with an error if the user passed us a bad cpu_model */
+    qdev_init_nofail(armv7m);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), kernel_filename, mem_size);
+    return armv7m;
 }
 
 void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
-- 
2.7.4
