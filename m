Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id m10-20020a05600c3b0a00b003b47b913901sm25864734wms.1.2022.09.26.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 08:46:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BD0A51FFB7;
	Mon, 26 Sep 2022 16:46:43 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-4-alex.bennee@linaro.org>
 <CAFEAcA9OF4DOvYcfLJ6msAVNe9t_Ufxu9gHWUiuZFj-9qq9epQ@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v2 03/11] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Date: Mon, 26 Sep 2022 16:46:14 +0100
In-reply-to: <CAFEAcA9OF4DOvYcfLJ6msAVNe9t_Ufxu9gHWUiuZFj-9qq9epQ@mail.gmail.com>
Message-ID: <87zgem2l5o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cib6oahLHiiC


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> As most HVF devices are done purely in software we need to make sure
>> we properly encode the source CPU in MemTxAttrs. This will allow the
>> device emulations to use those attributes rather than relying on
>> current_cpu (although current_cpu will still be correct in this case).
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Mads Ynddal <mads@ynddal.dk>
>> Cc: Alexander Graf <agraf@csgraf.de>
>> ---
>>  target/arm/hvf/hvf.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index 060aa0ccf4..13b7971560 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>>              val =3D hvf_get_reg(cpu, srt);
>>              address_space_write(&address_space_memory,
>>                                  hvf_exit->exception.physical_address,
>> -                                MEMTXATTRS_UNSPECIFIED, &val, len);
>> +                                MEMTXATTRS_CPU(cpu->cpu_index), &val, l=
en);
>>          } else {
>>              address_space_read(&address_space_memory,
>>                                 hvf_exit->exception.physical_address,
>> -                               MEMTXATTRS_UNSPECIFIED, &val, len);
>> +                               MEMTXATTRS_CPU(cpu->cpu_index), &val, le=
n);
>>              hvf_set_reg(cpu, srt, val);
>>          }
>
> Don't we need a similar thing for KVM ? (In that case it's in
> the generic code in accel/kvm/kvm-all.c, for the KVM_EXIT_MMIO
> handling.)

Added to MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
which at least anticipates an out-of-kernel GIC.


>
> -- PMM


--=20
Alex Benn=C3=A9e
