Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641205wrg;
        Sun, 12 May 2019 01:37:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2nG4uclU1g6gF1kbZIPebWqQb2Ml8ewC42XwoUZTwbqL6mMi16lKlWVHepKEpqudzuneL
X-Received: by 2002:aed:2582:: with SMTP id x2mr18595377qtc.350.1557650230569;
        Sun, 12 May 2019 01:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650230; cv=none;
        d=google.com; s=arc-20160816;
        b=SGHxFWFfUxP7EtBblx5T7J8ItX38FWoQwkgCGkXFqnFF1BBGc+Olf7JooUpqWQZAyF
         5qaQUtIbiJSpGufjmsf9mv1cjbRsV/SWni83Z7w8Gz5MRDOemX9vpCndXtYomK9KJEEK
         S0Y2Lr9vrvS+h05xbEBgrDAD0VkayuEu7zi7YPSqARUPaIj2888194XszEqpJsQnsJk0
         KbQwLqIJRDqvwVM+ELZYb+6w9VoT74JmmKJntc5+HAPlbmyW0PR6dDWf6ccvDL3ktiTO
         8mJWl7OcjOdAbjP/6kn2yBZBdbeVmF8tjxpDHudWDbUW5nnvvY63xBjw1rFVCbP7sxGN
         IbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=M4ixteysOpeZd5KQ9DDfGpcTUxzZlR1W2JQ4rn2B2+E=;
        b=Zf/4ZY4a4JcJ5NfPY5uhjoYzltNTkFuJf+/DWUalj8yC0/WvlROqNX5B654NLX0gcw
         850wNTVJmaPN00nY07SDhqBLd0sf9zfLdDvFSfT+4JOBdzacGm1YCRB9OeU7M52AqhhU
         dK2Isu15NqIgCPIrEz6jpYCY6Nur+KNcgLrfvB66YpGsXpo+THB2fk1tOszP6f0GH5gF
         ZyoBByzJfJdIu0+E4qzGhFG4Vgj3aKjDjnzu76sV/GSEND8tkhxDe8y5THLexlmZFA1f
         PksmkjLCItpxu3+rvWGU6W/Re77uyqeNZLNNqyoqyPbqixNZacUFEcSDLkvAxgLu1BTE
         LvVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z12si3998204qtz.124.2019.05.12.01.37.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB1753092662;
	Sun, 12 May 2019 08:37:09 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5168E5D706;
	Sun, 12 May 2019 08:37:05 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 08/13] target/arm/monitor: Add query-sve-vector-lengths
Date: Sun, 12 May 2019 10:36:19 +0200
Message-Id: <20190512083624.8916-9-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sun, 12 May 2019 08:37:09 +0000 (UTC)
X-TUID: zh5zrQjBAydO

Provide a QMP interface to query the supported SVE vector lengths.
A migratable guest will need to explicitly specify a valid set of
lengths on the command line and that set can be obtained from the
list returned with this QMP command.

This patch only introduces the QMP command with the TCG implementation.
The result may not yet be correct for KVM. Following patches ensure
the KVM result is correct.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 qapi/target.json     | 34 ++++++++++++++++++++++++
 target/arm/monitor.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 tests/qmp-cmd-test.c |  1 +
 3 files changed, 97 insertions(+)

diff --git a/qapi/target.json b/qapi/target.json
index 1d4d54b6002e..ca1e85254780 100644
--- a/qapi/target.json
+++ b/qapi/target.json
@@ -397,6 +397,40 @@
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
   'if': 'defined(TARGET_ARM)' }
 
+##
+# @SVEVectorLengths:
+#
+# The struct contains a list of integers where each integer is a valid
+# SVE vector length for a KVM guest on this host. The vector lengths
+# are in quadword (128-bit) units, e.g. '4' means 512 bits (64 bytes).
+#
+# @vls:      list of vector lengths in quadwords.
+#
+# Since: 4.1
+##
+{ 'struct': 'SVEVectorLengths',
+  'data': { 'vls': ['int'] },
+  'if': 'defined(TARGET_ARM)' }
+
+##
+# @query-sve-vector-lengths:
+#
+# This command is ARM-only. It will return a list of SVEVectorLengths
+# objects. The list describes all valid SVE vector length sets.
+#
+# Returns: a list of SVEVectorLengths objects
+#
+# Since: 4.1
+#
+# -> { "execute": "query-sve-vector-lengths" }
+# <- { "return": [ { "vls": [ 1 ] },
+#                  { "vls": [ 1, 2 ] },
+#                  { "vls": [ 1, 2, 4 ] } ] }
+#
+##
+{ 'command': 'query-sve-vector-lengths', 'returns': ['SVEVectorLengths'],
+  'if': 'defined(TARGET_ARM)' }
+
 ##
 # @CpuModelExpansionInfo:
 #
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 41b32b94b258..8b2afa255c92 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -24,6 +24,7 @@
 #include "hw/boards.h"
 #include "kvm_arm.h"
 #include "qapi/qapi-commands-target.h"
+#include "monitor/hmp-target.h"
 
 static GICCapability *gic_cap_new(int version)
 {
@@ -82,3 +83,64 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 
     return head;
 }
+
+static SVEVectorLengths *qmp_sve_vls_get(void)
+{
+    CPUArchState *env = mon_get_cpu_env();
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    SVEVectorLengths *vls = g_new(SVEVectorLengths, 1);
+    intList **v = &vls->vls;
+    int i;
+
+    if (cpu->sve_max_vq == 0) {
+        *v = g_new0(intList, 1); /* one vl of 0 means none supported */
+        return vls;
+    }
+
+    for (i = 1; i <= cpu->sve_max_vq; ++i) {
+        *v = g_new0(intList, 1);
+        (*v)->value = i;
+        v = &(*v)->next;
+    }
+
+    return vls;
+}
+
+static SVEVectorLengths *qmp_sve_vls_dup_and_truncate(SVEVectorLengths *vls)
+{
+    SVEVectorLengths *trunc_vls;
+    intList **v, *p = vls->vls;
+
+    if (!p->next) {
+        return NULL;
+    }
+
+    trunc_vls = g_new(SVEVectorLengths, 1);
+    v = &trunc_vls->vls;
+
+    for (; p->next; p = p->next) {
+        *v = g_new0(intList, 1);
+        (*v)->value = p->value;
+        v = &(*v)->next;
+    }
+
+    return trunc_vls;
+}
+
+SVEVectorLengthsList *qmp_query_sve_vector_lengths(Error **errp)
+{
+    SVEVectorLengthsList *vls_list = g_new0(SVEVectorLengthsList, 1);
+    SVEVectorLengths *vls = qmp_sve_vls_get();
+
+    while (vls) {
+        vls_list->value = vls;
+        vls = qmp_sve_vls_dup_and_truncate(vls);
+        if (vls) {
+            SVEVectorLengthsList *next = vls_list;
+            vls_list = g_new0(SVEVectorLengthsList, 1);
+            vls_list->next = next;
+        }
+    }
+
+    return vls_list;
+}
diff --git a/tests/qmp-cmd-test.c b/tests/qmp-cmd-test.c
index 9f5228cd9951..3d714dbc6a4a 100644
--- a/tests/qmp-cmd-test.c
+++ b/tests/qmp-cmd-test.c
@@ -90,6 +90,7 @@ static bool query_is_blacklisted(const char *cmd)
         /* Success depends on target arch: */
         "query-cpu-definitions",  /* arm, i386, ppc, s390x */
         "query-gic-capabilities", /* arm */
+        "query-sve-vector-lengths", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
         /* Success depends on launching SEV guest */
-- 
2.20.1
