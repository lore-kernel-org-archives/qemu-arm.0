Received: by 10.25.208.211 with SMTP id h202csp1237716lfg;
        Sun, 6 Mar 2016 23:11:29 -0800 (PST)
X-Received: by 10.140.88.11 with SMTP id s11mr25918252qgd.93.1457334689600;
        Sun, 06 Mar 2016 23:11:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si15644091qhc.33.2016.03.06.23.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:54034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpKD-0000nm-0d
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:11:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGc-00033b-Sb
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGa-0004Fu-Nw
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:46 -0500
Received: from m12-15.163.com ([220.181.12.15]:47933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGZ-0004E7-2W; Mon, 07 Mar 2016 02:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=5Jv8raCWvdbeUDP8cx
	IEIW1NcTBLuIb0LZvPs5H9ECM=; b=RPviXVpUvK239b0CzPadT7G18+CdW1Dww3
	Rbd5/37DsObc/yKxgWF3kwfYWoWjFYUEnssQoL9dzYbCNI1ZPastNOXdjuy9Mbmm
	4W6WDXAKw1b8pQTZmwP0pVvz0JaZQ03slhc548tCuKdzVeIV2Ex+eFZZcFL3nfpv
	ZYZavHvz4=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S5;
	Mon, 07 Mar 2016 15:07:06 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:44 +0800
Message-Id: <1457334350-5675-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr4UKFyDZw4xCw48XFyxXwb_yoW5trWxpF
	93XF9rWFW8tF4DZrZrtFnxu3W8Cwn7CryfKr97Arnakr4DCry2gF18C3yYkFWUJrZ2ya45
	XrWFgF1Iy3WUtw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9sqXUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFhslxlWBPfCR7wAAsJ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 3/9] hw/arm: QOM'ify integratorcp.c
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
X-TUID: RlfUi7Xls6wk

* Drop the use of old SysBus init function and use instance_init
* Remove the empty 'icp_pic_class_init' from Typeinfo

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/integratorcp.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index c6656a8..782201a 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -239,9 +239,10 @@ static const MemoryRegionOps integratorcm_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int integratorcm_init(SysBusDevice *dev)
+static void integratorcm_init(Object *obj)
 {
-    IntegratorCMState *s = INTEGRATOR_CM(dev);
+    IntegratorCMState *s = INTEGRATOR_CM(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     s->cm_osc = 0x01000048;
     /* ??? What should the high bits of this value be?  */
@@ -266,17 +267,16 @@ static int integratorcm_init(SysBusDevice *dev)
     s->cm_init = 0x00000112;
     s->cm_refcnt_offset = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24,
                                    1000);
-    memory_region_init_ram(&s->flash, OBJECT(s), "integrator.flash", 0x100000,
+    memory_region_init_ram(&s->flash, obj, "integrator.flash", 0x100000,
                            &error_fatal);
     vmstate_register_ram_global(&s->flash);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &integratorcm_ops, s,
+    memory_region_init_io(&s->iomem, obj, &integratorcm_ops, s,
                           "integratorcm", 0x00800000);
     sysbus_init_mmio(dev, &s->iomem);
 
     integratorcm_do_remap(s);
     /* ??? Save/restore.  */
-    return 0;
 }
 
 /* Integrator/CP hardware emulation.  */
@@ -391,18 +391,18 @@ static const MemoryRegionOps icp_pic_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int icp_pic_init(SysBusDevice *sbd)
+static void icp_pic_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    icp_pic_state *s = INTEGRATOR_PIC(dev);
+    DeviceState *dev = DEVICE(obj);
+    icp_pic_state *s = INTEGRATOR_PIC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     qdev_init_gpio_in(dev, icp_pic_set_irq, 32);
     sysbus_init_irq(sbd, &s->parent_irq);
     sysbus_init_irq(sbd, &s->parent_fiq);
-    memory_region_init_io(&s->iomem, OBJECT(s), &icp_pic_ops, s,
+    memory_region_init_io(&s->iomem, obj, &icp_pic_ops, s,
                           "icp-pic", 0x00800000);
     sysbus_init_mmio(sbd, &s->iomem);
-    return 0;
 }
 
 /* CP control registers.  */
@@ -627,9 +627,7 @@ static Property core_properties[] = {
 static void core_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = integratorcm_init;
     dc->props = core_properties;
 }
 
@@ -637,21 +635,15 @@ static const TypeInfo core_info = {
     .name          = TYPE_INTEGRATOR_CM,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(IntegratorCMState),
+    .instance_init = integratorcm_init,
     .class_init    = core_class_init,
 };
 
-static void icp_pic_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
-
-    sdc->init = icp_pic_init;
-}
-
 static const TypeInfo icp_pic_info = {
     .name          = TYPE_INTEGRATOR_PIC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(icp_pic_state),
-    .class_init    = icp_pic_class_init,
+    .instance_init = icp_pic_init,
 };
 
 static const TypeInfo icp_ctrl_regs_info = {
-- 
2.1.4


