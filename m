Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1474037wru;
        Mon, 16 Jul 2018 05:59:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpehb8OWF+pj/9Amjj/Vs4IDceYflVYM6Ce6Y5pW0+nDilhE6L2FSth/J5mxX1J6xDWfKybL
X-Received: by 2002:a37:b001:: with SMTP id z1-v6mr13851200qke.156.1531745998753;
        Mon, 16 Jul 2018 05:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531745998; cv=none;
        d=google.com; s=arc-20160816;
        b=tWHO96OHYfKtTow1YCnMt3PqLztj9Olvv8nh/B2KAJbD89grDXdW+8ab+Woh1b/aru
         LZwsBIeCIR9I8p5qNltvp+fKLi64JiT00sBeQr0VEeI+yE277wKo7veXnGXkJ06FYWcM
         xGM3IAF3oiqtwALy4NGQ2Yre6YRMPLzp//13sssfEv19u8Dr343PS/HAvr4WgFWR/i9p
         +U+VQ8HPtqlePzfPnzRCdjl8QmZPI5hbJhQHpp1RGf8acRq9AEQV4ma/mdBQ1d14RMjq
         NXTEfNPizBZnfqag1iuEPKeUxfj+ONGXfr3hh78cEA7LVzzv3VCQ7UpmPyn46OnbW4Wt
         5ogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=UoyCOnBDhD/dFJA9HF4lZRm4/hF82FNU+t5EfSZKhmc=;
        b=pNu8+yOyhu/tGyqTJz4cJG37s0+E1A8jsB1RVagniOynRXA3Kijd0Zw4MgfxiVoxQU
         XVpUtkL9B60jcJh40cpULv56Qgr6fj6PsHPNT/SSUsUHGXvc8KGl5eTCHzdm9/BuK1Tm
         OkJCJ6PXB2GFElJzqSl5NiJuEobQ4gEDGFEdcLDl+39MpT8zci3RxdCH3Q2o0+MGLW2J
         3JMW5equczxFhdIV5ypwcfcNa7eTfOjg+XFElhgswpFnHuwG5/yBkNfe24chf6hpnwXf
         vDrTwbJVjYXDCOAf/j3YtlLTlNUkES/nMlILayEs3SNHylHF4lX8XzEY4hasNolNCtfs
         DsUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y24-v6si4465891qve.2.2018.07.16.05.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 05:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff36c-000169-6B
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 08:59:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36O-000143-9R
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36N-00021e-9p
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35414 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36N-000215-4E; Mon, 16 Jul 2018 08:59:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BFF37C6A9;
	Mon, 16 Jul 2018 12:59:42 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB6101C589;
	Mon, 16 Jul 2018 12:59:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:20 +0200
Message-Id: <1531745974-17187-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 12:59:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 12:59:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 03/17] hw/arm/bcm2836: Fix crash with
 device_add bcm2837 on unsupported machines
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
X-TUID: VgCnGvqo7HiA

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/bcm2836.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 6805a7d..2595d93 100644
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
+                                info->cpu_type, &error_abort, NULL);
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

