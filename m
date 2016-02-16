Received: by 10.25.208.211 with SMTP id h202csp1243370lfg;
        Tue, 16 Feb 2016 03:20:41 -0800 (PST)
X-Received: by 10.140.232.211 with SMTP id d202mr28178832qhc.27.1455621641433;
        Tue, 16 Feb 2016 03:20:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u19si40154882qka.36.2016.02.16.03.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdgO-00055W-Rx
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:20:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdY1-00076l-9G
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXx-0006rT-9Y
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:01 -0500
Received: from m12-12.163.com ([220.181.12.12]:36068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXw-0006qm-Sd; Tue, 16 Feb 2016 06:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Y7SYlB+/aE3OIrTtTX
	NMWDxnMRIrw+cGlqgvc/WiOyc=; b=CXMdQMZJO90k77EdZ7Mp/x5HhFj11w5XKQ
	I7A3hodtoedlIKZrb7vH6TI3l0NIPlON/w5ofUhMrP2qyY4DufVfYYv4QMvVvaba
	f+cQ6j+nFlJRwhkWsMtSuxf4OlmWH+zBMzuGRfe32bghQLSdcJqlEgDQYnBRc5rh
	jcDdRqPq0=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXn_PgA8NWODCxBQ--.25459S8;
	Tue, 16 Feb 2016 19:11:33 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:10:27 +0800
Message-Id: <1455621027-13927-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXn_PgA8NWODCxBQ--.25459S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43XFWfJry7Xr4kZr17Awb_yoW8CrWxpF
	yxZa17Jw48ta1DJF4xJrsrKF18Cwn7Ka4Fqr4kXrnY9w1xC39xGF18C395JrZ0qFWF9FW3
	AFW8GFyxAF45Ww7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8PEfUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwYRxlXlR13nmgABs8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 16/16] hw/timer: QOM'ify tusb6010
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
X-TUID: qgOoPUON8Xfz

assign tusb6010_init to tusb6010_info.instance_init and drop
the SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/tusb6010.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
index 9f6af90..205127c 100644
--- a/hw/timer/tusb6010.c
+++ b/hw/timer/tusb6010.c
@@ -776,29 +776,27 @@ static void tusb6010_reset(DeviceState *dev)
     musb_reset(s->musb);
 }
 
-static int tusb6010_init(SysBusDevice *sbd)
+static void tusb6010_init(Object *obj)
 {
-    DeviceState *dev = DEVICE(sbd);
-    TUSBState *s = TUSB(dev);
+    DeviceState *dev = DEVICE(obj);
+    TUSBState *s = TUSB(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->otg_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_otg_tick, s);
     s->pwr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_power_tick, s);
-    memory_region_init_io(&s->iomem[1], OBJECT(s), &tusb_async_ops, s,
+    memory_region_init_io(&s->iomem[1], obj, &tusb_async_ops, s,
                           "tusb-async", UINT32_MAX);
     sysbus_init_mmio(sbd, &s->iomem[0]);
     sysbus_init_mmio(sbd, &s->iomem[1]);
     sysbus_init_irq(sbd, &s->irq);
     qdev_init_gpio_in(dev, tusb6010_irq, musb_irq_max + 1);
     s->musb = musb_init(dev, 1);
-    return 0;
 }
 
 static void tusb6010_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = tusb6010_init;
     dc->reset = tusb6010_reset;
 }
 
@@ -806,6 +804,7 @@ static const TypeInfo tusb6010_info = {
     .name          = TYPE_TUSB6010,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(TUSBState),
+    .instance_init = tusb6010_init,
     .class_init    = tusb6010_class_init,
 };
 
-- 
2.1.4


