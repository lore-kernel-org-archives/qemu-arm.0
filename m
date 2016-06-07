Received: by 10.25.27.66 with SMTP id b63csp1937676lfb;
        Tue, 7 Jun 2016 03:52:52 -0700 (PDT)
X-Received: by 10.55.40.68 with SMTP id o65mr19536645qkh.201.1465296772107;
        Tue, 07 Jun 2016 03:52:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si13684919qke.40.2016.06.07.03.52.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAEct-0002aK-DG
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:52:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENQ-0005Pg-9z
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAENH-0002XA-Rh
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 06:36:51 -0400
Received: from m12-18.163.com ([220.181.12.18]:51398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAENA-0002Ux-K8; Tue, 07 Jun 2016 06:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Okd+lsxPYpE0MapdvC
	oikaxYdrJzq0SZ7zgm/s9Ibkw=; b=AOBkev0AwvkG89XRLVEMJh7gZV1j6r4i+s
	ts0AS79E6pLlWmm8G8tNkrimvrdjmnuCiKGlpXx+DANwoUtEAWdV59Z60sgLCWwR
	N9nDfQMaf70/oIdzEMdNcdsof6KNyPWqJd5v8kWtuF4MaKIwqk4W1ALNBf80pnA+
	SpTpifUnI=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZ5UeKo1ZXnD8LAA--.4292S6;
	Tue, 07 Jun 2016 18:36:11 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:35:44 +0800
Message-Id: <1465295747-11651-5-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
References: <1465295747-11651-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECZ5UeKo1ZXnD8LAA--.4292S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4UuFykWr4fCFyUCF4UArb_yoW5XF1Dpa
	yfXF1F9r4UtFsxGrZ3Jr17Wr1rAwnak3WxXrW7G3WfK3W8urZ8tF1kJ34avFyDWrZ2k3Wr
	XrWDJw17ArnrZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jD5rcUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hyBxlUL-PlFKQAAs+
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-arm] [PATCH 14/17] hw/dma: QOM'ify pxa2xx_dma.c
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	balrogg@gmail.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sIv7DVSFvRAV

split the old SysBus init function into an instance_init
and a Device realize function

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/dma/pxa2xx_dma.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index 2306abc..634a432 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -12,6 +12,7 @@
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
+#include "qapi/error.h"
 
 #define PXA255_DMA_NUM_CHANNELS 16
 #define PXA27X_DMA_NUM_CHANNELS 32
@@ -450,31 +451,36 @@ static void pxa2xx_dma_request(void *opaque, int req_num, int on)
     }
 }
 
-static int pxa2xx_dma_init(SysBusDevice *sbd)
+static void pxa2xx_dma_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+    PXA2xxDMAState *s = PXA2XX_DMA(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memset(s->req, 0, sizeof(uint8_t) * PXA2XX_DMA_NUM_REQUESTS);
+
+    qdev_init_gpio_in(dev, pxa2xx_dma_request, PXA2XX_DMA_NUM_REQUESTS);
+
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_dma_ops, s,
+                          "pxa2xx.dma", 0x00010000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void pxa2xx_dma_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(sbd);
     PXA2xxDMAState *s = PXA2XX_DMA(dev);
     int i;
 
     if (s->channels <= 0) {
-        return -1;
+        error_setg(errp, "channels value invalid");
+        return;
     }
 
     s->chan = g_new0(PXA2xxDMAChannel, s->channels);
 
     for (i = 0; i < s->channels; i ++)
         s->chan[i].state = DCSR_STOPINTR;
-
-    memset(s->req, 0, sizeof(uint8_t) * PXA2XX_DMA_NUM_REQUESTS);
-
-    qdev_init_gpio_in(dev, pxa2xx_dma_request, PXA2XX_DMA_NUM_REQUESTS);
-
-    memory_region_init_io(&s->iomem, OBJECT(s), &pxa2xx_dma_ops, s,
-                          "pxa2xx.dma", 0x00010000);
-    sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq);
-
-    return 0;
 }
 
 DeviceState *pxa27x_dma_init(hwaddr base, qemu_irq irq)
@@ -553,18 +559,18 @@ static Property pxa2xx_dma_properties[] = {
 static void pxa2xx_dma_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pxa2xx_dma_init;
     dc->desc = "PXA2xx DMA controller";
     dc->vmsd = &vmstate_pxa2xx_dma;
     dc->props = pxa2xx_dma_properties;
+    dc->realize = pxa2xx_dma_realize;
 }
 
 static const TypeInfo pxa2xx_dma_info = {
     .name          = TYPE_PXA2XX_DMA,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PXA2xxDMAState),
+    .instance_init = pxa2xx_dma_init,
     .class_init    = pxa2xx_dma_class_init,
 };
 
-- 
2.1.4


