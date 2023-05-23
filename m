Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q3-20020a7bce83000000b003f4fb5532a1sm11937603wmj.43.2023.05.23.07.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:06:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C3CEB1FFBB;
	Tue, 23 May 2023 15:06:34 +0100 (BST)
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-13-philmd@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Peter
 Maydell
 <peter.maydell@linaro.org>, Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH 12/12] hw/char/pl011: Implement TX FIFO
Date: Tue, 23 May 2023 14:47:11 +0100
In-reply-to: <20230522153144.30610-13-philmd@linaro.org>
Message-ID: <874jo33zx1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mSEZzglkZ2l7


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

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
>
> Similarly to the RX FIFO path, FIFO level selection is not
> implemented (interrupt is triggered when a single byte is available
> in the FIFO).
>
> Due to the addition of the TX FIFO in the instance state, increase
> the migration stream version.
>
> Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC because I'm pretty sure I got the migration code wrong.
>
> After writing this I noticed the hw/char/cmsdk-apb-uart.c model
> is much more complete. Instead of copy/pasting its code, I'd rather
> try to extract some generic/bstract "FIFO based chardev" QOM class;
> but this is beyond the scope of this series.
> ---
<snip>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 03c006199e..a957138405 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -57,6 +57,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Ch=
ardev *chr)
>  /* Data Register, UARTDR */
>  #define DR_BE   (1 << 10)
>=20=20
> +/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
> +#define RSR_OE  (1 << 3)
> +
>  /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
>  #define INT_OE (1 << 10)
>  #define INT_BE (1 << 9)
> @@ -152,19 +155,94 @@ static inline void pl011_reset_tx_fifo(PL011State *=
s)
>      /* Reset FIFO flags */
>      s->flags &=3D ~PL011_FLAG_TXFF;
>      s->flags |=3D PL011_FLAG_TXFE;
> +
> +    fifo8_reset(&s->xmit_fifo);
> +}
> +
> +static gboolean pl011_drain_tx(PL011State *s)
> +{
> +    trace_pl011_fifo_tx_drain(fifo8_num_used(&s->xmit_fifo));
> +    pl011_reset_tx_fifo(s);
> +    s->rsr &=3D ~RSR_OE;
> +    return FALSE;

WHY ARE YOU SHOUTING?

> +}
> +

worth a comment the return signals something to the chardev - I guess
FEWatchFunc could do with a comment?

> +static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *op=
aque)
> +{
> +    PL011State *s =3D opaque;
> +    int ret;
> +    const uint8_t *buf;
> +    uint32_t buflen;
> +    uint32_t count;
> +
> +    if (!qemu_chr_fe_backend_connected(&s->chr)) {
> +        /* Instant drain the fifo when there's no back-end */
> +        return pl011_drain_tx(s);
> +    }
> +
> +    count =3D fifo8_num_used(&s->xmit_fifo);
> +    if (!count) {
> +        return FALSE;
> +    }
> +    if  (!(s->cr & CR_UARTEN)) {
> +        /* Allow completing the current FIFO character before stopping. =
*/
> +        count =3D 1;
> +    }

maybe:

  bool tx_enabled =3D s->cr & CR_UARTEN;
  ...
  count =3D tx_enabled ? fifo8_num_used(&s->xmit_fifo) : 1; /* current only=
 */

  if (count) {

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
> +    if ((s->cr & CR_UARTEN) && !fifo8_is_empty(&s->xmit_fifo)) {

 tx_enabled && ...

> +        /* Reschedule another transmission if we couldn't transmit all */
> +        guint r =3D qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
> +                                        pl011_xmit, s);
> +        if (!r) {
> +            return pl011_drain_tx(s);
> +        }
> +    }
> +
> +    pl011_update(s);

}

> +
> +    return FALSE;
>  }
>=20=20
>  static void pl011_write_tx(PL011State *s, const uint8_t *buf, int length)
>  {
>      if (!(s->cr & (CR_UARTEN | CR_TXE))) {
> +        if (!fifo8_is_empty(&s->xmit_fifo)) {
> +            /*
> +             * If the UART is disabled in the middle of transmission
> +             * or reception, it completes the current character before
> +             * stopping.
> +             */
> +            pl011_xmit(NULL, G_IO_OUT, s);
> +        }
>          return;
>      }
>=20=20
> -    /* XXX this blocks entire thread. Rewrite to use
> -     * qemu_chr_fe_write and background I/O callbacks */
> -    qemu_chr_fe_write_all(&s->chr, buf, 1);
> -    s->int_level |=3D INT_TX;
> -    pl011_update(s);
> +    if (length > fifo8_num_free(&s->xmit_fifo)) {
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
> +    trace_pl011_fifo_tx_put(length);
> +    fifo8_push_all(&s->xmit_fifo, buf, length);
> +
> +    pl011_xmit(NULL, G_IO_OUT, s);
>  }
>=20=20
>  static uint64_t pl011_read(void *opaque, hwaddr offset,
> @@ -444,12 +522,17 @@ static int pl011_post_load(void *opaque, int versio=
n_id)
>          s->read_pos =3D 0;
>      }
>=20=20
> +    if (version_id >=3D 3 && !fifo8_is_empty(&s->xmit_fifo)) {
> +        /* Reschedule another transmission */
> +        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit, =
s);
> +    }
> +
>      return 0;
>  }
>=20=20
>  static const VMStateDescription vmstate_pl011 =3D {
>      .name =3D "pl011",
> -    .version_id =3D 2,
> +    .version_id =3D 3,
>      .minimum_version_id =3D 2,
>      .post_load =3D pl011_post_load,
>      .fields =3D (VMStateField[]) {
> @@ -462,6 +545,7 @@ static const VMStateDescription vmstate_pl011 =3D {
>          VMSTATE_UINT32(int_enabled, PL011State),
>          VMSTATE_UINT32(int_level, PL011State),
>          VMSTATE_UINT32_ARRAY(read_fifo, PL011State, PL011_FIFO_DEPTH),
> +        VMSTATE_FIFO8(xmit_fifo, PL011State),

I think you want something like:

   VMSTATE_FIFO8_TEST(xmit_fifo, PL011State, pl011_is_version_3_or_better),

>          VMSTATE_UINT32(ilpr, PL011State),
>          VMSTATE_UINT32(ibrd, PL011State),
>          VMSTATE_UINT32(fbrd, PL011State),
> @@ -505,10 +589,18 @@ static void pl011_realize(DeviceState *dev, Error *=
*errp)
>  {
>      PL011State *s =3D PL011(dev);
>=20=20
> +    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
>      qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
>                               pl011_event, NULL, s, NULL, true);
>  }
>=20=20
> +static void pl011_unrealize(DeviceState *dev)
> +{
> +    PL011State *s =3D PL011(dev);
> +
> +    fifo8_destroy(&s->xmit_fifo);
> +}
> +
>  static void pl011_reset(DeviceState *dev)
>  {
>      PL011State *s =3D PL011(dev);
> @@ -534,6 +626,7 @@ static void pl011_class_init(ObjectClass *oc, void *d=
ata)
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>=20=20
>      dc->realize =3D pl011_realize;
> +    dc->unrealize =3D pl011_unrealize;
>      dc->reset =3D pl011_reset;
>      dc->vmsd =3D &vmstate_pl011;
>      device_class_set_props(dc, pl011_properties);
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 9fd40e3aae..4c25564066 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -60,6 +60,10 @@ pl011_write(uint32_t addr, uint32_t value, const char =
*regname) "addr 0x%03x val
>  pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_=
count %d returning %d"
>  pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_coun=
t now %d"
>  pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
> +pl011_fifo_tx_put(int count) "TX FIFO push %d"
> +pl011_fifo_tx_xmit(int count) "TX FIFO pop %d"
> +pl011_fifo_tx_overrun(void) "TX FIFO overrun"
> +pl011_fifo_tx_drain(unsigned drained) "TX FIFO draining %u"
>  pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ib=
rd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ",=
 fbrd: %" PRIu32 ")"
>=20=20
>  # cmsdk-apb-uart.c


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
