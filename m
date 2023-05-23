Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f15-20020a0560001b0f00b003062c609115sm11067393wrz.21.2023.05.23.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:28:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 836E21FFBB;
	Tue, 23 May 2023 14:28:45 +0100 (BST)
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-4-philmd@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Peter
 Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH 03/12] util/fifo8: Introduce fifo8_peek_buf()
Date: Tue, 23 May 2023 14:25:34 +0100
In-reply-to: <20230522153144.30610-4-philmd@linaro.org>
Message-ID: <877csz5g8i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aA04p4NeOzl4


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> To be able to poke at FIFO content without popping it,

peek/poke are different operations in my head. You peek to read stuff
and poke to change stuff, or at least thats what I did in BASIC back in
the 80s.

Either way I don't think peek and poke are synonyms.

> introduce the fifo8_peek_buf() method by factoring
> common content from fifo8_pop_buf().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/qemu/fifo8.h | 26 ++++++++++++++++++++++++++
>  util/fifo8.c         | 22 ++++++++++++++++++----
>  2 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index d0d02bc73d..7acf6d1347 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -93,6 +93,32 @@ uint8_t fifo8_pop(Fifo8 *fifo);
>   */
>  const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr=
);
>=20=20
> +/**
> + * fifo8_peek_buf:

fifo8_peek_buf() - read upto max bytes from the fifo


> + * @fifo: FIFO to poke from
> + * @max: maximum number of bytes to pop
> + * @numptr: pointer filled with number of bytes returned (can be NULL)
> + *
> + * Pop a number of elements from the FIFO up to a maximum of max. The bu=
ffer
> + * containing the popped data is returned. This buffer points directly i=
nto
> + * the FIFO backing store and data is invalidated once any of the fifo8_=
* APIs
> + * are called on the FIFO.
> + *
> + * The function may return fewer bytes than requested when the data wraps
> + * around in the ring buffer; in this case only a contiguous part of the=
 data
> + * is returned.
> + *
> + * The number of valid bytes returned is populated in *numptr; will alwa=
ys
> + * return at least 1 byte. max must not be 0 or greater than the number =
of
> + * bytes in the FIFO.
> + *
> + * Clients are responsible for checking the availability of requested da=
ta
> + * using fifo8_num_used().
> + *
> + * Returns: A pointer to peekable data.
> + */
> +const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numpt=
r);
> +
>  /**
>   * fifo8_reset:
>   * @fifo: FIFO to reset
> diff --git a/util/fifo8.c b/util/fifo8.c
> index 032e985440..e12477843e 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -66,7 +66,8 @@ uint8_t fifo8_pop(Fifo8 *fifo)
>      return ret;
>  }
>=20=20
> -const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
> +static const uint8_t *fifo8_peekpop_buf(Fifo8 *fifo, uint32_t max,
> +                                        uint32_t *numptr, bool do_pop)
>  {
>      uint8_t *ret;
>      uint32_t num;
> @@ -74,15 +75,28 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t ma=
x, uint32_t *numptr)
>      assert(max > 0 && max <=3D fifo->num);
>      num =3D MIN(fifo->capacity - fifo->head, max);
>      ret =3D &fifo->data[fifo->head];
> -    fifo->head +=3D num;
> -    fifo->head %=3D fifo->capacity;
> -    fifo->num -=3D num;
> +
> +    if (do_pop) {
> +        fifo->head +=3D num;
> +        fifo->head %=3D fifo->capacity;
> +        fifo->num -=3D num;
> +    }
>      if (numptr) {
>          *numptr =3D num;
>      }
>      return ret;
>  }
>=20=20
> +const uint8_t *fifo8_peek_buf(Fifo8 *fifo, uint32_t max, uint32_t *numpt=
r)
> +{
> +    return fifo8_peekpop_buf(fifo, max, numptr, false);
> +}
> +
> +const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
> +{
> +    return fifo8_peekpop_buf(fifo, max, numptr, true);
> +}
> +
>  void fifo8_reset(Fifo8 *fifo)
>  {
>      fifo->num =3D 0;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
