Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l3sm7680768wmq.46.2021.12.13.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:51:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DD3191FF96;
	Mon, 13 Dec 2021 14:51:44 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-25-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 24/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapc()
Date: Mon, 13 Dec 2021 14:51:39 +0000
In-reply-to: <20211211191135.1764649-25-peter.maydell@linaro.org>
Message-ID: <87a6h4k16n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cjS/qVUH5AQq


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix process_mapc() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
