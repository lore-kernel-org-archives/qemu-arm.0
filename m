Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp848838wrg;
        Fri, 21 Jun 2019 09:34:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkPRSl7wXWu3FLuKbMzDXCooK+fcMTS/qhay5Rlye7n/rneyQ0YJyz7HhqKKIGv7EskLFk
X-Received: by 2002:ac8:3613:: with SMTP id m19mr116272518qtb.193.1561134881947;
        Fri, 21 Jun 2019 09:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134881; cv=none;
        d=google.com; s=arc-20160816;
        b=Xg6KDFmMzg1o0aLA2n11DL4INNnHKfLFOJH61uQx/Xc59HT44UPaJKtvsyoO9sHmYJ
         HhlqRpG1kC1fJY4jSyXuFIABQfGrXo36tF+MvBnixzq0+0NNafKkcEHHe/nQUReL8FmO
         bDYEEDZpDmKFNa0WIuGTxOBCVx6s8dW8UuRVYsXPSlVoSVsb9FP5W+86oFS4EZgaR39x
         XoPE9u4Mcm6OARLBY7wDJ6xTRIGSB6oW292DpAWWqj3Nah7rIqpcvpMIv7kYJuJIVHYt
         RvPMCp59VrstJGHNaGgHJ7syayCenA1VkCCRiQdHaHRhXFkS2Gc5WV/RyGInV2eCXMa4
         Hv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+pdHs5o0LWeQnQXVvwdf0mdVr4GfmJsX0ShNWYIDjY0=;
        b=L1Y5Zw3OUS4zjTbdGcK3GBQYcyy7clNb++f3ATcBFw3jGW6CGoY/SAmVO6QoPOvFBn
         XAfayQVLWZe7Ab4M0+0aun+i7DitW66fvfXCewakevZ2gfb8rq/yQruOzQVi6zZtPUzM
         VQqqrc9qoMpu2WdGVNE0ktL2Suo+fe/86SKzgTKcW6zduwRO1E84pasO2UCIpsNqMQQV
         Iq4S3woTI63N7wft44XOwhUb2UGU+fTP2JZ8M+NDGB6bHRZCEoXFRrZsbPpAlKrDpbVS
         0zg2m5IV/sioneuciKRSHGY3AjUlVfCEKBMsuGtVHJ7JKmEQU3ru+KYdPJOJauwEXOlc
         dLgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m1si2050865qvn.187.2019.06.21.09.34.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7530C1EB219;
	Fri, 21 Jun 2019 16:34:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78F561001DD9;
	Fri, 21 Jun 2019 16:34:38 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v2 03/14] target/arm/monitor: Introduce qmp_query_cpu_model_expansion
Date: Fri, 21 Jun 2019 18:34:11 +0200
Message-Id: <20190621163422.6127-4-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 21 Jun 2019 16:34:41 +0000 (UTC)
X-TUID: saO34kQXI6Dn

Add support for the query-cpu-model-expansion QMP command to Arm. We
do this selectively, only exposing CPU properties which represent
optional CPU features which the user may want to enable/disable. Also,
for simplicity, we restrict the list of queryable cpu models to 'max',
'host', or the current type when KVM is in use, even though there
may exist KVM hosts where other types would also work. For example on a
seattle you could use 'host' for the current type, but then attempt to
query 'cortex-a57', which is also a valid CPU type to use with KVM on
seattle hosts, but that query will fail with our simplifications. This
shouldn't be an issue though as management layers and users have been
preferring the 'host' CPU type for use with KVM for quite some time.
Additionally, if the KVM-enabled QEMU instance running on a seattle
host is using the cortex-a57 CPU type, then querying 'cortex-a57' will
work. Finally, we only implement expansion type 'full', as Arm does not
yet have a "base" CPU type. Below are some example calls and results
(to save character clutter they're not in json, but are still json-ish
to give the idea)

 # expand the 'max' CPU model
 query-cpu-model-expansion: type:full, model:{ name:max }

 return: model:{ name:max, props:{ 'aarch64': true, 'pmu': true }}

 # attempt to expand the 'max' CPU model with pmu=off
 query-cpu-model-expansion:
   type:full, model:{ name:max, props:{ 'pmu': false }}

 return: model:{ name:max, props:{ 'aarch64': true, 'pmu': false }}

 # attempt to expand the 'max' CPU model with aarch64=off
 query-cpu-model-expansion:
   type:full, model:{ name:max, props:{ 'aarch64': false }}

 error: "'aarch64' feature cannot be disabled unless KVM is enabled
         and 32-bit EL1 is supported"

In the last example KVM was not in use so an error was returned.

Note1: It's possible for features to have dependencies on other
features. I.e. it may be possible to change one feature at a time
without error, but when attempting to change all features at once
an error could occur depending on the order they are processed. It's
also possible changing all at once doesn't generate an error, because
a feature's dependencies are satisfied with other features, but the
same feature cannot be changed independently without error. For these
reasons callers should always attempt to make their desired changes
all at once in order to ensure the collection is valid.

Note2: Certainly more features may be added to the list of
advertised features, e.g. 'vfp' and 'neon'. The only requirement
is that their property set accessors fail when invalid
configurations are detected. For vfp we would need something like

 set_vfp()
 {
   if (arm_feature(env, ARM_FEATURE_AARCH64) &&
       cpu->has_vfp != cpu->has_neon)
       error("AArch64 CPUs must have both VFP and Neon or neither")

in its set accessor, and the same for neon, rather than doing that
check at realize time, which isn't executed at qmp query time.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 qapi/target.json     |   6 +-
 target/arm/monitor.c | 132 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+), 3 deletions(-)

diff --git a/qapi/target.json b/qapi/target.json
index 1d4d54b6002e..edfa2f82b916 100644
--- a/qapi/target.json
+++ b/qapi/target.json
@@ -408,7 +408,7 @@
 ##
 { 'struct': 'CpuModelExpansionInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
 
 ##
 # @query-cpu-model-expansion:
@@ -433,7 +433,7 @@
 #   query-cpu-model-expansion while using these is not advised.
 #
 # Some architectures may not support all expansion types. s390x supports
-# "full" and "static".
+# "full" and "static". Arm only supports "full".
 #
 # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
 #          not supported, if the model cannot be expanded, if the model contains
@@ -447,7 +447,7 @@
   'data': { 'type': 'CpuModelExpansionType',
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
 
 ##
 # @CpuDefinitionInfo:
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 41b32b94b258..19e3120eef95 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -23,7 +23,13 @@
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-commands-target.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qdict.h"
+#include "qom/qom-qobject.h"
 
 static GICCapability *gic_cap_new(int version)
 {
@@ -82,3 +88,129 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 
     return head;
 }
+
+static const char *cpu_model_advertised_features[] = {
+    "aarch64", "pmu",
+    NULL
+};
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
+                                                     CpuModelInfo *model,
+                                                     Error **errp)
+{
+    CpuModelExpansionInfo *expansion_info;
+    const QDict *qdict_in = NULL;
+    QDict *qdict_out;
+    ObjectClass *oc;
+    Object *obj;
+    const char *name;
+    int i;
+
+    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
+        error_setg(errp, "The requested expansion type is not supported.");
+        return NULL;
+    }
+
+    if (!kvm_enabled() && !strcmp(model->name, "host")) {
+        error_setg(errp, "The CPU definition '%s' requires KVM", model->name);
+        return NULL;
+    }
+
+    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
+    if (!oc) {
+        error_setg(errp, "The CPU definition '%s' is unknown.", model->name);
+        return NULL;
+    }
+
+    if (kvm_enabled()) {
+        const char *cpu_type = current_machine->cpu_type;
+        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
+        bool supported = false;
+
+        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
+            /* These are kvmarm's recommended cpu types */
+            supported = true;
+        } else if (strlen(model->name) == len &&
+                   !strncmp(model->name, cpu_type, len)) {
+            /* KVM is enabled and we're using this type, so it works. */
+            supported = true;
+        }
+        if (!supported) {
+            error_setg(errp, "The CPU definition '%s' cannot "
+                             "be used with KVM on this host", model->name);
+            return NULL;
+        }
+    }
+
+    if (model->props) {
+        qdict_in = qobject_to(QDict, model->props);
+        if (!qdict_in) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
+            return NULL;
+        }
+    }
+
+    obj = object_new(object_class_get_name(oc));
+
+    if (qdict_in) {
+        Visitor *visitor;
+
+        visitor = qobject_input_visitor_new(model->props);
+        visit_start_struct(visitor, NULL, NULL, 0, errp);
+        if (*errp) {
+            object_unref(obj);
+            return NULL;
+        }
+
+        i = 0;
+        while ((name = cpu_model_advertised_features[i++]) != NULL) {
+            if (qdict_get(qdict_in, name)) {
+                object_property_set(obj, visitor, name, errp);
+                if (*errp) {
+                    break;
+                }
+            }
+        }
+
+        if (!*errp) {
+            visit_check_struct(visitor, errp);
+        }
+        visit_end_struct(visitor, NULL);
+        visit_free(visitor);
+        if (*errp) {
+            object_unref(obj);
+            return NULL;
+        }
+    }
+
+    expansion_info = g_new0(CpuModelExpansionInfo, 1);
+    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
+    expansion_info->model->name = g_strdup(model->name);
+
+    qdict_out = qdict_new();
+
+    i = 0;
+    while ((name = cpu_model_advertised_features[i++]) != NULL) {
+        ObjectProperty *prop = object_property_find(obj, name, NULL);
+        if (prop) {
+            QObject *value;
+
+            assert(prop->get);
+            value = object_property_get_qobject(obj, name, errp);
+            assert(!*errp);
+
+            qdict_put_obj(qdict_out, name, value);
+        }
+    }
+
+    if (!qdict_size(qdict_out)) {
+        qobject_unref(qdict_out);
+    } else {
+        expansion_info->model->props = QOBJECT(qdict_out);
+        expansion_info->model->has_props = true;
+    }
+
+    object_unref(obj);
+
+    return expansion_info;
+}
-- 
2.20.1
