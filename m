Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k18sm132437wmd.4.2018.02.27.09.52.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 09:52:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 136C43E00B4;
	Tue, 27 Feb 2018 17:52:10 +0000 (GMT)
References: <20180227143852.11175-1-alex.bennee@linaro.org> <20180227143852.11175-15-alex.bennee@linaro.org> <19852743-3c93-9d0f-5ef6-8bf351a98ce7@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 14/31] arm/translate-a64: add FP16 FMULX/MLS/FMLA to simd_indexed
In-reply-to: <19852743-3c93-9d0f-5ef6-8bf351a98ce7@linaro.org>
Date: Tue, 27 Feb 2018 17:52:10 +0000
Message-ID: <87zi3uuxpx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /gQ3xpgmj2Y4


Richard Henderson <richard.henderson@linaro.org> writes:

> On 02/27/2018 06:38 AM, Alex Benn=C3=A9e wrote:
>> @@ -11244,7 +11245,7 @@ static void disas_simd_indexed(DisasContext *s, =
uint32_t insn)
>>          }
>>          /* fall through */
>>      case 0x9: /* FMUL, FMULX */
>> -        if (!extract32(size, 1, 1)) {
>> +        if (size =3D=3D 1) {
>>              unallocated_encoding(s);
>>              return;
>>          }
>
> This is still redundant, since size =3D=3D 1 is handled...

doh!

will fix.

>
>> @@ -11256,18 +11257,34 @@ static void disas_simd_indexed(DisasContext *s=
, uint32_t insn)
>>      }
>>
>>      if (is_fp) {
>> -        /* low bit of size indicates single/double */
>> -        size =3D extract32(size, 0, 1) ? 3 : 2;
>> -        if (size =3D=3D 2) {
>> +        /* convert insn encoded size to TCGMemOp size */
>> +        switch (size) {
>> +        case 2: /* single precision */
>> +            size =3D MO_32;
>>              index =3D h << 1 | l;
>> -        } else {
>> +            rm |=3D (m << 4);
>> +            break;
>> +        case 3: /* double precision */
>> +            size =3D MO_64;
>>              if (l || !is_q) {
>>                  unallocated_encoding(s);
>>                  return;
>>              }
>>              index =3D h;
>> +            rm |=3D (m << 4);
>> +            break;
>> +        case 0: /* half precision */
>> +            size =3D MO_16;
>> +            index =3D h << 2 | l << 1 | m;
>> +            is_fp16 =3D true;
>> +            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
>> +                break;
>> +            }
>> +            /* fallthru */
>> +        default: /* unallocated */
>> +            unallocated_encoding(s);
>> +            return;
>>          }
>
> ... here.  But it's not wrong and I can clean this up along with the addi=
tional
> changes I need to make to this function for fcmla support.  So,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


--
Alex Benn=C3=A9e
