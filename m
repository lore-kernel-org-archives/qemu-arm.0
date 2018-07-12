Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1504974wrq;
        Thu, 12 Jul 2018 08:31:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe2LfHWpGo2bvS59fPerN9uhqbFLmLUhXHr9CNcK5VyiLzaBeak7SVuYWM1kgUnRTC0vTPE
X-Received: by 2002:a0c:ae71:: with SMTP id z46-v6mr2900076qvc.108.1531409502010;
        Thu, 12 Jul 2018 08:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531409502; cv=none;
        d=google.com; s=arc-20160816;
        b=0wKODrYkAgVzyXfOMN5DvUkdVf1t9Y/a9pG0JIS3BRX1UmnKS04+RbJYN817wOtRj1
         qwFMiZamtDKX3p3dR33wJn5qKmt6EaCfMYmnJsTQRtZtA4y8WKJow6yrafyrq6UHEMRu
         idyh4zh453Y/QmXyCqMMeOVufS+KieBjEcH3o4dl+r6AL27THLVAUgf7Q/vrpdYwHSOl
         z2NZKoS31f2n62XTD7pJqx2okqjQonoGFxWFq7JlhcgdB/TOVB2YEXMzWrYgZ0MJiTgi
         GKohEOlHKsFOxYX3J7I/7WTAqdcTv2mIpVGioTVlkngaCIBhr6qxgHyTpA7pBCtdnsup
         EcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2e6OSUU0+/WnUWfiozbqwLjp4NO0qgkY/c/frp2aop4=;
        b=JJ5Nlni7GC9ZKn4v+1cQzZTuMuNzIh6hhEJVIyFlzehLFprbGQlcR5UnYImQU+Z73G
         zOwYaRiV6OGfKXq1FAT8ankZRCfBpPj5oSRUsFXIWCQl4dzDh9mhDZ6kjCSniW5PmysY
         oXm2QIup1S+9nCvXZoJXWZVzsZj3bH4R5tyMfUV8g6+NZ66xVny6EGRL0W6fr3legqW7
         nYDTXHnNtThctkfLeg87PQr3OjFKHbPSjE48FdsRkxaR6Ui1F58RwIts5hH3sTixZFkl
         5lcbWwBG/R0OR/kByNuy+zh9OeNqaS58zxgEGDhMuBkY+pT4pZ5z3c5bQ0PX9ODDmCjc
         xECA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j41-v6si2191626qtk.138.2018.07.12.08.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddZF-0005Vw-Cq
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:31:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYo-0005Gl-0w
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYn-0007u8-1S
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38066 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fddYm-0007tW-Sr; Thu, 12 Jul 2018 11:31:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72CF9C32E;
	Thu, 12 Jul 2018 15:31:12 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC7D71C66C;
	Thu, 12 Jul 2018 15:31:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jul 2018 17:31:01 +0200
Message-Id: <1531409463-3843-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1531409463-3843-1-git-send-email-thuth@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 12 Jul 2018 15:31:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 12 Jul 2018 15:31:12 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 3/5] hw/arm/bcm2836: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q+FGf+Ml3Whn

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
object_initialize_as_child() and sysbus_init_child_obj() instead to create
the objects, which will take care of creating the child objects with the
correct reference count of one.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/bcm2836.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 6805a7d..b62adeb 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -51,25 +51,20 @@ static void bcm2836_init(Object *obj)
     int n;
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
-        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
-                          info->cpu_type);
-        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
-                                  &error_abort);
+        object_initialize_as_child(obj, "cpu[*]", &s->cpus[n],
+                                   sizeof(s->cpus[n]), info->cpu_type,
+                                   &error_abort);
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

