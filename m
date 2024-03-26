Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1320242ejj;
        Tue, 26 Mar 2024 05:54:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUS3iSLFonX6mf26YxwBVB4guJlVYm5N6kVEYLgHDMgQrcTldZk0CPjoKeQtT09yzTn563IMsN5MsQWNby8/Xk+ghVQv8V
X-Google-Smtp-Source: AGHT+IG/kUYasHURCjUB4CSWsacgHROCUGDUUbMMdABHKIRSFYS208Yuxq+d3Pa8Kt7/9XvXbMaw
X-Received: by 2002:a05:6214:f2a:b0:696:50bf:15d0 with SMTP id iw10-20020a0562140f2a00b0069650bf15d0mr1238423qvb.56.1711457659344;
        Tue, 26 Mar 2024 05:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711457659; cv=none;
        d=google.com; s=arc-20160816;
        b=TGOg2iovVi1QMpR5G+SdFSVJ9GkvskJOeXzTWFkehR/++KPP+ZMP3d0JCzzHtj41sF
         C/oSAd9rRm9rlIbbwFRZPuLWLE5KbRyDpZuRsc6wULwv6nEacTYT1CuM1mjan4l8IXCV
         Vw3V23lAr0Q+cz7h8Ype7D2rbW54/URY7YVlNQxg/MfGeexfOjSksTqCPERCZCIKYGtx
         f1D2n4e9FsKTSROp1NzTnXM24sxKPhCGP0ip+/pDrNoLDO3RYuaOqQQiPtTB/fZqhw5j
         wHIVTXroo+iIyjuDch2AiotiaJ1ukORQ3OND9at0dcRs1QjwwzfacJSCJyxHL6cOLJWV
         dvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=rV1RJmQNftGY7VwRVwt6w2BaMcFIKrZM4HMKKeiWQR4=;
        fh=j6vGwUeh40MsH8+2hCLX2GvWVHMFUdBFdgSZk625XkU=;
        b=qsytkrAqijij6PsXP/p67W9CS41B1T3qx1UHaaka3HMo7pjjTO0f2uVDf2zouXBoXZ
         HtAmXJYTZA4WymLs7v+s4+QNKXGhMsOegPUOQ6dDPAUUvYlIEcN5xJJdnL98v+UCyLlW
         2TCi+NiwSdqXZab+6IWqdBergk97mZ3PB8T+9MVLcG5Tzo9gNsLSeONuy/bcF5m8AjCx
         P2xFtNMEvrck+Aox8q65CQZOZMryFfSTfongcTsUgrX1aFXtYHUT/2VjD50j1XVbhrBf
         eZ6QEQh6tV5Lkca/KEypo60U6aQ/UL1dGuj9S/rFFlQPwoF61rCpysm06s9zCovjnbmt
         PPsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SyQt0BKk;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gm11-20020a056214268b00b006969556318fsi2800938qvb.69.2024.03.26.05.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 05:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SyQt0BKk;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711457658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rV1RJmQNftGY7VwRVwt6w2BaMcFIKrZM4HMKKeiWQR4=;
	b=SyQt0BKkpLTf3BOyxYVzMLAhdOwBz6k/VkuDlrN9R5XT/cBFvA/+suFSZHShj/kkw/ZtKE
	yc8nUqDLMwKBesAvL6HzINrppq8UZlOlaDVyy4sJUkY6jyJ0EfNQpCGnj4JnYQ0ZMOnRIo
	sBNV96h8xa92rCrJDWVM4G60S3OX6Gs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-kCQV6eGzM-C2dEFCyWa8Nw-1; Tue, 26 Mar 2024 08:54:15 -0400
X-MC-Unique: kCQV6eGzM-C2dEFCyWa8Nw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22A46800264;
	Tue, 26 Mar 2024 12:54:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB32C1C060D6;
	Tue, 26 Mar 2024 12:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A7A5621E669D; Tue, 26 Mar 2024 13:54:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Anton Johansson
 <anjo@rev.ng>,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Claudio Fontana
 <cfontana@suse.de>,  Richard Henderson <richard.henderson@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Zhao Liu <zhao1.liu@intel.com>,
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Michael Roth
 <michael.roth@amd.com>
Subject: Re: [RFC PATCH-for-9.1 14/21] system: Introduce QMP
 generic_query_cpu_definitions()
In-Reply-To: <20240315130910.15750-15-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 15 Mar 2024 14:09:02
 +0100")
References: <20240315130910.15750-1-philmd@linaro.org>
	<20240315130910.15750-15-philmd@linaro.org>
Date: Tue, 26 Mar 2024 13:54:09 +0100
Message-ID: <87o7b1noge.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: +a6KrSX7BLKl

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Each target use a common template for qmp_query_cpu_definitions().
>
> Extract it as generic_query_cpu_definitions(), keeping the
> target-specific implementations as the following SysemuCPUOps
> handlers:
>  - cpu_list_compare()
>  - add_definition()
>  - add_alias_definitions()
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  MAINTAINERS                           |  2 +
>  include/hw/core/sysemu-cpu-ops.h      | 14 ++++++
>  include/qapi/commands-target-compat.h | 14 ++++++
>  system/cpu-qmp-cmds.c                 | 71 +++++++++++++++++++++++++++
>  system/meson.build                    |  1 +
>  5 files changed, 102 insertions(+)
>  create mode 100644 include/qapi/commands-target-compat.h
>  create mode 100644 system/cpu-qmp-cmds.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af27490243..39d7c14d98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -148,6 +148,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
>  R: Paolo Bonzini <pbonzini@redhat.com>
>  S: Maintained
>  F: system/cpus.c
> +F: system/cpu-qmp-cmds.c
>  F: system/cpu-qom-helpers.c
>  F: system/watchpoint.c
>  F: cpu-common.c
> @@ -1894,6 +1895,7 @@ F: qapi/machine-target.json
>  F: include/hw/boards.h
>  F: include/hw/core/cpu.h
>  F: include/hw/cpu/cluster.h
> +F: include/qapi/commands-target-compat.h
>  F: include/sysemu/numa.h
>  F: tests/unit/test-smp-parse.c
>  T: git https://gitlab.com/ehabkost/qemu.git machine-next
> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cp=
u-ops.h
> index 24d003fe04..2173226e97 100644
> --- a/include/hw/core/sysemu-cpu-ops.h
> +++ b/include/hw/core/sysemu-cpu-ops.h
> @@ -11,6 +11,7 @@
>  #define SYSEMU_CPU_OPS_H
>=20=20
>  #include "hw/core/cpu.h"
> +#include "qapi/qapi-types-machine.h"
>=20=20
>  /*
>   * struct SysemuCPUOps: System operations specific to a CPU class
> @@ -81,6 +82,19 @@ typedef struct SysemuCPUOps {
>       */
>      bool (*virtio_is_big_endian)(CPUState *cpu);
>=20=20
> +    /**
> +     * @cpu_list_compare: Sort alphabetically by type name,
> +     *                    respecting CPUClass::ordering.
> +     */
> +    gint (*cpu_list_compare)(gconstpointer cpu_class_a, gconstpointer cp=
u_class_b);

Peeking ahead...  This is used for sorting the subtypes of the CPU type
returned by cpu_typename_by_arch_bit().  Implementing the callback is
optional, and when absent, we don't sort, i.e. we get hash table order.

Worth mentioning it's optional?

> +    /**
> +     * @add_definition: Add the @cpu_class definition to @cpu_list.
> +     */
> +    void (*add_definition)(gpointer cpu_class, gpointer cpu_list);

This one appears to default to cpu_common_add_definition().  Worth
mentioning?

I despise Glib's pointless typedefs for ordinary C types.

> +    /**
> +     * @add_alias_definitions: Add CPU alias definitions to @cpu_list.
> +     */
> +    void (*add_alias_definitions)(CpuDefinitionInfoList **cpu_list);
>      /**
>       * @legacy_vmsd: Legacy state for migration.
>       *               Do not use in new targets, use #DeviceClass::vmsd i=
nstead.
> diff --git a/include/qapi/commands-target-compat.h b/include/qapi/command=
s-target-compat.h
> new file mode 100644
> index 0000000000..86d45d8fcc
> --- /dev/null
> +++ b/include/qapi/commands-target-compat.h

Why "compat"?

> @@ -0,0 +1,14 @@
> +/*
> + * QAPI helpers for target specific QMP commands
> + *
> + * SPDX-FileCopyrightText: 2024 Linaro Ltd.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef QAPI_COMPAT_TARGET_H
> +#define QAPI_COMPAT_TARGET_H
> +
> +#include "qapi/qapi-types-machine.h"
> +
> +CpuDefinitionInfoList *generic_query_cpu_definitions(Error **errp);
> +
> +#endif
> diff --git a/system/cpu-qmp-cmds.c b/system/cpu-qmp-cmds.c
> new file mode 100644
> index 0000000000..daeb131159
> --- /dev/null
> +++ b/system/cpu-qmp-cmds.c
> @@ -0,0 +1,71 @@
> +/*
> + * QAPI helpers for target specific QMP commands
> + *
> + * SPDX-FileCopyrightText: 2024 Linaro Ltd.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qom/object.h"
> +#include "qapi/commands-target-compat.h"
> +#include "sysemu/arch_init.h"
> +#include "hw/core/cpu.h"
> +#include "hw/core/sysemu-cpu-ops.h"
> +
> +static void cpu_common_add_definition(gpointer data, gpointer user_data)
> +{
> +    ObjectClass *oc =3D data;
> +    CpuDefinitionInfoList **cpu_list =3D user_data;
> +    CpuDefinitionInfo *info;
> +    const char *typename;
> +
> +    typename =3D object_class_get_name(oc);
> +    info =3D g_malloc0(sizeof(*info));
> +    info->name =3D cpu_model_from_type(typename);
> +    info->q_typename =3D g_strdup(typename);
> +
> +    QAPI_LIST_PREPEND(*cpu_list, info);
> +}
> +
> +static void arch_add_cpu_definitions(CpuDefinitionInfoList **cpu_list,
> +                                     const char *cpu_typename)
> +{
> +    ObjectClass *oc;
> +    GSList *list;
> +    const struct SysemuCPUOps *ops;
> +
> +    oc =3D object_class_by_name(cpu_typename);
> +    if (!oc) {
> +        return;
> +    }
> +    ops =3D CPU_CLASS(oc)->sysemu_ops;
> +
> +    list =3D object_class_get_list(cpu_typename, false);
> +    if (ops->cpu_list_compare) {
> +        list =3D g_slist_sort(list, ops->cpu_list_compare);
> +    }
> +    g_slist_foreach(list, ops->add_definition ? : cpu_common_add_definit=
ion,
> +                    cpu_list);
> +    g_slist_free(list);
> +
> +    if (ops->add_alias_definitions) {
> +        ops->add_alias_definitions(cpu_list);
> +    }
> +}
> +
> +CpuDefinitionInfoList *generic_query_cpu_definitions(Error **errp)
> +{
> +    CpuDefinitionInfoList *cpu_list =3D NULL;
> +
> +    for (unsigned i =3D 0; i <=3D QEMU_ARCH_BIT_LAST; i++) {
> +        const char *cpu_typename;
> +
> +        cpu_typename =3D cpu_typename_by_arch_bit(i);
> +        if (!cpu_typename) {
> +            continue;
> +        }
> +        arch_add_cpu_definitions(&cpu_list, cpu_typename);
> +    }
> +
> +    return cpu_list;
> +}
> diff --git a/system/meson.build b/system/meson.build
> index c6ee97e3b2..dd78caa9b7 100644
> --- a/system/meson.build
> +++ b/system/meson.build
> @@ -10,6 +10,7 @@ system_ss.add(files(
>    'balloon.c',
>    'bootdevice.c',
>    'cpus.c',
> +  'cpu-qmp-cmds.c',
>    'cpu-qom-helpers.c',
>    'cpu-throttle.c',
>    'cpu-timers.c',

The commit message made me expect the complete refactoring in this
patch.  In fact, it's just a first step: the new
generic_query_cpu_definitions() remains unused, and no target implements
the new callbacks.  We can worry about this later.

Subsequent patches convert targets to generic_query_cpu_definitions()
one by one.  To convince myself the replacement is faithful, I'll have
to refer back to this patch.  That's fine.
