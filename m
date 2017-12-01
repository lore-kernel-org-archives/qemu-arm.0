Received: by 10.223.159.82 with SMTP id f18csp1525230wrg;
        Fri, 1 Dec 2017 10:51:43 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ/7h1ik+3sawxUCdT9xat0xXjK/om9X0y7b18Z1DQa9Mt6hvbwezVpDGKUJtyyWvqfwlEy
X-Received: by 10.84.202.163 with SMTP id x32mr6871085pld.55.1512154303705;
        Fri, 01 Dec 2017 10:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512154303; cv=none;
        d=google.com; s=arc-20160816;
        b=cfIG6titriC8Ppf6XfPSumm11GslVmPtB+EmeNab6q+cWVIdGm3rD0a1C8nLSrmZQ4
         Su9UjyD75bFJQNDH+/2eSI8mw9MBkLy0m7t82U7c8MmOfFwkow6cS36t7K6H/KS3DlEz
         eSVaW9IwvLAI3TMkip4hk11xYZq25vUSr3CbxgNWdx17jhHBCnEOSbS1eMOaYhVTzGSO
         dbTyKmRWftThYbLwREHzik840wmcIMNz68QcWterKej24YztHbM35PsqzsZHKEQOskzU
         bQFrn6SMs0f/raHt3t97tRCExYhvFavR1g++H2aj0Tjmi3J03k+H7DNagcOWlYeiHcaz
         sKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=1fA0uqw3jsN5RBmL5rq5UipwhXYJXqacA0e0pAFXZc8=;
        b=UX2Q8/Q3eVposkwUupC8CqLHF6I3reoUzFHJlGtlWILf1Ncf5bjiDw7GelQwhSWvKj
         /MIDZGLPvs4gDazA2qNKm/T55t8p5vtPlUFgTzWfL1YF6JMW0oL1jvwn0GK5vFnUOcgK
         7CHCi5Zut13bTJYl/tNI65XpmBmEgwcsrV0BZMHKSw0+/ErG+Ws+QaAomCIC3ZHKQgw8
         1TyTnhFWNNX60/CKaI+Wgn1Sa5uB1BD1Ta9+DTcgDnJhoxklwAwscKjEO/WrWPHc2+Xp
         PtMrSV4FeBi1JX0Tv867WK4aL6wJAsAVKnqrcdygjXlQPU1Wzj3qwC1V2Hmr4RAyjJEW
         Qo2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id n7si5174705pgd.755.2017.12.01.10.51.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:51:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqPS-0007C5-Gc; Fri, 01 Dec 2017 18:51:38 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] nvic: Make systick banked
Date: Fri,  1 Dec 2017 18:51:36 +0000
Message-Id: <1512154296-5652-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
References: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
X-TUID: JStvEE+SCKms

For the v8M security extension, there should be two systick
devices, which use separate banked systick exceptions. The
register interface is banked in the same way as for other
banked registers, including the existence of an NS alias
region for secure code to access the nonsecure timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h |  4 ++-
 hw/intc/armv7m_nvic.c         | 81 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 72 insertions(+), 13 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index ac7997c..8bc2911 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -78,13 +78,15 @@ typedef struct NVICState {
 
     MemoryRegion sysregmem;
     MemoryRegion sysreg_ns_mem;
+    MemoryRegion systickmem;
+    MemoryRegion systick_ns_mem;
     MemoryRegion container;
 
     uint32_t num_irq;
     qemu_irq excpout;
     qemu_irq sysresetreq;
 
-    SysTickState systick;
+    SysTickState systick[M_REG_NUM_BANKS];
 } NVICState;
 
 #endif
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 63f2743..5cb44f4 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1827,6 +1827,36 @@ static const MemoryRegionOps nvic_sysreg_ns_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
+                                      uint64_t value, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    NVICState *s = opaque;
+    MemoryRegion *mr;
+
+    /* Direct the access to the correct systick */
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
+    return memory_region_dispatch_write(mr, addr, value, size, attrs);
+}
+
+static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
+                                     uint64_t *data, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    NVICState *s = opaque;
+    MemoryRegion *mr;
+
+    /* Direct the access to the correct systick */
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
+    return memory_region_dispatch_read(mr, addr, data, size, attrs);
+}
+
+static const MemoryRegionOps nvic_systick_ops = {
+    .read_with_attrs = nvic_systick_read,
+    .write_with_attrs = nvic_systick_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 static int nvic_post_load(void *opaque, int version_id)
 {
     NVICState *s = opaque;
@@ -2005,17 +2035,16 @@ static void nvic_systick_trigger(void *opaque, int n, int level)
         /* SysTick just asked us to pend its exception.
          * (This is different from an external interrupt line's
          * behaviour.)
-         * TODO: when we implement the banked systicks we must make
-         * this pend the correct banked exception.
+         * n == 0 : NonSecure systick
+         * n == 1 : Secure systick
          */
-        armv7m_nvic_set_pending(s, ARMV7M_EXCP_SYSTICK, false);
+        armv7m_nvic_set_pending(s, ARMV7M_EXCP_SYSTICK, n);
     }
 }
 
 static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 {
     NVICState *s = NVIC(dev);
-    SysBusDevice *systick_sbd;
     Error *err = NULL;
     int regionlen;
 
@@ -2032,15 +2061,30 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     /* include space for internal exception vectors */
     s->num_irq += NVIC_FIRST_IRQ;
 
-    object_property_set_bool(OBJECT(&s->systick), true, "realized", &err);
+    object_property_set_bool(OBJECT(&s->systick[M_REG_NS]), true,
+                             "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
     }
-    systick_sbd = SYS_BUS_DEVICE(&s->systick);
-    sysbus_connect_irq(systick_sbd, 0,
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
                        qdev_get_gpio_in_named(dev, "systick-trigger", 0));
 
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        object_initialize(&s->systick[M_REG_S], sizeof(s->systick[M_REG_NS]),
+                          TYPE_SYSTICK);
+        qdev_set_parent_bus(DEVICE(&s->systick[M_REG_S]), sysbus_get_default());
+
+        object_property_set_bool(OBJECT(&s->systick[M_REG_S]), true,
+                                 "realized", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
+                           qdev_get_gpio_in_named(dev, "systick-trigger", 1));
+    }
+
     /* The NVIC and System Control Space (SCS) starts at 0xe000e000
      * and looks like this:
      *  0x004 - ICTR
@@ -2073,15 +2117,24 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->sysregmem, OBJECT(s), &nvic_sysreg_ops, s,
                           "nvic_sysregs", 0x1000);
     memory_region_add_subregion(&s->container, 0, &s->sysregmem);
+
+    memory_region_init_io(&s->systickmem, OBJECT(s),
+                          &nvic_systick_ops, s,
+                          "nvic_systick", 0xe0);
+
     memory_region_add_subregion_overlap(&s->container, 0x10,
-                                        sysbus_mmio_get_region(systick_sbd, 0),
-                                        1);
+                                        &s->systickmem, 1);
 
     if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
         memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
                               &nvic_sysreg_ns_ops, &s->sysregmem,
                               "nvic_sysregs_ns", 0x1000);
         memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);
+        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
+                              &nvic_sysreg_ns_ops, &s->systickmem,
+                              "nvic_systick_ns", 0xe0);
+        memory_region_add_subregion_overlap(&s->container, 0x20010,
+                                            &s->systick_ns_mem, 1);
     }
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
@@ -2099,12 +2152,16 @@ static void armv7m_nvic_instance_init(Object *obj)
     NVICState *nvic = NVIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    object_initialize(&nvic->systick, sizeof(nvic->systick), TYPE_SYSTICK);
-    qdev_set_parent_bus(DEVICE(&nvic->systick), sysbus_get_default());
+    object_initialize(&nvic->systick[M_REG_NS],
+                      sizeof(nvic->systick[M_REG_NS]), TYPE_SYSTICK);
+    qdev_set_parent_bus(DEVICE(&nvic->systick[M_REG_NS]), sysbus_get_default());
+    /* We can't initialize the secure systick here, as we don't know
+     * yet if we need it.
+     */
 
     sysbus_init_irq(sbd, &nvic->excpout);
     qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
-    qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger", 1);
+    qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger", 2);
 }
 
 static void armv7m_nvic_class_init(ObjectClass *klass, void *data)
-- 
2.7.4
