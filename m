Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1485850wru;
        Mon, 16 Jul 2018 06:08:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdWhx7SgZI124s1R1IG17p2clnzm9MUHC5XXeEVUMZUSk3cJG+QBkPQ0DKwvr6BD9yx4LWs
X-Received: by 2002:a0c:b131:: with SMTP id q46-v6mr18387412qvc.168.1531746523764;
        Mon, 16 Jul 2018 06:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746523; cv=none;
        d=google.com; s=arc-20160816;
        b=bWkT0hpWMeqo+fsW5eujtCQvedb96CPW6aKDWDNLGoJ4PvynRsJZh+VTyxr9aA5x4e
         PufbWPQIDDJ8ND/47LYj6DNvsfOOMWUTcoNhAUleOsWQ5Xw4v1UWnaYz/mj9U1agpvxO
         BOZPwKfggaOJss61UI1KH2MP+25orssmNhiGjzwevM4PoAGw5yzoJV/oI5Z+y+Xm2way
         V9YfSTQYdd16ssfO8tydQj4LPjbvU3Mrij1hO5LOpeCWC6OIrpSJHLgFyGvMRvSWKTlm
         ZfxeqIr20yksMnKv7V01T1eBh3gBrsAX4J2N+Cr1QrURNN9nVsbCHbG1Px1jUrpVkbGg
         nufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=GD9v1VmvFzebNozJD02/YDBkYmfsp2X5NsgLxFx1HUM=;
        b=QfRjq1qA8e+AGqVvcwXseon1bDnnAErPtT1VpbyaQUfoa6GoC9evzU3hqVGQrSZbR0
         JDQmiSOoohcaeVicq9R5NuixK6hERJecH78ljUmdSELytIrKnkfBa9vRKT31XMSF6erl
         F2+h49KrLyCV3xJE2rUTyoXIDKJLdFOd34zVoWUs4LILKiZHTiy16R829zQ91nkqro2t
         x5gkfhDkrgk0pxslIS/4iyqIw8kAAGiOqCcKUkUX4aNVWfpQkkeUGiY6ZmGV11FVRj6l
         AQtGbjxLUSYpF2TniPn+lvpxpv4k1ZLYMPu8HVxis0reK247vqCrMjEtDogNObN8Q++a
         2Hgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d39-v6si10096958qkh.36.2018.07.16.06.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3F5-0007ne-2q
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:08:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36r-0001Z5-Ng
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36q-0002Qh-H2
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35462 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36q-0002QU-BX; Mon, 16 Jul 2018 09:00:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5CE67A7E8;
	Mon, 16 Jul 2018 13:00:11 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1175D1C589;
	Mon, 16 Jul 2018 13:00:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:34 +0200
Message-Id: <1531745974-17187-18-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:11 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 17/17] hw/arm/xlnx-zynqmp: Fix crash when
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
X-TUID: oKxv9/IYGwSB

QEMU currently crashes when e.g. doing something like this:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'xlnx,zynqmp'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" \
 |  aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio

Use the new object_initialize_child() and sysbus_init_child_obj()
functions to get the refernce counting of the child objects right, so
that they are properly cleaned up when the parent gets destroyed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/xlnx-zynqmp.c | 61 ++++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 29df35f..8de4868 100644
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
+                                "cortex-a53-" TYPE_ARM_CPU, &error_abort, NULL);
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

