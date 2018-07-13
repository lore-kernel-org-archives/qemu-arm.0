Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp429741wrq;
        Fri, 13 Jul 2018 01:34:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfvbGJUG7ystNXurpT4Xk49XTtAsXuHtaaTmaZEvplW3EnqZhTjhKjvT+WLILc6RnOMb4bI
X-Received: by 2002:ac8:3f8b:: with SMTP id d11-v6mr4899416qtk.46.1531470856451;
        Fri, 13 Jul 2018 01:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470856; cv=none;
        d=google.com; s=arc-20160816;
        b=GhzzwSptrLYsi6sRdk/eGbePttCJONbLt2iwm+/F6SNOCMZUxHP+0u6h4v8KZCVb/+
         e2w+iKhnyEsVDiTs91FnfNxwHPcw+BHS3u3j4cpBIPZCZHjtveiRGZap2ndfI3q0C18c
         kA3c2zzKo17nFGOhWfLwf6XuCDq1suC0xPK2Q235jR9nPHUX/Yvi2x12dXcSiyfjZXU6
         2eFXZn6lJ6YYCDJ2sdMronphTVWKyCYNBlIVND3VkwytKXZcbKkFLSMSCyc+uXPf/ijr
         IN6I8eGvMQ6ucqEIFcpbTeojC4njot2UeaTOFYF3x70kGk5NA2VaIAxpaoVHCeiAM/fT
         O4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=aBnEpoQlX/4u8yKOjdAbbZw/ABUQsGZbgU8prukm9Kc=;
        b=Z+f/2JRqQODf3U+p9ZpADisSxmP/qRXqOQAIj4k/QzeDilpsWKOapj2W8YMw/O5doi
         Xn6ynMs7m9Z7xflNEiksE++nUxIrEDwS12KXGEnrwOA51JZfAALdRtfgyDOMyTSmvWl5
         cYEELggT0GcuE79OVRFN5S/kC/dsZfBnqSiqR2OGEms3PF19Rya83efqkDMb4m3n5YPo
         6Wu7wv2KsFt4UGCm+yVsrzdTbyFGfzBRLb8GKoRX2qFvEpc0s7vgIlw7OFxJbXZRIYvE
         mAmgc2bxt6pWpadgF+XzyKtTxb9GTKKTfDkcmit5c16NQ3Pj73DZ49ch3qPjyBGiNT35
         NDZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12-v6si4445421qtg.319.2018.07.13.01.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:34:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtWp-0007ID-QG
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:34:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRM-0002pg-3C
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRJ-00057Z-Gq
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58164 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtRJ-00057A-Bt; Fri, 13 Jul 2018 04:28:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFA3A72632;
	Fri, 13 Jul 2018 08:28:32 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7982F2026D6B;
	Fri, 13 Jul 2018 08:28:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:43 +0200
Message-Id: <1531470464-21522-16-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:28:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:28:33 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 15/16] hw/*/realview: Fix introspection
 problem with 'realview_mpcore' & 'realview_gic'
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
X-TUID: TZihmqGBnaet

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'realview_mpcore'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==2654== Invalid read of size 8
==2654==    at 0x61878A: qdev_print (qdev-monitor.c:686)
==2654==    by 0x61878A: qbus_print (qdev-monitor.c:719)
==2654==    by 0x452B38: handle_hmp_command (monitor.c:3446)
==2654==    by 0x452D70: qmp_human_monitor_command (monitor.c:821)
[...]

Use sysbus_init_child_obj() to fix it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/realview_mpcore.c | 8 ++++----
 hw/intc/realview_gic.c   | 7 ++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index 39d4ebe..9d3f837 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -101,14 +101,14 @@ static void mpcore_rirq_init(Object *obj)
     SysBusDevice *privbusdev;
     int i;
 
-    object_initialize(&s->priv, sizeof(s->priv), TYPE_ARM11MPCORE_PRIV);
-    qdev_set_parent_bus(DEVICE(&s->priv), sysbus_get_default());
+    sysbus_init_child_obj(obj, "a11priv", &s->priv, sizeof(s->priv),
+                          TYPE_ARM11MPCORE_PRIV);
     privbusdev = SYS_BUS_DEVICE(&s->priv);
     sysbus_init_mmio(sbd, sysbus_mmio_get_region(privbusdev, 0));
 
     for (i = 0; i < 4; i++) {
-        object_initialize(&s->gic[i], sizeof(s->gic[i]), TYPE_REALVIEW_GIC);
-        qdev_set_parent_bus(DEVICE(&s->gic[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gic[*]", &s->gic[i], sizeof(s->gic[i]),
+                              TYPE_REALVIEW_GIC);
     }
 }
 
diff --git a/hw/intc/realview_gic.c b/hw/intc/realview_gic.c
index 50bbab6..7f2ff85 100644
--- a/hw/intc/realview_gic.c
+++ b/hw/intc/realview_gic.c
@@ -54,16 +54,13 @@ static void realview_gic_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     RealViewGICState *s = REALVIEW_GIC(obj);
-    DeviceState *gicdev;
 
     memory_region_init(&s->container, OBJECT(s),
                        "realview-gic-container", 0x2000);
     sysbus_init_mmio(sbd, &s->container);
 
-    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
-    gicdev = DEVICE(&s->gic);
-    qdev_set_parent_bus(gicdev, sysbus_get_default());
-    qdev_prop_set_uint32(gicdev, "num-cpu", 1);
+    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic), TYPE_ARM_GIC);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", 1);
 }
 
 static void realview_gic_class_init(ObjectClass *oc, void *data)
-- 
1.8.3.1

