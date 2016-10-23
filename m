Received: by 10.80.166.35 with SMTP id d32csp2124055edc;
        Sun, 23 Oct 2016 02:20:45 -0700 (PDT)
X-Received: by 10.237.50.39 with SMTP id y36mr9887185qtd.150.1477214445384;
        Sun, 23 Oct 2016 02:20:45 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f123si7444841qkd.299.2016.10.23.02.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 02:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byExQ-0000kZ-Qv
	for alex.bennee@linaro.org; Sun, 23 Oct 2016 05:20:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvi-0008G9-Bj
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvd-0002bV-HE
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:58 -0400
Received: from m12-11.163.com ([220.181.12.11]:39477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1byEvc-0002ag-OO; Sun, 23 Oct 2016 05:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Eief56U5QX5Gquct5G
	EQYkqbxgQCgyIbamEaIR7mssE=; b=CZukcNBoK7uatNUuw8d25FCSHIPzr/p1kf
	tgtlInKBeLIuyWAJhztMb+K5w9pjN3ixVdverJ4dwYFE16iXtpkMaRnDLUoscQpq
	iOti3Hc/5PPgNdEJlvFCmV5YW7YS38DUgG9ZNP1La42vk9TUBcYl7WI5v01KUQcK
	TyrT5zRSU=
Received: from debian.lan (unknown [114.111.167.207])
	by smtp7 (Coremail) with SMTP id C8CowACHR3FSgAxYG4EdBQ--.32654S5;
	Sun, 23 Oct 2016 17:18:21 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Oct 2016 17:18:15 +0800
Message-Id: <20161023091816.3839-4-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161023091816.3839-1-zxq_yx_007@163.com>
References: <20161023091816.3839-1-zxq_yx_007@163.com>
X-CM-TRANSID: C8CowACHR3FSgAxYG4EdBQ--.32654S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryxXr4kur1fWrWxWFWUXFb_yoW5Jw17pr
	Z7Za4qgr15tFZxXr47GFWDWF45Zwn7Ww18tF1DJws2k3y7Gw4jqryDta9IkF9rWayvka4q
	yayrWr4DGF45G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bzZXOUUUUU=
X-Originating-IP: [114.111.167.207]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOx0MxlXlV92rYAAAsd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Subject: [Qemu-devel] [PATCH 3/4] hw/arm: QOM'ify strongarm.c
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qjBqJDijwetg

Drop the old Sysbus init and use instance_init and
DeviceClass::realize instead

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/strongarm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 021cbf9..0f3216a 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -1238,6 +1238,11 @@ static void strongarm_uart_init(Object *obj)
 
     s->rx_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_rx_to, s);
     s->tx_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_tx, s);
+}
+
+static void strongarm_uart_realize(DeviceState *dev, Error **errp)
+{
+    StrongARMUARTState *s = STRONGARM_UART(dev);
 
     if (s->chr) {
         qemu_chr_add_handlers(s->chr,
@@ -1320,6 +1325,7 @@ static void strongarm_uart_class_init(ObjectClass *klass, void *data)
     dc->reset = strongarm_uart_reset;
     dc->vmsd = &vmstate_strongarm_uart_regs;
     dc->props = strongarm_uart_properties;
+    dc->realize = strongarm_uart_realize;
 }
 
 static const TypeInfo strongarm_uart_info = {
@@ -1520,19 +1526,19 @@ static int strongarm_ssp_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static int strongarm_ssp_init(SysBusDevice *sbd)
+static void strongarm_ssp_init(Object *obj)
 {
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     DeviceState *dev = DEVICE(sbd);
     StrongARMSSPState *s = STRONGARM_SSP(dev);
 
     sysbus_init_irq(sbd, &s->irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &strongarm_ssp_ops, s,
+    memory_region_init_io(&s->iomem, obj, &strongarm_ssp_ops, s,
                           "ssp", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
 
     s->bus = ssi_create_bus(dev, "ssi");
-    return 0;
 }
 
 static void strongarm_ssp_reset(DeviceState *dev)
@@ -1562,9 +1568,7 @@ static const VMStateDescription vmstate_strongarm_ssp_regs = {
 static void strongarm_ssp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = strongarm_ssp_init;
     dc->desc = "StrongARM SSP controller";
     dc->reset = strongarm_ssp_reset;
     dc->vmsd = &vmstate_strongarm_ssp_regs;
@@ -1574,6 +1578,7 @@ static const TypeInfo strongarm_ssp_info = {
     .name          = TYPE_STRONGARM_SSP,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(StrongARMSSPState),
+    .instance_init = strongarm_ssp_init,
     .class_init    = strongarm_ssp_class_init,
 };
 
-- 
2.9.3


