Received: by 10.223.183.22 with SMTP id l22csp2105846wre;
        Thu, 17 Aug 2017 05:44:42 -0700 (PDT)
X-Received: by 10.55.212.203 with SMTP id s72mr6384858qks.177.1502973882348;
        Thu, 17 Aug 2017 05:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502973882; cv=none;
        d=google.com; s=arc-20160816;
        b=i71JgUbM6mDqNp3p3Bny+Un0plloB+6x52rPiVJgF6fz4+sHTRzOMyP7o6FiyVse8w
         HTCIVxw35f8iIQsux7jSPeoHKFE0KumNGAhBEEb8UW3QW1u9BUEgUmtP6D20UaRA8Tll
         1bJ1axQnVLapdOCnpc0NjcMQJbMe8jpMoh1ha86OtERmcXcU8eaOgCBXCSzRHkqoNCAK
         sDVM3VHsgj2acZuf1bXbq442pi4vsDLVscF93Q3iXI82BpelR1wS5fChRG4RM4qG2F/X
         tTOsgWJOYRBdosHYKVWfCEiUw5MdYpbr+BzguEMcJT3SOMMRSqncEtdk3ETwl3XGEgHo
         TAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:arc-authentication-results;
        bh=ninOOQ/kmDSZc5v78Qz6lulp/fyrQTz3qjFBhXtCa6A=;
        b=tXDwKkCbvcUfA9/Q7tOdRFLFAJK4cVhQ6hOMA9PXJcx6MMc8i6vaWTnSvK0eg9eEJm
         X4kmKaIbh96/ys6r4D+r4lz8iNs4aar6qUmcuWqKUbfs7DXRygqDNjbNWGub7Tfypjzr
         Lm6oGwWQiON51/MdFyA5ZqzKSXGLZAUzivT/wJ9o3L/FaD2XxCaPrKHCrGMONt0xmpVd
         YTnktzTdnCP3V95X+dk4pRtHOuTRorHQlvZxvhsP79iZqXklqoJa8uQRF98jP8ND+0IG
         RHCAszZcg6dLizyNZt0lZM5majBGyAI7t1tRagKFmZdaB+po3xAInyrNlVRChzLNHJg4
         yrkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=aTeAaVpb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w185si2873222qkd.36.2017.08.17.05.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 05:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=aTeAaVpb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diKAB-0008Eg-TA
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 08:44:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1diK9D-0007il-CN
	for qemu-devel@nongnu.org; Thu, 17 Aug 2017 08:43:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1diK9A-0001O4-PN
	for qemu-devel@nongnu.org; Thu, 17 Aug 2017 08:43:39 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:35691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1diK9A-0001Ni-Iq; Thu, 17 Aug 2017 08:43:36 -0400
Received: by mail-ua0-x242.google.com with SMTP id r9so914827uad.2;
	Thu, 17 Aug 2017 05:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6Gcrs8FLLBC+2uhdfK43BIS/XU6XfM+3fBar2PqPxFc=;
	b=aTeAaVpb/skhYh2viKjUb2l8mK2kU6dO6L8aP37D6hu2c41mUkUUEzPibkXiy3Ms5Z
	mQcP07mMuLmgFxxEOLB+YTSc13TlIwEZbOGHsnPpWtb1AMO5BDMgTJqYaG22fH3gOhSC
	Iq3z3340ueTJ9C6MSJlwQJNxVdv5mrNL3pWqQaeMZ7Lbk36Q+lLPaSNfWaCGxbKZxP/M
	4z31IU2aWGlA+yIMoIdLbytDosNU35HauLkAmfSbItNstPEszkAdEwz43sNS3Ktn7LC6
	Eap+uPrIAUVaIgT2jf89Av6W24zSyNNs2ORxz9rVB0H3sw23FmX4Bf+zRlOtBZ8sI7O/
	JuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6Gcrs8FLLBC+2uhdfK43BIS/XU6XfM+3fBar2PqPxFc=;
	b=HWvXZyvwP1Imxi08R13upIO/9Md++vAo90VUOVTt8Sey+/GtirjjuIL9Ma7R0zP5c+
	2LyYmuBQQ/AXqap6sWSW3/8NM/smRBm4gisxiYyhwphtbZZ8kR5HWWLPITBHLxZVE0nb
	b7BlgE1J2rh0wGTiDGcn8Dj1tCta/nFeAYxH/QemaS6v+lYdQSUlpemqo/5/8vIO+AhW
	v4U4ETRSvwBya+goOhfVrw2g9JCtnvTRPoW9SssH5mRYfW/gx/Gsxho8jF58avVpY8Hq
	9OmnhuGSLOOuIIEEzf+18EdJZDk43dgqGNf48oTaF0zvM5CP2PQ+aCFJAXNJEYxOgB1N
	0CaQ==
X-Gm-Message-State: AHYfb5j2Di0ioIUKf/8C8tJRbIu8ZYoRVRHbUQWKfBIwmMVbxNUmqnXc
	l97BIDcW0koQcSy+J+xJZe5ilu4gCA==
X-Received: by 10.176.73.10 with SMTP id z10mr3044154uac.178.1502973814403;
	Thu, 17 Aug 2017 05:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20170727154126.11339-1-marcandre.lureau@redhat.com>
	<20170727154126.11339-27-marcandre.lureau@redhat.com>
	<87shgqcr7a.fsf@dusky.pond.sub.org>
In-Reply-To: <87shgqcr7a.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Aug 2017 12:43:23 +0000
Message-ID: <CAJ+F1CL2z10V=xwJOKDHG=dCT01q7mOzNdLY7Y9io6goUZK61g@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 26/26] qapi: make query-cpu-definitions
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VVN7LTesqIuB

Hi

On Thu, Aug 17, 2017 at 2:30 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > It depends on TARGET_PPC || TARGET_ARM || TARGET_I386 || TARGET_S390X.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qapi-schema.json            |  4 +++-
> >  include/sysemu/arch_init.h  |  2 --
> >  monitor.c                   | 22 ----------------------
> >  qmp.c                       |  5 -----
> >  stubs/arch-query-cpu-def.c  | 10 ----------
> >  target/arm/helper.c         |  3 ++-
> >  target/i386/cpu.c           |  3 ++-
> >  target/ppc/translate_init.c |  3 ++-
> >  target/s390x/cpu_models.c   |  2 +-
> >  stubs/Makefile.objs         |  1 -
> >  10 files changed, 10 insertions(+), 45 deletions(-)
> >  delete mode 100644 stubs/arch-query-cpu-def.c
> >
> > diff --git a/qapi-schema.json b/qapi-schema.json
> > index f5e1acff83..8e3949bca8 100644
> > --- a/qapi-schema.json
> > +++ b/qapi-schema.json
> > @@ -4433,7 +4433,9 @@
> >  #
> >  # Since: 1.2.0
> >  ##
> > -{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo']=
 }
> > +{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo']=
,
> > +  'if': ['defined(NEED_CPU_H)',
> > +         'defined(TARGET_PPC) || defined(TARGET_ARM) ||
> defined(TARGET_I386) || defined(TARGET_S390X)'] }
> >
> >  ##
> >  # @CpuModelInfo:
> > diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
> > index fb3d20a1b8..e9721b9ce8 100644
> > --- a/include/sysemu/arch_init.h
> > +++ b/include/sysemu/arch_init.h
> > @@ -31,6 +31,4 @@ extern const uint32_t arch_type;
> >  int kvm_available(void);
> >  int xen_available(void);
> >
> > -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp);
> > -
> >  #endif
> > diff --git a/monitor.c b/monitor.c
> > index b134c39144..6600819599 100644
> > --- a/monitor.c
> > +++ b/monitor.c
> > @@ -956,26 +956,6 @@ static void qmp_query_qmp_schema(QDict *qdict,
> QObject **ret_data,
> >      *ret_data =3D qobject_from_qlit(&qmp_schema_qlit);
> >  }
> >
> > -/*
> > - * We used to define commands in qmp-commands.hx in addition to the
> > - * QAPI schema.  This permitted defining some of them only in certain
> > - * configurations.  query-commands has always reflected that (good,
> > - * because it lets QMP clients figure out what's actually available),
> > - * while query-qmp-schema never did (not so good).  This function is a
> > - * hack to keep the configuration-specific commands defined exactly as
> > - * before, even though qmp-commands.hx is gone.
> > - *
> > - * FIXME Educate the QAPI schema on configuration-specific commands,
> > - * and drop this hack.
> > - */
> > -static void qmp_unregister_commands_hack(void)
> > -{
> > -#if !defined(TARGET_PPC) && !defined(TARGET_ARM) &&
> !defined(TARGET_I386) \
> > -    && !defined(TARGET_S390X)
> > -    qmp_unregister_command(&qmp_commands, "query-cpu-definitions");
> > -#endif
> > -}
> > -
>
> Very nice to see this gone.  Its removal could be made a separate commit
> to highlight the achievement :)
>
> There are a few more candidates:
>
> * QERR_FEATURE_DISABLED leads me to
>   - query-hotpluggable-cpus via monitor.c
>   - x-colo-lost-heartbeat via colo-failover.c
>   - query-rocker, query-rocker-ports, query-rocker-of-dpa-flows,
>     query-rocker-of-dpa-groups via qmp-norocker.c
>
> * QERR_UNSUPPORTED leads me to
>   - dump-guest-memory via dump_init() and stubs/dump.c
>   - query-vm-generation-id via stubs/vmgenid.c
>   - inject-nmi via nmi_monitor_handle() and s390_nmi()
>   - query-pci via pci-stub.c
>
> * grep error_set stubs/* doesn't find more
>

I have started to look at other opportunities in
https://github.com/elmarco/qemu/commits/qapi-if-more, but I have to revisit
that once we have that series ready. I guess this could be done case by
case later, and collaboratively.

Thanks for the review so far, I'll get back to it soon.


> >  void monitor_init_qmp_commands(void)
> >  {
> >      /*
> > @@ -995,8 +975,6 @@ void monitor_init_qmp_commands(void)
> >      qmp_register_command(&qmp_commands, "netdev_add", qmp_netdev_add,
> >                           QCO_NO_OPTIONS);
> >
> > -    qmp_unregister_commands_hack();
> > -
> >      QTAILQ_INIT(&qmp_cap_negotiation_commands);
> >      qmp_register_command(&qmp_cap_negotiation_commands,
> "qmp_capabilities",
> >                           qmp_marshal_qmp_capabilities, QCO_NO_OPTIONS)=
;
> > diff --git a/qmp.c b/qmp.c
> > index afa266ec1e..d57ccf1251 100644
> > --- a/qmp.c
> > +++ b/qmp.c
> > @@ -541,11 +541,6 @@ DevicePropertyInfoList
> *qmp_device_list_properties(const char *typename,
> >      return prop_list;
> >  }
> >
> > -CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> > -{
> > -    return arch_query_cpu_definitions(errp);
> > -}
> > -
> >  void qmp_add_client(const char *protocol, const char *fdname,
> >                      bool has_skipauth, bool skipauth, bool has_tls,
> bool tls,
> >                      Error **errp)
> > diff --git a/stubs/arch-query-cpu-def.c b/stubs/arch-query-cpu-def.c
> > deleted file mode 100644
> > index cefe4beb82..0000000000
> > --- a/stubs/arch-query-cpu-def.c
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -#include "qemu/osdep.h"
> > -#include "qemu-common.h"
> > -#include "sysemu/arch_init.h"
> > -#include "qapi/qmp/qerror.h"
> > -
> > -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> > -{
> > -    error_setg(errp, QERR_UNSUPPORTED);
> > -    return NULL;
> > -}
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 4ed32c56b8..ec644f3930 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -15,6 +15,7 @@
> >  #include <zlib.h> /* For crc32 */
> >  #include "exec/semihost.h"
> >  #include "sysemu/kvm.h"
> > +#include "qmp-commands.h"
> >
> >  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurabl=
e
> */
> >
> > @@ -5336,7 +5337,7 @@ static void arm_cpu_add_definition(gpointer data,
> gpointer user_data)
> >      *cpu_list =3D entry;
> >  }
> >
> > -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> > +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> >  {
> >      CpuDefinitionInfoList *cpu_list =3D NULL;
> >      GSList *list;
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index d683e70a13..e5f61f6bff 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -36,6 +36,7 @@
> >  #include "qapi/visitor.h"
> >  #include "qom/qom-qobject.h"
> >  #include "sysemu/arch_init.h"
> > +#include "qmp-commands.h"
> >
> >  #if defined(CONFIG_KVM)
> >  #include <linux/kvm_para.h>
> > @@ -2318,7 +2319,7 @@ static void x86_cpu_definition_entry(gpointer
> data, gpointer user_data)
> >      *cpu_list =3D entry;
> >  }
> >
> > -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> > +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> >  {
> >      CpuDefinitionInfoList *cpu_list =3D NULL;
> >      GSList *list =3D get_sorted_cpu_model_list();
> > diff --git a/target/ppc/translate_init.c b/target/ppc/translate_init.c
> > index 01723bdfec..2a2d62e5bb 100644
> > --- a/target/ppc/translate_init.c
> > +++ b/target/ppc/translate_init.c
> > @@ -34,6 +34,7 @@
> >  #include "hw/ppc/ppc.h"
> >  #include "mmu-book3s-v3.h"
> >  #include "sysemu/qtest.h"
> > +#include "qmp-commands.h"
> >
> >  //#define PPC_DUMP_CPU
> >  //#define PPC_DEBUG_SPR
> > @@ -10391,7 +10392,7 @@ static void ppc_cpu_defs_entry(gpointer data,
> gpointer user_data)
> >      *first =3D entry;
> >  }
> >
> > -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> > +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> >  {
> >      CpuDefinitionInfoList *cpu_list =3D NULL;
> >      GSList *list;
> > diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> > index 863dce064f..8021dda341 100644
> > --- a/target/s390x/cpu_models.c
> > +++ b/target/s390x/cpu_models.c
> > @@ -387,7 +387,7 @@ static void create_cpu_model_list(ObjectClass
> *klass, void *opaque)
> >      *cpu_list =3D entry;
> >  }
> >
> > -CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
> > +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> >  {
> >      struct CpuDefinitionInfoListData list_data =3D {
> >          .list =3D NULL,
> > diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> > index dcfe6f49f9..71af433f6b 100644
> > --- a/stubs/Makefile.objs
> > +++ b/stubs/Makefile.objs
> > @@ -1,4 +1,3 @@
> > -stub-obj-y +=3D arch-query-cpu-def.o
> >  stub-obj-y +=3D bdrv-next-monitor-owned.o
> >  stub-obj-y +=3D blk-commit-all.o
> >  stub-obj-y +=3D blockdev-close-all-bdrv-states.o
>
> --
Marc-Andr=C3=A9 Lureau
