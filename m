Received: by 10.25.85.209 with SMTP id j200csp1134851lfb;
        Mon, 13 Jun 2016 04:01:24 -0700 (PDT)
X-Received: by 10.55.163.65 with SMTP id m62mr13436065qke.21.1465815684442;
        Mon, 13 Jun 2016 04:01:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w188si14807612qkc.171.2016.06.13.04.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:01:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPcR-00011Z-P5
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:01:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWo-0004VH-G0
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWg-0003Ih-Tv
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:34 -0400
Received: from m50-134.163.com ([123.125.50.134]:48115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWf-0003HM-TA; Mon, 13 Jun 2016 06:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=XGDDw3Xp+SJS7PqX/n
	+gyP3RUO1lLKvETagiYM+oXMA=; b=CzAS3/IHOtrg3n29zT8lwIqShr4qhrT/KE
	j5qMp41EmeSXOfR70j3toKJqj8JXZYSgI8dhveY0yXraFyXgXpm0d6+azeJdfRdo
	LLNDQFPXbryjZ54vg4oI5Y3atMTnc0slbYnUAMb/vP5oB1EVmSSmpubML4DdV0AD
	Y0joH7Lys=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowABHnZnpkF5XcVHjBA--.36675S4;
	Mon, 13 Jun 2016 18:54:33 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:11 +0800
Message-Id: <1465815255-21776-9-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DtGowABHnZnpkF5XcVHjBA--.36675S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45Cw1ftry3Ary7GF4rZrb_yoW8XF1fpF
	9rAFWDJrZ0qFZrJ3yxtF1DCa4kJws7KrWIgr1xAws2v3W7uFy8Ga1qkaya9ay5tFWvya4Y
	q3ykGF17Aa1UJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJCztUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwuHxlXlUCv+rwAAsr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-devel] [RESEND PATCH 08/12] hw/misc: QOM'ify arm_l2x0.c
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CWip9tfp8xRR

Drop the old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/misc/arm_l2x0.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index 4442227..66a0787 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -159,14 +159,14 @@ static const MemoryRegionOps l2x0_mem_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
  };
 
-static int l2x0_priv_init(SysBusDevice *dev)
+static void l2x0_priv_init(Object *obj)
 {
-    L2x0State *s = ARM_L2X0(dev);
+    L2x0State *s = ARM_L2X0(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(dev), &l2x0_mem_ops, s,
+    memory_region_init_io(&s->iomem, obj, &l2x0_mem_ops, s,
                           "l2x0_cc", 0x1000);
     sysbus_init_mmio(dev, &s->iomem);
-    return 0;
 }
 
 static Property l2x0_properties[] = {
@@ -176,10 +176,8 @@ static Property l2x0_properties[] = {
 
 static void l2x0_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    k->init = l2x0_priv_init;
     dc->vmsd = &vmstate_l2x0;
     dc->props = l2x0_properties;
     dc->reset = l2x0_priv_reset;
@@ -189,6 +187,7 @@ static const TypeInfo l2x0_info = {
     .name = TYPE_ARM_L2X0,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(L2x0State),
+    .instance_init = l2x0_priv_init,
     .class_init = l2x0_class_init,
 };
 
-- 
2.1.4


