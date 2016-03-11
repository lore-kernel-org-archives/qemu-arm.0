Received: by 10.25.208.211 with SMTP id h202csp1146963lfg;
        Fri, 11 Mar 2016 09:36:33 -0800 (PST)
X-Received: by 10.140.156.138 with SMTP id c132mr14191150qhc.96.1457717791814;
        Fri, 11 Mar 2016 09:36:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si9439099qgi.88.2016.03.11.09.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 09:36:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeQzH-0000HQ-45
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 12:36:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aeQzB-0000D6-J9
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 12:36:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aeQz7-00079Y-6p
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 12:36:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aeQz7-00079K-1Q; Fri, 11 Mar 2016 12:36:21 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A818019D243;
	Fri, 11 Mar 2016 17:36:20 +0000 (UTC)
Received: from apm-mustang-ev3-05.lab.eng.rdu.redhat.com
	(apm-mustang-ev3-05.lab.eng.rdu.redhat.com [10.12.0.116])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2BHaJIi014136; Fri, 11 Mar 2016 12:36:20 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Mar 2016 12:36:18 -0500
Message-Id: <1457717778-17727-3-git-send-email-wei@redhat.com>
In-Reply-To: <1457717778-17727-1-git-send-email-wei@redhat.com>
References: <1457717778-17727-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	abologna@redhat.com, wei@redaht.com
Subject: [Qemu-arm] [PATCH V1 2/2] arm: virt: Move machine class init code
	to the abstract machine type
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
X-TUID: QGPcckcn3BtF

This patch moves the common class initialization code from
"virt-2.6" to the new abstract class. An empty property is added to
"virt-2.6" machine. In the meanwhile, related funtions are renamed
to "virt_2_6_*" for consistency.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be9bbfb..8c3ac0d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1347,6 +1347,18 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = machvirt_init;
+    /* Start max_cpus at the maximum QEMU supports. We'll further restrict
+     * it later in machvirt_init, where we have more information about the
+     * configuration of the particular instance.
+     */
+    mc->max_cpus = MAX_CPUMASK_BITS;
+    mc->has_dynamic_sysbus = true;
+    mc->block_default_type = IF_VIRTIO;
+    mc->no_cdrom = 1;
+    mc->pci_allow_0_address = true;
 }
 
 static const TypeInfo virt_machine_info = {
@@ -1358,7 +1370,7 @@ static const TypeInfo virt_machine_info = {
     .class_init    = virt_machine_class_init,
 };
 
-static void virt_instance_init(Object *obj)
+static void virt_2_6_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
@@ -1391,29 +1403,23 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
-static void virt_class_init(ObjectClass *oc, void *data)
+static void virt_2_6_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    static GlobalProperty compat_props[] = {
+        { /* end of list */ }
+    };
 
     mc->desc = "QEMU 2.6 ARM Virtual Machine";
     mc->alias = "virt";
-    mc->init = machvirt_init;
-    /* Start max_cpus at the maximum QEMU supports. We'll further restrict
-     * it later in machvirt_init, where we have more information about the
-     * configuration of the particular instance.
-     */
-    mc->max_cpus = MAX_CPUMASK_BITS;
-    mc->has_dynamic_sysbus = true;
-    mc->block_default_type = IF_VIRTIO;
-    mc->no_cdrom = 1;
-    mc->pci_allow_0_address = true;
+    mc->compat_props = compat_props;
 }
 
 static const TypeInfo machvirt_info = {
     .name = MACHINE_TYPE_NAME("virt-2.6"),
     .parent = TYPE_VIRT_MACHINE,
-    .instance_init = virt_instance_init,
-    .class_init = virt_class_init,
+    .instance_init = virt_2_6_instance_init,
+    .class_init = virt_2_6_class_init,
 };
 
 static void machvirt_machine_init(void)
-- 
1.8.3.1

