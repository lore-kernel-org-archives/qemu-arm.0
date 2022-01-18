Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d1sm5641303ejo.176.2022.01.18.09.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 09:37:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 161F51FFB7;
	Tue, 18 Jan 2022 17:37:19 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-14-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH v2 13/13] hw/intc/arm_gicv3_its: Range-check ICID before
 indexing into collection table
Date: Tue, 18 Jan 2022 17:37:13 +0000
In-reply-to: <20220111171048.3545974-14-peter.maydell@linaro.org>
Message-ID: <87tue17xo0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4QDsgXAvLjFB


Peter Maydell <peter.maydell@linaro.org> writes:

> In process_its_cmd(), we read an ICID out of the interrupt table
> entry, and then use it as an index into the collection table.  Add a
> check that it is within range for the collection table first.
>
> This check is not strictly necessary, because:
>  * we range check the ICID from the guest before writing it into
>    the interrupt table entry, so the the only way to get an
>    out of range ICID in process_its_cmd() is if a badly-behaved
>    guest is writing directly to the interrupt table memory
>  * the collection table is in guest memory, so QEMU won't fall
>    over if we read off the end of it
>
> However, it seems clearer to include the check.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
