Received: by 10.25.77.65 with SMTP id a62csp308583lfb;
        Fri, 17 Feb 2017 10:56:55 -0800 (PST)
X-Received: by 10.55.177.133 with SMTP id a127mr8594951qkf.301.1487357815715;
        Fri, 17 Feb 2017 10:56:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k33si8060005qtk.242.2017.02.17.10.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 10:56:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceniB-0003Dn-24
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 13:56:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ceni2-00039l-8c
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:56:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ceni1-0007Sf-7C
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:56:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47338)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ceni0-0007Ry-UO; Fri, 17 Feb 2017 13:56:45 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2ED4804F3;
	Fri, 17 Feb 2017 18:56:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HIubLM022004; Fri, 17 Feb 2017 13:56:42 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 Feb 2017 19:56:34 +0100
Message-Id: <1487357795-52614-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 17 Feb 2017 18:56:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 2/3] machine: generalize handling of default
 cpu_model
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HSooBVIM4pjH

currently all boards have opencoded default cpu_model
selection. I most cases it's just a string and in others
it's a 'function'. Add to machine callback
that returns default cpu_model and make boards return
it as const string.

That allows to move detection of non specified cpu_model
i.e. missing CLI '-cpu' option and move detection
to generic machine code. And would allow to generalize
parsing cpu features in follow up patch.

TODO:
 complete conversion for all boards

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/boards.h |  1 +
 hw/arm/virt.c       | 10 ++++++----
 hw/core/machine.c   |  7 +++++++
 hw/i386/pc.c        | 18 ++++++++++--------
 hw/ppc/spapr.c      | 11 +++++++----
 5 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 04f5352..9f2dbfd 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -141,6 +141,7 @@ struct MachineClass {
                                            DeviceState *dev);
     unsigned (*cpu_index_to_socket_id)(unsigned cpu_index);
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
+    const char *(*default_cpu_model)(MachineState *machine);
 };
 
 /**
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a98cb91..8380540 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1252,10 +1252,6 @@ static void machvirt_init(MachineState *machine)
     Error *err = NULL;
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
 
-    if (!cpu_model) {
-        cpu_model = "cortex-a15";
-    }
-
     /* We can probe only here because during property set
      * KVM is not available yet
      */
@@ -1564,6 +1560,11 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static const char *virt_default_cpu_model(MachineState *machine)
+{
+    return "cortex-a15";
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1581,6 +1582,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
+    mc->default_cpu_model = virt_default_cpu_model;
 }
 
 static const TypeInfo virt_machine_info = {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index fe82529..2a954f0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -578,6 +578,13 @@ bool machine_mem_merge(MachineState *machine)
 void machine_run_board_init(MachineState *machine)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
+
+    /* Force all boards to provide default_cpu_model callback */
+    assert(machine_class->default_cpu_model);
+    if (machine->cpu_model == NULL) {
+        machine->cpu_model = machine_class->default_cpu_model(machine);
+    }
+
     machine_class->init(machine);
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a8660d4..0073469 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1149,14 +1149,6 @@ void pc_cpus_init(PCMachineState *pcms)
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
 
     /* init CPUs */
-    if (machine->cpu_model == NULL) {
-#ifdef TARGET_X86_64
-        machine->cpu_model = "qemu64";
-#else
-        machine->cpu_model = "qemu32";
-#endif
-    }
-
     model_pieces = g_strsplit(machine->cpu_model, ",", 2);
     if (!model_pieces[0]) {
         error_report("Invalid/empty CPU model name");
@@ -2296,6 +2288,15 @@ static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
     }
 }
 
+static const char *pc_default_cpu_model(MachineState *machine)
+{
+#ifdef TARGET_X86_64
+        return "qemu64";
+#else
+        return "qemu32";
+#endif
+}
+
 static void pc_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -2324,6 +2325,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_boot_order = "cad";
     mc->hot_add_cpu = pc_hot_add_cpu;
     mc->max_cpus = 255;
+    mc->default_cpu_model = pc_default_cpu_model;
     mc->reset = pc_machine_reset;
     hc->pre_plug = pc_machine_device_pre_plug_cb;
     hc->plug = pc_machine_device_plug_cb;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6f37288..8f30765 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1920,10 +1920,6 @@ static void ppc_spapr_init(MachineState *machine)
     }
 
     /* init CPUs */
-    if (machine->cpu_model == NULL) {
-        machine->cpu_model = kvm_enabled() ? "host" : smc->tcg_default_cpu;
-    }
-
     ppc_cpu_parse_features(machine->cpu_model);
 
     spapr_init_cpus(spapr);
@@ -2861,6 +2857,12 @@ static void spapr_phb_placement(sPAPRMachineState *spapr, uint32_t index,
     *mmio64 = SPAPR_PCI_BASE + (index + 1) * SPAPR_PCI_MEM64_WIN_SIZE;
 }
 
+static const char *spapr_default_cpu_model(MachineState *machine)
+{
+    sPAPRMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
+    return machine->cpu_model = kvm_enabled() ? "host" : smc->tcg_default_cpu;
+}
+
 static void spapr_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -2893,6 +2895,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = spapr_machine_device_unplug;
     mc->cpu_index_to_socket_id = spapr_cpu_index_to_socket_id;
     mc->possible_cpu_arch_ids = spapr_possible_cpu_arch_ids;
+    mc->default_cpu_model = spapr_default_cpu_model;
     hc->unplug_request = spapr_machine_device_unplug_request;
 
     smc->dr_lmb_enabled = true;
-- 
2.7.4

