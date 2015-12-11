Received: by 10.182.158.201 with SMTP id ww9csp177863obb;
        Fri, 11 Dec 2015 08:50:54 -0800 (PST)
X-Received: by 10.141.2.86 with SMTP id e83mr16425277qhd.64.1449852654090;
        Fri, 11 Dec 2015 08:50:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 85si10809485qha.128.2015.12.11.08.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 08:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7QuC-0008Av-K5
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 11:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7Qrd-0003sa-1j
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:48:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7Qrc-0000re-0x
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:48:12 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qrb-0000ra-K2; Fri, 11 Dec 2015 11:48:11 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qgx-0001JD-Pw; Fri, 11 Dec 2015 16:37:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 11 Dec 2015 16:37:11 +0000
Message-Id: <1449851831-4966-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	patches@linaro.org, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 10/10] hw/sd/pxa2xx_mmci: Add reset function
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
X-TUID: yuTsUE8V9cEN

Add a reset function to the pxa2xx_mmci device; previously it had
no handling for system reset at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 81fec4d..3df927e 100644
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
@@ -526,6 +555,13 @@ static void pxa2xx_mmci_instance_init(Object *obj)
                         TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
 }
 
+static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = pxa2xx_mmci_reset;
+}
+
 static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
 {
     SDBusClass *sbc = SD_BUS_CLASS(klass);
@@ -539,6 +575,7 @@ static const TypeInfo pxa2xx_mmci_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PXA2xxMMCIState),
     .instance_init = pxa2xx_mmci_instance_init,
+    .class_init = pxa2xx_mmci_class_init,
 };
 
 static const TypeInfo pxa2xx_mmci_bus_info = {
-- 
1.9.1

