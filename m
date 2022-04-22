Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l16-20020a9d6a90000000b0060548d240d4sm831071otq.74.2022.04.22.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 08:38:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ADAF91FFB7;
	Fri, 22 Apr 2022 16:38:29 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-27-richard.henderson@linaro.org>
 <CAFEAcA98sjUhUccvEAjAWeK+Z7-HER9LDz6LMSFMNuVnBSPW=Q@mail.gmail.com>
 <20b109b9-81fe-e8df-bada-c3a0ce920c45@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 26/60] target/arm: Replace sentinels with ARRAY_SIZE
 in cpregs.h
Date: Fri, 22 Apr 2022 16:36:47 +0100
In-reply-to: <20b109b9-81fe-e8df-bada-c3a0ce920c45@linaro.org>
Message-ID: <87k0bht9fu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ebPLvf6+0MVW


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/22/22 02:37, Peter Maydell wrote:
>> On Sun, 17 Apr 2022 at 19:08, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Remove a possible source of error by removing REGINFO_SENTINEL
>>> and using ARRAY_SIZE (convinently hidden inside a macro) to
>>> find the end of the set of regs being registered or modified.
>>>
>>> The space saved by not having the extra array element reduces
>>> the executable's .data.rel.ro section by about 9k.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>=20
>>> +#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)             =
  \
>>> +    do {                                                              =
  \
>>> +        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) =3D=3D 0);                 =
      \
>>> +        if (ARRAY_SIZE(REGS) =3D=3D 1) {                              =
      \
>>> +            define_one_arm_cp_reg_with_opaque(CPU, REGS, OPAQUE);     =
  \
>>> +        } else {                                                      =
  \
>>> +            define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,     =
  \
>>> +                                               ARRAY_SIZE(REGS));     =
  \
>>> +        }                                                             =
  \
>>> +    } while (0)
>> Do we actually need to special case "array has one element" here,
>> or is this just efficiency?
>> Anyway
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Just efficiency.  There seem to be a lot of these.

If you moved define_arm_cp_regs_with_opaque_len into the header as an
inline surely the compiler could figure it out when presented with a
constant i? The would avoid the need for the special casing in the macro
expansion right?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
>
> r~


--=20
Alex Benn=C3=A9e
