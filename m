Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local (host5-81-235-77.range5-81.btcentralplus.com. [5.81.235.77])
        by smtp.gmail.com with ESMTPSA id o26sm3009063wro.44.2017.02.24.09.17.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 09:17:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 1F1173E0198;
	Fri, 24 Feb 2017 17:17:13 +0000 (GMT)
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org> <1487262963-11519-14-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [PATCH v2 13/13] armv7m: Allow SHCSR writes to change pending and active bits
In-reply-to: <1487262963-11519-14-git-send-email-peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 17:17:13 +0000
Message-ID: <87lgsvld9i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: kYKSBT7hzJ+H


Peter Maydell <peter.maydell@linaro.org> writes:

> Implement the NVIC SHCSR write behaviour which allows pending and
> active status of some exceptions to be changed.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/intc/armv7m_nvic.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index a8c5a9e..1d34e0d 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -755,8 +755,17 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>          cpu->env.v7m.ccr = value;
>          break;
>      case 0xd24: /* System Handler Control.  */
> -        /* TODO: Real hardware allows you to set/clear the active bits
> -           under some circumstances.  We don't implement this.  */
> +        s->vectors[ARMV7M_EXCP_MEM].active = (value & (1 << 0)) != 0;
> +        s->vectors[ARMV7M_EXCP_BUS].active = (value & (1 << 1)) != 0;
> +        s->vectors[ARMV7M_EXCP_USAGE].active = (value & (1 << 3)) != 0;
> +        s->vectors[ARMV7M_EXCP_SVC].active = (value & (1 << 7)) != 0;
> +        s->vectors[ARMV7M_EXCP_DEBUG].active = (value & (1 << 8)) != 0;
> +        s->vectors[ARMV7M_EXCP_PENDSV].active = (value & (1 << 10)) != 0;
> +        s->vectors[ARMV7M_EXCP_SYSTICK].active = (value & (1 << 11)) != 0;
> +        s->vectors[ARMV7M_EXCP_USAGE].pending = (value & (1 << 12)) != 0;
> +        s->vectors[ARMV7M_EXCP_MEM].pending = (value & (1 << 13)) != 0;
> +        s->vectors[ARMV7M_EXCP_BUS].pending = (value & (1 << 14)) != 0;
> +        s->vectors[ARMV7M_EXCP_SVC].pending = (value & (1 << 15)) != 0;
>          s->vectors[ARMV7M_EXCP_MEM].enabled = (value & (1 << 16)) != 0;
>          s->vectors[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
>          s->vectors[ARMV7M_EXCP_USAGE].enabled = (value & (1 << 18)) != 0;


--
Alex Bennée
