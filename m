Received: by 10.25.0.147 with SMTP id 141csp493226lfa;
        Tue, 21 Feb 2017 05:16:51 -0800 (PST)
X-Received: by 10.55.142.7 with SMTP id q7mr27119388qkd.104.1487683011602;
        Tue, 21 Feb 2017 05:16:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si2602076qtc.42.2017.02.21.05.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:16:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgAJG-0004fM-RS
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:16:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cg9or-0000VW-GC
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 07:45:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cg9oo-00030l-Bo
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 07:45:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56412)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cg9oo-00030B-3D; Tue, 21 Feb 2017 07:45:22 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9239481F07;
	Tue, 21 Feb 2017 12:45:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LCjIJb018001; Tue, 21 Feb 2017 07:45:18 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 21 Feb 2017 13:45:08 +0100
Message-Id: <1487681108-14452-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 21 Feb 2017 12:45:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3] hw/arm/virt: Add a user option to disallow
 ITS instantiation
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lvsQNvtph2Qd

In 2.9 ITS will block save/restore and migration use cases. As such,
let's introduce a user option that allows to turn its instantiation
off, along with GICv3. With the "its" option turned false, migration
will be possible, obviously at the expense of MSI support (with GICv3).

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- replace no-its by its. Don't check both state and class field
  as suggested by Peter.

v1 -> v2:
- fix omitted comma in object_property_set_description

With this patch the option also is added in virt 2.8. I don't know
if it is acceptable.
---
 hw/arm/virt.c         | 31 +++++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f3440f2..ceb2b8e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -535,7 +535,6 @@ static void create_v2m(VirtMachineState *vms, qemu_irq *pic)
 static void create_gic(VirtMachineState *vms, qemu_irq *pic)
 {
     /* We create a standalone GIC */
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     DeviceState *gicdev;
     SysBusDevice *gicbusdev;
     const char *gictype;
@@ -605,7 +604,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
 
     fdt_add_gic_node(vms);
 
-    if (type == 3 && !vmc->no_its) {
+    if (type == 3 && vms->its) {
         create_its(vms, gicdev);
     } else if (type == 2) {
         create_v2m(vms, pic);
@@ -1480,6 +1479,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
     vms->highmem = value;
 }
 
+static bool virt_get_its(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->its;
+}
+
+static void virt_set_its(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->its = value;
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1540,6 +1553,7 @@ type_init(machvirt_machine_init);
 static void virt_2_9_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
     /* EL3 is disabled by default on virt: this makes us consistent
      * between KVM and TCG for this board, and it also allows us to
@@ -1579,6 +1593,19 @@ static void virt_2_9_instance_init(Object *obj)
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
 
+    if (vmc->no_its) {
+        vms->its = false;
+    } else {
+        /* Default allows ITS instantiation */
+        vms->its = true;
+        object_property_add_bool(obj, "its", virt_get_its,
+                                 virt_set_its, NULL);
+        object_property_set_description(obj, "its",
+                                        "Set on/off to enable/disable "
+                                        "ITS instantiation",
+                                        NULL);
+    }
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 58ce74e..33b0ff3 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -93,6 +93,7 @@ typedef struct {
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
+    bool its;
     bool virt;
     int32_t gic_version;
     struct arm_boot_info bootinfo;
-- 
2.5.5

