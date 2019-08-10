Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z6sm9162832wre.76.2019.08.10.03.07.39
        for <qemu-arm@nongnu.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 10 Aug 2019 03:07:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AAF131FF87
	for <qemu-arm@nongnu.org>; Sat, 10 Aug 2019 11:07:38 +0100 (BST)
References: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] Beagle Board support
In-reply-to: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
Date: Sat, 10 Aug 2019 11:07:38 +0100
Message-ID: <87imr5uydx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5fa4AO7NzFde


Esteban Bosse <estebanbosse@gmail.com> writes:

> Hi,
>
> I am new in this world, but I want to port the old beagle support for
> qemu-linaro to mainstream.

I think the main problem is the chip is no longer supported by TI and I
guess less likely to be supported in upstream OSes in the future.

> Someone is actually working on it or is interested?

Not that I'm aware of. If you want to do the port and are willing to be
a maintainer of it going forward then I guess it would be doable. Is
there any particular reason you want it in upstream rather than just
using the old qemu-linaro branch for your use case?

--
Alex Benn=C3=A9e
