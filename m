Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h27sm8172055wmc.43.2021.12.13.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:50:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A3CB61FF96;
	Mon, 13 Dec 2021 14:50:28 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-23-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 22/26] hw/intc/arm_gicv3_its: Refactor process_its_cmd()
 to reduce nesting
Date: Mon, 13 Dec 2021 14:50:23 +0000
In-reply-to: <20211211191135.1764649-23-peter.maydell@linaro.org>
Message-ID: <87ilvsk18r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vTNwfJhyc+az


Peter Maydell <peter.maydell@linaro.org> writes:

> Refactor process_its_cmd() so that it consistently uses
> the structure
>   do thing;
>   if (error condition) {
>       return early;
>   }
>   do next thing;
>
> rather than doing some of the work nested inside if (not error)
> code blocks.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
