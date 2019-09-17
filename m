Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b16sm5207408wrh.5.2019.09.17.14.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 14:00:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7AAFC1FF87;
	Tue, 17 Sep 2019 22:00:44 +0100 (BST)
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-8-alex.bennee@linaro.org>
 <afd9bc85-9c79-a456-73c1-fc19e97d1acd@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 7/9] tests/tcg: add float_madds test to
 multiarch
In-reply-to: <afd9bc85-9c79-a456-73c1-fc19e97d1acd@linaro.org>
Date: Tue, 17 Sep 2019 22:00:44 +0100
Message-ID: <877e661vur.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: G9Y19WlLY4R6


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/17/19 2:41 PM, Alex Benn=C3=A9e wrote:
>> +    /* From https://bugs.launchpad.net/qemu/+bug/1841491 */
>> +    add_f32_const(0x1.ffffffffffffcp-1022);
>> +    add_f32_const(0x1.0000000000001p-1);
>> +    add_f32_const(0x0.0000000000001p-1022);
>
> These three constants do not fit in float32.
>
>> +    add_f32_const(0x8p-152);
>> +    add_f32_const(0x8p-152);
>> +    add_f32_const(0x8p-152);
>
> Why are you adding 3 of the same?

To replicate the 1841491 test case where the same number is used for
a/b/c
>
>> +        for (j =3D 0; j < nums; j++) {
>> +            for (k =3D 0; k < 3; k++) {
>> +                a =3D get_f32(j + ((k)%3));
>> +                b =3D get_f32(j + ((k+1)%3));
>> +                c =3D get_f32(j + ((k+2)%3));
>
> How does this not overflow nums?
> There does not appear to be an assert on overflow in get_f<N>.

get_f<N> wraps the index with a mod op.

>
>> +#if defined(__arm__)
>> +                r =3D __builtin_fmaf(a, b, c);
>> +#else
>> +                r =3D __builtin_fmaf(a, b, c);
>> +#endif
>
> Eh?

Ahh I was going to hardcode the arm madd instruction in as the builtin
wasn't expanding. I tried setting -march in the CFLAGS but that didn't
trigger it either on my buster arm-hf compiler. Any ideas how to get the
compiler to do the right thing?

>
>> +/* Number of constants in each table */
>> +int get_num_f16();
>> +int get_num_f32();
>> +int get_num_f64();
>
> This is not c++; you want (void) to indicate no arguments.

ok.

>
>
> r~


--
Alex Benn=C3=A9e
