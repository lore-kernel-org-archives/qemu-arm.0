Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d3sm860552wrs.8.2019.05.24.03.46.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 03:46:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7DAF51FF87;
	Fri, 24 May 2019 11:46:43 +0100 (BST)
References: <20190523102532.10486-1-alex.bennee@linaro.org> <20190523102532.10486-4-alex.bennee@linaro.org> <CAFEAcA_+=7VfvZRc__q9L3vuHO6YgetrjTPAYJx4eo0mAdcPXg@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 03/28] semihosting: implement a semihosting console
In-reply-to: <CAFEAcA_+=7VfvZRc__q9L3vuHO6YgetrjTPAYJx4eo0mAdcPXg@mail.gmail.com>
Date: Fri, 24 May 2019 11:46:43 +0100
Message-ID: <877eag165o.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QZnIyaT0SnIv


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 23 May 2019 at 11:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This provides two functions for handling console output that handle
>> the common backend behaviour for semihosting.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>> index 08363969c14..b2963547c48 100644
>> --- a/include/exec/gdbstub.h
>> +++ b/include/exec/gdbstub.h
>> @@ -44,6 +44,17 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const=
 char *fmt, ...);
>>   * argument list.
>>   */
>>  void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_li=
st va);
>> +/**
>> + * gdb_do_console_out:
>> + * @gs: guest address of string to send
>> + * @len: length of string
>> + *
>> + * Sends a string to gdb console. Unlike the system call interface
>> + * there is no callback and we assume the system call always
>> + * succeeds.
>> + */
>> +void gdb_do_console_out(target_ulong s, int len);
>
> I'm not sure about the "no callback" part of this API. The operation
> here is genuinely asynchronous and providing no mechanism for the
> caller to be able to say "ok, now wait til it completes" doesn't
> seem like a good plan.

Well the caller doesn't really get a choice. At least in system mode
gdbstub does a vm_stop(RUN_STATE_DEBUG) and brings everything to a halt
anyway. All we've removed is the ability to tack on a callback (which
can get run in all sorts of contexts) when we restart.

I could just drop the API here and allow the semihosting API to call
gdb_do_syscallv directly?

--
Alex Benn=C3=A9e
