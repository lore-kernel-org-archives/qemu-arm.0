Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 21sm11701738wmj.18.2021.11.28.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:30:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2492E1FF96;
	Sun, 28 Nov 2021 16:30:03 +0000 (GMT)
References: <20211126163915.1048353-1-peter.maydell@linaro.org>
 <20211126163915.1048353-2-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Shashi Mallela
 <shashi.mallela@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH for-6.2? 1/2] hw/intc/arm_gicv3: Add new
 gicv3_intid_is_special() function
Date: Sun, 28 Nov 2021 16:29:58 +0000
In-reply-to: <20211126163915.1048353-2-peter.maydell@linaro.org>
Message-ID: <875yscnsz8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xb6Cohj5A9Wi


Peter Maydell <peter.maydell@linaro.org> writes:

> The GICv3/v4 pseudocode has a function IsSpecial() which returns true
> if passed a "special" interrupt ID number (anything between 1020 and
> 1023 inclusive).  We open-code this condition in a couple of places,
> so abstract it out into a new function gicv3_intid_is_special().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
