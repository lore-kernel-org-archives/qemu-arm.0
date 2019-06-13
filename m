Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c65sm4387239wma.44.2019.06.13.06.33.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 06:33:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6299D1FF87;
	Thu, 13 Jun 2019 14:33:37 +0100 (BST)
References: <20190517174046.11146-1-peter.maydell@linaro.org> <20190517174046.11146-4-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 3/4] hw/arm/armv7m: Forward "vfp" and "dsp" properties to CPU
In-reply-to: <20190517174046.11146-4-peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 14:33:37 +0100
Message-ID: <877e9pehji.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: neSH3wG338tM


Peter Maydell <peter.maydell@linaro.org> writes:

> Create "vfp" and "dsp" properties on the armv7m container object
> which will be forwarded to its CPU object, so that SoCs can
> configure whether the CPU has these features.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/hw/arm/armv7m.h |  4 ++++
>  hw/arm/armv7m.c         | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index e96a98f8093..d2c74d3872a 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -43,6 +43,8 @@ typedef struct {
>   *   devices will be automatically layered on top of this view.)
>   * + Property "idau": IDAU interface (forwarded to CPU object)
>   * + Property "init-svtor": secure VTOR reset value (forwarded to CPU ob=
ject)
> + * + Property "vfp": enable VFP (forwarded to CPU object)
> + * + Property "dsp": enable DSP (forwarded to CPU object)
>   * + Property "enable-bitband": expose bitbanded IO
>   */
>  typedef struct ARMv7MState {
> @@ -66,6 +68,8 @@ typedef struct ARMv7MState {
>      uint32_t init_svtor;
>      bool enable_bitband;
>      bool start_powered_off;
> +    bool vfp;
> +    bool dsp;
>  } ARMv7MState;
>
>  #endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index c4b2a9a1f5c..7caf9bd3364 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -190,6 +190,22 @@ static void armv7m_realize(DeviceState *dev, Error *=
*errp)
>              return;
>          }
>      }
> +    if (object_property_find(OBJECT(s->cpu), "vfp", NULL)) {
> +        object_property_set_bool(OBJECT(s->cpu), s->vfp,
> +                                 "vfp", &err);
> +        if (err !=3D NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
> +    if (object_property_find(OBJECT(s->cpu), "dsp", NULL)) {
> +        object_property_set_bool(OBJECT(s->cpu), s->dsp,
> +                                 "dsp", &err);
> +        if (err !=3D NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
>
>      /*
>       * Tell the CPU where the NVIC is; it will fail realize if it doesn't
> @@ -260,6 +276,8 @@ static Property armv7m_properties[] =3D {
>      DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, fals=
e),
>      DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
>                       false),
> +    DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
> +    DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };


--
Alex Benn=C3=A9e
