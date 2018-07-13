Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp425549wrq;
        Fri, 13 Jul 2018 01:28:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe8TIvamsDRmz8fpNvCtOE1dMj2hsI+MTp9o7a/HLdlwxTBCKpvbL+QLkClLgQnZwlpagYx
X-Received: by 2002:a37:d282:: with SMTP id f124-v6mr4445002qkj.281.1531470517442;
        Fri, 13 Jul 2018 01:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470517; cv=none;
        d=google.com; s=arc-20160816;
        b=ojs2n/IebLh+5N6CQFwKw7kLBP6VcYi0bYpy0niTSLS2DZJJh9IGPz0B3vioNuCXGe
         HgVwrH9P8URCmaRSuw1YnWZYBbWVq8A7jn8XSu6FhQk4ihmR+bnVEekSkrI6+wGcvDp5
         IF7J8h3e/DUBAsytgpXCPS9PXzCFLZeLDQI/6Z+h1iT7f/kHTsLSNZcK3CmjGOnq2+KT
         VrKQUBgEZelvWDSATzQJUsj7hlVgCxtG9qgHUUf1nP4Joqetz4zTf/g5x9jjkMCVkjEC
         2V2SJHkQtp31gpBqxkn9GIzWyMihNh3+6cPgQEsXE0zufxyOOICJT6BZFrMttsY5/4bC
         1iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=O5sRk6KVGgUJr04Y+mDhgZYHjtEKk1g4FzXaK8wNuYg=;
        b=QrrkZvy5sVyNPI+z7XnPX+H8gx7EaTxJaYYN3NnW1ikY7PPYeSxwZUOwo63e/vSLEv
         nJwym4FMyMf2RT72suXhIzXfBPX5/i1j0SQNGGF4H27uCxsE7ByIrtC6kyn59XupzabI
         suIZDKVZ2aO5FffdmhYTBv6bMxs0Kt7E0LaChVnp1TnEPSPtTNj0y7taTcCClR7ydW+A
         i9Uk3es8LIwetFw+MIjZi5bF54KNuhdEFPAa7tRyHjhaVsLBUEgBRLFm+rOR1XxbDI9C
         EOjmj4/LSjKxvTEJfHhMTx74Fii9mOOYaSFoeN8eKvrskTx+kUBUAjgFGgQb6PHqynfT
         TARg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h15-v6si1279952qtk.163.2018.07.13.01.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtRM-0002Jq-TO
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:28:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQp-0002Gi-0a
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 04:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQn-0004OU-Vm
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 04:28:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58124 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQj-0004IS-DU; Fri, 13 Jul 2018 04:27:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 033DA72632;
	Fri, 13 Jul 2018 08:27:57 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F6EA2026D6B;
	Fri, 13 Jul 2018 08:27:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:31 +0200
Message-Id: <1531470464-21522-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:27:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:27:57 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v2 03/16] hw/arm/bcm2836: Fix crash with
 device_add bcm2837 on unsupported machines
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
X-TUID: qPD3b4IKdALP

When trying to "device_add bcm2837" on a machine that is not suitable for
this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":

echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
 "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio

{"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
{"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
 hotplugged on this machine"}}
Segmentation fault (core dumped)

The qdev_set_parent_bus() from instance_init adds a link to the child devices
which is not valid anymore after the bcm2837 instance has been destroyed.
Unfortunately, the child devices do not get destroyed / unlinked correctly
because both object_initialize() and object_property_add_child() increase
the reference count of the child objects by one, but only one reference
is dropped when the parent gets removed. So let's use the new functions
object_initialize_child() and sysbus_init_child_obj() instead to create
the objects, which will take care of creating the child objects with the
correct reference count of one.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/bcm2836.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 6805a7d..af97b2f 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -51,25 +51,19 @@ static void bcm2836_init(Object *obj)
     int n;
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
-        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
-                          info->cpu_type);
-        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
-                                  &error_abort);
+        object_initialize_child(obj, "cpu[*]", &s->cpus[n], sizeof(s->cpus[n]),
+                                info->cpu_type, &error_abort);
     }
 
-    object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
-    object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
-    qdev_set_parent_bus(DEVICE(&s->control), sysbus_get_default());
+    sysbus_init_child_obj(obj, "control", &s->control, sizeof(s->control),
+                          TYPE_BCM2836_CONTROL);
 
-    object_initialize(&s->peripherals, sizeof(s->peripherals),
-                      TYPE_BCM2835_PERIPHERALS);
-    object_property_add_child(obj, "peripherals", OBJECT(&s->peripherals),
-                              &error_abort);
+    sysbus_init_child_obj(obj, "peripherals", &s->peripherals,
+                          sizeof(s->peripherals), TYPE_BCM2835_PERIPHERALS);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
                               "board-rev", &error_abort);
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
                               "vcram-size", &error_abort);
-    qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
 }
 
 static void bcm2836_realize(DeviceState *dev, Error **errp)
-- 
1.8.3.1

