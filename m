Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1495936wru;
        Mon, 16 Jul 2018 06:17:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpetj+opxZUShbO8g2Ecj/7v77w4XpYAFDQXEii0EW+T3afucJeTJp5TbLYKJjQ1djIhWEQn
X-Received: by 2002:ac8:2541:: with SMTP id 1-v6mr14564143qtn.248.1531747064738;
        Mon, 16 Jul 2018 06:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531747064; cv=none;
        d=google.com; s=arc-20160816;
        b=uYRqIQmymGHkBpKzcBdf1qkZZo+fQN/hrN1jB6epXuirGDjHkRf/egzm/qt5x4Q5r9
         2GXMPUJuLlliYEDqTcH2Q38JksjDWr0SyISfJJ1v46H15rVak007dosTgVmOrFR5WwoD
         q59xUTi0nUPh9yVye/hfk//fNznADnwNdU45NV2TASxNFzWtxH1Mt6du0+RECxwPPY6h
         HSslz7xyub3tqxNQ4AdiGRxhpngV420mM6GigJj/I1FWEyEBGjHW+N6sTaBYELjxhQrc
         Rv0bvwqRJUdRFtc1CPPzsJHfs47+G0llRbBG54KRR2PVHbBHXikYwZ5NN0O1+9Q3JAVk
         W70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tmrOVFMWx69wegID5eZ2kE+g/hFqQzo/IKU1QLYenWE=;
        b=fQxde8Di1fT44wok3SooFDdLYlSu1RQyLjMhhFZV9AvqqUn+ne0+yaDZyyzyiBhLml
         Ri0r/8vfhBukeJ+Hxgfex9AOMdJUPmjLeK3OjTEAnzCB0HjgZUA/Zb7yPvJJ/WX/E8/U
         /Etk14VToXE6x/t1bTarorIqjPuWxP7uxpKS1a2ougMLVprcfjj2DHNlbheyl2BxgXXG
         kha2Rh1UQgzFvYm6XKpm4dOz7a1HYd6rnD1bkjy/3yxZyME0Nq6RTLHvdIlZjY+no4qq
         /nqteXs60o1UyRqtRKoAppEsWiJeyiOeMcAEBbzQEKH++/OYmAN0j/qcRMKaQmwyIM+p
         7xiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n11-v6si8229496qvo.33.2018.07.16.06.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3No-0006uo-6G
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36j-0001QE-R4
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36f-0002CL-Up
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48804 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36f-0002CC-QP; Mon, 16 Jul 2018 09:00:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2CD6E401EF11;
	Mon, 16 Jul 2018 13:00:01 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89E571C589;
	Mon, 16 Jul 2018 12:59:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:29 +0200
Message-Id: <1531745974-17187-13-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 13:00:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 13:00:01 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 12/17] hw/cpu/arm11mpcore: Fix introspection
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
X-TUID: UUnpEa4uUabK

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
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

