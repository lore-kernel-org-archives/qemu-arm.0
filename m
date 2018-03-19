Received: by 10.28.91.67 with SMTP id p64csp2800081wmb;
        Mon, 19 Mar 2018 09:27:26 -0700 (PDT)
X-Google-Smtp-Source: AG47ELujmErve6S59MuTHvCBqgMdy8Emfty3TbkAJRacjs3AqsB0fVdBttbQHUOVwG7k2yCRpWVH
X-Received: by 10.55.212.18 with SMTP id l18mr18095347qki.5.1521476846132;
        Mon, 19 Mar 2018 09:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521476846; cv=none;
        d=google.com; s=arc-20160816;
        b=btwJ7DjcfYkNuVlB2JzXpI7jtEXvCRkoVFTEL1Etqve3JVUFFfnG3JLJ2MeRiy3K8S
         5zwWTco5z1+UyT21UCcOCHs5feLlhxOnUYWw8Tg4mdYjEM5wZx6ZHlCOFrkqVQAeanMx
         auHkxdlDyKw3ZTRuUBvh1fDdgG7YUAdWdGkdeA1rCFWcytBdVLmQDMk3DpcPhqvYjnDp
         jheIjqdlcqOr+sl1xVUwJ/4t3nRPWA2GWKw0q/CyeoyF4dVaAhuq7U1kuapLfLWjPMZo
         6ZRyG/z5tSRV5L1K6KccnPvz5Y0jQ77LEcROdtBaXioA4TPClhgaty91KhdTXw/hM6Ak
         GnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2yyeuJhdOVM+FOJOFnBEmcjxH5sBrZjgcXaR+HEfOGw=;
        b=wl3PDD9Aoi8+WTDPxIvtaLEMPkqfKCT6Tli0WPxPWytyGBVF1JjsefD9KDAgTCr6yD
         bDCLDlrp4xu9KKHy3h8p9kuJfGz+iapMefyi3mPWKmMhAEjVyQG0B6+eCVftroNzZhaA
         ZwdN/a7hb67Jo2w68tZbSwt2F3Qgjqaiow1bXBFxtWUKkWP2aGElkJYDbOeVoat9Dw2J
         wbvCeC+W43J8j09Yo6xP1RheONoyj5PW+oAG7kDFSu2u2meCXU3Dsx5IZcBGsKS/fV6C
         NgHQKPKqiTk6JCZQFT0Leyc9I1UsVzMnj7EmNTHqVqoJdFiXR/GYssHNg7ZAes4yQZ37
         9laA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s196si406175qke.94.2018.03.19.09.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 09:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exxd7-0005Qz-Jf
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 12:27:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exxbH-000411-8s
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exxbG-0007JN-3I
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:25:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40436)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1exxbF-0007Ez-Iy; Mon, 19 Mar 2018 12:25:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1exxS2-0002tW-TY; Mon, 19 Mar 2018 16:15:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 19 Mar 2018 16:15:55 +0000
Message-Id: <20180319161556.16446-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319161556.16446-1-peter.maydell@linaro.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12 1/2] hw/sd/bcm2835_sdhost: Add
 tracepoints
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Pekka Enberg <penberg@iki.fi>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ookxsh9ugfYk

Add some tracepoints to the bcm2835_sdhost driver, to assist
debugging.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/bcm2835_sdhost.c | 10 ++++++++++
 hw/sd/trace-events     |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index f7f4e656df..79f3c5ceeb 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -15,6 +15,7 @@
 #include "qemu/log.h"
 #include "sysemu/blockdev.h"
 #include "hw/sd/bcm2835_sdhost.h"
+#include "trace.h"
 
 #define TYPE_BCM2835_SDHOST_BUS "bcm2835-sdhost-bus"
 #define BCM2835_SDHOST_BUS(obj) \
@@ -99,6 +100,7 @@ static void bcm2835_sdhost_update_irq(BCM2835SDHostState *s)
 {
     uint32_t irq = s->status &
         (SDHSTS_BUSY_IRPT | SDHSTS_BLOCK_IRPT | SDHSTS_SDIO_IRPT);
+    trace_bcm2835_sdhost_update_irq(irq);
     qemu_set_irq(s->irq, !!irq);
 }
 
@@ -211,6 +213,7 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
 
         s->edm &= ~0xf;
         s->edm |= SDEDM_FSM_DATAMODE;
+        trace_bcm2835_sdhost_edm_change("datacnt 0", s->edm);
 
         if (s->config & SDHCFG_DATA_IRPT_EN) {
             s->status |= SDHSTS_SDIO_IRPT;
@@ -229,6 +232,7 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
 
     s->edm &= ~(0x1f << 4);
     s->edm |= ((s->fifo_len & 0x1f) << 4);
+    trace_bcm2835_sdhost_edm_change("fifo run", s->edm);
 }
 
 static uint64_t bcm2835_sdhost_read(void *opaque, hwaddr offset,
@@ -280,6 +284,8 @@ static uint64_t bcm2835_sdhost_read(void *opaque, hwaddr offset,
         break;
     }
 
+    trace_bcm2835_sdhost_read(offset, res, size);
+
     return res;
 }
 
@@ -288,6 +294,8 @@ static void bcm2835_sdhost_write(void *opaque, hwaddr offset,
 {
     BCM2835SDHostState *s = (BCM2835SDHostState *)opaque;
 
+    trace_bcm2835_sdhost_write(offset, value, size);
+
     switch (offset) {
     case SDCMD:
         s->cmd = value;
@@ -314,6 +322,7 @@ static void bcm2835_sdhost_write(void *opaque, hwaddr offset,
             value &= ~0xf;
         }
         s->edm = value;
+        trace_bcm2835_sdhost_edm_change("guest register write", s->edm);
         break;
     case SDHCFG:
         s->config = value;
@@ -390,6 +399,7 @@ static void bcm2835_sdhost_reset(DeviceState *dev)
     s->cmd = 0;
     s->cmdarg = 0;
     s->edm = 0x0000c60f;
+    trace_bcm2835_sdhost_edm_change("device reset", s->edm);
     s->config = 0;
     s->hbct = 0;
     s->hblc = 0;
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 2059ace61f..bfd1d62efc 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -1,5 +1,11 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# hw/sd/bcm2835_sdhost.c
+bcm2835_sdhost_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+bcm2835_sdhost_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+bcm2835_sdhost_edm_change(const char *why, uint32_t edm) "(%s) EDM now 0x%x"
+bcm2835_sdhost_update_irq(uint32_t irq) "IRQ bits 0x%x\n"
+
 # hw/sd/core.c
 sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg, uint8_t crc) "@%s CMD%02d arg 0x%08x crc 0x%02x"
 sdbus_read(const char *bus_name, uint8_t value) "@%s value 0x%02x"
-- 
2.16.2

