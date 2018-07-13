Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp431145wrq;
        Fri, 13 Jul 2018 01:36:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpemswGSe3NTWQxSGqlMO/DpfVSma7et3vBe+cwWx1EdOoYOUJCPZ0vwCOpUdlfqJtIO3Mol
X-Received: by 2002:a37:15aa:: with SMTP id 42-v6mr4730605qkv.428.1531470963892;
        Fri, 13 Jul 2018 01:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470963; cv=none;
        d=google.com; s=arc-20160816;
        b=guOOM0mw5ByQh9kywdz82Jt46U6S7EDYPTR+K1C1MPrP+NgVYreYsi24y88Hs4VBFQ
         GfSe9b9A9H151kEZ9Ley+6NSrFK0UTWtS+McysKL9020/650huyuuvVgp2mJhkHyrmq1
         ftad9Y5jJ/yrudcEW15qVUroApKmVsbsDkFmszPn2F6lQd/SwOYpO7kd8VX0lv7DZ/8w
         0E7teuLgcZRA+IluS1KnBtQHpNHEvrL/Ma+ic3/3iclp9nnPIQ4qNn6DMLb3fLVxZufm
         U1J03Gr1RsCDYn7pn2uZVY+nyImF/DlVJm3mrRON6rjPdod2HAzeFsYkgFEP//NXsPvc
         +Frg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=trybUD2ZYMGnNPiPbWpq/6t2tithvrNlioRkBNbuLVQ=;
        b=gTFTmQd0FxzLVKUujvpfUMC7MVfeknqCXZrGZ0uR+X6r1cHeehjUypl6gUXLFfvrWC
         AkOh0zqAoMzIcHkNTvrburPXa4Cl4QuzBwkwiqoNS/z/8u33YUwBSyqlDt6oHxGr8Hpq
         plD144h728yyae0g08WmCAFnuv2JddImvloHF4TmF6MQf9hsEsdMeK5nRtY0tAYOhS9G
         /QpSJhT0EArJJeZtIl4qutdn0J2xWxrtrbj8pzsTtO1TksQHcjiulBy4TaRw1PESJYl4
         dgDrHMKLt3IFDMVSrZ1vdU67qNg/d1RfSwpQAS0SQCm6kSVQzcVJkSCqD2Fu35TVYcmo
         BQsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t72-v6si1474702qkg.138.2018.07.13.01.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtYZ-0000N2-Al
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:36:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRE-0002hp-Mu
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRD-0004zV-O3
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56500 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtRD-0004z1-Hn; Fri, 13 Jul 2018 04:28:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D034402382F;
	Fri, 13 Jul 2018 08:28:27 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 692212026D6B;
	Fri, 13 Jul 2018 08:28:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:41 +0200
Message-Id: <1531470464-21522-14-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:27 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 13/16] hw/arm/fsl-imx31: Fix introspection
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
X-TUID: j67yZV9DoIQa

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

