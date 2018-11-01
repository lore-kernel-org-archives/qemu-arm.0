Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 67-v6sm21965122wmd.1.2018.11.01.05.35.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Nov 2018 05:35:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3A0E13E00E9;
	Thu,  1 Nov 2018 12:35:24 +0000 (GMT)
References: <20180926112048.17778-1-alex.bennee@linaro.org> <20180926112048.17778-2-alex.bennee@linaro.org> <CAFEAcA9CDX02Mmt-i+2Ct=at_iS8pjcbSN+ZPhj+BYUC1xXrUQ@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Omair Javaid <omair.javaid@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v1 1/4] target/arm64: properly handle DBGVR RESS bits
In-reply-to: <CAFEAcA9CDX02Mmt-i+2Ct=at_iS8pjcbSN+ZPhj+BYUC1xXrUQ@mail.gmail.com>
Date: Thu, 01 Nov 2018 12:35:24 +0000
Message-ID: <87va5h562b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vM+0a9ueYYjt


Peter Maydell <peter.maydell@linaro.org> writes:

> On 26 September 2018 at 12:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>> This only fails with some (broken) versions of gdb but we should
>> treat the top bits of DBGBVR as RESS. As the hardware may have IMPDEF
>> approaches to writes to this register we apply the sign extension when
>> checking breakpoints.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/kvm64.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index e0b8246283..80ad07ed0c 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -356,13 +356,23 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
>>      return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
>>  }
>>
>> +/*
>> + * We shouldn't rely on gdb correctly setting the top bits of DBGBVR
>> + * and the HW lists the top bits a RESS - sign-extending the top bit
>> + * of the VA address. As it is IMPDEF if the write is either a sign
>> + * extension or kept as is we might fix it up before we compare with
>> + * the correctly reported and sign extended address.
>> + */
>> +
>>  static bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
>>  {
>>      int i;
>>
>>      for (i =3D 0; i < cur_hw_bps; i++) {
>>          HWBreakpoint *bp =3D get_hw_bp(i);
>> -        if (bp->bvr =3D=3D pc) {
>> +        target_ulong bvr =3D bp->bvr;
>> +        bvr |=3D extract64(bvr, 52, 1) ? MAKE_64BIT_MASK(53, 11) : 0;
>> +        if (bvr =3D=3D pc) {
>>              return true;
>>          }
>>      }
>
> Shouldn't we be sanitizing the addresses we get from gdb
> before we put them into the hardware watchpoint registers,
> rather than doing the sign extension when we read the registers?

I guess that works too. I'll switch it around.

--
Alex Benn=C3=A9e
