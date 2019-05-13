Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2997239wrg;
        Mon, 13 May 2019 09:12:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyixrgdvfeVXmto+p6DB12b97buYnu4uK2hx6qQDgDD0qWwKdw3vLYC30KeG63qJEM2YCtR
X-Received: by 2002:a37:6043:: with SMTP id u64mr10761609qkb.9.1557763966399;
        Mon, 13 May 2019 09:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557763966; cv=none;
        d=google.com; s=arc-20160816;
        b=phwRcgDhlCCVZtH0M333jvks1kT43wbNSMI3rZHCne0n+TCa5DjmpPvLP3HaCZHAor
         AwoKYbv8uop8KW6sLF0QZFxVji0D6Oz+UsYogUveu5HrbC5onaQiDLhlCA8TZcyHQ1o5
         lFOh9FpHjFpqHi9OmGazSPdVzb5BWzP8KLOB5DQBZ2xFtVlXzodlMqcAKbuwuOrqAXyG
         MyxR/PFWN2pYsNzY19qV38Hb7RjVwx0hHYuYo5uQHxGoCX24Tt1rSnXNOA7/oDom1qdF
         vVVd+Aty2Vi/t+5Mm04JSpaQ7pqefVWTVqf7MGwcVdvUWOkYlB179fiQcnacLcMtTOsO
         VBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from;
        bh=WJHcUJkMTUo8Z+KTKgd5NmlydEtLGYVVWjtlwWPgpoQ=;
        b=U0jKv+hC7JuBvo8wGMjuGFK8Y+0jnwLj9eWkPlYtItK3oAYAsTsvEUnZCvx7IRO3H8
         P+Yxn+eLA4fW0t12H1OcjwGO5eywvbSLay8iv3mGAZP3IoDBPT0xkk5k+fHslik9UA+M
         Da4QFwM14fg5X7PcHRePxHEOrQPP4G++APyIaik4aoRPGVicSs7UwewL3IAa5nz5OE/K
         nHxXlvc/jyMAQQI4RjQ1JAUlSayrasyDvuVIvJ71DZc4ugAj8+LtQqYte0XdS2kRBNZf
         IWpufqqya7R2jnZ7mC/3wRsYf5UF9nkzu1h36+55U49W6ukVBR98MSDF/Famgnod6cab
         hIDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w2si297731qta.245.2019.05.13.09.12.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 09:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C04F11B768;
	Mon, 13 May 2019 16:12:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com [10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA37F64420;
	Mon, 13 May 2019 16:12:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 27C7A11385E4; Mon, 13 May 2019 18:12:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org,  richard.henderson@linaro.org,  abologna@redhat.com,  alex.bennee@linaro.org,  Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 08/13] target/arm/monitor: Add query-sve-vector-lengths
References: <20190512083624.8916-1-drjones@redhat.com>
	<20190512083624.8916-9-drjones@redhat.com>
Date: Mon, 13 May 2019 18:12:38 +0200
In-Reply-To: <20190512083624.8916-9-drjones@redhat.com> (Andrew Jones's
	message of "Sun, 12 May 2019 10:36:19 +0200")
Message-ID: <87ftpie3k9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 13 May 2019 16:12:45 +0000 (UTC)
X-TUID: iTHPj13gVEtC

Andrew Jones <drjones@redhat.com> writes:

> Provide a QMP interface to query the supported SVE vector lengths.
> A migratable guest will need to explicitly specify a valid set of
> lengths on the command line and that set can be obtained from the
> list returned with this QMP command.
>
> This patch only introduces the QMP command with the TCG implementation.
> The result may not yet be correct for KVM. Following patches ensure
> the KVM result is correct.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  qapi/target.json     | 34 ++++++++++++++++++++++++
>  target/arm/monitor.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/qmp-cmd-test.c |  1 +
>  3 files changed, 97 insertions(+)
>
> diff --git a/qapi/target.json b/qapi/target.json
> index 1d4d54b6002e..ca1e85254780 100644
> --- a/qapi/target.json
> +++ b/qapi/target.json
> @@ -397,6 +397,40 @@
>  { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
>    'if': 'defined(TARGET_ARM)' }
>  
> +##
> +# @SVEVectorLengths:
> +#
> +# The struct contains a list of integers where each integer is a valid

Suggest to s/The struct contains/Contains/.

> +# SVE vector length for a KVM guest on this host. The vector lengths
> +# are in quadword (128-bit) units, e.g. '4' means 512 bits (64 bytes).

Any particular reason for counting quad-words instead of bytes, or
perhaps bits?

> +#
> +# @vls:      list of vector lengths in quadwords.
> +#
> +# Since: 4.1
> +##
> +{ 'struct': 'SVEVectorLengths',
> +  'data': { 'vls': ['int'] },
> +  'if': 'defined(TARGET_ARM)' }
> +
> +##
> +# @query-sve-vector-lengths:
> +#
> +# This command is ARM-only. It will return a list of SVEVectorLengths

No other target-specific command documents its target-specificness like
this.  Suggest

   # Query valid SVE vector length sets.

> +# objects. The list describes all valid SVE vector length sets.
> +#
> +# Returns: a list of SVEVectorLengths objects
> +#
> +# Since: 4.1
> +#
> +# -> { "execute": "query-sve-vector-lengths" }
> +# <- { "return": [ { "vls": [ 1 ] },
> +#                  { "vls": [ 1, 2 ] },
> +#                  { "vls": [ 1, 2, 4 ] } ] }
> +#
> +##
> +{ 'command': 'query-sve-vector-lengths', 'returns': ['SVEVectorLengths'],
> +  'if': 'defined(TARGET_ARM)' }
> +
>  ##
>  # @CpuModelExpansionInfo:
>  #
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 41b32b94b258..8b2afa255c92 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -24,6 +24,7 @@
>  #include "hw/boards.h"
>  #include "kvm_arm.h"
>  #include "qapi/qapi-commands-target.h"
> +#include "monitor/hmp-target.h"

Uh, hmp-target.h when the patch is supposedly about QMP only...

>  
>  static GICCapability *gic_cap_new(int version)
>  {
> @@ -82,3 +83,64 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>  
>      return head;
>  }
> +
> +static SVEVectorLengths *qmp_sve_vls_get(void)
> +{
> +    CPUArchState *env = mon_get_cpu_env();

Aha, you need it for mon_get_cpu_env().

mon_get_cpu_env() returns the current monitor's current CPU.  This is an
HMP thing, QMP commands should never access it.

Looks like you use it to find one of the CPUs, so you can access its
->sve_max_vq.

"One of the CPUs" smells odd: what if they aren't all the same?  Perhaps
that can't happen.  I don't know, you tell me :)

If any CPU will do, what about simply using first_cpu?

> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +    SVEVectorLengths *vls = g_new(SVEVectorLengths, 1);
> +    intList **v = &vls->vls;
> +    int i;
> +
> +    if (cpu->sve_max_vq == 0) {
> +        *v = g_new0(intList, 1); /* one vl of 0 means none supported */
> +        return vls;
> +    }
> +
> +    for (i = 1; i <= cpu->sve_max_vq; ++i) {
> +        *v = g_new0(intList, 1);
> +        (*v)->value = i;
> +        v = &(*v)->next;
> +    }

What this loop does is not immediately obvious.  I think you could use a
function comment.

> +
> +    return vls;
> +}
> +
> +static SVEVectorLengths *qmp_sve_vls_dup_and_truncate(SVEVectorLengths *vls)
> +{
> +    SVEVectorLengths *trunc_vls;
> +    intList **v, *p = vls->vls;
> +
> +    if (!p->next) {
> +        return NULL;
> +    }
> +
> +    trunc_vls = g_new(SVEVectorLengths, 1);
> +    v = &trunc_vls->vls;
> +
> +    for (; p->next; p = p->next) {
> +        *v = g_new0(intList, 1);
> +        (*v)->value = p->value;
> +        v = &(*v)->next;
> +    }
> +
> +    return trunc_vls;
> +}

More so.

> +
> +SVEVectorLengthsList *qmp_query_sve_vector_lengths(Error **errp)
> +{
> +    SVEVectorLengthsList *vls_list = g_new0(SVEVectorLengthsList, 1);
> +    SVEVectorLengths *vls = qmp_sve_vls_get();
> +
> +    while (vls) {
> +        vls_list->value = vls;
> +        vls = qmp_sve_vls_dup_and_truncate(vls);
> +        if (vls) {
> +            SVEVectorLengthsList *next = vls_list;
> +            vls_list = g_new0(SVEVectorLengthsList, 1);
> +            vls_list->next = next;
> +        }
> +    }
> +
> +    return vls_list;
> +}
> diff --git a/tests/qmp-cmd-test.c b/tests/qmp-cmd-test.c
> index 9f5228cd9951..3d714dbc6a4a 100644
> --- a/tests/qmp-cmd-test.c
> +++ b/tests/qmp-cmd-test.c
> @@ -90,6 +90,7 @@ static bool query_is_blacklisted(const char *cmd)
>          /* Success depends on target arch: */
>          "query-cpu-definitions",  /* arm, i386, ppc, s390x */
>          "query-gic-capabilities", /* arm */
> +        "query-sve-vector-lengths", /* arm */
>          /* Success depends on target-specific build configuration: */
>          "query-pci",              /* CONFIG_PCI */
>          /* Success depends on launching SEV guest */
