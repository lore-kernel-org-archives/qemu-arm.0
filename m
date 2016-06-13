Received: by 10.25.85.209 with SMTP id j200csp1139177lfb;
        Mon, 13 Jun 2016 04:09:41 -0700 (PDT)
X-Received: by 10.140.22.36 with SMTP id 33mr13229220qgm.0.1465816181391;
        Mon, 13 Jun 2016 04:09:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si14880434qte.13.2016.06.13.04.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPkS-0000hH-OZ
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:09:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPX5-0004mV-1J
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:55:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWz-0003Oe-4q
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:55:50 -0400
Received: from m50-134.163.com ([123.125.50.134]:48186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWh-0003Hq-0h; Mon, 13 Jun 2016 06:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Okd+lsxPYpE0MapdvC
	oikaxYdrJzq0SZ7zgm/s9Ibkw=; b=CsNZX5l2JxZjIC24655yMJ46EfzSlIX4vq
	L0aE9sKZnhqvNzU2Z84yQYdtn1eBnEfU4m2axVn+abjS/qCiLk3bH5703zHQDcji
	l4l1Xtak/D0uqSyMKdWnKl7gkNC8RjbkpLBsqDRNzRLyXns9Gj+l8evrwJpA0gFs
	WeOGxKPxA=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowABHnZnpkF5XcVHjBA--.36675S7;
	Mon, 13 Jun 2016 18:54:38 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:14 +0800
Message-Id: <1465815255-21776-12-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DtGowABHnZnpkF5XcVHjBA--.36675S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4UuFykWr4fCFyUCF4UArb_yoW5XF1Dpa
	yfXF1F9r4UtFsxGrZ3Jr17Wr1rAwnak3WxXrW7G3WfK3W8urZ8tF1kJ34avFyDWrZ2k3Wr
	XrWDJw17ArnrZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jaHq7UUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0g6HxlUL-VqvsgAAs5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-arm] [RESEND PATCH 11/12] hw/dma: QOM'ify pxa2xx_dma.c
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
X-TUID: pjPCvSgyoKBB

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


