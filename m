Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a9sm11025798wrt.66.2021.12.13.05.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:35:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 029A61FF96;
	Mon, 13 Dec 2021 13:35:09 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-15-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 14/26] hw/intc/arm_gicv3_its: Fix various off-by-one errors
Date: Mon, 13 Dec 2021 13:35:01 +0000
In-reply-to: <20211211191135.1764649-15-peter.maydell@linaro.org>
Message-ID: <87h7bcljar.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RQqa0HUr6sk6


Peter Maydell <peter.maydell@linaro.org> writes:

> The ITS code has to check whether various parameters passed in
> commands are in-bounds, where the limit is defined in terms of the
> number of bits that are available for the parameter.  (For example,
> the GITS_TYPER.Devbits ID register field specifies the number of
> DeviceID bits minus 1, and device IDs passed in the MAPTI and MAPD
> command packets must fit in that many bits.)
>
> Currently we have off-by-one bugs in many of these bounds checks.
> The typical problem is that we define a max_foo as 1 << n. In
> the Devbits example, we set
>   s->dt.max_ids =3D 1UL << (GITS_TYPER.Devbits + 1).
> However later when we do the bounds check we write
>   if (devid > s->dt.max_ids) { /* command error */ }
> which incorrectly permits a devid of 1 << n.
>
> These bugs will not cause QEMU crashes because the ID values being
> checked are only used for accesses into tables held in guest memory
> which we access with address_space_*() functions, but they are
> incorrect behaviour of our emulation.
>
> Fix them by standardizing on this pattern:
>  * bounds limits are named num_foos and are the 2^n value
>    (equal to the number of valid foo values)
>  * bounds checks are either
>    if (fooid < num_foos) { good }
>    or
>    if (fooid >=3D num_foos) { bad }
>
> In this commit we fix the handling of the number of IDs
> in the device table and the collection table, and the number
> of commands that will fit in the command queue.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
