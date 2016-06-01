Received: by 10.25.27.66 with SMTP id b63csp276717lfb;
        Wed, 1 Jun 2016 09:50:46 -0700 (PDT)
X-Received: by 10.200.50.100 with SMTP id y33mr4616909qta.39.1464799846819;
        Wed, 01 Jun 2016 09:50:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185si35359503qkc.16.2016.06.01.09.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b89Ly-00070P-96
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:50:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899c-0005Zh-0l
	for qemu-devel@nongnu.org; Wed, 01 Jun 2016 12:38:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899Y-0007wS-9K
	for qemu-devel@nongnu.org; Wed, 01 Jun 2016 12:37:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899P-0007tf-WF; Wed, 01 Jun 2016 12:37:48 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A506214BA;
	Wed,  1 Jun 2016 16:37:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqi025067; Wed, 1 Jun 2016 12:37:45 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:28 +0200
Message-Id: <1464799050-11002-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 01 Jun 2016 16:37:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RFC 6/8] cpu: use CPUClass->parse_features() as
 convertor to global properties
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
X-TUID: bpS5a7VoSCAt

Currently CPUClass->parse_features() is used to parse
-cpu features string and set properties on created CPU
instances.

But considering that features specified -cpu apply to
every created CPU instance, it doesn't make sence to
parse the same features string for every CPU created.
It also makes every target that cares about parsing
features string explicitly call CPUClass->parse_features()
parser, which gets in a way if we consider using
generic device_add for CPU hotplug as device_add
has not a clue about CPU specific hooks.

Turns out we can use global properties mechanism to set
properties on every created Device instance for a given
type. That way it's possible to convert CPU features
into a set of global properties for specified by
 -cpu cpu_model and common Device.device_post_init()
will apply them to every cpu model model automaticaaly
regardless whether it's manually created CPU or CPU
created with help of device_add.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
This patch only make CPUClass->parse_features()
a global properties convertor and follow up patches
will do cleanups that new behaviour allows.
---
 hw/arm/virt.c     |  7 ++++---
 include/qom/cpu.h |  2 +-
 qom/cpu.c         | 29 +++++++++++++++++------------
 target-i386/cpu.c | 25 +++++++++++++++++++------
 4 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e77ed88..473e439 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1193,6 +1193,7 @@ static void machvirt_init(MachineState *machine)
 
     for (n = 0; n < smp_cpus; n++) {
         ObjectClass *oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
+        const char *typename = object_class_get_name(oc);
         CPUClass *cc = CPU_CLASS(oc);
         Object *cpuobj;
         Error *err = NULL;
@@ -1202,10 +1203,10 @@ static void machvirt_init(MachineState *machine)
             error_report("Unable to find CPU definition");
             exit(1);
         }
-        cpuobj = object_new(object_class_get_name(oc));
+        /* convert -smp CPU options specified by the user into global props */
+        cc->parse_features(typename, cpuopts, &err);
+        cpuobj = object_new(typename);
 
-        /* Handle any CPU options specified by the user */
-        cc->parse_features(CPU(cpuobj), cpuopts, &err);
         g_free(cpuopts);
         if (err) {
             error_report_err(err);
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 32f3af3..cacb100 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -134,7 +134,7 @@ typedef struct CPUClass {
     /*< public >*/
 
     ObjectClass *(*class_by_name)(const char *cpu_model);
-    void (*parse_features)(CPUState *cpu, char *str, Error **errp);
+    void (*parse_features)(const char *typename, char *str, Error **errp);
 
     void (*reset)(CPUState *cpu);
     int reset_dump_flags;
diff --git a/qom/cpu.c b/qom/cpu.c
index 751e992..f3e3c02 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -28,6 +28,7 @@
 #include "exec/log.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-properties.h"
 
 bool cpu_exists(int64_t id)
 {
@@ -46,7 +47,7 @@ bool cpu_exists(int64_t id)
 CPUState *cpu_generic_init(const char *typename, const char *cpu_model)
 {
     char *str, *name, *featurestr;
-    CPUState *cpu;
+    CPUState *cpu = NULL;
     ObjectClass *oc;
     CPUClass *cc;
     Error *err = NULL;
@@ -60,16 +61,15 @@ CPUState *cpu_generic_init(const char *typename, const char *cpu_model)
         return NULL;
     }
 
-    cpu = CPU(object_new(object_class_get_name(oc)));
-    cc = CPU_GET_CLASS(cpu);
-
+    cc = CPU_CLASS(oc);
     featurestr = strtok(NULL, ",");
-    cc->parse_features(cpu, featurestr, &err);
+    cc->parse_features(object_class_get_name(oc), featurestr, &err);
     g_free(str);
     if (err != NULL) {
         goto out;
     }
 
+    cpu = CPU(object_new(object_class_get_name(oc)));
     object_property_set_bool(OBJECT(cpu), true, "realized", &err);
 
 out:
@@ -282,25 +282,29 @@ static ObjectClass *cpu_common_class_by_name(const char *cpu_model)
     return NULL;
 }
 
-static void cpu_common_parse_features(CPUState *cpu, char *features,
+static void cpu_common_parse_features(const char *typename, char *features,
                                       Error **errp)
 {
     char *featurestr; /* Single "key=value" string being parsed */
     char *val;
-    Error *err = NULL;
+    static bool cpu_globals_initialized;
+
+    if (cpu_globals_initialized) {
+        return;
+    }
 
     featurestr = features ? strtok(features, ",") : NULL;
 
     while (featurestr) {
         val = strchr(featurestr, '=');
         if (val) {
+            GlobalProperty *prop = g_new0(typeof(*prop), 1);
             *val = 0;
             val++;
-            object_property_parse(OBJECT(cpu), val, featurestr, &err);
-            if (err) {
-                error_propagate(errp, err);
-                return;
-            }
+            prop->driver = typename;
+            prop->property = g_strdup(featurestr);
+            prop->value = g_strdup(val);
+            qdev_prop_register_global(prop);
         } else {
             error_setg(errp, "Expected key=value format, found %s.",
                        featurestr);
@@ -308,6 +312,7 @@ static void cpu_common_parse_features(CPUState *cpu, char *features,
         }
         featurestr = strtok(NULL, ",");
     }
+    cpu_globals_initialized = true;
 }
 
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 618aef9..871175a 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1939,16 +1939,20 @@ static FeatureWordArray minus_features = { 0 };
 
 /* Parse "+feature,-feature,feature=foo" CPU feature string
  */
-static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
+static void x86_cpu_parse_featurestr(const char *typename, char *features,
                                      Error **errp)
 {
-    X86CPU *cpu = X86_CPU(cs);
     char *featurestr; /* Single 'key=value" string being parsed */
     uint32_t numvalue;
     char num[32];
     const char *name;
     char *err;
     Error *local_err = NULL;
+    static bool cpu_globals_initialized;
+
+    if (cpu_globals_initialized) {
+        return;
+    }
 
     featurestr = features ? strtok(features, ",") : NULL;
 
@@ -2011,7 +2015,11 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         }
 
         if (val) {
-            object_property_parse(OBJECT(cpu), val, name, &local_err);
+            GlobalProperty *prop = g_new0(typeof(*prop), 1);
+            prop->driver = typename;
+            prop->property = g_strdup(name);
+            prop->value = g_strdup(val);
+            qdev_prop_register_global(prop);
         }
 
         if (local_err) {
@@ -2020,6 +2028,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         }
         featurestr = strtok(NULL, ",");
     }
+
+    cpu_globals_initialized = true;
 }
 
 /* Print all cpuid feature names in featureset
@@ -2203,9 +2213,11 @@ X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
 {
     X86CPU *cpu = NULL;
     ObjectClass *oc;
+    CPUClass *cc;
     gchar **model_pieces;
     char *name, *features;
     Error *error = NULL;
+    const char *typename;
 
     model_pieces = g_strsplit(cpu_model, ",", 2);
     if (!model_pieces[0]) {
@@ -2220,10 +2232,11 @@ X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
         error_setg(&error, "Unable to find CPU definition: %s", name);
         goto out;
     }
+    cc = CPU_CLASS(oc);
+    typename = object_class_get_name(oc);
 
-    cpu = X86_CPU(object_new(object_class_get_name(oc)));
-
-    x86_cpu_parse_featurestr(CPU(cpu), features, &error);
+    cc->parse_features(typename, features, &error);
+    cpu = X86_CPU(object_new(typename));
     if (error) {
         goto out;
     }
-- 
1.8.3.1

