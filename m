Received: by 10.80.163.71 with SMTP id 65csp1383369edn;
        Tue, 13 Sep 2016 23:09:16 -0700 (PDT)
X-Received: by 10.55.25.206 with SMTP id 75mr852901qkz.243.1473833356205;
        Tue, 13 Sep 2016 23:09:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b34si2035724qtb.136.2016.09.13.23.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Sep 2016 23:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bk3Nj-0001M1-O4
	for alex.bennee@linaro.org; Wed, 14 Sep 2016 02:09:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bk3Nf-0001L5-2t
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 02:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bk3Nb-0006Uq-So
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 02:09:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bk3Nb-0006Uh-N1; Wed, 14 Sep 2016 02:09:07 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60A8710570;
	Wed, 14 Sep 2016 06:09:07 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8E694T0002896; Wed, 14 Sep 2016 02:09:06 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Wed, 14 Sep 2016 02:09:03 -0400
Message-Id: <1473833343-31531-3-git-send-email-wei@redhat.com>
In-Reply-To: <1473833343-31531-1-git-send-email-wei@redhat.com>
References: <1473833343-31531-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 14 Sep 2016 06:09:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V2 2/2] arm: virt: add PMU property to machvirt
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
X-TUID: Pvyfappk2LWy

CPU vPMU is now turned off by default, but it was ON in virt-2.7
machine type. To solve this problem, this patch adds a PMU option
in machine state, which is used to control CPU's vPMU status. This
PMU option is not exposed to command line and is turned on in
virt-2.7 machine type to make sure it is backward compatible.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a781ad0..83cfea7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -91,6 +91,7 @@ typedef struct {
     bool secure;
     bool highmem;
     int32_t gic_version;
+    bool pmu;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
@@ -1317,6 +1318,11 @@ static void machvirt_init(MachineState *machine)
             }
         }
 
+        if (vms->pmu) {
+            /* Note: the property name is "pmu", not "has_pmu" */
+            object_property_set_bool(cpuobj, true, "pmu", NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
             object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
                                     "reset-cbar", &error_abort);
@@ -1510,6 +1516,8 @@ static void virt_2_7_instance_init(Object *obj)
     object_property_set_description(obj, "gic-version",
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
+    /* Default PMU is on for 2.7 */
+    vms->pmu = true;
 }
 
 static void virt_machine_2_7_options(MachineClass *mc)
@@ -1522,7 +1530,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
 
 static void virt_2_6_instance_init(Object *obj)
 {
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
     virt_2_7_instance_init(obj);
+    /* Default PMU is off for 2.6 */
+    vms->pmu = false;
 }
 
 static void virt_machine_2_6_options(MachineClass *mc)
-- 
1.8.3.1

