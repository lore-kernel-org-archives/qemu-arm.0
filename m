Received: by 10.25.0.6 with SMTP id 6csp215480lfa;
        Fri, 26 May 2017 02:23:15 -0700 (PDT)
X-Received: by 10.200.48.221 with SMTP id w29mr1044365qta.54.1495790595348;
        Fri, 26 May 2017 02:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495790595; cv=none;
        d=google.com; s=arc-20160816;
        b=hwKEzjIyLb4mp1HkBj2RXP0lrsUAWuvEgF7KFjW20wMFJfRtYXCP/Xz/8mK6TiWwPl
         s7hGs9FeReOf0OL35ZwaLct3I5WRpz/lYaSGckigvBp9K/jpiwRtLOd3arG/v5hHCey/
         DG49b+QDJ71Q/Bd/tJPPsr+pyyeL74rEP3Y6Ls6vtWayfcClfxJkIgm4/Ru77ELCzGCj
         Wk8K6DUla6sjXbQqhu61oZG6IkN+xbfI+AFQQDpSU8WshAHjqSeTrA/HSv9LsO4TXw0f
         Fp59qg/U1TMHY7tWD4GLZeuUFVACBqvjXCt4reZz+dblCWk5OkVGj74EZAMDRlLt6LqW
         WdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=WgSovuP9A/95tdiNjpkShhy7l1A9QYykzeUSgCostZM=;
        b=yZ6VrnbQCN6jR8iOUYXFuJIm+6X3GUhIeM5LNQus78WxZixLAefvmTYW5juqMaswar
         U0q0rAAojrLDDy5Ho9RtUW7Rl0rDB2+LC2FT0jJC5oPcxAyWqbCu8BHLeI3j/uHaZ5fZ
         SIp9sy3xEJTJ3I3dlTCia86JtzzfQ/cp91hWNtGKbzZy1NosPC1zBTnpzAff7Zy/k5bO
         TpCCK7HSIuIuByxNK0JePSXqrcAccne6iytJLLrfw4xeJM11zdg/lqFueM7KfyO1Wnjj
         ixyHE/5nHfFt+Gv9lUZsBHvARv1ZksVmCLhsCZgUMJTsTG/wHQyKVPGp8+L1DAqH9IuP
         JZuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k125si222987qkf.224.2017.05.26.02.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 02:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEBSk-00048i-Ni
	for alex.bennee@linaro.org; Fri, 26 May 2017 05:23:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBR8-0002gb-JG
	for qemu-devel@nongnu.org; Fri, 26 May 2017 05:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBR7-0005Zi-1K
	for qemu-devel@nongnu.org; Fri, 26 May 2017 05:21:34 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zhlcindy@gmail.com>)
	id 1dEBR3-0005XA-DZ; Fri, 26 May 2017 05:21:29 -0400
Received: by mail-pf0-x241.google.com with SMTP id u26so1513835pfd.2;
	Fri, 26 May 2017 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WgSovuP9A/95tdiNjpkShhy7l1A9QYykzeUSgCostZM=;
	b=pZxyT6yQwDwRuT1NLRmXqzL9WtS3HOyf9DjThf6R5Kkt/FoqX4r3lf7C8gSw/oHSIR
	aKlOzR+vLslqclRk3C2etLqvk+886JpAHlfXrDEUm/Soh43NDLzRuwGyNAxox/nYHPiO
	1J8HuIKC8VhvjCuoOdJrm8IIm8Zkxqu+Be4Mpxlr6URr0rqaQkc+ZDTBX7shOhI/N2hO
	8PMvcFYnofntszgzfw5c567etlbiA83SaRAR4UPLYrENY2WMN97MKaDJKSt9eWNBfYPZ
	KIRjJDQtU+wrmrv0yg5xPd51QbcV2CugLxVq3Cndi0f88tDUj4LirmS2HYRCXKbVBHu3
	a8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WgSovuP9A/95tdiNjpkShhy7l1A9QYykzeUSgCostZM=;
	b=nJ/jL2CMxWa3BA3e+pR3J4X75wKL9LGrwaoXap2ck8KbTqxOgqM/5H/KZjGIjYHY9i
	I0zfXw1+y1MkDK/uIoY8MhhaHFA+lR1s0oQCk2SGWuLNJLnK+3fPZaywqv0R8j4wvNX8
	JKS7hekWsl4VCTsSInZPpNeHCUIfd7CPQNlhVBsWNMQeW9VP7g9KU1RAUrL3O0OZC8GI
	/N9m3uIoOxGywxZn++oBCEHDiTMwcKoo1DbZ7TnzOHW5v2m34lVMAkn1YH/MQt/Q2+n2
	g5NA/DBAZ4AHEdqknqpiQGvUTnUKT3Bc/lQaRmt1TqDxTTeRpTQuGbbY0kN5g9OxRQHZ
	bNSw==
X-Gm-Message-State: AODbwcDWjf0g1pHw92e+wmL5/FusmP796YnxmCQjqMAwmtMtq+fw2dtx
	/NxzZIwe8Xc2guBJ
X-Received: by 10.84.131.67 with SMTP id 61mr55887402pld.8.1495790488605;
	Fri, 26 May 2017 02:21:28 -0700 (PDT)
Received: from control2.hxtcorp.net ([223.203.96.18])
	by smtp.gmail.com with ESMTPSA id b2sm602187pgc.16.2017.05.26.02.21.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 May 2017 02:21:27 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 26 May 2017 17:21:07 +0800
Message-Id: <1495790468-23862-3-git-send-email-zhlcindy@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
References: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH 2/3] arm/virt: Refine code of machvirt_init
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
Cc: Li Zhang <li.zhang@hxt-semitech.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tv/Bmal5azco

From: Li Zhang <li.zhang@hxt-semitech.com>

This patch is to refine cpu related in machvirt_init and
add virt_new_cpu function which can be called by hot_add_cpu.

Signed-off-by: Li Zhang <li.zhang@hxt-semitech.com>
---
 hw/arm/virt.c | 231 ++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 128 insertions(+), 103 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73c3cf7..31314c1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_params;
 #define RAMLIMIT_GB 255
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
 
+static MemoryRegion *secure_sysmem;
+
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
  * 128MB..256MB is used for miscellaneous device I/O.
@@ -415,6 +417,116 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     }
 }
 
+static void virt_new_cpu(MachineState *ms, int id, Error **errp)
+{
+    const char *typename;
+    char **cpustr;
+    int node_id;
+
+    ObjectClass *oc;
+    CPUClass *cc;
+    CPUState *cs;
+    Object *cpuobj;
+    const CPUArchIdList *possible_cpus;
+
+    Error *err = NULL;
+    const char *cpu_model = ms->cpu_model;
+    MemoryRegion *sysmem = get_system_memory();
+
+    VirtMachineState *vms = VIRT_MACHINE(ms);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    CPU_FOREACH(cs) {
+        if (cs->cpu_index == id) {
+            error_report("CPU %d has been created.", id);
+            return;
+        }
+    }
+    possible_cpus = mc->possible_cpu_arch_ids(ms);
+    /* Separate the actual CPU model name from any appended features */
+    cpustr = g_strsplit(cpu_model, ",", 2);
+    if (!cpuname_valid(cpustr[0])) {
+        error_report("mach-virt: CPU %s not supported", cpustr[0]);
+        goto out;
+    }
+    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
+    if (!oc) {
+        error_report("Unable to find CPU definition");
+        goto out;
+    }
+
+    typename = object_class_get_name(oc);
+
+    cc = CPU_CLASS(oc);
+    cc->parse_features(typename, cpustr[1], &err);
+    if (err) {
+        error_report_err(err);
+        goto out;
+    }
+
+    cpuobj = object_new(typename);
+    object_property_set_int(cpuobj, possible_cpus->cpus[id].arch_id,
+                            "mp-affinity", NULL);
+    cs = CPU(cpuobj);
+    cs->cpu_index = id;
+
+    node_id = possible_cpus->cpus[cs->cpu_index].props.node_id;
+    if (!possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
+        /* by default CPUState::numa_node was 0 if it's not set via CLI
+         * keep it this way for now but in future we probably should
+         * refuse to start up with incomplete numa mapping */
+        node_id = 0;
+    }
+    if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
+        cs->numa_node = node_id;
+    } else {
+        /* CPU isn't device_add compatible yet, this shouldn't happen */
+        error_setg(&error_abort, "user set node-id not implemented");
+    }
+
+    if (!vms->secure) {
+        object_property_set_bool(cpuobj, false, "has_el3", NULL);
+    }
+
+    if (!vms->virt && object_property_find(cpuobj, "has_el2", NULL)) {
+        object_property_set_bool(cpuobj, false, "has_el2", NULL);
+    }
+
+    if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+        object_property_set_int(cpuobj, vms->psci_conduit,
+                                "psci-conduit", NULL);
+        /* Secondary CPUs start in PSCI powered-down state */
+        if (id > 0) {
+            object_property_set_bool(cpuobj, true, "start-powered-off", NULL);
+        }
+    }
+
+    if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
+        object_property_set_bool(cpuobj, false, "pmu", NULL);
+    }
+
+    if (object_property_find(cpuobj, "reset-cbar", NULL)) {
+        object_property_set_int(cpuobj, vms->memmap[VIRT_CPUPERIPHS].base,
+                                "reset-cbar", &error_abort);
+    }
+
+    object_property_set_link(cpuobj, OBJECT(sysmem), "memory", &error_abort);
+
+    if (vms->secure) {
+        object_property_set_link(cpuobj, OBJECT(secure_sysmem),
+                                  "secure-memory", &error_abort);
+    }
+
+    object_property_set_int(cpuobj, id, "id", NULL);
+    object_property_set_bool(cpuobj, true, "realized", NULL);
+    object_unref(cpuobj);
+
+out:
+    g_strfreev(cpustr);
+    error_propagate(errp, err);
+}
+
 static void fdt_add_its_gic_node(VirtMachineState *vms)
 {
     vms->msi_phandle = qemu_fdt_alloc_phandle(vms->fdt);
@@ -1237,35 +1349,29 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus;
     qemu_irq pic[NUM_IRQS];
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *secure_sysmem = NULL;
     int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     const char *cpu_model = machine->cpu_model;
-    char **cpustr;
-    ObjectClass *oc;
-    const char *typename;
-    CPUClass *cc;
     Error *err = NULL;
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
 
     if (!cpu_model) {
-        cpu_model = "cortex-a15";
+        cpu_model = kvm_enabled() ? "host" : "cortex-a15";
+        machine->cpu_model = cpu_model;
     }
 
     /* We can probe only here because during property set
      * KVM is not available yet
      */
+    if (!vms->gic_version && !kvm_enabled()) {
+        error_report("gic-version=host requires KVM");
+        exit(1);
+    }
     if (!vms->gic_version) {
-        if (!kvm_enabled()) {
-            error_report("gic-version=host requires KVM");
-            exit(1);
-        }
-
         vms->gic_version = kvm_arm_vgic_probe();
         if (!vms->gic_version) {
             error_report("Unable to determine GIC version supported by host");
@@ -1273,14 +1379,6 @@ static void machvirt_init(MachineState *machine)
         }
     }
 
-    /* Separate the actual CPU model name from any appended features */
-    cpustr = g_strsplit(cpu_model, ",", 2);
-
-    if (!cpuname_valid(cpustr[0])) {
-        error_report("mach-virt: CPU %s not supported", cpustr[0]);
-        exit(1);
-    }
-
     /* If we have an EL3 boot ROM then the assumption is that it will
      * implement PSCI itself, so disable QEMU's internal implementation
      * so it doesn't get in the way. Instead of starting secondary
@@ -1328,12 +1426,12 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->secure) {
-        if (kvm_enabled()) {
-            error_report("mach-virt: KVM does not support Security extensions");
-            exit(1);
-        }
+    if (vms->secure && kvm_enabled()) {
+        error_report("mach-virt: KVM does not support Security extensions");
+        exit(1);
+    }
 
+    if (vms->secure) {
         /* The Secure view of the world is the same as the NonSecure,
          * but with a few extra devices. Create it as a container region
          * containing the system memory at low priority; any secure-only
@@ -1347,91 +1445,18 @@ static void machvirt_init(MachineState *machine)
 
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
     possible_cpus = mc->possible_cpu_arch_ids(machine);
     for (n = 0; n < possible_cpus->len; n++) {
-        Object *cpuobj;
-        CPUState *cs;
-        int node_id;
-
         if (n >= smp_cpus) {
             break;
         }
-
-        cpuobj = object_new(typename);
-        object_property_set_int(cpuobj, possible_cpus->cpus[n].arch_id,
-                                "mp-affinity", NULL);
-
-        cs = CPU(cpuobj);
-        cs->cpu_index = n;
-
-        node_id = possible_cpus->cpus[cs->cpu_index].props.node_id;
-        if (!possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
-            /* by default CPUState::numa_node was 0 if it's not set via CLI
-             * keep it this way for now but in future we probably should
-             * refuse to start up with incomplete numa mapping */
-             node_id = 0;
-        }
-        if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
-            cs->numa_node = node_id;
-        } else {
-            /* CPU isn't device_add compatible yet, this shouldn't happen */
-            error_setg(&error_abort, "user set node-id not implemented");
-        }
-
-        if (!vms->secure) {
-            object_property_set_bool(cpuobj, false, "has_el3", NULL);
-        }
-
-        if (!vms->virt && object_property_find(cpuobj, "has_el2", NULL)) {
-            object_property_set_bool(cpuobj, false, "has_el2", NULL);
-        }
-
-        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
-            object_property_set_int(cpuobj, vms->psci_conduit,
-                                    "psci-conduit", NULL);
-
-            /* Secondary CPUs start in PSCI powered-down state */
-            if (n > 0) {
-                object_property_set_bool(cpuobj, true,
-                                         "start-powered-off", NULL);
-            }
-        }
-
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
-            object_property_set_bool(cpuobj, false, "pmu", NULL);
-        }
-
-        if (object_property_find(cpuobj, "reset-cbar", NULL)) {
-            object_property_set_int(cpuobj, vms->memmap[VIRT_CPUPERIPHS].base,
-                                    "reset-cbar", &error_abort);
-        }
-
-        object_property_set_link(cpuobj, OBJECT(sysmem), "memory",
-                                 &error_abort);
-        if (vms->secure) {
-            object_property_set_link(cpuobj, OBJECT(secure_sysmem),
-                                     "secure-memory", &error_abort);
+        virt_new_cpu(machine, n, &err);
+        if (err) {
+            error_report("mach-virt: creating a new cpu failed.");
+            exit(1);
         }
-
-        object_property_set_bool(cpuobj, true, "realized", NULL);
-        object_unref(cpuobj);
     }
+
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
     fdt_add_psci_node(vms);
-- 
2.7.4

