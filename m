Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y6sm12226329wrh.18.2021.12.13.06.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:49:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 198551FF96;
	Mon, 13 Dec 2021 14:49:46 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-20-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 19/26] hw/intc/arm_gicv3_its: Don't use data if reading
 command failed
Date: Mon, 13 Dec 2021 14:49:40 +0000
In-reply-to: <20211211191135.1764649-20-peter.maydell@linaro.org>
Message-ID: <87mtl4k19x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: s4uYdwkgYD9C


Peter Maydell <peter.maydell@linaro.org> writes:

> In process_cmdq(), we read 64 bits of the command packet, which
> contain the command identifier, which we then switch() on to dispatch
> to an appropriate sub-function.  However, if address_space_ldq_le()
> reports a memory transaction failure, we still read the command
> identifier out of the data and switch() on it.  Restructure the code
> so that we stop immediately (stalling the command queue) in this
> case.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
