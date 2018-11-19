Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp777446wrt;
        Mon, 19 Nov 2018 04:24:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5d0oDcm2W+JFNoxw55ArGEKui0svjzYzzl6OKtkBVe1VR+sd2nUY/mE6gZEeMpK3Djp61wK
X-Received: by 2002:a81:65c5:: with SMTP id z188-v6mr20650977ywb.456.1542630278841;
        Mon, 19 Nov 2018 04:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542630278; cv=none;
        d=google.com; s=arc-20160816;
        b=W6MAqbhbsIM0FTOxpKr208oyWKkDYsKG4PRDGJ2/jizqmQsPgRT3ROJy2L1WOM98VJ
         5KxBiv77u91vOeuxrsvDhcWMyAmVz8aiNNd5W1EWxkCNpeG3kjvNmObmQoa3ekwP3MT1
         5xF6z/ia6ix0JGLbv2RNK3PTCh6Bo7WroxuvKpTFUs3+F0ZJtWPXMrYs2e+l74IJPbuQ
         iwiginjQTMwdhiS/e2hOfVh0E9GA8KgNvqCNd9O+zMmd6XCqIP0eeC0zZzXShlZpwZuE
         WSGBCw1LnsIFIkO6H/N235hXG7Gt6U1CIrOx+erDr/ECcAq5xpkvKbpAZeFBvYFIrcjw
         rN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=tt7ed0zSU4l1BKmlFsbM0jT6ywpBdfbraPYGvcTS8QQ=;
        b=iQIzNPqLyj19wzmwTVlV/RSTegcC7yFDeVjwomZHD2KBgHdHpQipNmURFHX/U0c+sx
         xCvhPvSPaKBVED/gELvYTgGtV0XlqTdbOJR8emnJs15pQiParNeODNGDGNles/X646CT
         htJrhYrEyATpHCXlcYixsvqKKn8bL2ZlrsVB7bXBDnWQoJKjizvwjfiQaIJBaz0JbMun
         9Y6h8adHRCpjRZNvKhYXspVXkeRUOpzgrL24WcGCrJtcqvF1u72iRzdc1PJxFOdQ4P1k
         T9TBViaRuO87WGT13avYLwBbuugMEDzvEUgGNJPcmg78CdgyGEHsKotFM5B2OCJq7w8p
         YP5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h129-v6si24444052ywe.313.2018.11.19.04.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 04:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOibW-0006MQ-6I
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 07:24:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gOiMP-0001mV-0n
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 07:09:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gOiMM-0002uo-3R
	for qemu-devel@nongnu.org; Mon, 19 Nov 2018 07:09:00 -0500
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:5333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gOiML-0002nk-9A; Mon, 19 Nov 2018 07:08:58 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
	rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id
	2ee25bf2a7c79f2-910e2; Mon, 19 Nov 2018 20:08:39 +0800 (CST)
X-RM-TRANSID: 2ee25bf2a7c79f2-910e2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id
	2ee45bf2a7bf447-1050c; Mon, 19 Nov 2018 20:08:39 +0800 (CST)
X-RM-TRANSID: 2ee45bf2a7bf447-1050c
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Nov 2018 20:07:59 +0800
Message-Id: <20181119120820.29878-2-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
References: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] [PATCH 01/22] musicpal: Convert sysbus init function
 to realize function
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de,
	Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: weBBQsaRgKBR

Use DeviceClass rather than SysBusDeviceClass in
mv88w8618_wlan_class_init().

Cc: jan.kiszka@web.de
Cc: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
---
 hw/arm/musicpal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 9648b3af44..7ffcdbb097 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1147,14 +1147,13 @@ static const MemoryRegionOps mv88w8618_wlan_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static int mv88w8618_wlan_init(SysBusDevice *dev)
+static void mv88w8618_wlan_realize(DeviceState *dev, Error **errp)
 {
     MemoryRegion *iomem = g_new(MemoryRegion, 1);
 
     memory_region_init_io(iomem, OBJECT(dev), &mv88w8618_wlan_ops, NULL,
                           "musicpal-wlan", MP_WLAN_SIZE);
-    sysbus_init_mmio(dev, iomem);
-    return 0;
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), iomem);
 }
 
 /* GPIO register offsets */
@@ -1720,9 +1719,9 @@ DEFINE_MACHINE("musicpal", musicpal_machine_init)
 
 static void mv88w8618_wlan_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
-    sdc->init = mv88w8618_wlan_init;
+    dc->realize = mv88w8618_wlan_realize;
 }
 
 static const TypeInfo mv88w8618_wlan_info = {
-- 
2.17.1



