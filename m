Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311554wme;
        Mon, 21 May 2018 07:04:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqO58p3OHG2gGZwosr7j8ARzxmjCCkljnJZas6MwRn3yhqFZCil6UyYEzpyUWZi43rckn4U
X-Received: by 2002:a2e:810a:: with SMTP id d10-v6mr11923023ljg.83.1526911464238;
        Mon, 21 May 2018 07:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911464; cv=none;
        d=google.com; s=arc-20160816;
        b=whAYYpy49bTTv1Ey7dJ79H2iHrwQ4zy2wS7ifEBEO9D4IjUG82HC5DIVZoTPjo/Yjr
         lm42cx5N6wAzDDGXfWI491+rJSFtL64F1n8pWhtvEuo+j0QEQFov3FoUuLcYkqa1X7qN
         Gzc48FkirMa6YSHXcb0+4EgSM0jo3xNbrdSiYXB4bZyaUZgj/enfuA+ed1JDtnI927yj
         Xh0Yzhl7u9nST8CWlIpcNrVw8KVSRWBllVC5aybfRMFmuEkL3htl6sdeB1Fc+3mJyXl9
         7EtqvtFbb74xIjHcoPlmLCYOr1NTJXMK168iHpzdAC6h7C0XoIcNDFY8bHZ2rrwWgXaB
         OySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=rUe6tm4QFJ7hfbiPep9NwduL+DiKG2evLjfmeVIr7MU=;
        b=jfSytdZHD3wXrW6wBJ7lfDEs4hcrbzqBD7/7HlzKvZ+bQMcTAFfsmBFcsO5gbFJEiV
         p8bdbR8fnRHwA1Lp5j2LhN5sI8eROtKRKDG8g/QeL9YiwC7GWCex982q4yMVkL7Pqc6Z
         qeav7Ta1mP3WiJbAcNWVmmr9Q/9ubE1mxzkP/19CyS0uIDYOiBK5f7qkT40gZLgt4+QA
         BSlJT15u2sOUFIs4xVB+h7FPUT4W543ajyFqzYIkDCqpPnLkI8rD7bYMBXAZv+QfVuRE
         bnluQrt/6Y6kqtUB7/c7HQUWMCRwNQDViFDD2up4H/3xKQYqn3E42zCFNx6PIaMQNC5b
         fSdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 141-v6si5781060ljf.44.2018.05.21.07.04.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQD-0007pC-VA; Mon, 21 May 2018 15:04:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 25/27] hw/arm/iotkit: Instantiate MPC
Date: Mon, 21 May 2018 15:04:00 +0100
Message-Id: <20180521140402.23318-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: ioIUswaLH0Mg

Wire up the one MPC that is part of the IoTKit itself. For the
moment we don't wire up its interrupt line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h |  2 ++
 hw/arm/iotkit.c         | 38 +++++++++++++++++++++++++++-----------
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index c6129d926b..b21cf1ab9d 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -51,6 +51,7 @@
 #include "hw/arm/armv7m.h"
 #include "hw/misc/iotkit-secctl.h"
 #include "hw/misc/tz-ppc.h"
+#include "hw/misc/tz-mpc.h"
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
@@ -74,6 +75,7 @@ typedef struct IoTKit {
     IoTKitSecCtl secctl;
     TZPPC apb_ppc0;
     TZPPC apb_ppc1;
+    TZMPC mpc;
     CMSDKAPBTIMER timer0;
     CMSDKAPBTIMER timer1;
     qemu_or_irq ppc_irq_orgate;
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 234185e8f7..160e40c744 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -130,6 +130,7 @@ static void iotkit_init(Object *obj)
                       TYPE_TZ_PPC);
     init_sysbus_child(obj, "apb-ppc1", &s->apb_ppc1, sizeof(s->apb_ppc1),
                       TYPE_TZ_PPC);
+    init_sysbus_child(obj, "mpc", &s->mpc, sizeof(s->mpc), TYPE_TZ_MPC);
     init_sysbus_child(obj, "timer0", &s->timer0, sizeof(s->timer0),
                       TYPE_CMSDK_APB_TIMER);
     init_sysbus_child(obj, "timer1", &s->timer1, sizeof(s->timer1),
@@ -266,15 +267,6 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
      */
     make_alias(s, &s->alias3, "alias 3", 0x50000000, 0x10000000, 0x40000000);
 
-    /* This RAM should be behind a Memory Protection Controller, but we
-     * don't implement that yet.
-     */
-    memory_region_init_ram(&s->sram0, NULL, "iotkit.sram0", 0x00008000, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    memory_region_add_subregion(&s->container, 0x20000000, &s->sram0);
 
     /* Security controller */
     object_property_set_bool(OBJECT(&s->secctl), true, "realized", &err);
@@ -310,6 +302,32 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out_named(dev_secctl, "sec_resp_cfg", 0,
                                 qdev_get_gpio_in(dev_splitter, 0));
 
+    /* This RAM lives behind the Memory Protection Controller */
+    memory_region_init_ram(&s->sram0, NULL, "iotkit.sram0", 0x00008000, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_link(OBJECT(&s->mpc), OBJECT(&s->sram0),
+                             "downstream", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->mpc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    /* Map the upstream end of the MPC into the right place... */
+    memory_region_add_subregion(&s->container, 0x20000000,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mpc),
+                                                       1));
+    /* ...and its register interface */
+    memory_region_add_subregion(&s->container, 0x50083000,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mpc),
+                                                       0));
+
     /* Devices behind APB PPC0:
      *   0x40000000: timer0
      *   0x40001000: timer1
@@ -473,8 +491,6 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("NS watchdog", 0x40081000, 0x1000);
     create_unimplemented_device("S watchdog", 0x50081000, 0x1000);
 
-    create_unimplemented_device("SRAM0 MPC", 0x50083000, 0x1000);
-
     for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
         Object *splitter = OBJECT(&s->ppc_irq_splitter[i]);
 
-- 
2.17.0
