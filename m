Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x13sm8013920wrg.7.2017.11.06.08.20.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Nov 2017 08:20:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F09793E040E;
	Mon,  6 Nov 2017 16:20:56 +0000 (GMT)
References: <1509732813-22957-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 1.0-alpha0; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] nvic: Fix ARMv7M MPU_RBAR reads
In-reply-to: <1509732813-22957-1-git-send-email-peter.maydell@linaro.org>
Date: Mon, 06 Nov 2017 16:20:56 +0000
Message-ID: <871slbs7iv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Gr5K2L+aK8OJ


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix an incorrect mask expression in the handling of v7M MPU_RBAR
> reads that meant that we would always report the ADDR field as zero.

nit: you could extend that to: "..as zero because we mask it when
written".

As I see you do:
  cpu->env.pmsav7.drbar[region] =3D value & ~0x1f;

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Doesn't affect v8M, which is a different codepath.
>
>  hw/intc/armv7m_nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index be46639..5d9c883 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -977,7 +977,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t off=
set, MemTxAttrs attrs)
>          if (region >=3D cpu->pmsav7_dregion) {
>              return 0;
>          }
> -        return (cpu->env.pmsav7.drbar[region] & 0x1f) | (region & 0xf);
> +        return (cpu->env.pmsav7.drbar[region] & ~0x1f) | (region & 0xf);
>      }
>      case 0xda0: /* MPU_RASR (v7M), MPU_RLAR (v8M) */
>      case 0xda8: /* MPU_RASR_A1 (v7M), MPU_RLAR_A1 (v8M) */


--
Alex Benn=C3=A9e
