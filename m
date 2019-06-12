Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y9sm2905381wma.1.2019.06.12.11.03.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 11:03:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1A6641FF87;
	Wed, 12 Jun 2019 19:03:02 +0100 (BST)
References: <20190611145556.12940-1-rfried.dev@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>, Ramon Fried <rfried.dev@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2] net: cadence_gem: fix compilation error when debug is on
In-reply-to: <20190611145556.12940-1-rfried.dev@gmail.com>
Date: Wed, 12 Jun 2019 19:03:02 +0100
Message-ID: <87o932el61.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fyrKs6yM9LpC


Ramon Fried <rfried.dev@gmail.com> writes:

> defining CADENCE_GEM_ERR_DEBUG causes compilation
> errors, fix that.

It would be worth doing something like:

#ifdef CADENCE_GEM_ERR_DEBUG
#define CADENCE_GEM_GATE 1
#else
#define CADENCE_GEM_GATE 0
#endif

#define DB_PRINT(...) do { \
    if (CADENCE_GEM_GATE) { \
        fprintf(stderr,  ": %s: ", __func__); \
        fprintf(stderr, ## __VA_ARGS__); \
    } \
} while (0)

So these format strings don't go stale in and only get detected on
--debug builds.

While your at it I suspect the fprintf debug would be better of as:

  qemu_log("%s: " fmt, __func__, ## args);


>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
> v2: change %lx to HWADDR_PRIx and %lx to %zdx
>
>  hw/net/cadence_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 7f63411430..e9b1b1e2eb 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, const =
uint8_t *buf, size_t size)
>              return -1;
>          }
>
> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize=
),
> -                rx_desc_get_buffer(s->rx_desc[q]));
> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n", MIN(bytes_to_c=
opy, rxbufsize),
> +                rx_desc_get_buffer(s, s->rx_desc[q]));
>
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc=
[q]) +
> @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>                                                 (p - tx_packet)) {
>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x spac=
e " \
> -                         "0x%x\n", (unsigned)packet_desc_addr,
> +                         "0x%zdx\n", (unsigned)packet_desc_addr,
>                           (unsigned)tx_desc_get_length(desc),
>                           sizeof(tx_packet) - (p - tx_packet));
>                  break;


--
Alex Benn=C3=A9e
