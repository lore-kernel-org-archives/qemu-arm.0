Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i13sm37157wrw.32.2018.11.12.03.50.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Nov 2018 03:50:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 5090B3E045E;
	Mon, 12 Nov 2018 11:50:11 +0000 (GMT)
References: <20181106164118.16184-1-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH for-3.1] target/arm: Remove antique TODO comment
In-reply-to: <20181106164118.16184-1-peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 11:50:11 +0000
Message-ID: <87k1liecr0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fIJCZKusBJHx


Peter Maydell <peter.maydell@linaro.org> writes:

> Remove a TODO comment about implementing the vectored interrupt
> controller. We have had an implementation of that for a decade;
> it's in hw/intc/pl190.c.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ec56becc394..851ea9aa977 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8378,7 +8378,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *=
cs)
>          return;
>      }
>
> -    /* TODO: Vectored interrupt controller.  */
>      switch (cs->exception_index) {
>      case EXCP_UDEF:
>          new_mode =3D ARM_CPU_MODE_UND;


--
Alex Benn=C3=A9e
