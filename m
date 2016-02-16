Received: by 10.25.208.211 with SMTP id h202csp1241591lfg;
        Tue, 16 Feb 2016 03:16:52 -0800 (PST)
X-Received: by 10.55.56.134 with SMTP id f128mr26228301qka.92.1455621412048;
        Tue, 16 Feb 2016 03:16:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si40144262qgg.2.2016.02.16.03.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:16:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdch-0006dR-Ad
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:16:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXy-00070h-Bb
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXu-0006q7-9l
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:58 -0500
Received: from m12-12.163.com ([220.181.12.12]:35957)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXt-0006pC-V1; Tue, 16 Feb 2016 06:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=hybcemMKZJUSibcMPe
	K+sEs/4DqHIWS6QV6WMv2Uw5c=; b=jQrQshQCjumWFGOBgl2kbkQki6QE1VF8zC
	6wWMl3hgkknh1m7FFU8a57TqY7Be45nCMdEXV612GIWcd1KRRKEUVYcOEHYFwFZq
	XxNKX1VwwMfjt0UZvjj6kdCPd1YfugUODQ3383L3FxC6/KdldotP/V/jhDINIbkU
	A4dx7+7e4=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXn_PgA8NWODCxBQ--.25459S4;
	Tue, 16 Feb 2016 19:11:33 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:10:23 +0800
Message-Id: <1455621027-13927-3-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DMCowABXn_PgA8NWODCxBQ--.25459S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43XFWfJr4DKFy7Jw1xuFg_yoW8AF43pF
	ZruF1qvF48Jrs5Z3yxKF1DWF1DGws7Ca4rGrn2y3WSk3W3Kr1rJF1kA3yayFW7trWruF45
	Zry8JrWUAa18Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVxRhUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAYRxlSINZloDgAAsL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 12/16] hw/timer: QOM'ify pl031
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
X-TUID: JrSQ/t2c/4T/

assign pl031_init to pl031_info.instance_init and drop the
SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/pl031.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index d99d18c..3ccb2cb 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -192,12 +192,13 @@ static const MemoryRegionOps pl031_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int pl031_init(SysBusDevice *dev)
+static void pl031_init(Object *obj)
 {
-    PL031State *s = PL031(dev);
+    PL031State *s = PL031(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     struct tm tm;
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &pl031_ops, s, "pl031", 0x1000);
+    memory_region_init_io(&s->iomem, obj, &pl031_ops, s, "pl031", 0x1000);
     sysbus_init_mmio(dev, &s->iomem);
 
     sysbus_init_irq(dev, &s->irq);
@@ -206,7 +207,6 @@ static int pl031_init(SysBusDevice *dev)
         qemu_clock_get_ns(rtc_clock) / get_ticks_per_sec();
 
     s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
-    return 0;
 }
 
 static void pl031_pre_save(void *opaque)
@@ -249,9 +249,7 @@ static const VMStateDescription vmstate_pl031 = {
 static void pl031_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = pl031_init;
     dc->vmsd = &vmstate_pl031;
 }
 
@@ -259,6 +257,7 @@ static const TypeInfo pl031_info = {
     .name          = TYPE_PL031,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL031State),
+    .instance_init = pl031_init,
     .class_init    = pl031_class_init,
 };
 
-- 
2.1.4


