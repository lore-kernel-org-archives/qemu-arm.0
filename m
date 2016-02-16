Received: by 10.25.208.211 with SMTP id h202csp1241703lfg;
        Tue, 16 Feb 2016 03:17:06 -0800 (PST)
X-Received: by 10.140.241.72 with SMTP id m69mr28056262qhc.33.1455621425946;
        Tue, 16 Feb 2016 03:17:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x69si39977777qha.127.2016.02.16.03.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:17:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdcv-00072t-CK
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:17:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdY0-00075i-SA
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXv-0006qP-1Q
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:00 -0500
Received: from m12-12.163.com ([220.181.12.12]:35703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXu-0006om-J1; Tue, 16 Feb 2016 06:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=n3h2kpZrqaH3tCd1Ws
	3FHOF8flVT79P1oGqo6SoGxfs=; b=W8ZfZvgW7Qc9gmhJzIz3Ys20u5gCF4aZsH
	o1k7pxAm1zAxw44+kNSf8cA/rr5zWo9DkvvYF9fVcCaC33U1nB5HFYDq+HAf5pJY
	KYVToLA3v3oB0Qv0BhN//ztzp7Z32HjSR8djxEE1u1HGFtMszK24+QPahPAI60oW
	Iyy18tteY=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXn_PgA8NWODCxBQ--.25459S5;
	Tue, 16 Feb 2016 19:11:33 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:10:24 +0800
Message-Id: <1455621027-13927-4-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXn_PgA8NWODCxBQ--.25459S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1fCF1rJFWkXr48JrWrZrb_yoW8WrWkpa
	sxZF4I9F4DArsxJw47JwsrJF1rJan7Ca48WrykWwnYy342kryDJFs7GFWS9FW5JFZY9F1Y
	y3s5trW8Ja4UXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ua0PhUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgYRxlZXwGucQQAAs0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 13/16] hw/timer: QOM'ify puv3_ost
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
X-TUID: TSO2rWuafyae

assign puv3_ost_init to puv3_ost_info.instance_init
and drop the SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


