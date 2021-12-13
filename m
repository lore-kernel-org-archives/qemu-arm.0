Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g13sm8037469wri.102.2021.12.13.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:22:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3C69B1FF96;
	Mon, 13 Dec 2021 11:22:58 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-3-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 02/26] hw/intc/arm_gicv3_its: Correct off-by-one bounds
 check on rdbase
Date: Mon, 13 Dec 2021 11:22:49 +0000
In-reply-to: <20211211191135.1764649-3-peter.maydell@linaro.org>
Message-ID: <871r2goijx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZdoFcTNwd3Gz


Peter Maydell <peter.maydell@linaro.org> writes:

> The checks in the ITS on the rdbase values in guest commands are
> off-by-one: they permit the guest to pass us a value equal to
> s->gicv3->num_cpu, but the valid values are 0...num_cpu-1.  This
> meant the guest could cause us to index off the end of the
> s->gicv3->cpu[] array when calling gicv3_redist_process_lpi(), and we
> would probably crash.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 17fb5e36aabd4b ("hw/intc: GICv3 redistributor ITS processing")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
