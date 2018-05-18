Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q2-v6sm6858863wrj.57.2018.05.18.01.16.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 May 2018 01:16:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DBFDF3E00E2;
	Fri, 18 May 2018 09:16:06 +0100 (BST)
References: <20180517174718.10107-1-alex.bennee@linaro.org> <20180517174718.10107-33-alex.bennee@linaro.org> <9ef2bc85-cead-080c-8313-bf0113d5019e@linaro.org> <927cd32b-6de1-3702-5125-e682fb2ffcd4@amsat.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, cota@braap.org, famz@redhat.com, berrange@redhat.com, balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de, qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 32/49] tests/tcg/arm: add fcvt test cases for AArch32/64
In-reply-to: <927cd32b-6de1-3702-5125-e682fb2ffcd4@amsat.org>
Date: Fri, 18 May 2018 09:16:06 +0100
Message-ID: <87k1s1e5vd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KACfWxeSdADA


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 05/17/2018 05:30 PM, Richard Henderson wrote:
>> On 05/17/2018 10:47 AM, Alex Benn=C3=A9e wrote:
>>> This runs through the usual float to float conversions and crucially
>>> also runs with ARM Alternative Half Precision Format.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> [rth: tweak vcvtb.f16.f32/vctb.f32.f16 code and regen]
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> ---
>>> v4
>>>   - add fcvt.ref and check results against it
>>>   - fix single_to_half, single_to_double conversions
>>>   - properly toggle AHP mode (fpsr->fpcr)
>>>   - more values around the AHP margins
>>>   - add INF/NAN/SNAN inputs
>>>   - build for ARM and AArch64
>>>   - fix bug for hex literals
>>>   - add float-to-int
>>>   - checkpatch fix
>>> ---
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Thanks Richard, I was not very motivated to review each line of the
> fcvt.ref files =3D)
>
>> diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.targ=
et
>> index 9d2b551732..7bb777f442 100644
>> --- a/tests/tcg/arm/Makefile.target
>> +++ b/tests/tcg/arm/Makefile.target
>> @@ -8,7 +8,9 @@ ARM_SRC=3D$(SRC_PATH)/tests/tcg/arm
>>  # Set search path for all sources
>>  VPATH 		+=3D $(ARM_SRC)
>>
>> -TESTS +=3D hello-arm test-arm-iwmmxt
>> +ARM_TESTS=3Dhello-arm test-arm-iwmmxt
>> +
>> +TESTS +=3D $(ARM_TESTS) fcvt
>>
>>  hello-arm: CFLAGS+=3D-marm -ffreestanding
>>  hello-arm: LDFLAGS+=3D-nostdlib
>> @@ -24,3 +26,14 @@ run-test-mmap: test-mmap
>>  	$(call quiet-command, $(QEMU) -p 8192 $< 8192 > test-mmap-8192.out,
> "TEST", "$< (8k pages) on $(TARGET_NAME)")
>>  	$(call quiet-command, $(QEMU) -p 16384 $< 16384 >
> test-mmap-16384.out, "TEST", "$< (16k pages) on $(TARGET_NAME)")
>>  endif
>> +
>> +ifeq ($(TARGET_NAME), arm)
>> +fcvt: LDFLAGS+=3D-lm
>> +# fcvt: CFLAGS+=3D-march=3Darmv8.2-a+fp16 -mfpu=3Dneon-fp-armv8
>
> Alex, What is your idea here, enable this later?
> Maybe add some TODO comment around..

How about:

# AArch32 doesn't support all combinations of FP16<->FOO in it's base
# profile. Once the AArch32 profile is caught up we should build an
# additional binary and reference to test the additional combinations.

I backed the change out when I realised the stretch compiler didn't
support the same range as my local (18.04) gcc's.

>
> Except this nit, for both Makefile.target:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>> +
>> +run-fcvt: fcvt
>> +	$(call quiet-command, \
>> +		$(QEMU) $< > fcvt.out && \
>> +		diff -u $(ARM_SRC)/fcvt.ref fcvt.out, \
>> +		"TEST", "$< (default) on $(TARGET_NAME)")
>> +endif
>
> $ make -j1 run-tcg-tests-aarch64-linux-user
>   BUILD   debian9
>   BUILD   debian-arm64-cross
>   CROSS-BUILD aarch64 guest-tests with docker qemu:debian-arm64-cross
>   BUILD   debian9
>   BUILD   debian-arm64-cross
>   CROSS-BUILD aarch64 guest-tests with docker qemu:debian-arm64-cross
>   RUN-TESTS for aarch64
>   TEST    test-mmap (default) on aarch64
>   TEST    test-mmap (8k pages) on aarch64
>   TEST    test-mmap (16k pages) on aarch64
>   TEST    test-mmap (32k pages) on aarch64
>   TEST    sha1 on aarch64
>   TEST    linux-test on aarch64
>   TEST    testthread on aarch64
>   TEST    fcvt (default) on aarch64
>   TEST    sysregs on aarch64
>
> \o/
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--
Alex Benn=C3=A9e
