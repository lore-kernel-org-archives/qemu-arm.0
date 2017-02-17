Received: by 10.25.77.65 with SMTP id a62csp197280lfb;
        Fri, 17 Feb 2017 06:25:43 -0800 (PST)
X-Received: by 10.200.41.175 with SMTP id 44mr8251660qts.53.1487341543796;
        Fri, 17 Feb 2017 06:25:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i23si249940qte.41.2017.02.17.06.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 06:25:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cejTj-0003rZ-5Y
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 09:25:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cejTa-0003px-Mg
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 09:25:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cejTX-0008DY-EE
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 09:25:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40416)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cejTX-0008DC-5d; Fri, 17 Feb 2017 09:25:31 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E2083A7696;
	Fri, 17 Feb 2017 14:25:31 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HEPSVN020872; Fri, 17 Feb 2017 09:25:29 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 17 Feb 2017 15:25:25 +0100
Message-Id: <1487341525-5785-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 17 Feb 2017 14:25:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] hw/arm/virt: Add a user option to disallow
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
X-TUID: LmiZBwoIpYOk

In 2.9 ITS will block save/restore and migration use cases. As
such let's introduce a user option that disallows its instantiation
along with the GICv3. With no-its option turned true, migration will
be possible, obviously at the expense of MSI support (with GICv3).

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2: fix omitted coma in object_property_set_description

With this patch the option also is added in virt 2.8. I don't know
if it is acceptable.
---
 hw/arm/virt.c         | 28 +++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f3440f2..c08deb0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -605,7 +605,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
 
     fdt_add_gic_node(vms);
 
-    if (type == 3 && !vmc->no_its) {
+    if (type == 3 && !vmc->no_its && !vms->no_its) {
         create_its(vms, gicdev);
     } else if (type == 2) {
         create_v2m(vms, pic);
@@ -1480,6 +1480,21 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
     vms->highmem = value;
 }
 
+static bool virt_get_no_its(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->no_its;
+}
+
+static void virt_set_no_its(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->no_its = value;
+}
+
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1540,6 +1555,7 @@ type_init(machvirt_machine_init);
 static void virt_2_9_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
     /* EL3 is disabled by default on virt: this makes us consistent
      * between KVM and TCG for this board, and it also allows us to
@@ -1579,6 +1595,16 @@ static void virt_2_9_instance_init(Object *obj)
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
 
+    /* Default allows ITS instantiation */
+    if (!vmc->no_its) {
+        object_property_add_bool(obj, "no-its", virt_get_no_its,
+                                 virt_set_no_its, NULL);
+        vms->no_its = false;
+        object_property_set_description(obj, "no-its",
+                                        "Disallow the ITS instantiation",
+                                        NULL);
+    }
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 58ce74e..5e73be9 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -93,6 +93,7 @@ typedef struct {
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
+    bool no_its;
     bool virt;
     int32_t gic_version;
     struct arm_boot_info bootinfo;
-- 
2.5.5

