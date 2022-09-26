Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id q12-20020a7bce8c000000b003b5054c6cd2sm13191139wmj.36.2022.09.26.08.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 08:06:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0F8041FFB7;
	Mon, 26 Sep 2022 16:06:11 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-3-alex.bennee@linaro.org>
 <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 02/11] target/arm: enable tracking of CPU index in
 MemTxAttrs
Date: Mon, 26 Sep 2022 16:05:34 +0100
In-reply-to: <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
Message-ID: <87pmfi41lp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NLhUOKisR1ok


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> Both arm_cpu_tlb_fill (for normal IO) and
>> arm_cpu_get_phys_page_attrs_debug (for debug access) come through
>> get_phys_addr which is setting the other memory attributes for the
>> transaction. As these are all by definition CPU accesses we can also
>> set the requested_type/index as appropriate.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/ptw.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index 3261039d93..644d450662 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -2315,6 +2315,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong =
address,
>>  {
>>      ARMMMUIdx s1_mmu_idx =3D stage_1_mmu_idx(mmu_idx);
>>
>> +    attrs->requester_type =3D MEMTXATTRS_CPU;
>> +    attrs->requester_id =3D env_cpu(env)->cpu_index;
>> +
>
> This only catches the case where the memory access is
> done via something that does a virtual-to-physical translation.
> It misses memory accesses done directly on physical addresses,
> such as those in arm_ldl_ptw() and arm_ldq_ptw(), plus various
> M-profile specific ones.

I thought they were just used for the page table walk. Can you place
your page tables aliases with a piece of HW?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
