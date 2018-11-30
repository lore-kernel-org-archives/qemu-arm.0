Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3370713wrt;
        Fri, 30 Nov 2018 01:43:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W7qmuNpkpTOyYOrJpYlOnzPJ4m2kF3iNGbder/A4jc+4VDxShrZIcKzmCykUoL7LMHkdY+
X-Received: by 2002:a81:4506:: with SMTP id s6mr4867329ywa.200.1543570990834;
        Fri, 30 Nov 2018 01:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543570990; cv=none;
        d=google.com; s=arc-20160816;
        b=LFKtobXzW0e0JyXqm+sEA2TEsSfD2lSpRBkxnFB6l1HngLLQyfms/lzzAW9WHM+Shr
         P8LkR5jy6EKFbkFYIOJFqQdVbRhZ7Mbk9K0R5IukYpcGZiGPg50/EWm6qvSL9GYlkSuK
         hPVCQ27XD6mnKhw5/s4C3tGePKR6XXTwZWWXNiKSPZI4i4J2y1Dxdn+8+IWRKUC6Ny8+
         q5pPNylT21h8XUgrQRID/fONn/5X1L6QW8Gwzz2P5rG8Z2PjnFt6QSBWbHSu3iIAgVfl
         Bt0ZJFN4wk3+9hNGtshLfbbji4Jx3nudfmplB0Jwf3qqrvfSkAgwzHSACmEHTQZaqLfQ
         8DeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kLjg3B1CcVlKmtZS0hYQKVnLnUmdtvAChQBrffzF8DE=;
        b=RbhDGEtbrrcItYY6uBoOw+68HdnL9FjgjG2DYN5dUFpOFudeq4xYiPqQU7zBbBS03q
         E2ACDrbBuKt9ecUT8EuIn5Ca6Kg9L7v9O/yaYzEoWt+04A93rT5MZy3hfvuxXL4ItBTq
         B2qkO7f1mg7CyTj7Xc9M/m8dSKPEqA6UYh3rUj3EEMEyw+7xVZlgwDysUZlyk85KT+Gt
         fak/vnfPFz1grzWRE5LKE4dSW8cENsRsx9xZLRlATkGF4u48NgM6MgrcXCoYOWdP9CA4
         AHNDNwOzzHD8WO1FOwfutRnq+SqbRjdwFZzxfpHTErG2nkXNsUIuf7FM/MgRAiBHTV+t
         RqNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p205-v6si2813870ybc.254.2018.11.30.01.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 01:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSfKI-0000Ji-6q
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 04:43:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gSfGj-0006Ax-OX
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 04:39:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gSfGh-0002Up-6p
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 04:39:29 -0500
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:33835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gSfGf-0002My-OR; Fri, 30 Nov 2018 04:39:27 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
	rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id
	2ee35c0105405de-a2243; Fri, 30 Nov 2018 17:39:12 +0800 (CST)
X-RM-TRANSID: 2ee35c0105405de-a2243
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.lan (unknown[112.25.154.148])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id
	2ee75c01052eaec-4859a; Fri, 30 Nov 2018 17:39:12 +0800 (CST)
X-RM-TRANSID: 2ee75c01052eaec-4859a
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 17:38:40 +0800
Message-Id: <20181130093852.20739-10-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
References: <20181130093852.20739-1-maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] [PATCH v3 09/21] input/pl050: Convert sysbus init
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
X-TUID: w3ckD3JnqD9/

Use DeviceClass rather than SysBusDeviceClass in
pl050_class_init().

Cc: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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



