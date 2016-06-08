Received: by 10.25.27.66 with SMTP id b63csp2667710lfb;
        Wed, 8 Jun 2016 11:25:13 -0700 (PDT)
X-Received: by 10.140.177.1 with SMTP id x1mr6109477qhx.39.1465410313167;
        Wed, 08 Jun 2016 11:25:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6si1381658qtb.91.2016.06.08.11.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 11:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAiAC-0003tK-It
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 14:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiA6-0003pD-Jf
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiA4-0008Me-Bk
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bAiA4-0008MX-5i; Wed, 08 Jun 2016 14:25:04 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C684AA78D;
	Wed,  8 Jun 2016 18:25:03 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u58IOtQp006939; Wed, 8 Jun 2016 14:25:02 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  8 Jun 2016 20:24:50 +0200
Message-Id: <1465410291-2971-5-git-send-email-drjones@redhat.com>
In-Reply-To: <1465410291-2971-1-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 08 Jun 2016 18:25:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 4/5] hw/arm/virt: introduce
 DEFINE_VIRT_MACHINE_AS_LATEST
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
X-TUID: bvccdchEKpZU

Create two variants of DEFINE_VIRT_MACHINE. One, just called
DEFINE_VIRT_MACHINE, that does not set properties that only
the latest machine type should have, and another that does.
This will hopefully reduce potential for errors when adding
new versions.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a3289d2c422c..017c244a46f41 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -99,12 +99,16 @@ typedef struct {
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
 
 
-#define DEFINE_VIRT_MACHINE(major, minor) \
+#define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
         virt_machine_##major##_##minor##_options(mc); \
         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
+        if (latest) { \
+            mc->alias = "virt"; \
+            mc->is_default = 1; \
+        } \
     } \
     static const TypeInfo machvirt_##major##_##minor##_info = { \
         .name = MACHINE_TYPE_NAME("virt-" # major "." # minor), \
@@ -118,6 +122,11 @@ typedef struct {
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+#define DEFINE_VIRT_MACHINE_AS_LATEST(major, minor) \
+    DEFINE_VIRT_MACHINE_LATEST(major, minor, true)
+#define DEFINE_VIRT_MACHINE(major, minor) \
+    DEFINE_VIRT_MACHINE_LATEST(major, minor, false)
+
 
 /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
  * RAM can go up to the 256GB mark, leaving 256GB of the physical
@@ -1449,7 +1458,5 @@ static void virt_2_6_instance_init(Object *obj)
 
 static void virt_machine_2_6_options(MachineClass *mc)
 {
-    mc->alias = "virt";
-    mc->is_default = 1;
 }
-DEFINE_VIRT_MACHINE(2, 6)
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 6)
-- 
2.4.11

