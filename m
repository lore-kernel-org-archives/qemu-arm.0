Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r15sm6254765wmh.42.2019.09.12.04.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:09:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 66FFA1FF87;
	Thu, 12 Sep 2019 12:09:13 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-3-peter.maydell@linaro.org>
 <87r24lztgq.fsf@linaro.org>
 <CAFEAcA_s1aYO6ZK2pkrrc+YrdCoUww0H_RTOjvaH8z1FOemP0w@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 02/13] target/arm/arm-semi: Always set some
 kind of errno for failed calls
In-reply-to: <CAFEAcA_s1aYO6ZK2pkrrc+YrdCoUww0H_RTOjvaH8z1FOemP0w@mail.gmail.com>
Date: Thu, 12 Sep 2019 12:09:13 +0100
Message-ID: <87o8zpzs86.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 44Xwh032jJjV


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 12 Sep 2019 at 11:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > If we fail a semihosting call we should always set the
>> > semihosting errno to something; we were failing to do
>> > this for some of the "check inputs for sanity" cases.
>> >
>> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> although:
>>
>> > ---
>> >  target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
>> >  1 file changed, 27 insertions(+), 18 deletions(-)
>> >
>> > diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
>> > index 03e60105c05..51b55816faf 100644
>> > --- a/target/arm/arm-semi.c
>> > +++ b/target/arm/arm-semi.c
>> > @@ -232,11 +232,13 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu,=
 gdb_syscall_complete_cb cb,
>> >  #define GET_ARG(n) do {                                 \
>> >      if (is_a64(env)) {                                  \
>> >          if (get_user_u64(arg ## n, args + (n) * 8)) {   \
>> > -            return -1;                                  \
>> > +            errno =3D EFAULT;                             \
>> > +            return set_swi_errno(ts, -1);               \
>>
>> This looks a little queasy given ts is NULL for the softmmu version. I
>> wonder (depending on your approach to -smp for 1/13) if we should just
>> pass the ARMCPU down to the helper?
>
> NULL is fine because the softmmu version of set_swi_errno() doesn't
> do anything with it anyway, right?

Yes it's fine - it just looks a little odd when you are reading it.
Given TaskState is derived from CPUState which you always have you could
just pass cs to set_swi_errno and hide the final implementation detail
there depending on if you are softmmu or linux-user.

But it's purely a subjective style thing, not a bug hence the r-b ;-)

--
Alex Benn=C3=A9e
