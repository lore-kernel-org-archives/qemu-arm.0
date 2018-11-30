Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3374132wrt;
        Fri, 30 Nov 2018 01:47:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XtF0i7an1avIs3ugakKXmzkolnHAe921OxU2qVfktbqU5Rn4vmQqg+Is3hPVB5HWkKUnSi
X-Received: by 2002:a81:4323:: with SMTP id q35mr4964949ywa.119.1543571270749;
        Fri, 30 Nov 2018 01:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543571270; cv=none;
        d=google.com; s=arc-20160816;
        b=iG0aVXw+GLI993gD2Ga5CG5XBLEIpP7PKsnFmDsy+a/MoidVSPAL2jPeduohB66vtW
         lo0yoWuezcyNe9scrMwUzJsQ1/vZe1/llLKjD4liuHGpJSj2tDMJX1LhynOtwHANZarG
         KJKSU3BqxzaNvLb160+qD6iVLgNhrNjXV7JzS8HViWDgLCSU9kuBWWDyTrD8SUMMEslE
         w61pig4aNPeOhup9opSza7npJeZk27MQLM9SAkxsMIAhm1aNwQeKG4xE0vRSb5kvClzn
         VSSqhZ5cUeB7GKs3t0VTxxvZiMwfnpP3Kdv5XY3LWrIPhL0mG0J4ZX9/buaNRjEEId3Q
         E4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+pFNQOcCL2GyrWLLk5qREqkt8A4MVa3487BNi+KYFes=;
        b=DVjZHSgGwzkTvP0XNEBFg4tP9S01TOxnEplyMlXFlK4X7sImPMYH9xW6pVzOqn3Dx4
         vAwyX/QLiAXRhcHXhzo34kbYIRE1nkjGWzSRSw2zBMPncaWoo8otjUhbBZdLsqI6ZZiL
         mgCakZOmxACn1JflNxutkzP/Jx03clrpEkZ9ZrjJx1lIWWtOAvS/7JUqB3iM6W4esbAa
         a+k7VjFKjGTdB8NIoEMOuqcDNkhNyxdrQizBabt8tNu6sX6JrT9G3A8/cfaBT0ULqcrs
         Wr6IvJg73KoV8urXqdd0KOiiuymgyQlfD9hvMpmybS0k3aat2/lMHj3X50Wdb/pwbFnS
         dSqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6-v6si2819164ybg.2.2018.11.30.01.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 01:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSfOo-0005EV-3s
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 04:47:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gSfGj-0006B3-Oa
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 04:39:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gSfGg-0002Tk-KV
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 04:39:29 -0500
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:55556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gSfGf-0002LR-Ma; Fri, 30 Nov 2018 04:39:26 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
	rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id
	2ee55c0105362d3-a1a5c; Fri, 30 Nov 2018 17:39:02 +0800 (CST)
X-RM-TRANSID: 2ee55c0105362d3-a1a5c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.lan (unknown[112.25.154.148])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id
	2ee75c01052eaec-48555; Fri, 30 Nov 2018 17:39:02 +0800 (CST)
X-RM-TRANSID: 2ee75c01052eaec-48555
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 17:38:32 +0800
Message-Id: <20181130093852.20739-2-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
References: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
Subject: [Qemu-devel] [PATCH v3 01/21] musicpal: Convert sysbus init
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
X-TUID: oYxtCsuaeDOE

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



