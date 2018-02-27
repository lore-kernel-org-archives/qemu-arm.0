Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a67sm27716521wrc.13.2018.02.27.10.17.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 10:17:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id ACD033E00B4;
	Tue, 27 Feb 2018 18:17:28 +0000 (GMT)
References: <20180227143852.11175-1-alex.bennee@linaro.org> <20180227143852.11175-15-alex.bennee@linaro.org> <19852743-3c93-9d0f-5ef6-8bf351a98ce7@linaro.org> <87zi3uuxpx.fsf@linaro.org> <CAFEAcA8zVbZkzLtB+L3x9WQ6Sgh+i_gzVxYdaLJfENYDyApAAA@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 14/31] arm/translate-a64: add FP16 FMULX/MLS/FMLA to simd_indexed
In-reply-to: <CAFEAcA8zVbZkzLtB+L3x9WQ6Sgh+i_gzVxYdaLJfENYDyApAAA@mail.gmail.com>
Date: Tue, 27 Feb 2018 18:17:28 +0000
Message-ID: <87y3jeuwjr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MeHLBIOAy6k1


Peter Maydell <peter.maydell@linaro.org> writes:

> On 27 February 2018 at 17:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 02/27/2018 06:38 AM, Alex Benn=C3=A9e wrote:
>>>> @@ -11244,7 +11245,7 @@ static void disas_simd_indexed(DisasContext *s=
, uint32_t insn)
>>>>          }
>>>>          /* fall through */
>>>>      case 0x9: /* FMUL, FMULX */
>>>> -        if (!extract32(size, 1, 1)) {
>>>> +        if (size =3D=3D 1) {
>>>>              unallocated_encoding(s);
>>>>              return;
>>>>          }
>>>
>>> This is still redundant, since size =3D=3D 1 is handled...
>>
>> doh!
>>
>> will fix.
>
> I'd prefer it if you didn't, because I'm in the process of putting
> this version of the patchset into target-arm.next...

Fair enough - you've picked up Richard's r-b?

--
Alex Benn=C3=A9e
