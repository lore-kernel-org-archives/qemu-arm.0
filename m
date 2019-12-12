Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 2sm5239886wrq.31.2019.12.12.00.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 00:24:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4B3C51FF87;
	Thu, 12 Dec 2019 08:24:11 +0000 (GMT)
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
 <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our
 SVE registers
In-reply-to: <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org>
Date: Thu, 12 Dec 2019 08:24:11 +0000
Message-ID: <87y2vi0x5g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JS5ZGuVN68hQ


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/11/19 9:05 AM, Alex Benn=C3=A9e wrote:
>> +static struct TypeSize vec_lanes[] =3D {
>
> const.
>
>> +    case 51:
>> +        return gdb_get_reg64(buf, (cpu->env.vfp.zcr_el[1] & 0xf) + 1);
>
> You need to use sve_zcr_len_for_el to get the effective vq.
> Also, I thought vg =3D=3D 2 * vq.
>  > +    case 51:
>> +    {
>> +        uint64_t val =3D *(uint64_t *) buf;
>> +        cpu->env.vfp.zcr_el[1] =3D (val - 1) & 0xf;
>
> You cannot hard-code EL1 without ifdef CONFIG_USER_ONLY.  If the effectiv=
e vq
> decreases, you must call aarch64_sve_narrow_vq.  You must call
> arm_rebuild_hflags.

Hmm thinking about it this is overriding the kernels competencies - it
should be read only as it is a "virtual" register. Given gdbserver
doesn't use the value and will most likely use dynamic XML we could just
drop it altogether.=20

>
>
> r~


--=20
Alex Benn=C3=A9e
