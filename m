Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1479243wru;
        Mon, 16 Jul 2018 06:03:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfta9hoWtz7VT245hEkLyQOb1/ojov7ul4m3N6gYA0vlt3qrkRVJQM28SLU0QsfrGYrErFa
X-Received: by 2002:ac8:3fda:: with SMTP id v26-v6mr15305965qtk.414.1531746219535;
        Mon, 16 Jul 2018 06:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746219; cv=none;
        d=google.com; s=arc-20160816;
        b=DUF43sMeJfem8ldDsVzpCm7Zd3vPswtTiifBFhWLsS5il9y3mKkRIQQVRZWDspEgL9
         AXxlAmFAfP3Dm/uA2KRDQtWnLddg92SEPM7khdy4Ol3QRGp8GAAwetfBuv4VAd8GnZHw
         hlCqYvUcLRqZwbJMKd0D0+2uRbDgASNgFWRf7OlprGMd5mKAuftD9Y675ZOhohPdVshY
         dlGVCnS4SjzxCwGR/K7yqEo2L82KFWvrXwWz2CEjC9SqsijZldFrF9dpGLM+C9z9eiII
         jG35rzM1+vyWWBiRAOcuI2kOhke8rVZyW7WO5fHDoAMLo3irnPM984QvZ4u/g6VygKYz
         KYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=a4h3dxSEL8L4xNcPTJz6GSoOzQobNhCdqMbpvmawAio=;
        b=xZIw08ForFB5fOE2UzAISSOKYbQGDBOvWbgT8MHMt3p74UNRVPwO5LZiPR5ho9R0Xc
         cx3ZqzfO2V6St0Z+JcQ7bC83xMQvM8qd5YiJOAmfKY3LG6QIyMJrMIO7eEM4OTbXE4Hs
         oW41BvIB32E6pSeIc820HjcIcfNtlJJnn15p18ob2X/j4HCznHS68J3CRbv8xl09J0hU
         ZTa4PpVUvZFmpgcWTX31RbhxADjD1Ejf9ZzgLOcTs8Y5AG7hdhKMHYaxOWRHylSlBSD7
         qqFM3JsBEDf7mMiRRfieZqpFBOEc1ucSIgmVmhW7ymnkDBSo/9ccBIQzFC/iHMGLp6aH
         eGUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o7-v6si3100176qvk.183.2018.07.16.06.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:03:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3AB-0003qg-3T
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:03:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36R-00017B-Qd
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36Q-00023v-UP
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58814 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36Q-00023e-P8; Mon, 16 Jul 2018 08:59:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CE79400225D;
	Mon, 16 Jul 2018 12:59:46 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C5FC1C589;
	Mon, 16 Jul 2018 12:59:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:22 +0200
Message-Id: <1531745974-17187-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 16 Jul 2018 12:59:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 16 Jul 2018 12:59:46 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 05/17] hw/cpu/a15mpcore: Fix introspection
 problem with the a15mpcore_priv device
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
X-TUID: mfbeNtCjgjQb

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
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

