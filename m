Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x135sm3991955wme.23.2017.01.27.05.55.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 05:55:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 024983E0342;
	Fri, 27 Jan 2017 13:55:24 +0000 (GMT)
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org> <1485285380-10565-9-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 08/10] armv7m: Honour CCR.USERSETMPEND
In-reply-to: <1485285380-10565-9-git-send-email-peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 13:55:23 +0000
Message-ID: <8737g4a9pw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: GQfGn2HVF/hu


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> The CCR.USERSETMPEND bit has to be set to permit unprivileged code to
> write to the Software Triggered Interrupt register; honour this bit
> rather than letting any code write to the register.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: Tweak commit message, comment, phrasing of condition]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/intc/armv7m_nvic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 60e72d7..fe5c303 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -409,7 +409,10 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
>                        "NVIC: Aux fault status registers unimplemented\n");
>          break;
>      case 0xf00: /* Software Triggered Interrupt Register */
> -        if ((value & 0x1ff) < s->num_irq) {
> +        /* user mode can only write to STIR if CCR.USERSETMPEND permits it */
> +        if ((value & 0x1ff) < s->num_irq &&
> +            (arm_current_el(&cpu->env) ||
> +             (cpu->env.v7m.ccr & R_V7M_CCR_USERSETMPEND_MASK))) {
>              gic_set_pending_private(&s->gic, 0, value & 0x1ff);
>          }
>          break;


--
Alex Bennée
