Received: by 10.25.208.211 with SMTP id h202csp2571513lfg;
        Thu, 3 Mar 2016 00:23:19 -0800 (PST)
X-Received: by 10.140.161.198 with SMTP id h189mr1558251qhh.24.1456993399037;
        Thu, 03 Mar 2016 00:23:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o101si40117946qge.95.2016.03.03.00.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 00:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abOXW-0003ij-Gv
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 03:23:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOWD-0001nD-Hu
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOWC-0001ml-4T
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:21:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35423)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1abOW7-0001k3-NM; Thu, 03 Mar 2016 03:21:51 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 63A95C00070E;
	Thu,  3 Mar 2016 08:21:51 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-147.pek2.redhat.com [10.72.5.147])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u238LKKh010446; Thu, 3 Mar 2016 03:21:42 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 Mar 2016 16:21:11 +0800
Message-Id: <1456993272-32292-3-git-send-email-peterx@redhat.com>
In-Reply-To: <1456993272-32292-1-git-send-email-peterx@redhat.com>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	Peter Xu <peterx@redhat.com>, abologna@redhat.com, qemu-arm@nongnu.org
Subject: [Qemu-devel] [PATCH v2 2/3] arm: qmp: add query-gic-capability
	interface
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ygnc64eEN51O

This implement the command "query-gic-capability" but not implemnet
it. The command is ARM-only. Return of the command is a list of
GICCapability struct that describes all GIC versions that current
QEMU and system support.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 monitor.c            |  8 ++++++++
 qapi-schema.json     | 11 +++++++++++
 qmp-commands.hx      | 26 ++++++++++++++++++++++++++
 scripts/qapi.py      |  1 +
 target-arm/machine.c |  7 +++++++
 5 files changed, 53 insertions(+)

diff --git a/monitor.c b/monitor.c
index 73eac17..3b34feb 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4241,3 +4241,11 @@ void qmp_dump_skeys(const char *filename, Error **errp)
     error_setg(errp, QERR_FEATURE_DISABLED, "dump-skeys");
 }
 #endif
+
+#ifndef TARGET_ARM
+GICCapabilityList *qmp_query_gic_capability(Error **errp)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-gic-capability");
+    return NULL;
+}
+#endif
diff --git a/qapi-schema.json b/qapi-schema.json
index 0b2de6c..f42c8f7 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -4157,3 +4157,14 @@
   'data': { 'version': 'int',
             'emulated': 'bool',
             'kernel': 'bool' } }
+
+##
+# @query-gic-capability:
+#
+# Return a list of supported GIC version capabilities.
+#
+# Returns: a list of GICCapability.
+#
+# Since: 2.6
+##
+{ 'command': 'query-gic-capability', 'returns': ['GICCapability'] }
diff --git a/qmp-commands.hx b/qmp-commands.hx
index 13f158d..5e843f2 100644
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
+        .name       = "query-gic-capability",
+        .args_type  = "",
+        .mhandler.cmd_new = qmp_marshal_query_gic_capability,
+    },
+#endif
+
+SQMP
+query-gic-capability
+---------------
+
+Return a list of supported ARM GIC versions and their capabilities.
+
+Arguments: None
+
+Example:
+
+-> { "execute": "query-gic-capability" }
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
index 03a73d9..b3fa64c 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -345,3 +345,10 @@ const char *gicv3_class_name(void)
 
     exit(1);
 }
+
+GICCapabilityList *qmp_query_gic_capability(Error **errp);
+
+GICCapabilityList *qmp_query_gic_capability(Error **errp)
+{
+    return NULL;
+}
-- 
2.4.3

