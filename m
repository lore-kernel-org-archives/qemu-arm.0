Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2821474ejb;
        Mon, 18 Sep 2023 04:00:36 -0700 (PDT)
X-Received: by 2002:aa7:c14b:0:b0:525:44c5:48e2 with SMTP id r11-20020aa7c14b000000b0052544c548e2mr8011907edp.22.1695034836381;
        Mon, 18 Sep 2023 04:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695034836; cv=none;
        d=google.com; s=arc-20160816;
        b=05C61iDBaRsxyz4fCPiw7yhJAqOUu2HFDqdj60fnJaOzd1G6HLhqB7TZxR37H8ouSL
         e2H1mWaz1/kQkL8PlUGCmu2iWVkMeCSXCt/Okhq2f8+NncUb1IM+YJ0i9dHJ4ysaCpwp
         tEZjDW62gvMDn9TfJZxJa0kFy2iD08JfT6zGRKe/yuUGfwaLd+bld5azgzCOFrnjLcWe
         xEUFLxs7f9PZQm7m1cxGOE2Mwk+2L42uxaoNv0UfbnZlicdUhmnV44k8bb8gDoP+QKAg
         cLNO53o3nL2JnwioQKHylabOCc3KNpvhftvi/8KyPdeXdX9sXCj0itjj8paQvJJx25Qr
         uaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K0T0yJm6zI1w+R1+ybu5R7i+AEkND4xDj9k8IkFVSN4=;
        fh=CD42jll0OB9d2OmkFinUv/iglXZ06DE12e0iIduPSQ4=;
        b=xySWLNxnJgvBs27fNcixZUYa/EgSWeu5xcsOTXxMPItpUNlvQ2I8RnoxXfb8UNtp3O
         H+/nXrd3e2QhnnMhDIcM1Y+VuBwav3sLn9ctn8JoYS0F6VGRBYz+NX4AJCqQG0ATrL1k
         llb4df0Y3o2xwSZvNGxrGnVMhve0wuuZgo7STAOyVbDo/xF20HIzhArsFkvRwyotu1ms
         MJq9f1wEFMbvT34whMSx+aLPydOk4QVJCbNjel5jfMPO7S9cxdJXxkeXZgQZyW11P/Y7
         5dYoNQpFT0kcB7ovD/F7klkDMRqIuE0oy+m0HAjbTgkklD2gOfunOr6qYd2oR8sskj3k
         AFfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4NzIaT0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s12-20020a50ab0c000000b0052555829d78sor956376edc.0.2023.09.18.04.00.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 04:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4NzIaT0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695034836; x=1695639636; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0T0yJm6zI1w+R1+ybu5R7i+AEkND4xDj9k8IkFVSN4=;
        b=c4NzIaT0iYMTJpCZk3fGQa+nHDtaXKkw3M+ELt2pwz9/TAZna0JOuZDNbp+11zP4Rq
         YbDymgFBfzt5oIO6dcmxavcOnRfzyuVa70o66O4vjaW0sZ8/TVYfaQmstGArI/azZD9X
         cvHBCZSlJJOIvylv47u3cyrfLqwIPSLG0tHVB/T+BxN1R237Nw3OtPoTl4yF8ne5LfU9
         md53cOzYLUVwUsjL8Y+BhAdnEi02f4W00XzYq1zqxkf6E3eA0aIrNi5HvyVs/5ksr2iD
         lAv+qh+H7vDyQja4QmT3qor4H+Oy/tFwhVYyxSNyGoa/omhJao5GjrnHcf5SSl2q3SIf
         boxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695034836; x=1695639636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0T0yJm6zI1w+R1+ybu5R7i+AEkND4xDj9k8IkFVSN4=;
        b=ZyboTRF8/Xlo9prVPp/vE1yy9sg/T4/4ABemFDrEx3Yw8zHnmBPpU/4pnRtlHHXSug
         4eXxS8iQWBcjfbLPOuBNZ+JbOmdg62JkkzFxK5CBBU//SeknOxh4LgjW191v9n1Kbuox
         tFRsxtEVYI2VhGbTh4ZGkUDOOBIso2oVI3NBbsLEockL1l0MKYmr035dHjx1Raltj3pu
         mZQtooIAM428CiwHfKixgl3sFryVakxhr0WgeWJBUu8hDoa8BbA9ETlE2PVO/viLXIun
         wNYldkOeKavtkYe8mbXj35NTyjmD6L1PaUZExjH7EqtSDwz75SUBeuI1ndDu/UzY8ejD
         FTyQ==
X-Gm-Message-State: AOJu0Ywk7hrsJBJpnVtLEtHx3d1JyJ5dgckeXTC/8adFVemyl+LjrVs3
	KgBC5Ix3ALgLrSMWj3e1QCXXQNLYknBJmr9ISO+RRVdy
X-Google-Smtp-Source: AGHT+IH9/9Q0nTbkQACKsPIzqG0pVIabhS8zIFVUjGrALFvU2SEjO82kx8gNlDTjGJOKgv9oK85tb3rDyONzVrVrAD0=
X-Received: by 2002:a05:6402:644:b0:523:aef9:3b7b with SMTP id
 u4-20020a056402064400b00523aef93b7bmr7770583edx.4.1695034835976; Mon, 18 Sep
 2023 04:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230918101736.23905-1-philmd@linaro.org> <20230918101736.23905-2-philmd@linaro.org>
In-Reply-To: <20230918101736.23905-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2023 12:00:17 +0100
Message-ID: <CAFEAcA89z1vCwDzzB_GjbUBtcOCz4vU7r_zC4nMmunp5BGVWxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/sd/omap_mmc: Do not reset SDCard until being fully realized
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	"Daniel P . Berrange" <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>, 
	Anton Johansson <anjo@rev.ng>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Bernhard Beschow <shentey@gmail.com>, 
	Alessandro Di Federico <ale@rev.ng>, qemu-arm@nongnu.org, Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jDLY9vycLa0e

On Mon, 18 Sept 2023 at 11:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> We shouldn't call QDev DeviceReset() before DeviceRealize().
>
> Since the OMAP MMC model is not QDev'ified, it has to manually
> call the SDCard reset() handler. This breaks QDev assumptions
> that DeviceReset() is never called before a device is fully
> realized. In order to avoid that, pass a 'realized' argument
> to omap_mmc_reset(). All cases are explicit manual resets,
> except in omap_mmc_write() where we expect the sdcard to be
> realized.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/arm/omap.h |  2 +-
>  hw/arm/omap1.c        |  2 +-
>  hw/arm/omap2.c        |  2 +-
>  hw/sd/omap_mmc.c      | 21 ++++++++++++---------
>  4 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index 067e9419f7..d331467946 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -808,7 +808,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
>  struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
>                  BlockBackend *blk, qemu_irq irq, qemu_irq dma[],
>                  omap_clk fclk, omap_clk iclk);
> -void omap_mmc_reset(struct omap_mmc_s *s);
> +void omap_mmc_reset(struct omap_mmc_s *s, bool realized);
>  void omap_mmc_handlers(struct omap_mmc_s *s, qemu_irq ro, qemu_irq cover=
);
>  void omap_mmc_enable(struct omap_mmc_s *s, int enable);
>
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index d5438156ee..3afeba6f86 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -3728,7 +3728,7 @@ static void omap1_mpu_reset(void *opaque)
>      omap_uart_reset(mpu->uart[0]);
>      omap_uart_reset(mpu->uart[1]);
>      omap_uart_reset(mpu->uart[2]);
> -    omap_mmc_reset(mpu->mmc);
> +    omap_mmc_reset(mpu->mmc, false);
>      omap_mpuio_reset(mpu->mpuio);
>      omap_uwire_reset(mpu->microwire);
>      omap_pwl_reset(mpu->pwl);
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index d5a2ae7af6..ef9b0dd60a 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -2253,7 +2253,7 @@ static void omap2_mpu_reset(void *opaque)
>      omap_uart_reset(mpu->uart[0]);
>      omap_uart_reset(mpu->uart[1]);
>      omap_uart_reset(mpu->uart[2]);
> -    omap_mmc_reset(mpu->mmc);
> +    omap_mmc_reset(mpu->mmc, false);
>      omap_mcspi_reset(mpu->mcspi[0]);
>      omap_mcspi_reset(mpu->mcspi[1]);
>      cpu_reset(CPU(mpu->cpu));

These are reset functions registered via qemu_register_reset().
They should be OK to assume the SD card is realized.
This matters, because this is the only place that the SD
card will get reset -- as the comment in omap_mmc_reset() notes,
the SD card object isn't going to be plugged into any bus, so
it won't get auto-reset when the simulation starts, and these
reset function are the place that does the manual reset.

> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index edd3cf2a1e..3c906993eb 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -287,7 +287,7 @@ static void omap_mmc_pseudo_reset(struct omap_mmc_s *=
host)
>      host->fifo_len =3D 0;
>  }
>
> -void omap_mmc_reset(struct omap_mmc_s *host)
> +void omap_mmc_reset(struct omap_mmc_s *host, bool realized)
>  {
>      host->last_cmd =3D 0;
>      memset(host->rsp, 0, sizeof(host->rsp));
> @@ -314,11 +314,14 @@ void omap_mmc_reset(struct omap_mmc_s *host)
>
>      omap_mmc_pseudo_reset(host);
>
> -    /* Since we're still using the legacy SD API the card is not plugged
> -     * into any bus, and we must reset it manually. When omap_mmc is
> -     * QOMified this must move into the QOM reset function.
> -     */
> -    device_cold_reset(DEVICE(host->card));
> +    if (realized) {
> +        /*
> +         * Since we're still using the legacy SD API the card is not plu=
gged
> +         * into any bus, and we must reset it manually. When omap_mmc is
> +         * QOMified this must move into the QOM reset function.
> +         */
> +        device_cold_reset(DEVICE(host->card));
> +    }
>  }
>
>  static uint64_t omap_mmc_read(void *opaque, hwaddr offset, unsigned size=
)
> @@ -556,7 +559,7 @@ static void omap_mmc_write(void *opaque, hwaddr offse=
t,
>          break;
>      case 0x64: /* MMC_SYSC */
>          if (value & (1 << 2))                                  /* SRTS *=
/
> -            omap_mmc_reset(s);
> +            omap_mmc_reset(s, true);
>          break;
>      case 0x68: /* MMC_SYSS */
>          OMAP_RO_REG(offset);
> @@ -613,7 +616,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
>          exit(1);
>      }
>
> -    omap_mmc_reset(s);
> +    omap_mmc_reset(s, false);
>
>      return s;
>  }
> @@ -643,7 +646,7 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_=
agent_s *ta,
>      s->cdet =3D qemu_allocate_irq(omap_mmc_cover_cb, s, 0);
>      sd_set_cb(s->card, NULL, s->cdet);
>
> -    omap_mmc_reset(s);
> +    omap_mmc_reset(s, false);

These calls from omap_mmc_init() are probably safe to remove, but I
don't understand why they result in our resetting a non-realized
SD card object. In both cases, the call happens after we call
sd_init(). sd_init() both creates and realizes the SD card, so
it should be realized at the point when it gets reset.

In a truly ideal world we would QOMify the omap-mmc device: it
is the only remaining user of the legacy sd_init function...

thanks
-- PMM
