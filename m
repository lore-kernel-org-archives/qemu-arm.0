Received: by 10.223.172.38 with SMTP id v35csp5374432wrc;
        Mon, 11 Sep 2017 04:35:52 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAPvDBix3ooNhva/pLTOW9tA621V7eI7tzRcwicQpgy7FBbGTiO5U59QHI9TJNOIKzhJzCy
X-Received: by 10.200.35.186 with SMTP id q55mr15366739qtq.193.1505129752772;
        Mon, 11 Sep 2017 04:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505129752; cv=none;
        d=google.com; s=arc-20160816;
        b=vY8b5X3KaNcuMGt7IxyFlAxwOc1fuOmhdIdavZhOKN/CFA3WVrKG6JPfunvHW+WD/s
         duDxtHnjU9GzEQK9o1OnXHu0+6S09Sg8Y4b9oWZoeY4jhlT1Gm5vHFnpbOJf6waIPu8V
         BdXDu5kD4xJzD6FmUAVGrE4S5RgZCZYyYA/FhJZ+YKKai1kv3YA5naGVK9BLW5OfFAro
         YmJILfIK9Mo23sagzWuyGjmiuNiWDBsMBaahZZ+sa/UzcmaThQtNnYYppCfmi/ewgNxv
         nQzq87//WRW/Xjg9P94RYwSc72jrc410EI6Nm80JcQulATlvi7bHX75fREw6kRJpacpq
         QWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=nNHXkvo+lj+Mcp02yBwQ0FL3VMmiTswsfHiePit9qAc=;
        b=BhOlvxKfCV4OuRizG5rRs5aV/HvwWTqXGCGHFV0EXAYuvJTMzoA99gwGtwwu6cXAFM
         Wt1cObGDqSU4qq58U/S+SeBeY4u+bjpYuOqnlQ5IzY7dbq+JuVk9rK1VxUb1z4o5/ejJ
         KBOxM6MhpchNe87SRWKPHscgIV828c/yS9sTTrTQX5QOgwIr5WoyAWUmDBAS70wZtOi/
         dRsiI5qg15on6XiU7F0TOCZBL4wrRP1zgxaP5rF4MxdK3VvegXJW5IHQzmt0LOvz3+Lc
         858jljHpGFxz9XAaEc4NHtE/AnSeuMiwyArnCNxKItCQgPlF8gRib4MYQ/TeXOAEyyQb
         SnqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s20si9128840qtc.297.2017.09.11.04.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 04:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drN0H-0005FG-M6
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 07:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1drMaF-00071B-BG
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 07:08:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1drMaE-0007cM-AC
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 07:08:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1drMa9-0007Yb-1v; Mon, 11 Sep 2017 07:08:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2734113D08D;
	Mon, 11 Sep 2017 11:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2734113D08D
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-47.ams2.redhat.com [10.36.112.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA175F925;
	Mon, 11 Sep 2017 11:08:45 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 13:06:21 +0200
Message-Id: <20170911110623.24981-49-marcandre.lureau@redhat.com>
In-Reply-To: <20170911110623.24981-1-marcandre.lureau@redhat.com>
References: <20170911110623.24981-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 11 Sep 2017 11:08:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 48/50] qapi: make query-gic-capabilities
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
X-TUID: AuMvCkvlkST0

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qapi-schema.json     | 43 -------------------------------------------
 qapi/target.json     | 45 +++++++++++++++++++++++++++++++++++++++++++++
 monitor.c            | 11 -----------
 target/arm/monitor.c |  2 +-
 4 files changed, 46 insertions(+), 55 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index b4a5f9abc5..23151506e7 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -2879,49 +2879,6 @@
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
index 12002b54d5..daf4bfa8f1 100644
--- a/qapi/target.json
+++ b/qapi/target.json
@@ -130,3 +130,48 @@
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
index 622ba3b819..acf4721b30 100644
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
@@ -4145,14 +4142,6 @@ QemuOptsList qemu_mon_opts =3D {
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
2.14.1.146.gd35faa819

