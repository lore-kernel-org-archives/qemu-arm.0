Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4193652ejn;
        Tue, 25 Oct 2022 08:21:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM52iXnyTHT07xivzEtqPTRlNtKUWBgyF9jj8MfTE5MUbUlI4cToOC05URy9yfWWxtmzvbCR
X-Received: by 2002:a17:90b:264d:b0:20d:3935:778 with SMTP id pa13-20020a17090b264d00b0020d39350778mr78783740pjb.64.1666711264252;
        Tue, 25 Oct 2022 08:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711264; cv=none;
        d=google.com; s=arc-20160816;
        b=nUt10er5MyWZBwPqmEwcaDNQUdbMWIXzuk1vQYDLaxkqJa+K7WFyUpywok7ZlbOXpt
         ximbsTO7gPJXK5HSKGl/mikez4nwLspB0cDF3MiEBl9mYxSbhDW7et6qO9AUWBumduRu
         eMFKmFR4EoYkO+5cTx3z/P94U3MkdbD+RCBojehvryoaujH6QCpzL00kbqSTfk/9QKAy
         9gQwdLtZgzSY7F0a5XjEbRx0B9DhKi1T1EqNDL7FHMbPF57DkUjhB+lRTUjWtX20vgUk
         7Jo+dUMbBytMTYOGt/b60dPTQhvkcE9OiISS0yo+N/0Zp3d/Mf4bcUThdGQnzlm2+0V5
         JHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Pl7Nwa2w4lcPvKQGIVM6cDiIP5WFS7vLVMWZ7y/EyLM=;
        b=xWWQ3NGOrsK6+PVs4acBWT8zay23/pfHbThDAUUXQgWUnOHCtdkDI86OvAcFPrQAvd
         zabSpLBCyChEmJXpPVlwrKqBCGI/F3ipZIG07zCRBOFZyTa6knqIujh92RqI8HowkCHM
         Ot4528V06IfNz1+YhKYgYxPY906PwlcHIIiay9xEjdEjo5ZO8A4ydg8NuyRq9e+tSQ2t
         LY8Cd8LSCfZBJ++IC9TITTrMLbD1/w51AoKiQGFE/9MCOVp2GNX3XDs1d0gf+pDuIPsj
         vIo/ISCN/cicwyNVz9//ks52n95pX1F9gfg3p4WLX7YM9QIOB7HH8Jyzm/F0I25BAwdh
         /Duw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=kvxu=22=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=KVXu=22=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id n17-20020a170902d0d100b001868a4db3d1si2825809pln.48.2022.10.25.08.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=kvxu=22=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=kvxu=22=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=KVXu=22=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbHf1kbpz4xGh;
	Wed, 26 Oct 2022 02:21:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHb32cqz4x1F;
	Wed, 26 Oct 2022 02:20:59 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/16] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Date: Tue, 25 Oct 2022 17:20:29 +0200
Message-Id: <20221025152042.278287-4-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i2wmBY3MC2Ow

From: Alex Bennée <alex.bennee@linaro.org>

Investigating why some BMC models are so slow compared to a plain ARM
virt machines I did some profiling of:

  ./qemu-system-arm -M romulus-bmc -nic user \
    -drive
    file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
    -nographic -serial mon:stdio

And saw that object_class_dynamic_cast_assert was dominating the
profile times. We have a number of cases in this model of the SSI bus.
As the class is static once the object is created we just cache it and
use it instead of the dynamic case macros.

Profiling against:

  ./tests/venv/bin/avocado run \
    tests/avocado/machine_aspeed.py:test_arm_ast2500_romulus_openbmc_v2_9_0

Before: 35.565 s ±  0.087 s
After: 15.713 s ±  0.287 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220811151413.3350684-6-alex.bennee@linaro.org>
Message-Id: <20220923084803.498337-6-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h |  3 +++
 hw/ssi/ssi.c         | 18 ++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index f411858ab083..6950f86810d3 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -59,6 +59,9 @@ struct SSIPeripheralClass {
 struct SSIPeripheral {
     DeviceState parent_obj;
 
+    /* cache the class */
+    SSIPeripheralClass *spc;
+
     /* Chip select state */
     bool cs;
 };
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 003931fb509e..d54a109beeb5 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -38,9 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
     bool cs = !!level;
     assert(n == 0);
     if (s->cs != cs) {
-        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
-        if (ssc->set_cs) {
-            ssc->set_cs(s, cs);
+        if (s->spc->set_cs) {
+            s->spc->set_cs(s, cs);
         }
     }
     s->cs = cs;
@@ -48,11 +47,11 @@ static void ssi_cs_default(void *opaque, int n, int level)
 
 static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
 {
-    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
+    SSIPeripheralClass *ssc = dev->spc;
 
     if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
-            (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
-            ssc->cs_polarity == SSI_CS_NONE) {
+        (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
+        ssc->cs_polarity == SSI_CS_NONE) {
         return ssc->transfer(dev, val);
     }
     return 0;
@@ -67,6 +66,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
             ssc->cs_polarity != SSI_CS_NONE) {
         qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
     }
+    s->spc = ssc;
 
     ssc->realize(s, errp);
 }
@@ -115,13 +115,11 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
 {
     BusState *b = BUS(bus);
     BusChild *kid;
-    SSIPeripheralClass *ssc;
     uint32_t r = 0;
 
     QTAILQ_FOREACH(kid, &b->children, sibling) {
-        SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
-        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
-        r |= ssc->transfer_raw(peripheral, val);
+        SSIPeripheral *p = SSI_PERIPHERAL(kid->child);
+        r |= p->spc->transfer_raw(p, val);
     }
 
     return r;
-- 
2.37.3
