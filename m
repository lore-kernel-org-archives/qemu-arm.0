Received: by 10.25.85.209 with SMTP id j200csp100920lfb;
        Fri, 10 Jun 2016 10:41:15 -0700 (PDT)
X-Received: by 10.55.154.136 with SMTP id c130mr3036129qke.79.1465580475646;
        Fri, 10 Jun 2016 10:41:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b30si6878452qta.84.2016.06.10.10.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:41:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQQk-0006g1-Ut
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:41:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQM-0006OT-Vn
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQL-0000O2-6T
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58350)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQK-0000Np-Tt; Fri, 10 Jun 2016 13:40:49 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 711197F0A3;
	Fri, 10 Jun 2016 17:40:48 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPX032552; Fri, 10 Jun 2016 13:40:46 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:17 +0200
Message-Id: <1465580427-13596-7-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 10 Jun 2016 17:40:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 06/16] vl: move smp parsing to machine
 pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BhM2aeUBoHGB

Move the guts of smp_parse() into hw/core/machine.c to operate on
smp machine properties, and to eventually allow it to be overridden
by machines. We leave the smp_parse function behind to handle the
(now deprecated) -smp option, but now it only needs to set the
machine properties.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 vl.c              | 111 ++++++++++++++++-------------------------------------
 2 files changed, 142 insertions(+), 82 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2625044002e57..75c5a1fdd7de1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -17,6 +17,7 @@
 #include "qapi/visitor.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/replay.h"
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
 
@@ -417,16 +418,122 @@ static void machine_init_notify(Notifier *notifier, void *data)
 
 static void machine_set_smp_parameters(MachineState *ms)
 {
-    if (ms->sockets != -1 || ms->cores != -1 || ms->threads != -1 ||
-        ms->maxcpus != -1 || ms->cpus != -1) {
+    int sockets = ms->sockets;
+    int cores   = ms->cores;
+    int threads = ms->threads;
+    int maxcpus = ms->maxcpus;
+    int cpus    = ms->cpus;
+    bool sockets_input = sockets > 0;
+
+    if (sockets == -1 && cores == -1 && threads == -1 &&
+        maxcpus == -1 && cpus == -1) {
+        ms->sockets = 1;
+        ms->cores   = 1;
+        ms->threads = 1;
+        ms->maxcpus = 1;
+        ms->cpus    = 1;
+        return;
+    }
+
+    if (sockets == -1 || cores == -1 || threads == -1 ||
+        maxcpus == -1 || cpus == -1) {
+        error_report("cpu topology: "
+                     "all machine properties must be specified");
+        exit(1);
+    }
+
+    /* If the deprecated -smp option was used without complete input,
+     * or a user input zeros (why would they do that?), then we compute
+     * missing values, preferring sockets over cores over threads.
+     */
+    if (cpus == 0 || sockets == 0) {
+        sockets = sockets > 0 ? sockets : 1;
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        if (cpus == 0) {
+            cpus = cores * threads * sockets;
+        }
+    } else if (cores == 0) {
+        threads = threads > 0 ? threads : 1;
+        cores = cpus / (sockets * threads);
+    } else if (threads == 0) {
+        threads = cpus / (cores * sockets);
+    } else if (sockets * cores * threads < cpus) {
+        error_report("cpu topology: "
+                     "sockets (%u) * cores (%u) * threads (%u) < "
+                     "smp_cpus (%u)",
+                     sockets, cores, threads, cpus);
+        exit(1);
+    }
+
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+    if (maxcpus > MAX_CPUMASK_BITS) {
+        error_report("unsupported number of maxcpus");
+        exit(1);
+    }
+
+    if (maxcpus < cpus) {
+        error_report("maxcpus must be equal to or greater than smp");
+        exit(1);
+    }
+
+    if (sockets * cores * threads > maxcpus) {
+        error_report("cpu topology: "
+                     "sockets (%u) * cores (%u) * threads (%u) > "
+                     "maxcpus (%u)",
+                     sockets, cores, threads, maxcpus);
+        exit(1);
+    }
+
+    if (sockets_input && sockets * cores * threads != maxcpus) {
+        unsigned sockets_rounded = DIV_ROUND_UP(maxcpus, cores * threads);
+
         error_report("warning: cpu topology: "
-                     "machine properties currently ignored");
+                     "sockets (%u) * cores (%u) * threads (%u) != "
+                     "maxcpus (%u). Trying sockets=%u.",
+                     sockets, cores, threads, maxcpus, sockets_rounded);
+        sockets = sockets_rounded;
+
+        if (sockets * cores * threads > maxcpus) {
+            error_report("cpu topology: "
+                         "sockets (%u) * cores (%u) * threads (%u) > "
+                         "maxcpus (%u)",
+                         sockets, cores, threads, maxcpus);
+            exit(1);
+        }
     }
+
+    ms->sockets = sockets;
+    ms->cores   = cores;
+    ms->threads = threads;
+    ms->maxcpus = maxcpus;
+    ms->cpus    = cpus;
 }
 
 static void machine_pre_init(MachineState *ms)
 {
+    MachineClass *mc = MACHINE_CLASS(object_get_class(OBJECT(ms)));
+
     machine_set_smp_parameters(ms);
+    smp_cores   = ms->cores;
+    smp_threads = ms->threads;
+    max_cpus    = ms->maxcpus;
+    smp_cpus    = ms->cpus;
+
+    mc->max_cpus = mc->max_cpus ?: 1; /* Default to UP */
+    if (ms->maxcpus > mc->max_cpus) {
+        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
+                     "supported by machine '%s' (%d)", ms->maxcpus, mc->name,
+                     mc->max_cpus);
+        exit(1);
+    }
+
+    if (ms->cpus > 1) {
+        Error *blocker = NULL;
+        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
+        replay_add_blocker(blocker);
+    }
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
diff --git a/vl.c b/vl.c
index 4849dd465d667..843b7a9dff753 100644
--- a/vl.c
+++ b/vl.c
@@ -1222,81 +1222,41 @@ static QemuOptsList qemu_smp_opts = {
 
 static void smp_parse(QemuOpts *opts)
 {
-    if (opts) {
-        unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
-        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
-        unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
-        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
-        bool sockets_input = sockets > 0;
-
-        /* compute missing values, prefer sockets over cores over threads */
-        if (cpus == 0 || sockets == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            if (cpus == 0) {
-                cpus = cores * threads * sockets;
-            }
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = cpus / (sockets * threads);
-        } else if (threads == 0) {
-            threads = cpus / (cores * sockets);
-        } else if (sockets * cores * threads < cpus) {
-            error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) < "
-                         "smp_cpus (%u)",
-                         sockets, cores, threads, cpus);
-            exit(1);
-        }
-
-        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
-
-        if (max_cpus > MAX_CPUMASK_BITS) {
-            error_report("unsupported number of maxcpus");
-            exit(1);
-        }
-
-        if (max_cpus < cpus) {
-            error_report("maxcpus must be equal to or greater than smp");
-            exit(1);
-        }
+    Object *machine_obj = OBJECT(current_machine);
+    int sockets, cores, threads, maxcpus, cpus;
 
-        if (sockets * cores * threads > max_cpus) {
-            error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) > "
-                         "maxcpus (%u)",
-                         sockets, cores, threads, max_cpus);
-            exit(1);
-        }
+    if (!opts) {
+        return;
+    }
 
-        if (sockets_input && sockets * cores * threads != max_cpus) {
-            unsigned sockets_rounded = DIV_ROUND_UP(max_cpus, cores * threads);
+    sockets = object_property_get_int(machine_obj, "sockets", NULL);
+    cores   = object_property_get_int(machine_obj, "cores",   NULL);
+    threads = object_property_get_int(machine_obj, "threads", NULL);
+    maxcpus = object_property_get_int(machine_obj, "maxcpus", NULL);
+    cpus    = object_property_get_int(machine_obj, "cpus",    NULL);
 
-            error_report("warning: cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) != "
-                         "maxcpus (%u). Trying sockets=%u.",
-                         sockets, cores, threads, max_cpus, sockets_rounded);
-            sockets = sockets_rounded;
+    if (sockets == -1 && cores == -1 && threads == -1 &&
+        maxcpus == -1 && cpus == -1) {
 
-            if (sockets * cores * threads > max_cpus) {
-                error_report("cpu topology: "
-                             "sockets (%u) * cores (%u) * threads (%u) > "
-                             "maxcpus (%u)",
-                             sockets, cores, threads, max_cpus);
-                exit(1);
-            }
-        }
+        error_report("warning: cpu topology: "
+                     "using deprecated -smp option. "
+                     "Use machine properties instead");
 
-        smp_cpus = cpus;
-        smp_cores = cores;
-        smp_threads = threads;
-    }
+        cpus    = qemu_opt_get_number(opts, "cpus",    0);
+        sockets = qemu_opt_get_number(opts, "sockets", 0);
+        cores   = qemu_opt_get_number(opts, "cores",   0);
+        threads = qemu_opt_get_number(opts, "threads", 0);
+        maxcpus = qemu_opt_get_number(opts, "maxcpus", cpus);
 
-    if (smp_cpus > 1) {
-        Error *blocker = NULL;
-        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-        replay_add_blocker(blocker);
+        object_property_set_int(machine_obj, sockets, "sockets", NULL);
+        object_property_set_int(machine_obj, cores,   "cores",   NULL);
+        object_property_set_int(machine_obj, threads, "threads", NULL);
+        object_property_set_int(machine_obj, maxcpus, "maxcpus", NULL);
+        object_property_set_int(machine_obj, cpus,    "cpus",    NULL);
+    } else {
+        error_report("warning: cpu topology: "
+                     "both machine properties and -smp option provided. "
+                     "Ignoring the deprecated -smp option");
     }
 }
 
@@ -4106,16 +4066,6 @@ int main(int argc, char **argv, char **envp)
         data_dir[data_dir_idx++] = CONFIG_QEMU_DATADIR;
     }
 
-    smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
-
-    machine_class->max_cpus = machine_class->max_cpus ?: 1; /* Default to UP */
-    if (max_cpus > machine_class->max_cpus) {
-        error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
-                     "supported by machine '%s' (%d)", max_cpus,
-                     machine_class->name, machine_class->max_cpus);
-        exit(1);
-    }
-
     /*
      * Get the default machine options from the machine if it is not already
      * specified either by the configuration file or by the command line.
@@ -4308,6 +4258,9 @@ int main(int argc, char **argv, char **envp)
         qtest_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
+    /* smp_parse must come after qemu_opt_foreach(machine_opts, ...) */
+    smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
+
     machine_opts = qemu_get_machine_opts();
     kernel_filename = qemu_opt_get(machine_opts, "kernel");
     initrd_filename = qemu_opt_get(machine_opts, "initrd");
-- 
2.4.11

