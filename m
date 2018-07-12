Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1508577wrq;
        Thu, 12 Jul 2018 08:35:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcDqYAf3ijn+xrZZzifNj/CVDAqaaNNkl1/NVHaTsVFo/0R34B47ZrzMsxQAeNMizmvHUX1
X-Received: by 2002:a37:188c:: with SMTP id 12-v6mr2235447qky.72.1531409709007;
        Thu, 12 Jul 2018 08:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531409709; cv=none;
        d=google.com; s=arc-20160816;
        b=JOO2qEi0aAvSLAEve5EjroU5nVhRROsAnKGaAXxItfOIyW6BvxqKpMKC16BO8pEZSu
         MUAGHSz6ioJIPkvDZAQOzwM/KWO7PbaUNu0qhMcPPIHzhoiG3QImFXV76vxi8PxL5gGg
         +Bh4WgZBFH8w4yHH77jtjyrJxgTu246oF9U8+dLxa7idJPmwvwg43VWecGNofsHZcM7e
         EGu/uhGSqnFFkYJh6sCiE/Kz+VNSDThL5BvnmT9X0K+RXvyUfHlAKxStlUKlgEhvi5LS
         GdXFSFBaorXz3OxY4M/EzKwRhQIEXiVmR81gUn3jf1rvnWvAmTvBnP5ZZBNyLEQcNy+8
         bZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=O4Ia6kP6Ae8MyWm9c9uIhmGKohBCTZYs/omQPPsqMGI=;
        b=ODuAef6r/+pY26ZmNrwpU3AZuvzoH2DxVRf0m7p2Kh788ekT5jsNS2Q060vL/YQM0C
         cfmMiz0pEEjJDfrRTDecSJe1rw7+QymWDoGodGavm0Ij7w4cuLj0M/3x3QVtmDPM5J9B
         4tavuaTEKHAGhXcENTcWEYdxi+XwjaLlbm01Pg1LFAwHYVwU1SeiKkgUuuVF38cndS+i
         yytRYXDdrEiK4O/DWyXxnnWazVB9veDFBxFE7JEOvaOFt5pXRmxGZlt3i5eJMkqMSaOs
         5LkbYzffjv0k+8yUoRdWtmzbohcazeSYtG+Rhd8O0nxagL3ZnLAaauu+aLopuGxls18a
         7I8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7-v6si6223540qkm.225.2018.07.12.08.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddca-000894-GN
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:35:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYt-0005NW-Fa
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYp-0007wq-49
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52420 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fddYo-0007wH-UY; Thu, 12 Jul 2018 11:31:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EE1C70211;
	Thu, 12 Jul 2018 15:31:14 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9FC81C674;
	Thu, 12 Jul 2018 15:31:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jul 2018 17:31:02 +0200
Message-Id: <1531409463-3843-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1531409463-3843-1-git-send-email-thuth@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 15:31:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 15:31:14 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 4/5] hw/arm/armv7: Fix crash when introspecting
 the "iotkit" device
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
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UU17fPyTx0DX

QEMU currently crashes when introspecting the "iotkit" device and
runnint "info qtree" afterwards, e.g. when running QEMU like this:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'iotkit'}}" "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio

Use the new functions object_initialize_as_child() and sysbus_init_child_obj()
to make sure that all objects get cleaned up correctly when the instances
are destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/armv7m.c       |  9 ++++---
 hw/arm/iotkit.c       | 74 ++++++++++++++++++++++-----------------------------
 hw/intc/armv7m_nvic.c |  5 ++--
 3 files changed, 39 insertions(+), 49 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 9e00d40..7164e04 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -134,14 +134,15 @@ static void armv7m_instance_init(Object *obj)
 
     memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
 
-    object_initialize(&s->nvic, sizeof(s->nvic), TYPE_NVIC);
-    qdev_set_parent_bus(DEVICE(&s->nvic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "nvnic", &s->nvic, sizeof(s->nvic), TYPE_NVIC);
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq", &error_abort);
 
     for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
-        object_initialize(&s->bitband[i], sizeof(s->bitband[i]), TYPE_BITBAND);
-        qdev_set_parent_bus(DEVICE(&s->bitband[i]), sysbus_get_default());
+        char *name = g_strdup_printf("bitband-%d", i);
+        sysbus_init_child_obj(obj, name, &s->bitband[i], sizeof(s->bitband[i]),
+                              TYPE_BITBAND);
+        g_free(name);
     }
 }
 
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 133d5bb..d479323 100644
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
+    object_initialize_as_child(obj, "mpc-irq-orgate", &s->mpc_irq_orgate,
+                               sizeof(s->mpc_irq_orgate), TYPE_OR_IRQ,
+                               &error_abort);
+
     for (i = 0; i < ARRAY_SIZE(s->mpc_irq_splitter); i++) {
         char *name = g_strdup_printf("mpc-irq-splitter-%d", i);
         SplitIRQ *splitter = &s->mpc_irq_splitter[i];
 
-        object_initialize(splitter, sizeof(*splitter), TYPE_SPLIT_IRQ);
-        object_property_add_child(obj, name, OBJECT(splitter), &error_abort);
+        object_initialize_as_child(obj, name, splitter, sizeof(*splitter),
+                                   TYPE_SPLIT_IRQ, &error_abort);
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
+    object_initialize_as_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
+                               sizeof(s->ppc_irq_orgate), TYPE_OR_IRQ,
+                               &error_abort);
+    object_initialize_as_child(obj, "sec-resp-splitter", &s->sec_resp_splitter,
+                               sizeof(s->sec_resp_splitter), TYPE_SPLIT_IRQ,
+                               &error_abort);
     for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
         char *name = g_strdup_printf("ppc-irq-splitter-%d", i);
         SplitIRQ *splitter = &s->ppc_irq_splitter[i];
 
-        object_initialize(splitter, sizeof(*splitter), TYPE_SPLIT_IRQ);
-        object_property_add_child(obj, name, OBJECT(splitter), &error_abort);
+        object_initialize_as_child(obj, name, splitter, sizeof(*splitter),
+                                   TYPE_SPLIT_IRQ, &error_abort);
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

