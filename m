Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp428409wrq;
        Fri, 13 Jul 2018 01:32:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfiwfwIppOIzAb/57bPe8PJ5EOOdy441GDAUNiZw9fzSKhPsUy8ZvQFBGDjACC2PAR0j050
X-Received: by 2002:ac8:302e:: with SMTP id f43-v6mr4869945qte.217.1531470738416;
        Fri, 13 Jul 2018 01:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470738; cv=none;
        d=google.com; s=arc-20160816;
        b=pTGE0B7s6Ep2Pq8w0bEMBdABCQHTJfqFL6Cv91YUz+RjLIec5e5uEc0GP4ICbPnIvc
         gldj1PbFfGbCghr0gCpJ4l6khcls5P7QpEiprE6siJaMga34PTIfxWep1tz+E7pR7W9B
         8o6uDCJGfNDIWaDCpzvV0RdIH9Nifrm4jdElhN3GaMDmFtTphQYeL1TtjNgwNqiZoaGr
         00zkxnN8yVx4S2wHLWHj7XN+Uj9QxT0XqAe+Kdu7mBUfyV5mbwhDJIxvJrF/RIfhI9kL
         lvfwSUdXPygutdxXHxJ+Ti4+nbRVIR85jstcP4EC0AuSR7xnFPrsVml9Cg1G+1zOe1A5
         gXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dcFH1mLqfkbS+m9wfxW5xXDr2S6LPd38piSAyAtrcic=;
        b=v2TJlBUllegk3p9MpCqAQy+5JDLm4aSTJQ6at/RenydwrM1N+PMPf2NyEd+0/get9N
         FjgouzLwoBUYLhPsj89+QLk90qjCJhpZXgum1M49gd3/vOdabjCjvMUlgJSOVxpWpmZa
         BOO8uxDdZBbK3JB0m+ADjg2Dhwn6WDil5rFj/bFBV/8LA5vVhEtBU9ZcgVIrc2bAu8Ld
         Trj6CpPRbh1ErqecLxbPcg2l8ekdaJlStrEmVdzk9btortzL/VT4zUWsPtUP8CZe2XS0
         IB6IBncGJRQ4i/EGx4qKWv2SYAklaPShJrAauJlQlIBvo7KmhM/i8kcth8xKftgShBrM
         Sm3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5-v6si4569798qki.164.2018.07.13.01.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtUv-0005nD-R8
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:32:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQx-0002Oh-5G
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQv-0004aN-P7
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42252 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQv-0004Zr-Kc; Fri, 13 Jul 2018 04:28:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1980A8182D31;
	Fri, 13 Jul 2018 08:28:09 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63EE32026D6B;
	Fri, 13 Jul 2018 08:28:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:35 +0200
Message-Id: <1531470464-21522-8-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:09 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 07/16] hw/arm/xlnx-zynqmp: Fix crash when
 introspecting the "xlnx, zynqmp" device
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
X-TUID: RL03VWwQxxmt

QEMU currently crashes when e.g. doing something like this:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'xlnx,zynqmp'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" \
 |  aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio

Use the new object_initialize_child() and sysbus_init_child_obj()
functions to get the refernce counting of the child objects right, so
that they are properly cleaned up when the parent gets destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/xlnx-zynqmp.c | 61 ++++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 29df35f..a1365b4 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -166,64 +166,59 @@ static void xlnx_zynqmp_init(Object *obj)
     int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
 
     for (i = 0; i < num_apus; i++) {
-        object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
-                          "cortex-a53-" TYPE_ARM_CPU);
-        object_property_add_child(obj, "apu-cpu[*]", OBJECT(&s->apu_cpu[i]),
-                                  &error_abort);
+        object_initialize_child(obj, "apu-cpu[*]", &s->apu_cpu[i],
+                                sizeof(s->apu_cpu[i]),
+                                "cortex-a53-" TYPE_ARM_CPU, &error_abort);
     }
 
-    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
-    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
+                          gic_class_name());
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
-        object_initialize(&s->gem[i], sizeof(s->gem[i]), TYPE_CADENCE_GEM);
-        qdev_set_parent_bus(DEVICE(&s->gem[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gem[*]", &s->gem[i], sizeof(s->gem[i]),
+                              TYPE_CADENCE_GEM);
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
-        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADENCE_UART);
-        qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "uart[*]", &s->uart[i], sizeof(s->uart[i]),
+                              TYPE_CADENCE_UART);
     }
 
-    object_initialize(&s->sata, sizeof(s->sata), TYPE_SYSBUS_AHCI);
-    qdev_set_parent_bus(DEVICE(&s->sata), sysbus_get_default());
+    sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
+                          TYPE_SYSBUS_AHCI);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
-        object_initialize(&s->sdhci[i], sizeof(s->sdhci[i]),
-                          TYPE_SYSBUS_SDHCI);
-        qdev_set_parent_bus(DEVICE(&s->sdhci[i]),
-                            sysbus_get_default());
+        sysbus_init_child_obj(obj, "sdhci[*]", &s->sdhci[i],
+                              sizeof(s->sdhci[i]), TYPE_SYSBUS_SDHCI);
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]),
-                          TYPE_XILINX_SPIPS);
-        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
+                              TYPE_XILINX_SPIPS);
     }
 
-    object_initialize(&s->qspi, sizeof(s->qspi), TYPE_XLNX_ZYNQMP_QSPIPS);
-    qdev_set_parent_bus(DEVICE(&s->qspi), sysbus_get_default());
+    sysbus_init_child_obj(obj, "qspi", &s->qspi, sizeof(s->qspi),
+                          TYPE_XLNX_ZYNQMP_QSPIPS);
 
-    object_initialize(&s->dp, sizeof(s->dp), TYPE_XLNX_DP);
-    qdev_set_parent_bus(DEVICE(&s->dp), sysbus_get_default());
+    sysbus_init_child_obj(obj, "xxxdp", &s->dp, sizeof(s->dp), TYPE_XLNX_DP);
 
-    object_initialize(&s->dpdma, sizeof(s->dpdma), TYPE_XLNX_DPDMA);
-    qdev_set_parent_bus(DEVICE(&s->dpdma), sysbus_get_default());
+    sysbus_init_child_obj(obj, "dp-dma", &s->dpdma, sizeof(s->dpdma),
+                          TYPE_XLNX_DPDMA);
 
-    object_initialize(&s->ipi, sizeof(s->ipi), TYPE_XLNX_ZYNQMP_IPI);
-    qdev_set_parent_bus(DEVICE(&s->ipi), sysbus_get_default());
+    sysbus_init_child_obj(obj, "ipi", &s->ipi, sizeof(s->ipi),
+                          TYPE_XLNX_ZYNQMP_IPI);
 
-    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_XLNX_ZYNQMP_RTC);
-    qdev_set_parent_bus(DEVICE(&s->rtc), sysbus_get_default());
+    sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
+                          TYPE_XLNX_ZYNQMP_RTC);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-        object_initialize(&s->gdma[i], sizeof(s->gdma[i]), TYPE_XLNX_ZDMA);
-        qdev_set_parent_bus(DEVICE(&s->gdma[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gdma[*]", &s->gdma[i], sizeof(s->gdma[i]),
+                              TYPE_XLNX_ZDMA);
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
-        object_initialize(&s->adma[i], sizeof(s->adma[i]), TYPE_XLNX_ZDMA);
-        qdev_set_parent_bus(DEVICE(&s->adma[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "adma[*]", &s->adma[i], sizeof(s->adma[i]),
+                              TYPE_XLNX_ZDMA);
     }
 }
 
-- 
1.8.3.1

