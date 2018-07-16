Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1479821wru;
        Mon, 16 Jul 2018 06:04:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcbAyxetaPsLIXF8/NBlDGI15LQ9Dz+d7RvEbe2qaP30zxPYJzNWqa6PfdvWxJey/y0zFhE
X-Received: by 2002:a37:2042:: with SMTP id g63-v6mr13424045qkg.49.1531746246348;
        Mon, 16 Jul 2018 06:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746246; cv=none;
        d=google.com; s=arc-20160816;
        b=TAJ71vBGTjA56ML0yHw3cqn+P9cYj01zlvk/qy8QbTUrc1OTJunu0NDBzwLe3WXrGt
         eFL7Q1g602uC2koBWAo8+Kxcso/R8OY65y5yZzBfPgwv7uJ5HvpXrVfDzolGD5bKpDfH
         FiTMUWadCczUuvLiXuANYmld/Hb5+wIlS7kARnz3n/lE+ehcdIXqdVMCLz/2zsIfLHgn
         zQkEPxU1I9OkI80eeCv5NM1hWDO+19lA0Zv+1MBc+JW09kNbuslLNrWgAf1XDntZf7Fb
         x1ajjL5BDLtMaJKGeLWxRkMN8jG3GmN8aB0MM7l1+plYDwBsKqBI84tV8jtkmTPqx7/u
         +kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Moz20OT6aSwJuWn4QYH+HDnkYNjddWHmdIRnGNkY5SI=;
        b=YgpA9ZG8fzBhUNCVa8k+ubD3BAcBhc4Q5RgCW1R6TQXKJuKvU104SF25a2P/MT4yVQ
         UUBB53sV5VgDXeo3HzS1FZ+6NgUUShlxeLxo4oYUsAEHae9HBE0aEsMPMOgiK+Efl22t
         aVAPJaqslA33Su8bBrPnsGM5n0BQ5cBc8dGhi3CEp7ughcPpcgoocSP49JWePJ/GT35N
         aIwVh9IZqfINxw5QuyzvbfC1rFpMib04UX3eKIHD8vqP6lU7v2mYYtuKKT086iDiOKGZ
         EQHdi9T4zBDBUxeruOEudKtjX4VKz0qpSVwuUZ8wo3oMLswTdhGW/4vFpRcieJrzLX3K
         OYYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m11-v6si700152qvf.47.2018.07.16.06.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3Ab-0004Bh-RN
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:04:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36W-0001Cc-RA
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36U-00025b-F5
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48754 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36U-00025I-8L; Mon, 16 Jul 2018 08:59:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C03E2401EF09;
	Mon, 16 Jul 2018 12:59:49 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D5C01C589;
	Mon, 16 Jul 2018 12:59:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:24 +0200
Message-Id: <1531745974-17187-8-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:49 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 07/17] hw/cpu/a9mpcore: Fix introspection
 problems with the "a9mpcore_priv" device
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
X-TUID: NApRXWu01MiJ

Running QEMU with valgrind indicates a problem here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'a9mpcore_priv'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==30996== Invalid read of size 8
==30996==    at 0x6185DA: qdev_print (qdev-monitor.c:686)
==30996==    by 0x6185DA: qbus_print (qdev-monitor.c:719)
==30996==    by 0x452B38: handle_hmp_command (monitor.c:3446)
[...]

Use the new sysbus_init_child_obj() function to make sure that the objects
are cleaned up correctly when the parent gets destroyed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/a9mpcore.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index f17f292..a5b8678 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -27,20 +27,18 @@ static void a9mp_priv_initfn(Object *obj)
     memory_region_init(&s->container, obj, "a9mp-priv-container", 0x2000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->container);
 
-    object_initialize(&s->scu, sizeof(s->scu), TYPE_A9_SCU);
-    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
+    sysbus_init_child_obj(obj, "scu", &s->scu, sizeof(s->scu), TYPE_A9_SCU);
 
-    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
-    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic), TYPE_ARM_GIC);
 
-    object_initialize(&s->gtimer, sizeof(s->gtimer), TYPE_A9_GTIMER);
-    qdev_set_parent_bus(DEVICE(&s->gtimer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "gtimer", &s->gtimer, sizeof(s->gtimer),
+                          TYPE_A9_GTIMER);
 
-    object_initialize(&s->mptimer, sizeof(s->mptimer), TYPE_ARM_MPTIMER);
-    qdev_set_parent_bus(DEVICE(&s->mptimer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "mptimer", &s->mptimer, sizeof(s->mptimer),
+                          TYPE_ARM_MPTIMER);
 
-    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ARM_MPTIMER);
-    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
+    sysbus_init_child_obj(obj, "wdt", &s->wdt, sizeof(s->wdt),
+                          TYPE_ARM_MPTIMER);
 }
 
 static void a9mp_priv_realize(DeviceState *dev, Error **errp)
-- 
1.8.3.1

