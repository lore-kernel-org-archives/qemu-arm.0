Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190c9asm1653587f8f.93.2025.06.20.03.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:16:31 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C89885F876;
	Fri, 20 Jun 2025 11:16:30 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  "open list:ARM cores" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: clamp value to account for RES0 fields
In-Reply-To: <CAFEAcA_TODi-ZAkA900eV02TyKKD+gib4YxscUomoDt=q+RT7g@mail.gmail.com>
	(Peter Maydell's message of "Fri, 20 Jun 2025 10:58:21 +0100")
References: <20250616201042.2196127-1-alex.bennee@linaro.org>
	<CAFEAcA_TODi-ZAkA900eV02TyKKD+gib4YxscUomoDt=q+RT7g@mail.gmail.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 20 Jun 2025 11:16:30 +0100
Message-ID: <871preu39d.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8UUeRPknBCpd

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 16 Jun 2025 at 21:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> If the user writes a large value to the register but with the bottom
>> bits unset we could end up with something illegal. By clamping ahead
>> of the check we at least assure we won't assert(bpr > 0) later in the
>> GIC interface code.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  hw/intc/arm_gicv3_cpuif.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
>> index 4b4cf09157..165f7e9c2f 100644
>> --- a/hw/intc/arm_gicv3_cpuif.c
>> +++ b/hw/intc/arm_gicv3_cpuif.c
>> @@ -1797,6 +1797,9 @@ static void icc_bpr_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
>>      trace_gicv3_icc_bpr_write(ri->crm =3D=3D 8 ? 0 : 1,
>>                                gicv3_redist_affid(cs), value);
>>
>> +    /* clamp the value to 2:0, the rest os RES0 */
>> +    value =3D deposit64(0, 0, 3, value);
>
> Should be extract64(), as RTH notes (or just &=3D 7 if you like).
>
>> +
>>      if (grp =3D=3D GICV3_G1 && gicv3_use_ns_bank(env)) {
>>          grp =3D GICV3_G1NS;
>>      }
>> @@ -1820,7 +1823,7 @@ static void icc_bpr_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
>>          value =3D minval;
>>      }
>>
>> -    cs->icc_bpr[grp] =3D value & 7;
>> +    cs->icc_bpr[grp] =3D value;
>>      gicv3_cpuif_update(cs);
>
> Yes, I agree we should do the "work only on the 3 bit field"
> part before we do the "enforce the minimum value" logic.
>
> The handling in icv_bpr_write() has a similar issue.
>
> (Why was your guest writing garbage to this register?)

Heh, it was writing the SP instead of the XR, this is how I found out I
was getting it wrong ;-)

>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
