Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q14sm7928665wrz.109.2021.12.13.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:33:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EEA031FF96;
	Mon, 13 Dec 2021 11:33:23 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-6-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 05/26] hw/intc/arm_gicv3_its: Don't return early in
 extract_table_params() loop
Date: Mon, 13 Dec 2021 11:33:17 +0000
In-reply-to: <20211211191135.1764649-6-peter.maydell@linaro.org>
Message-ID: <87sfuwn3i4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lKrgR5HY2Y3j


Peter Maydell <peter.maydell@linaro.org> writes:

> In extract_table_params() we process each GITS_BASER<n> register.  If
> the register's Valid bit is not set, this means there is no
> in-guest-memory table and so we should not try to interpret the other
> fields in the register.  This was incorrectly coded as a 'return'
> rather than a 'break', so instead of looping round to process the
> next GITS_BASER<n> we would stop entirely, treating any later tables
> as being not valid also.
>
> This has no real guest-visible effects because (since we don't have
> GITS_TYPER.HCC !=3D 0) the guest must in any case set up all the
> GITS_BASER<n> to point to valid tables, so this only happens in an
> odd misbehaving-guest corner case.
>
> Fix the check to 'break', so that we leave the case statement and
> loop back around to the next GITS_BASER<n>.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
