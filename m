Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743610wrq;
        Mon, 4 Jun 2018 08:29:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLigpdH6xhH3o3ve5xyW/9uswX4t8637jVtEl74UcnDDAd72CYSYqoZEYxSQF5yA84gjbEH
X-Received: by 2002:adf:a9c1:: with SMTP id b59-v6mr4211898wrd.48.1528126192462;
        Mon, 04 Jun 2018 08:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126192; cv=none;
        d=google.com; s=arc-20160816;
        b=u3U31KJo/A74uM2Yv9QTP76Dpu1hf6SNvh4DIKZGWSczDk8TfhloE+0f+FMmv1Rg+r
         cAz2Z2NESYaoAlWZrXe78HPgYLo6WSR9CF/NO/0awBpGACwkUSE0as0xiyJA5FwOQgY+
         lY4FL3bOOJZfIMdr9y7LuBCaLMFHJYFoR+DYkaXYlp9+tfuo0F2+fI5FpaYzNuTLHMNU
         J9eCc1aPtwmc+NjavJEK9MIBxBMKtc1ykTjDKgXxVpP410m1XlFrBPFa9bf9ShRTcTaf
         JmLMFmnlommSqcDhRbmHBJpmksZ9PQfDR9uIoxZvPYxGxJZabOrMJGU3xdShthvf3Kms
         NseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=e8kcVnzKdhgPmmNiRoTTVC8ABtqWInw316qKauMiA20=;
        b=K12ICzbGNNd/r+qQuTPk63xcT5GurAvnAYrsddAR8tIsJtbHScfBgGENkOLvxSRucI
         Dt9BPVN1oiVDgK49GaDtwV5sZXqATfYkrgEc8LQnBZ9FhaQ44WLcu89JagFR5l9aNgAZ
         8wYwfc0eK3LdB6A/Bcb8no4vnPVJ3I8iy9DCiE4mcKS7q1JEx/TIOf71iWGhEbNLwYkG
         ZrPtoxe/9b9u2O0G3Dd0tc4uTQ84cV+1mhMMH4v6LOuobJ8AXhsrAoIQK2ZHQzwo83tF
         n+/2facyPXa90Gg/heKzRgKmTFnG2mF5Y5bIdxa4z5f9jNp3c++tVtEOucSjlnwHghGE
         e8vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id t4-v6si2981896wrc.73.2018.06.04.08.29.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQd-00076L-Tj; Mon, 04 Jun 2018 16:29:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 12/13] hw/arm/iotkit: Wire up MPC interrupt lines
Date: Mon,  4 Jun 2018 16:29:40 +0100
Message-Id: <20180604152941.20374-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xdqkoNdljpb/

The interrupt outputs from the MPC in the IoTKit and the expansion
MPCs in the board must be wired up to the security controller, and
also all ORed together to produce a single line to the NVIC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/arm/iotkit.h |  6 ++++
 hw/arm/iotkit.c         | 74 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index b21cf1ab9d1..2cddde55dd1 100644
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
index 160e40c7449..133d5bb34f4 100644
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
2.17.1
