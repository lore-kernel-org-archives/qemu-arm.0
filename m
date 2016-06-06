Received: by 10.25.27.66 with SMTP id b63csp1562169lfb;
        Mon, 6 Jun 2016 08:56:22 -0700 (PDT)
X-Received: by 10.55.71.138 with SMTP id u132mr9404007qka.1.1465228582658;
        Mon, 06 Jun 2016 08:56:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si12486520qtd.0.2016.06.06.08.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 08:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9wt4-0001IT-1l
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 11:56:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wHL-0000gL-Gr
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wHJ-00070M-3P
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wHF-000707-SF; Mon, 06 Jun 2016 11:17:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FF6E80F6B;
	Mon,  6 Jun 2016 15:17:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtn5013155; Mon, 6 Jun 2016 11:17:15 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:52 +0200
Message-Id: <1465226212-254093-11-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 06 Jun 2016 15:17:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 10/10] pc: parse cpu features only once
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yODoiF4PMHeg

considering that features are converted to
global properties and global properties are
automatically applied to every new instance
of created CPU (at object_new() time), there
is no point in parsing cpu_model string every
time a CPU created.
So move parsing outside CPU creation loop and
do it only once.
Parsing also should be done before any CPU is
created so that features would affect the first
CPU a well.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c      | 37 ++++++++++++++++++++++++++++---------
 target-i386/cpu.c | 44 --------------------------------------------
 target-i386/cpu.h |  1 -
 3 files changed, 28 insertions(+), 54 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c48322b..0331e6d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1041,21 +1041,17 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
     }
 }
 
-static X86CPU *pc_new_cpu(const char *cpu_model, int64_t apic_id,
+static X86CPU *pc_new_cpu(const char *typename, int64_t apic_id,
                           Error **errp)
 {
     X86CPU *cpu = NULL;
     Error *local_err = NULL;
 
-    cpu = cpu_x86_create(cpu_model, &local_err);
-    if (local_err != NULL) {
-        goto out;
-    }
+    cpu = X86_CPU(object_new(typename));
 
     object_property_set_int(OBJECT(cpu), apic_id, "apic-id", &local_err);
     object_property_set_bool(OBJECT(cpu), true, "realized", &local_err);
 
-out:
     if (local_err) {
         error_propagate(errp, local_err);
         object_unref(OBJECT(cpu));
@@ -1067,7 +1063,8 @@ out:
 void pc_hot_add_cpu(const int64_t id, Error **errp)
 {
     X86CPU *cpu;
-    MachineState *machine = MACHINE(qdev_get_machine());
+    ObjectClass *oc;
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     int64_t apic_id = x86_cpu_apic_id_from_index(id);
     Error *local_err = NULL;
 
@@ -1095,7 +1092,9 @@ void pc_hot_add_cpu(const int64_t id, Error **errp)
         return;
     }
 
-    cpu = pc_new_cpu(machine->cpu_model, apic_id, &local_err);
+    assert(pcms->possible_cpus->cpus[0].cpu); /* BSP is always present */
+    oc = OBJECT_CLASS(CPU_GET_CLASS(pcms->possible_cpus->cpus[0].cpu));
+    cpu = pc_new_cpu(object_class_get_name(oc), apic_id, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -1106,6 +1105,10 @@ void pc_hot_add_cpu(const int64_t id, Error **errp)
 void pc_cpus_init(PCMachineState *pcms)
 {
     int i, j;
+    CPUClass *cc;
+    ObjectClass *oc;
+    const char *typename;
+    gchar **model_pieces;
     X86CPU *cpu = NULL;
     MachineState *machine = MACHINE(pcms);
 
@@ -1118,6 +1121,22 @@ void pc_cpus_init(PCMachineState *pcms)
 #endif
     }
 
+    model_pieces = g_strsplit(machine->cpu_model, ",", 2);
+    if (!model_pieces[0]) {
+        error_report("Invalid/empty CPU model name");
+        exit(1);
+    }
+
+    oc = cpu_class_by_name(TYPE_X86_CPU, model_pieces[0]);
+    if (oc == NULL) {
+        error_report("Unable to find CPU definition: %s", model_pieces[0]);
+        exit(1);
+    }
+    typename = object_class_get_name(oc);
+    cc = CPU_CLASS(oc);
+    cc->parse_features(typename, model_pieces[1], &error_fatal);
+    g_strfreev(model_pieces);
+
     /* Calculates the limit to CPU APIC ID values
      *
      * Limit for the APIC ID value, so that all
@@ -1148,7 +1167,7 @@ void pc_cpus_init(PCMachineState *pcms)
         }
 
         if (i < smp_cpus) {
-            cpu = pc_new_cpu(machine->cpu_model, x86_cpu_apic_id_from_index(i),
+            cpu = pc_new_cpu(typename, x86_cpu_apic_id_from_index(i),
                              &error_fatal);
             pcms->possible_cpus->cpus[i].cpu = CPU(cpu);
             object_unref(OBJECT(cpu));
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 43b22e6..c633579 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2211,50 +2211,6 @@ static void x86_cpu_load_def(X86CPU *cpu, X86CPUDefinition *def, Error **errp)
 
 }
 
-X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
-{
-    X86CPU *cpu = NULL;
-    ObjectClass *oc;
-    CPUClass *cc;
-    gchar **model_pieces;
-    char *name, *features;
-    Error *error = NULL;
-    const char *typename;
-
-    model_pieces = g_strsplit(cpu_model, ",", 2);
-    if (!model_pieces[0]) {
-        error_setg(&error, "Invalid/empty CPU model name");
-        goto out;
-    }
-    name = model_pieces[0];
-    features = model_pieces[1];
-
-    oc = x86_cpu_class_by_name(name);
-    if (oc == NULL) {
-        error_setg(&error, "Unable to find CPU definition: %s", name);
-        goto out;
-    }
-    cc = CPU_CLASS(oc);
-    typename = object_class_get_name(oc);
-
-    cc->parse_features(typename, features, &error);
-    cpu = X86_CPU(object_new(typename));
-    if (error) {
-        goto out;
-    }
-
-out:
-    if (error != NULL) {
-        error_propagate(errp, error);
-        if (cpu) {
-            object_unref(OBJECT(cpu));
-            cpu = NULL;
-        }
-    }
-    g_strfreev(model_pieces);
-    return cpu;
-}
-
 X86CPU *cpu_x86_init(const char *cpu_model)
 {
     return X86_CPU(cpu_generic_init(TYPE_X86_CPU, cpu_model));
diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index a257c53..a9a3b87 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -1227,7 +1227,6 @@ void x86_cpu_exec_enter(CPUState *cpu);
 void x86_cpu_exec_exit(CPUState *cpu);
 
 X86CPU *cpu_x86_init(const char *cpu_model);
-X86CPU *cpu_x86_create(const char *cpu_model, Error **errp);
 int cpu_x86_exec(CPUState *cpu);
 void x86_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
-- 
1.8.3.1

