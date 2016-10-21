Received: by 10.80.166.35 with SMTP id d32csp1573845edc;
        Fri, 21 Oct 2016 14:53:18 -0700 (PDT)
X-Received: by 10.55.119.132 with SMTP id s126mr3533917qkc.38.1477086797975;
        Fri, 21 Oct 2016 14:53:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65si3285366qkh.189.2016.10.21.14.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Oct 2016 14:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxhkb-0001p0-Bk
	for alex.bennee@linaro.org; Fri, 21 Oct 2016 17:53:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bxhkU-0001o4-BE
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 17:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bxhkQ-000630-HY
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 17:53:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45580)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1bxhkQ-00062G-D9; Fri, 21 Oct 2016 17:53:06 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A7017D0E0;
	Fri, 21 Oct 2016 21:53:05 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9LLr23o017082; Fri, 21 Oct 2016 17:53:04 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Fri, 21 Oct 2016 17:53:02 -0400
Message-Id: <1477086782-10479-3-git-send-email-wei@redhat.com>
In-Reply-To: <1477086782-10479-1-git-send-email-wei@redhat.com>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 21 Oct 2016 21:53:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V7 2/2] arm: virt: add PMU property to mach-virt
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
X-TUID: HnzDYbUIA0DD

CPU vPMU is now turned ON by default, but this feature wasn't introduced
until virt-2.7 machine type. To solve this problem, this patch adds a
PMU option in machine state, which is used to control CPU's vPMU status.
This PMU option is not exposed to command line and is turned off in
virt-2.6 machine type.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 074d11c..e64dc4a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -85,6 +85,7 @@ typedef struct {
     VirtBoardInfo *daughterboard;
     bool disallow_affinity_adjustment;
     bool no_its;
+    bool no_pmu;
 } VirtMachineClass;
 
 typedef struct {
@@ -1353,6 +1354,10 @@ static void machvirt_init(MachineState *machine)
             }
         }
 
+        if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
+            object_property_set_bool(cpuobj, false, "pmu", NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
             object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
                                     "reset-cbar", &error_abort);
@@ -1588,5 +1593,7 @@ static void virt_machine_2_6_options(MachineClass *mc)
     virt_machine_2_7_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
     vmc->disallow_affinity_adjustment = true;
+    /* Disable PMU for 2.6 as PMU support was first introduced in 2.7 */
+    vmc->no_pmu = true;
 }
 DEFINE_VIRT_MACHINE(2, 6)
-- 
1.8.3.1

