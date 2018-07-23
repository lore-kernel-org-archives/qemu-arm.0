Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5443719wru;
        Mon, 23 Jul 2018 02:23:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcRXQnC60urQu7AwaGW6i2upXC80nEdI9uI5KomfM3Kyusye2JR9uVFOR4kCKBfzqorJmQl
X-Received: by 2002:a37:cc44:: with SMTP id r65-v6mr10996604qki.285.1532337797686;
        Mon, 23 Jul 2018 02:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532337797; cv=none;
        d=google.com; s=arc-20160816;
        b=bTVA15WUaP4ZW2fczypTbpCgx8S/tbDJLIulGnKnVHAcKVBD19FhoGoDVp3NmUmZvb
         9uqm3LKA9wbDUCmVZfa8qVkvEc5sdYZTPQZNU/PLo3jrS4PDAaQBaUBImjuRKcxQGHrx
         myQveBUAkaxb7a5NzPeAVNvvCVGnZlIRvWVH2C4+GgEgE7eZKTADHmyqwC8nVi1DAC25
         isjbqs91ii5JGbYWlyjr2UWQswF0Ts1q4jDmFlJmG1U4ayFiIKfG/0z5NlF3eXPLTTMF
         Yld+qtnOJSuVII8cDNysJySPzMeheqCYdnixsPYQe5IitJEE0zNBQXhtl0mbSufLLhgj
         rKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=tT5+dDzlSnoCmP2+nIvXGX4Eym1A36jOny/evwjq+IU=;
        b=g+Ls3IbSl2CfwQ7WJUOCbhPuwY/SGrxVbKCIfsdQTw6GER5XmabqkCjqIdOiVFHMQA
         Wlbj6b3asFE2lgkRUhsXMxx1Hgcj8EEIwgCFuNjdIfUkkf5tVzvlgVCKnWyyij3Fno+j
         mFi0iPwT63FztlCz5jmP2apOah8MOlI42BFGXMWe/JpZH3sQ1XcLcTgGNiLXoNA8qQQy
         rGM1CvETagEtJ5e3xGHf0fwXzK7vsLQJAnbuKkpJtF/QsFwT8basckdCthp7YmWtEC+x
         zpE92E229shX0RvzbaRe5xPeiBgaCqK4BG2EUdBRWqGZABJcsljCKgMuKiJfxlUuxjJh
         7sNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si1472533qki.370.2018.07.23.02.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 02:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhX3l-0004Qq-8g
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 05:23:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fhX3e-0004QZ-S7
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 05:23:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fhX3a-0000ql-Sr
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 05:23:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43542 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fhX3a-0000qd-OJ; Mon, 23 Jul 2018 05:23:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32EAA401DEA8;
	Mon, 23 Jul 2018 09:23:06 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C4567C2B;
	Mon, 23 Jul 2018 09:23:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon, 23 Jul 2018 11:23:04 +0200
Message-Id: <1532337784-334-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 23 Jul 2018 09:23:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 23 Jul 2018 09:23:06 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/intc/exynos4210_gic: Turn instance_init into
 realize function
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VJMLJB65C9d+

The instance_init function of the "exynos4210.gic" device creates a
new "arm_gic" device and immediately realizes it with qdev_init_nofail().
This will leave a lot of object in the QOM tree during introspection of
the "exynos4210.gic" device, e.g. reproducible by starting QEMU like this:

qemu-system-aarch64 -M none -nodefaults -nographic -monitor stdio

And then by running "info qom-tree" at the HMP monitor, followed by
"device_add exynos4210.gic,help" and finally checking "info qom-tree"
again.

Also note that qdev_init_nofail() can exit QEMU in case of errors - and
this must never happen during an instance_init function, otherwise QEMU
could terminate unexpectedly during introspection of a device.

Since most of the code that follows the qdev_init_nofail() depends on
the realized "gicbusdev", the easiest solution to the problem is to
turn the whole instance_init function into a realize function instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/intc/exynos4210_gic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index b6b00a4..69f9c18 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -281,9 +281,9 @@ static void exynos4210_gic_set_irq(void *opaque, int irq, int level)
     qemu_set_irq(qdev_get_gpio_in(s->gic, irq), level);
 }
 
-static void exynos4210_gic_init(Object *obj)
+static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
+    Object *obj = OBJECT(dev);
     Exynos4210GicState *s = EXYNOS4210_GIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
@@ -347,13 +347,13 @@ static void exynos4210_gic_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->props = exynos4210_gic_properties;
+    dc->realize = exynos4210_gic_realize;
 }
 
 static const TypeInfo exynos4210_gic_info = {
     .name          = TYPE_EXYNOS4210_GIC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210GicState),
-    .instance_init = exynos4210_gic_init,
     .class_init    = exynos4210_gic_class_init,
 };
 
-- 
1.8.3.1

