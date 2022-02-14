Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t3sm777256ejd.83.2022.02.14.07.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:15:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9DE5320329;
	Mon, 14 Feb 2022 15:15:40 +0000 (GMT)
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-12-alex.bennee@linaro.org>
 <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Cc: qemu-devel@nongnu.org, fam@euphon.net, Peter Maydell
 <peter.maydell@linaro.org>, berrange@redhat.com, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, Eduardo Habkost <eduardo@habkost.net>, "open list:S390
 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Subject: Re: [PATCH v1 11/11] tests/tcg: add vectorised sha512 versions
Date: Mon, 14 Feb 2022 15:14:30 +0000
In-reply-to: <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
Message-ID: <87v8xhcwdf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KzxRJ/1incET


"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 11/02/2022 13:03, Alex Benn=C3=A9e wrote:
>> This builds vectorised versions of sha512 to exercise the vector code:
>>    - aarch64 (AdvSimd)
>>    - i386 (SSE)
>>    - s390x (MVX)
>>    - ppc64 (vector)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220202191242.652607-5-alex.bennee@linaro.org>
>> ---
>> v2
>>    - use -msse4.1 -O3 instead of -pentium4 for i386 build
>> ---
>>   tests/tcg/multiarch/sha512.c      | 2 +-
>>   tests/tcg/aarch64/Makefile.target | 7 +++++++
>>   tests/tcg/arm/Makefile.target     | 8 ++++++++
>>   tests/tcg/i386/Makefile.target    | 6 ++++++
>>   tests/tcg/ppc64le/Makefile.target | 5 ++++-
>>   tests/tcg/s390x/Makefile.target   | 9 +++++++++
>>   tests/tcg/x86_64/Makefile.target  | 7 +++++++
>>   7 files changed, 42 insertions(+), 2 deletions(-)
>>=20
>
> <snip>
>
>> diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makef=
ile.target
>> index 480ff0898d..4f1d03dfcf 100644
>> --- a/tests/tcg/ppc64le/Makefile.target
>> +++ b/tests/tcg/ppc64le/Makefile.target
>> @@ -5,10 +5,13 @@
>>   VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64le
>>   ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
>> -PPC64LE_TESTS=3Dbcdsub non_signalling_xscv
>> +PPC64LE_TESTS=3Dbcdsub non_signalling_xscv sha512-vector
>>   endif
>>   $(PPC64LE_TESTS): CFLAGS +=3D -mpower8-vector
>>=20
>
> Since this test does not target a specific instruction, maybe it
> should use -mvsx/-maltivec to allow the compiler to use newer
> instructions.

I wasn't sure which vector instructions are supported by the TCG front
ends so if the above flags won't trip up the TCG I can add them to the
cflags.

>
>> +sha512-vector: sha512.c
>> +       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>> +
>
> Can we have this test for big-endian too?

We have tests/tcg/ppc64 so sure...

>
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


--=20
Alex Benn=C3=A9e
