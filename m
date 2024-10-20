Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a653f5sm1218081a12.26.2024.10.20.13.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 13:34:28 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C25185F8A7;
	Sun, 20 Oct 2024 21:34:26 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Jean-Christophe Dubois <jcd@tribudubois.net>,  Igor
 Mitsyanko <i.mitsyanko@gmail.com>,  Andrey Smirnov
 <andrew.smirnov@gmail.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  Alistair Francis <alistair@alistair23.me>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 0/7] docs/system/arm: Provide at least skeleton docs for
 all boards
In-Reply-To: <20241018141332.942844-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Fri, 18 Oct 2024 15:13:25 +0100")
References: <20241018141332.942844-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Sun, 20 Oct 2024 21:34:26 +0100
Message-ID: <87bjzev7hp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: J0fotmjVeceQ

Peter Maydell <peter.maydell@linaro.org> writes:

> In target-arm.rst there is an apologetic note:
>
>   Unfortunately many of the Arm boards QEMU supports are currently
>   undocumented; you can get a complete list by running
>   ``qemu-system-aarch64 --machine help``.
>
> However, the situation isn't actually as bleak as this suggests:
> over the years we have generally insisted on documentation for
> new machine types and have filled in some of the gaps where
> there was no documentation for older machine types. Plus we just
> deleted a lot of older undocumented or underdocumented boards.
>
> I did a check of all the board types listed in --help and we
> really don't have very many left that weren't listed in the
> documentation. This series does some cleanup of existing
> docs to ensure that every board covered by a .rst file has
> a line in the right place in the list that lists the board
> name explicitly. It then adds placeholder docs for the remaining
> undocumented boards:
>  * nuri, smdkc210 (Exynos4 boards)
>  * xlnx-zcu102
>  * mcimx6ul-evk
>  * mcimx7d-sabre
>
> and removes the apologetic note about the list being incomplete.
>
> The placeholder docs are obviously not very useful, but they
> mean we at least have an entry in the list for the board
> that gives the manufacturer's name for the board, and we
> have a place to put expanded information in future if anybody
> wants to write it.
>
> Anybody who has more information on the above boards is of
> course welcome to expand on the minimal files here :-)

For the series:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
