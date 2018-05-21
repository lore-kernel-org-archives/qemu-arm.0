Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311533wme;
        Mon, 21 May 2018 07:04:23 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZosrlWRw1LeSmt19qnTO4zwsmnSDUiEXF47MgP8iajMWfMRj7KH4hkBtsqlF734riO1wwdg
X-Received: by 2002:a50:ed06:: with SMTP id j6-v6mr24524288eds.143.1526911463317;
        Mon, 21 May 2018 07:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911463; cv=none;
        d=google.com; s=arc-20160816;
        b=RG8PjlNB/IMTFrVcWJNTU9h2lw4cp4+FC8fXyeuQuZ4j+vf5XdJbK8LL51cl8gI8rO
         5nLAxW8hbrWwoP/1TXVVv8Yo3hUIGqAqaPDB4l3Js5HkabiDOZKRA7QtfFVJM9IFJ2Zq
         LN9isnVRGp9jzNMW9IP+C28mX/zqb5SGqJFX3W8UNBbZTIJtrLjA3dKiqN+/hLn2Ik9x
         v3YMgVrjppRl9IHULPIvp/znG44RmEh0xMcQ5xEPm0+jvX42hFX32gmBsEKI8VKCvP93
         zTGUJmbi3lYb6vY97L9VoWEggNCcMA79iEd4Ky9OBAZHKikqTxNn+1/F3aIVbtzyBKrg
         BtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=H25QgJHfAjM+ekA5nWDePXAg/SgMhvXQE9RK6X+Eq2w=;
        b=Ehb7uKBaGcarzGF+g1vt2vHvbDT8a1mMH9GlocVRoLdrYH8iapibSSi6g1g7AjnvnD
         ginlcHNXZyslA/d5nYFwJPn7O5yBmWnAbckwQRifo7DkLuIrxJ13o0BTUHAw0+Is+F9M
         pPHmBbr6T7UYW8rbbzErLXILQbRvuSrUAbwmykgi7Ap3XPVzHb/rCOyzaqoPlvU7lX9e
         oPERO3uIVb24vMPcInFIVzv4TeEsqyu2ACKUwnNRb4dADqg4ZhkgqlKPRQEyb4UlEh3y
         tKthV5eMiAc36dpriA8oMS2SON759yJDtO06xHzOmYhF/R8wmikNt/VvHAGVpBzizkvE
         zjlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id n15-v6si3238291wmh.2.2018.05.21.07.04.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:23 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQE-0007pp-La; Mon, 21 May 2018 15:04:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 26/27] hw/arm/iotkit: Wire up MPC interrupt lines
Date: Mon, 21 May 2018 15:04:01 +0100
Message-Id: <20180521140402.23318-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: fSvyrkCVE94m

The interrupt outputs from the MPC in the IoTKit and the expansion
MPCs in the board must be wired up to the security controller, and
also all ORed together to produce a single line to the NVIC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h |  6 ++++
 hw/arm/iotkit.c         | 74 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index b21cf1ab9d..2cddde55dd 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -42,6 +42,9 @@
  *  + named GPIO outputs ahb_ppcexp{0,1,2,3}_irq_enable
  *  + named GPIO outputs ahb_ppcexp{0,1,2,3}_irq_clear
  *  + named GPIO inputs ahb_ppcexp{0,1,2,3}_irq_status
+ * Controlling each of the 16 expansion MPCs which a system using the IoTKit
+ * might provide:
+ *  + named GPIO inputs mpcexp_status[0..15]
  */
 
 #ifndef IOTKIT_H
@@ -81,6 +84,8 @@ typedef struct IoTKit {
     qemu_or_irq ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
     SplitIRQ ppc_irq_splitter[NUM_PPCS];
+    SplitIRQ mpc_irq_splitter[IOTS_NUM_EXP_MPC + IOTS_NUM_MPC];
+    qemu_or_irq mpc_irq_orgate;
 
     UnimplementedDeviceState dualtimer;
     UnimplementedDeviceState s32ktimer;
@@ -99,6 +104,7 @@ typedef struct IoTKit {
     qemu_irq nsc_cfg_in;
 
     qemu_irq irq_status_in[NUM_EXTERNAL_PPCS];
+    qemu_irq mpcexp_status_in[IOTS_NUM_EXP_MPC];
 
     uint32_t nsccfg;
 
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 160e40c744..133d5bb34f 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -131,6 +131,18 @@ static void iotkit_init(Object *obj)
     init_sysbus_child(obj, "apb-ppc1", &s->apb_ppc1, sizeof(s->apb_ppc1),
                       TYPE_TZ_PPC);
     init_sysbus_child(obj, "mpc", &s->mpc, sizeof(s->mpc), TYPE_TZ_MPC);
+    object_initialize(&s->mpc_irq_orgate, sizeof(s->mpc_irq_orgate),
+                      TYPE_OR_IRQ);
+    object_property_add_child(obj, "mpc-irq-orgate",
+                              OBJECT(&s->mpc_irq_orgate), &error_abort);
+    for (i = 0; i < ARRAY_SIZE(s->mpc_irq_splitter); i++) {
+        char *name = g_strdup_printf("mpc-irq-splitter-%d", i);
+        SplitIRQ *splitter = &s->mpc_irq_splitter[i];
+
+        object_initialize(splitter, sizeof(*splitter), TYPE_SPLIT_IRQ);
+        object_property_add_child(obj, name, OBJECT(splitter), &error_abort);
+        g_free(name);
+    }
     init_sysbus_child(obj, "timer0", &s->timer0, sizeof(s->timer0),
                       TYPE_CMSDK_APB_TIMER);
     init_sysbus_child(obj, "timer1", &s->timer1, sizeof(s->timer1),
@@ -163,6 +175,12 @@ static void iotkit_exp_irq(void *opaque, int n, int level)
     qemu_set_irq(s->exp_irqs[n], level);
 }
 
+static void iotkit_mpcexp_status(void *opaque, int n, int level)
+{
+    IoTKit *s = IOTKIT(opaque);
+    qemu_set_irq(s->mpcexp_status_in[n], level);
+}
+
 static void iotkit_realize(DeviceState *dev, Error **errp)
 {
     IoTKit *s = IOTKIT(dev);
@@ -328,6 +346,22 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mpc),
                                                        0));
 
+    /* We must OR together lines from the MPC splitters to go to the NVIC */
+    object_property_set_int(OBJECT(&s->mpc_irq_orgate),
+                            IOTS_NUM_EXP_MPC + IOTS_NUM_MPC, "num-lines", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->mpc_irq_orgate), true,
+                             "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    qdev_connect_gpio_out(DEVICE(&s->mpc_irq_orgate), 0,
+                          qdev_get_gpio_in(DEVICE(&s->armv7m), 9));
+
     /* Devices behind APB PPC0:
      *   0x40000000: timer0
      *   0x40001000: timer1
@@ -536,6 +570,46 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
         g_free(gpioname);
     }
 
+    /* Wire up the splitters for the MPC IRQs */
+    for (i = 0; i < IOTS_NUM_EXP_MPC + IOTS_NUM_MPC; i++) {
+        SplitIRQ *splitter = &s->mpc_irq_splitter[i];
+        DeviceState *dev_splitter = DEVICE(splitter);
+
+        object_property_set_int(OBJECT(splitter), 2, "num-lines", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        object_property_set_bool(OBJECT(splitter), true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        if (i < IOTS_NUM_EXP_MPC) {
+            /* Splitter input is from GPIO input line */
+            s->mpcexp_status_in[i] = qdev_get_gpio_in(dev_splitter, 0);
+            qdev_connect_gpio_out(dev_splitter, 0,
+                                  qdev_get_gpio_in_named(dev_secctl,
+                                                         "mpcexp_status", i));
+        } else {
+            /* Splitter input is from our own MPC */
+            qdev_connect_gpio_out_named(DEVICE(&s->mpc), "irq", 0,
+                                        qdev_get_gpio_in(dev_splitter, 0));
+            qdev_connect_gpio_out(dev_splitter, 0,
+                                  qdev_get_gpio_in_named(dev_secctl,
+                                                         "mpc_status", 0));
+        }
+
+        qdev_connect_gpio_out(dev_splitter, 1,
+                              qdev_get_gpio_in(DEVICE(&s->mpc_irq_orgate), i));
+    }
+    /* Create GPIO inputs which will pass the line state for our
+     * mpcexp_irq inputs to the correct splitter devices.
+     */
+    qdev_init_gpio_in_named(dev, iotkit_mpcexp_status, "mpcexp_status",
+                            IOTS_NUM_EXP_MPC);
+
     iotkit_forward_sec_resp_cfg(s);
 
     system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
-- 
2.17.0
