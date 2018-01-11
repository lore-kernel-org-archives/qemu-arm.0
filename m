Received: by 10.28.173.206 with SMTP id w197csp1073715wme;
        Thu, 11 Jan 2018 14:07:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBotBTmCwHEk1PSKvJwGExTJuOA3vhiNw83TJ3zoTQ6759NQheOCMn/yaYfMTXMRkVvdZ5FQL
X-Received: by 10.37.22.65 with SMTP id 62mr22974969ybw.180.1515708447679;
        Thu, 11 Jan 2018 14:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515708447; cv=none;
        d=google.com; s=arc-20160816;
        b=Au531RQ7ffSL10Bke2O/uaGl/S+2KSkUytQX7gBfsAy7NmCNz9/Icg9VU4hEU0miPW
         vqdvbJa9drCGFCf25di/6uIANxwKwNgtZy+QgkcpVGLPS0eqOon5JRQ2uOAxX+z4R7En
         5+5BROH8sVrhBg9fiAqwX62BCayKQ05j7I5aMDvVpmRXrdPTb2zttRdUMHWSPYNvNh+Z
         luJx3YF9SdlG1TMfv9DWxGHM/a2Adl9lsiXg2taQ3V+9zFW9Fu/lzFOD1Alq/5a192wM
         sPJK+oB4eMBwPfvCAFKQEi3TFCUGQoNhtdqrjBSmB/li/XcYBCRJgCe21fD9PEVZ7NHf
         hwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0YKGQE33YU/w6emqPfTs/2P2p+oeZRd1rtyV5MChEj4=;
        b=k6ovGmnp8vWJIME7M4safQJZTahnTNrRMhCMhMbQx1AKTeBSTAF624WWMRZjJyZtgM
         KMpvOi9P1JuUwCC+PO4HFkidJ4i8J2cL+3KSSc7fkWeg1UEiCV6KtNeATnBk0GbsniiV
         zvUc5vXb/5A++f0sm2RFa2berWnozaZ6ty9oICJCKF3JK1JhzgtBvs96+bbDHjzUQzM7
         5jVP5rcT1PyzP/BsfTbIqIZNMn68BnHmm0BqCWfNc2oIIVmB0zb2XtvwnFDdn9ibm386
         SPACrjeVJ440UP3J7ruIJ0s/gdT7+krnAO4paONIqzE5k1TUU69884eyM7veHS3o/NQT
         7lKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k13si677878ybd.644.2018.01.11.14.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 14:07:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZl0R-0001QY-2D
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 17:07:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1eZkXp-0000NJ-NG
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 16:37:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1eZkXk-0007Wo-MH
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 16:37:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1eZkXk-0007Uq-DD; Thu, 11 Jan 2018 16:37:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE2F561461;
	Thu, 11 Jan 2018 21:37:41 +0000 (UTC)
Received: from localhost (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4433F8503;
	Thu, 11 Jan 2018 21:37:38 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jan 2018 22:32:49 +0100
Message-Id: <20180111213250.16511-51-marcandre.lureau@redhat.com>
In-Reply-To: <20180111213250.16511-1-marcandre.lureau@redhat.com>
References: <20180111213250.16511-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 11 Jan 2018 21:37:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 50/51] qapi: make query-cpu-definitions depend
 on specific targets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>, armbru@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alexander Graf <agraf@suse.de>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, eblake@redhat.com,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JFeZ47Co+Ref

It depends on TARGET_PPC || TARGET_ARM || TARGET_I386 || TARGET_S390X.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 qapi-schema.json            | 10 ----------
 qapi/target.json            | 12 ++++++++++++
 include/sysemu/arch_init.h  |  1 -
 monitor.c                   | 22 ----------------------
 qmp.c                       |  5 -----
 stubs/arch-query-cpu-def.c  | 10 ----------
 target/arm/helper.c         |  3 ++-
 target/i386/cpu.c           |  2 +-
 target/ppc/translate_init.c |  3 ++-
 target/s390x/cpu_models.c   |  2 +-
 stubs/Makefile.objs         |  1 -
 11 files changed, 18 insertions(+), 53 deletions(-)
 delete mode 100644 stubs/arch-query-cpu-def.c

diff --git a/qapi-schema.json b/qapi-schema.json
index b5b9103180..b0b8e2806d 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1965,16 +1965,6 @@
 ##
 { 'command': 'query-memory-size-summary', 'returns': 'MemoryInfo' }
=20
-##
-# @query-cpu-definitions:
-#
-# Return a list of supported virtual CPU definitions
-#
-# Returns: a list of CpuDefInfo
-#
-# Since: 1.2.0
-##
-{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'] }
=20
 ##
 # @CpuModelInfo:
diff --git a/qapi/target.json b/qapi/target.json
index abf1423fba..973da4a849 100644
--- a/qapi/target.json
+++ b/qapi/target.json
@@ -216,3 +216,15 @@
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
   'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+
+##
+# @query-cpu-definitions:
+#
+# Return a list of supported virtual CPU definitions
+#
+# Returns: a list of CpuDefInfo
+#
+# Since: 1.2.0
+##
+{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
+  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I3=
86) || defined(TARGET_S390X)' }
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 08a607b89b..e9721b9ce8 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -31,5 +31,4 @@ extern const uint32_t arch_type;
 int kvm_available(void);
 int xen_available(void);
=20
-CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp);
 #endif
diff --git a/monitor.c b/monitor.c
index 707cc49385..a8d5af70ad 100644
--- a/monitor.c
+++ b/monitor.c
@@ -957,26 +957,6 @@ static void qmp_query_qmp_schema(QDict *qdict, QObje=
ct **ret_data,
     *ret_data =3D qobject_from_qlit(&qmp_schema_qlit);
 }
=20
-/*
- * We used to define commands in qmp-commands.hx in addition to the
- * QAPI schema.  This permitted defining some of them only in certain
- * configurations.  query-commands has always reflected that (good,
- * because it lets QMP clients figure out what's actually available),
- * while query-qmp-schema never did (not so good).  This function is a
- * hack to keep the configuration-specific commands defined exactly as
- * before, even though qmp-commands.hx is gone.
- *
- * FIXME Educate the QAPI schema on configuration-specific commands,
- * and drop this hack.
- */
-static void qmp_unregister_commands_hack(void)
-{
-#if !defined(TARGET_PPC) && !defined(TARGET_ARM) && !defined(TARGET_I386=
) \
-    && !defined(TARGET_S390X)
-    qmp_unregister_command(&qmp_commands, "query-cpu-definitions");
-#endif
-}
-
 void monitor_init_qmp_commands(void)
 {
     /*
@@ -998,8 +978,6 @@ void monitor_init_qmp_commands(void)
     qmp_register_command(&qmp_commands, "netdev_add", qmp_netdev_add,
                          QCO_NO_OPTIONS);
=20
-    qmp_unregister_commands_hack();
-
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilitie=
s",
                          qmp_marshal_qmp_capabilities, QCO_NO_OPTIONS);
diff --git a/qmp.c b/qmp.c
index a1f42bcac8..4acf693edf 100644
--- a/qmp.c
+++ b/qmp.c
@@ -536,11 +536,6 @@ DevicePropertyInfoList *qmp_device_list_properties(c=
onst char *typename,
     return prop_list;
 }
=20
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    return arch_query_cpu_definitions(errp);
-}
-
 void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool=
 tls,
                     Error **errp)
diff --git a/stubs/arch-query-cpu-def.c b/stubs/arch-query-cpu-def.c
deleted file mode 100644
index cefe4beb82..0000000000
--- a/stubs/arch-query-cpu-def.c
+++ /dev/null
@@ -1,10 +0,0 @@
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-#include "sysemu/arch_init.h"
-#include "qapi/qmp/qerror.h"
-
-CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return NULL;
-}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1395f9b73..eafa640687 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
 #include "sysemu/kvm.h"
+#include "target-qmp-commands.h"
=20
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
=20
@@ -5420,7 +5421,7 @@ static void arm_cpu_add_definition(gpointer data, g=
pointer user_data)
     *cpu_list =3D entry;
 }
=20
-CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
     CpuDefinitionInfoList *cpu_list =3D NULL;
     GSList *list;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 99f3688060..82c5d140bd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2385,7 +2385,7 @@ static void x86_cpu_definition_entry(gpointer data,=
 gpointer user_data)
     *cpu_list =3D entry;
 }
=20
-CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
     CpuDefinitionInfoList *cpu_list =3D NULL;
     GSList *list =3D get_sorted_cpu_model_list();
diff --git a/target/ppc/translate_init.c b/target/ppc/translate_init.c
index 70ff15a51a..b56218bb84 100644
--- a/target/ppc/translate_init.c
+++ b/target/ppc/translate_init.c
@@ -36,6 +36,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "disas/capstone.h"
+#include "target-qmp-commands.h"
=20
 //#define PPC_DUMP_CPU
 //#define PPC_DEBUG_SPR
@@ -10293,7 +10294,7 @@ static void ppc_cpu_defs_entry(gpointer data, gpo=
inter user_data)
     *first =3D entry;
 }
=20
-CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
     CpuDefinitionInfoList *cpu_list =3D NULL;
     GSList *list;
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 8b83cc9cf9..52615b9f1b 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -424,7 +424,7 @@ static void create_cpu_model_list(ObjectClass *klass,=
 void *opaque)
     *cpu_list =3D entry;
 }
=20
-CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
     struct CpuDefinitionInfoListData list_data =3D {
         .list =3D NULL,
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index b35bc8e473..642584f26d 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -1,4 +1,3 @@
-stub-obj-y +=3D arch-query-cpu-def.o
 stub-obj-y +=3D bdrv-next-monitor-owned.o
 stub-obj-y +=3D blk-commit-all.o
 stub-obj-y +=3D blockdev-close-all-bdrv-states.o
--=20
2.16.0.rc1.1.gef27df75a1

