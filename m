Received: by 10.25.85.209 with SMTP id j200csp107228lfb;
        Fri, 10 Jun 2016 10:58:37 -0700 (PDT)
X-Received: by 10.55.43.81 with SMTP id r78mr3347389qkh.50.1465581517312;
        Fri, 10 Jun 2016 10:58:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si6932264qgf.70.2016.06.10.10.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQhY-0005E6-Nr
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:58:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQQ-0006Q9-0H
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQI-0000NS-S8
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQI-0000NN-Ji; Fri, 10 Jun 2016 13:40:46 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2407383F45;
	Fri, 10 Jun 2016 17:40:46 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPW032552; Fri, 10 Jun 2016 13:40:43 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:16 +0200
Message-Id: <1465580427-13596-6-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 10 Jun 2016 17:40:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 05/16] hw/core/machine: add smp properites
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
X-TUID: k7l1pHvBY883

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c   | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h |  6 ++++
 2 files changed, 87 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3dce9020e510a..2625044002e57 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -172,6 +172,53 @@ static void machine_set_dumpdtb(Object *obj, const char *value, Error **errp)
     ms->dumpdtb = g_strdup(value);
 }
 
+static void machine_get_smp(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    int64_t value;
+
+    if (strncmp(name, "sockets", 7) == 0) {
+        value = ms->sockets;
+    } else if (strncmp(name, "cores", 5) == 0) {
+        value = ms->cores;
+    } else if (strncmp(name, "threads", 7) == 0) {
+        value = ms->threads;
+    } else if (strncmp(name, "maxcpus", 7) == 0) {
+        value = ms->maxcpus;
+    } else if (strncmp(name, "cpus", 4) == 0) {
+        value = ms->cpus;
+    }
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void machine_set_smp(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    Error *error = NULL;
+    int64_t value;
+
+    visit_type_int(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    if (strncmp(name, "sockets", 7) == 0) {
+        ms->sockets = value;
+    } else if (strncmp(name, "cores", 5) == 0) {
+        ms->cores = value;;
+    } else if (strncmp(name, "threads", 7) == 0) {
+        ms->threads = value;
+    } else if (strncmp(name, "maxcpus", 7) == 0) {
+        ms->maxcpus = value;
+    } else if (strncmp(name, "cpus", 4) == 0) {
+        ms->cpus = value;
+    }
+}
+
 static void machine_get_phandle_start(Object *obj, Visitor *v,
                                       const char *name, void *opaque,
                                       Error **errp)
@@ -368,8 +415,18 @@ static void machine_init_notify(Notifier *notifier, void *data)
     foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
 }
 
+static void machine_set_smp_parameters(MachineState *ms)
+{
+    if (ms->sockets != -1 || ms->cores != -1 || ms->threads != -1 ||
+        ms->maxcpus != -1 || ms->cpus != -1) {
+        error_report("warning: cpu topology: "
+                     "machine properties currently ignored");
+    }
+}
+
 static void machine_pre_init(MachineState *ms)
 {
+    machine_set_smp_parameters(ms);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
@@ -403,6 +460,11 @@ static void machine_initfn(Object *obj)
     ms->dump_guest_core = true;
     ms->mem_merge = true;
     ms->enable_graphics = true;
+    ms->sockets = -1;
+    ms->cores = -1;
+    ms->threads = -1;
+    ms->maxcpus = -1;
+    ms->cpus = -1;
 
     object_property_add_str(obj, "accel",
                             machine_get_accel, machine_set_accel, NULL);
@@ -462,6 +524,25 @@ static void machine_initfn(Object *obj)
     object_property_set_description(obj, "dt-compatible",
                                     "Overrides the \"compatible\" property of the dt root node",
                                     NULL);
+    object_property_add(obj, "sockets", "int", machine_get_smp,
+                        machine_set_smp, NULL, NULL, NULL);
+    object_property_set_description(obj, "sockets", "Number of sockets", NULL);
+    object_property_add(obj, "cores", "int", machine_get_smp,
+                        machine_set_smp, NULL, NULL, NULL);
+    object_property_set_description(obj, "cores",
+                                    "Number of cores per socket", NULL);
+    object_property_add(obj, "threads", "int", machine_get_smp,
+                        machine_set_smp, NULL, NULL, NULL);
+    object_property_set_description(obj, "threads",
+                                    "Number of threads per core", NULL);
+    object_property_add(obj, "maxcpus", "int", machine_get_smp,
+                        machine_set_smp, NULL, NULL, NULL);
+    object_property_set_description(obj, "maxcpus", "Maximum number of cpus",
+                                    NULL);
+    object_property_add(obj, "cpus", "int", machine_get_smp,
+                        machine_set_smp, NULL, NULL, NULL);
+    object_property_set_description(obj, "cpus", "Number of online cpus",
+                                    NULL);
     object_property_add_bool(obj, "dump-guest-core",
                              machine_get_dump_guest_core,
                              machine_set_dump_guest_core,
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4e8dc68b07a24..53adbfe2a3099 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -166,6 +166,12 @@ struct MachineState {
     char *initrd_filename;
     const char *cpu_model;
     AccelState *accelerator;
+
+    int sockets;
+    int cores;
+    int threads;
+    int maxcpus;
+    int cpus;
 };
 
 #define DEFINE_MACHINE(namestr, machine_initfn) \
-- 
2.4.11

