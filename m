Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b10-v6sm11910947wrn.42.2018.05.17.14.25.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 May 2018 14:25:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id BFAB93E0CE5;
	Thu, 17 May 2018 22:25:42 +0100 (BST)
References: <20180517174718.10107-1-alex.bennee@linaro.org> <20180517174718.10107-32-alex.bennee@linaro.org> <0f3f1135-79fd-ba0e-080d-5366eb99093f@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: cota@braap.org, famz@redhat.com, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de, qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v4 31/49] tests/tcg/aarch64: add Makefile.target
In-reply-to: <0f3f1135-79fd-ba0e-080d-5366eb99093f@linaro.org>
Date: Thu, 17 May 2018 22:25:42 +0100
Message-ID: <87lgcidlex.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ilp+hULfcEoU


Richard Henderson <richard.henderson@linaro.org> writes:

> On 05/17/2018 10:47 AM, Alex Benn=C3=A9e wrote:
>> Nothing much here yet.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/tcg/aarch64/Makefile.target | 5 +++++
>>  1 file changed, 5 insertions(+)
>>  create mode 100644 tests/tcg/aarch64/Makefile.target
>>
>> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makef=
ile.target
>> new file mode 100644
>> index 0000000000..4ac8fbe73f
>> --- /dev/null
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -0,0 +1,5 @@
>> +# -*- Mode: makefile -*-
>> +#
>> +# AArch64 specific tweaks
>> +
>> +fcvt: LDFLAGS+=3D-lm
>>
>
> Merge this with adding fcvt, surely.

Yeah... too much shuffling around.
>
>
> r~


--
Alex Benn=C3=A9e
