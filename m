Received: by 10.25.208.211 with SMTP id h202csp1393264lfg;
        Mon, 22 Feb 2016 13:09:36 -0800 (PST)
X-Received: by 10.140.151.4 with SMTP id 4mr38285277qhx.16.1456175376068;
        Mon, 22 Feb 2016 13:09:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si31117499qhb.39.2016.02.22.13.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxja-0003h0-1W
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:09:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aXxgr-0006dc-0j
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aXxgo-0004RB-SL
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aXxgo-0004R6-NA; Mon, 22 Feb 2016 16:06:42 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 648957EBB2;
	Mon, 22 Feb 2016 21:06:42 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1ML6dUV015881; Mon, 22 Feb 2016 16:06:41 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 16:06:38 -0500
Message-Id: <1456175198-25210-3-git-send-email-wei@redhat.com>
In-Reply-To: <1456175198-25210-1-git-send-email-wei@redhat.com>
References: <1456175198-25210-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	abologna@redhat.com
Subject: [Qemu-arm] [PATCH RFC 2/2] arm: virt: Move machine class init code
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
X-TUID: xlAgqwlaZo01

This patch moves the common class initialization code from
"virt-2.5" to the new abstract class. An empty property is added to
"virt-2.5" machine. In the meanwhile, related machine funtion are
renamed to "virt_2_5_blah_blah" for consistency.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ee15301..650dfe6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1253,6 +1253,18 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
 
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
@@ -1264,7 +1276,7 @@ static const TypeInfo virt_machine_info = {
     .class_init    = virt_machine_class_init,
 };
 
-static void virt_instance_init(Object *obj)
+static void virt_2_5_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
@@ -1297,30 +1309,24 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are 2, 3 and host", NULL);
 }
 
-static void virt_class_init(ObjectClass *oc, void *data)
+static void virt_2_5_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    static GlobalProperty compat_props[] = {
+        { /* end of list */ }
+    };
 
     mc->desc = "QEMU 2.5 ARM Virtual Machine";
     mc->alias = "virt";
     mc->is_default = 1;
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
     .name = MACHINE_TYPE_NAME("virt-2.5"),
     .parent = TYPE_VIRT_MACHINE,
-    .instance_init = virt_instance_init,
-    .class_init = virt_class_init,
+    .instance_init = virt_2_5_instance_init,
+    .class_init = virt_2_5_class_init,
 };
 
 static void machvirt_machine_init(void)
-- 
1.8.3.1

