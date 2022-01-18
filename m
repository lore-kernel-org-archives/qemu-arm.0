Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w3sm149978edd.63.2022.01.18.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 09:32:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4D59A1FFB7;
	Tue, 18 Jan 2022 17:32:23 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-13-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH v2 12/13] hw/intc/arm_gicv3_its: Check indexes before
 use, not after
Date: Tue, 18 Jan 2022 17:32:18 +0000
In-reply-to: <20220111171048.3545974-13-peter.maydell@linaro.org>
Message-ID: <87y23d7xw8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 00ilrwWPC3Jm


Peter Maydell <peter.maydell@linaro.org> writes:

> In a few places in the ITS command handling functions, we were
> doing the range-check of an event ID or device ID only after using
> it as a table index; move the checks to before the uses.
>
> This misordering wouldn't have very bad effects because the
> tables are in guest memory anyway.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
