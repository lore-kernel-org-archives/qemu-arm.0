Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp221440ejx;
        Wed, 22 Nov 2023 02:31:43 -0800 (PST)
X-Received: by 2002:a05:6808:6d0:b0:3ae:e79d:7984 with SMTP id m16-20020a05680806d000b003aee79d7984mr1926567oih.55.1700649103459;
        Wed, 22 Nov 2023 02:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700649103; cv=none;
        d=google.com; s=arc-20160816;
        b=nr23cMN1z6AvjMOIM6LXF3Csb72uCZ7x7c/92+nYslcRczSRh1FcopHtyT4dDLMTBy
         0s0CpG2G9McJjiLIYgZ514G7LNJ3rzZVzH7R9/c9D9VCMe4UYnCFe4iC5Mrl3lp+fjei
         jkvv3O7GISlOLEj8tyFEIW211fUSccIrg1z1ifg1hqnxviXTockeDBvDWmGoMmAh2pZc
         za5DNmnjmQI9Q+ojKWNogJuhN4peQjNmjW4OJXgAgPqDh80VJZjwbP+X2fvLS/ty5/N/
         eF1URP9eiLCKRsiotGE93xhiWNgDsoswxZFOPna+rBHSDIcrgFokUDZDQSyWbqVntMr5
         W+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6xRnJgX5BPvayGYI69im8tUAMArxnMA1xQvESA9sv6s=;
        fh=QyFayFpbXpt0YAfXiJQMGkKX9CFZ89z+3bSEStTpyG4=;
        b=gW0MECLZbPLxFmXt30XtID4y09a4MmVrQkhT0Ea6S+5BPIWkM6ze2Ku51TZgyAVCNu
         RCpgdm8cc6GGY5Nzbq+jBQPYRTSXoZHj8H8edxi0nveZ+TH8OorcJBBtMKzVI8Cmo7U9
         GM9Q8+ahX+HFdfCIJtK7w08wTxpJUscwQy3RGG5dU4EMJDq5qxANJi1dBB59hnU781XB
         JmhWoUO135YJ2RddYOAUqIer8QXPN9dz8K4ZI6i/S4E898C0pWCGD1DN6N17JSmZVcMp
         CeLdBTBQONpGtvLK7f6oy6CVZI8JAP4cCGtWAUDakw5qB9eAA+/tszXjmbUbgwExht2u
         GXbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AyDvaKI6;
       spf=pass (google.com: domain of marcandre.lureau@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcandre.lureau@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <marcandre.lureau@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e22-20020aca2316000000b003b83d616ddesor692076oie.11.2023.11.22.02.31.43
        (Google Transport Security);
        Wed, 22 Nov 2023 02:31:43 -0800 (PST)
Received-SPF: pass (google.com: domain of marcandre.lureau@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AyDvaKI6;
       spf=pass (google.com: domain of marcandre.lureau@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcandre.lureau@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700649102; x=1701253902; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xRnJgX5BPvayGYI69im8tUAMArxnMA1xQvESA9sv6s=;
        b=AyDvaKI6rKlsf4Tbjy/KnCT7m6OMkMXcyrih5Ao29UXk6S5FHs3RkVisJXXrZ+wEu7
         Ny29HftzbP6r575bmWVr2w6qNrI3VfAFjw3amPLb45Nxm3Zay6ccNUHGKGi16kTjuJRY
         1oDr0lGsg07Ko5FMlbOa3hsV6nnJ0Vy0aNMs0W5bn4sU9GZsIKUZiKbDjcCCBoVSILV2
         DRDxxnTElGWftK+Fx+IQiY+vXC8AxeEJAgjR+f/kjoaDwkJWU9lGMQu0Y/9HIhnK2lQn
         LXP1YqqcSPfWhwDJLDqyN1BD9fOSkFGbH/f0ZpXL/me1RzW3vEWkpqOsawWVWpwqlbEi
         T6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649102; x=1701253902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xRnJgX5BPvayGYI69im8tUAMArxnMA1xQvESA9sv6s=;
        b=uZGLOCRRRL7PE99nYKmFvlmdb2xiIhpstNoD5p67t5yux+ywpHUmYabRHNx4TM29TU
         uDWo3Foqsr/yAiZuVAqjB9PqoogxpfdzijvWbQcEcLnDVaIh4RvLCUKZykyXzyZ/pUcl
         HPH7rwHpPNeGYRYThh9FhrXDzb6+2afpbx6ZH1YnYu9vGJXHOhTK95SjDXJecZ+LveAJ
         SdkF+TOhhA7o+n+ZTkXfhHL92DHBx6DaLzToJfV17iWeh62idQk9Y6RDf/nGfdB/EnHA
         zOyd0kKlPAlUsh3vPN7gE2mVkYyRKT6wv788S13Dljdd04PJV/RDWSZaXAG7+0ecEtpp
         lToQ==
X-Gm-Message-State: AOJu0YwYwtHxqLF93tD+z3FUDgR2jX5u6neC5uzjKGbc4ZLEmEh/njdp
	QcP5V7YU8gNdSvj540Xm0cOTsrK8XBtUmGh96OUs4nJsyYI=
X-Google-Smtp-Source: AGHT+IFSwZ2tVyIF7zDmPQqBmcY/48fFavbAi8KvvI7Pu2yJI9yCB9NML+rb2KQb1fUHDiV2Gx5j/U7gCxqeKmm5Q0E=
X-Received: by 2002:a05:6870:8a0a:b0:1d5:eb1:c587 with SMTP id
 p10-20020a0568708a0a00b001d50eb1c587mr2457857oaq.19.1700649101745; Wed, 22
 Nov 2023 02:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20231109192814.95977-1-philmd@linaro.org> <20231109192814.95977-11-philmd@linaro.org>
In-Reply-To: <20231109192814.95977-11-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Nov 2023 14:31:29 +0400
Message-ID: <CAJ+F1CKFFU_VEA4nhgWw9RLDgc_gD0h-FPfvSP4LaFC1j4pP6Q@mail.gmail.com>
Subject: Re: [PATCH-for-8.2 v4 10/10] hw/char/pl011: Implement TX FIFO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Maydell <peter.maydell@linaro.org>, 
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6qEMuqcjYQu2

Hi

On Thu, Nov 9, 2023 at 11:30=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> If the UART back-end chardev doesn't drain data as fast as stdout
> does or blocks, buffer in the TX FIFO to try again later.
>
> This avoids having the IO-thread busy waiting on chardev back-ends,
> reported recently when testing the Trusted Reference Stack and
> using the socket backend:
> https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=3D149574
>
> Implement registering a front-end 'watch' callback on back-end
> events, so we can resume transmitting when the back-end is writable
> again, not blocking the main loop.

I do not have access to that Jira issue.

In general, chardev backends should have some buffering already
(socket, files etc).

If we want more, or extra control over buffering, maybe this should be
implemented at the chardev level, rather than each frontend implement
its own extra buffering logic...

Regardless, I think frontends should have an option to "drop" data
when the chardev/buffer is full, rather than hanging.


>
> Similarly to the RX FIFO path, FIFO level selection is not
> implemented (interrupt is triggered when a single byte is available
> in the FIFO).
>
> We only migrate the TX FIFO if it is in use.
>
> Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/char/pl011.c      | 107 ++++++++++++++++++++++++++++++++++++++++---
>  hw/char/trace-events |   4 ++
>  2 files changed, 105 insertions(+), 6 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index f474f56780..a14ece4f07 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -57,6 +57,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Ch=
ardev *chr)
>  /* Data Register, UARTDR */
>  #define DR_BE   (1 << 10)
>
> +/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
> +#define RSR_OE  (1 << 3)
> +
>  /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
>  #define INT_OE (1 << 10)
>  #define INT_BE (1 << 9)
> @@ -156,6 +159,68 @@ static void pl011_reset_tx_fifo(PL011State *s)
>      fifo8_reset(&s->xmit_fifo);
>  }
>
> +static gboolean pl011_drain_tx(PL011State *s)
> +{
> +    trace_pl011_fifo_tx_drain(fifo8_num_used(&s->xmit_fifo));
> +    pl011_reset_tx_fifo(s);
> +    s->rsr &=3D ~RSR_OE;
> +    return G_SOURCE_REMOVE;
> +}
> +
> +static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *op=
aque)
> +{
> +    PL011State *s =3D opaque;
> +    int ret;
> +    const uint8_t *buf;
> +    uint32_t buflen;
> +    uint32_t count;
> +    bool tx_enabled;
> +
> +    tx_enabled =3D (s->cr & CR_UARTEN) && (s->cr & CR_TXE);
> +    if (!tx_enabled) {
> +        /*
> +         * If TX is disabled, nothing to do.
> +         * Keep the potentially used FIFO as is.
> +         */
> +        return G_SOURCE_REMOVE;
> +    }
> +
> +    if (!qemu_chr_fe_backend_connected(&s->chr)) {
> +        /* Instant drain the fifo when there's no back-end */
> +        return pl011_drain_tx(s);
> +    }
> +
> +    count =3D fifo8_num_used(&s->xmit_fifo);
> +    if (count < 1) {
> +        /* FIFO empty */
> +        return G_SOURCE_REMOVE;
> +    }
> +
> +    /* Transmit as much data as we can */
> +    buf =3D fifo8_peek_buf(&s->xmit_fifo, count, &buflen);
> +    ret =3D qemu_chr_fe_write(&s->chr, buf, buflen);
> +    if (ret >=3D 0) {
> +        /* Pop the data we could transmit */
> +        trace_pl011_fifo_tx_xmit(ret);
> +        fifo8_pop_buf(&s->xmit_fifo, ret, NULL);
> +        s->int_level |=3D INT_TX;
> +    }
> +
> +    if (!fifo8_is_empty(&s->xmit_fifo)) {
> +        /* Reschedule another transmission if we couldn't transmit all *=
/
> +        guint r =3D qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
> +                                        pl011_xmit, s);
> +        if (!r) {
> +            /* Error in back-end? */
> +            return pl011_drain_tx(s);
> +        }
> +    }
> +
> +    pl011_update(s);
> +
> +    return G_SOURCE_REMOVE;
> +}
> +
>  static void pl011_write_txdata(PL011State *s, uint8_t data)
>  {
>      if (!(s->cr & CR_UARTEN)) {
> @@ -165,11 +230,25 @@ static void pl011_write_txdata(PL011State *s, uint8=
_t data)
>          qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled T=
X UART\n");
>      }
>
> -    /* XXX this blocks entire thread. Rewrite to use
> -     * qemu_chr_fe_write and background I/O callbacks */
> -    qemu_chr_fe_write_all(&s->chr, &data, 1);
> -    s->int_level |=3D INT_TX;
> -    pl011_update(s);
> +    if (fifo8_is_full(&s->xmit_fifo)) {
> +        /*
> +         * The FIFO contents remain valid because no more data is
> +         * written when the FIFO is full, only the contents of the
> +         * shift register are overwritten. The CPU must now read
> +         * the data, to empty the FIFO.
> +         */
> +        trace_pl011_fifo_tx_overrun();
> +        s->rsr |=3D RSR_OE;
> +        return;
> +    }
> +
> +    trace_pl011_fifo_tx_put(data);
> +    fifo8_push(&s->xmit_fifo, data);
> +    if (fifo8_is_full(&s->xmit_fifo)) {
> +        s->flags |=3D PL011_FLAG_TXFF;
> +    }
> +
> +    pl011_xmit(NULL, G_IO_OUT, s);
>  }
>
>  static uint32_t pl011_read_rxdata(PL011State *s)
> @@ -331,10 +410,21 @@ static void pl011_write(void *opaque, hwaddr offset=
,
>          s->lcr =3D value;
>          pl011_set_read_trigger(s);
>          break;
> -    case 12: /* UARTCR */
> +    case 12: /* UARTCR */ {
> +        uint16_t en_bits =3D s->cr & (CR_UARTEN | CR_TXE | CR_RXE);
> +        uint16_t dis_bits =3D value & (CR_UARTEN | CR_TXE | CR_RXE);
> +        if (en_bits ^ dis_bits && !fifo8_is_empty(&s->xmit_fifo)) {
> +            /*
> +             * If the UART is disabled in the middle of transmission
> +             * or reception, it completes the current character before
> +             * stopping.
> +             */
> +            pl011_xmit(NULL, G_IO_OUT, s);
> +        }
>          /* ??? Need to implement the enable and loopback bits.  */
>          s->cr =3D value;
>          break;
> +    }
>      case 13: /* UARTIFS */
>          s->ifl =3D value;
>          pl011_set_read_trigger(s);
> @@ -477,6 +567,11 @@ static int pl011_post_load(void *opaque, int version=
_id)
>          s->read_pos =3D 0;
>      }
>
> +    if (!fifo8_is_empty(&s->xmit_fifo)) {
> +        /* Reschedule another transmission */
> +        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit, =
s);
> +    }
> +
>      return 0;
>  }
>
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index bc9e84261f..ee00af0c66 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -60,6 +60,10 @@ pl011_write(uint32_t addr, uint32_t value, const char =
*regname) "addr 0x%03x val
>  pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_=
count %d returning %d"
>  pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_coun=
t now %d"
>  pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
> +pl011_fifo_tx_put(uint8_t byte) "TX FIFO push [0x%02x]"
> +pl011_fifo_tx_xmit(int count) "TX FIFO pop %d"
> +pl011_fifo_tx_overrun(void) "TX FIFO overrun"
> +pl011_fifo_tx_drain(unsigned drained) "TX FIFO draining %u"
>  pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ib=
rd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ",=
 fbrd: %" PRIu32 ")"
>
>  # cmsdk-apb-uart.c
> --
> 2.41.0
>
>


--
Marc-Andr=C3=A9 Lureau
