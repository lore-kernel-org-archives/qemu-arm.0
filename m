Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 66sm1612942wma.11.2019.07.10.04.32.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 04:32:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D5BCB1FF87;
	Wed, 10 Jul 2019 12:32:50 +0100 (BST)
References: <20190705160421.19015-1-alex.bennee@linaro.org> <20190705160421.19015-3-alex.bennee@linaro.org> <af417ca3-248a-d1a8-51c4-46676b6d9d4a@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org, Jan Bobek <jan.bobek@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v1 2/5] tests/tcg: fix up test-i386-fprem.ref generation
In-reply-to: <af417ca3-248a-d1a8-51c4-46676b6d9d4a@redhat.com>
Date: Wed, 10 Jul 2019 12:32:50 +0100
Message-ID: <87lfx6dt0d.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lddZZuO1i9dG


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/5/19 6:04 PM, Alex Benn=C3=A9e wrote:
>> We never shipped the reference data in the source tree because it was
>> quite big (64M). As a result the only option is to generate it
>
> Can we fetch it (with hash verification) or store it compressed?

Seems like a lot of hoops to jump through. The limitation is that you
need to be on an x86 to generate the reference data but that isn't very
hard these days. If you do happen to be on non-x86 and are not paying
attention it becomes a simple regression test against the system
(binfmt_misc) run QEMU. But as it is currently broken and needing some
love it's just an incremental improvement for where we are at the
moment.

>
> $ du -ch pc-bios/edk2-*bz2
> 1.2M    pc-bios/edk2-aarch64-code.fd.bz2
> 1.2M    pc-bios/edk2-arm-code.fd.bz2
> 4.0K    pc-bios/edk2-arm-vars.fd.bz2
> 1.7M    pc-bios/edk2-i386-code.fd.bz2
> 1.9M    pc-bios/edk2-i386-secure-code.fd.bz2
> 4.0K    pc-bios/edk2-i386-vars.fd.bz2
> 1.7M    pc-bios/edk2-x86_64-code.fd.bz2
> 1.9M    pc-bios/edk2-x86_64-secure-code.fd.bz2
> 9.3M    total
>
>> locally. Although we have a rule to generate the reference file we
>> missed the dependency and location changes, probably because it is
>> only run for SLOW test runs.
>>
>> The test still fails with mostly incorrect flags and different than
>> expected NaNs. I'll leave that for the x86 experts to look at.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <rth@twiddle.net>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: Jan Bobek <jan.bobek@gmail.com>
>> ---
>>  tests/tcg/i386/Makefile.target | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.ta=
rget
>> index b4033ba3d1..d0eb7023e5 100644
>> --- a/tests/tcg/i386/Makefile.target
>> +++ b/tests/tcg/i386/Makefile.target
>> @@ -35,9 +35,9 @@ test-i386-fprem.ref: test-i386-fprem
>>  	$(call quiet-command, ./$< > $@,"GENREF","generating $@")
>>
>>  run-test-i386-fprem: TIMEOUT=3D60
>> -run-test-i386-fprem: test-i386-fprem
>> +run-test-i386-fprem: test-i386-fprem test-i386-fprem.ref
>>  	$(call run-test,test-i386-fprem, $(QEMU) $<,"$< on $(TARGET_NAME)")
>> -	$(call diff-out,test-i386-fprem, $(I386_SRC)/$<.ref)
>> +	$(call diff-out,test-i386-fprem, test-i386-fprem.ref)
>>  else
>>  run-test-i386-fprem: test-i386-fprem
>>  	$(call skip-test, $<, "SLOW")
>>


--
Alex Benn=C3=A9e
