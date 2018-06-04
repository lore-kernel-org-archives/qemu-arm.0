Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743596wrq;
        Mon, 4 Jun 2018 08:29:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL1+tHgqEYHMjIEX3wiAs6aW1HLnMVAtlyHAbeyQh4VqWNEFfvIcF9pZeKXgVxGciwrnWEp
X-Received: by 2002:adf:cd85:: with SMTP id q5-v6mr15782038wrj.275.1528126191693;
        Mon, 04 Jun 2018 08:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126191; cv=none;
        d=google.com; s=arc-20160816;
        b=IwhbCFV6pWpeop/MJX8QibV77abmc0g/CozpeOAcZuVBlGUWA5M0gxi0dpUNWFY2D8
         HYkjmNmGSHOcm64E1ObmTArb5on+Azf468YklLNEO9ivaFVZSfPA7y68vsAc4BXES3wK
         bNC1lezrB1zzmtV0tVlSgt3qe9q7MkbSG1zoTRx/njAD4G6Cu51j4WESj2a+u/MK5O63
         JDZERgRV4sEyvhWkpqmrSah3ZVL3NbuvVvqtxU2H18c6dhbnZZ676oqFHxglWeRH4lXT
         tBIR03/8/50JaMcb2whYG5lsyNtShAvin+3ASEpaeXb4ZFw9EiIU9ThzvRG9u3+bSdus
         IMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=NdGvu8DSxSkqTnAcIC0lWaImKZxdeqClYOoKlOXbiTQ=;
        b=ps0Jn67WyA8tHhgeVWG5UZiTUpaizf8T3WhsVLVl5dSWB+leH6fySSKWG0e+W0oe8Y
         LJwLb3NNPCTnLPlLKGiDnIF8fqk553FxYAWy+P3XSjc698EUiBJtZz69AI4tzLRLc8SC
         aBTi10j0OD9o5KfX+1DTpHbrpIeqhzZ+KiIey+Ozu8qJ4umReo5GTgAyFiObjZj26xHh
         I3BZLBeOaQQRtF7HmAOH7SxXcuQA0iKxLYulN92vzuzPE0CE7XET3hY5R43O4KG1YPl9
         +CkjMxJ9+3H0f2ZQp2EavzOy700qunf+uSN++mnYT6o0CE2yxMa2SC+jDDHp0m4GUxkZ
         QFpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id b125-v6si337771wme.127.2018.06.04.08.29.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQd-000764-6b; Mon, 04 Jun 2018 16:29:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 11/13] hw/arm/iotkit: Instantiate MPC
Date: Mon,  4 Jun 2018 16:29:39 +0100
Message-Id: <20180604152941.20374-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m351Yg7wIwvy

Wire up the one MPC that is part of the IoTKit itself. For the
moment we don't wire up its interrupt line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/arm/iotkit.h |  2 ++
 hw/arm/iotkit.c         | 38 +++++++++++++++++++++++++++-----------
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index c6129d926b6..b21cf1ab9d1 100644
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
index 234185e8f78..160e40c7449 100644
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
2.17.1
