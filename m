Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y10sm515562wmm.3.2019.12.05.09.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 09:31:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5EE511FF87;
	Thu,  5 Dec 2019 17:31:52 +0000 (GMT)
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-12-alex.bennee@linaro.org>
 <9362663d-6452-39aa-2a8d-1cfd853d7faa@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 11/14] target/arm: default SVE length to 64 bytes for
 linux-user
In-reply-to: <9362663d-6452-39aa-2a8d-1cfd853d7faa@linaro.org>
Date: Thu, 05 Dec 2019 17:31:52 +0000
Message-ID: <87o8wm7k6v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0KFfmueaY/jB


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/30/19 8:45 AM, Alex Benn=C3=A9e wrote:
>> The Linux kernel chooses the default of 64 bytes for SVE registers on
>> the basis that it is the largest size that won't grow the signal
>> frame. When debugging larger sizes are also unwieldy in gdb as each
>> zreg will take over a page of terminal to display.
>>=20
>> The user can of course always specify a larger size with the
>> sve-max-vq property on the command line:
>>=20
>>   -cpu max,sve-max-vq=3D16
>>=20
>> This should not make any difference to SVE enabled software as the SVE
>> is of course vector length agnostic.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/cpu64.c | 3 +++
>>  1 file changed, 3 insertions(+)
>
> 6 is the largest size that doesn't grow the signal frame.
> I imagine 4 was chosen because that's the only real hw atm.
>
>> +        /* Default sve-max-vq to a reasonable numer */
>> +        cpu->sve_max_vq =3D 4;
>
> I also agree that we should match the kernel, but this is not the right w=
ay.
> Changing max vq is not the same as changing the default vq.
>
> You should change the value of env->vfp.zcr_el[1] in arm_cpu_reset(), and=
 the
> user can increase the length with prctl(2) as they would be able to on re=
al
> hardware that would have support for longer vector lengths.

No the intention is to default to a lower max VQ because...

> Also, I don't think you should mix this up with gdb stuff.

it is what we use for sizing the registers for the gdbstub. The other
option would be to use the effective zcr_el1 value at the time of the
gdbstub connecting but then things will go horribly wrong if the user
execute a prctl and widens their size.

>
>
> r~


--=20
Alex Benn=C3=A9e
