Received: by 10.182.158.201 with SMTP id ww9csp254117obb;
        Thu, 3 Dec 2015 14:47:50 -0800 (PST)
X-Received: by 10.140.99.86 with SMTP id p80mr14162913qge.97.1449182870148;
        Thu, 03 Dec 2015 14:47:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8si3088462qgd.114.2015.12.03.14.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 14:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4cfF-0004Dv-Qg
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 17:47:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4cfD-0004AY-SE
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 17:47:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4cfC-00029t-Vk
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 17:47:47 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a4cfA-00029I-TB; Thu, 03 Dec 2015 17:47:45 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a4cIq-0005ms-H0; Thu, 03 Dec 2015 22:24:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  3 Dec 2015 22:24:40 +0000
Message-Id: <1449181480-22209-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449181480-22209-1-git-send-email-peter.maydell@linaro.org>
References: <1449181480-22209-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org
Subject: [Qemu-arm] [PATCH v2 3/3] hw/sd/pxa2xx_mmci: Add reset function
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
X-TUID: urwD8sOVf0Zv

Add a reset function to the pxa2xx_mmci device; previously it had
no handling for system reset at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index fd76ffe..3f21021 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -469,6 +469,35 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
     sd_set_cb(s->card, readonly, coverswitch);
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
@@ -506,6 +535,7 @@ static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
     dc->realize = pxa2xx_mmci_realize;
     dc->props = pxa2xx_mmci_properties;
     dc->vmsd = &vmstate_pxa2xx_mmci;
+    dc->reset = pxa2xx_mmci_reset;
 }
 
 static const TypeInfo pxa2xx_mmci_info = {
-- 
1.9.1

