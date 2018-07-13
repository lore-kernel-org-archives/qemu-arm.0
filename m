Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp427563wrq;
        Fri, 13 Jul 2018 01:31:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdH5f8Gi8+oLNF7oy7mW0uJQ+/rIvz0TpLTGJg//iCvUwc/UBZ+lZT3+rrLVRhyWynmIBIb
X-Received: by 2002:a37:30d5:: with SMTP id w204-v6mr4746082qkw.317.1531470676474;
        Fri, 13 Jul 2018 01:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470676; cv=none;
        d=google.com; s=arc-20160816;
        b=y99E/C+k1sfe9cT6/wsb6CIYkXzlisvMb+Xxgg6kfXNkEXasE43Zo1BQ+XX62oXOgT
         nsK/tfKBAZaLUXvAtYJ1JbZqn44OAOFKWq6fvUy871YxobJCv+b0Pg2OU94CPAoyr15/
         YQnnO25v/9UFe0apxHsAozYDovRKLB51AwWfujUadR3/8T9tp2aqnwW6jst9b7+BvuNy
         lTFRX+QtzbUnsk3JHoyvz1jswrGnpBiRBeajs7UAgSb/WjsEKN5isPZzuih0xPY/2gLc
         eqLbqDTmttoV5MMAhCPy5P2k18vY7BV7jnOWpE2GxUMo7e0vji7ApKyb94umLEfV6cz7
         8YvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DKXevg9vhFv/dTXfyuMxqUmwa8dF8e4TVHfALBUVvvk=;
        b=PGK2VLbgBd0SkBh2dvT5WghiyVOVzsgJELWUpJ0Fr9C3OZHXH2FFgA7LwyqJh4LSpd
         wqPcWNknxsY9UU72i7k1+m8R48c9EW/fPFXHCRoYrsGKfMef8029en0I6En7UycZHRAf
         Fmp3v5uMDAwdwHHzuFWXJVpETKBvTlK8o3AxVfEO7z7iYYGdqE64YfmmpzM0BKeFOMrB
         WLuRAQ85rwSeiNQzDXxvLSoRaAlCTMMZR35UfEBJmQ9fjKKSd1PmKkVAYu4ip9EPonlt
         8fFA4OJ+oIExJDWhepWAQJT32nz2JY+xpcDBl3cJzpHfMTyninBUS2NfnEIiyNFjvVLE
         GY/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s20-v6si1088130qvj.130.2018.07.13.01.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtTv-00052o-UL
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:31:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQq-0002IR-Ay
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQp-0004RW-Gv
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56464 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQp-0004R7-CD; Fri, 13 Jul 2018 04:28:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E81C5402382F;
	Fri, 13 Jul 2018 08:28:02 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 727CF2026D6B;
	Fri, 13 Jul 2018 08:28:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:33 +0200
Message-Id: <1531470464-21522-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:03 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 05/16] hw/cpu/a15mpcore: Fix introspection
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
X-TUID: G0L5mFGD9n9o

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

