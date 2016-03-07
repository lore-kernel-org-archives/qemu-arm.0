Received: by 10.25.208.211 with SMTP id h202csp1236685lfg;
        Sun, 6 Mar 2016 23:08:44 -0800 (PST)
X-Received: by 10.140.19.147 with SMTP id 19mr26321203qgh.70.1457334524030;
        Sun, 06 Mar 2016 23:08:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y16si15622165qhb.66.2016.03.06.23.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:08:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:54000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpHX-0004NE-G7
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:08:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGc-00033a-SW
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGZ-0004FQ-Rt
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:46 -0500
Received: from m12-15.163.com ([220.181.12.15]:47934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGZ-0004Ad-8B; Mon, 07 Mar 2016 02:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=PhtssmaZUY9KwPONOv
	c3qeVx7jUsb1yToAdMky0PnlA=; b=V7YX+8H8A+QJB6IXFaQax/Q1lylG6jjWfY
	xWfignDmmywrsItkrZ/0LnunLxWYC649/ZRmb+euiSw5Ck+RDX/bk5k/xxR+dNN/
	0InsmTqhWGpGf2lx3ECgBM9gp8q7B2cc/mSwXCKvotNPxxgc94QAzgcQFw47pqYM
	BXK/2tvFY=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S3;
	Mon, 07 Mar 2016 15:07:06 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:42 +0800
Message-Id: <1457334350-5675-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4xGF4DGryUAr1fGF45ZFb_yoW8Gw1rpF
	97uFs7CrW0kF4DG347tr4q93Z8Jwnag34fKr1xJ39akrnrKrWkKw1UJ3ya9a4UKrZ7ZF13
	JwsYgwn7ta18Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcEf5UUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMxolxlXle8S7pgAAsY
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 1/9] hw/arm: QOM'ify armv7m.c
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
X-TUID: 8Baqa+4CHZ76

Drop the use of old SysBus init function and use instance_init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/armv7m.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index ed7d97f..139247e 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -129,14 +129,14 @@ typedef struct {
     uint32_t base;
 } BitBandState;
 
-static int bitband_init(SysBusDevice *dev)
+static void bitband_init(Object *obj)
 {
-    BitBandState *s = BITBAND(dev);
+    BitBandState *s = BITBAND(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &bitband_ops, &s->base,
+    memory_region_init_io(&s->iomem, obj, &bitband_ops, &s->base,
                           "bitband", 0x02000000);
     sysbus_init_mmio(dev, &s->iomem);
-    return 0;
 }
 
 static void armv7m_bitband_init(void)
@@ -241,9 +241,7 @@ static Property bitband_properties[] = {
 static void bitband_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = bitband_init;
     dc->props = bitband_properties;
 }
 
@@ -251,6 +249,7 @@ static const TypeInfo bitband_info = {
     .name          = TYPE_BITBAND,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(BitBandState),
+    .instance_init = bitband_init,
     .class_init    = bitband_class_init,
 };
 
-- 
2.1.4


