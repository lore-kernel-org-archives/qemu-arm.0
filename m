Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d3sm3158690wrx.28.2021.06.24.05.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 05:31:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B18B91FF7E;
	Thu, 24 Jun 2021 13:31:21 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-70-alex.bennee@linaro.org>
 <17f14974-a922-dcda-4eb4-8754bf1fd45c@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v16 69/99] target/arm: add tcg cpu accel class
Date: Thu, 24 Jun 2021 11:52:50 +0100
In-reply-to: <17f14974-a922-dcda-4eb4-8754bf1fd45c@linaro.org>
Message-ID: <8735t7saue.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IHvIztVcE1sR


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:52 AM, Alex Benn=C3=A9e wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>> move init, realizefn and reset code into it.
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   target/arm/tcg/tcg-cpu.h        |  4 ++-
>>   target/arm/cpu.c                | 44 ++------------------------
>>   target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
>>   target/arm/tcg/tcg-cpu-models.c | 10 +++---
>>   target/arm/tcg/tcg-cpu.c        | 55 +++++++++++++++++++++++++++++++--
>>   5 files changed, 92 insertions(+), 48 deletions(-)
>> diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
>> index d93c6a6749..dd08587949 100644
>> --- a/target/arm/tcg/tcg-cpu.h
>> +++ b/target/arm/tcg/tcg-cpu.h
>> @@ -22,15 +22,17 @@
>>     #include "cpu.h"
>>   #include "hw/core/tcg-cpu-ops.h"
>> +#include "hw/core/accel-cpu.h"
>
> Ideally we'd have a qemu/typedef.h entry so this include isn't
> needed...

Ok, moved the needed includes into the .c

>
>>     void arm_cpu_synchronize_from_tb(CPUState *cs,
>>                                    const TranslationBlock *tb);
>>   -extern struct TCGCPUOps arm_tcg_ops;
>> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
>
> ... simply for this declaration.
> Also, can we now remove the tcg-cpu-ops.h include?
>
>> @@ -1467,7 +1429,7 @@ static void arm_cpu_class_init(ObjectClass *oc, vo=
id *data)
>>       cc->disas_set_info =3D arm_disas_set_info;
>>     #ifdef CONFIG_TCG
>> -    cc->tcg_ops =3D &arm_tcg_ops;
>> +    cc->init_accel_cpu =3D tcg_arm_init_accel_cpu;
>>   #endif /* CONFIG_TCG */
>
> Is this already inside tcg_enabled()?  Because otherwise it looks as
> if this is overwriting a field also used by kvm.

Is it? I can only see the existing x86 TCG CPU and now in this case
allowing an override of arm_v7m_init_accel_cpu and it's resulting TCG
ops variant. This is because all the 32 bit CPUs now have parent =3D
TYPE_ARM_CPU as their parent class.

> Whereas the code that's being replaced set a field only used by tcg.
>
> KVM sets its hooks differently, via kvm_cpu_accel_register_types, so I
> don't understand this hook at all.  But it seems like there should not
> be two different ways to set acc->cpu_instance_init.

That isn't being reset - it's set once in the which ever
accel_class_init ends up being instantiated. Of course this is all QOM
so I could be wrong.

>
>
> r~


--=20
Alex Benn=C3=A9e
