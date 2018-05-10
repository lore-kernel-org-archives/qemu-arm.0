Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 44-v6sm1814859wrv.47.2018.05.10.06.34.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 06:34:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C87A93E03C0;
	Thu, 10 May 2018 14:34:35 +0100 (BST)
References: <20180510094206.15354-1-alex.bennee@linaro.org> <CAFEAcA88-EFYN3y-sU=YbzeT-eXCBk7md-y2rEQfpJtZ+MF-wQ@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 0/5] refactor float-to-float and fix AHP
In-reply-to: <CAFEAcA88-EFYN3y-sU=YbzeT-eXCBk7md-y2rEQfpJtZ+MF-wQ@mail.gmail.com>
Date: Thu, 10 May 2018 14:34:35 +0100
Message-ID: <87k1sbvdlg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: REBfCUPKc1bc


Peter Maydell <peter.maydell@linaro.org> writes:

> On 10 May 2018 at 10:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>> Hi,
>>
>> Hi,
>>
>> I've not included the test case in the series but you can find it in
>> my TCG fixup branch:
>>
>>   https://github.com/stsquad/qemu/blob/testing/tcg-tests-revival-v4/test=
s/tcg/arm/fcvt.c
>>
>> Some of the ARMv7 versions are commented out as they where not
>> supported until later revs. I do have a build that includes that but
>> unfortunately the Debian compiler it too old to build it.
>>
>> : patch 0001/fpu softfloat int_to_float ensure r fully initial.patch nee=
ds review
>> : patch 0004/target arm convert conversion helpers to fpst ahp.patch nee=
ds review
>> : patch 0005/target arm squash FZ16 behaviour for conversions.patch need=
s review
>
> This still seems to regress the NaN conversion case I mentioned
> in review of the previous series:
>
> (3) Here's a NaN case we get wrong now: 64 to IEEE-16 conversion,
> input is 0x7ff0000000000001 (an SNaN), we produce
> 0x7c00 (infinity) but should produce 0x7e00 (a QNaN).

Hmm I had added the test case but due to another bug it never actually
ran :-/

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
