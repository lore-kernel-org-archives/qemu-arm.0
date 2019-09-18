Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l1sm5586160wrb.1.2019.09.18.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 04:33:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C90DB1FF87;
	Wed, 18 Sep 2019 12:33:18 +0100 (BST)
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-8-alex.bennee@linaro.org>
 <afd9bc85-9c79-a456-73c1-fc19e97d1acd@linaro.org>
 <877e661vur.fsf@linaro.org>
 <93ff7174-77c0-d2eb-eac2-d3eef7e88a14@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 7/9] tests/tcg: add float_madds test to
 multiarch
In-reply-to: <93ff7174-77c0-d2eb-eac2-d3eef7e88a14@linaro.org>
Date: Wed, 18 Sep 2019 12:33:18 +0100
Message-ID: <87zhj1zvnl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: A7frpXu49S2+


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/17/19 5:00 PM, Alex Benn=C3=A9e wrote:
>>>> +    add_f32_const(0x8p-152);
>>>> +    add_f32_const(0x8p-152);
>>>> +    add_f32_const(0x8p-152);
>>>
>>> Why are you adding 3 of the same?
>>
>> To replicate the 1841491 test case where the same number is used for
>> a/b/c
>
> Then we really ought to be more explicit about that.

I guess - I was hoping to piggy back on the general case. Maybe we
should just split that into a separate test case. We can at least re-use
the format and flag printing code and drop the behind the scenes magic
to "join" the constant table with extra test values.

> You're not doing full permutations on the sets of numbers, so does increm=
enting
> a random index really test what you intended?

I did initially do the full permutation but for madds it all adds up
quite quickly. The shuffle we do here is a bit of a comprise, so it
shuffles the various nan forms before nans with -inf and -large and
finally a bunch of real numbers (subnormals in the middle). It gives a
reasonably broad coverage without going nuts.

>
>>>> +#if defined(__arm__)
>>>> +                r =3D __builtin_fmaf(a, b, c);
>>>> +#else
>>>> +                r =3D __builtin_fmaf(a, b, c);
>>>> +#endif
>>>
>>> Eh?
>>
>> Ahh I was going to hardcode the arm madd instruction in as the builtin
>> wasn't expanding. I tried setting -march in the CFLAGS but that didn't
>> trigger it either on my buster arm-hf compiler. Any ideas how to get the
>> compiler to do the right thing?
>
> I think you want -mfpu=3Dneon-vfpv4.

Ahh that worked. I would have hoped that v8 would be enough to spit out
aarch32 code which has to have VFPv4 for A profile right?

Anyway I'll use that for now.

>
>
> r~


--
Alex Benn=C3=A9e
