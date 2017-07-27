Received: by 10.25.44.15 with SMTP id s15csp2184759lfs;
        Thu, 27 Jul 2017 09:08:30 -0700 (PDT)
X-Received: by 10.55.146.133 with SMTP id u127mr6165820qkd.17.1501171709930;
        Thu, 27 Jul 2017 09:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501171709; cv=none;
        d=google.com; s=arc-20160816;
        b=spg40vg5IhQckwdxfJTUnDrXvdATFL1SsBi0/BjhVMS2bFlyEpcxtXHD3sHM/qekhy
         cD2DzQqCUNeRQTe+vThu4iwfcObUlHUQFzV5AM+cbAmy12LSczl4FJtOTqdi685c7xG0
         fQ69jSnNJFDYKlZ8qzc5H2humB8vW9Unta32BIlPrMwUGUnTPBY2VTg6hVwPCm+hdqpO
         8uZfIwa6+OTvgtI/JLc5vvZ/BCo2ZDQgR3W3LHaJjwpkFtsAYLnMqeSSrxmHJMy4Up/F
         eji4my+zkgmzAjb/qdTmsVXfe38s7m6s9m0xtiEeceoODhlRApUvRm9miIZLw4WkIxF3
         zcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=m0Vk9CGJENw08mIv2uv2ujCpXb7EdvDM2MVZx2o9kXw=;
        b=ZISxXgqe8OAQ4sN6FDkrctfGleBm+i538pPL0MiinAg9TM3CiLwVUeXh/Je9gT6L0j
         yEaCvw1dbfne+v9RdUcxrEQytaOpe+lvugo1S+PNQctTvPlSYO2WajhaKAvD59KK7l8O
         /0KTsuXzU9cGAXSqs7DrR6qrITCuNUXNj/UX8xQ9Rut32TEbQjUhGMh+epp4hfDn1COW
         uJmtSmDhTxarmKPN/5AK1elnz402ZTNwAUahVDHwigxyW3F9oc84BjwcAAoru2nZCc1D
         imu/XHedwA2Oc10vR8ilD4KfEQ6DMp1m5BMyngZhIKzc52W3+ay3WV2npQa5kbeATHQp
         n/Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b14si12011651qkg.470.2017.07.27.09.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 09:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dalKt-0007JH-3h
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 12:08:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dal4x-0000cr-KI
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 11:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dal4v-0007Mr-D0
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 11:51:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dal4v-0007Li-4Q; Thu, 27 Jul 2017 11:51:57 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7717864076;
	Thu, 27 Jul 2017 15:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7717864076
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6B06EC99;
	Thu, 27 Jul 2017 15:42:46 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 27 Jul 2017 17:41:26 +0200
Message-Id: <20170727154126.11339-27-marcandre.lureau@redhat.com>
In-Reply-To: <20170727154126.11339-1-marcandre.lureau@redhat.com>
References: <20170727154126.11339-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 27 Jul 2017 15:42:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 26/26] qapi: make query-cpu-definitions depend on
 specific targets
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
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alexander Graf <agraf@suse.de>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S/gv5bZiOn7Z

It depends on TARGET_PPC || TARGET_ARM || TARGET_I386 || TARGET_S390X.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qapi-schema.json            |  4 +++-
 include/sysemu/arch_init.h  |  2 --
 monitor.c                   | 22 ----------------------
 qmp.c                       |  5 -----
 stubs/arch-query-cpu-def.c  | 10 ----------
 target/arm/helper.c         |  3 ++-
 target/i386/cpu.c           |  3 ++-
 target/ppc/translate_init.c |  3 ++-
 target/s390x/cpu_models.c   |  2 +-
 stubs/Makefile.objs         |  1 -
 10 files changed, 10 insertions(+), 45 deletions(-)
 delete mode 100644 stubs/arch-query-cpu-def.c

diff --git a/qapi-schema.json b/qapi-schema.json
index f5e1acff83..8e3949bca8 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -4433,7 +4433,9 @@
 #
 # Since: 1.2.0
 ##
-{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'] }
+{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
+  'if': ['defined(NEED_CPU_H)',
+         'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I=
386) || defined(TARGET_S390X)'] }
=20
 ##
 # @CpuModelInfo:
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index fb3d20a1b8..e9721b9ce8 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -31,6 +31,4 @@ extern const uint32_t arch_type;
 int kvm_available(void);
 int xen_available(void);
=20
-CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp);
-
 #endif
diff --git a/monitor.c b/monitor.c
index b134c39144..6600819599 100644
--- a/monitor.c
+++ b/monitor.c
@@ -956,26 +956,6 @@ static void qmp_query_qmp_schema(QDict *qdict, QObje=
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
@@ -995,8 +975,6 @@ void monitor_init_qmp_commands(void)
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
index afa266ec1e..d57ccf1251 100644
--- a/qmp.c
+++ b/qmp.c
@@ -541,11 +541,6 @@ DevicePropertyInfoList *qmp_device_list_properties(c=
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
index 4ed32c56b8..ec644f3930 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
 #include "sysemu/kvm.h"
+#include "qmp-commands.h"
=20
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
=20
@@ -5336,7 +5337,7 @@ static void arm_cpu_add_definition(gpointer data, g=
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
index d683e70a13..e5f61f6bff 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -36,6 +36,7 @@
 #include "qapi/visitor.h"
 #include "qom/qom-qobject.h"
 #include "sysemu/arch_init.h"
+#include "qmp-commands.h"
=20
 #if defined(CONFIG_KVM)
 #include <linux/kvm_para.h>
@@ -2318,7 +2319,7 @@ static void x86_cpu_definition_entry(gpointer data,=
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
index 01723bdfec..2a2d62e5bb 100644
--- a/target/ppc/translate_init.c
+++ b/target/ppc/translate_init.c
@@ -34,6 +34,7 @@
 #include "hw/ppc/ppc.h"
 #include "mmu-book3s-v3.h"
 #include "sysemu/qtest.h"
+#include "qmp-commands.h"
=20
 //#define PPC_DUMP_CPU
 //#define PPC_DEBUG_SPR
@@ -10391,7 +10392,7 @@ static void ppc_cpu_defs_entry(gpointer data, gpo=
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
index 863dce064f..8021dda341 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -387,7 +387,7 @@ static void create_cpu_model_list(ObjectClass *klass,=
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
index dcfe6f49f9..71af433f6b 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -1,4 +1,3 @@
-stub-obj-y +=3D arch-query-cpu-def.o
 stub-obj-y +=3D bdrv-next-monitor-owned.o
 stub-obj-y +=3D blk-commit-all.o
 stub-obj-y +=3D blockdev-close-all-bdrv-states.o
--=20
2.14.0.rc0.1.g40ca67566

