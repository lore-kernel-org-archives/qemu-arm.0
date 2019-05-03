Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z9sm3894156wma.39.2019.05.03.12.28.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 12:28:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7684E1FF87;
	Fri,  3 May 2019 20:28:32 +0100 (BST)
References: <20190430165234.32272-1-alex.bennee@linaro.org> <9a538ea2-358a-dc61-b2f3-f8155c1a2283@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Subject: Re: [Qemu-devel] [PATCH v5 00/15] demacro softmmu (plus tests/coverage)
In-reply-to: <9a538ea2-358a-dc61-b2f3-f8155c1a2283@linaro.org>
Date: Fri, 03 May 2019 20:28:32 +0100
Message-ID: <875zqr49sv.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7NgzF8Npxg5u


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/30/19 9:52 AM, Alex Benn=C3=A9e wrote:
>> I've also moved the existing system memory test and made it multiarch
>> and added the bootstrapping for aarch64 system tests. I would like to
>> add support for Big Endian as well but I didn't want to delay the
>> posting of the series. It would also be nice to exercise the
>> ioread/write paths and other handling but I leave this as an exercise
>> for later.
>
> Somewhere in there you're adding
>
>   -chardev file,path=3Dhello.out,id=3Doutput

It's in the default runner config in tests/tcg/Makefile

> but there's no corresponding use of the chardev.
> Which, somehow doesn't seem to matter to your aarch64
> testcase,

Argh.. it's because -semihosting is different from -serial and doesn't
allow the usual redirection rules you get with a chardev..

> but when I try this for alpha I truly get
> no output at all.  I needed
>
>   -serial chardev:output

or -serial chadev,id=3Doutput?
>
> to populate the file.
>
>
> r~


--
Alex Benn=C3=A9e
