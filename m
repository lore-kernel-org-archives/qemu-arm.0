Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m3sm27162357wrs.53.2020.01.15.23.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 23:36:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 33CA71FF87;
	Thu, 16 Jan 2020 07:36:33 +0000 (GMT)
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-19-alex.bennee@linaro.org>
 <f31669c6-ee62-6019-a09a-85a133eb68ae@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 18/22] tests/tcg/aarch64: add a gdbstub testcase for
 SVE registers
In-reply-to: <f31669c6-ee62-6019-a09a-85a133eb68ae@linaro.org>
Date: Thu, 16 Jan 2020 07:36:33 +0000
Message-ID: <87tv4vluny.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /SIHaIvFadBm


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/14/20 5:09 AM, Alex Benn=C3=A9e wrote:
>> A very simple test case which sets and reads SVE registers while
>> running a test case. We don't really need to compile a SVE binary for
>> this case but we will later so keep it simple for now.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> ---
>> v5
>>   - properly plumb in
>>   - skip if fails to connect
>> ---
>>  tests/.gitignore                      |  1 +
>>  tests/tcg/aarch64/Makefile.target     | 15 +++++
>>  tests/tcg/aarch64/gdbstub/test-sve.py | 81 +++++++++++++++++++++++++++
>>  3 files changed, 97 insertions(+)
>>  create mode 100644 tests/tcg/aarch64/gdbstub/test-sve.py
>
> I don't understand how this is working.  What's the process that provides=
 the
> container for the register state?
>
> I would have expected *some* binary to be used, even if it is only "int m=
ain()
> { return 0; }".

It is, it's using the sysregs test:

  --bin $<
=20=20
>
>
>
> r~


--=20
Alex Benn=C3=A9e
