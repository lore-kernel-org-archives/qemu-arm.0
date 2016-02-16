Received: by 10.25.208.211 with SMTP id h202csp1242536lfg;
        Tue, 16 Feb 2016 03:18:55 -0800 (PST)
X-Received: by 10.140.96.245 with SMTP id k108mr27492870qge.31.1455621535609;
        Tue, 16 Feb 2016 03:18:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x130si40084324qka.101.2016.02.16.03.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:18:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdeg-0001nc-Sq
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:18:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdYC-0007Sx-GO
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdYB-0006wz-EK
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:12 -0500
Received: from m12-13.163.com ([220.181.12.13]:49336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdY9-0006vc-Ma; Tue, 16 Feb 2016 06:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=N59p/sGrqqQizxQNS7
	+x3UwuHziAwX8J5rGt80ZKvy0=; b=ldEZxDxci2CcsyERgm7RMVr2dANKq99JN2
	6wWWAFWeg82KIZ0VCi7yZ1w69Qh2eAEHVorBBk094CIIrBNeGKqvSLkxMuTmzV3J
	6n4tLgkdN5mVU4OCJyGVXL0Fq+lc9Yqz4hgnJJv+YCiZvLIlbpfo/CZeG1v44ZV2
	Iq1LDtl5E=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S11;
	Tue, 16 Feb 2016 19:11:17 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:41 +0800
Message-Id: <1455620981-13868-10-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S11
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1UAF1fuFy3WF48XFyUGFg_yoW5WF1rpF
	WxAF95WrW8GF47JrWfKrZ7Gas5Jwn3Gw48t3WxGwsakw17Gr95Jr1kA3yS9FWDJrZ7ZF4r
	tay0yw17W3WUGw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U09a9UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBURxlUL6veMDwAAsS
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 09/16] hw/timer: QOM'ify m48txx_sysbus (pass
	1)
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
X-TUID: ySdk04hW+wB3

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/m48t59.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index bbcfeb2..3c683aa 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -763,30 +763,31 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static int m48t59_init1(SysBusDevice *dev)
+static void m48t59_init1(Object *obj)
 {
-    M48txxSysBusDeviceClass *u = M48TXX_SYS_BUS_GET_CLASS(dev);
-    M48txxSysBusState *d = M48TXX_SYS_BUS(dev);
-    Object *o = OBJECT(dev);
+    M48txxSysBusDeviceClass *u = M48TXX_SYS_BUS_GET_CLASS(obj);
+    M48txxSysBusState *d = M48TXX_SYS_BUS(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     M48t59State *s = &d->state;
-    Error *err = NULL;
 
     s->model = u->info.model;
     s->size = u->info.size;
     sysbus_init_irq(dev, &s->IRQ);
 
-    memory_region_init_io(&s->iomem, o, &nvram_ops, s, "m48t59.nvram",
+    memory_region_init_io(&s->iomem, obj, &nvram_ops, s, "m48t59.nvram",
                           s->size);
-    memory_region_init_io(&d->io, o, &m48t59_io_ops, s, "m48t59", 4);
-    sysbus_init_mmio(dev, &s->iomem);
-    sysbus_init_mmio(dev, &d->io);
-    m48t59_realize_common(s, &err);
-    if (err != NULL) {
-        error_free(err);
-        return -1;
-    }
+    memory_region_init_io(&d->io, obj, &m48t59_io_ops, s, "m48t59", 4);
+}
 
-    return 0;
+static void m48t59_realize(DeviceState *dev, Error **errp)
+{
+    M48txxSysBusState *d = M48TXX_SYS_BUS(dev);
+    M48t59State *s = &d->state;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_mmio(sbd, &d->io);
+    m48t59_realize_common(s, errp);
 }
 
 static uint32_t m48txx_isa_read(Nvram *obj, uint32_t addr)
@@ -860,10 +861,9 @@ static Property m48t59_sysbus_properties[] = {
 static void m48txx_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
     NvramClass *nc = NVRAM_CLASS(klass);
 
-    k->init = m48t59_init1;
+    dc->realize = m48t59_realize;
     dc->reset = m48t59_reset_sysbus;
     dc->props = m48t59_sysbus_properties;
     nc->read = m48txx_sysbus_read;
@@ -889,6 +889,7 @@ static const TypeInfo m48txx_sysbus_type_info = {
     .name = TYPE_M48TXX_SYS_BUS,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(M48txxSysBusState),
+    .instance_init = m48t59_init1,
     .abstract = true,
     .class_init = m48txx_sysbus_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.1.4


