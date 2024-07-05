Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1117652njb;
        Fri, 5 Jul 2024 03:07:34 -0700 (PDT)
X-Received: by 2002:a17:906:f24c:b0:a77:c080:11fa with SMTP id a640c23a62f3a-a77c080126amr223635466b.48.1720174053908;
        Fri, 05 Jul 2024 03:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720174053; cv=none;
        d=google.com; s=arc-20160816;
        b=QULUES10HFlkV9U+TebUCNbZAaztJi7VuDBCl98ygIA+ffqFbR6Z2gzjdWn7KR0zBH
         7+gUFqj6SjNDtOGmCa7IlKGyG6Cs1C8LdmNfoscJs3h64bD6Z+qSVwIAIymgUT4Qkf13
         A1aFa1ZfMhhS8vSOCnzCZZDh2jcZUEaxylOErTDo078/3wxBC45fpQMHSOKkW8BGukrQ
         vkz5CPdxUZhdis+WhysUWDxXa2Jc41UQ/8fRCjoXESz+z/O2zwFc3rt6DxgZxA0OgVHD
         iG7dJMxFC+/Yzz2P5SxpORFF5W9Dv75eoGYUsDy9JLUvqT/Uhf4mevKHIZ5hqkpdmk6k
         Zlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3I58MnZMXrqowhLjtFic4a7xlF9J1HaX1eNCrjEIEIw=;
        fh=0zGuvTPwB0nSVi9p8cu2BBeBHdjbp1/cCExp+Crewlo=;
        b=Zm664bzi3iyv1K30dXT9FGzsYNhgZsMamXGMUalwIR339ypv8UNC5D+zJwVLnDlF80
         gpmHgtT23R7niIeUNode1yEaOYvvP8jzMezy1bnp/R4YxY+zpQFMrlEAMmwEc0g+VOmP
         8HzPiyWUvqT7LjhZzKvwviuQ6uRwQvG3IpbjssA+JteiJpreHgWjSNwbm5BqSCsu4/+H
         1MTcVhNCbBQ/PnDkrKkakHZBepLdCilKlXZimKwbGjUDcX0hTk6jDnFOawsqasl2b4uX
         mRV7x7eqXM3FK3tMSFT76oWDGWkQUA0xKoFrt/dIA5Gmq6vyx7YDwcaa0itnV63MsTcS
         ynrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXRmGd6e;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a754410aed3sor234668566b.6.2024.07.05.03.07.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 03:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXRmGd6e;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720174053; x=1720778853; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I58MnZMXrqowhLjtFic4a7xlF9J1HaX1eNCrjEIEIw=;
        b=LXRmGd6emyO0aWO54NnQIalLd5UiJ1AW2oLcmxyxVCiqohqramaOYr+MYs/d5mfSrY
         iXdD7lnEbB+dVs0Hynq44nWT+Hq6ZvricUt+FzOPJjUT+5IkCg/qz9kUV8csGQgaM/KF
         Up3pVW5TxsiYIzUVk1NwZ1sZoOh5umbivo60NHtO9Ssm5yHEG28eCRBJ2b5iDmhg0CP7
         aRY7HaPv9Oqs8Xa1mbgtDi3leWuB8w3JcRqzMFtpYllJP7rSqa8eRJ8NAROQ2pywuaoS
         23r81Gm4YOYnXc5RZ5SsAMQ+Th3z5sTCWS3V08k44A83JmtjQB6dRVg8lCwx3QnC1r9W
         UX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720174053; x=1720778853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3I58MnZMXrqowhLjtFic4a7xlF9J1HaX1eNCrjEIEIw=;
        b=PfueL3l7oPB59fJ7Ia3t0R4orLidi9jmkzB1CGpbT/muLYL0TOtvBLCZqDjT/R+TnL
         wZiHbyFX2SKJSpK+X/C7QzjNObBhDP7FBOkJ4WOgVcqsMhO1hEUotW0pHPYOgcxwFFtX
         ml4Hdv0rZzYFQ0dOWWeUbAYc5YXXLuG71fXP+vqresmRFw1uvT6XMMX1b6qcTA0/rLSP
         W50MjoU1a9kXWJrasZ/Zcifz40i6AALoRiOU0GchCH/JrNvwxzsO0COfCtTSVbmiMLix
         IBRjnig4e6ovLnm2fRFug5ORqDrLIkporfvOiVxH03QRokVwRYBGYK+X0OJJ50gdtNWa
         l5pg==
X-Gm-Message-State: AOJu0YygnD0Ds7VlF/1bglFrlPddSgFr0BfRWBUeAmYdvRCtGVJVFx2v
	NmVkeYmgtXwYNk1OkZHqNA3tX3vLzLHhZtUfDdB69pitU1fb+GEG/yxHQvehxcAFP01e/Mbc3HL
	hgZU0YNAIBWwTItHiprDXGttXnJCWo7g5tfv98U0sdbR0V8SZbOnXHIcd
X-Google-Smtp-Source: AGHT+IFFMaVK0V6IbB8OeY4xSmia7qYLCJR+m56rxWhxHL/6YjqYV28jjn1gLHFNpxmlE11ZdKCSttA4SfsoS3RnEno=
X-Received: by 2002:a17:907:7843:b0:a77:c976:2987 with SMTP id
 a640c23a62f3a-a77c97634c7mr118785466b.29.1720174052968; Fri, 05 Jul 2024
 03:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-36-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-36-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 13:07:17 +0300
Message-ID: <CAAjaMXb5Gs_gcyxK3v+KSgFRyau=txggYX9KJorXcbKJjWU9PQ@mail.gmail.com>
Subject: Re: [PATCH v2 35/40] target/arm: Factor out code for setting MTE TCF0 field
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
	Thomas Huth <thuth@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Aleksandar Rikalo <arikalo@gmail.com>, Mads Ynddal <mads@ynddal.dk>, Yanan Wang <wangyanan55@huawei.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Burton <paulburton@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
	Gustavo Romero <gustavo.romero@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: iuwgknvMCNXO

On Fri, 5 Jul 2024 at 11:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From: Gustavo Romero <gustavo.romero@linaro.org>
>
> Factor out the code used for setting the MTE TCF0 field from the prctl
> code into a convenient function. Other subsystems, like gdbstub, need to
> set this field as well, so keep it as a separate function to avoid
> duplication and ensure consistency in how this field is set across the
> board.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Message-Id: <20240628050850.536447-7-gustavo.romero@linaro.org>
> [AJB: clean-up includes, move MTE defines]
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> vAJB:
>   - clean-up includes, move MTE defines
> ---
>  linux-user/aarch64/mte_user_helper.h | 32 +++++++++++++++++++++++++
>  linux-user/aarch64/target_prctl.h    | 22 ++---------------
>  linux-user/aarch64/mte_user_helper.c | 35 ++++++++++++++++++++++++++++
>  linux-user/syscall.c                 |  9 -------
>  linux-user/aarch64/meson.build       |  2 ++
>  5 files changed, 71 insertions(+), 29 deletions(-)
>  create mode 100644 linux-user/aarch64/mte_user_helper.h
>  create mode 100644 linux-user/aarch64/mte_user_helper.c
>
> diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mt=
e_user_helper.h
> new file mode 100644
> index 0000000000..8685e5175a
> --- /dev/null
> +++ b/linux-user/aarch64/mte_user_helper.h
> @@ -0,0 +1,32 @@
> +/*
> + * ARM MemTag convenience functions.
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +
> +#ifndef AARCH64_MTE_USER_HELPER_H
> +#define AARCH64_MTE USER_HELPER_H
> +
> +#ifndef PR_MTE_TCF_SHIFT
> +# define PR_MTE_TCF_SHIFT       1
> +# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TAG_SHIFT       3
> +# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
> +#endif
> +
> +/**
> + * arm_set_mte_tcf0 - Set TCF0 field in SCTLR_EL1 register
> + * @env: The CPU environment
> + * @value: The value to be set for the Tag Check Fault in EL0 field.
> + *
> + * Only SYNC and ASYNC modes can be selected. If ASYMM mode is given, th=
e SYNC
> + * mode is selected instead. So, there is no way to set the ASYMM mode.
> + */
> +void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
> +
> +#endif /* AARCH64_MTE_USER_HELPER_H */
> diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/targe=
t_prctl.h
> index aa8e203c15..ed75b9e4b5 100644
> --- a/linux-user/aarch64/target_prctl.h
> +++ b/linux-user/aarch64/target_prctl.h
> @@ -7,6 +7,7 @@
>  #define AARCH64_TARGET_PRCTL_H
>
>  #include "target/arm/cpu-features.h"
> +#include "mte_user_helper.h"
>
>  static abi_long do_prctl_sve_get_vl(CPUArchState *env)
>  {
> @@ -173,26 +174,7 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArc=
hState *env, abi_long arg2)
>      env->tagged_addr_enable =3D arg2 & PR_TAGGED_ADDR_ENABLE;
>
>      if (cpu_isar_feature(aa64_mte, cpu)) {
> -        /*
> -         * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
> -         *
> -         * The kernel has a per-cpu configuration for the sysadmin,
> -         * /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred,
> -         * which qemu does not implement.
> -         *
> -         * Because there is no performance difference between the modes,=
 and
> -         * because SYNC is most useful for debugging MTE errors, choose =
SYNC
> -         * as the preferred mode.  With this preference, and the way the=
 API
> -         * uses only two bits, there is no way for the program to select
> -         * ASYMM mode.
> -         */
> -        unsigned tcf =3D 0;
> -        if (arg2 & PR_MTE_TCF_SYNC) {
> -            tcf =3D 1;
> -        } else if (arg2 & PR_MTE_TCF_ASYNC) {
> -            tcf =3D 2;
> -        }
> -        env->cp15.sctlr_el[1] =3D deposit64(env->cp15.sctlr_el[1], 38, 2=
, tcf);
> +        arm_set_mte_tcf0(env, arg2);
>
>          /*
>           * Write PR_MTE_TAG to GCR_EL1[Exclude].
> diff --git a/linux-user/aarch64/mte_user_helper.c b/linux-user/aarch64/mt=
e_user_helper.c
> new file mode 100644
> index 0000000000..a5b1c8503b
> --- /dev/null
> +++ b/linux-user/aarch64/mte_user_helper.c
> @@ -0,0 +1,35 @@
> +/*
> + * ARM MemTag convenience functions.
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu.h"
> +#include "mte_user_helper.h"
> +
> +void arm_set_mte_tcf0(CPUArchState *env, abi_long value)
> +{
> +    /*
> +     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
> +     *
> +     * The kernel has a per-cpu configuration for the sysadmin,
> +     * /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred,
> +     * which qemu does not implement.
> +     *
> +     * Because there is no performance difference between the modes, and
> +     * because SYNC is most useful for debugging MTE errors, choose SYNC
> +     * as the preferred mode.  With this preference, and the way the API
> +     * uses only two bits, there is no way for the program to select
> +     * ASYMM mode.
> +     */
> +    unsigned tcf =3D 0;
> +    if (value & PR_MTE_TCF_SYNC) {
> +        tcf =3D 1;
> +    } else if (value & PR_MTE_TCF_ASYNC) {
> +        tcf =3D 2;
> +    }
> +    env->cp15.sctlr_el[1] =3D deposit64(env->cp15.sctlr_el[1], 38, 2, tc=
f);
> +}
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index e2804312fc..b8c278b91d 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6281,15 +6281,6 @@ abi_long do_arch_prctl(CPUX86State *env, int code,=
 abi_ulong addr)
>  # define PR_GET_TAGGED_ADDR_CTRL 56
>  # define PR_TAGGED_ADDR_ENABLE  (1UL << 0)
>  #endif
> -#ifndef PR_MTE_TCF_SHIFT
> -# define PR_MTE_TCF_SHIFT       1
> -# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
> -# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
> -# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
> -# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
> -# define PR_MTE_TAG_SHIFT       3
> -# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
> -#endif
>  #ifndef PR_SET_IO_FLUSHER
>  # define PR_SET_IO_FLUSHER 57
>  # define PR_GET_IO_FLUSHER 58
> diff --git a/linux-user/aarch64/meson.build b/linux-user/aarch64/meson.bu=
ild
> index 248c578d15..f75bb3cd75 100644
> --- a/linux-user/aarch64/meson.build
> +++ b/linux-user/aarch64/meson.build
> @@ -9,3 +9,5 @@ vdso_le_inc =3D gen_vdso.process('vdso-le.so',
>                                 extra_args: ['-r', '__kernel_rt_sigreturn=
'])
>
>  linux_user_ss.add(when: 'TARGET_AARCH64', if_true: [vdso_be_inc, vdso_le=
_inc])
> +
> +linux_user_ss.add(when: 'TARGET_AARCH64', if_true: [files('mte_user_help=
er.c')])
> --
> 2.39.2
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
