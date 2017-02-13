Received: by 10.25.77.65 with SMTP id a62csp893800lfb;
        Mon, 13 Feb 2017 06:34:52 -0800 (PST)
X-Received: by 10.237.36.24 with SMTP id r24mr20889018qtc.229.1486996492803;
        Mon, 13 Feb 2017 06:34:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f37si7335816qte.335.2017.02.13.06.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 06:34:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdHiM-0005Yq-0V
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 09:34:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcJ-0008Hm-97
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcH-0005I6-O7
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:35 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cdHcH-0005C4-I1; Mon, 13 Feb 2017 09:28:33 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cdHc5-00014z-Va; Mon, 13 Feb 2017 14:28:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Feb 2017 14:28:18 +0000
Message-Id: <1486996099-15820-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/4] hw/arm/integrator: Use new cpu_generic_new()
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
X-TUID: ANc4xgvqu7Gz

Use the new cpu_generic_new() function rather than doing the
work of creating it and calling parse_features by hand.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/integratorcp.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 5610ffc..beffaf4 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -577,42 +577,24 @@ static void integratorcp_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
-    char **cpustr;
-    ObjectClass *cpu_oc;
-    CPUClass *cc;
     Object *cpuobj;
     ARMCPU *cpu;
-    const char *typename;
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     MemoryRegion *ram_alias = g_new(MemoryRegion, 1);
     qemu_irq pic[32];
     DeviceState *dev, *sic, *icp;
     int i;
-    Error *err = NULL;
 
     if (!cpu_model) {
         cpu_model = "arm926";
     }
 
-    cpustr = g_strsplit(cpu_model, ",", 2);
-
-    cpu_oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
-    if (!cpu_oc) {
+    cpuobj = OBJECT(cpu_generic_new(TYPE_ARM_CPU, cpu_model));
+    if (!cpuobj) {
         fprintf(stderr, "Unable to find CPU definition\n");
         exit(1);
     }
-    typename = object_class_get_name(cpu_oc);
-
-    cc = CPU_CLASS(cpu_oc);
-    cc->parse_features(typename, cpustr[1], &err);
-    g_strfreev(cpustr);
-    if (err) {
-        error_report_err(err);
-        exit(1);
-    }
-
-    cpuobj = object_new(typename);
 
     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
-- 
2.7.4

