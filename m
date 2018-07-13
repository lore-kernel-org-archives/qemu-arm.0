Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp431168wrq;
        Fri, 13 Jul 2018 01:36:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdOVmyBtteUOz9MmQXby82a+bgaBAwuzFoiksjp+14ZbupavHZxo1LoxKmHKbK2fm9LG/gF
X-Received: by 2002:a37:6544:: with SMTP id z65-v6mr4559407qkb.307.1531470965517;
        Fri, 13 Jul 2018 01:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470965; cv=none;
        d=google.com; s=arc-20160816;
        b=z0/OfBDRfHDA3vfR/UbPDZ+MZvW7OCjmblYXIPYQfVgBq4R21rw/pPZaOG/3rQQaBS
         NWjRYXFtcq7NfcGuvVWGc8DVzHpv8Vta5ZoMRlw8mehAHutR0YpMFNDHfPm9R/XEAX7V
         Wu9fiSy5l9lkn7eAaWREdBW4xL8OwA09XoUv/t1FbnHpgEPtS87HzL+zVDbhtDigY34n
         gnA4ercvpaKNkZL/m8Aou125M1ZVBoN4e/M1rVmJEibuW27HxDTekh7+mnYfd3woqUnZ
         0ELk33wyNsp5fL1AnWVHej1q4ApgfrsHb9ENcT0gK5StVipY5+Jivgx1OZ43Wy8hR2yQ
         Lb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3uJvV6ipYY4evbXYIsUilinegRnGHzT5bK7On/NsW/E=;
        b=CDRQpVndUMOw3K085tPzxTNNLbZmgvk9n3UuOlNal2NtEbwO0onI16tyoWhtaKdl3u
         jprq2khgwmS6DBJiL4SIEuWVXhaPfdkbekRlzhpPIA0ABDP6PxoXVWXQd/xHJvL+qWXB
         +BxoxEKeThJbaZWrYZNUIjY+rEbxI68aCvP/CkRrguRqWk5hxRQbNLvwa05EYociz8TP
         6p/5saXAGukW/qWEg7W5Rt78gVSDKUCRIM+/iUlWtD3IygUJrabYWfk85YPsOLgQxKPz
         nNrTvD+wBzFFuq1B5aOhcsFYwqODTkcfRhCgPbNzMWOKymwlt5pR91uokU/8kuCBdr3U
         Vt3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10-v6si803788qtf.155.2018.07.13.01.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtYb-0000Qs-0w
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:36:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtR4-0002WT-DA
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtR1-0004iy-Rd
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58148 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtR1-0004ij-MV; Fri, 13 Jul 2018 04:28:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A3D772632;
	Fri, 13 Jul 2018 08:28:15 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86A732026D6B;
	Fri, 13 Jul 2018 08:28:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:37 +0200
Message-Id: <1531470464-21522-10-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:28:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:28:15 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 09/16] hw/cpu/a9mpcore: Fix introspection
 problems with the "a9mpcore_priv" device
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 20vXT72/YWaw

Running QEMU with valgrind indicates a problem here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'a9mpcore_priv'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==30996== Invalid read of size 8
==30996==    at 0x6185DA: qdev_print (qdev-monitor.c:686)
==30996==    by 0x6185DA: qbus_print (qdev-monitor.c:719)
==30996==    by 0x452B38: handle_hmp_command (monitor.c:3446)
[...]

Use the new sysbus_init_child_obj() function to make sure that the objects
are cleaned up correctly when the parent gets destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/a9mpcore.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index f17f292..a5b8678 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -27,20 +27,18 @@ static void a9mp_priv_initfn(Object *obj)
     memory_region_init(&s->container, obj, "a9mp-priv-container", 0x2000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->container);
 
-    object_initialize(&s->scu, sizeof(s->scu), TYPE_A9_SCU);
-    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
+    sysbus_init_child_obj(obj, "scu", &s->scu, sizeof(s->scu), TYPE_A9_SCU);
 
-    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
-    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic), TYPE_ARM_GIC);
 
-    object_initialize(&s->gtimer, sizeof(s->gtimer), TYPE_A9_GTIMER);
-    qdev_set_parent_bus(DEVICE(&s->gtimer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "gtimer", &s->gtimer, sizeof(s->gtimer),
+                          TYPE_A9_GTIMER);
 
-    object_initialize(&s->mptimer, sizeof(s->mptimer), TYPE_ARM_MPTIMER);
-    qdev_set_parent_bus(DEVICE(&s->mptimer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "mptimer", &s->mptimer, sizeof(s->mptimer),
+                          TYPE_ARM_MPTIMER);
 
-    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ARM_MPTIMER);
-    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
+    sysbus_init_child_obj(obj, "wdt", &s->wdt, sizeof(s->wdt),
+                          TYPE_ARM_MPTIMER);
 }
 
 static void a9mp_priv_realize(DeviceState *dev, Error **errp)
-- 
1.8.3.1

