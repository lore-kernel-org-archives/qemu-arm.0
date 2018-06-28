Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 127-v6sm12761489wmk.45.2018.06.28.07.39.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jun 2018 07:39:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 827D73E07DD;
	Thu, 28 Jun 2018 15:39:37 +0100 (BST)
References: <20180625160009.17437-1-alex.bennee@linaro.org> <20180625160009.17437-3-alex.bennee@linaro.org> <CAFEAcA8JHHp2oVvUqX0oGhc+R7u1PNCWW1Q052ujpTx9WbVNDw@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 2/5] target/arm: relax permission checks for HWCAP_CPUID registers
In-reply-to: <CAFEAcA8JHHp2oVvUqX0oGhc+R7u1PNCWW1Q052ujpTx9WbVNDw@mail.gmail.com>
Date: Thu, 28 Jun 2018 15:39:37 +0100
Message-ID: <87po0bug9i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3gpa99SnzDuT


Peter Maydell <peter.maydell@linaro.org> writes:

> On 25 June 2018 at 17:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>> Although technically not visible to userspace the kernel does make
>> them visible via trap and emulate. For user mode we can provide the
>> value directly but we need to relax our permission checks to do this.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/helper.c | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 6e6b1762e8..9d81feb124 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -5813,7 +5813,19 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cp=
u,
>>      if (r->state !=3D ARM_CP_STATE_AA32) {
>>          int mask =3D 0;
>>          switch (r->opc1) {
>> -        case 0: case 1: case 2:
>> +        case 0:
>> +#ifdef CONFIG_USER_ONLY
>> +            /* Some AArch64 CPU ID/feature are exported to userspace
>> +             * by the kernel (see HWCAP_CPUID) */
>> +            if (r->opc0 =3D=3D 3 && r->crn =3D=3D 0 &&
>> +                (r->crm =3D=3D 0 ||
>> +                 (r->crm >=3D 4 && r->crm <=3D 7))) {
>> +                mask =3D PL0_R;
>> +                break;
>> +            }
>> +#endif
>> +            /* fall-through */
>> +        case 1: case 2:
>>              /* min_EL EL1 */
>>              mask =3D PL1_RW;
>>              break;
>
> This looks like a rather inelegant place to shove a CONFIG_USER_ONLY
> special case. Isn't there a cleaner way to do whatever this is trying
> to achieve?

Well technically those registers aren't accessible to user space and
this is a sanity check to ensure we don't accidentally make them
accessible. But it does get in the way of emulating the traps for
USER_ONLY.


>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
