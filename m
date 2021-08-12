Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp191306lff;
        Thu, 12 Aug 2021 02:36:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb+eJHZKIZQh5q2UrdTpsFkqCpWL+0DWj7TUSqqMnQvco0INlIhipW96fRylYbnP/hj6Sf
X-Received: by 2002:ac8:705e:: with SMTP id y30mr2857957qtm.239.1628760972993;
        Thu, 12 Aug 2021 02:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628760972; cv=none;
        d=google.com; s=arc-20160816;
        b=jNCtVq57CpjMTXj9BXIy0dLjURCuUlBM0tojoRzGUeIFAe3P7RO3TwehJnb1cI+H/w
         kRtTIttYLaErgaFrSoNGOj9eFYld6iHBUNRHFCZeuRvgwi37VdEafvCYLKMNHtHth8Tg
         8O++gQHCfRiJbMyXojJQwNvoZyO9rTL2hFc+J+ag7gwzMTnNCfBrR6mBc/R+IOb2CyGn
         KkrQ9+OuvApEbeU6xFZtty/ZjMM2BrugN2VA3e1qXlyAhUX0bvUuZ200As5uJDGpYf9x
         +puJQYCG2GV2K08HH8CemIdcwnVJPnLZhAcIEGQIaLGjpdvZR4er3Q/PGUNzvZ4HJXeW
         tDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4yStbAadGLFzaQDEPuaZrd8+oAp5eaVKNNU2N0fxc5o=;
        b=ky9C01p8/gTXIql3XN+4IEegwQlIiJ//ra5I0k38yaIig9qhzHCqU+5JqnR6foQToD
         bmN2inT6y5SvFOxIiUAC1smsWpVBjDV9XQMkgfRRaB01pKhzcFKK6qsIJY2xHblemnWw
         4bGeOHfhgwDgxz4oIRxBbnZo6uoK167sj0BNjl5lfato8RJHyhvxVEsJGP9h3x5ZlMLj
         l5afYfAQr5aVm0ylLjnoKiWOVtFV4td4IYvpwKq3ytvnGDrlC8VZFoCwigVOCf2AGeXF
         KZf2hlB9NMpsr1Se2XZEE0FA874kYuDqX+VWbAeuJ3JxrAe7k8sC7xyaJdFF1km/cvE0
         nwFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lczIpAqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 143si63006qkj.358.2021.08.12.02.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lczIpAqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE78G-0002Qv-7c
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76F-00053X-Iw
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76B-0007lR-7R
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:06 -0400
Received: by mail-wm1-x331.google.com with SMTP id u15so4005824wmj.1
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4yStbAadGLFzaQDEPuaZrd8+oAp5eaVKNNU2N0fxc5o=;
 b=lczIpAqZ4j27IWWi7OPuuU7xtrIsPkn5cwZY189FZzmH7qE5mSeAORIPF830o6cRMu
 ErG4Y1G0YkKgNTV1WpYDqW9qiz5Wknr/6owCximbKpT8PMxhkcZZCXDQcPR0rtevOVYA
 MlsIZo9CbqZGYrqtxm+XsnrcGIGfXauAq16/xhFg3K4+8lmJTVZoQEaw7OlH5UXFR3IJ
 HYye8iq5i/jd4beHMzveGGd6KoudEHyeaHGCS0YaFNWhQDs6OLZhDqZvboNjcbBv/BxL
 c+ON/w+n+27gT6cY5YBqOCypfYM0bPWGQhgSTX/9SLo55fZL/nbpLW2YyvyZj47yYWOP
 clvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4yStbAadGLFzaQDEPuaZrd8+oAp5eaVKNNU2N0fxc5o=;
 b=CCq+8+0wngFyPG/VwdMgRx6NBss2PhvRHGDS5Oq5XZzFk0bvW1jHpFYcHdCPwBrSza
 NqUp+7BIGT4ABAjASoORk7R6ngxceZ4xWZdK2KgnEm+uTaxTGUExsfv7Kx+rhQ2JOO2B
 M0gjU6uW2v0DGKpM5d/EfH9dyjqeN499XzdCMqQPg5SzExQlL5m/Z4U7p7JNurTDgVkJ
 va8y+Y/3kzag4JJ89u37B/9ovXNE35VdANFSn4k0Aw4+20ojiFYjNfHTbwAh9XvR+n9W
 qpSpVCG4HW8207f/ryVg594mnPqSxope6FUccQzEPBZrw4WExF/kg4H+d+j0EDwsRlsI
 CmUA==
X-Gm-Message-State: AOAM5310ktHMVtMpKbztQSTo+yEaX7h0fEAsMVyhQ6eIXUgm/YWt6p4Q
 tzL8n7EnznmqiqeNP86zDwH8RZERP3XQVA==
X-Received: by 2002:a1c:2283:: with SMTP id i125mr2041173wmi.41.1628760841169; 
 Thu, 12 Aug 2021 02:34:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/25] arm: Move systick device creation from NVIC to
 ARMv7M object
Date: Thu, 12 Aug 2021 10:33:33 +0100
Message-Id: <20210812093356.1946-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fu7XNCzgy7Qp

There's no particular reason why the NVIC should be owning the
SysTick device objects; move them into the ARMv7M container object
instead, as part of consolidating the "create the devices which are
built into an M-profile CPU and map them into their architected
locations in the address space" work into one place.

This involves temporarily creating a duplicate copy of the
nvic_sysreg_ns_ops struct and its read/write functions (renamed as
v7m_sysreg_ns_*), but we will delete the NVIC's copy of this code in
a subsequent patch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m.h       |  12 ++++
 include/hw/intc/armv7m_nvic.h |   4 --
 hw/arm/armv7m.c               | 125 ++++++++++++++++++++++++++++++++++
 hw/intc/armv7m_nvic.c         |  73 --------------------
 4 files changed, 137 insertions(+), 77 deletions(-)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 4cae0d7eeaa..360c35c5fb2 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -60,11 +60,23 @@ struct ARMv7MState {
     BitBandState bitband[ARMV7M_NUM_BITBANDS];
     ARMCPU *cpu;
     ARMv7MRAS ras;
+    SysTickState systick[M_REG_NUM_BANKS];
 
     /* MemoryRegion we pass to the CPU, with our devices layered on
      * top of the ones the board provides in board_memory.
      */
     MemoryRegion container;
+    /*
+     * MemoryRegion which passes the transaction to either the S or the
+     * NS systick device depending on the transaction attributes
+     */
+    MemoryRegion systickmem;
+    /*
+     * MemoryRegion which enforces the S/NS handling of the systick
+     * device NS alias region and passes the transaction to the
+     * NS systick device if appropriate.
+     */
+    MemoryRegion systick_ns_mem;
 
     /* Properties */
     char *cpu_type;
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 33b6d8810c7..6a6a99090c7 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -81,16 +81,12 @@ struct NVICState {
 
     MemoryRegion sysregmem;
     MemoryRegion sysreg_ns_mem;
-    MemoryRegion systickmem;
-    MemoryRegion systick_ns_mem;
     MemoryRegion container;
     MemoryRegion defaultmem;
 
     uint32_t num_irq;
     qemu_irq excpout;
     qemu_irq sysresetreq;
-
-    SysTickState systick[M_REG_NUM_BANKS];
 };
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8964730d153..364ac069702 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -124,6 +124,85 @@ static const hwaddr bitband_output_addr[ARMV7M_NUM_BITBANDS] = {
     0x22000000, 0x42000000
 };
 
+static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
+                                       uint64_t value, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    MemoryRegion *mr = opaque;
+
+    if (attrs.secure) {
+        /* S accesses to the alias act like NS accesses to the real region */
+        attrs.secure = 0;
+        return memory_region_dispatch_write(mr, addr, value,
+                                            size_memop(size) | MO_TE, attrs);
+    } else {
+        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
+        if (attrs.user) {
+            return MEMTX_ERROR;
+        }
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
+                                      uint64_t *data, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    MemoryRegion *mr = opaque;
+
+    if (attrs.secure) {
+        /* S accesses to the alias act like NS accesses to the real region */
+        attrs.secure = 0;
+        return memory_region_dispatch_read(mr, addr, data,
+                                           size_memop(size) | MO_TE, attrs);
+    } else {
+        /* NS attrs are RAZ/WI for privileged, and BusFault for user */
+        if (attrs.user) {
+            return MEMTX_ERROR;
+        }
+        *data = 0;
+        return MEMTX_OK;
+    }
+}
+
+static const MemoryRegionOps v7m_sysreg_ns_ops = {
+    .read_with_attrs = v7m_sysreg_ns_read,
+    .write_with_attrs = v7m_sysreg_ns_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    ARMv7MState *s = opaque;
+    MemoryRegion *mr;
+
+    /* Direct the access to the correct systick */
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
+    return memory_region_dispatch_write(mr, addr, value,
+                                        size_memop(size) | MO_TE, attrs);
+}
+
+static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
+                                    uint64_t *data, unsigned size,
+                                    MemTxAttrs attrs)
+{
+    ARMv7MState *s = opaque;
+    MemoryRegion *mr;
+
+    /* Direct the access to the correct systick */
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
+    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
+                                       attrs);
+}
+
+static const MemoryRegionOps v7m_systick_ops = {
+    .read_with_attrs = v7m_systick_read,
+    .write_with_attrs = v7m_systick_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 static void armv7m_instance_init(Object *obj)
 {
     ARMv7MState *s = ARMV7M(obj);
@@ -137,6 +216,13 @@ static void armv7m_instance_init(Object *obj)
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq");
 
+    object_initialize_child(obj, "systick-reg-ns", &s->systick[M_REG_NS],
+                            TYPE_SYSTICK);
+    /*
+     * We can't initialize the secure systick here, as we don't know
+     * yet if we need it.
+     */
+
     for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
         object_initialize_child(obj, "bitband[*]", &s->bitband[i],
                                 TYPE_BITBAND);
@@ -231,6 +317,45 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->container, 0xe0000000,
                                 sysbus_mmio_get_region(sbd, 0));
 
+    /* Create and map the systick devices */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
+        return;
+    }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
+                       qdev_get_gpio_in_named(DEVICE(&s->nvic),
+                                              "systick-trigger", M_REG_NS));
+
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        /*
+         * We couldn't init the secure systick device in instance_init
+         * as we didn't know then if the CPU had the security extensions;
+         * so we have to do it here.
+         */
+        object_initialize_child(OBJECT(dev), "systick-reg-s",
+                                &s->systick[M_REG_S], TYPE_SYSTICK);
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
+            return;
+        }
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
+                           qdev_get_gpio_in_named(DEVICE(&s->nvic),
+                                                  "systick-trigger", M_REG_S));
+    }
+
+    memory_region_init_io(&s->systickmem, OBJECT(s),
+                          &v7m_systick_ops, s,
+                          "v7m_systick", 0xe0);
+
+    memory_region_add_subregion_overlap(&s->container, 0xe000e010,
+                                        &s->systickmem, 1);
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
+        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
+                              &v7m_sysreg_ns_ops, &s->systickmem,
+                              "v7m_systick_ns", 0xe0);
+        memory_region_add_subregion_overlap(&s->container, 0xe002e010,
+                                            &s->systick_ns_mem, 1);
+    }
+
     /* If the CPU has RAS support, create the RAS register block */
     if (cpu_isar_feature(aa32_ras, s->cpu)) {
         object_initialize_child(OBJECT(dev), "armv7m-ras",
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a5975592dfa..2b3e79a3da9 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2517,38 +2517,6 @@ static const MemoryRegionOps nvic_sysreg_ns_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
-                                      uint64_t value, unsigned size,
-                                      MemTxAttrs attrs)
-{
-    NVICState *s = opaque;
-    MemoryRegion *mr;
-
-    /* Direct the access to the correct systick */
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_write(mr, addr, value,
-                                        size_memop(size) | MO_TE, attrs);
-}
-
-static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
-                                     uint64_t *data, unsigned size,
-                                     MemTxAttrs attrs)
-{
-    NVICState *s = opaque;
-    MemoryRegion *mr;
-
-    /* Direct the access to the correct systick */
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
-                                       attrs);
-}
-
-static const MemoryRegionOps nvic_systick_ops = {
-    .read_with_attrs = nvic_systick_read,
-    .write_with_attrs = nvic_systick_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
 /*
  * Unassigned portions of the PPB space are RAZ/WI for privileged
  * accesses, and fault for non-privileged accesses.
@@ -2801,29 +2769,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 
     s->num_prio_bits = arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2;
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
-                       qdev_get_gpio_in_named(dev, "systick-trigger",
-                                              M_REG_NS));
-
-    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
-        /* We couldn't init the secure systick device in instance_init
-         * as we didn't know then if the CPU had the security extensions;
-         * so we have to do it here.
-         */
-        object_initialize_child(OBJECT(dev), "systick-reg-s",
-                                &s->systick[M_REG_S], TYPE_SYSTICK);
-
-        if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
-            return;
-        }
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
-                           qdev_get_gpio_in_named(dev, "systick-trigger",
-                                                  M_REG_S));
-    }
-
     /*
      * This device provides a single sysbus memory region which
      * represents the whole of the "System PPB" space. This is the
@@ -2877,23 +2822,11 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
                           "nvic_sysregs", 0x1000);
     memory_region_add_subregion(&s->container, 0xe000, &s->sysregmem);
 
-    memory_region_init_io(&s->systickmem, OBJECT(s),
-                          &nvic_systick_ops, s,
-                          "nvic_systick", 0xe0);
-
-    memory_region_add_subregion_overlap(&s->container, 0xe010,
-                                        &s->systickmem, 1);
-
     if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
         memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
                               &nvic_sysreg_ns_ops, &s->sysregmem,
                               "nvic_sysregs_ns", 0x1000);
         memory_region_add_subregion(&s->container, 0x2e000, &s->sysreg_ns_mem);
-        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
-                              &nvic_sysreg_ns_ops, &s->systickmem,
-                              "nvic_systick_ns", 0xe0);
-        memory_region_add_subregion_overlap(&s->container, 0x2e010,
-                                            &s->systick_ns_mem, 1);
     }
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
@@ -2905,12 +2838,6 @@ static void armv7m_nvic_instance_init(Object *obj)
     NVICState *nvic = NVIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    object_initialize_child(obj, "systick-reg-ns", &nvic->systick[M_REG_NS],
-                            TYPE_SYSTICK);
-    /* We can't initialize the secure systick here, as we don't know
-     * yet if we need it.
-     */
-
     sysbus_init_irq(sbd, &nvic->excpout);
     qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
     qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger",
-- 
2.20.1

