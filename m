Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g206sm3612077wme.46.2020.03.03.04.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 04:09:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 249621FF87;
	Tue,  3 Mar 2020 12:09:17 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-7-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v6 06/18] hw/arm/allwinner: add CPU Configuration module
In-reply-to: <20200301215029.15196-7-nieklinnenbank@gmail.com>
Date: Tue, 03 Mar 2020 12:09:17 +0000
Message-ID: <87d09t7i8i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NIbJcmdL3wuY


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> Various Allwinner System on Chip designs contain multiple processors
> that can be configured and reset using the generic CPU Configuration
> module interface. This commit adds support for the Allwinner CPU
> configuration interface which emulates the following features:
>
>  * CPU reset
>  * CPU status
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
<snip>
> +
> +/* CPUCFG constants */
> +enum {
> +    CPU_EXCEPTION_LEVEL_ON_RESET =3D 3, /* EL3 */
> +};
> +
> +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_id)
> +{
> +    int ret;
> +
> +    trace_allwinner_cpucfg_cpu_reset(cpu_id, s->entry_addr);
> +
> +    ret =3D arm_set_cpu_on(cpu_id, s->entry_addr, 0,
> +                         CPU_EXCEPTION_LEVEL_ON_RESET, false);

According to the arm_set_cpu_on code:

    if (!target_aa64 && arm_feature(&target_cpu->env, ARM_FEATURE_AARCH64))=
 {
        /*
         * For now we don't support booting an AArch64 CPU in AArch32 mode
         * TODO: We should add this support later
         */
        qemu_log_mask(LOG_UNIMP,
                      "[ARM]%s: Starting AArch64 CPU %" PRId64
                      " in AArch32 mode is not supported yet\n",
                      __func__, cpuid);
        return QEMU_ARM_POWERCTL_INVALID_PARAM;
    }

Do you really want to reboot in aarch32 mode on a reset? If so we should
fix the TODO.

--=20
Alex Benn=C3=A9e
