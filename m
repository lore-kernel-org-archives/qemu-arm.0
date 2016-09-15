Received: by 10.80.163.71 with SMTP id 65csp1748295edn;
        Wed, 14 Sep 2016 22:04:43 -0700 (PDT)
X-Received: by 10.55.159.77 with SMTP id i74mr7322902qke.60.1473915883370;
        Wed, 14 Sep 2016 22:04:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y43si1846713qtb.31.2016.09.14.22.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Sep 2016 22:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bkOqo-00035W-RJ
	for alex.bennee@linaro.org; Thu, 15 Sep 2016 01:04:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bkOqZ-0002si-6j
	for qemu-arm@nongnu.org; Thu, 15 Sep 2016 01:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bkOqU-0002xD-1U
	for qemu-arm@nongnu.org; Thu, 15 Sep 2016 01:04:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bkOqT-0002wI-SP; Thu, 15 Sep 2016 01:04:21 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20E289D0F5;
	Thu, 15 Sep 2016 05:04:21 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8F54Ij6030796; Thu, 15 Sep 2016 01:04:20 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu, 15 Sep 2016 01:04:16 -0400
Message-Id: <1473915856-23801-3-git-send-email-wei@redhat.com>
In-Reply-To: <1473915856-23801-1-git-send-email-wei@redhat.com>
References: <1473915856-23801-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 15 Sep 2016 05:04:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V3 2/2] arm: virt: add PMU property to mach-virt
 machine type
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FvQlP6vfJJlM

CPU vPMU is now turned off by default, but it was ON in virt-2.7
machine type. To solve this problem, this patch adds a PMU option
in machine state, which is used to control CPU's vPMU status. This
PMU option is not exposed to command line and is turned on in
virt-2.7 machine type to make sure it is backward compatible.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a781ad0..a3fc454 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -84,6 +84,7 @@ typedef struct {
     MachineClass parent;
     VirtBoardInfo *daughterboard;
     bool disallow_affinity_adjustment;
+    bool pmu_default_on;
 } VirtMachineClass;
 
 typedef struct {
@@ -1317,6 +1318,11 @@ static void machvirt_init(MachineState *machine)
             }
         }
 
+        if (vmc->pmu_default_on) {
+            /* Property name is "pmu", defined in arm_cpu_has_pmu_property */
+            object_property_set_bool(cpuobj, true, "pmu", NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
             object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
                                     "reset-cbar", &error_abort);
@@ -1514,6 +1520,9 @@ static void virt_2_7_instance_init(Object *obj)
 
 static void virt_machine_2_7_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    vmc->pmu_default_on = true;
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
 
@@ -1532,5 +1541,9 @@ static void virt_machine_2_6_options(MachineClass *mc)
     virt_machine_2_7_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
     vmc->disallow_affinity_adjustment = true;
+    /* Disable PMU for 2.6 and down as PMU support was first introduced
+     * and enabled in 2.7.
+     */
+    vmc->pmu_default_on = false;
 }
 DEFINE_VIRT_MACHINE(2, 6)
-- 
1.8.3.1

