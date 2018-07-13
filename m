Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp436444wrq;
        Fri, 13 Jul 2018 01:43:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfT9FmswHxhNE238UxOTLLObF31LmlTtx1DISIClgMza5vpRwkfOpI7O4SVruNI/m+Q2CHy
X-Received: by 2002:a37:5641:: with SMTP id k62-v6mr4891728qkb.40.1531471394210;
        Fri, 13 Jul 2018 01:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531471394; cv=none;
        d=google.com; s=arc-20160816;
        b=N8c1hCygkv/+FZUsI76WiBbQGUJ4S4iAEjcuagz72Vw2KC5XhnIx9ma4DvmxRhRG4X
         vgzppZjTQI4Wzh4UDn3MeVkw1ka0HXs56J1w97kRK0pIitwmggDRY6AYmQb1zGGvVvbn
         WVBJR60cNDtm0ett0Xsh2m5Jc1DFFchq6KlHYAcEitfZT07UVJFnJlvOtiJd/+/QyFQf
         u0Lhi7nYeJnIT6EYpt0rTL4ya1/JlXvZhAYkk9iz48O1qphniHLZ9ZJuI6Mq+SqOZG+4
         EBw1FnQkIHuq6ub9nUkExevS9D9nhPrsFMk55sH1l+ymm8aYZPGMZo2V9+Db/CdrD9oK
         S5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=QZLNt7MLqEf9TECzBN54JpuSME8DrfOA3jx7yFQU3rU=;
        b=XotR109n0HV9TWSTbtBg0Pfo6XcGnV6/IJoPXcwwVMpJDhb2x3IE2gbAv/sIjcMIgR
         bt41yJkei35nvpTzqezzj/nEGkBqCYAdZy+vNqSAT3U8ZXKypCvi5dpRWjUACtog6HLh
         vH0ksPy0p7eTt0FymQaPxg4EpV1drSizcTsKC4EvztAcEeQw/oW5sry6uuc5tBQx1Ple
         LtrrVBG31kVxPJ7TRq0+TTRv4gNXScd9fPQXIbL7WZ/IU3yTKDJJtusUgoRnGSB1Dvkj
         EMcw+jkEq1tsq4gWjcYlKgSpEmdkS10OaSRyuT8/H+M0d41luz9MijhhNBpoO7jEstah
         xaVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m32-v6si4188106qvg.182.2018.07.13.01.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtfV-00065D-P8
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:43:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRN-0002rU-LN
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRM-0005Am-Ib
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42286 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtRM-0005AK-DP; Fri, 13 Jul 2018 04:28:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 067EE8182D31;
	Fri, 13 Jul 2018 08:28:36 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5323A2026D6B;
	Fri, 13 Jul 2018 08:28:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:44 +0200
Message-Id: <1531470464-21522-17-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 16/16] hw/arm/allwinner-a10: Fix introspection
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
X-TUID: XItXEBFvgK8s

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

Use sysbus_init_child_obj() to fix the issue.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/allwinner-a10.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index c5fbc65..9da00f9 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -27,20 +27,19 @@ static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
 
-    object_initialize(&s->cpu, sizeof(s->cpu), "cortex-a8-" TYPE_ARM_CPU);
-    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            "cortex-a8-" TYPE_ARM_CPU, NULL);
 
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

