Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1495408wru;
        Mon, 16 Jul 2018 06:17:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdHIeLKHIktzZzpRQ0UKBTPiVAMKLy6rMRrQdaNufofP0tSrw8yv/QK9DIIm6DSckH2vYbM
X-Received: by 2002:a37:5285:: with SMTP id g127-v6mr13267248qkb.377.1531747037220;
        Mon, 16 Jul 2018 06:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531747037; cv=none;
        d=google.com; s=arc-20160816;
        b=lVEOtR8IEgQbMj5PXxaIXDsshuVa6L7t1MD3aeezIh/FCK/aZgfxAXnK6aOtEDml1K
         4fhNrsIM7EnpIv6JeTdTUjU6swcm+8s8547ZOfOLvauy2t3abXl0kKSiL/y0fR5TvWoo
         soYnuDXWoGHqL9xslRm02UTm7E+D6Kz3/U3pYASZbeiiCaaOpkGINzN0204iJ//7d5s0
         1Y7vNTL/try4elyekHybwziS+FAP3o74fHP0fMU2fhr7SeA5qaawfdl//uH4a6nbPvKs
         B+mWNK8majq3m4XLTwFs2kOEuDu91KP4IUcSVezKdW/1zPe22/lFeA0SCvZdysUaZT26
         6N9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TSiwmpP+dSEjCF1mPkznF6Sxgb9P3MgLKPFD1dr5WTg=;
        b=MBqH1JGe9YSNSJtChuNbYyir8ws3QIoAZCOa9LMEd+gqNDDN0dHPzpMWkTlN1ZU9lc
         MXq8oproUZzpoIG0c6UkuBXVwG9vt2x9Cbn/3lmIulmGwCjoINgLOylJ8hHcjt0XWCeS
         c1YbOuXRQnRCzCKaxrdGTj4xIuvQQmYLjy9i4K/e1sZQJe/gl3khSUzrwb7X1Tnk4m2/
         1gUW9K2N8aJ//2JHxVy4UKGAukwAs2LJP5H48aX30fNYQujxoBOfyESYE/aj4z2MhjxQ
         JNc3cjQmbziFOAPfiPpq97kcIi43VielBp2WAa8Mq39E5xr8VjXtwEIQPTb21SCbYUr9
         +2ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e33-v6si589296qte.258.2018.07.16.06.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3NM-0006XP-Iv
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:17:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36m-0001SI-5e
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36l-0002H3-2a
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48628 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36k-0002Gb-Nx; Mon, 16 Jul 2018 09:00:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C4DC8163C5F;
	Mon, 16 Jul 2018 13:00:06 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CDF61C589;
	Mon, 16 Jul 2018 13:00:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:31 +0200
Message-Id: <1531745974-17187-15-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 16 Jul 2018 13:00:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 16 Jul 2018 13:00:06 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 14/17] hw/arm/allwinner-a10: Fix introspection
 problem with 'allwinner-a10'
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
X-TUID: vTY/CrnKU5B0

Valgrind complains:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'allwinner-a10'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==32519== Invalid read of size 8
==32519==    at 0x61869A: qdev_print (qdev-monitor.c:686)
==32519==    by 0x61869A: qbus_print (qdev-monitor.c:719)
==32519==    by 0x452B38: handle_hmp_command (monitor.c:3446)
[...]

Use object_initialize_child() and sysbus_init_child_obj() to fix the issue.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/allwinner-a10.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index c5fbc65..9fe875c 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -27,20 +27,19 @@ static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
 
-    object_initialize(&s->cpu, sizeof(s->cpu), "cortex-a8-" TYPE_ARM_CPU);
-    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            "cortex-a8-" TYPE_ARM_CPU, &error_abort, NULL);
 
-    object_initialize(&s->intc, sizeof(s->intc), TYPE_AW_A10_PIC);
-    qdev_set_parent_bus(DEVICE(&s->intc), sysbus_get_default());
+    sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
+                          TYPE_AW_A10_PIC);
 
-    object_initialize(&s->timer, sizeof(s->timer), TYPE_AW_A10_PIT);
-    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "timer", &s->timer, sizeof(s->timer),
+                          TYPE_AW_A10_PIT);
 
-    object_initialize(&s->emac, sizeof(s->emac), TYPE_AW_EMAC);
-    qdev_set_parent_bus(DEVICE(&s->emac), sysbus_get_default());
+    sysbus_init_child_obj(obj, "emac", &s->emac, sizeof(s->emac), TYPE_AW_EMAC);
 
-    object_initialize(&s->sata, sizeof(s->sata), TYPE_ALLWINNER_AHCI);
-    qdev_set_parent_bus(DEVICE(&s->sata), sysbus_get_default());
+    sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
+                          TYPE_ALLWINNER_AHCI);
 }
 
 static void aw_a10_realize(DeviceState *dev, Error **errp)
-- 
1.8.3.1

