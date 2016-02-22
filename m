Received: by 10.25.208.211 with SMTP id h202csp970650lfg;
        Sun, 21 Feb 2016 19:20:08 -0800 (PST)
X-Received: by 10.140.141.16 with SMTP id 16mr13083348qhn.82.1456111208656;
        Sun, 21 Feb 2016 19:20:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w11si27580045qka.110.2016.02.21.19.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh2e-000675-24
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:20:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzz-0000tu-43
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXgzy-0007YH-9t
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:23 -0500
Received: from m12-16.163.com ([220.181.12.16]:54667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXgzv-0007W6-Kt; Sun, 21 Feb 2016 22:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=sL+kkWlGIpX9++bczd
	xxz0Kn2R31LiCXydte25JJxa4=; b=h64kQh1ifC8rWteWUavjdPAcNSlVp0HHo1
	zHN5mwt4bo82v5qYQlCv2Ol8lrJhg0wCVEuf/qcbeyvHBA20610Qi0us1ex/k6yN
	Slaj66TTyrGyhgbe4nhJ98g+zvn6xLiJTtK0EPPYwmZLzIe6+yHWAox3o7chYf4p
	kYfNyVH5o=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S9;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:31 +0800
Message-Id: <1456110933-5457-8-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1xKryDuFWrtw1kAFy3twb_yoW8Xw1kpa
	sxZF429F4DArsxJw47JwsrJF15Jan7Ca48WrykWwnYyw12kr1DJFs7CFWS9rW5JFZ5uF15
	A3s5trW8Ja4UXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkOzsUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEB4XxlUL61WOtgAAsH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v4 7/9] hw/timer: QOM'ify puv3_ost
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
X-TUID: ls+shlKzOcAr

assign puv3_ost_init to puv3_ost_info.instance_init
and drop the SysBusDeviceClass::init

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/puv3_ost.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index 93650b7..72c87ba 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -113,9 +113,10 @@ static void puv3_ost_tick(void *opaque)
     }
 }
 
-static int puv3_ost_init(SysBusDevice *dev)
+static void puv3_ost_init(Object *obj)
 {
-    PUV3OSTState *s = PUV3_OST(dev);
+    PUV3OSTState *s = PUV3_OST(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     s->reg_OIER = 0;
     s->reg_OSSR = 0;
@@ -128,25 +129,16 @@ static int puv3_ost_init(SysBusDevice *dev)
     s->ptimer = ptimer_init(s->bh);
     ptimer_set_freq(s->ptimer, 50 * 1000 * 1000);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &puv3_ost_ops, s, "puv3_ost",
+    memory_region_init_io(&s->iomem, obj, &puv3_ost_ops, s, "puv3_ost",
             PUV3_REGS_OFFSET);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
-}
-
-static void puv3_ost_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
-
-    sdc->init = puv3_ost_init;
 }
 
 static const TypeInfo puv3_ost_info = {
     .name = TYPE_PUV3_OST,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PUV3OSTState),
-    .class_init = puv3_ost_class_init,
+    .instance_init = puv3_ost_init,
 };
 
 static void puv3_ost_register_type(void)
-- 
2.1.4


