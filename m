Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u108-v6sm12144677wrc.40.2018.06.14.11.24.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jun 2018 11:24:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A9F603E0112;
	Thu, 14 Jun 2018 19:24:44 +0100 (BST)
References: <20180604152941.20374-1-peter.maydell@linaro.org> <20180604152941.20374-10-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 09/13] hw/core/or-irq: Support more than 16 inputs to an OR gate
In-reply-to: <20180604152941.20374-10-peter.maydell@linaro.org>
Date: Thu, 14 Jun 2018 19:24:44 +0100
Message-ID: <87sh5pz0nn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: I5xN8pwctP5B


Peter Maydell <peter.maydell@linaro.org> writes:

> For the IoTKit MPC support, we need to wire together the
> interrupt outputs of 17 MPCs; this exceeds the current
> value of MAX_OR_LINES. Increase MAX_OR_LINES to 32 (which
> should be enough for anyone).
>
> The tricky part is retaining the migration compatibility for
> existing OR gates; we add a subsection which is only used
> for larger OR gates, and define it such that we can freely
> increase MAX_OR_LINES in future (or even move to a dynamically
> allocated levels[] array without an upper size limit) without
> breaking compatibility.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/hw/or-irq.h |  5 ++++-
>  hw/core/or-irq.c    | 39 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
> index 3f6fc1b58a4..5a31e5a1881 100644
> --- a/include/hw/or-irq.h
> +++ b/include/hw/or-irq.h
> @@ -31,7 +31,10 @@
>
>  #define TYPE_OR_IRQ "or-irq"
>
> -#define MAX_OR_LINES      16
> +/* This can safely be increased if necessary without breaking
> + * migration compatibility (as long as it remains greater than 15).
> + */
> +#define MAX_OR_LINES      32
>
>  typedef struct OrIRQState qemu_or_irq;
>
> diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
> index f9d76c46415..a86901b673c 100644
> --- a/hw/core/or-irq.c
> +++ b/hw/core/or-irq.c
> @@ -66,14 +66,49 @@ static void or_irq_init(Object *obj)
>      qdev_init_gpio_out(DEVICE(obj), &s->out_irq, 1);
>  }
>
> +/* The original version of this device had a fixed 16 entries in its
> + * VMState array; devices with more inputs than this need to
> + * migrate the extra lines via a subsection.
> + * The subsection migrates as much of the levels[] array as is needed
> + * (including repeating the first 16 elements), to avoid the awkwardness
> + * of splitting it in two to meet the requirements of VMSTATE_VARRAY_UIN=
T16.
> + */
> +#define OLD_MAX_OR_LINES 16
> +#if MAX_OR_LINES < OLD_MAX_OR_LINES
> +#error MAX_OR_LINES must be at least 16 for migration compatibility
> +#endif
> +
> +static bool vmstate_extras_needed(void *opaque)
> +{
> +    qemu_or_irq *s =3D OR_IRQ(opaque);
> +
> +    return s->num_lines >=3D OLD_MAX_OR_LINES;
> +}
> +
> +static const VMStateDescription vmstate_or_irq_extras =3D {
> +    .name =3D "or-irq-extras",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D vmstate_extras_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_VARRAY_UINT16_UNSAFE(levels, qemu_or_irq, num_lines, 0,
> +                                     vmstate_info_bool, bool),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
>  static const VMStateDescription vmstate_or_irq =3D {
>      .name =3D TYPE_OR_IRQ,
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
>      .fields =3D (VMStateField[]) {
> -        VMSTATE_BOOL_ARRAY(levels, qemu_or_irq, MAX_OR_LINES),
> +        VMSTATE_BOOL_SUB_ARRAY(levels, qemu_or_irq, 0, OLD_MAX_OR_LINES),
>          VMSTATE_END_OF_LIST(),
> -    }
> +    },
> +    .subsections =3D (const VMStateDescription*[]) {
> +        &vmstate_or_irq_extras,
> +        NULL
> +    },
>  };
>
>  static Property or_irq_properties[] =3D {


--
Alex Benn=C3=A9e
