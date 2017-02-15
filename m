Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m188sm7823372wma.27.2017.02.15.06.51.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2017 06:51:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 62B1A3E00FA;
	Wed, 15 Feb 2017 14:51:03 +0000 (GMT)
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org> <1486065742-28639-4-git-send-email-peter.maydell@linaro.org> <87mvdnvcxx.fsf@linaro.org> <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com> <87inobv8wg.fsf@linaro.org> <CAFEAcA-6QnqGby3gOTgfo=H3SBWYYztmA7b0iEri9D-Q-LUAzQ@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches\@linaro.org" <patches@linaro.org>, Michael Davidsaver <mdavidsaver@gmail.com>, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 3/9] armv7m: Rewrite NVIC to not use any GIC code
In-reply-to: <CAFEAcA-6QnqGby3gOTgfo=H3SBWYYztmA7b0iEri9D-Q-LUAzQ@mail.gmail.com>
Date: Wed, 15 Feb 2017 14:51:03 +0000
Message-ID: <87bmu3v76w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: cy5nYSAAGVPK


Peter Maydell <peter.maydell@linaro.org> writes:

> On 15 February 2017 at 14:14, Alex Bennée <alex.bennee@linaro.org> wrote:
>> I guess it would be easier to remove the asserts if we had run test
>> cases that explicitly exercised all this code. What are you currently
>> running to test this code?
>
> The cover letter has a pointer to the tests I've been using
> (plus the usual "run a random stellaris image").

Doh, teach me for not reading that. I shall snarf them now ;-)

>
> I think the benefit of the asserts is in warding off future
> bugs; so I think they're worth keeping where we know something
> should never happen but the code is complicated enough that
> perhaps a future patch might put things in a state where the
> impossible does happen.
>
> Also, number of assert()s is to some extent a coding style
> issue, and in this patchset I'm really taking Michael's code
> and doing a review/cleanup pass on it, so I've tried not to
> do too much rework of the "well I wouldn't have put quite this
> many asserts in" flavour.

Sure no problem.

>
> thanks
> -- PMM


--
Alex Bennée
