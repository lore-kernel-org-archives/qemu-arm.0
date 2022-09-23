Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp180348ejy;
        Fri, 23 Sep 2022 01:48:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wJoN7+ySsMnJQdrwKCbqe02VxtWLcMunzZaodVdu9EZ4Uc0mqiH97FwYZegZEEDRepE8J
X-Received: by 2002:a63:6b04:0:b0:43c:1908:d9c with SMTP id g4-20020a636b04000000b0043c19080d9cmr5520302pgc.258.1663922909073;
        Fri, 23 Sep 2022 01:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663922909; cv=none;
        d=google.com; s=arc-20160816;
        b=jAHInzi8KYWS/FWg/6VJpnrSwVUnh5CJUmRg4W098zYpiTqPsCfpVMgCPKp352GkAs
         CKofWAmaEwFEt9iHQWSVjoqBZWwqkqwSSJvJDrSIOKsK9cBrkYl9TNDpyVv2ScgfUeTt
         DiSLbM2GJg+PCzLrWighwyZyVvQ+wfp3sHG8qujkZvR0oemZPjNGw9TMihBwUoT0S6Xz
         DkZXRT3B04hhMMkFzf/KV6PADDgxho9GL04EXEflDWhasVRmK8ks2/sp+Hv4P0BpzXSH
         z0bVS4Fxd2/x7AxUN3zqYCIULDhSBgiqle9YyqrksglEFGZC5dVy+xbk1D8m5SAyM5sS
         TVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=RLodW1RGB3Ig4Jk4s09PC93PTQ+o6wIE1lXDJxrSApA=;
        b=LRCFhRM+92qMe6kQ4JnrRKRCFqVT7Rybi7+0FY/XebCaatixLT94ojd0L+qBABilUA
         c4Zv+4X5cI36fFaIKX9mRgrAIYwj8mq2JkvzlZjEPenWuB2+MkT1FWLuYktUrlyeLoJ1
         y7C7PjVM9Vw4xVjETyN6i8bhHuxZ3tt+0/GitAXgghCXAGd7h7yd4mQ+UX0tezFugZXO
         8Dy1w/wk75ZVtKJ85JeeAhsJ2RdAHEl5n3rqQfinbbhjWsXqgC5BEHaTsdAwEIGoUxEZ
         AUhAv8pBzrVeHJhDsUjgikelnNQMZZkBbPHvhPNbIF0cyykzREivLbbJtVH+FW8J8bs7
         iaGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id n6-20020a632706000000b0042aff6de2d3si8930544pgn.179.2022.09.23.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5R0QtNz4xGT;
	Fri, 23 Sep 2022 18:48:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5N3jsHz4xGN;
	Fri, 23 Sep 2022 18:48:24 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 5/6] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Date: Fri, 23 Sep 2022 10:48:02 +0200
Message-Id: <20220923084803.498337-6-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DtDhxCyt3RQa

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
