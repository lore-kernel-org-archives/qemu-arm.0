Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp429569wrq;
        Fri, 13 Jul 2018 01:34:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcNFvYvHUO0Fo8n92AnB7g8Lgs/7VDJHQiUzo6vNitD/2sWDh3PFeUOXbMGcu7NvVPE0Hps
X-Received: by 2002:ac8:4102:: with SMTP id q2-v6mr5020899qtl.222.1531470840072;
        Fri, 13 Jul 2018 01:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470840; cv=none;
        d=google.com; s=arc-20160816;
        b=vgYhKbjGQHpjjP+kE5nKrM0I+JAuZ5RqvJCqsVReLdKvtpanP8n60HvgeYNwM4bLrP
         72q+z6HOTTLQS2AZy4WBfTY9l1lkV68HCkSAUrETNXbCyrEAvllfpmM3pRy+FflFU+4M
         UNPhTSs2DKJ50WaDtigzIwakoHixqJ+QWOVg5vx/4Iim4ycMQjeFbgjqBWmYP5Ap1Ufp
         KSkr5Jp0ZlVsr3xVeVdsbiCrYu314qdo6oH0nv4yW/2+HQNlTjm5x+sfPG2XEJT0+PIq
         FjM9HU7zU0LDs1fiW4hmR3rWh54Cm4D9zKwoA0HR2MTnlj+8cN3naRbEsY2ZZr/8wLTn
         8eAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ARveiqjm4DyKfxQU1kv0qAdtMqaLFLS2aiBgvG/P0Yg=;
        b=1LDi13+sCdZUoAggiIgYz2PNiqt1y80E00+hbjUCHKEIdbitfNrHjcfy815wPTNYLe
         ACB7JNEtyBKugS8rcFDOXZtV0BvzY55cdvMZhBoInsXOdYyvg4VRLwET9TwqYi6+khlP
         awBQ+2wycTE3kmkPFyLRICu+q6jyIktWyGCNj9HuBOZipX2f+t0la8gzWR0ENplqSL+0
         z6UeBEn3a2BO/eBCEedsEmM8QwIhgccImtx4nZZYLt4eHqAkJu+HsmlVEaD47p2/loat
         df1O/kJ8MFVA4rOejGkRLGpUms8fLKgOXatCYibtSJJf+ejQtvLH7fQuvGQoa/U5A8Il
         4FRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o184-v6si7705428qkc.288.2018.07.13.01.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtWZ-000765-HZ
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:33:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRH-0002ky-Ic
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRG-00054O-N4
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42272 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtRG-00053m-Iv; Fri, 13 Jul 2018 04:28:30 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DDC38182D31;
	Fri, 13 Jul 2018 08:28:30 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AA122026D6B;
	Fri, 13 Jul 2018 08:28:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:42 +0200
Message-Id: <1531470464-21522-15-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:30 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 14/16] hw/cpu/arm11mpcore: Fix introspection
 problem with 'arm11mpcore_priv'
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
X-TUID: kOnOS7rf7l7n

Valgrind reports an error here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'arm11mpcore_priv'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==3145== Invalid read of size 8
==3145==    at 0x61873A: qdev_print (qdev-monitor.c:686)
==3145==    by 0x61873A: qbus_print (qdev-monitor.c:719)
[...]

Use sysbus_init_child_obj() to fix it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/arm11mpcore.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/cpu/arm11mpcore.c b/hw/cpu/arm11mpcore.c
index eb24465..8aead37 100644
--- a/hw/cpu/arm11mpcore.c
+++ b/hw/cpu/arm11mpcore.c
@@ -121,19 +121,17 @@ static void mpcore_priv_initfn(Object *obj)
                        "mpcore-priv-container", 0x2000);
     sysbus_init_mmio(sbd, &s->container);
 
-    object_initialize(&s->scu, sizeof(s->scu), TYPE_ARM11_SCU);
-    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
+    sysbus_init_child_obj(obj, "scu", &s->scu, sizeof(s->scu), TYPE_ARM11_SCU);
 
-    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
-    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic), TYPE_ARM_GIC);
     /* Request the legacy 11MPCore GIC behaviour: */
     qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 0);
 
-    object_initialize(&s->mptimer, sizeof(s->mptimer), TYPE_ARM_MPTIMER);
-    qdev_set_parent_bus(DEVICE(&s->mptimer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "mptimer", &s->mptimer, sizeof(s->mptimer),
+                          TYPE_ARM_MPTIMER);
 
-    object_initialize(&s->wdtimer, sizeof(s->wdtimer), TYPE_ARM_MPTIMER);
-    qdev_set_parent_bus(DEVICE(&s->wdtimer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "wdtimer", &s->wdtimer, sizeof(s->wdtimer),
+                          TYPE_ARM_MPTIMER);
 }
 
 static Property mpcore_priv_properties[] = {
-- 
1.8.3.1

