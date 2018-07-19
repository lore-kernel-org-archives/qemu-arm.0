Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1608580wru;
        Thu, 19 Jul 2018 06:15:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdQHolhzgXWQ3YtMS5d0MBcsaXTkALC9xG2uDWH2Cz7LNLU+s2rdr3yavwgvo7ZH3Bo02TI
X-Received: by 2002:a0c:ad58:: with SMTP id v24-v6mr10694124qvc.75.1532006149058;
        Thu, 19 Jul 2018 06:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532006149; cv=none;
        d=google.com; s=arc-20160816;
        b=vT0kS8Ul6N2yjcCVeAsDSyg21ZyZ4bq/HxaGxYWibPgdWU2IetBJyAyJOHbo081ARN
         Pu3cIuMNVHhJ2TMgZVPf90efW2J0e0RZACLOKpzIA/K7rXb0GOywDIwHXWfF8Q1zCEJu
         HcxPD4rvfOEFypCbOUMy4aqFY+068H6fxYZB+RjSPU5D3HKVZUXgt96pAu0olbBcMQq5
         PkqLY4kaHrI/Mk6gP2sVXOwT93ZTnoQvBFFWavItiYyj6WqEvelFdETsvkPm+r6xcoyt
         GhITERZzoP/RXmVryx3DANH06k+ijBWB61HyVh/G6t5dLRzKEhX2xYVTmPCP6XZIuwpP
         uVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=CBparwMf/JHkbdamMk391N2le9H224v/1GIxbXcqt7U=;
        b=sg4FxLtoEbYOMh6an7dJ1h/0pSWzyqM2SvrxPDbKjOMJhe6Dgfmrs8M+/DBy0NBcE0
         Vt4w+PvEb2ZyM9Lr68XRvvKNNJP1rD2dS8//uS9rlalX+MvDyFeRas1Q5gZ5ZAuhJbzq
         MxwgNRPGVpu7m7eT+RQhZpks3YPzdq+PvDEzMObvgjwQve3H4upr1Ut8Wz397YSxEFrc
         2HOhcpiLzWD8R9I3eyIe6dAWcTM8InDOqNTxL39boBuKmYybezsFFDl9NcbCmXTUFmi4
         uLzmskKvcxAQME0UTlTu9ha4VXJ4VOgrmKB7fRjdaLbsZPy/qc4HiccDlKM3UCNY9uxz
         5yNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si39556qte.29.2018.07.19.06.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jul 2018 06:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fg8ma-0001sJ-JE
	for alex.bennee@linaro.org; Thu, 19 Jul 2018 09:15:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fg8mT-0001sC-J5
	for qemu-arm@nongnu.org; Thu, 19 Jul 2018 09:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fg8mP-00008h-H1
	for qemu-arm@nongnu.org; Thu, 19 Jul 2018 09:15:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52972 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fg8mP-000077-4j; Thu, 19 Jul 2018 09:15:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 654BA400225D;
	Thu, 19 Jul 2018 13:15:36 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2F3C2026D6B;
	Thu, 19 Jul 2018 13:15:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Thu, 19 Jul 2018 15:15:34 +0200
Message-Id: <1532006134-7701-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 19 Jul 2018 13:15:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 19 Jul 2018 13:15:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/arm/spitz: Move problematic nand_init() code
 to realize function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pfYaAzWk32eu

nand_init() does not only create the NAND device, it also realizes
the device with qdev_init_nofail() already. So we must not call
nand_init() from an instance_init function like sl_nand_init(),
otherwise we get superfluous NAND devices in the QOM tree after
introspecting the 'sl-nand' device. So move the nand_init() to the
realize function of 'sl-nand' instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/spitz.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 3cc27a1..c4bc3de 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -169,16 +169,22 @@ static void sl_nand_init(Object *obj)
 {
     SLNANDState *s = SL_NAND(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-    DriveInfo *nand;
 
     s->ctl = 0;
+
+    memory_region_init_io(&s->iomem, obj, &sl_ops, s, "sl", 0x40);
+    sysbus_init_mmio(dev, &s->iomem);
+}
+
+static void sl_nand_realize(DeviceState *dev, Error **errp)
+{
+    SLNANDState *s = SL_NAND(dev);
+    DriveInfo *nand;
+
     /* FIXME use a qdev drive property instead of drive_get() */
     nand = drive_get(IF_MTD, 0, 0);
     s->nand = nand_init(nand ? blk_by_legacy_dinfo(nand) : NULL,
                         s->manf_id, s->chip_id);
-
-    memory_region_init_io(&s->iomem, obj, &sl_ops, s, "sl", 0x40);
-    sysbus_init_mmio(dev, &s->iomem);
 }
 
 /* Spitz Keyboard */
@@ -1079,6 +1085,7 @@ static void sl_nand_class_init(ObjectClass *klass, void *data)
 
     dc->vmsd = &vmstate_sl_nand_info;
     dc->props = sl_nand_properties;
+    dc->realize = sl_nand_realize;
     /* Reason: init() method uses drive_get() */
     dc->user_creatable = false;
 }
-- 
1.8.3.1

