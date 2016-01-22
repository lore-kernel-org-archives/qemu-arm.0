Received: by 10.25.159.19 with SMTP id i19csp269323lfe;
        Fri, 22 Jan 2016 08:17:10 -0800 (PST)
X-Received: by 10.55.54.201 with SMTP id d192mr4628480qka.23.1453479430209;
        Fri, 22 Jan 2016 08:17:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f126si7762257qhf.81.2016.01.22.08.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 08:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMeOb-0005eW-LT
	for alex.bennee@linaro.org; Fri, 22 Jan 2016 11:17:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMeOV-0005Vn-GQ
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMeOQ-0004t9-Pl
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:17:03 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOH-0004sR-3m; Fri, 22 Jan 2016 11:16:49 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOB-0003sx-Fe; Fri, 22 Jan 2016 16:16:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 16:16:42 +0000
Message-Id: <1453479402-14870-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, patches@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 10/10] hw/sd/pxa2xx_mmci: Add reset function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XfldBYnSCx/m

Add a reset function to the pxa2xx_mmci device; previously it had
no handling for system reset at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/pxa2xx_mmci.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 5170d79..fd47f40 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -510,6 +510,35 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
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
@@ -532,6 +561,7 @@ static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_pxa2xx_mmci;
+    dc->reset = pxa2xx_mmci_reset;
 }
 
 static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
-- 
1.9.1

