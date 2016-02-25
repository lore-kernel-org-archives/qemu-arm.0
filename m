Received: by 10.25.208.211 with SMTP id h202csp2730075lfg;
        Thu, 25 Feb 2016 02:33:58 -0800 (PST)
X-Received: by 10.140.38.47 with SMTP id s44mr54261284qgs.22.1456396436743;
        Thu, 25 Feb 2016 02:33:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si7471380qgt.99.2016.02.25.02.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:33:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtF6-000876-7G
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:33:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtEE-0006xg-Fw
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:33:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtEA-0001gY-Cn
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:33:02 -0500
Received: from m12-14.163.com ([220.181.12.14]:54653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYtE9-0001d3-Ny; Thu, 25 Feb 2016 05:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=uq/FLX+f2AfdmTI2J/
	u0TnZkJndlHrGZEK5Sql+OOKw=; b=OyNTyP39g/WUKasuNJqq3yHrjNN0JhRmPu
	l4KP2wQ2jdLTADF+lqGtzdhF7fyUB8wGnHfWeCh9wvqSOEKOfRA/5E/XFaqkzZo0
	2OpyNyb3deKAdmUxoRQ0nlVsGuJo3k3zkDnuGd/5rGb7hU309oVsx0NAVd6sWD2p
	0vKFv8aTQ=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp10 (Coremail) with SMTP id DsCowAB3JtoL2M5WrXOWCA--.37006S5;
	Thu, 25 Feb 2016 18:31:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Feb 2016 18:30:31 +0800
Message-Id: <1456396236-2759-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowAB3JtoL2M5WrXOWCA--.37006S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1DtF1xCF4kGr45AFyUtrb_yoW5Xw4rpF
	Z7AF95WrW8GF47JrWfKrWkGas5Jwn3Gw48t3WxGwsakw1xGr95JF1kA3ya9rWDGrZ7ZF4r
	tay8tF13W3W7Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxJ5rUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTBgaxlSINjh3xwAAsq
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v5 3/8] hw/timer: QOM'ify m48txx_sysbus (pass 1)
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
X-TUID: uil6tkDQEV2o

* split the old SysBus init function into an instance_init
  and a Device realize function
* use DeviceClass::realize instead of SysBusDeviceClass::init

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


