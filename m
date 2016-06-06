Received: by 10.25.27.66 with SMTP id b63csp1567263lfb;
        Mon, 6 Jun 2016 09:06:09 -0700 (PDT)
X-Received: by 10.237.33.237 with SMTP id m42mr17207265qtc.9.1465229169840;
        Mon, 06 Jun 2016 09:06:09 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c17si11363455qkj.139.2016.06.06.09.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 09:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9x2X-0001t4-5c
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 12:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wHN-0000iP-9F
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wHK-00070e-Ml
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wHC-0006zJ-09; Mon, 06 Jun 2016 11:17:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A06C6C04D2EC;
	Mon,  6 Jun 2016 15:17:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtn3013155; Mon, 6 Jun 2016 11:17:12 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:50 +0200
Message-Id: <1465226212-254093-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 06 Jun 2016 15:17:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 08/10] cpu: use CPUClass->parse_features() as
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
X-TUID: vHSNRwOLAMJ8

Currently CPUClass->parse_features() is used to parse
-cpu features string and set properties on created CPU
instances.

But considering that features specified by -cpu apply to
every created CPU instance, it doesn't make sence to
parse the same features string for every CPU created.
It also makes every target that cares about parsing
features string explicitly call CPUClass->parse_features()
parser, which gets in a way if we consider using
generic device_add for CPU hotplug as device_add
has not a clue about CPU specific hooks.

Turns out we can use global properties mechanism to set
properties on every created CPU instance for a given
type. That way it's possible to convert CPU features
into a set of global properties for CPU type specified
by -cpu cpu_model and common Device.device_post_init()
will apply them to CPU of given type automatically
regardless whether it's manually created CPU or CPU
created with help of device_add.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
This patch only make CPUClass->parse_features()
a global properties convertor and follow up patches
will switch individual users to new behaviour
---
 hw/arm/virt.c     |  7 ++++---
 include/qom/cpu.h |  2 +-
 qom/cpu.c         | 29 +++++++++++++++++------------
 target-i386/cpu.c | 30 ++++++++++++++++++++----------
 4 files changed, 42 insertions(+), 26 deletions(-)

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
index 31e5e6f..43b22e6 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1950,12 +1950,16 @@ static FeatureWordArray minus_features = { 0 };
 
 /* Parse "+feature,-feature,feature=foo" CPU feature string
  */
-static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
+static void x86_cpu_parse_featurestr(const char *typename, char *features,
                                      Error **errp)
 {
-    X86CPU *cpu = X86_CPU(cs);
     char *featurestr; /* Single 'key=value" string being parsed */
     Error *local_err = NULL;
+    static bool cpu_globals_initialized;
+
+    if (cpu_globals_initialized) {
+        return;
+    }
 
     if (!features) {
         return;
@@ -1967,6 +1971,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         const char *name;
         const char *val = NULL;
         char *eq = NULL;
+        GlobalProperty *prop;
 
         /* Compatibility syntax: */
         if (featurestr[0] == '+') {
@@ -2019,12 +2024,14 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
             name = "tsc-frequency";
         }
 
-        object_property_parse(OBJECT(cpu), val, name, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
+        prop = g_new0(typeof(*prop), 1);
+        prop->driver = typename;
+        prop->property = g_strdup(name);
+        prop->value = g_strdup(val);
+        qdev_prop_register_global(prop);
     }
+
+    cpu_globals_initialized = true;
 }
 
 /* Print all cpuid feature names in featureset
@@ -2208,9 +2215,11 @@ X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
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
@@ -2225,10 +2234,11 @@ X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
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

