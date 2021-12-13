Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f13sm7805967wmq.29.2021.12.13.05.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:36:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9FD441FF96;
	Mon, 13 Dec 2021 13:36:06 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-16-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
Date: Mon, 13 Dec 2021 13:36:00 +0000
In-reply-to: <20211211191135.1764649-16-peter.maydell@linaro.org>
Message-ID: <87czm0lj95.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: W14Sfyf3h+LV


Peter Maydell <peter.maydell@linaro.org> writes:

> In several places we have a local variable max_l2_entries which is
> the number of entries which will fit in a level 2 table.  The
> calculations done on this value are correct; rename it to
> num_l2_entries to fit the convention we're using in this code.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
