Received: by 10.25.208.211 with SMTP id h202csp1236649lfg;
        Sun, 6 Mar 2016 23:08:39 -0800 (PST)
X-Received: by 10.55.78.84 with SMTP id c81mr26541120qkb.85.1457334519504;
        Sun, 06 Mar 2016 23:08:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si15651154qgk.115.2016.03.06.23.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:08:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:53997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpHS-0004GD-PC
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:08:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGc-00033d-T8
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGb-0004G1-2i
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:46 -0500
Received: from m12-15.163.com ([220.181.12.15]:47932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGa-0004Am-A0; Mon, 07 Mar 2016 02:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=3+0N9yKqciLGKTXG2y
	SQN8QxlWMGyxW5riQayCbEj9E=; b=SHjZaqYRApMm1/m9DI1/7YU1uFIdpTxgTP
	T4PBEEhHLwKQLagcvtrNdQv1s8ReoPfB3jvnHjShMys7rY3gy4sqhqvdQJ3XAyg0
	lpVFfpMyL503cA/p25Rei23ZSUbb0KaB9sS0rMQvl96LZpycgzFdGyWJeWOM32Yu
	+rbfpBQeU=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S4;
	Mon, 07 Mar 2016 15:07:06 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:43 +0800
Message-Id: <1457334350-5675-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4xGF4kur1DJr43XryftFb_yoW8Xw4kpw
	n7uFZ0kr45GF4kAF47XF95uF4UJan2kryxWrZ7Ja1Sy3W7CrWUuw4rGFySkryjqrWkAFy3
	tr18t3WkJr4rCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9OzsUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOxslxlXlSMIJuwAAsL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 2/9] hw/arm: QOM'ify highbank.c
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
X-TUID: nCPOdecFL21t

Drop the use of old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/highbank.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index e25cf5e..8f38dff 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -167,23 +167,20 @@ static void highbank_regs_reset(DeviceState *dev)
     s->regs[0x43] = 0x05F40121;
 }
 
-static int highbank_regs_init(SysBusDevice *dev)
+static void highbank_regs_init(Object *obj)
 {
-    HighbankRegsState *s = HIGHBANK_REGISTERS(dev);
+    HighbankRegsState *s = HIGHBANK_REGISTERS(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
+    memory_region_init_io(&s->iomem, obj, &hb_mem_ops, s->regs,
                           "highbank_regs", 0x1000);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static void highbank_regs_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    sbc->init = highbank_regs_init;
     dc->desc = "Calxeda Highbank registers";
     dc->vmsd = &vmstate_highbank_regs;
     dc->reset = highbank_regs_reset;
@@ -193,6 +190,7 @@ static const TypeInfo highbank_regs_info = {
     .name          = TYPE_HIGHBANK_REGISTERS,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(HighbankRegsState),
+    .instance_init = highbank_regs_init,
     .class_init    = highbank_regs_class_init,
 };
 
-- 
2.1.4


