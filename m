Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1025657ejo;
        Tue, 12 Dec 2023 08:31:23 -0800 (PST)
X-Received: by 2002:a19:f717:0:b0:50b:fafd:3002 with SMTP id z23-20020a19f717000000b0050bfafd3002mr1152139lfe.147.1702398683783;
        Tue, 12 Dec 2023 08:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398683; cv=none;
        d=google.com; s=arc-20160816;
        b=JW+MYtR4iFTvlSn08rpyCIemPAB4+YKoLoMtg7XVPTMeXjL/UNNjRBLSfP02WQE6aJ
         4E1eKigr6MPvdTa6uOZQqb5qD85BJZ3nMXeit46NmvUd0+U7E0j1DvM44bpjWJqeAvnC
         lWtAVlLBv0hhXUklkpx3/kxJk/j62EsdK9736YdUjGknOgTo0XZUdLDqIQD9dbPshp2P
         KU0JfLBnp1SUDgG50n740+I4NbEPlVNAFfly0mxbvtRIdT6Pj1DyfUvaofRMxAFbyQm/
         G7a7pmWBvAAcuxN39XPkAlIg5bFyCAnxoGq6bd6NsYuKIcPoR9QBqH+yPpuewHUc9nr8
         w71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mW1Tjy1V0dFWeejxgyNqrmaIo81vn3WijX9+VUqJA5M=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=a1kWfK+UdPmLB2z7syZXL2KD7uBvi9HH3CwIVGXEWUXIYrNyQGN53X/cfmzGXYyCYr
         NWU8lUCNbhO8ujaICI7xwqSYGUDMTajYBViBqOljvkF3SMvJDZsx5neAVY2BwRNYiWnC
         fcJpeCYTa8ONxZ+4kZhwcySQTkM3o3UhPzAFY4EuKmfoMpG4ozbf9g87HoItXPsog+bQ
         TbKA8HevHIfdxijuPV6qNSJ85ppOX2c71r5jATofpwQq5jzhSpEBpiQvpkQmaKY+zZQZ
         TQ1kmQeHR1CU6V2BCxZGDa64sVAcnf79ixu5BLSjNiVMl7aASzO2SrhYuV7CmhHWU1rI
         NGiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ceSeDGTn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i42-20020a0565123e2a00b0050bea42f712sor2188854lfv.10.2023.12.12.08.31.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:31:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ceSeDGTn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398683; x=1703003483; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mW1Tjy1V0dFWeejxgyNqrmaIo81vn3WijX9+VUqJA5M=;
        b=ceSeDGTnol0ehxiFxfV4pMmXDPXMywzoBqJYH7TS5xmMGzYx5AWlgyEGMx9Lqvfml3
         LCIcJW6XcfmIbt4taUwoL640MAPyaypoJDW7TkT0N0onPevJHVWvsEDi673DjFfJEJlD
         9Q0m9kaJqV4pS1sA9p85RjHj/VyRfNi+Iaz2k1/hyzBeCff1EltODYaa5UHVaqmY1XKw
         ZK6KXIIcm1gKWQ1th04Z+ijiYqrFOVsKgIR7VQk5VOmksHn0bo32Ba2VhKkI/bZxN5iL
         wiSKncHzZhJdP/HqIJghxPd08HcWmRKdbzwIXbZuDzgYVHiHbYUTyBdQo/tsL7J2y2+y
         YmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398683; x=1703003483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mW1Tjy1V0dFWeejxgyNqrmaIo81vn3WijX9+VUqJA5M=;
        b=TmGwITGfRH/jCELPctAayGH805zWERw2ae7VawTGAAAXQU5gMGhRnv8CV9wClGYFr6
         OzIDsNjhCLqSGf0db21oKYTA/KOPs/KHYM5ff/rS80XbP5cF3FUXwjH/BAbWZb/U0hNj
         UMSOcF8WWA1cojAIVsMQVfCvMhlxtIhj8t+bE7FPrFYQT1IbctTwA6/M/hg+XLm5rVMX
         Mp9ZiZja86cJY7xUo8+Pho8xa/premvQWwvsJCRTA35BPfW/2u9joOjBrR3RKDghpUy8
         8GUsfUTPuADNk+1gEC09x7V94QVnfgnKDT6CcoDgj5sATL+LcIUnC8XdDnOkQZh2pPVU
         coSw==
X-Gm-Message-State: AOJu0YwG6H0zmw9w+GunGcpCBOHL/AFPx1SxaPVkmY8A0jrP8N510HYT
	cMUaDABoRHyJkhMQF36wduFIkUnl
X-Google-Smtp-Source: AGHT+IEDzsJYFiwAEiaum1z1vfiWqAa0VGAxsCzYVC5oCq/EQ1CH2OgLUHwrEBj5vTmsr68UtzsP5g==
X-Received: by 2002:a05:6512:21d1:b0:50b:f82d:7feb with SMTP id d17-20020a05651221d100b0050bf82d7febmr1207545lft.267.1702398683338;
        Tue, 12 Dec 2023 08:31:23 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id st3-20020a170907c08300b00a1c4fde4e88sm6559801ejc.18.2023.12.12.08.31.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:31:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/33] hw/cpu/arm: Handle 'has_el2/3' properties once in MPCore parent
Date: Tue, 12 Dec 2023 17:29:14 +0100
Message-ID: <20231212162935.42910-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +1a1eiuBeOmz

Move the 'has_el2' and 'has_el3' properties to the abstract
QOM parent.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/cpu/cortex_mpcore.h |  5 +++++
 hw/arm/exynos4210.c            | 10 ++++++++--
 hw/arm/vexpress.c              |  6 ++++++
 hw/arm/xilinx_zynq.c           |  6 ++++++
 hw/cpu/a15mpcore.c             | 18 ++++++------------
 hw/cpu/a9mpcore.c              |  5 +----
 hw/cpu/cortex_mpcore.c         |  3 +++
 7 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 0e7cca9e93..387552468c 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -30,6 +30,8 @@
  * QEMU interface:
  *  + QOM property "num-cores" which set the number of cores present in
  *    the cluster.
+ *  + QOM properties "cpu-has-el3", "cpu-has-el2" which set whether the CPUs
+ *    have the exception level features present.
  */
 #define TYPE_CORTEX_MPCORE_PRIV "cortex_mpcore_priv"
 OBJECT_DECLARE_TYPE(CortexMPPrivState, CortexMPPrivClass, CORTEX_MPCORE_PRIV)
@@ -53,6 +55,9 @@ struct CortexMPPrivState {
 
     /* Properties */
     uint32_t num_cores;
+
+    bool cpu_has_el3;
+    bool cpu_has_el2;
 };
 
 #define TYPE_A9MPCORE_PRIV "a9mpcore_priv"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ea1364499d..7386a8fe57 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -548,7 +548,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     Exynos4210State *s = EXYNOS4210_SOC(socdev);
     MemoryRegion *system_mem = get_system_memory();
     SysBusDevice *busdev;
-    DeviceState *dev, *uart[4], *pl330[3];
+    DeviceState *dev, *mpdev, *uart[4], *pl330[3];
     int i, n;
 
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
@@ -582,7 +582,13 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     }
 
     /* Private memory region and Internal GIC */
-    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-cores", EXYNOS4210_NCPUS);
+    mpdev = DEVICE(&s->a9mpcore);
+    qdev_prop_set_uint32(mpdev, "num-cores", EXYNOS4210_NCPUS);
+    /*
+     * By default A9 CPUs have EL3 enabled.  This board does not currently
+     * support EL3 so the CPU EL3 property is disabled before realization.
+     */
+    qdev_prop_set_bit(mpdev, "cpu-has-el3", false);
     busdev = SYS_BUS_DEVICE(&s->a9mpcore);
     sysbus_realize(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index a320d1c181..294b6f15f2 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -239,6 +239,12 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
      * wires itself up to the CPU's generic_timer gpio out lines.
      */
     dev = qdev_new(privdev);
+    if (!secure) {
+        qdev_prop_set_bit(dev, "cpu-has-el3", false);
+    }
+    if (!virt) {
+        qdev_prop_set_bit(dev, "cpu-has-el2", false);
+    }
     qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index fc9c927d09..28430dcfba 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -240,6 +240,12 @@ static void zynq_init(MachineState *machine)
 
     dev = qdev_new(TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", 1);
+    /*
+     * By default A9 CPUs have EL3 enabled.  This board does not
+     * currently support EL3 so the CPU EL3 property is disabled before
+     * realization.
+     */
+    qdev_prop_set_bit(dev, "cpu-has-el3", false);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 16874426e1..a16544fdde 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -52,9 +52,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     SysBusDevice *gicsbd;
     Error *local_err = NULL;
     int i;
-    bool has_el3;
-    bool has_el2 = false;
-    Object *cpuobj;
 
     cc->parent_realize(dev, &local_err);
     if (local_err) {
@@ -70,14 +67,11 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
         /* Make the GIC's TZ support match the CPUs. We assume that
          * either all the CPUs have TZ, or none do.
          */
-        cpuobj = OBJECT(qemu_get_cpu(0));
-        has_el3 = object_property_find(cpuobj, "has_el3") &&
-            object_property_get_bool(cpuobj, "has_el3", &error_abort);
-        qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+        qdev_prop_set_bit(gicdev, "has-security-extensions",
+                          c->cpu_has_el3);
         /* Similarly for virtualization support */
-        has_el2 = object_property_find(cpuobj, "has_el2") &&
-            object_property_get_bool(cpuobj, "has_el2", &error_abort);
-        qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has_el2);
+        qdev_prop_set_bit(gicdev, "has-virtualization-extensions",
+                          c->cpu_has_el2);
     }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
@@ -112,7 +106,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
                                   qdev_get_gpio_in(gicdev,
                                                    ppibase + timer_irq[irq]));
         }
-        if (has_el2) {
+        if (c->cpu_has_el2) {
             /* Connect the GIC maintenance interrupt to PPI ID 25 */
             sysbus_connect_irq(SYS_BUS_DEVICE(gicdev), i + 4 * c->num_cores,
                                qdev_get_gpio_in(gicdev, ppibase + 25));
@@ -134,7 +128,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
                                 sysbus_mmio_get_region(gicsbd, 0));
     memory_region_add_subregion(&c->container, 0x2000,
                                 sysbus_mmio_get_region(gicsbd, 1));
-    if (has_el2) {
+    if (c->cpu_has_el2) {
         memory_region_add_subregion(&c->container, 0x4000,
                                     sysbus_mmio_get_region(gicsbd, 2));
         memory_region_add_subregion(&c->container, 0x6000,
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 9c138f4442..54949314f8 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -51,7 +51,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     SysBusDevice *scubusdev, *gicbusdev, *gtimerbusdev, *mptimerbusdev,
                  *wdtbusdev;
     Error *local_err = NULL;
-    bool has_el3;
     CPUState *cpu0;
     Object *cpuobj;
 
@@ -86,9 +85,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     /* Make the GIC's TZ support match the CPUs. We assume that
      * either all the CPUs have TZ, or none do.
      */
-    has_el3 = object_property_find(cpuobj, "has_el3") &&
-        object_property_get_bool(cpuobj, "has_el3", &error_abort);
-    qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+    qdev_prop_set_bit(gicdev, "has-security-extensions", c->cpu_has_el3);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
         return;
diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
index d7ea633e4e..549b81f708 100644
--- a/hw/cpu/cortex_mpcore.c
+++ b/hw/cpu/cortex_mpcore.c
@@ -27,6 +27,9 @@ static Property cortex_mpcore_priv_properties[] = {
     DEFINE_PROP_UINT32("num-cores", CortexMPPrivState, num_cores, 1),
     DEFINE_PROP_UINT32("num-cpu", CortexMPPrivState, num_cores, 1), /* alias */
 
+    DEFINE_PROP_BOOL("cpu-has-el3", CortexMPPrivState, cpu_has_el3, true),
+    DEFINE_PROP_BOOL("cpu-has-el2", CortexMPPrivState, cpu_has_el2, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0
