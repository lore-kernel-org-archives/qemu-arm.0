Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b10-v6sm17541725wrn.42.2018.05.18.08.48.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 May 2018 08:48:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7F15F3E006A;
	Fri, 18 May 2018 16:48:44 +0100 (BST)
References: <20180517174718.10107-1-alex.bennee@linaro.org> <20180517174718.10107-28-alex.bennee@linaro.org> <13cbc8f7-ed4b-e302-3a6c-b8791a21047b@amsat.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: cota@braap.org, famz@redhat.com, berrange@redhat.com, richard.henderson@linaro.org, balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de, Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 27/49] tests/tcg: enable building for ARM
In-reply-to: <13cbc8f7-ed4b-e302-3a6c-b8791a21047b@amsat.org>
Date: Fri, 18 May 2018 16:48:44 +0100
Message-ID: <87fu2pdkwz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lJ2KTsjv7QqH


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 05/17/2018 02:46 PM, Alex Benn=C3=A9e wrote:
>> This allows us to use the docker cross compiler image to build these
>> tests.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/tcg/arm/Makefile.include | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 tests/tcg/arm/Makefile.include
>>
>> diff --git a/tests/tcg/arm/Makefile.include b/tests/tcg/arm/Makefile.inc=
lude
>> new file mode 100644
>> index 0000000000..8e7eac008f
>> --- /dev/null
>> +++ b/tests/tcg/arm/Makefile.include
>> @@ -0,0 +1,8 @@
>> +# Makefile.include for all ARM targets
>> +#
>> +# We don't have any bigendian build tools so we only use this for armhf
>> +
>> +ifeq ($(TARGET_NAME),arm)
>> +DOCKER_IMAGE=3Ddebian-armhf-cross
>
> [Note for a later series:]
> Since this image comes with ARMv7 libraries, I find clearer to rename as
> arm32v7, following new Docker scheme. This will ease to add arm32v6 (and
> arm32v5 if possible...)

I'm not sure if that is worthwhile. Any linux-user build will be ARMv7
or v8 AArch32 and the compilers can always be set to older CPU types.
Testing that we have correct UNDEF behaviour for older CPUs is probably
better handled by things like RISU?

>
>> +DOCKER_CROSS_COMPILER=3Darm-linux-gnueabihf-gcc
>> +endif
>>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--
Alex Benn=C3=A9e
