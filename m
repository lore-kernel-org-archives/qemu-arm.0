Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t5sm13215195wrr.35.2019.12.05.09.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 09:58:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3E09E1FF87;
	Thu,  5 Dec 2019 17:58:39 +0000 (GMT)
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-7-alex.bennee@linaro.org>
 <987465d3-3b13-e675-9622-c13e2d5205c2@redhat.com>
 <42017B4E-E961-494C-A505-FCDA74EFB265@arm.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alan Hayward <Alan.Hayward@arm.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "damien.hedde@greensocs.com" <damien.hedde@greensocs.com>, Peter Maydell
 <peter.maydell@linaro.org>, Luis Machado <luis.machado@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "open
 list:ARM
 TCG CPUs" <qemu-arm@nongnu.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, nd <nd@arm.com>
Subject: Re: [PATCH v2 06/14] target/arm: use gdb_get_reg helpers
In-reply-to: <42017B4E-E961-494C-A505-FCDA74EFB265@arm.com>
Date: Thu, 05 Dec 2019 17:58:39 +0000
Message-ID: <87lfrq7iy8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: p0DnP//V4SBJ


Alan Hayward <Alan.Hayward@arm.com> writes:

>> On 1 Dec 2019, at 20:05, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>=
 wrote:
>>=20
>> On 11/30/19 9:45 AM, Alex Benn=C3=A9e wrote:
>>> This is cleaner than poking memory directly and will make later
>>> clean-ups easier.
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>> v2
>>>   - make sure we pass hi/lo correctly as quads are stored in LE order
>>> ---
>>>  target/arm/helper.c | 18 +++++++-----------
>>>  1 file changed, 7 insertions(+), 11 deletions(-)
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 0bf8f53d4b8..0ac950d6c71 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -105,21 +105,17 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *e=
nv, uint8_t *buf, int reg)
>>>  {
>>>      switch (reg) {
>>>      case 0 ... 31:
>>> -        /* 128 bit FP register */
>>> -        {
>>> -            uint64_t *q =3D aa64_vfp_qreg(env, reg);
>>> -            stq_le_p(buf, q[0]);
>>> -            stq_le_p(buf + 8, q[1]);
>>> -            return 16;
>>> -        }
>>> +    {
>>> +        /* 128 bit FP register - quads are in LE order */
>>=20
>> Oh, this was always wrong on BE :(
>
> Am I right in thinking this patch correctly matches the SVE BE changes fr=
om June?
>
> Specifically, this patch:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-June/657826.ht=
ml

Not quite. This is just taking into account the way we store the data
internally in cpu.h. The gdb_get_reg128 helper will then ensure stuff is
in target endian format which is what gdbstub defines.

There aren't any actual kernel to userspace transfers going on here.

>
>
> Alan.
>
>>=20
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>=20
>>> +        uint64_t *q =3D aa64_vfp_qreg(env, reg);
>>> +        return gdb_get_reg128(buf, q[1], q[0]);
>>> +    }
>>>      case 32:
>>>          /* FPSR */
>>> -        stl_p(buf, vfp_get_fpsr(env));
>>> -        return 4;
>>> +        return gdb_get_reg32(buf, vfp_get_fpsr(env));
>>>      case 33:
>>>          /* FPCR */
>>> -        stl_p(buf, vfp_get_fpcr(env));
>>> -        return 4;
>>> +        return gdb_get_reg32(buf,vfp_get_fpcr(env));
>>>      default:
>>>          return 0;
>>>      }


--=20
Alex Benn=C3=A9e
