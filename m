Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e72sm7779536wma.16.2017.02.15.06.19.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2017 06:19:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B7A093E00FA;
	Wed, 15 Feb 2017 14:19:34 +0000 (GMT)
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org> <1486065742-28639-10-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 9/9] armv7m: VECTCLRACTIVE and VECTRESET are UNPREDICTABLE
In-reply-to: <1486065742-28639-10-git-send-email-peter.maydell@linaro.org>
Date: Wed, 15 Feb 2017 14:19:34 +0000
Message-ID: <87d1ejv8nd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: rgoidYo7C0SF


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> The VECTCLRACTIVE and VECTRESET bits in the AIRCR are both
> documented as UNPREDICTABLE if you write a 1 to them when
> the processor is not halted in Debug state (ie stopped
> and under the control of an external JTAG debugger).
> Since we don't implement Debug state or emulated JTAG
> these bits are always UNPREDICTABLE for us. Instead of
> logging them as unimplemented we can simply log writes
> as guest errors and ignore them.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: change extracted from another patch; commit message
>  constructed from scratch]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/intc/armv7m_nvic.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 7b61fe6..18c0e60 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -698,10 +698,14 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>                  qemu_irq_pulse(s->sysresetreq);
>              }
>              if (value & 2) {
> -                qemu_log_mask(LOG_UNIMP, "VECTCLRACTIVE unimplemented\n");
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "Setting VECTCLRACTIVE when not in DEBUG mode "
> +                              "is UNPREDICTABLE\n");
>              }
>              if (value & 1) {
> -                qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "Setting VECTRESET when not in DEBUG mode "
> +                              "is UNPREDICTABLE\n");
>              }
>              s->prigroup = extract32(value, 8, 3);
>              nvic_irq_update(s);


--
Alex Bennée
