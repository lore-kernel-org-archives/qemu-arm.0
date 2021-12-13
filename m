Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e7sm13796742wrg.31.2021.12.13.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:08:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 873BC1FF96;
	Mon, 13 Dec 2021 13:08:03 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-13-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 12/26] hw/intc/arm_gicv3_its: Correct comment about CTE
 RDBase field size
Date: Mon, 13 Dec 2021 13:07:58 +0000
In-reply-to: <20211211191135.1764649-13-peter.maydell@linaro.org>
Message-ID: <87pmq0lkjw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZNTb5PFE8zum


Peter Maydell <peter.maydell@linaro.org> writes:

> The comment says that in our CTE format the RDBase field is 36 bits;
> in fact for us it is only 16 bits, because we use the RDBase format
> where it specifies a 16-bit CPU number. The code already uses
> RDBASE_PROCNUM_LENGTH (16) as the field width, so fix the comment
> to match it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
