Received: by 10.25.208.211 with SMTP id h202csp1782973lfg;
        Mon, 7 Mar 2016 23:37:01 -0800 (PST)
X-Received: by 10.140.140.196 with SMTP id 187mr34492731qhm.29.1457422621164;
        Mon, 07 Mar 2016 23:37:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si1832522qho.50.2016.03.07.23.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 23:37:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adCCS-00063U-LT
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 02:37:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adCCP-0005zp-S5
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 02:36:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adCCO-0005RX-Kv
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 02:36:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1adCCO-0005Qv-E4; Tue, 08 Mar 2016 02:36:56 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 0E760C000716;
	Tue,  8 Mar 2016 07:36:56 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-232.pek2.redhat.com [10.72.5.232])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u287aSmH024053; Tue, 8 Mar 2016 02:36:47 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Mar 2016 15:36:21 +0800
Message-Id: <1457422582-28799-3-git-send-email-peterx@redhat.com>
In-Reply-To: <1457422582-28799-1-git-send-email-peterx@redhat.com>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v4 2/3] arm: qmp: add query-gic-capabilities
	interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N7IXnl/+qSiU

This patch adds the command "query-gic-capabilities" but not implemnet
it. The command is ARM-only. Return of the command is a list of
GICCapability struct that describes all GIC versions that current QEMU
and system support.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 monitor.c            |  8 ++++++++
 qapi-schema.json     | 11 +++++++++++
 qmp-commands.hx      | 26 ++++++++++++++++++++++++++
 scripts/qapi.py      |  1 +
 target-arm/machine.c |  6 ++++++
 5 files changed, 52 insertions(+)

diff --git a/monitor.c b/monitor.c
index 73eac17..9e8cbdb 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4241,3 +4241,11 @@ void qmp_dump_skeys(const char *filename, Error **errp)
     error_setg(errp, QERR_FEATURE_DISABLED, "dump-skeys");
 }
 #endif
+
+#ifndef TARGET_ARM
+GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-gic-capabilities");
+    return NULL;
+}
+#endif
diff --git a/qapi-schema.json b/qapi-schema.json
index 0b2de6c..9c0a503 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -4157,3 +4157,14 @@
   'data': { 'version': 'int',
             'emulated': 'bool',
             'kernel': 'bool' } }
+
+##
+# @query-gic-capabilities:
+#
+# Return a list of supported GIC version capabilities.
+#
+# Returns: a list of GICCapability.
+#
+# Since: 2.6
+##
+{ 'command': 'query-gic-capabilities', 'returns': ['GICCapability'] }
diff --git a/qmp-commands.hx b/qmp-commands.hx
index 13f158d..c003838 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -4852,3 +4852,29 @@ Example:
                  {"type": 0, "out-pport": 0, "pport": 0, "vlan-id": 3840,
                   "pop-vlan": 1, "id": 251658240}
    ]}
+
+EQMP
+
+#if defined TARGET_ARM
+    {
+        .name       = "query-gic-capabilities",
+        .args_type  = "",
+        .mhandler.cmd_new = qmp_marshal_query_gic_capabilities,
+    },
+#endif
+
+SQMP
+query-gic-capabilities
+---------------
+
+Return a list of supported ARM GIC versions and their capabilities.
+
+Arguments: None
+
+Example:
+
+-> { "execute": "query-gic-capabilities" }
+<- { "return": [{ "version": 2, "emulated": true, "kernel": false },
+                { "version": 3, "emulated": false, "kernel": true } ] }
+
+EQMP
diff --git a/scripts/qapi.py b/scripts/qapi.py
index 8497777..9dc8f73 100644
--- a/scripts/qapi.py
+++ b/scripts/qapi.py
@@ -46,6 +46,7 @@ returns_whitelist = [
     'query-tpm-models',
     'query-tpm-types',
     'ringbuf-read',
+    'query-gic-capability',
 
     # From QGA:
     'guest-file-open',
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 03a73d9..813909e 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -5,6 +5,7 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "internals.h"
+#include "qmp-commands.h"
 
 static bool vfp_needed(void *opaque)
 {
@@ -345,3 +346,8 @@ const char *gicv3_class_name(void)
 
     exit(1);
 }
+
+GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
+{
+    return NULL;
+}
-- 
2.4.3

