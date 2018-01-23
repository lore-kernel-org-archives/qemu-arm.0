Received: by 10.28.71.27 with SMTP id u27csp3778829wma;
        Tue, 23 Jan 2018 00:26:30 -0800 (PST)
X-Google-Smtp-Source: AH8x22556gFL7ZEJtbJhZ2Z+AkwTs1nBz1QcqWMtQtPewbPvTwtW5Mpr6lHhCwk4QAzHPS/KWMMi
X-Received: by 10.37.28.65 with SMTP id c62mr1642555ybc.372.1516695990537;
        Tue, 23 Jan 2018 00:26:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695990; cv=none;
        d=google.com; s=arc-20160816;
        b=EyR851u0WCBQ8I6iOu44Ca3Hy7e7W+2eDYeqK2PLZh0BcbhodW8USQv+Jy1QFlJSAA
         RjL1Z6s9YNT8sgwcJ8f6+IW49R4sJW+T/R+rwnH1xuxGXkUgfnvyNoa0/dDRBmH20H4v
         C2I05a/MfXAbuiC7k2d+UouPX5WS9SdQY0g70RJxMmhtIhWuE1b76dqpbsoo9PnFUTwy
         39E8IHG2ZG/hMvdYxSM8S1Vo4R9XnHy6fs8Kkv0EYC331ioUCXZa6KEbWq/ghNmpiFJD
         sMXrTOzc402ywdlOrQNyLlNV2I4jJvA7i/1fW2aRMcykz1wuXq86fa2KuvF2s80CNSud
         p6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=h21SSRpqnxXNPwb3L+ST6rEMOH6PylBNzHyZ9OiwxPA=;
        b=0EQKk3Y/J8FAiLTn7zJ8YdSRDMEd+1TKOjCwjRH+N+2TYpwjmJ6spGMzmXhoHADg+P
         70Lb02S+WXk72Dt3VqifU/u7Bz8lV1HsgVoS0owPAWK0CT3br5xco6HxI1nhIB2R0fbK
         t5AZon/+TSBUgBwNLpAk6UJr1/UI9LCbLPU17lcB0VbgBUH3XBtJ4P6rnSfXryBjs7L3
         IzX6kIwGGwxuPQxym7ERpHmJ8dImhNu4y5ZdR1vHk9tjeyHjObpIjiZD+7KXcI5Gk8rc
         xeXLzdQoaoIVLMm9nnhWpKDf2fqgzrqvTsqlX85WPFg/vURSQ3RPX3q/Vo9lMqGZtv9f
         edVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w186si3421525ywc.779.2018.01.23.00.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:26:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtuX-0004kd-ST
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:26:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfU-000879-1k
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfR-0002J6-1K
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfQ-0002IR-PF; Tue, 23 Jan 2018 03:10:52 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 075C061E53;
	Tue, 23 Jan 2018 08:10:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E4F1D1F2;
	Tue, 23 Jan 2018 08:10:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:22 +0100
Message-Id: <1516694904-64879-24-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 23 Jan 2018 08:10:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 23/25] Use cpu_create(type) instead of
 cpu_init(cpu_model)
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHrlvHvVPg8b

With all targets defining CPU_RESOLVING_TYPE, refactor
cpu_parse_cpu_model(type, cpu_model) to parse_cpu_model(cpu_model)
so that callers won't have to know internal resolving cpu
type. Place it in exec.c so it could be called from both
target independed vl.c and *-user/main.c.

That allows us to stop abusing cpu type from
  MachineClass::default_cpu_type
as resolver class in vl.c which were confusing part of
cpu_parse_cpu_model().

Also with new parse_cpu_model(), the last users of cpu_init()
in null-machine.c and bsd/linux-user targets could be switched
to cpu_create() API and cpu_init() API will be removed by
follow up patch.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/qom/cpu.h      | 16 ++--------------
 bsd-user/main.c        |  4 +++-
 exec.c                 | 23 +++++++++++++++++++++++
 hw/core/null-machine.c |  6 +++---
 linux-user/main.c      |  8 ++++++--
 qom/cpu.c              | 31 -------------------------------
 vl.c                   | 10 +++-------
 7 files changed, 40 insertions(+), 58 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 93bd546..0185589 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -661,8 +661,7 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
 CPUState *cpu_create(const char *typename);
 
 /**
- * cpu_parse_cpu_model:
- * @typename: The CPU base type or CPU type.
+ * parse_cpu_model:
  * @cpu_model: The model string including optional parameters.
  *
  * processes optional parameters and registers them as global properties
@@ -670,18 +669,7 @@ CPUState *cpu_create(const char *typename);
  * Returns: type of CPU to create or prints error and terminates process
  *          if an error occurred.
  */
-const char *cpu_parse_cpu_model(const char *typename, const char *cpu_model);
-
-/**
- * cpu_generic_init:
- * @typename: The CPU base type.
- * @cpu_model: The model string including optional parameters.
- *
- * Instantiates a CPU, processes optional parameters and realizes the CPU.
- *
- * Returns: A #CPUState or %NULL if an error occurred.
- */
-CPUState *cpu_generic_init(const char *typename, const char *cpu_model);
+const char *parse_cpu_model(const char *cpu_model);
 
 /**
  * cpu_has_work:
diff --git a/bsd-user/main.c b/bsd-user/main.c
index efef5ff..cbc683a 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -723,6 +723,7 @@ int main(int argc, char **argv)
 {
     const char *filename;
     const char *cpu_model;
+    const char *cpu_type;
     const char *log_file = NULL;
     const char *log_mask = NULL;
     struct target_pt_regs regs1, *regs = &regs1;
@@ -900,7 +901,8 @@ int main(int argc, char **argv)
     tcg_exec_init(0);
     /* NOTE: we need to init the CPU at this stage to get
        qemu_host_page_size */
-    cpu = cpu_init(cpu_model);
+    cpu_type = parse_cpu_model(cpu_model);
+    cpu = create(cpu_type);
     env = cpu->env_ptr;
 #if defined(TARGET_SPARC) || defined(TARGET_PPC)
     cpu_reset(cpu);
diff --git a/exec.c b/exec.c
index 629a508..8aee230 100644
--- a/exec.c
+++ b/exec.c
@@ -817,6 +817,29 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #endif
 }
 
+const char *parse_cpu_model(const char *cpu_model)
+{
+    ObjectClass *oc;
+    CPUClass *cc;
+    gchar **model_pieces;
+    const char *cpu_type;
+
+    model_pieces = g_strsplit(cpu_model, ",", 2);
+
+    oc = cpu_class_by_name(CPU_RESOLVING_TYPE, model_pieces[0]);
+    if (oc == NULL) {
+        error_report("unable to find CPU model '%s'", model_pieces[0]);
+        g_strfreev(model_pieces);
+        exit(EXIT_FAILURE);
+    }
+
+    cpu_type = object_class_get_name(oc);
+    cc = CPU_CLASS(oc);
+    cc->parse_features(cpu_type, model_pieces[1], &error_fatal);
+    g_strfreev(model_pieces);
+    return cpu_type;
+}
+
 #if defined(CONFIG_USER_ONLY)
 static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 {
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 864832d..cde4d3e 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -24,9 +24,9 @@ static void machine_none_init(MachineState *mch)
 {
     CPUState *cpu = NULL;
 
-    /* Initialize CPU (if a model has been specified) */
-    if (mch->cpu_model) {
-        cpu = cpu_init(mch->cpu_model);
+    /* Initialize CPU (if user asked for it) */
+    if (mch->cpu_type) {
+        cpu = cpu_create(mch->cpu_type);
         if (!cpu) {
             error_report("Unable to initialize CPU");
             exit(1);
diff --git a/linux-user/main.c b/linux-user/main.c
index a35477e..0afb3f4 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -44,6 +44,7 @@ static const char *argv0;
 static int gdbstub_port;
 static envlist_t *envlist;
 static const char *cpu_model;
+static const char *cpu_type;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
 int have_guest_base;
@@ -3847,7 +3848,7 @@ void init_task_state(TaskState *ts)
 CPUArchState *cpu_copy(CPUArchState *env)
 {
     CPUState *cpu = ENV_GET_CPU(env);
-    CPUState *new_cpu = cpu_init(cpu_model);
+    CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = new_cpu->env_ptr;
     CPUBreakpoint *bp;
     CPUWatchpoint *wp;
@@ -4357,10 +4358,13 @@ int main(int argc, char **argv, char **envp)
         cpu_model = "any";
 #endif
     }
+    cpu_type = parse_cpu_model(cpu_model);
+
     tcg_exec_init(0);
     /* NOTE: we need to init the CPU at this stage to get
        qemu_host_page_size */
-    cpu = cpu_init(cpu_model);
+
+    cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
     cpu_reset(cpu);
 
diff --git a/qom/cpu.c b/qom/cpu.c
index e42d9a7..aab8437 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -67,37 +67,6 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
-const char *cpu_parse_cpu_model(const char *typename, const char *cpu_model)
-{
-    ObjectClass *oc;
-    CPUClass *cc;
-    gchar **model_pieces;
-    const char *cpu_type;
-
-    model_pieces = g_strsplit(cpu_model, ",", 2);
-
-    oc = cpu_class_by_name(typename, model_pieces[0]);
-    if (oc == NULL) {
-        error_report("unable to find CPU model '%s'", model_pieces[0]);
-        g_strfreev(model_pieces);
-        exit(EXIT_FAILURE);
-    }
-
-    cpu_type = object_class_get_name(oc);
-    cc = CPU_CLASS(oc);
-    cc->parse_features(cpu_type, model_pieces[1], &error_fatal);
-    g_strfreev(model_pieces);
-    return cpu_type;
-}
-
-CPUState *cpu_generic_init(const char *typename, const char *cpu_model)
-{
-    /* TODO: all callers of cpu_generic_init() need to be converted to
-     * call cpu_parse_features() only once, before calling cpu_generic_init().
-     */
-    return cpu_create(cpu_parse_cpu_model(typename, cpu_model));
-}
-
 bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
diff --git a/vl.c b/vl.c
index e725ecb..e45e831 100644
--- a/vl.c
+++ b/vl.c
@@ -4609,15 +4609,11 @@ int main(int argc, char **argv, char **envp)
     current_machine->maxram_size = maxram_size;
     current_machine->ram_slots = ram_slots;
     current_machine->boot_order = boot_order;
-    current_machine->cpu_model = cpu_model;
 
     /* parse features once if machine provides default cpu_type */
-    if (machine_class->default_cpu_type) {
-        current_machine->cpu_type = machine_class->default_cpu_type;
-        if (cpu_model) {
-            current_machine->cpu_type =
-                cpu_parse_cpu_model(machine_class->default_cpu_type, cpu_model);
-        }
+    current_machine->cpu_type = machine_class->default_cpu_type;
+    if (cpu_model) {
+        current_machine->cpu_type = parse_cpu_model(cpu_model);
     }
     parse_numa_opts(current_machine);
 
-- 
2.7.4

