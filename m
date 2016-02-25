Received: by 10.25.208.211 with SMTP id h202csp2730880lfg;
        Thu, 25 Feb 2016 02:36:08 -0800 (PST)
X-Received: by 10.141.4.135 with SMTP id g129mr59160566qhd.31.1456396568103;
        Thu, 25 Feb 2016 02:36:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si7468311qgn.107.2016.02.25.02.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtHD-0003PV-J7
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:36:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtEf-0007h1-AS
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:33:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtEd-0001rb-Sa
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:33:29 -0500
Received: from m12-14.163.com ([220.181.12.14]:55843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYtEd-0001oM-3i; Thu, 25 Feb 2016 05:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=sL+kkWlGIpX9++bczd
	xxz0Kn2R31LiCXydte25JJxa4=; b=WTdPhkaS9D5lZZjjviBjCfrq7kGlTmqJ8c
	+YD4U7fUl9M8pYReHbhS8NKpMnrJZywHCpvIKTB+A7WyGcFpLKaw2hv1Og7FEn9h
	TBqYCj6lwkoPC2K78XQsoyqklulAAqNN/vDaKk1ScWxo1Lkk1b+n8/N4WnoR7gPk
	vkhhnxWEg=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp10 (Coremail) with SMTP id DsCowAB3JtoL2M5WrXOWCA--.37006S8;
	Thu, 25 Feb 2016 18:31:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Feb 2016 18:30:34 +0800
Message-Id: <1456396236-2759-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DsCowAB3JtoL2M5WrXOWCA--.37006S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1xKryDuFWrtw1kAFy3twb_yoW8Xw1kpa
	sxZF429F4DArsxJw47JwsrJF15Jan7Ca48WrykWwnYyw12kr1DJFs7CFWS9rW5JFZ5uF15
	A3s5trW8Ja4UXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOTmhUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBgaxlWBT2U2JgAAs6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v5 6/8] hw/timer: QOM'ify puv3_ost
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
X-TUID: MNY60DcFETrr

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


