Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp361666lfa;
        Fri, 11 Jun 2021 02:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw83GMN7eQjXRzXQ1Jdyudx9ZUIYa9H1UKyRyZ+cc0lrLBxSkcHdzKQiNQG+csn6CgSlacL
X-Received: by 2002:a50:9549:: with SMTP id v9mr2813039eda.312.1623405090398;
        Fri, 11 Jun 2021 02:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623405090; cv=none;
        d=google.com; s=arc-20160816;
        b=Hm+3ZJUCa1hKoeNRZ+f1yRBYr+y1mWTudivcqy/8s39fCqLQZKdragk9+fcKLIk1qw
         oqxeZAGEeSd650GWCR3PjHTkJJ/oq5rCOz/Syqe9lZVRMZVR0UPcEhJGGUyu2o1PbPzQ
         L22xptqcoTq2Y6yiYZZ6YO76g5dUAp5guy+0PMD6xkNPjimeLT720equD4vkl2g8LLMa
         i3MG3dOC/o1sPutOb7uqZsAIDrJ5zb8VeU17Fc9ie8Tz02xd3k2/gbvd9J2hN9T8UQiZ
         R9JEqcCcEM27FVBRO9mT/JmC0lDcYFGGzcOpeAIcT/Fg1j4FRrPexeU54JOCf9Tq9r2o
         pa4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=MX6wxNhU2clmHdHgg7BT+tcUUBQ5lPem1amsN8qVJCA=;
        b=N8DSM2prj0LmMYZzYRi2ZKpVs20+z20im9jYDCoRopMGnVsBaGzsl1VAfCsbO9z73I
         dD3oubkJjxXMHdU50qkpxFyMQcbA3ZEm25w3ySEZDqbOtxvU9zIqTaLbwg7uPtv5dVcY
         5Ys1YEBXoaSUVeH2Dy8muLZWISC6jS3iRox8cg+ma94LIsWoV1OC3gC9vRkbTIAun9rC
         ibEW3QH4HuMTupAyZw1tP7tWt/iIo+ULk0VOxYkMbSBhBy0UXlABXOlirkTIFR29T8Vk
         tT29MnanxqyD/KxNAGa5q6iK4QYYxU6ArT5/vnNQoVHqSfyBBUen2JbcHLNB6M+AkrXN
         MjGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DksbarhD;
       spf=pass (google.com: domain of armbru@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id m15si4340766ejb.707.2021.06.11.02.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jun 2021 02:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DksbarhD;
       spf=pass (google.com: domain of armbru@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623405089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MX6wxNhU2clmHdHgg7BT+tcUUBQ5lPem1amsN8qVJCA=;
	b=DksbarhDxsmfMSdQJGCRlW9hEAAwJ2xUNY3qCWbK1hauBwOwNSux8GdqQuog6Y+0nqGCaa
	0tQjPo34WPWi3oFfOvinPgzL454mNen3ERGURHeZ3yDXOZ1O3CtsSValY0LWuB4b6WvEwR
	gIUDw84jpYHrggUNDw8cu7nTAHJ7tFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-BDQUA1E9OUq3Rl2-X6IPIQ-1; Fri, 11 Jun 2021 05:51:28 -0400
X-MC-Unique: BDQUA1E9OUq3Rl2-X6IPIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0016B801B14;
	Fri, 11 Jun 2021 09:51:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com [10.36.112.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 864CD5C1CF;
	Fri, 11 Jun 2021 09:51:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 206E2113865F; Fri, 11 Jun 2021 11:51:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  Eduardo Habkost <ehabkost@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  John Snow
 <jsnow@redhat.com>
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
References: <20210526170432.343588-1-philmd@redhat.com>
	<20210526170432.343588-3-philmd@redhat.com>
Date: Fri, 11 Jun 2021 11:51:25 +0200
In-Reply-To: <20210526170432.343588-3-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 26 May 2021 19:04:22
 +0200")
Message-ID: <87czsssp9e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BgMZchoZojxb

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.

This has become somewhat misleading, I'm afraid.  If memory serves,
earlier versions had union AcceleratorInfo with a common base struct.
This patch has just a struct, which we can grow into a union when we
actually have accelerator-specific information to report.  Perhaps

  - AcceleratorInfo provides information on a specific accelerator.  It
    contains just the accelerator name so far.

>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v8:
> - Include code snippet from Markus adding to machine-target.json
>   to be able to use enum values or union branches conditional.
> - Use accel_find() on enum to be sure the accelerator is enabled
>   at runtime (chat with jsnow / eblake).
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
>  accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
>  accel/meson.build        |  2 +-
>  3 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 accel/accel-qmp.c
>
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b72..586a61b5d99 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,57 @@
>  ##
>  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>    'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I3=
86) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [
> +      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
> +      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
> +      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
> +      { 'name': 'qtest' },
> +      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
> +      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
> +      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
> +
> +##
> +# @AcceleratorInfo:
> +#
> +# Accelerator information.
> +#
> +# @name: The accelerator name.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'AcceleratorInfo',
> +  'data': { 'name': 'Accelerator' } }
> +
> +##
> +# @query-accels:
> +#
> +# Get a list of AcceleratorInfo for all built-in accelerators.
> +#
> +# Returns: a list of @AcceleratorInfo describing each accelerator.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accels" }
> +# <- { "return": [
> +#        {
> +#            "name": "qtest"
> +#        },
> +#        {
> +#            "name": "kvm"
> +#        }
> +#    ] }
> +#
> +##
> +{ 'command': 'query-accels',
> +  'returns': ['AcceleratorInfo'] }
> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
> new file mode 100644
> index 00000000000..0098297caa5
> --- /dev/null
> +++ b/accel/accel-qmp.c
> @@ -0,0 +1,32 @@
> +/*
> + * QEMU accelerators, QMP commands
> + *
> + * Copyright (c) 2021 Red Hat Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/accel.h"
> +#include "qapi/qapi-types-machine-target.h"
> +#include "qapi/qapi-commands-machine-target.h"
> +
> +AcceleratorInfoList *qmp_query_accels(Error **errp)
> +{
> +    AcceleratorInfoList *list =3D NULL, **tail =3D &list;
> +
> +    for (Accelerator accel =3D 0; accel < ACCELERATOR__MAX; accel++) {
> +        AcceleratorInfo *info;
> +
> +        if (!accel_find(Accelerator_str(accel))) {
> +            /* Accelerator available at build time but not at runtime. *=
/
> +            continue;
> +        }
> +
> +        info =3D g_new0(AcceleratorInfo, 1);
> +        info->name =3D accel;
> +        QAPI_LIST_APPEND(tail, info);
> +    }
> +
> +    return list;
> +}

If I read this correctly, there's a subtle difference between the
information returned by query-accels and the information you can get
from introspecting query-accels with query-qmp-schema: the latter gives
you the accelerators compiled into this build of QEMU, the former gives
you the ones that are actually available at run time.  Suggest to
mention that in the commit message.

> diff --git a/accel/meson.build b/accel/meson.build
> index b44ba30c864..7a48f6d568d 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,4 +1,4 @@
> -specific_ss.add(files('accel-common.c'))
> +specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
>  softmmu_ss.add(files('accel-softmmu.c'))
>  user_ss.add(files('accel-user.c'))

Preferably with the commit message tweaked to address my remarks:
Acked-by: Markus Armbruster <armbru@redhat.com>
