Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e18-20020adfdbd2000000b001e4bbbe5b92sm1517807wrj.76.2022.03.09.03.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 03:20:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B4BDC1FFB7;
	Wed,  9 Mar 2022 11:20:21 +0000 (GMT)
References: <20220301094715.550871-1-alex.bennee@linaro.org>
 <20220301094715.550871-14-alex.bennee@linaro.org>
 <162f6b45-8b3a-9672-2e5e-f28e867eff31@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, peter.maydell@linaro.org
Subject: Re: [PULL 13/18] tests/tcg: add vectorised sha512 versions
Date: Wed, 09 Mar 2022 11:18:02 +0000
In-reply-to: <162f6b45-8b3a-9672-2e5e-f28e867eff31@redhat.com>
Message-ID: <874k4774p6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZfxAifnQCdNc


Thomas Huth <thuth@redhat.com> writes:

> On 01/03/2022 10.47, Alex Benn=C3=A9e wrote:
>> This builds vectorised versions of sha512 to exercise the vector code:
>>    - aarch64 (AdvSimd)
>>    - i386 (SSE)
>>    - s390x (MVX)
>>    - ppc64/ppc64le (power10 vectors)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220225172021.3493923-14-alex.bennee@linaro.org>
> [...]
>> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.=
target
>> index 1a7238b4eb..e53b599b22 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -25,3 +25,12 @@ run-gdbstub-signals-s390x: signals-s390x
>>     EXTRA_RUNS +=3D run-gdbstub-signals-s390x
>>   endif
>> +
>> +# MVX versions of sha512
>> +sha512-mvx: CFLAGS=3D-march=3Dz13 -mvx -O3
>> +sha512-mvx: sha512.c
>> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>> +
>> +run-sha512-mvx: QEMU_OPTS+=3D-cpu max
>> +
>> +TESTS+=3Dsha512-mvx
>
> When running "make check-tcg" on my s390x host, I'm now getting this erro=
r:
>
>  TEST    sha512-mvx on s390x
> qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> qemu-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
> make[2]: *** [../Makefile.target:156: run-sha512-mvx] Error 10

Hmm I see the warning but it doesn't fail for me. Dropping -cpu max
makes the working go away. I thought we needed it to ensure the CPU
model had s390x's vector instructions enabled.

> Any ideas how to fix this?
>
>  Thomas


--=20
Alex Benn=C3=A9e
