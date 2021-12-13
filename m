Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e3sm10840630wrp.8.2021.12.13.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:56:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 789FD1FF96;
	Mon, 13 Dec 2021 11:56:35 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-11-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
Date: Mon, 13 Dec 2021 11:56:30 +0000
In-reply-to: <20211211191135.1764649-11-peter.maydell@linaro.org>
Message-ID: <87y24olnv0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RlpfDq1zgr44


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently the ITS code that reads and writes DTEs uses open-coded
> shift-and-mask to assemble the various fields into the 64-bit DTE
> word.  The names of the macros used for mask and shift values are
> also somewhat inconsistent, and don't follow our usual convention
> that a MASK macro should specify the bits in their place in the word.
> Replace all these with use of the FIELD macro.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
