Received: by 10.25.208.211 with SMTP id h202csp1392473lfg;
        Mon, 22 Feb 2016 13:07:41 -0800 (PST)
X-Received: by 10.140.227.9 with SMTP id x9mr39487445qhb.46.1456175260867;
        Mon, 22 Feb 2016 13:07:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j106si20276317qge.40.2016.02.22.13.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:07:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxhj-00080C-Vq
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:07:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aXxgs-0006hL-SJ
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aXxgr-0004SH-WB
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aXxgn-0004QX-Ry; Mon, 22 Feb 2016 16:06:41 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 8DD0313A523;
	Mon, 22 Feb 2016 21:06:41 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1ML6dUU015881; Mon, 22 Feb 2016 16:06:40 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 16:06:37 -0500
Message-Id: <1456175198-25210-2-git-send-email-wei@redhat.com>
In-Reply-To: <1456175198-25210-1-git-send-email-wei@redhat.com>
References: <1456175198-25210-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 22 Feb 2016 21:06:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	qemu-arm@nongnu.org, abologna@redhat.com
Subject: [Qemu-devel] [PATCH RFC 1/2] arm: virt: Add an abstract ARM virt
	machine type
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nJJD9QZ87bMc

In preparation for future ARM virt machine types, this patch creates
an abstract type for all ARM machines. The current machine type in
QEMU (i.e. "virt") is renamed to "virt-2.5", which is similar to other
architectures. For the purpose of backward compatibility, "virt" is
converted to an alias, pointing to "virt-2.5". With this patch,
"qemu -M ?" lists the following virtual machine types:

virt                 QEMU 2.5 ARM Virtual Machine (alias of virt-2.5)
virt-2.5             QEMU 2.5 ARM Virtual Machine

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 44bbbea..ee15301 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1251,6 +1251,19 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
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
@@ -1288,7 +1301,9 @@ static void virt_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "ARM Virtual Machine",
+    mc->desc = "QEMU 2.5 ARM Virtual Machine";
+    mc->alias = "virt";
+    mc->is_default = 1;
     mc->init = machvirt_init;
     /* Start max_cpus at the maximum QEMU supports. We'll further restrict
      * it later in machvirt_init, where we have more information about the
@@ -1302,16 +1317,15 @@ static void virt_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo machvirt_info = {
-    .name = TYPE_VIRT_MACHINE,
-    .parent = TYPE_MACHINE,
-    .instance_size = sizeof(VirtMachineState),
+    .name = MACHINE_TYPE_NAME("virt-2.5"),
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

