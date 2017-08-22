Received: by 10.223.188.70 with SMTP id a6csp4947304wrh;
        Tue, 22 Aug 2017 06:34:42 -0700 (PDT)
X-Received: by 10.237.62.211 with SMTP id o19mr1006362qtf.72.1503408882072;
        Tue, 22 Aug 2017 06:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503408882; cv=none;
        d=google.com; s=arc-20160816;
        b=SFDR39Dk1XXdx9yXZuVUpNgKWRiBLRlP48rX0VpxJM5UpQfUcLgZTYTbNUNbkRGPZd
         GYyhV4II0z1PiMhXzaYrFbiG/CnlIJfx2yHFPQjXdZPQbjYufHzBkrRku1m2t3OEvGQU
         6sViSpmZPcz2EQ7iJ6+gcXBPKVxWhsYwanecBnkuGQ089zVy8WjpURDH2ZYKNl9wJuX0
         YJ+5goIXINCc02vb1lySYzr+Q+jhmEMCkdMf4IbpmuuQy01V35duW2NmlW0xWUUa8PsG
         SkMu3z1YglLGnJ8em/ScO6q/rwz8qe0j3EbMf3m0A0kk0IrC8tuJzXu/P2pHZoLfZ15Q
         wHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=7T+QeRZFvOvMR7mExJIB9MNej1MJ3q7NwKcVOTKqOFw=;
        b=x39PeLfD7CFCZdDt/2kvUB7CiI/ALml7SehPUlb3EMz4HLWz/e16nqA2Q10d0N+9e+
         5ASZfcWnGhR9Fh/w1NwXJfDOHDKR+oLzIkpXOaeQMwjRzRt2uIDd5E56BvTXM0sb4dKU
         vLgoo2QWVrWJrgTvcxzht0dIs8gX/P2jhkyAAvVj0+lrEglOMR2tHz1hljuHzIZtU/QK
         oGao1kmBa31wMienF3zra9sqIFcSlOM0Colj6T5SH/HABx/tNkOcFVshY2Bd6Ey0ROVp
         eMqE2KU7EKPPi1NMBhaxjEZg3GX6D7HsEBszw02JbUTetX6zWjeDflrEb7S1xrgbGbaT
         IKpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n68si13810703qkc.220.2017.08.22.06.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 06:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dk9KJ-0008H9-L9
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 09:34:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dk9E3-0003BN-QE
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 09:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dk9E2-0003PB-F1
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 09:28:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dk9Dx-0003LD-7m; Tue, 22 Aug 2017 09:28:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C17556147C;
	Tue, 22 Aug 2017 13:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C17556147C
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 883E5617A3;
	Tue, 22 Aug 2017 13:27:58 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 15:22:55 +0200
Message-Id: <20170822132255.23945-55-marcandre.lureau@redhat.com>
In-Reply-To: <20170822132255.23945-1-marcandre.lureau@redhat.com>
References: <20170822132255.23945-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 22 Aug 2017 13:28:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 54/54] qapi: make query-cpu-definitions
 depend on specific targets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J4mpsI0sR90H

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
index 127a2c71c6..194859f683 100644
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
index ca67a584d2..ac400e65ee 100644
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
@@ -996,8 +976,6 @@ void monitor_init_qmp_commands(void)
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
index fa60040361..54543a0b01 100644
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
@@ -5332,7 +5333,7 @@ static void arm_cpu_add_definition(gpointer data, g=
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
index 8fb407ed73..5845a15296 100644
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
@@ -10401,7 +10402,7 @@ static void ppc_cpu_defs_entry(gpointer data, gpo=
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
index eb17628ede..67bf15261d 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -1,4 +1,3 @@
-stub-obj-y +=3D arch-query-cpu-def.o
 stub-obj-y +=3D bdrv-next-monitor-owned.o
 stub-obj-y +=3D blk-commit-all.o
 stub-obj-y +=3D blockdev-close-all-bdrv-states.o
--=20
2.14.1.146.gd35faa819

