Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2184913wrt;
        Fri, 23 Nov 2018 07:32:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5eUxnl0KJpcy4g07xrfc5Xthq+6Yh6DdUH/2UP1DeIHAiEaHdLiPW56j+jqjYUdF7nU5nzS
X-Received: by 2002:a81:2185:: with SMTP id h127-v6mr16760612ywh.331.1542987130997;
        Fri, 23 Nov 2018 07:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542987130; cv=none;
        d=google.com; s=arc-20160816;
        b=HB9gBO33mEIVQEODSfH/fMBaHTHwjwFhuRSMRBhLnVVfh22iqgZwr/7WRot3xuEKJ+
         HWRRMJNBv1P3gC008NAWuqTzOUY+W4b0HS1isorqpt/lrbjp+d2dTVnYICMU2STNvKS3
         ArD3zN7lhg1OqJZUdSybQ5SDMaMaecC1HH6Lvkjbfaf0mvmvLH8rbmuQZw7jCiQ8D1pt
         d4+9Gz7HyX8AzEXpUyegI5GsL3/tnzZptrbyHab2+pKQ8vS9V8TNQiQ5EI5UclOZtYwX
         V2+FkjF9j+bMBxrQSaDmxAMv/efVPDMjGv5mwnSmc/8TJP7lQjipO9o2nGooDuJbdUA+
         eTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=U4heuRS5Q2Sn84nrfGxDwZL31jKvSEB1e11WkgUh454=;
        b=YIJSs8NZr6kUreWRr2Jl3c+HOhxnPTFFv3rt8MgID1jFiFEENi37TeR8FGKmyT5JjI
         dS2fxcH5MqJYZi2h/BQdXzsz1ipltKs9q+yUqK811bCCAoZ5SGhQDARtiCvprLzR9T19
         QcDfYUro9/Y2coE04nU9m7ZIANEngC3Wo5RlYIN1nkgiePcnzwHYsDMkT6bDTrHlVu17
         XFRoHgzWzxLrBf48HY0Dej6HMDXYWETuq6+4jPYYy0z/68BA+Jxq9e2msxz9cTZWBu8u
         8X3734qi/LCYL8ZWt2w4nqaTL5SgwXzieOMAHKRMlPwREjrHRiDXbMsCRHfICg7sdd+0
         kPqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u206-v6si16789965ybb.341.2018.11.23.07.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 07:32:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQDRC-0004rd-9c
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 10:32:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gQDQ4-0004lf-1J
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:31:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gQDQ0-000578-Ni
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:30:59 -0500
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:27227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gQDQ0-00055V-0L; Fri, 23 Nov 2018 10:30:56 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
	rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id
	2eea5bf81d2e23c-01395; Fri, 23 Nov 2018 23:30:54 +0800 (CST)
X-RM-TRANSID: 2eea5bf81d2e23c-01395
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id
	2ee95bf81d22571-bd3cb; Fri, 23 Nov 2018 23:30:53 +0800 (CST)
X-RM-TRANSID: 2ee95bf81d22571-bd3cb
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 23:30:28 +0800
Message-Id: <20181123153040.18933-10-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
References: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
Subject: [Qemu-devel] [PATCH v2 09/21] input/pl050: Convert sysbus init
 function to realize function
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ssU1S81bIVF

Use DeviceClass rather than SysBusDeviceClass in
pl050_class_init().

Cc: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
---
 hw/input/pl050.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index be9cd57b17..15bffbfcad 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -139,19 +139,19 @@ static const MemoryRegionOps pl050_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int pl050_initfn(SysBusDevice *dev)
+static void pl050_realize(DeviceState *dev, Error **errp)
 {
     PL050State *s = PL050(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &pl050_ops, s, "pl050", 0x1000);
-    sysbus_init_mmio(dev, &s->iomem);
-    sysbus_init_irq(dev, &s->irq);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
         s->dev = ps2_mouse_init(pl050_update, s);
     } else {
         s->dev = ps2_kbd_init(pl050_update, s);
     }
-    return 0;
 }
 
 static void pl050_keyboard_init(Object *obj)
@@ -183,9 +183,8 @@ static const TypeInfo pl050_mouse_info = {
 static void pl050_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(oc);
 
-    sdc->init = pl050_initfn;
+    dc->realize = pl050_realize;
     dc->vmsd = &vmstate_pl050;
 }
 
-- 
2.17.1



