Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c1sm1996470wre.10.2018.02.23.02.23.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 02:23:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D30303E0260;
	Fri, 23 Feb 2018 10:23:07 +0000 (GMT)
References: <20180208173157.24705-1-alex.bennee@linaro.org> <20180208173157.24705-21-alex.bennee@linaro.org> <d6f98bba-04ca-80f6-1fad-cfed416f4127@linaro.org> <87h8q99bv9.fsf@linaro.org> <491cdad9-58a1-2f2d-a415-c2b6c1562eab@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 20/32] arm/translate-a64: add FP16 FCMxx (zero) to simd_two_reg_misc_fp16
In-reply-to: <491cdad9-58a1-2f2d-a415-c2b6c1562eab@linaro.org>
Date: Fri, 23 Feb 2018 10:23:07 +0000
Message-ID: <87eflc9f90.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ksm4X346yw7a


Richard Henderson <richard.henderson@linaro.org> writes:

> On 02/22/2018 09:23 AM, Alex Benn=C3=A9e wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 02/08/2018 09:31 AM, Alex Benn=C3=A9e wrote:
>>>> +            maxpasses =3D hp ? (is_q ? 8 : 4) : (is_q ? 4 : 2);
>>>
>>>   (8 << is_q) >> size
>>>
>>> ?
>>
>> Hmm I'm not so sure about this. While mine is longer form at least the
>> intent is clear. What about:
>>
>>     maxpasses =3D (is_q ? 4 : 2) << hp
>>
>> It's still a little magical IMHO though...
>
> Two variables then?
>
>   vector_size =3D 8 << is_q;
>   maxpasses =3D vector_size >> size;
>
> Why do you want the "hp" variable when you already have "size"?

Well I had introduced hp for:

  genfn =3D hp ? gen_helper_advsimd_cgt_f16 : gen_helper_neon_cgt_f32;

Instead of having it long form. I guess it could be neater though.

--
Alex Benn=C3=A9e
