Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3649422lfg;
        Wed, 26 Feb 2020 15:02:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgKMYJVn82AASIMT1ph1vXvQHKCE4IsAMEw+Ik85NhG2yeFqbHEQ0i+SmCcKF15TpApTuk
X-Received: by 2002:ae9:d887:: with SMTP id u129mr1824193qkf.357.1582758157073;
        Wed, 26 Feb 2020 15:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582758157; cv=none;
        d=google.com; s=arc-20160816;
        b=x9Hrdn9CVXAgjIfjnO7OZ/1QvUPCXxD8M/GGkH0U513YL9B5Fy2UjgUSvbHzt0rISe
         bLjkpY/Zrt92Iki1+pvZ3RmtKJGmEBOaPul9zME4n5eSJnfPDx8ZahEPN2Kl01VTybeD
         4jchvxc+rvGAQvurka7VS58FbhNQ9fJBDlfmHK7O9uhpsCnNSVINM6UiKQzmNJ6bs//4
         aixWZ9AlGQhFSETbV2S65hevSx4Gjm1hjXuty97Orjm3myOSbSiU/VNSOD+6vcS0irvk
         2J1fOT8skwaRFcrWdHc12Oc0oW0ZGMQw+i0MzUOqv5vI3sOkJMlXLp2bUMHCGQVtcXtX
         8Vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lfiKTlyeXxLsn+X1WSKAxytELJiz7Eeecnonufgqrq8=;
        b=paT68u8+OKDqoDHwY3QAGVrZRi+ZlQv3/xsmNaRX5XoPdpwoSMCcKjf0HE50qeUTW6
         BDI8K438841EMaJWzrwGGwTysh6/TtcI+vtWGwIHIF8QbgHXg4CNi/Cphw23QppatxHa
         65pV33rmK1stwdcxq2OgSdaYqyGkqQTUWCF4snuboxzJ6lUDtzYRgHaZQ2LvJ6wMvt1b
         BmCq/BbhXln2R87mQj+dINBnjh3dSocI174aoJvB6/TuEh1GpdgJOfMfWF5Mo3SclXvY
         0iA+oPk+P+ri/z8G16lXWtuE14941BF2DYWEaqjISNECBtnCKJ/Z6gY0I2KG1bp570PE
         qNrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m7I0bnUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j194si509764qke.294.2020.02.26.15.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 15:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m7I0bnUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j75hM-00061C-FI
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 18:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j75hB-0005yC-T5
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 18:02:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j75hA-000361-9s
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 18:02:25 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:37026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j75h6-0002pd-Dj; Wed, 26 Feb 2020 18:02:20 -0500
Received: by mail-lj1-x241.google.com with SMTP id q23so1059188ljm.4;
 Wed, 26 Feb 2020 15:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lfiKTlyeXxLsn+X1WSKAxytELJiz7Eeecnonufgqrq8=;
 b=m7I0bnUB48Bw+SXm7+TyHw8VYsyj7bFOCkazgQJytqJNTjvRbYdK3aJm7JDCWMUCP3
 Hlqg7C/tnNab4h1mF0RS6m5Y5p/Wo9q+fk52Leq3j+QXUF1P49sTlB28erpsigTSd2AJ
 yaKu9gK+yKwT4C0KkbxZsZpAxmoH+E/RnBpBeeamq8kXNbCWbGK/Zdu/QSPlOf5HIkIy
 w6qEtYq7q5ViW9ebslfmgNeFHFVCMUiN6J70/rmkd5kAex4xrMRKooUCNztRjgLEYZIr
 Ys08XHRX6N4HJMzHacr+IpaqDEXr9bROyVqxULK0yBIUQdQmOs7ktmhwdc0wao1LE5KP
 0enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfiKTlyeXxLsn+X1WSKAxytELJiz7Eeecnonufgqrq8=;
 b=s0HdNy6ge4rXTDgDOlhCdjJV5D7EYdWjRRQBN1IHHIAnUEI8+qketw4QtAOX9YO7iM
 4zAYcbcdrnRaXBB0Hkn74XiymEPOODoPtqQ6Wn8K5RjmOIYmHv7WJgpZRx0zHH2QpGn9
 4UIgHuZUCa7O4+UqCCtAfyM1HHAfJt5ej7chdAgh6keYkcuiAbkErcxqiwDTlUgXc5Et
 ecs4y5bVcLoSGZ+M5uuURwIWHfk35USpNbb0JAkUs9K/Pssif2aiZbWJlcQoAbUPDDzk
 AzjtP5+KhlIwZlUtaBhyLXXSjcAJF41+/fuVZCnjrq2GJ+IozUkjRBFNfRFy62yIICD8
 NykA==
X-Gm-Message-State: ANhLgQ0HITkeFW+/LQxdnR51gG0KllHbG5PdsmtTSUKqTVMe9Rr+bb5P
 x2eCvltNn32cl1XVQndlPDH9pi5qjfNS/E0uXTo=
X-Received: by 2002:a2e:544:: with SMTP id 65mr838621ljf.76.1582758138829;
 Wed, 26 Feb 2020 15:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20200225131422.53368-1-damien.hedde@greensocs.com>
 <20200225131422.53368-8-damien.hedde@greensocs.com>
In-Reply-To: <20200225131422.53368-8-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Feb 2020 14:54:41 -0800
Message-ID: <CAKmqyKMczNPHVqZdQXW1B7+Rrs-+eeWMjqpEjY_mUF+Bfa3BjA@mail.gmail.com>
Subject: Re: [PATCH v8 7/9] hw/char/cadence_uart: add clock support
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2XPGEabCujMA

On Tue, Feb 25, 2020 at 5:31 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Switch the cadence uart to multi-phase reset and add the
> reference clock input.
>
> The input clock frequency is added to the migration structure.
>
> The reference clock controls the baudrate generation. If it disabled,
> any input characters and events are ignored.
>
> If this clock remains unconnected, the uart behaves as before
> (it default to a 50MHz ref clock).
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> v7:
>  + update ClockIn/ClockOut types
>  + update due to resettable changes
>  + use a versioned field instead subsection in vmstate
> ---
>  include/hw/char/cadence_uart.h |  1 +
>  hw/char/cadence_uart.c         | 73 +++++++++++++++++++++++++++++-----
>  hw/char/trace-events           |  3 ++
>  3 files changed, 67 insertions(+), 10 deletions(-)
>
> diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
> index 47cec956c4..2a179a572f 100644
> --- a/include/hw/char/cadence_uart.h
> +++ b/include/hw/char/cadence_uart.h
> @@ -49,6 +49,7 @@ typedef struct {
>      CharBackend chr;
>      qemu_irq irq;
>      QEMUTimer *fifo_trigger_handle;
> +    Clock *refclk;
>  } CadenceUARTState;
>
>  static inline DeviceState *cadence_uart_create(hwaddr addr,
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 22e47972f1..e196906c92 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -31,6 +31,8 @@
>  #include "qemu/module.h"
>  #include "hw/char/cadence_uart.h"
>  #include "hw/irq.h"
> +#include "hw/qdev-clock.h"
> +#include "trace.h"
>
>  #ifdef CADENCE_UART_ERR_DEBUG
>  #define DB_PRINT(...) do { \
> @@ -97,7 +99,7 @@
>  #define LOCAL_LOOPBACK         (0x2 << UART_MR_CHMODE_SH)
>  #define REMOTE_LOOPBACK        (0x3 << UART_MR_CHMODE_SH)
>
> -#define UART_INPUT_CLK         50000000
> +#define UART_DEFAULT_REF_CLK (50 * 1000 * 1000)
>
>  #define R_CR       (0x00/4)
>  #define R_MR       (0x04/4)
> @@ -171,12 +173,15 @@ static void uart_send_breaks(CadenceUARTState *s)
>  static void uart_parameters_setup(CadenceUARTState *s)
>  {
>      QEMUSerialSetParams ssp;
> -    unsigned int baud_rate, packet_size;
> +    unsigned int baud_rate, packet_size, input_clk;
> +    input_clk = clock_get_hz(s->refclk);
>
> -    baud_rate = (s->r[R_MR] & UART_MR_CLKS) ?
> -            UART_INPUT_CLK / 8 : UART_INPUT_CLK;
> +    baud_rate = (s->r[R_MR] & UART_MR_CLKS) ? input_clk / 8 : input_clk;
> +    baud_rate /= (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
> +    trace_cadence_uart_baudrate(baud_rate);
> +
> +    ssp.speed = baud_rate;
>
> -    ssp.speed = baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
>      packet_size = 1;
>
>      switch (s->r[R_MR] & UART_MR_PAR) {
> @@ -215,6 +220,13 @@ static void uart_parameters_setup(CadenceUARTState *s)
>      }
>
>      packet_size += ssp.data_bits + ssp.stop_bits;
> +    if (ssp.speed == 0) {
> +        /*
> +         * Avoid division-by-zero below.
> +         * TODO: find something better
> +         */
> +        ssp.speed = 1;
> +    }
>      s->char_tx_time = (NANOSECONDS_PER_SECOND / ssp.speed) * packet_size;
>      qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
>  }
> @@ -340,6 +352,11 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
>      CadenceUARTState *s = opaque;
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return;
> +    }
> +
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          uart_write_rx_fifo(opaque, buf, size);
>      }
> @@ -353,6 +370,11 @@ static void uart_event(void *opaque, QEMUChrEvent event)
>      CadenceUARTState *s = opaque;
>      uint8_t buf = '\0';
>
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return;
> +    }
> +
>      if (event == CHR_EVENT_BREAK) {
>          uart_write_rx_fifo(opaque, &buf, 1);
>      }
> @@ -462,9 +484,9 @@ static const MemoryRegionOps uart_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -static void cadence_uart_reset(DeviceState *dev)
> +static void cadence_uart_reset_init(Object *obj, ResetType type)
>  {
> -    CadenceUARTState *s = CADENCE_UART(dev);
> +    CadenceUARTState *s = CADENCE_UART(obj);
>
>      s->r[R_CR] = 0x00000128;
>      s->r[R_IMR] = 0;
> @@ -473,6 +495,11 @@ static void cadence_uart_reset(DeviceState *dev)
>      s->r[R_BRGR] = 0x0000028B;
>      s->r[R_BDIV] = 0x0000000F;
>      s->r[R_TTRIG] = 0x00000020;
> +}
> +
> +static void cadence_uart_reset_hold(Object *obj)
> +{
> +    CadenceUARTState *s = CADENCE_UART(obj);
>
>      uart_rx_reset(s);
>      uart_tx_reset(s);
> @@ -491,6 +518,14 @@ static void cadence_uart_realize(DeviceState *dev, Error **errp)
>                               uart_event, NULL, s, NULL, true);
>  }
>
> +static void cadence_uart_refclk_update(void *opaque)
> +{
> +    CadenceUARTState *s = opaque;
> +
> +    /* recompute uart's speed on clock change */
> +    uart_parameters_setup(s);
> +}
> +
>  static void cadence_uart_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -500,9 +535,23 @@ static void cadence_uart_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
>
> +    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk",
> +            cadence_uart_refclk_update, s);
> +    /* initialize the frequency in case the clock remains unconnected */
> +    clock_set_hz(s->refclk, UART_DEFAULT_REF_CLK);
> +
>      s->char_tx_time = (NANOSECONDS_PER_SECOND / 9600) * 10;
>  }
>
> +static int cadence_uart_pre_load(void *opaque)
> +{
> +    CadenceUARTState *s = opaque;
> +
> +    /* the frequency will be overriden if the refclk field is present */
> +    clock_set_hz(s->refclk, UART_DEFAULT_REF_CLK);
> +    return 0;
> +}
> +
>  static int cadence_uart_post_load(void *opaque, int version_id)
>  {
>      CadenceUARTState *s = opaque;
> @@ -521,8 +570,9 @@ static int cadence_uart_post_load(void *opaque, int version_id)
>
>  static const VMStateDescription vmstate_cadence_uart = {
>      .name = "cadence_uart",
> -    .version_id = 2,
> +    .version_id = 3,
>      .minimum_version_id = 2,
> +    .pre_load = cadence_uart_pre_load,
>      .post_load = cadence_uart_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(r, CadenceUARTState, CADENCE_UART_R_MAX),
> @@ -534,8 +584,9 @@ static const VMStateDescription vmstate_cadence_uart = {
>          VMSTATE_UINT32(tx_count, CadenceUARTState),
>          VMSTATE_UINT32(rx_wpos, CadenceUARTState),
>          VMSTATE_TIMER_PTR(fifo_trigger_handle, CadenceUARTState),
> +        VMSTATE_CLOCK_V(refclk, CadenceUARTState, 3),
>          VMSTATE_END_OF_LIST()
> -    }
> +    },
>  };
>
>  static Property cadence_uart_properties[] = {
> @@ -546,10 +597,12 @@ static Property cadence_uart_properties[] = {
>  static void cadence_uart_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>
>      dc->realize = cadence_uart_realize;
>      dc->vmsd = &vmstate_cadence_uart;
> -    dc->reset = cadence_uart_reset;
> +    rc->phases.enter = cadence_uart_reset_init;
> +    rc->phases.hold  = cadence_uart_reset_hold;
>      device_class_set_props(dc, cadence_uart_properties);
>    }
>
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 6f938301d9..d20eafd56f 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -97,3 +97,6 @@ exynos_uart_wo_read(uint32_t channel, const char *name, uint32_t reg) "UART%d: T
>  exynos_uart_rxsize(uint32_t channel, uint32_t size) "UART%d: Rx FIFO size: %d"
>  exynos_uart_channel_error(uint32_t channel) "Wrong UART channel number: %d"
>  exynos_uart_rx_timeout(uint32_t channel, uint32_t stat, uint32_t intsp) "UART%d: Rx timeout stat=0x%x intsp=0x%x"
> +
> +# hw/char/cadence_uart.c
> +cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
> --
> 2.25.1
>
>
