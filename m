Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z6sm1550389wmz.46.2019.08.08.02.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2019 02:09:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A85111FF87;
	Thu,  8 Aug 2019 10:08:59 +0100 (BST)
References: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
 <1565239479-2130-1-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Jason Wang <jasowang@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Stefano Garzarella
 <sgarzare@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v2] hw: net: cadence_gem: Fix build errors in
 DB_PRINT()
In-reply-to: <1565239479-2130-1-git-send-email-bmeng.cn@gmail.com>
Date: Thu, 08 Aug 2019 10:08:59 +0100
Message-ID: <877e7ohvmc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1TxGyUQWFmIb


Bin Meng <bmeng.cn@gmail.com> writes:

> When CADENCE_GEM_ERR_DEBUG is turned on, there are several
> compilation errors in DB_PRINT(). Fix them.

The first fix should be to ensure the format strings are validated in
normal compilation. This can be achieved by allowing the compiler to
optimise away debug strings with constant folding... for example:

  #define tlb_debug(fmt, ...) do { \
      if (DEBUG_TLB_LOG_GATE) { \
          qemu_log_mask(CPU_LOG_MMU, "%s: " fmt, __func__, \
                        ## __VA_ARGS__); \
      } else if (DEBUG_TLB_GATE) { \
          fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__); \
      } \
  } while (0)

However ultimately most debug printfs are either a) stale leftovers from
original development or b) could be considered for conversion to
tracepoints.

>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
>
> Changes in v2:
> - use HWADDR_PRIx instead of TARGET_FMT_plx for consistency
> - use 'z' modifier to print sizeof(..)
>
>  hw/net/cadence_gem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index d412085..b6ff2c1 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const =
uint8_t *buf, size_t size)
>              return -1;
>          }
>
> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize=
),
> -                rx_desc_get_buffer(s->rx_desc[q]));
> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",
> +                 MIN(bytes_to_copy, rxbufsize),
> +                 rx_desc_get_buffer(s, s->rx_desc[q]));
>
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc=
[q]) +
> @@ -1157,7 +1158,7 @@ static void gem_transmit(CadenceGEMState *s)
>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>                                                 (p - tx_packet)) {
>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x spac=
e " \
> -                         "0x%x\n", (unsigned)packet_desc_addr,
> +                         "0x%zx\n", (unsigned)packet_desc_addr,
>                           (unsigned)tx_desc_get_length(desc),
>                           sizeof(tx_packet) - (p - tx_packet));
>                  break;


--
Alex Benn=C3=A9e
