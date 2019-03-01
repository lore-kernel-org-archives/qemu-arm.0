Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t69sm12335869wmt.16.2019.02.28.23.30.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 23:30:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2CDA11FF82;
	Fri,  1 Mar 2019 07:30:44 +0000 (UTC)
References: <20190228202537.4638-1-alex.bennee@linaro.org> <20190228202537.4638-8-alex.bennee@linaro.org> <CAMo8BfKw-ewHXQPfz6XDFBqoxPk1vTGaEhjVEdKLm3-diuTUmg@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 07/16] tests/tcg/xtensa: enable system tests
In-reply-to: <CAMo8BfKw-ewHXQPfz6XDFBqoxPk1vTGaEhjVEdKLm3-diuTUmg@mail.gmail.com>
Date: Fri, 01 Mar 2019 07:30:44 +0000
Message-ID: <87woljjbkr.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2UqRkLfy6SKD


Max Filippov <jcmvbkbc@gmail.com> writes:

> Hi Alex,
>
> On Thu, Feb 28, 2019 at 12:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>
> [...]
>
>> diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa=
/Makefile.softmmu-target
>> new file mode 100644
>> index 0000000000..1a4014506f
>> --- /dev/null
>> +++ b/tests/tcg/xtensa/Makefile.softmmu-target
>> @@ -0,0 +1,40 @@
>> +#
>> +# Xtensa softmmu tests
>> +#
>> +
>> +ifneq ($(TARGET_WORDS_BIGENDIAN),y)
>
> I've recently posted a series that makes it possible to run
> TCG tests on wider variety of xtensa cores, including
> big-endian cores:
> http://lists.nongnu.org/archive/html/qemu-devel/2019-02/msg04843.html

Ahh I missed that, will have a look.

--
Alex Benn=C3=A9e
