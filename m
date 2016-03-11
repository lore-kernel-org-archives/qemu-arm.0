Received: by 10.25.208.211 with SMTP id h202csp1146941lfg;
        Fri, 11 Mar 2016 09:36:29 -0800 (PST)
X-Received: by 10.140.131.6 with SMTP id 6mr2968126qhd.67.1457717789897;
        Fri, 11 Mar 2016 09:36:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si9456382qkb.57.2016.03.11.09.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 09:36:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeQzF-0000Fk-Cq
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 12:36:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aeQzB-0000D7-J7
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 12:36:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aeQz6-000790-MJ
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 12:36:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aeQz6-00078n-H5; Fri, 11 Mar 2016 12:36:20 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 290DB1B282E;
	Fri, 11 Mar 2016 17:36:20 +0000 (UTC)
Received: from apm-mustang-ev3-05.lab.eng.rdu.redhat.com
	(apm-mustang-ev3-05.lab.eng.rdu.redhat.com [10.12.0.116])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2BHaJIh014136; Fri, 11 Mar 2016 12:36:19 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Mar 2016 12:36:17 -0500
Message-Id: <1457717778-17727-2-git-send-email-wei@redhat.com>
In-Reply-To: <1457717778-17727-1-git-send-email-wei@redhat.com>
References: <1457717778-17727-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	abologna@redhat.com, wei@redaht.com
Subject: [Qemu-arm] [PATCH V1 1/2] arm: virt: Add an abstract ARM virt
	machine type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x4GvO+3lfMIB

In preparation for future ARM virt machine types, this patch creates
an abstract type for all ARM machines. The current machine type in
QEMU (i.e. "virt") is renamed to "virt-2.6", whose naming scheme is
similar to other architectures. For the purpose of backward compatibility,
"virt" is converted to an alias, pointing to "virt-2.6". With this patch,
"qemu -M ?" lists the following virtual machine types along with others:

virt                 QEMU 2.6 ARM Virtual Machine (alias of virt-2.6)
virt-2.6             QEMU 2.6 ARM Virtual Machine

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8c6c996..be9bbfb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1345,6 +1345,19 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static void virt_machine_class_init(ObjectClass *oc, void *data)
+{
+}
+
+static const TypeInfo virt_machine_info = {
+    .name          = TYPE_VIRT_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .abstract      = true,
+    .instance_size = sizeof(VirtMachineState),
+    .class_size    = sizeof(VirtMachineClass),
+    .class_init    = virt_machine_class_init,
+};
+
 static void virt_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1382,7 +1395,8 @@ static void virt_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "ARM Virtual Machine",
+    mc->desc = "QEMU 2.6 ARM Virtual Machine";
+    mc->alias = "virt";
     mc->init = machvirt_init;
     /* Start max_cpus at the maximum QEMU supports. We'll further restrict
      * it later in machvirt_init, where we have more information about the
@@ -1396,16 +1410,15 @@ static void virt_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo machvirt_info = {
-    .name = TYPE_VIRT_MACHINE,
-    .parent = TYPE_MACHINE,
-    .instance_size = sizeof(VirtMachineState),
+    .name = MACHINE_TYPE_NAME("virt-2.6"),
+    .parent = TYPE_VIRT_MACHINE,
     .instance_init = virt_instance_init,
-    .class_size = sizeof(VirtMachineClass),
     .class_init = virt_class_init,
 };
 
 static void machvirt_machine_init(void)
 {
+    type_register_static(&virt_machine_info);
     type_register_static(&machvirt_info);
 }
 
-- 
1.8.3.1

