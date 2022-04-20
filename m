Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709062bd900b006e8766b7907sm6815507ejg.223.2022.04.20.07.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:56:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9FF541FFB7;
	Wed, 20 Apr 2022 15:56:03 +0100 (BST)
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-23-alex.bennee@linaro.org>
 <278f05c9-db1e-4990-4fa7-66f080e07dda@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Peter Maydell
 <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 22/25] tests/tcg: add float_convd test
Date: Wed, 20 Apr 2022 15:55:28 +0100
In-reply-to: <278f05c9-db1e-4990-4fa7-66f080e07dda@linaro.org>
Message-ID: <878rrzx0qk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BC82gWadWmXO


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/19/22 02:10, Alex Benn=C3=A9e wrote:
>> This is a simple transliteration of the float_convs test but this time
>> working with doubles. I'm used it to test the handling of vector
>> registers in gdbstub but wasn't able to find a non-ugly way to
>> automate it.
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/tcg/multiarch/float_convd.c | 106 ++++
>>   tests/tcg/aarch64/float_convd.ref | 988 ++++++++++++++++++++++++++++++
>>   tests/tcg/arm/float_convd.ref     | 988 ++++++++++++++++++++++++++++++
>>   tests/tcg/i386/float_convd.conf   | 988 ++++++++++++++++++++++++++++++
>>   tests/tcg/x86_64/float_convd.ref  | 988 ++++++++++++++++++++++++++++++
>>   5 files changed, 4058 insertions(+)
>>   create mode 100644 tests/tcg/multiarch/float_convd.c
>>   create mode 100644 tests/tcg/aarch64/float_convd.ref
>>   create mode 100644 tests/tcg/arm/float_convd.ref
>>   create mode 100644 tests/tcg/i386/float_convd.conf
>>   create mode 100644 tests/tcg/x86_64/float_convd.ref
>
> Is it worth adjusting the current file to float_conv.c.inc, with
> #define FLOAT {float,double} in float_conv{s,d}.c before #include?
>
> But I suppose this is ok as-is.

I did consider pushing more into libs/float_helpers.c but the whole test fi=
le
is fairly simple as is.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


--=20
Alex Benn=C3=A9e
