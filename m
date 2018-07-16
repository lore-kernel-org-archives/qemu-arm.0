Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1488232wru;
        Mon, 16 Jul 2018 06:10:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdKdcdX3+JNZKUQ6PHbYKFspFE+bk/+BJfio+8P9BOiux/VNAoaAMaPpDBxTcXWgzUEkN12
X-Received: by 2002:a0c:f9c8:: with SMTP id j8-v6mr18014393qvo.177.1531746648976;
        Mon, 16 Jul 2018 06:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746648; cv=none;
        d=google.com; s=arc-20160816;
        b=K31JRh/zUOK/WQPr6slbvX+NrU+i4V3hrpmBIDtzmUPrnPjmZvW4dYgY9uUE832fe1
         b60YvY95gTv4XnjVAh6FYQ14dmxcDG8CVT5eWPvz9F04JshPOocNtbaXXrMSN8mrc5vM
         1vsrT9GjpD5CA7adzC3ppYzhFZEiZONtpe349HCEMrzjfR43MQlOiZP0ZzSLbix6YESN
         heVJH7aUbqkO1diur6naPncZCZaxgduZI8XZ827RSznuxa1Ch0E6rHJGV91xGWqEENXf
         /Hfzo6BpWzi7ZB0fFGdA8dJQ6kj2+t3hEfeUXR15RLpXpBXNSVJucT+Ye8t5V91Q+6+w
         MIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gwOb8ELfarvcjp3G1Ys58gIR2F2DHbFCij+5AbnP2es=;
        b=QBmlQJm5I8CWM0NktqikpjqCkxbpi5hOI/tejxFtVyXW0WiaJMENYNBpeFo6AXV983
         Ka5UHh8wskBIuN2ldl9bp5Vx7bO19vmzdTUa+kPi2SO5atbA4C//N1iQSde8z1ZYLRM3
         lnxuS41jpNu6YDWmyTlsYk/h7ZqB4askpqk4X6cENgUbQNzujzTssQkI56UwYFu7bNaa
         9HuDVzgbc9Kf9lxUE9TRKGzl+I+MoTfnj0Q403/Ey4QBfLSB5tQNOmhN17sLfGs/TeOB
         Bx/6S1ZKSv/pVqj15HDRQHcgcEoKyAYiuXi9e+jxsXu3R5cCVxUFQNXDNfm5VAn2yX7P
         nlng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10-v6si9673290qtk.181.2018.07.16.06.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3H6-0001WK-D0
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36g-0001My-TJ
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36e-0002B7-1x
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48792 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36d-0002Au-SM; Mon, 16 Jul 2018 08:59:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53DDD401EF09;
	Mon, 16 Jul 2018 12:59:59 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B22AA1C589;
	Mon, 16 Jul 2018 12:59:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:28 +0200
Message-Id: <1531745974-17187-12-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:59 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 11/17] hw/arm/fsl-imx31: Fix introspection
 problem with the "fsl, imx31" device
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
X-TUID: x4SzboeNa+Aa

Running QEMU with valgrind indicates a problem here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'fsl,imx31'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==26172== Invalid read of size 8
==26172==    at 0x6191FA: qdev_print (qdev-monitor.c:686)
==26172==    by 0x6191FA: qbus_print (qdev-monitor.c:719)
[...]

Use the new sysbus_init_child_obj() to make sure that the objects are
cleaned up correctly when the parent gets destroyed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx31.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 891850c..ec8239a 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -36,33 +36,31 @@ static void fsl_imx31_init(Object *obj)
 
     object_initialize(&s->cpu, sizeof(s->cpu), "arm1136-" TYPE_ARM_CPU);
 
-    object_initialize(&s->avic, sizeof(s->avic), TYPE_IMX_AVIC);
-    qdev_set_parent_bus(DEVICE(&s->avic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
+                          TYPE_IMX_AVIC);
 
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX31_CCM);
-    qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
+    sysbus_init_child_obj(obj, "ccm", &s->ccm, sizeof(s->ccm), TYPE_IMX31_CCM);
 
     for (i = 0; i < FSL_IMX31_NUM_UARTS; i++) {
-        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_IMX_SERIAL);
-        qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "uart[*]", &s->uart[i], sizeof(s->uart[i]),
+                              TYPE_IMX_SERIAL);
     }
 
-    object_initialize(&s->gpt, sizeof(s->gpt), TYPE_IMX31_GPT);
-    qdev_set_parent_bus(DEVICE(&s->gpt), sysbus_get_default());
+    sysbus_init_child_obj(obj, "gpt", &s->gpt, sizeof(s->gpt), TYPE_IMX31_GPT);
 
     for (i = 0; i < FSL_IMX31_NUM_EPITS; i++) {
-        object_initialize(&s->epit[i], sizeof(s->epit[i]), TYPE_IMX_EPIT);
-        qdev_set_parent_bus(DEVICE(&s->epit[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "epit[*]", &s->epit[i], sizeof(s->epit[i]),
+                              TYPE_IMX_EPIT);
     }
 
     for (i = 0; i < FSL_IMX31_NUM_I2CS; i++) {
-        object_initialize(&s->i2c[i], sizeof(s->i2c[i]), TYPE_IMX_I2C);
-        qdev_set_parent_bus(DEVICE(&s->i2c[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "i2c[*]", &s->i2c[i], sizeof(s->i2c[i]),
+                              TYPE_IMX_I2C);
     }
 
     for (i = 0; i < FSL_IMX31_NUM_GPIOS; i++) {
-        object_initialize(&s->gpio[i], sizeof(s->gpio[i]), TYPE_IMX_GPIO);
-        qdev_set_parent_bus(DEVICE(&s->gpio[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gpio[*]", &s->gpio[i], sizeof(s->gpio[i]),
+                              TYPE_IMX_GPIO);
     }
 }
 
-- 
1.8.3.1

