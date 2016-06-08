Received: by 10.25.27.66 with SMTP id b63csp2667700lfb;
        Wed, 8 Jun 2016 11:25:11 -0700 (PDT)
X-Received: by 10.140.43.166 with SMTP id e35mr5994153qga.72.1465410311700;
        Wed, 08 Jun 2016 11:25:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w128si1381503qke.143.2016.06.08.11.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 11:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAiAB-0003rk-5J
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 14:25:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiA5-0003p8-Ky
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiA3-0008MQ-3b
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bAiA2-0008ML-Te; Wed, 08 Jun 2016 14:25:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C9D04DE9C;
	Wed,  8 Jun 2016 18:25:02 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u58IOtQo006939; Wed, 8 Jun 2016 14:25:01 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  8 Jun 2016 20:24:49 +0200
Message-Id: <1465410291-2971-4-git-send-email-drjones@redhat.com>
In-Reply-To: <1465410291-2971-1-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 08 Jun 2016 18:25:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 3/5] hw/arm/virt: introduce DEFINE_VIRT_MACHINE
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3VCzAf9EY5wY

Use DEFINE_VIRT_MACHINE to generate versioned machine type info.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 09afbafde025d..9a3289d2c422c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -98,6 +98,27 @@ typedef struct {
 #define VIRT_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
 
+
+#define DEFINE_VIRT_MACHINE(major, minor) \
+    static void virt_##major##_##minor##_class_init(ObjectClass *oc, void *data) \
+    { \
+        MachineClass *mc = MACHINE_CLASS(oc); \
+        virt_machine_##major##_##minor##_options(mc); \
+        mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
+    } \
+    static const TypeInfo machvirt_##major##_##minor##_info = { \
+        .name = MACHINE_TYPE_NAME("virt-" # major "." # minor), \
+        .parent = TYPE_VIRT_MACHINE, \
+        .instance_init = virt_##major##_##minor##_instance_init, \
+        .class_init = virt_##major##_##minor##_class_init, \
+    }; \
+    static void machvirt_machine_##major##_##minor##_init(void) \
+    { \
+        type_register_static(&machvirt_##major##_##minor##_info); \
+    } \
+    type_init(machvirt_machine_##major##_##minor##_init);
+
+
 /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
  * RAM can go up to the 256GB mark, leaving 256GB of the physical
  * address space unallocated and free for future use between 256G and 512G.
@@ -1426,24 +1447,9 @@ static void virt_2_6_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
-static void virt_2_6_class_init(ObjectClass *oc, void *data)
+static void virt_machine_2_6_options(MachineClass *mc)
 {
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "QEMU 2.6 ARM Virtual Machine";
     mc->alias = "virt";
     mc->is_default = 1;
 }
-
-static const TypeInfo machvirt_2_6_info = {
-    .name = MACHINE_TYPE_NAME("virt-2.6"),
-    .parent = TYPE_VIRT_MACHINE,
-    .instance_init = virt_2_6_instance_init,
-    .class_init = virt_2_6_class_init,
-};
-
-static void machvirt_machine_2_6_init(void)
-{
-    type_register_static(&machvirt_2_6_info);
-}
-type_init(machvirt_machine_2_6_init);
+DEFINE_VIRT_MACHINE(2, 6)
-- 
2.4.11

