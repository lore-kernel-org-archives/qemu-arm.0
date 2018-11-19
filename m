Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp763294wrt;
        Mon, 19 Nov 2018 04:11:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5fgNZib4+Jdn13454TJ1rn1LVun3Iydq7RO4BeqgeRy1+B+n0O7k5/9y1kPEdTcKmqhyume
X-Received: by 2002:a25:8311:: with SMTP id s17-v6mr20494512ybk.142.1542629484932;
        Mon, 19 Nov 2018 04:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542629484; cv=none;
        d=google.com; s=arc-20160816;
        b=VcPPsxaEaARisGlDp4GH/L/6Nf2owm5o2EH6d9+/AHlAtKXNW6Ec4ieUbXYh5J8c7r
         9LNiluCukVIS2SP7hORILkwaIvLdWviNYeO9OOCV3dYXO4aDDz3yjsHa0wtXHbbd9vby
         xbUtB6SltdwS0D8TGXmarZ3LfdMqIBIMzTwhlAOpdzRSRYLCut+79Y+ZT4BZqbgCj7iN
         kpgLZCPSW3Okb6rVWrJnulIGB3PZbmKyRbCfZ71t9o38NZb3FstOwTVuBHxqHYIiAnQf
         XssC+mggd84UOBgFrNCUU9iEV/Zww3hFMAQ9uId/h035AkPFGcxCYqZDj1C0G98HmoDh
         KXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=NGudNSR4+VIr1wRU/SUGMnnCELBnnTDEhU9l7vpxqhI=;
        b=vqQw6kSNOKCIN6/vv3oc3ON9I4xs/LCuumJ9jpvzfsITGTFH4zWp6H6kg7Rge1njIZ
         I1rWZh7yQ4me38M01Eud4Plfoi2f34lZHVX1MmdHzRz/N9Avd8EHCgbq35SRgRvqWE7d
         iMtYSP9Jdkj3q3btp3tIur+Ko9NDr/u5IuqNNJYUu/ysGtANNvUhPWQWMP+QaBoSkVDz
         jPqjBFcq1ioovbAkmkXomx+7AmZVcboO8TdtpOj94GXI/oeKr5c7EvmmGEeQ7U3XlanB
         tf+wSsZFjppsyjV0iVdEOkPVcPLB0r/lZPgOcNPjIPi8qBUigFraWDo5JIw4ZTFa4676
         QOEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 192si7891027ywh.303.2018.11.19.04.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 04:11:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOiOi-00037Y-3i
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 07:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gOiMP-0001ma-3m
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 07:09:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gOiMM-0002w6-SD
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 07:09:00 -0500
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:5336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gOiML-0002oi-Vl; Mon, 19 Nov 2018 07:08:58 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
	rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id
	2ee25bf2a7cb9fb-910eb; Mon, 19 Nov 2018 20:08:43 +0800 (CST)
X-RM-TRANSID: 2ee25bf2a7cb9fb-910eb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id
	2ee45bf2a7bf447-10521; Mon, 19 Nov 2018 20:08:43 +0800 (CST)
X-RM-TRANSID: 2ee45bf2a7bf447-10521
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Nov 2018 20:08:07 +0800
Message-Id: <20181119120820.29878-10-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
References: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] [PATCH 09/22] input/pl050: Convert sysbus init
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
X-TUID: Rv3K9kGLAiYF

Use DeviceClass rather than SysBusDeviceClass in
pl050_class_init().

Cc: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
---
 hw/input/pl050.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index be9cd57b17..f341c26a63 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -139,19 +139,18 @@ static const MemoryRegionOps pl050_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int pl050_initfn(SysBusDevice *dev)
+static void pl050_realize(DeviceState *dev, Error **errp)
 {
     PL050State *s = PL050(dev);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &pl050_ops, s, "pl050", 0x1000);
-    sysbus_init_mmio(dev, &s->iomem);
-    sysbus_init_irq(dev, &s->irq);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
     if (s->is_mouse) {
         s->dev = ps2_mouse_init(pl050_update, s);
     } else {
         s->dev = ps2_kbd_init(pl050_update, s);
     }
-    return 0;
 }
 
 static void pl050_keyboard_init(Object *obj)
@@ -183,9 +182,8 @@ static const TypeInfo pl050_mouse_info = {
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



