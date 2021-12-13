Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id ga37sm5784422ejc.65.2021.12.13.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:37:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3E2821FF96;
	Mon, 13 Dec 2021 13:37:24 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-17-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 16/26] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Mon, 13 Dec 2021 13:37:12 +0000
In-reply-to: <20211211191135.1764649-17-peter.maydell@linaro.org>
Message-ID: <878rwolj6z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RCgcXh2WJWzh


Peter Maydell <peter.maydell@linaro.org> writes:

> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention, fixing the off-by-one error.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
