Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp427887wrq;
        Fri, 13 Jul 2018 01:31:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdpWiyflHaR6lyVOVyf+8Zo08T8lXMueyRw0DFgf99KtoWO5AfQXMgjvR73XGsPVx/mL72d
X-Received: by 2002:a37:6713:: with SMTP id b19-v6mr4726588qkc.63.1531470702900;
        Fri, 13 Jul 2018 01:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470702; cv=none;
        d=google.com; s=arc-20160816;
        b=NA3oVSP2WN07VamlzG1HD2rOHBYCqOITWwBH3DBh8+qkzqXpYSXX26D7R7l7oSl8ov
         /ai+rpY0X0cJnIAjxeowBAp76cGg6lLo5cFO+l42/GXVWpMQHkqnT67OM7t6dY6dPNNy
         3R3/X5aeHhtWnN8CGU+gXZ39tWDkIbzKZlqXByKZ+K5J38GJ5e8jYXDMCCX8P9MUBgYA
         ZzYV1R1xlxMiAUuhxMmllWsfJf8b3CRijcXUggL2MBkMsjyTo2ZD2l03dUceHGKdjdOr
         F3S/DWqIspN9T1mjt5hzM33pToiwqr05ycTe/k82BcHuYMi9+DW6I90dr6YN//p0vDl6
         QKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=viwudt74t6OEllrU8xRt9UQ2Midukvlr6H7TOq2r4kM=;
        b=PVimftaJS6/x9FjLo5KQHNLHd4yUaj/P/XGJ3NJO6ergifG5pfICl4pOHo3FpgYkgH
         6kWEWlubRNDMWjci8dn96H0yJjonlXETo7rvtX2g9ZJtht8LvxHNy/g/aQT8gnPQBqi8
         O4mnWwyc61JmwHSG5gJoTBElBo6B12eYRIw/J01HzOg99YCHurXYaaTcL0EKHzzobULr
         fFOSFhvi+6hSqoP3TaxQ0tACmSdGWrPJeyhUIP7/eRn2sFmqv98e/d0IF+OotqRHOzsS
         ypKTFZL2EBD1LzLlqvjAiKhSSOG6rjK50fYBQEZh5p1Po859AhYVjiphiXAwIbRkroHk
         eKTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f81-v6si5698146qkb.305.2018.07.13.01.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtUM-0005PZ-9z
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQo-0002Fs-6I
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQm-0004MP-MR
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58134 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQm-0004M2-GI; Fri, 13 Jul 2018 04:28:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 194E47264C;
	Fri, 13 Jul 2018 08:28:00 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60F912026D6B;
	Fri, 13 Jul 2018 08:27:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:32 +0200
Message-Id: <1531470464-21522-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:28:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:28:00 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 04/16] hw/arm/armv7: Fix crash when
 introspecting the "iotkit" device
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
X-TUID: U13T2CE2O6so

QEMU currently crashes when introspecting the "iotkit" device and
runnint "info qtree" afterwards, e.g. when running QEMU like this:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'iotkit'}}" "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio

Use the new functions object_initialize_child() and sysbus_init_child_obj()
to make sure that all objects get cleaned up correctly when the instances
are destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/armv7m.c       |  7 +++--
 hw/arm/iotkit.c       | 74 ++++++++++++++++++++++-----------------------------
 hw/intc/armv7m_nvic.c |  5 ++--
 3 files changed, 37 insertions(+), 49 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 9e00d40..6b07666 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -134,14 +134,13 @@ static void armv7m_instance_init(Object *obj)
 
     memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
 
-    object_initialize(&s->nvic, sizeof(s->nvic), TYPE_NVIC);
-    qdev_set_parent_bus(DEVICE(&s->nvic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "nvnic", &s->nvic, sizeof(s->nvic), TYPE_NVIC);
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq", &error_abort);
 
     for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
-        object_initialize(&s->bitband[i], sizeof(s->bitband[i]), TYPE_BITBAND);
-        qdev_set_parent_bus(DEVICE(&s->bitband[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "bitband[*]", &s->bitband[i],
+                              sizeof(s->bitband[i]), TYPE_BITBAND);
     }
 }
 
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 133d5bb..d758385 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -30,15 +30,6 @@ static void make_alias(IoTKit *s, MemoryRegion *mr, const char *name,
     memory_region_add_subregion_overlap(&s->container, base, mr, -1500);
 }
 
-static void init_sysbus_child(Object *parent, const char *childname,
-                              void *child, size_t childsize,
-                              const char *childtype)
-{
-    object_initialize(child, childsize, childtype);
-    object_property_add_child(parent, childname, OBJECT(child), &error_abort);
-    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
-}
-
 static void irq_status_forwarder(void *opaque, int n, int level)
 {
     qemu_irq destirq = opaque;
@@ -119,53 +110,52 @@ static void iotkit_init(Object *obj)
 
     memory_region_init(&s->container, obj, "iotkit-container", UINT64_MAX);
 
-    init_sysbus_child(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
-                      TYPE_ARMV7M);
+    sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
+                          TYPE_ARMV7M);
     qdev_prop_set_string(DEVICE(&s->armv7m), "cpu-type",
                          ARM_CPU_TYPE_NAME("cortex-m33"));
 
-    init_sysbus_child(obj, "secctl", &s->secctl, sizeof(s->secctl),
-                      TYPE_IOTKIT_SECCTL);
-    init_sysbus_child(obj, "apb-ppc0", &s->apb_ppc0, sizeof(s->apb_ppc0),
-                      TYPE_TZ_PPC);
-    init_sysbus_child(obj, "apb-ppc1", &s->apb_ppc1, sizeof(s->apb_ppc1),
-                      TYPE_TZ_PPC);
-    init_sysbus_child(obj, "mpc", &s->mpc, sizeof(s->mpc), TYPE_TZ_MPC);
-    object_initialize(&s->mpc_irq_orgate, sizeof(s->mpc_irq_orgate),
-                      TYPE_OR_IRQ);
-    object_property_add_child(obj, "mpc-irq-orgate",
-                              OBJECT(&s->mpc_irq_orgate), &error_abort);
+    sysbus_init_child_obj(obj, "secctl", &s->secctl, sizeof(s->secctl),
+                          TYPE_IOTKIT_SECCTL);
+    sysbus_init_child_obj(obj, "apb-ppc0", &s->apb_ppc0, sizeof(s->apb_ppc0),
+                          TYPE_TZ_PPC);
+    sysbus_init_child_obj(obj, "apb-ppc1", &s->apb_ppc1, sizeof(s->apb_ppc1),
+                          TYPE_TZ_PPC);
+    sysbus_init_child_obj(obj, "mpc", &s->mpc, sizeof(s->mpc), TYPE_TZ_MPC);
+    object_initialize_child(obj, "mpc-irq-orgate", &s->mpc_irq_orgate,
+                            sizeof(s->mpc_irq_orgate), TYPE_OR_IRQ,
+                            &error_abort);
+
     for (i = 0; i < ARRAY_SIZE(s->mpc_irq_splitter); i++) {
         char *name = g_strdup_printf("mpc-irq-splitter-%d", i);
         SplitIRQ *splitter = &s->mpc_irq_splitter[i];
 
-        object_initialize(splitter, sizeof(*splitter), TYPE_SPLIT_IRQ);
-        object_property_add_child(obj, name, OBJECT(splitter), &error_abort);
+        object_initialize_child(obj, name, splitter, sizeof(*splitter),
+                                TYPE_SPLIT_IRQ, &error_abort);
         g_free(name);
     }
-    init_sysbus_child(obj, "timer0", &s->timer0, sizeof(s->timer0),
-                      TYPE_CMSDK_APB_TIMER);
-    init_sysbus_child(obj, "timer1", &s->timer1, sizeof(s->timer1),
-                      TYPE_CMSDK_APB_TIMER);
-    init_sysbus_child(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
-                      TYPE_UNIMPLEMENTED_DEVICE);
-    object_initialize(&s->ppc_irq_orgate, sizeof(s->ppc_irq_orgate),
-                      TYPE_OR_IRQ);
-    object_property_add_child(obj, "ppc-irq-orgate",
-                              OBJECT(&s->ppc_irq_orgate), &error_abort);
-    object_initialize(&s->sec_resp_splitter, sizeof(s->sec_resp_splitter),
-                      TYPE_SPLIT_IRQ);
-    object_property_add_child(obj, "sec-resp-splitter",
-                              OBJECT(&s->sec_resp_splitter), &error_abort);
+    sysbus_init_child_obj(obj, "timer0", &s->timer0, sizeof(s->timer0),
+                          TYPE_CMSDK_APB_TIMER);
+    sysbus_init_child_obj(obj, "timer1", &s->timer1, sizeof(s->timer1),
+                          TYPE_CMSDK_APB_TIMER);
+    sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
+                          TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
+                            sizeof(s->ppc_irq_orgate), TYPE_OR_IRQ,
+                            &error_abort);
+    object_initialize_child(obj, "sec-resp-splitter", &s->sec_resp_splitter,
+                            sizeof(s->sec_resp_splitter), TYPE_SPLIT_IRQ,
+                            &error_abort);
     for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
         char *name = g_strdup_printf("ppc-irq-splitter-%d", i);
         SplitIRQ *splitter = &s->ppc_irq_splitter[i];
 
-        object_initialize(splitter, sizeof(*splitter), TYPE_SPLIT_IRQ);
-        object_property_add_child(obj, name, OBJECT(splitter), &error_abort);
+        object_initialize_child(obj, name, splitter, sizeof(*splitter),
+                                TYPE_SPLIT_IRQ, &error_abort);
+        g_free(name);
     }
-    init_sysbus_child(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
-                      TYPE_UNIMPLEMENTED_DEVICE);
+    sysbus_init_child_obj(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
+                          TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void iotkit_exp_irq(void *opaque, int n, int level)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 661be88..7a5330f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2296,9 +2296,8 @@ static void armv7m_nvic_instance_init(Object *obj)
     NVICState *nvic = NVIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    object_initialize(&nvic->systick[M_REG_NS],
-                      sizeof(nvic->systick[M_REG_NS]), TYPE_SYSTICK);
-    qdev_set_parent_bus(DEVICE(&nvic->systick[M_REG_NS]), sysbus_get_default());
+    sysbus_init_child_obj(obj, "systick-reg-ns", &nvic->systick[M_REG_NS],
+                          sizeof(nvic->systick[M_REG_NS]), TYPE_SYSTICK);
     /* We can't initialize the secure systick here, as we don't know
      * yet if we need it.
      */
-- 
1.8.3.1

