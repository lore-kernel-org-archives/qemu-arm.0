Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc34a000000b003a60f0f34b7sm2371418wmj.40.2022.09.16.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:34:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DCFA11FFB7;
	Fri, 16 Sep 2022 16:34:33 +0100 (BST)
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
 <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
 <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Fri, 16 Sep 2022 16:28:14 +0100
In-reply-to: <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org>
Message-ID: <871qsb8h9y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: P566PIBCKzKe


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 15/9/22 10:16, Richard Henderson wrote:
>> On 9/14/22 17:09, Alex Benn=C3=A9e wrote:
>>> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
>>> This solves edge cases like accessing via gdbstub or qtest.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>>> ---
>>> =C2=A0 hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>>> =C2=A0 1 file changed, 22 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>>> index 492b2421ab..7feedac735 100644
>>> --- a/hw/intc/arm_gic.c
>>> +++ b/hw/intc/arm_gic.c
>>> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b=
, 0x00, 0x0d, 0xf0,
>>> 0x05, 0xb1
>>> =C2=A0 };
>>> -static inline int gic_get_current_cpu(GICState *s)
>>> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 if (!qtest_enabled() && s->num_cpu > 1) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return current_cpu->cpu_ind=
ex;
>>> -=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Something other than a CPU accessing the GI=
C would be a bug as
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * would a CPU index higher than the GICState =
expects to be
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * handling
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 g_assert(attrs.requester_cpu =3D=3D 1);
>> Better without "=3D=3D 1" -- this field ought to be boolean.
>
> Boolean so far, but this could get more types (such DMA...).
> Maybe we could already add an enum definitions, i.e.:
>
> typedef enum MemTxRequesterType {
>   MEMTXATTRS_CPU,
>   MEMTXATTRS_MSI,
> } MemTxRequesterType;
>
> and name the field MemTxAttrs::requester_type.

I pondered boolean but wasn't sure if that would blow up the size of
MemTxAttrs so went for the bitfield. However I can certainly rename to
requester_is_cpu and make a boolean assertion. I'd hold off adding an
enum until we actually have more than two requester types.

--=20
Alex Benn=C3=A9e
