Received: by 10.25.208.211 with SMTP id h202csp1243433lfg;
        Tue, 16 Feb 2016 03:20:47 -0800 (PST)
X-Received: by 10.140.232.211 with SMTP id d202mr28179337qhc.27.1455621646928;
        Tue, 16 Feb 2016 03:20:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si40100778qkb.86.2016.02.16.03.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdgT-0005FT-VZ
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:20:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdYT-0007zK-DU
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdYO-00071u-Mw
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:12:29 -0500
Received: from m12-13.163.com ([220.181.12.13]:49896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdYN-00071O-V7; Tue, 16 Feb 2016 06:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=2wGMhyDMswXcHh6e+T
	ZmjggK8o/qyUXX1+3NNxqEm6Y=; b=occOvZSwT11FyBiz4cm2KQMtp2/t5he6qs
	3tkVOcX5hgkzmCxwiN6UBJWcpG84HaKLF8UArVn9Ydk8FXsVwWm5n1q2PZshTKOz
	bb8xsuDO8vErRANb4jYaHGi7FkXI6OZZVNDX6u8eTqf9fH/xPMqV8dG25Gl3pzmQ
	kDvZVcSrQ=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S8;
	Tue, 16 Feb 2016 19:11:17 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:38 +0800
Message-Id: <1455620981-13868-7-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43XFWfJrW3Ww4DKr18uFg_yoW8Zr15pF
	ZrC3WkJw4fJFWkJFWIkrnrWF1DCFnYkFWvqr9akryIyrnrKry7tF18Aay5A3WUJrZ5Z3W5
	A34xJr13AF4UC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U02NtUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBURxlUL6veMDgAAsT
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 06/16] hw/timer: QOM'ify exynos4210_rtc
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
X-TUID: MOcstYfWYyiF

assign exynos4210_rtc_init to exynos4210_rtc_info.instance_init
and drop the SysBusDeviceClass::init

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/timer/exynos4210_rtc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index 3341303..f21fb54 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -547,9 +547,10 @@ static const MemoryRegionOps exynos4210_rtc_ops = {
 /*
  * RTC timer initialization
  */
-static int exynos4210_rtc_init(SysBusDevice *dev)
+static void exynos4210_rtc_init(Object *obj)
 {
-    Exynos4210RTCState *s = EXYNOS4210_RTC(dev);
+    Exynos4210RTCState *s = EXYNOS4210_RTC(obj);
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     QEMUBH *bh;
 
     bh = qemu_bh_new(exynos4210_rtc_tick, s);
@@ -564,19 +565,15 @@ static int exynos4210_rtc_init(SysBusDevice *dev)
     sysbus_init_irq(dev, &s->alm_irq);
     sysbus_init_irq(dev, &s->tick_irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &exynos4210_rtc_ops, s,
+    memory_region_init_io(&s->iomem, obj, &exynos4210_rtc_ops, s,
                           "exynos4210-rtc", EXYNOS4210_RTC_REG_MEM_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
 }
 
 static void exynos4210_rtc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
-    k->init = exynos4210_rtc_init;
     dc->reset = exynos4210_rtc_reset;
     dc->vmsd = &vmstate_exynos4210_rtc_state;
 }
@@ -585,6 +582,7 @@ static const TypeInfo exynos4210_rtc_info = {
     .name          = TYPE_EXYNOS4210_RTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210RTCState),
+    .instance_init = exynos4210_rtc_init,
     .class_init    = exynos4210_rtc_class_init,
 };
 
-- 
2.1.4


