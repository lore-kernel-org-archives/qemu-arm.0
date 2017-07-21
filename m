Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h10sm711916wme.30.2017.07.21.02.44.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:44:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F36CA3E0127;
	Fri, 21 Jul 2017 10:44:45 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-4-alex.bennee@linaro.org> <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net> <1ff55ec6-b8e5-8696-7472-0ac22073ddf4@redhat.com> <87ziby6udk.fsf@linaro.org> <CAFEAcA_a9RW8zhaY6gpPuXAYk7twWgB0G39qOUTug44HbwyE7Q@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 03/23] softfloat3c: dos2unix all files
In-reply-to: <CAFEAcA_a9RW8zhaY6gpPuXAYk7twWgB0G39qOUTug44HbwyE7Q@mail.gmail.com>
Date: Fri, 21 Jul 2017 10:44:45 +0100
Message-ID: <87vamm6s4y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Imvy6U15gpS0


Peter Maydell <peter.maydell@linaro.org> writes:

> On 21 July 2017 at 09:56, Alex Bennée <alex.bennee@linaro.org> wrote:
>> One thing playing in my mind against moving to SoftFloat3c is the
>> inscrutability of the upstream. It's nice there has been a new release
>> with new features but there isn't a source repository or as far as I can
>> tell a development list. It is basically as far as I can tell a one man
>> project albeit backed by academic funding.
>
> I think https://github.com/ucb-bar/berkeley-softfloat-3 may
> be official-ish, though it's hard to tell with github repos.

Ohh good catch - it certainly looks as though it could be. I'll submit
the compile fixes and see if it is a worthwhile path for feeding stuff
upstream.

If so maybe it would be worth considering the integration as a git
submodule?

>
> thanks
> -- PMM


--
Alex Bennée
