Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local (host5-81-235-77.range5-81.btcentralplus.com. [5.81.235.77])
        by smtp.gmail.com with ESMTPSA id h23sm11052423wrc.48.2017.02.24.09.17.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 09:17:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 526103E0198;
	Fri, 24 Feb 2017 17:17:36 +0000 (GMT)
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org> <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com> <87wpcflmmb.fsf@linaro.org> <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com> <87shn3lkj3.fsf@linaro.org> <CAFEAcA-e5s6Tru_Kfba9hQHL827r2N5jyBvbpwbro7fHX2m1KA@mail.gmail.com> <87r32nleue.fsf@linaro.org> <CAFEAcA_nwfvS-WnZW1WuqGT7cv8Mm16o8CwM2N=XB1MWePkqbA@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches\@linaro.org" <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
In-reply-to: <CAFEAcA_nwfvS-WnZW1WuqGT7cv8Mm16o8CwM2N=XB1MWePkqbA@mail.gmail.com>
Date: Fri, 24 Feb 2017 17:17:36 +0000
Message-ID: <87k28fld8v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: SS4b5V8Kq7B+


Peter Maydell <peter.maydell@linaro.org> writes:

> On 24 February 2017 at 16:43, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On 24 February 2017 at 14:40, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> Could be. I use arm-linux-gnueabihf-gcc to build. If you use
>>> PRIx32 does it build OK?
>>
>> Well the problem is the non-eabi compilers don't have PRIx32 defined for
>> you. You have to specify yourself.
>
> Oh, right. Or we could just cast these things to unsigned int ;-)
>
> Other than the tests being a bit ropy, are you happy with the
> patches proper?

Yes, I've just looked through the last few and they look good to me.

>
> thanks
> -- PMM


--
Alex Bennée
