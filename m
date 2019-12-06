Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n16sm16506771wro.88.2019.12.06.06.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:52:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DF7701FF87;
	Fri,  6 Dec 2019 14:52:42 +0000 (GMT)
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-12-alex.bennee@linaro.org>
 <9362663d-6452-39aa-2a8d-1cfd853d7faa@linaro.org>
 <87o8wm7k6v.fsf@linaro.org>
 <cc54dbf6-01ed-f92d-5088-efe7e917b870@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 11/14] target/arm: default SVE length to 64 bytes for
 linux-user
In-reply-to: <cc54dbf6-01ed-f92d-5088-efe7e917b870@linaro.org>
Date: Fri, 06 Dec 2019 14:52:42 +0000
Message-ID: <87fthx7bgl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PYlnrMI8k8ak


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/5/19 9:31 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 11/30/19 8:45 AM, Alex Benn=C3=A9e wrote:
>>>> The Linux kernel chooses the default of 64 bytes for SVE registers on
>>>> the basis that it is the largest size that won't grow the signal
>>>> frame. When debugging larger sizes are also unwieldy in gdb as each
>>>> zreg will take over a page of terminal to display.
>>>>
>>>> The user can of course always specify a larger size with the
>>>> sve-max-vq property on the command line:
>>>>
>>>>   -cpu max,sve-max-vq=3D16
>>>>
>>>> This should not make any difference to SVE enabled software as the SVE
>>>> is of course vector length agnostic.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>>  target/arm/cpu64.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>
>>> 6 is the largest size that doesn't grow the signal frame.
>>> I imagine 4 was chosen because that's the only real hw atm.
>>>
>>>> +        /* Default sve-max-vq to a reasonable numer */
>>>> +        cpu->sve_max_vq =3D 4;
>>>
>>> I also agree that we should match the kernel, but this is not the right=
 way.
>>> Changing max vq is not the same as changing the default vq.
>>>
>>> You should change the value of env->vfp.zcr_el[1] in arm_cpu_reset(), a=
nd the
>>> user can increase the length with prctl(2) as they would be able to on =
real
>>> hardware that would have support for longer vector lengths.
>>=20
>> No the intention is to default to a lower max VQ because...
>>=20
>>> Also, I don't think you should mix this up with gdb stuff.
>>=20
>> it is what we use for sizing the registers for the gdbstub. The other
>> option would be to use the effective zcr_el1 value at the time of the
>> gdbstub connecting but then things will go horribly wrong if the user
>> execute a prctl and widens their size.
>
> Why would you care about the size of the registers as passed by default? =
 You
> shouldn't need or want to change that default to make gdbstub work.
>
> The gdbstub should be passing along the vq value (via the "vg" pseudo-reg=
ister,
> iirc), and gdb should be working out what to display based on that.
>
> If that isn't happening, and you are only changing the default so that gdb
> quits displaying massive registers when they aren't in use, then you're d=
oing
> something wrong with gdb and gdbstub.

Currently the upstream gdbserver sends the XML based on the VL at start-up.=
 It
doesn't handle changes in the vector size.

--=20
Alex Benn=C3=A9e
