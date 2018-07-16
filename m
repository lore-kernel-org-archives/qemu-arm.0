Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1486565wru;
        Mon, 16 Jul 2018 06:09:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeiUmPdRB6QMDfFDX3hJDFRgKD1TOlanmq78Uc2S+5VY7nOXgAY9KI2ZoGmayP5pyROeDqU
X-Received: by 2002:a37:d61b:: with SMTP id t27-v6mr13446278qki.244.1531746563580;
        Mon, 16 Jul 2018 06:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746563; cv=none;
        d=google.com; s=arc-20160816;
        b=baQyUWoIHNZvzEyUXG3Ar/0/LVuwtEo9+Z4XnLyrrtVw2YfEUWsCi0pyyGSzKG8ni9
         rrADG/7Er24dNacUZFiZlKC5SXNyALTSWpp3Lf8iByafizzexATNGaXy0ZHEFS8l0msX
         lUkHhQmwUi6UllgJB6/6nfVtrIEfyulEtyX9adIgu58W51FMrjE3sXiz5uLmZRdCifSF
         gEJo2M9Rhi8/bRijscA7NmP4ax91hd+qFOBcCqhuPBrfOcv+hKYGTEo74bPC4yTpR17L
         UQ4JS1h2Kn6WzbNIVtuzoD9d/WsUI27lL8tw0VAc3izuwtH5j3arz6L/VmdoQgWsmGUF
         CRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yt0yEbWZsBOYoFZqtCQKMXb9oFWYDqsNJRke2tPCwHc=;
        b=Wle8SbAAnfxjFcBn3LpVZD5Q3YG7Dq4a73UpqsqtVZa3/4dEnnVUbeKoAzPbj3onm7
         5kibNH61gCfxBRTmcMWZRnZUhHf1WRoRahiR27FTtGKY7i57zRp5f6BYuwxk4We+x/k4
         +8VEOWcdDIQ0gw+KD09Gg2Hy2fG3TpcM3HjIBrSSfWUvZuwBmVOr0dzTHtvaXpLaI7XV
         VX6SJ6RJgezEc0mjEzYNkjaEaeIi8S7tHgz3hSZXsVxvqOsY9azYO+FYpwSal5jmDgpI
         rE6K96z91fJiN6dExsjMmyJlWYXSV3fEC8kASK2WXRfPyfElbb6NZCY2ZyvMcbbbWxxl
         hCFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si4336082qkc.58.2018.07.16.06.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3Fi-00080Z-TK
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:09:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36z-0001i1-Fm
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 09:00:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36t-0002SM-RN
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 09:00:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35432 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36i-0002Fn-SW; Mon, 16 Jul 2018 09:00:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54B007C6A9;
	Mon, 16 Jul 2018 13:00:04 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 619FD1C589;
	Mon, 16 Jul 2018 13:00:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:30 +0200
Message-Id: <1531745974-17187-14-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:04 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v3 13/17] hw/*/realview: Fix introspection
 problem with 'realview_mpcore' & 'realview_gic'
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dkvqLXiXXIFA

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
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

