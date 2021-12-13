Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e24sm10916253wra.78.2021.12.13.03.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:35:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4E7521FF96;
	Mon, 13 Dec 2021 11:35:08 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-7-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 06/26] hw/intc/arm_gicv3_its: Reduce code duplication in
 extract_table_params()
Date: Mon, 13 Dec 2021 11:34:57 +0000
In-reply-to: <20211211191135.1764649-7-peter.maydell@linaro.org>
Message-ID: <87o85kn3f7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: uzIBogrSze5B


Peter Maydell <peter.maydell@linaro.org> writes:

> The extract_table_params() decodes the fields in the GITS_BASER<n>
> registers into TableDesc structs.  Since the fields are the same for
> all the GITS_BASER<n> registers, there is currently a lot of code
> duplication within the switch (type) statement.  Refactor so that the
> cases include only what is genuinely different for each type:
> the calculation of the number of bits in the ID value that indexes
> into the table.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
