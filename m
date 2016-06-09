Received: by 10.25.27.66 with SMTP id b63csp449910lfb;
        Thu, 9 Jun 2016 11:04:42 -0700 (PDT)
X-Received: by 10.55.102.144 with SMTP id a138mr11201592qkc.78.1465495482246;
        Thu, 09 Jun 2016 11:04:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si4041909qhc.54.2016.06.09.11.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4Jt-0005lr-JO
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:04:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bB3UW-0000nF-21
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 13:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bB3UQ-0007eK-08
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 13:11:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bB3UI-0007bm-4P; Thu, 09 Jun 2016 13:11:22 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0488552FF;
	Thu,  9 Jun 2016 17:11:21 +0000 (UTC)
Received: from Igors-MacBook-Pro.local.com (ovpn-204-90.brq.redhat.com
	[10.40.204.90])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59HB4ra031581; Thu, 9 Jun 2016 13:11:19 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Jun 2016 19:11:03 +0200
Message-Id: <1465492263-28472-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 09 Jun 2016 17:11:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 6/6] pc: parse cpu features only once
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
X-TUID: gTcDwtTwe2pb

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
 qom/cpu.c         |  1 -
 target-i386/cpu.c | 44 --------------------------------------------
 target-i386/cpu.h |  1 -
 4 files changed, 28 insertions(+), 55 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7198ed5..a3f94b1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1039,21 +1039,17 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
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
@@ -1065,7 +1061,8 @@ out:
 void pc_hot_add_cpu(const int64_t id, Error **errp)
 {
     X86CPU *cpu;
-    MachineState *machine = MACHINE(qdev_get_machine());
+    ObjectClass *oc;
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     int64_t apic_id = x86_cpu_apic_id_from_index(id);
     Error *local_err = NULL;
 
@@ -1093,7 +1090,9 @@ void pc_hot_add_cpu(const int64_t id, Error **errp)
         return;
     }
 
-    cpu = pc_new_cpu(machine->cpu_model, apic_id, &local_err);
+    assert(pcms->possible_cpus->cpus[0].cpu); /* BSP is always present */
+    oc = OBJECT_CLASS(CPU_GET_CLASS(pcms->possible_cpus->cpus[0].cpu));
+    cpu = pc_new_cpu(object_class_get_name(oc), apic_id, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -1104,6 +1103,10 @@ void pc_hot_add_cpu(const int64_t id, Error **errp)
 void pc_cpus_init(PCMachineState *pcms)
 {
     int i;
+    CPUClass *cc;
+    ObjectClass *oc;
+    const char *typename;
+    gchar **model_pieces;
     X86CPU *cpu = NULL;
     MachineState *machine = MACHINE(pcms);
 
@@ -1116,6 +1119,22 @@ void pc_cpus_init(PCMachineState *pcms)
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
@@ -1136,7 +1155,7 @@ void pc_cpus_init(PCMachineState *pcms)
         pcms->possible_cpus->cpus[i].arch_id = x86_cpu_apic_id_from_index(i);
         pcms->possible_cpus->len++;
         if (i < smp_cpus) {
-            cpu = pc_new_cpu(machine->cpu_model, x86_cpu_apic_id_from_index(i),
+            cpu = pc_new_cpu(typename, x86_cpu_apic_id_from_index(i),
                              &error_fatal);
             pcms->possible_cpus->cpus[i].cpu = CPU(cpu);
             object_unref(OBJECT(cpu));
diff --git a/qom/cpu.c b/qom/cpu.c
index 1295f5b..b34c4a0 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -297,7 +297,6 @@ static void cpu_common_parse_features(const char *typename, char *features,
      * to assert(!cpu_globals_initialized).
      * Current callers of ->parse_features() are:
      * - cpu_generic_init()
-     * - cpu_x86_create()
      */
     if (cpu_globals_initialized) {
         return;
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 279f656..4d36623 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2214,50 +2214,6 @@ static void x86_cpu_load_def(X86CPU *cpu, X86CPUDefinition *def, Error **errp)
 
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
index d9ab884..f4f65ce 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -1234,7 +1234,6 @@ void x86_cpu_exec_enter(CPUState *cpu);
 void x86_cpu_exec_exit(CPUState *cpu);
 
 X86CPU *cpu_x86_init(const char *cpu_model);
-X86CPU *cpu_x86_create(const char *cpu_model, Error **errp);
 int cpu_x86_exec(CPUState *cpu);
 void x86_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
-- 
2.7.0

