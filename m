Received: by 10.223.183.22 with SMTP id l22csp2090128wre;
        Thu, 17 Aug 2017 05:30:28 -0700 (PDT)
X-Received: by 10.55.174.129 with SMTP id x123mr6521679qke.212.1502973028122;
        Thu, 17 Aug 2017 05:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502973028; cv=none;
        d=google.com; s=arc-20160816;
        b=V1XaRLv42zopHZGnsJn9B0ORKUr+I8Q6HCLfBWPLESepn8iJ8HogrYopybEp+0vor+
         fSOyq9r6PUvlXzb9rL3tBAx++Bo+KiLFkC6RA8NqP37RxKhlQmrqdm9V1gHrlXFWr2gb
         7YEjDRT9UCRNisdFt5l0IdaA9Bv54u2w1tb9lEVecrszpzRobfeIN4iUIivrreZIM4Ik
         CoeTFqUpaKLRCgSkYhW5S7RO7OZp3Vs0y+MKPPBJ5K/rSdCrOk4NjXQhKmy/EcrVA5G5
         cz0gJcUAX8yu+Yt2C7jtGLUmApJWzCNmMBTKcW8qHRg6W8MMxqUZyk7yY+bYzG7hlhvq
         861Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from:dmarc-filter
         :arc-authentication-results;
        bh=Z48PCRPrF6GsFswV9dQvd3v9nCPoVv5Skqev01IloAU=;
        b=Ilf9NXlzweBlPuVwJxsrV92pCNk2HtrJQcgEzRwFye2d4i0iiJl8C95ngrsvRh7fzx
         mXChP4705H4ectuo1PkVgmEeukrEiKSdHHobVZUvptULEJaaPIgg0fEBaItVRRaiH9lE
         ywaTlnmHjCq3Jqj0og4nxBY0TgrRD/IvPGdMCAMV0tIErFCqXj6QeEs47GZsAT2XcfJZ
         l0isrA+OAHweMK00ysmdcgQTVs6VeC7KF4Pv0Ak8UtBCrjjaw2CYJtZcriohg4DAatQ+
         DI3hddB0d7n0KYdh754haVy6Jcw3o1/6qbIjul2OA+G3JtZieJgxlJ6OdTOAj3ABf1R6
         GdSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q39si3094832qtg.91.2017.08.17.05.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 05:30:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diJwP-00020q-Ts
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 08:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1diJwJ-0001zz-KR
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 08:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1diJwE-000365-VQ
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 08:30:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1diJwE-00035g-Lw; Thu, 17 Aug 2017 08:30:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09EA890154;
	Thu, 17 Aug 2017 12:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 09EA890154
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-90.ams2.redhat.com
	[10.36.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 996C27901A;
	Thu, 17 Aug 2017 12:30:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 76D1F1138646; Thu, 17 Aug 2017 14:30:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
References: <20170727154126.11339-1-marcandre.lureau@redhat.com>
	<20170727154126.11339-27-marcandre.lureau@redhat.com>
Date: Thu, 17 Aug 2017 14:30:01 +0200
In-Reply-To: <20170727154126.11339-27-marcandre.lureau@redhat.com>
	(=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 27 Jul 2017
	17:41:26 +0200")
Message-ID: <87shgqcr7a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 17 Aug 2017 12:30:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 26/26] qapi: make
 query-cpu-definitions depend on specific targets
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
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c89LP8lh4/R1

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> It depends on TARGET_PPC || TARGET_ARM || TARGET_I386 || TARGET_S390X.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi-schema.json            |  4 +++-
>  include/sysemu/arch_init.h  |  2 --
>  monitor.c                   | 22 ----------------------
>  qmp.c                       |  5 -----
>  stubs/arch-query-cpu-def.c  | 10 ----------
>  target/arm/helper.c         |  3 ++-
>  target/i386/cpu.c           |  3 ++-
>  target/ppc/translate_init.c |  3 ++-
>  target/s390x/cpu_models.c   |  2 +-
>  stubs/Makefile.objs         |  1 -
>  10 files changed, 10 insertions(+), 45 deletions(-)
>  delete mode 100644 stubs/arch-query-cpu-def.c
>
> diff --git a/qapi-schema.json b/qapi-schema.json
> index f5e1acff83..8e3949bca8 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -4433,7 +4433,9 @@
>  #
>  # Since: 1.2.0
>  ##
> -{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'] }
> +{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
> +  'if': ['defined(NEED_CPU_H)',
> +         'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I=
386) || defined(TARGET_S390X)'] }
>=20=20
>  ##
>  # @CpuModelInfo:
> diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
> index fb3d20a1b8..e9721b9ce8 100644
> --- a/include/sysemu/arch_init.h
> +++ b/include/sysemu/arch_init.h
> @@ -31,6 +31,4 @@ extern const uint32_t arch_type;
>  int kvm_available(void);
>  int xen_available(void);
>=20=20
> -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp);
> -
>  #endif
> diff --git a/monitor.c b/monitor.c
> index b134c39144..6600819599 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -956,26 +956,6 @@ static void qmp_query_qmp_schema(QDict *qdict, QObje=
ct **ret_data,
>      *ret_data =3D qobject_from_qlit(&qmp_schema_qlit);
>  }
>=20=20
> -/*
> - * We used to define commands in qmp-commands.hx in addition to the
> - * QAPI schema.  This permitted defining some of them only in certain
> - * configurations.  query-commands has always reflected that (good,
> - * because it lets QMP clients figure out what's actually available),
> - * while query-qmp-schema never did (not so good).  This function is a
> - * hack to keep the configuration-specific commands defined exactly as
> - * before, even though qmp-commands.hx is gone.
> - *
> - * FIXME Educate the QAPI schema on configuration-specific commands,
> - * and drop this hack.
> - */
> -static void qmp_unregister_commands_hack(void)
> -{
> -#if !defined(TARGET_PPC) && !defined(TARGET_ARM) && !defined(TARGET_I386=
) \
> -    && !defined(TARGET_S390X)
> -    qmp_unregister_command(&qmp_commands, "query-cpu-definitions");
> -#endif
> -}
> -

Very nice to see this gone.  Its removal could be made a separate commit
to highlight the achievement :)

There are a few more candidates:

* QERR_FEATURE_DISABLED leads me to
  - query-hotpluggable-cpus via monitor.c
  - x-colo-lost-heartbeat via colo-failover.c
  - query-rocker, query-rocker-ports, query-rocker-of-dpa-flows,
    query-rocker-of-dpa-groups via qmp-norocker.c

* QERR_UNSUPPORTED leads me to
  - dump-guest-memory via dump_init() and stubs/dump.c
  - query-vm-generation-id via stubs/vmgenid.c
  - inject-nmi via nmi_monitor_handle() and s390_nmi()
  - query-pci via pci-stub.c

* grep error_set stubs/* doesn't find more

>  void monitor_init_qmp_commands(void)
>  {
>      /*
> @@ -995,8 +975,6 @@ void monitor_init_qmp_commands(void)
>      qmp_register_command(&qmp_commands, "netdev_add", qmp_netdev_add,
>                           QCO_NO_OPTIONS);
>=20=20
> -    qmp_unregister_commands_hack();
> -
>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>      qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilitie=
s",
>                           qmp_marshal_qmp_capabilities, QCO_NO_OPTIONS);
> diff --git a/qmp.c b/qmp.c
> index afa266ec1e..d57ccf1251 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -541,11 +541,6 @@ DevicePropertyInfoList *qmp_device_list_properties(c=
onst char *typename,
>      return prop_list;
>  }
>=20=20
> -CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> -{
> -    return arch_query_cpu_definitions(errp);
> -}
> -
>  void qmp_add_client(const char *protocol, const char *fdname,
>                      bool has_skipauth, bool skipauth, bool has_tls, bool=
 tls,
>                      Error **errp)
> diff --git a/stubs/arch-query-cpu-def.c b/stubs/arch-query-cpu-def.c
> deleted file mode 100644
> index cefe4beb82..0000000000
> --- a/stubs/arch-query-cpu-def.c
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -#include "qemu/osdep.h"
> -#include "qemu-common.h"
> -#include "sysemu/arch_init.h"
> -#include "qapi/qmp/qerror.h"
> -
> -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> -{
> -    error_setg(errp, QERR_UNSUPPORTED);
> -    return NULL;
> -}
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4ed32c56b8..ec644f3930 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -15,6 +15,7 @@
>  #include <zlib.h> /* For crc32 */
>  #include "exec/semihost.h"
>  #include "sysemu/kvm.h"
> +#include "qmp-commands.h"
>=20=20
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
>=20=20
> @@ -5336,7 +5337,7 @@ static void arm_cpu_add_definition(gpointer data, g=
pointer user_data)
>      *cpu_list =3D entry;
>  }
>=20=20
> -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>  {
>      CpuDefinitionInfoList *cpu_list =3D NULL;
>      GSList *list;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index d683e70a13..e5f61f6bff 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -36,6 +36,7 @@
>  #include "qapi/visitor.h"
>  #include "qom/qom-qobject.h"
>  #include "sysemu/arch_init.h"
> +#include "qmp-commands.h"
>=20=20
>  #if defined(CONFIG_KVM)
>  #include <linux/kvm_para.h>
> @@ -2318,7 +2319,7 @@ static void x86_cpu_definition_entry(gpointer data,=
 gpointer user_data)
>      *cpu_list =3D entry;
>  }
>=20=20
> -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>  {
>      CpuDefinitionInfoList *cpu_list =3D NULL;
>      GSList *list =3D get_sorted_cpu_model_list();
> diff --git a/target/ppc/translate_init.c b/target/ppc/translate_init.c
> index 01723bdfec..2a2d62e5bb 100644
> --- a/target/ppc/translate_init.c
> +++ b/target/ppc/translate_init.c
> @@ -34,6 +34,7 @@
>  #include "hw/ppc/ppc.h"
>  #include "mmu-book3s-v3.h"
>  #include "sysemu/qtest.h"
> +#include "qmp-commands.h"
>=20=20
>  //#define PPC_DUMP_CPU
>  //#define PPC_DEBUG_SPR
> @@ -10391,7 +10392,7 @@ static void ppc_cpu_defs_entry(gpointer data, gpo=
inter user_data)
>      *first =3D entry;
>  }
>=20=20
> -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>  {
>      CpuDefinitionInfoList *cpu_list =3D NULL;
>      GSList *list;
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 863dce064f..8021dda341 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -387,7 +387,7 @@ static void create_cpu_model_list(ObjectClass *klass,=
 void *opaque)
>      *cpu_list =3D entry;
>  }
>=20=20
> -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>  {
>      struct CpuDefinitionInfoListData list_data =3D {
>          .list =3D NULL,
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index dcfe6f49f9..71af433f6b 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -1,4 +1,3 @@
> -stub-obj-y +=3D arch-query-cpu-def.o
>  stub-obj-y +=3D bdrv-next-monitor-owned.o
>  stub-obj-y +=3D blk-commit-all.o
>  stub-obj-y +=3D blockdev-close-all-bdrv-states.o
