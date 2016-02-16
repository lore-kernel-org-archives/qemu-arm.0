Received: by 10.25.208.211 with SMTP id h202csp1451255lfg;
        Tue, 16 Feb 2016 10:17:16 -0800 (PST)
X-Received: by 10.140.167.135 with SMTP id n129mr29598444qhn.73.1455646636151;
        Tue, 16 Feb 2016 10:17:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si5625963qhq.26.2016.02.16.10.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:17:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkBX-0005gw-Ij
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:17:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4W-0001zy-Dk
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:10:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4V-0005sP-GH
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:10:00 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4V-0005sC-A9; Tue, 16 Feb 2016 13:09:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4P-0003Sh-LW; Tue, 16 Feb 2016 18:09:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 18:09:52 +0000
Message-Id: <1455646193-13238-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-devel] [PATCH v3 10/10] hw/sd/pxa2xx_mmci: Add reset function
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R2M3WhWBamRc

Add a reset function to the pxa2xx_mmci device; previously it had
no handling for system reset at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/pxa2xx_mmci.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index d9f5202..001d04e 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -511,6 +511,35 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
     pxa2xx_mmci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
 }
 
+static void pxa2xx_mmci_reset(DeviceState *d)
+{
+    PXA2xxMMCIState *s = PXA2XX_MMCI(d);
+
+    s->status = 0;
+    s->clkrt = 0;
+    s->spi = 0;
+    s->cmdat = 0;
+    s->resp_tout = 0;
+    s->read_tout = 0;
+    s->blklen = 0;
+    s->numblk = 0;
+    s->intmask = 0;
+    s->intreq = 0;
+    s->cmd = 0;
+    s->arg = 0;
+    s->active = 0;
+    s->bytesleft = 0;
+    s->tx_start = 0;
+    s->tx_len = 0;
+    s->rx_start = 0;
+    s->rx_len = 0;
+    s->resp_len = 0;
+    s->cmdreq = 0;
+    memset(s->tx_fifo, 0, sizeof(s->tx_fifo));
+    memset(s->rx_fifo, 0, sizeof(s->rx_fifo));
+    memset(s->resp_fifo, 0, sizeof(s->resp_fifo));
+}
+
 static void pxa2xx_mmci_instance_init(Object *obj)
 {
     PXA2xxMMCIState *s = PXA2XX_MMCI(obj);
@@ -533,6 +562,7 @@ static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_pxa2xx_mmci;
+    dc->reset = pxa2xx_mmci_reset;
 }
 
 static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
-- 
1.9.1

