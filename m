Received: by 10.25.77.65 with SMTP id a62csp516826lfb;
        Fri, 10 Feb 2017 06:46:50 -0800 (PST)
X-Received: by 10.223.174.199 with SMTP id y65mr9298908wrc.19.1486738010174;
        Fri, 10 Feb 2017 06:46:50 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id b78si1448133wme.134.2017.02.10.06.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x230.google.com with SMTP id v186so112152457wmd.0
        for <alex.bennee@linaro.org>; Fri, 10 Feb 2017 06:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CuZlRYAKkFw6ggaQD6qQTcm4CQg5Yv0ZxbPa3T3LDsU=;
        b=aa8FyPNtbXnskQctWILAoT84C81H2Wpr7Xj68QjYmPEOV7nwiyzrPeLubrWy0GFFki
         PXnkMzanoH3qpD88+sLuwfFrPo8fqzzoBw1MgDw+Und7MLb4CibTCcapZdzB+wR1GVj4
         i/cNTx3h2TWE9ILwFm4t8E8J2pPp7vcC9qRa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CuZlRYAKkFw6ggaQD6qQTcm4CQg5Yv0ZxbPa3T3LDsU=;
        b=bz8E9hAwanQ7WMaDZC9hIlUoKn7LpODZpMRa7t6Vr8kgdkEFT0rddkufoWbPKxEdDx
         EuNFwdi7b7dEEVcBjF1nfuM5Hr/9AaLUB/u5qpC5zVuKqXWRS3XAWlGHEcWL4OlW+vJr
         Jv4G2lBkpdLRmwk2j99WzBZLQDfGYK0aAGDjmdJxZvmPe0p8jU+IxUfhrA1WbU74s2Db
         //ugWER5hro2Let6a6CLr2bZSZwiQO2B6TQxAKuezOPe59Y2yHaax2eFu608a0hcbwp9
         9CJQnvZRbx7M/nA+Co9K+gBJ9TcVas6UqxejMk40Dk3lme2fIBL75kl8EP1nwZ8iqq/O
         pydg==
X-Gm-Message-State: AMke39mutP7BcUlkvLgocHU0RhJIRYgUljUlyHrXlcqtHlUe1ZjFu1smzBmFQswRh17QYWDKGLoXmVCF4umTezfjors=
X-Received: by 10.28.4.10 with SMTP id 10mr29373349wme.142.1486738009684; Fri,
 10 Feb 2017 06:46:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 06:46:29 -0800 (PST)
In-Reply-To: <20170209170904.5713-21-alex.bennee@linaro.org>
References: <20170209170904.5713-1-alex.bennee@linaro.org> <20170209170904.5713-21-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 14:46:29 +0000
Message-ID: <CAFEAcA8XFYaMibPkVUg8cYifn1+v=2X8HoMha67OoPnO_wBpiA@mail.gmail.com>
Subject: Re: [PATCH v11 20/24] target-arm/powerctl: defer cpu reset work to
 CPU context
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iRI8b+ds9glz

On 9 February 2017 at 17:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> When switching a new vCPU on we want to complete a bunch of the setup
> work before we start scheduling the vCPU thread. To do this cleanly we
> defer vCPU setup to async work which will run the vCPUs execution
> context as the thread is woken up. The scheduling of the work will kick
> the vCPU awake.
>
> This avoids potential races in MTTCG system emulation.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
>
> ---
> v7
>   - add const to static mode_for_el[] array
>   - fix checkpatch long lines
> v10
>   - use async work for arm_set_cpu_off, arm_reset_cpu as well
>   - model ON_PENDING to deal with racing arm_set_cpu_on
> v11
>   - move to single cpu->power_state protected by BQL
>   - bump migration format
> ---
>  target/arm/arm-powerctl.c | 202 +++++++++++++++++++++++++++++++---------=
------
>  target/arm/arm-powerctl.h |   2 +
>  target/arm/cpu.c          |   4 +-
>  target/arm/cpu.h          |  13 ++-
>  target/arm/kvm.c          |   7 +-
>  target/arm/machine.c      |   6 +-
>  target/arm/psci.c         |  16 +++-
>  7 files changed, 174 insertions(+), 76 deletions(-)
>
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index fbb7a15daa..3b4c51978c 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -14,6 +14,7 @@
>  #include "internals.h"
>  #include "arm-powerctl.h"
>  #include "qemu/log.h"
> +#include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>
>  #ifndef DEBUG_ARM_POWERCTL
> @@ -48,11 +49,93 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
>      return NULL;
>  }
>
> +struct cpu_on_info {

Since you'll need to respin this anyway, our coding
style likes CamelCase for struct names.

> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index fa5ec76090..15619a0430 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -286,8 +286,8 @@ static int cpu_post_load(void *opaque, int version_id=
)
>
>  const VMStateDescription vmstate_arm_cpu =3D {
>      .name =3D "cpu",
> -    .version_id =3D 22,
> -    .minimum_version_id =3D 22,
> +    .version_id =3D 23,
> +    .minimum_version_id =3D 23,

Sorry, you can't do this, it will break migration. You need
to do something cleverer with a subsection or other trick.

David Gilbert's recent patch on list to docs/migration.txt
should have some examples of how to do this.

>      .pre_save =3D cpu_pre_save,
>      .post_load =3D cpu_post_load,
>      .fields =3D (VMStateField[]) {
> @@ -329,7 +329,7 @@ const VMStateDescription vmstate_arm_cpu =3D {
>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
> -        VMSTATE_BOOL(powered_off, ARMCPU),
> +        VMSTATE_UINT32(power_state, ARMCPU),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections =3D (const VMStateDescription*[]) {

I think the rest is OK.

thanks
-- PMM
