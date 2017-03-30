Received: by 10.25.15.230 with SMTP id 99csp2721259lfp;
        Thu, 30 Mar 2017 12:42:58 -0700 (PDT)
X-Received: by 10.200.34.77 with SMTP id p13mr1563234qtp.22.1490902978629;
        Thu, 30 Mar 2017 12:42:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p85si2681141qke.8.2017.03.30.12.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Mar 2017 12:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctfyE-0003QL-3u
	for alex.bennee@linaro.org; Thu, 30 Mar 2017 15:42:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfy8-0003O8-Ey
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfy7-0007I3-A3
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ctfy7-0007Hv-0z; Thu, 30 Mar 2017 15:42:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D49E480493;
	Thu, 30 Mar 2017 19:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D49E480493
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D49E480493
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1DF577D53;
	Thu, 30 Mar 2017 19:42:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	prem.mallappa@gmail.com
Date: Thu, 30 Mar 2017 21:42:18 +0200
Message-Id: <1490902938-9009-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
References: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 30 Mar 2017 19:42:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 5/5] hw/arm/virt: Add 2.10 machine type
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
Cc: drjones@redhat.com, Radha.Chintakuntla@cavium.com,
	christoffer.dall@linaro.org, Sunil.Goutham@cavium.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9X7YmhKc4Wkc

The new machine type allows smmuv3 instantiation. A new option
is introduced to turn the feature on/off (off by default).

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Another alternative would be to use the -device option as
done on x86. As the smmu is a sysbus device, we would need to
use the platform bus framework. This would work fine
for the dt generation. However the feasibility needs to be
studied for ACPI table generation.

a Veuillez saisir le message de validation pour vos modifications. Les lignes
---
 hw/arm/virt.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 include/hw/compat.h   |  3 +++
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c00efb2..71ea707 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1496,6 +1496,20 @@ static void machvirt_init(MachineState *machine)
     create_platform_bus(vms, pic);
 }
 
+static bool virt_get_smmu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->smmu;
+}
+
+static void virt_set_smmu(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->smmu = value;
+}
+
 static bool virt_get_secure(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1609,7 +1623,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_9_instance_init(Object *obj)
+static void virt_2_10_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1665,14 +1679,47 @@ static void virt_2_9_instance_init(Object *obj)
                                         NULL);
     }
 
+    if (vmc->no_smmu) {
+        vms->smmu = false;
+    } else {
+        /* Default disallows smmu instantiation */
+        vms->smmu = false;
+        object_property_add_bool(obj, "smmu", virt_get_smmu,
+                                 virt_set_smmu, NULL);
+        object_property_set_description(obj, "smmu",
+                                        "Set on/off to enable/disable "
+                                        "smmu instantiation (default off)",
+                                        NULL);
+    }
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_2_10_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 10)
+
+#define VIRT_COMPAT_2_9 \
+    HW_COMPAT_2_9
+
+static void virt_2_9_instance_init(Object *obj)
+{
+    virt_2_10_instance_init(obj);
+}
+
 static void virt_machine_2_9_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_2_10_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
+
+    vmc->no_smmu = true;
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
+DEFINE_VIRT_MACHINE(2, 9)
+
 
 #define VIRT_COMPAT_2_8 \
     HW_COMPAT_2_8
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 164a531..cd2c82e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -86,6 +86,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_smmu;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
diff --git a/include/hw/compat.h b/include/hw/compat.h
index 5d5be91..846b90e 100644
--- a/include/hw/compat.h
+++ b/include/hw/compat.h
@@ -1,6 +1,9 @@
 #ifndef HW_COMPAT_H
 #define HW_COMPAT_H
 
+#define HW_COMPAT_2_9 \
+    /* empty */
+
 #define HW_COMPAT_2_8 \
     {\
         .driver   = "fw_cfg_mem",\
-- 
2.5.5

