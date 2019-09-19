Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e20sm14319040wrc.34.2019.09.19.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 03:07:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 48A301FF87;
	Thu, 19 Sep 2019 11:07:55 +0100 (BST)
References: <20190918153335.20797-1-alex.bennee@linaro.org>
 <001801d56ec7$d80940d0$881bc270$@ru>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Cc: qemu-devel@nongnu.org, 'Peter Maydell' <peter.maydell@linaro.org>,
 "'open list\:ARM TCG CPUs'" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] tests/tcg: add simple record/replay smoke test for aarch64
In-reply-to: <001801d56ec7$d80940d0$881bc270$@ru>
Date: Thu, 19 Sep 2019 11:07:55 +0100
Message-ID: <87sgoszjic.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: voK1Rl08SIUD


Pavel Dovgalyuk <dovgaluk@ispras.ru> writes:

> Thanks!
>
> This seem to correctly run record and replay command lines.
> When I break the replay correctness, then the test reports a timeout erro=
r.
>
> However, we need some kind of a manual for tcg testing. I had to dig thro=
ugh makefile and configure
> scripts to undestand that testing needs the cross compilers to be install=
ed.
> Then I installed a random cross compiler and everything worked
> normally.

I shall add a section to the testing.rst documentation.

>
> Pavel Dovgalyuk
>
>> -----Original Message-----
>> From: Alex Benn=C3=A9e [mailto:alex.bennee@linaro.org]
>> Sent: Wednesday, September 18, 2019 6:34 PM
>> To: qemu-devel@nongnu.org
>> Cc: Alex Benn=C3=A9e; Pavel Dovgalyuk; Peter Maydell; open list:ARM TCG =
CPUs
>> Subject: [PATCH] tests/tcg: add simple record/replay smoke test for aarc=
h64
>>
>> This adds two new tests that re-use the memory test to check basic
>> record replay functionality is still working. We have to define our
>> own runners rather than using the default pattern as we want to change
>> the test name but re-use the memory binary.
>>
>> We declare the test binaries as PHONY as they don't rely exist.
>>
>> [AJB: A better test would output some sort of timer value or other
>> otherwise variable value so we could compare the record and replay
>> outputs and ensure they match]
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>
>> ---
>>  tests/tcg/aarch64/Makefile.softmmu-target | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch=
64/Makefile.softmmu-
>> target
>> index 4c4aaf61dd3..b4b39579634 100644
>> --- a/tests/tcg/aarch64/Makefile.softmmu-target
>> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
>> @@ -32,3 +32,24 @@ memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D1
>>
>>  # Running
>>  QEMU_OPTS+=3D-M virt -cpu max -display none -semihosting-config
>> enable=3Don,target=3Dnative,chardev=3Doutput -kernel
>> +
>> +# Simple Record/Replay Test
>> +.PHONY: memory-record
>> +run-memory-record: memory-record memory
>> +	$(call run-test, $<, \
>> +	  $(QEMU) -monitor none -display none \
>> +		  -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
>> +		  -icount shift=3D5$(COMMA)rr=3Drecord$(COMMA)rrfile=3Drecord.bin \
>> +	   	  $(QEMU_OPTS) memory, \
>> +	  "$< on $(TARGET_NAME)")
>> +
>> +.PHONY: memory-replay
>> +run-memory-replay: memory-replay run-memory-record
>> +	$(call run-test, $<, \
>> +	  $(QEMU) -monitor none -display none \
>> +		  -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
>> +		  -icount shift=3D5$(COMMA)rr=3Dreplay$(COMMA)rrfile=3Drecord.bin \
>> +	   	  $(QEMU_OPTS) memory, \
>> +	  "$< on $(TARGET_NAME)")
>> +
>> +TESTS+=3Dmemory-record memory-replay
>> --
>> 2.20.1


--
Alex Benn=C3=A9e
