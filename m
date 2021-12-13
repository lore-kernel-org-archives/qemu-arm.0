Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id ds1sm6375878edb.91.2021.12.13.05.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:39:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 08B0A1FF96;
	Mon, 13 Dec 2021 13:39:47 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-18-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 17/26] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
Date: Mon, 13 Dec 2021 13:39:42 +0000
In-reply-to: <20211211191135.1764649-18-peter.maydell@linaro.org>
Message-ID: <874k7clj31.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6VCbfvmE8j/N


Peter Maydell <peter.maydell@linaro.org> writes:

> The bounds check on the number of interrupt IDs is correct, but
> doesn't match our convention; change the variable name, initialize it
> to the 2^n value rather than (2^n)-1, and use >=3D instead of > in the
> comparison.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
