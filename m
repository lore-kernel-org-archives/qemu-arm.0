Received: by 10.28.173.206 with SMTP id w197csp1079526wme;
        Thu, 11 Jan 2018 14:13:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBou7orF8GbEW6kZLTPhmsqlNeJzpztfGYZ2TUwbBMJq7ZNs1to/0gCBXLmV7N1HyFqaxUOfl
X-Received: by 10.129.28.207 with SMTP id c198mr1573301ywc.426.1515708816755;
        Thu, 11 Jan 2018 14:13:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515708816; cv=none;
        d=google.com; s=arc-20160816;
        b=WyvuKYctObPKq3zqVceVGqru2tKG6okErm+VRZsjFrI784sf3fUxZzZQhinwDxQsum
         5KMOnS9ZNtmGMxyTdKlZJvOS5C/F2ePbDWQpAXvn3vok2sn2q+fgMQtmV7jOwNvtjVPt
         PMwjHxSvN7A6t0rs13MxOIdxjc+9HARFTbiec0aALmNUofW9Dwf/wlVlRPj4lNVCejfs
         5CKye+rO8jUVauvSPvr4iVjKtgNV66TKMDS/Q0cBnpgOWiaqmqGDS4k3w7lMswGvMyzn
         +U1sPfazyj6oeT8VEpu3lL22lntHA9EHiHm/YBNo0jANkr/JQ1q4w0Gahyr8vCGdY31u
         7/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=EEkMcl9BZm+4JyhgSfHlKMq9svl+DQFxxNuwpbIqkNo=;
        b=MninRW2vcqkzB83b/LELu4wbzPsv/fSY9lBu8XpsKQunw+IG7eUjwyTLDOJeDE+w4d
         +3Kp6qVZMjtEwr07QwCpE3nyp+iJUS9lj5/jiTo+ivpu3NkNsAoKEzWSFT3mVr4a+/qZ
         R/xyfqNxDgIg/faDzwpat1L4lvY3jLZfoVeSSyO8UJsjZJr65nprrthM4tP5O9XIQ4qL
         vT/TUUIXFLCIjFwdLGqLAMOrVQMEL9+vwQUYKK7wrZiurEd+NWeV2D1VzFDZnFyYcoo+
         6sTW6ZTUQYJYdfUHulSQ/AH8VwgCbkLuHNEyk8mVP0y4zdxW82Z/IfPSHp1udI7ujgOQ
         uhpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r15si1904906ywg.614.2018.01.11.14.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 14:13:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZl6O-0006mC-67
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 17:13:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1eZkXd-00008x-Uu
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 16:37:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1eZkXa-0007EH-7t
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 16:37:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1eZkXW-00075h-3E; Thu, 11 Jan 2018 16:37:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AAE2DF3E;
	Thu, 11 Jan 2018 21:37:33 +0000 (UTC)
Received: from localhost (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87C2E60C4B;
	Thu, 11 Jan 2018 21:37:32 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jan 2018 22:32:47 +0100
Message-Id: <20180111213250.16511-49-marcandre.lureau@redhat.com>
In-Reply-To: <20180111213250.16511-1-marcandre.lureau@redhat.com>
References: <20180111213250.16511-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 11 Jan 2018 21:37:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 48/51] qapi: make query-gic-capabilities
 depend on TARGET_ARM
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yi7Cdl89BNs0

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qapi-schema.json     | 43 -------------------------------------------
 qapi/target.json     | 45 +++++++++++++++++++++++++++++++++++++++++++++
 monitor.c            | 11 -----------
 target/arm/monitor.c |  2 +-
 4 files changed, 46 insertions(+), 55 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index ee9b2f53ff..f444e684c0 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -2899,49 +2899,6 @@
 ##
 { 'command': 'xen-load-devices-state', 'data': {'filename': 'str'} }
=20
-##
-# @GICCapability:
-#
-# The struct describes capability for a specific GIC (Generic
-# Interrupt Controller) version. These bits are not only decided by
-# QEMU/KVM software version, but also decided by the hardware that
-# the program is running upon.
-#
-# @version:  version of GIC to be described. Currently, only 2 and 3
-#            are supported.
-#
-# @emulated: whether current QEMU/hardware supports emulated GIC
-#            device in user space.
-#
-# @kernel:   whether current QEMU/hardware supports hardware
-#            accelerated GIC device in kernel.
-#
-# Since: 2.6
-##
-{ 'struct': 'GICCapability',
-  'data': { 'version': 'int',
-            'emulated': 'bool',
-            'kernel': 'bool' } }
-
-##
-# @query-gic-capabilities:
-#
-# This command is ARM-only. It will return a list of GICCapability
-# objects that describe its capability bits.
-#
-# Returns: a list of GICCapability objects.
-#
-# Since: 2.6
-#
-# Example:
-#
-# -> { "execute": "query-gic-capabilities" }
-# <- { "return": [{ "version": 2, "emulated": true, "kernel": false },
-#                 { "version": 3, "emulated": false, "kernel": true } ] =
}
-#
-##
-{ 'command': 'query-gic-capabilities', 'returns': ['GICCapability'] }
-
 ##
 # @CpuInstanceProperties:
 #
diff --git a/qapi/target.json b/qapi/target.json
index ca463a0854..7494a7e58f 100644
--- a/qapi/target.json
+++ b/qapi/target.json
@@ -132,3 +132,48 @@
             'modelb': 'CpuModelInfo' },
   'returns': 'CpuModelBaselineInfo',
   'if': 'defined(TARGET_S390X)' }
+
+##
+# @GICCapability:
+#
+# The struct describes capability for a specific GIC (Generic
+# Interrupt Controller) version. These bits are not only decided by
+# QEMU/KVM software version, but also decided by the hardware that
+# the program is running upon.
+#
+# @version:  version of GIC to be described. Currently, only 2 and 3
+#            are supported.
+#
+# @emulated: whether current QEMU/hardware supports emulated GIC
+#            device in user space.
+#
+# @kernel:   whether current QEMU/hardware supports hardware
+#            accelerated GIC device in kernel.
+#
+# Since: 2.6
+##
+{ 'struct': 'GICCapability',
+  'data': { 'version': 'int',
+            'emulated': 'bool',
+            'kernel': 'bool' },
+  'if': 'defined(TARGET_ARM)' }
+
+##
+# @query-gic-capabilities:
+#
+# This command is ARM-only. It will return a list of GICCapability
+# objects that describe its capability bits.
+#
+# Returns: a list of GICCapability objects.
+#
+# Since: 2.6
+#
+# Example:
+#
+# -> { "execute": "query-gic-capabilities" }
+# <- { "return": [{ "version": 2, "emulated": true, "kernel": false },
+#                 { "version": 3, "emulated": false, "kernel": true } ] =
}
+#
+##
+{ 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
+  'if': 'defined(TARGET_ARM)' }
diff --git a/monitor.c b/monitor.c
index 5d1ae89421..ed719651d9 100644
--- a/monitor.c
+++ b/monitor.c
@@ -971,9 +971,6 @@ static void qmp_query_qmp_schema(QDict *qdict, QObjec=
t **ret_data,
  */
 static void qmp_unregister_commands_hack(void)
 {
-#ifndef TARGET_ARM
-    qmp_unregister_command(&qmp_commands, "query-gic-capabilities");
-#endif
 #if !defined(TARGET_S390X) && !defined(TARGET_I386)
     qmp_unregister_command(&qmp_commands, "query-cpu-model-expansion");
 #endif
@@ -4135,14 +4132,6 @@ QemuOptsList qemu_mon_opts =3D {
     },
 };
=20
-#ifndef TARGET_ARM
-GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
-{
-    error_setg(errp, QERR_FEATURE_DISABLED, "query-gic-capabilities");
-    return NULL;
-}
-#endif
-
 HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
 {
     MachineState *ms =3D MACHINE(qdev_get_machine());
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 299cb80ae7..a46b0f98b4 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -20,7 +20,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "qmp-commands.h"
+#include "target-qmp-commands.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
=20
--=20
2.16.0.rc1.1.gef27df75a1

