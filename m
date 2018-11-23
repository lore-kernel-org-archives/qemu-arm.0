Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2188671wrt;
        Fri, 23 Nov 2018 07:35:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VPZDQjnqAebT1V6pm7KX4pf7fW3CDonlzW5FstbsYbfZSu7GMgpbLXnbeJj6aHQ/KZK1Iw
X-Received: by 2002:a81:1d44:: with SMTP id d65mr1966961ywd.483.1542987314258;
        Fri, 23 Nov 2018 07:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542987314; cv=none;
        d=google.com; s=arc-20160816;
        b=j0TvVENm09D2EHjwuV+GHe+AL263Qkgs2i5SUTYLWc8rQX04ARHN4gGt/8Y8xGXfjx
         afvlLhV2pqd0vXZnE8CMMDxsNZhmzbyMSM1/r2sc231rEMk451knXxYZ6eEN3t0NKLy0
         MnfRCQrrDtlH0WMXBSDsXIWA7XGD30Wktk8s/OsYbvGHzs9bECopI3RxhItK3Goles2j
         XS+bycUabeG9/xDlGzbcvr+ulCNfr7UDPC8zl5AkmqFGbnOBPqSfNaQojvWxSiGz4Go4
         sFnW65nHaH8UQzst3VvXT31mEGl6BKjynkLd+nUFJPn7P5B/I2QPWk40lK6JvnOpqvZ8
         0pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+pFNQOcCL2GyrWLLk5qREqkt8A4MVa3487BNi+KYFes=;
        b=fK0vjUSaHfEXeZ6d2B+9zRQ2y0cJxa/Z/1Z20sN6WYvTS6vSbHLvfsVzf4vJMH+/AQ
         1gpdOaAsa+98zMHnZwIEGZhIi9GGfF8x1gKlTz3RruhR+YgoJ0Gg5DI0Lh5rGVq+AVa/
         OsB7Uf4ihJl8Rl0r9gJLOtxlCaIytbujVegAbDyrmg3gUvShH3ksW5cpAC+cupbnSVdZ
         X4PSUOD5n8VRrcyjpJehpHQp/djS0GBAI9m88X2VZf1AUl9232dge5ZdoXdS2u3Yynb0
         rx2wl1GV1xi4jhC2kSbYQ8ZmJa9gJXcUdVEsAlm2Rm/E0bsY3io1jf+oY1AmtQkmPpao
         sXeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w126-v6si4895656yba.122.2018.11.23.07.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 07:35:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQDU9-0008OH-Gg
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 10:35:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gQDQ4-0004m6-Q0
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:31:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gQDQ3-0005Dy-E2
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:31:00 -0500
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:27225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gQDQ2-0004yQ-Jo; Fri, 23 Nov 2018 10:30:59 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
	rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id
	2eea5bf81d2a237-01390; Fri, 23 Nov 2018 23:30:50 +0800 (CST)
X-RM-TRANSID: 2eea5bf81d2a237-01390
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id
	2ee95bf81d22571-bd3b6; Fri, 23 Nov 2018 23:30:50 +0800 (CST)
X-RM-TRANSID: 2ee95bf81d22571-bd3b6
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 23:30:20 +0800
Message-Id: <20181123153040.18933-2-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
References: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
Subject: [Qemu-devel] [PATCH v2 01/21] musicpal: Convert sysbus init
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de,
	Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8UIzEW6LPeqx

Use DeviceClass rather than SysBusDeviceClass in
mv88w8618_wlan_class_init().

Cc: jan.kiszka@web.de
Cc: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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



