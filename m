Received: by 10.25.208.211 with SMTP id h202csp1236365lfg;
        Sun, 6 Mar 2016 23:07:52 -0800 (PST)
X-Received: by 10.55.40.16 with SMTP id o16mr27222348qkh.45.1457334472254;
        Sun, 06 Mar 2016 23:07:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 141si15644457qhq.25.2016.03.06.23.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:53993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpGh-00038X-Kp
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:07:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGe-00034j-Mx
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 02:07:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGd-0004H7-RN
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 02:07:48 -0500
Received: from m12-15.163.com ([220.181.12.15]:47936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGY-0004DI-HW; Mon, 07 Mar 2016 02:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=5onmxGlGcpNz/rmgDB
	8Fcfo3OCZk4KI3WQ4gzMJ1EZw=; b=Dp+lsYcOZVu2MbxUHzZSw6DnYb3KRjRfrT
	1LV8BP0/PzV6SBXx/ixkUlJ3dwS4YSLblxlkU0rJKorqUvS8Gr0RRpnLJse+panl
	uH6kyvDC46hCl4nq4kBipzgh1JJlGiy+uJtdSayQeWPM+MUzAPCvEKKW54RMEvEP
	puEU1+Xrk=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S11;
	Mon, 07 Mar 2016 15:07:09 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:50 +0800
Message-Id: <1457334350-5675-10-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4xGF4DAry3JF13WFy3urg_yoW8ArWDpF
	yxuFn29r45WFs7Jr97twsrWF15K3s7C340g3Z7tws2y3ZF9ryYyFsrG34ayrWDKrWIya1Y
	grWrXas7uF4Utw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxucNUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0h4lxlUL91wjiAAAsx
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, balrogg@gmail.com,
	peter.maydell@linaro.org
Subject: [Qemu-arm] [PATCH 9/9] hw/arm: QOM'ify versatilepb.c
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
X-TUID: 57YKi7aGx2wR

Drop the use of old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/versatilepb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index d061f0f..a2411e3 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -150,10 +150,11 @@ static const MemoryRegionOps vpb_sic_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int vpb_sic_init(SysBusDevice *sbd)
+static void vpb_sic_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    vpb_sic_state *s = VERSATILE_PB_SIC(dev);
+    DeviceState *dev = DEVICE(obj);
+    vpb_sic_state *s = VERSATILE_PB_SIC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int i;
 
     qdev_init_gpio_in(dev, vpb_sic_set_irq, 32);
@@ -161,10 +162,9 @@ static int vpb_sic_init(SysBusDevice *sbd)
         sysbus_init_irq(sbd, &s->parent[i]);
     }
     s->irq = 31;
-    memory_region_init_io(&s->iomem, OBJECT(s), &vpb_sic_ops, s,
+    memory_region_init_io(&s->iomem, obj, &vpb_sic_ops, s,
                           "vpb-sic", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    return 0;
 }
 
 /* Board init.  */
@@ -424,9 +424,7 @@ machine_init(versatile_machine_init)
 static void vpb_sic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = vpb_sic_init;
     dc->vmsd = &vmstate_vpb_sic;
 }
 
@@ -434,6 +432,7 @@ static const TypeInfo vpb_sic_info = {
     .name          = TYPE_VERSATILE_PB_SIC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(vpb_sic_state),
+    .instance_init = vpb_sic_init,
     .class_init    = vpb_sic_class_init,
 };
 
-- 
2.1.4


