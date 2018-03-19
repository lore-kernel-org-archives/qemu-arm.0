Received: by 10.28.91.67 with SMTP id p64csp2799153wmb;
        Mon, 19 Mar 2018 09:26:28 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu/wypy6Vccy62l0NxhOiFymucbFHc2BBpzJJCNXI0J7GigLgIeubgbel+XMQjzz20krMmO
X-Received: by 10.129.181.76 with SMTP id c12mr4298423ywk.250.1521476788071;
        Mon, 19 Mar 2018 09:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521476788; cv=none;
        d=google.com; s=arc-20160816;
        b=vMEt7bzlhyLuBk91uGMhO6XuPGASDsNm1TSw7Sye6Hsk9GPMvCbSh3In5G6ZlPGeXS
         73P7/X+VBWUtyyaJGjPfnW69O2Px6nkMvJZjGK+E1dowQ9dTibI2jcsm9KJj40DyIXr/
         xNxhWHNve3w5feBcUxlc5j9iaJQzz9LetfjINSyANzVY5B6DAOTk022JZ9lKkbrFi5pI
         IttBIgECWoPHYURnrKk3WGSpFkXYsvQO60BNi6FKSOMb70zqacCSpb1wbB9BDLHjXgF9
         0CsmoUlL+ObNNFnNcrVHGNjMAXQ8CC186j9+ee/DvEHemQotQIBCBb3vuUBGWCISDnI+
         70/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8Mi6sQA6C13VH2Kf79kMVqQA5tAkjPYSboAliBWWx64=;
        b=rDopdMXWMMLaemVfAdqqpKifshWXE37OdWyKODWX9wZZ+wyWapL8oqfVPtZBcKOJhE
         TXBYoJ7f3A0AE1nntU+TbjZ3LoOcMqZFH3YVZGQsR7RggrRvDkvdnL/GQ0MmdqYprAXv
         OQrTG0KViryz6hTcN8ByhysZ4oI6gTzdDYZoH/vheRS2LkwnvFgbVpuzN/QU5nYOEUA4
         gXciQsTzj87oqEDBfMSP4F1ojfzDEBBRNpLsFtRxMYT6mPDaXB4i/iLnnkVewI9VrQn/
         EwGyPREa4L7uKcLIiu5FGRfIFsOH3Hy4WwKSemlPOHBoucSO+ErMpr/wM4sI3rBarjZF
         UqwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h23si385011qta.114.2018.03.19.09.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 09:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exxcB-0004QZ-Hm
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 12:26:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exxbJ-000433-C4
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 12:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exxbI-0007LP-2x
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 12:25:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40436)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1exxbE-0007Ez-Er; Mon, 19 Mar 2018 12:25:28 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1exxS3-0002tj-Lr; Mon, 19 Mar 2018 16:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 19 Mar 2018 16:15:56 +0000
Message-Id: <20180319161556.16446-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319161556.16446-1-peter.maydell@linaro.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-2.12 2/2] hw/sd/bcm2835_sdhost: Don't raise
 spurious interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pekka Enberg <penberg@iki.fi>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QHtd2L9dmjwp

The Linux bcm2835_sdhost driver doesn't work on QEMU, because our
model raises spurious data interrupts.  Our function
bcm2835_sdhost_fifo_run() will flag an interrupt any time it is
called with s->datacnt == 0, even if the host hasn't actually issued
a data read or write command yet.  This means that the driver gets a
spurious data interrupt as soon as it enables IRQs and then does
something else that causes us to call the fifo_run routine, like
writing to SDHCFG, and before it does the write to SDCMD to issue the
read.  The driver's IRQ handler then spins forever complaining that
there's no data and the SD controller isn't in a state where there's
going to be any data:

[   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
[   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
(continues forever).

Move the interrupt flag setting to more plausible places:
 * for BUSY, raise this as soon as a BUSYWAIT command has executed
 * for DATA, raise this when the FIFO has any space free (for a write)
   or any data in it (for a read)
 * for BLOCK, raise this when the data count is 0 and we've
   actually done some reading or writing

This is pure guesswork since the documentation for this hardware is
not public, but it is sufficient to get the Linux bcm2835_sdhost
driver to work.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/bcm2835_sdhost.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 79f3c5ceeb..0fd0853fa3 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -137,6 +137,9 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
         }
 #undef RWORD
     }
+    if ((s->cmd & SDCMD_BUSYWAIT) && (s->config & SDHCFG_BUSY_IRPT_EN)) {
+        s->status |= SDHSTS_BUSY_IRPT;
+    }
     return;
 
 error:
@@ -187,18 +190,27 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
                 n++;
                 if (n == 4) {
                     bcm2835_sdhost_fifo_push(s, value);
+                    s->status |= SDHSTS_DATA_FLAG;
+                    if (s->config & SDHCFG_DATA_IRPT_EN) {
+                        s->status |= SDHSTS_SDIO_IRPT;
+                    }
                     n = 0;
                     value = 0;
                 }
             }
             if (n != 0) {
                 bcm2835_sdhost_fifo_push(s, value);
+                s->status |= SDHSTS_DATA_FLAG;
             }
         } else { /* write */
             n = 0;
             while (s->datacnt > 0 && (s->fifo_len > 0 || n > 0)) {
                 if (n == 0) {
                     value = bcm2835_sdhost_fifo_pop(s);
+                    s->status |= SDHSTS_DATA_FLAG;
+                    if (s->config & SDHCFG_DATA_IRPT_EN) {
+                        s->status |= SDHSTS_SDIO_IRPT;
+                    }
                     n = 4;
                 }
                 n--;
@@ -207,28 +219,19 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
                 value >>= 8;
             }
         }
+        if (s->datacnt == 0) {
+            s->edm &= ~0xf;
+            s->edm |= SDEDM_FSM_DATAMODE;
+            trace_bcm2835_sdhost_edm_change("datacnt 0", s->edm);
+
+            if ((s->cmd & SDCMD_WRITE_CMD) &&
+                (s->config & SDHCFG_BLOCK_IRPT_EN)) {
+                s->status |= SDHSTS_BLOCK_IRPT;
+            }
+        }
     }
-    if (s->datacnt == 0) {
-        s->status |= SDHSTS_DATA_FLAG;
 
-        s->edm &= ~0xf;
-        s->edm |= SDEDM_FSM_DATAMODE;
-        trace_bcm2835_sdhost_edm_change("datacnt 0", s->edm);
-
-        if (s->config & SDHCFG_DATA_IRPT_EN) {
-            s->status |= SDHSTS_SDIO_IRPT;
-        }
-
-        if ((s->cmd & SDCMD_BUSYWAIT) && (s->config & SDHCFG_BUSY_IRPT_EN)) {
-            s->status |= SDHSTS_BUSY_IRPT;
-        }
-
-        if ((s->cmd & SDCMD_WRITE_CMD) && (s->config & SDHCFG_BLOCK_IRPT_EN)) {
-            s->status |= SDHSTS_BLOCK_IRPT;
-        }
-
-        bcm2835_sdhost_update_irq(s);
-    }
+    bcm2835_sdhost_update_irq(s);
 
     s->edm &= ~(0x1f << 4);
     s->edm |= ((s->fifo_len & 0x1f) << 4);
-- 
2.16.2

