Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v18sm26241028wrr.90.2019.03.01.01.31.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2019 01:31:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 22C381FF82;
	Fri,  1 Mar 2019 09:31:54 +0000 (UTC)
References: <20190228202537.4638-1-alex.bennee@linaro.org> <20190228202537.4638-6-alex.bennee@linaro.org> <c3a65d4b-8720-2957-1394-032823a78760@redhat.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@gmail.com, qemu-arm@nongnu.org, jcmvbkbc@gmail.com
Subject: Re: [Qemu-devel] [PATCH v2 05/16] tests/tcg/mips: fix hello-mips compilation
In-reply-to: <c3a65d4b-8720-2957-1394-032823a78760@redhat.com>
Date: Fri, 01 Mar 2019 09:31:54 +0000
Message-ID: <87tvgnj5yt.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ojAVgn2Aawkj


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex,
>
> On 2/28/19 9:25 PM, Alex Benn=C3=A9e wrote:
>> The compilation flags for proper building are in the source tree. We
>> also fix exit to 0 so the result is counted as a success.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/tcg/mips/Makefile.target | 11 ++++-------
>>  tests/tcg/mips/hello-mips.c    |  2 +-
>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.ta=
rget
>> index 086625f533..1a994d5525 100644
>> --- a/tests/tcg/mips/Makefile.target
>> +++ b/tests/tcg/mips/Makefile.target
>> @@ -8,15 +8,12 @@ MIPS_SRC=3D$(SRC_PATH)/tests/tcg/mips
>>  # Set search path for all sources
>>  VPATH 		+=3D $(MIPS_SRC)
>>
>> +# hello-mips is 32 bit only
>
> Correct.
>
>> +ifeq ($(findstring 64,$(TARGET_NAME)),)
>>  MIPS_TESTS=3Dhello-mips
>>
>>  TESTS +=3D $(MIPS_TESTS)
>>
>> -hello-mips: CFLAGS+=3D-ffreestanding
>> +hello-mips: CFLAGS+=3D-mno-abicalls -fno-PIC -mabi=3D32
>
> As suggested in the header.
>
>>  hello-mips: LDFLAGS+=3D-nostdlib
>> -
>> -# For MIPS32 and 64 we have a bunch of extra tests in sub-directories
>> -# however they are intended for system tests.
>> -
>> -run-hello-mips: hello-mips
>> -	$(call skip-test, $<, "BROKEN")
>> +endif
>> diff --git a/tests/tcg/mips/hello-mips.c b/tests/tcg/mips/hello-mips.c
>> index c7052fdf2e..4e1cf501af 100644
>> --- a/tests/tcg/mips/hello-mips.c
>> +++ b/tests/tcg/mips/hello-mips.c
>> @@ -60,5 +60,5 @@ static inline int write(int fd, const char *buf, int l=
en)
>>  void __start(void)
>>  {
>>      write (1, "Hello, World!\n", 14);
>> -    exit1 (42);
>
> I understand 42 is to check SYS_exit1 worked, and this is not another
> qemu-user exit. But we were previously never checked the exit code for
> 42. Neither are we checking 'Hello, World' on stdout.

Hmm we could do better but this is pretty much a smoke test anyway.
Either things are so broken it crashes out (which we should detect) or
we exit with a 0 indicating a pass to the calling make.

Once we have a more use cases for non-zero exits we can come up with
some plumbing for checking things.

>
>> +    exit1(0);
>>  }
>>


--
Alex Benn=C3=A9e
