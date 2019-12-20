Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a16sm9666449wrt.37.2019.12.20.05.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 05:14:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 915261FF87;
	Fri, 20 Dec 2019 13:14:31 +0000 (GMT)
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
 <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org>
 <87k16sdt4d.fsf@linaro.org>
 <5c6dd0a9-23ba-63ff-5738-8bac11aad810@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Machado <luis.machado@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 alan.hayward@arm.com, damien.hedde@greensocs.com, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our
 SVE registers
In-reply-to: <5c6dd0a9-23ba-63ff-5738-8bac11aad810@linaro.org>
Date: Fri, 20 Dec 2019 13:14:31 +0000
Message-ID: <87eewzdtqg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NBP0Kabk8TBr


Luis Machado <luis.machado@linaro.org> writes:

> On 12/19/19 4:15 PM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 12/11/19 9:05 AM, Alex Benn=C3=A9e wrote:
>>>> +static struct TypeSize vec_lanes[] =3D {
>>>
>>> const.
>>>
>>>> +    case 51:
>>>> +        return gdb_get_reg64(buf, (cpu->env.vfp.zcr_el[1] & 0xf) + 1);
>>>
>>> You need to use sve_zcr_len_for_el to get the effective vq.
>>> Also, I thought vg =3D=3D 2 * vq.
>>>   > +    case 51:
>>>> +    {
>>>> +        uint64_t val =3D *(uint64_t *) buf;
>>>> +        cpu->env.vfp.zcr_el[1] =3D (val - 1) & 0xf;
>>>
>>> You cannot hard-code EL1 without ifdef CONFIG_USER_ONLY.  If the effect=
ive vq
>>> decreases, you must call aarch64_sve_narrow_vq.  You must call arm_rebu=
ild_hflags.
>> I'm just going to drop vg (and therefor the ability to set it) from
>> the
>> regset. It was only meant to be an indicator and gdb doesn't actually
>> look to it to size it's output. The likely dynamic extension will just
>> re-transmit the whole XML when a change occurs.
>>=20
>
> I'd verify with GDB first if vg isn't actually required.

It works with my tests but perhaps we use our own namespaced XML rather
than the gdbstub XML.

> From looking at GDB's code, it does set vg as one of the register
> names, and this is regardless of any XML input. It does reference VG=20
> here and there in the code, even though it may not use it to size its
> output.

But this is all special casing for feature
name=3D"org.gnu.gdb.aarch64.sve" right?

--=20
Alex Benn=C3=A9e
