Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1509185wrq;
        Thu, 12 Jul 2018 08:35:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcf1PLHo4YDPMAYkZsBF9Mcoij6W/+AnOFG1RRudaU9+wUXcln/xudo5wtT1vZcSUerytR7
X-Received: by 2002:a0c:c345:: with SMTP id j5-v6mr2884277qvi.245.1531409743338;
        Thu, 12 Jul 2018 08:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531409743; cv=none;
        d=google.com; s=arc-20160816;
        b=V6GQPQ790wLdqG9aqxmyh2iQaNIkzmdF//4rWAt4rHVHELTZOvgA2zm+BFsjSSw8fE
         S26jkWoIglD/g1j620DNgTchKcLZAMVaKHp6QcCTZWtFRwFrL1SPV1wHL+BD3+z70UTF
         uyMKcEEoJgfYMKI5n7kJ/dw77a6CJZB0kQoT1yuR8EKouuFom/YcflriXEUC58BAlW1B
         HRW9ujOU3jj4bGAA5s4HVnZnkoolvaw0dkC0d3xSoR5jWlDVftrWcDwBR9XIG/CeON1y
         kCm27je6B8cbGx1tP+3wYm8h+bmCSbnWj37AmVr2iR3mupNXO/rfyIqc1oy4RFLkHVtp
         LltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DKXevg9vhFv/dTXfyuMxqUmwa8dF8e4TVHfALBUVvvk=;
        b=vJR5Yj/yQ9WEfHjPRCu4Fu9Bb4OsxlM1WEUItOaHSRmkC0Zt3IYLClsMnbDiugBGYs
         mn8rgIZr2kJi5LQojqoqqNFT6EtVdYBSfe5dfb6YWcg86uE68+y1POucMz/BgCysHT4s
         6Iiuzq4MzKv7JnHylrmFsbxdo5nfzNybRS0D80U8UEa9ZQsnKfQ5AZ9Eo+qBAtRbSDDo
         LiRFfKGjecNXb8AmMOWvWY3B6SMjsc1kdnHgH7DoTlV7y+by8C4ezwO1W/rs0YVlPo99
         NpRBMVCoojFW68UEWLIPWhKb6FyzSzPzBVT6vXVfSLJ9/x1CRRetimvAOk7BJhyY8ct1
         q75A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d38-v6si3248919qte.221.2018.07.12.08.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddd8-0000BV-Qd
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:35:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYw-0005PW-Uv
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYr-0007zk-3v
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45758 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fddYq-0007z0-VM; Thu, 12 Jul 2018 11:31:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C8D84075844;
	Thu, 12 Jul 2018 15:31:16 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE2B1C674;
	Thu, 12 Jul 2018 15:31:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jul 2018 17:31:03 +0200
Message-Id: <1531409463-3843-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1531409463-3843-1-git-send-email-thuth@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 12 Jul 2018 15:31:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 12 Jul 2018 15:31:16 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 5/5] hw/cpu/a15mpcore: Fix introspection problem
 with the a15mpcore_priv device
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
X-TUID: 7yj/PAqgQBZs

There is a memory management problem when introspecting the a15mpcore_priv
device. It can be seen with valgrind when running QEMU like this:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'a15mpcore_priv'}}"\
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}"  | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
{"return": [{"name": "num-cpu", "type": "uint32"}, {"name": "num-irq",
 "type": "uint32"}, {"name": "a15mp-priv-container[0]", "type":
  "child<qemu:memory-region>"}]}
==24978== Invalid read of size 8
==24978==    at 0x618EBA: qdev_print (qdev-monitor.c:686)
==24978==    by 0x618EBA: qbus_print (qdev-monitor.c:719)
[...]

Use the new sysbus_init_child_obj() function to make sure that we get
the reference counting of the child objects right.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/a15mpcore.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index bc05152..43c1079 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -35,15 +35,13 @@ static void a15mp_priv_initfn(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     A15MPPrivState *s = A15MPCORE_PRIV(obj);
-    DeviceState *gicdev;
 
     memory_region_init(&s->container, obj, "a15mp-priv-container", 0x8000);
     sysbus_init_mmio(sbd, &s->container);
 
-    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
-    gicdev = DEVICE(&s->gic);
-    qdev_set_parent_bus(gicdev, sysbus_get_default());
-    qdev_prop_set_uint32(gicdev, "revision", 2);
+    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
+                          gic_class_name());
+    qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
 }
 
 static void a15mp_priv_realize(DeviceState *dev, Error **errp)
-- 
1.8.3.1

