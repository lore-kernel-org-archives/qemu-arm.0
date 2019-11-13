Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i13sm2636420wrp.12.2019.11.13.04.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 04:32:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 479AC1FF87;
	Wed, 13 Nov 2019 12:32:38 +0000 (GMT)
References: <20191113005201.19005-1-joel@jms.id.au>
 <20191113005201.19005-4-joel@jms.id.au>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 3/4] watchdog/aspeed: Improve watchdog timeout message
In-reply-to: <20191113005201.19005-4-joel@jms.id.au>
Date: Wed, 13 Nov 2019 12:32:38 +0000
Message-ID: <874kz87y8p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wAYoUgiV0w0X


Joel Stanley <joel@jms.id.au> writes:

> Users benefit from knowing which watchdog timer has expired. The address
> of the watchdog's registers unambiguously indicates which has expired,
> so log that.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Use HWADDR_PRIx
> ---
>  hw/watchdog/wdt_aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 145be6f99ce2..8787c5ad0f97 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -219,7 +219,8 @@ static void aspeed_wdt_timer_expired(void *dev)
>          return;
>      }
>
> -    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
> +    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer %" HWADDR_PRIx " expire=
d.\n",
> +            s->iomem.addr);

nit: spacing off

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>      watchdog_perform_action();
>      timer_del(s->timer);
>  }


--
Alex Benn=C3=A9e
