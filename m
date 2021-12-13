Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t11sm11079168wrz.97.2021.12.13.06.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:40:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 169E71FF96;
	Mon, 13 Dec 2021 14:40:11 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-21-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 20/26] hw/intc/arm_gicv3_its: Use enum for return value
 of process_* functions
Date: Mon, 13 Dec 2021 14:40:06 +0000
In-reply-to: <20211211191135.1764649-21-peter.maydell@linaro.org>
Message-ID: <87v8zsk1pw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0DdWhfw8JAs5


Peter Maydell <peter.maydell@linaro.org> writes:

> When an ITS detects an error in a command, it has an
> implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
> to ignore the command, proceeding to the next one in the queue, or to
> stall the ITS command queue, processing nothing further.  The
> behaviour required when the read of the command packet from memory
> fails is less clearly documented, but the same set of choices as for
> command errors seem reasonable.
>
> The intention of the QEMU implementation, as documented in the
> comments, is that if we encounter a memory error reading the command
> packet or one of the various data tables then we should stall, but
> for command parameter errors we should ignore the queue and continue.
> However, we don't actually do this.  To get the desired behaviour,
> the various process_* functions need to return true to cause
> process_cmdq() to advance to the next command and keep processing,
> and false to stall command processing.  What they mostly do is return
> false for any kind of error.
>
> To make the code clearer, replace the 'bool' return from the process_
> functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
> In this commit no behaviour changes; in subsequent commits we will
> adjust the error-return paths for the process_ functions one by one.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
