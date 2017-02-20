Received: by 10.25.0.147 with SMTP id 141csp59031lfa;
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
X-Received: by 10.223.154.72 with SMTP id z66mr16106954wrb.76.1487604968145;
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id i18si12746051wme.82.2017.02.20.07.36.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfq0U-0005gC-LN; Mon, 20 Feb 2017 15:36:06 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 01/11] armv7m: Abstract out the "load kernel" code
Date: Mon, 20 Feb 2017 15:35:55 +0000
Message-Id: <1487604965-23220-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
X-TUID: lBzWDHxnvUc5

Abstract the "load kernel" code out of armv7m_init() into its own
function.  This includes the registration of the CPU reset function,
to parallel how we handle this for A profile cores.

We make the function public so that boards which choose to
directly instantiate an ARMv7M device object can call it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/arm.h | 12 ++++++++++++
 hw/arm/armv7m.c      | 23 ++++++++++++++++++-----
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index c175c0e..a3f79d3 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -26,6 +26,18 @@ typedef enum {
 /* armv7m.c */
 DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
                       const char *kernel_filename, const char *cpu_model);
+/**
+ * armv7m_load_kernel:
+ * @cpu: CPU
+ * @kernel_filename: file to load
+ * @mem_size: mem_size: maximum image size to load
+ *
+ * Load the guest image for an ARMv7M system. This must be called by
+ * any ARMv7M board, either directly or via armv7m_init(). (This is
+ * necessary to ensure that the CPU resets correctly on system reset,
+ * as well as for kernel loading.)
+ */
+void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
 
 /*
  * struct used as a parameter of the arm_load_kernel machine init
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 0c9ca7b..b2cc6e9 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -176,10 +176,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
     ARMCPU *cpu;
     CPUARMState *env;
     DeviceState *nvic;
-    int image_size;
-    uint64_t entry;
-    uint64_t lowaddr;
-    int big_endian;
 
     if (cpu_model == NULL) {
 	cpu_model = "cortex-m3";
@@ -199,6 +195,16 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
     qdev_init_nofail(nvic);
     sysbus_connect_irq(SYS_BUS_DEVICE(nvic), 0,
                        qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
+    armv7m_load_kernel(cpu, kernel_filename, mem_size);
+    return nvic;
+}
+
+void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
+{
+    int image_size;
+    uint64_t entry;
+    uint64_t lowaddr;
+    int big_endian;
 
 #ifdef TARGET_WORDS_BIGENDIAN
     big_endian = 1;
@@ -224,8 +230,15 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
         }
     }
 
+    /* CPU objects (unlike devices) are not automatically reset on system
+     * reset, so we must always register a handler to do so. Unlike
+     * A-profile CPUs, we don't need to do anything special in the
+     * handler to arrange that it starts correctly.
+     * This is arguably the wrong place to do this, but it matches the
+     * way A-profile does it. Note that this means that every M profile
+     * board must call this function!
+     */
     qemu_register_reset(armv7m_reset, cpu);
-    return nvic;
 }
 
 static Property bitband_properties[] = {
-- 
2.7.4
