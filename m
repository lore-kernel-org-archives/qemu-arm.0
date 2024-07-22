Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c8be6fesm468592666b.100.2024.07.22.16.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 16:09:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D6BBB5F8B0;
	Tue, 23 Jul 2024 00:09:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  Warner Losh
 <imp@bsdimp.com>,  qemu-devel@nongnu.org,  Kyle Evans
 <kevans@freebsd.org>,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH 13/14] bsd-user: Make compile for non-linux user-mode stuff
In-Reply-To: <97219e8c-e210-4108-9873-abe2a933a3f1@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 23 Jul 2024 00:01:13
 +0200")
References: <20240722214313.89503-1-imp@bsdimp.com>
	<20240722214313.89503-14-imp@bsdimp.com>
	<97219e8c-e210-4108-9873-abe2a933a3f1@linaro.org>
Date: Tue, 23 Jul 2024 00:09:23 +0100
Message-ID: <87jzhdxbvg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 384NTJ4QCFbk

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Warner,
>
> On 22/7/24 23:43, Warner Losh wrote:
>> We include the files that define PR_MTE_TCF_SHIFT only on Linux, but use
>> them unconditionally. Restrict its use to Linux-only.
>
> We should check that in meson, i.e.:
>
> config_host_data.set('CONFIG_PRCTL_PR_MTE_TCF_SHIFT',
>                      cc.has_header_symbol('sys/prctl.h',
>                      'PR_MTE_TCF_SHIFT'))

Surely this fails for non-aarch64 hosts?

> (like we do for CONFIG_PRCTL_PR_SET_TIMERSLACK), then rework
> linux-user/aarch64/mte_user_helper.h (and possibly
> tests/tcg/aarch64/mte.h), moving in a common directory.
>
> That said, your patch matches this file header:
>
>   #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
>   #include <sys/prctl.h>
>   #include "mte_user_helper.h"
>   #endif
>
> Even if this #ifdef'ry is ugly, it isn't wrong, so:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> =C2=AF\_(=E3=83=84)_/=C2=AF
>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> ---
>>   target/arm/gdbstub64.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
>> index 2e2bc2700b8..6dc81aecb2a 100644
>> --- a/target/arm/gdbstub64.c
>> +++ b/target/arm/gdbstub64.c
>> @@ -404,6 +404,7 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteA=
rray *buf, int reg)
>>     int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int
>> reg)
>>   {
>> +#if defined(CONFIG_LINUX)
>>       ARMCPU *cpu =3D ARM_CPU(cs);
>>       CPUARMState *env =3D &cpu->env;
>>   @@ -425,6 +426,9 @@ int aarch64_gdb_set_tag_ctl_reg(CPUState *cs,
>> uint8_t *buf, int reg)
>>       arm_set_mte_tcf0(env, tcf);
>>         return 1;
>> +#else
>> +    return 0;
>> +#endif
>>   }
>>     static void handle_q_memtag(GArray *params, void *user_ctx)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
