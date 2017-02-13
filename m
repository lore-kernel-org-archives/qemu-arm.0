Received: by 10.25.77.65 with SMTP id a62csp895934lfb;
        Mon, 13 Feb 2017 06:40:09 -0800 (PST)
X-Received: by 10.55.16.149 with SMTP id 21mr3082504qkq.245.1486996808950;
        Mon, 13 Feb 2017 06:40:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 74si549322qky.258.2017.02.13.06.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 06:40:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdHnS-0001tz-3p
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 09:40:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcI-0008Gc-1V
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcG-0005HF-W2
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:34 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cdHcG-0005C4-Oe; Mon, 13 Feb 2017 09:28:32 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cdHc6-00015A-Do; Mon, 13 Feb 2017 14:28:22 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Feb 2017 14:28:19 +0000
Message-Id: <1486996099-15820-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/4] hw/arm/virt: Use new cpu_generic_new()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vFuceSCkSx5C

Use the new cpu_generic_new() rather than calling
parse_features by hand.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f3440f2..bcb9a6d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -172,7 +172,6 @@ static const char *valid_cpus[] = {
 static bool cpuname_valid(const char *cpu)
 {
     int i;
-
     for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
         if (strcmp(cpu, valid_cpus[i]) == 0) {
             return true;
@@ -1206,10 +1205,6 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     const char *cpu_model = machine->cpu_model;
     char **cpustr;
-    ObjectClass *oc;
-    const char *typename;
-    CPUClass *cc;
-    Error *err = NULL;
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
     uint8_t clustersz;
 
@@ -1240,6 +1235,7 @@ static void machvirt_init(MachineState *machine)
         error_report("mach-virt: CPU %s not supported", cpustr[0]);
         exit(1);
     }
+    g_strfreev(cpustr);
 
     /* If we have an EL3 boot ROM then the assumption is that it will
      * implement PSCI itself, so disable QEMU's internal implementation
@@ -1309,24 +1305,8 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vms);
 
-    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
-    if (!oc) {
-        error_report("Unable to find CPU definition");
-        exit(1);
-    }
-    typename = object_class_get_name(oc);
-
-    /* convert -smp CPU options specified by the user into global props */
-    cc = CPU_CLASS(oc);
-    cc->parse_features(typename, cpustr[1], &err);
-    g_strfreev(cpustr);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
-
     for (n = 0; n < smp_cpus; n++) {
-        Object *cpuobj = object_new(typename);
+        Object *cpuobj = OBJECT(cpu_generic_new(TYPE_ARM_CPU, cpu_model));
         if (!vmc->disallow_affinity_adjustment) {
             /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
              * GIC's target-list limitations. 32-bit KVM hosts currently
-- 
2.7.4

