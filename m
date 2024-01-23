Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp467623ejc;
        Tue, 23 Jan 2024 09:35:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnn5LwMkq5gkYNisv/MEt7TDQ9exzoQxOBMoQWgK+OqCyR3CTY7eFawtV1x19vyQmYE/4y
X-Received: by 2002:a05:6214:1c09:b0:685:236a:c883 with SMTP id u9-20020a0562141c0900b00685236ac883mr1377098qvc.22.1706031341881;
        Tue, 23 Jan 2024 09:35:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706031341; cv=none;
        d=google.com; s=arc-20160816;
        b=PwY2FvI6LJ1XHLp2z4k7zFu3diKDGvTdQYIGQo0Hz4i9x6Lkhzv6TPHzag22Y3W1yi
         BOM9rkto97BtPg6s7iMo4y9qWbl7eQiezinVVfjbxkY9ZAfUaI3r9eRTxAVtfN82Kx2c
         GFSWCxLS3t3uOmh5VNOowldHg31ubEWTA7s+kW5dEPPrTLPxPo6gMaqFKzMf3+58/CT3
         noedXhnWD4L2fvsI0Eh7B4mQ5aQ10KJhGC/w7oF1IhO8x7kK9HimuvZ1rObiB/MqR+M1
         R9AeXqqKKeXecf1EoenfE0hUxkBxvnokZ5Jx1WbLpfsCeTe9kuOVKqEugFNBwQtxeosC
         SLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=paIsa4xyA7FzF8RxzgnnwI2DhQRer0e6faRBj+BRK1s=;
        fh=1IiNQ7hkkOGfrkc/eyoP4DLgzj+V841bm6RLp7ScrEo=;
        b=XLM9tIuGMFT8BJc8WvFLBIXStWOxCr6sLwft+H+58/E1o9VkmoGAB02xAM+fJudwz0
         q9vJ3SstLriDoyrQWEmRulb0Y8+HDczxHqrs4+3wklt/hT/0zEPxnG0ioGRm0d0ziPOz
         Oj/nTzX4DxQeTkn9woWO3AFvlQqdeoXGRB5ePnxD007DPHhW3B6MoknVpmRNDbHUAqpA
         Y+4f5c/T+PGDsmFCE5FkctEG8e2+Y+lKdhSGQWeykb/Iy8OWQjcQvn8ObYZkLN2QwSPI
         PmToRr92kqN5WIL59XjSEwCs1tRZz6opEIZ8I8SNHtw9HCCTs9sgr41feg0ae4k8JBwK
         N9Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCKIwYfW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020a0ce48f000000b0067f8e283472si8437096qvl.491.2024.01.23.09.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 09:35:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCKIwYfW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSKgF-00008Q-05; Tue, 23 Jan 2024 12:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSKgB-0008V3-Tf
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 12:35:20 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSKg9-0006UB-DQ
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 12:35:19 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cdeb80fdfdso51925851fa.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 09:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706031314; x=1706636114; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=paIsa4xyA7FzF8RxzgnnwI2DhQRer0e6faRBj+BRK1s=;
 b=lCKIwYfWz18Ie5P8xvs5sYGV36U78bZXwjcYpPVidWZY9ilQKicGqsSDA6rwjteO9V
 FLfsedYzEwexSaiB4ToJ+IfqfIQdYAOwv209VELjSutJHU4TLDmNzSLN7JT9z1EXSiL9
 m8OSijYxN1RAHYjAZTVzD65gjhYDkQ4isk1/04zf0f2B1nzo6z+p8KCjMIOtl8YrZwXS
 OmNL/F43kSP4C9it1o7ygqcG+Cj67EHqsBVBrALT/MHObISyS89pbLi+PwYJLEdbib4Y
 xf1RhDIv4x2p9ABnhsPEob6Rg7ajav3hfEqnVdeeWiyfppnrOu81gOJbQMzDVKrBv3DG
 C3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706031314; x=1706636114;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=paIsa4xyA7FzF8RxzgnnwI2DhQRer0e6faRBj+BRK1s=;
 b=jDm/MlWZpSMLL4gfX4Z8MdN4YUNYpGHxOaJG590AV0JJA9zAXxlTagd3dbVyJToEaM
 2xxOYzj3wtwK4dhmKu5xcZ8MDLVZnMt8EWTZIq0mQYNQUxHZfPMHcZPsCcFgROFWeC+K
 0nbF8dALa7JgKAwmJZomasrqsFHnHC7L7EXgdtCblQUEG9SkU2tk6WZcNpto4c5j+atA
 xzTFyK1zE7/uzNfnXHhz5Z7cfp8exV7k8R3RKrr8wdaMoZmZP99m+Lu3tBJyb81VC93g
 R7akCuUmmpkNGG/xPUDn+bkG3u2yOByVMPWfXtaiLfY2hDYj7PtLc/7n4WU/tSMNujRP
 gw+g==
X-Gm-Message-State: AOJu0Yy0oYrEhzfZyHhMvMnqZvbwjtn4GuJlSoqfEv62GmTCpDY/fmK4
 aKdYuCF2w+asOtT6F2CquQWe6hggXk/4YowrH6pzQP8taruy7CiUdUFyZlLFxfWpoC20wJAyF2t
 AUmezd3h1lm8LKAIcmogtSgYPVkbc5Kx83y8a+Q==
X-Received: by 2002:a2e:9bc4:0:b0:2cc:6f7f:6ba4 with SMTP id
 w4-20020a2e9bc4000000b002cc6f7f6ba4mr49199ljj.199.1706031314210; Tue, 23 Jan
 2024 09:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20240118074749.2299959-1-rayhan.faizel@gmail.com>
In-Reply-To: <20240118074749.2299959-1-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2024 17:35:03 +0000
Message-ID: <CAFEAcA9xYiTWU1Nk2_G8gAbC=spQZDFbQazEeVWJYKJu=PFs2Q@mail.gmail.com>
Subject: Re: [PATCH v3] hw/char/imx_serial: Implement receive FIFO and ageing
 timer for imx serial.
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cPkpbDVZrDMS

On Thu, 18 Jan 2024 at 07:49, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> This patch implements a 32 half word FIFO as per imx serial device
> specifications. If a non empty FIFO is below the trigger level, an ageing
> timer will tick for a duration of 8 characters. On expiry, AGTIM will be set
> triggering an interrupt. AGTIM timer resets when there is activity in
> the receive FIFO.
>
> Otherwise, RRDY is set when trigger level is
> exceeded. The receive trigger level is 8 in newer kernel versions and 1 in
> older ones.
>
> This change will break migration compatibility.
>
> [Changes in v3]
>
> - Caught more whitespace changes that went overlooked
> - Moved fifo and timer initialization to realize
>
> [Changes in v2]
>
> As per Peter Maydell's suggestions,
>
> - Use generic FIFO32 implementation in place of handmade impl.
> - Moved timer_init to serial init and use timer_del in reset
> - Removed stray whitespaces
> - Increment VMSTATE version
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>  hw/char/imx_serial.c         | 97 +++++++++++++++++++++++++++++++-----
>  include/hw/char/imx_serial.h | 18 ++++++-
>  2 files changed, 102 insertions(+), 13 deletions(-)

Thanks; this looks good and was easy to review.
I have a couple of comments about corner cases of the device
behaviour and a few final coding style nits, and that's all.

> +static void imx_serial_rx_fifo_push(IMXSerialState *s, uint32_t value)
> +{
> +    if (fifo32_is_full(&s->rx_fifo)) {
> +        /* Discard lost character on overflow */
> +        fifo32_pop(&s->rx_fifo);

Is this the right behaviour on rx overflow? The imx6 TRM
I have says the behaviour is:

 * when we put the 32nd character into the RX FIFO
   (i.e. the last one which will fit) then we we need
   to arrange that when it is read it has the
   URXD.OVRRUN and URXD.ERR bits associated with it,
   which we can achieve by ORing them in before we push
   the char into the FIFO here
 * when the 33rd character arrives, we set USR2.ORE and
   discard this 33rd character (i.e. never put it in the fifo)

> +    }
> +    fifo32_push(&s->rx_fifo, value);
> +}
> +
> +static uint32_t imx_serial_rx_fifo_pop(IMXSerialState *s)
> +{
> +    if (fifo32_is_empty(&s->rx_fifo)) {
> +        return URXD_ERR;

Similarly, I don't think this is how the UART signals that
you just tried to read from an empty FIFO either. My reading
of the TRM is that if there's data in the FIFO you get it
in the low 8 bits, and CHARRDY is set in bit 15. If the
FIFO is empty and the guest tries to read it then it gets
a word with CHARRDY clear and the other bits don't have
valid data (an entirely 0 word would do). The ERR bit is
only set for the OVRRUN/FRMERR/BRK/PRERR cases.

> +    }
> +    return fifo32_pop(&s->rx_fifo);
> +}
> +
> +static void imx_serial_rx_fifo_ageing_timer_int(void *opaque)
> +{
> +    IMXSerialState *s = (IMXSerialState *) opaque;
> +    s->usr1 |= USR1_AGTIM;
> +
> +    imx_update(s);
> +}
> +
> +static void imx_serial_rx_fifo_ageing_timer_restart(void *opaque)
> +{
> +    /*
> +     * Ageing timer starts ticking when
> +     * RX FIFO is non empty and below trigger level.
> +     * Timer is reset if new character is received or
> +     * a FIFO read occurs.
> +     * Timer triggers an interrupt when duration of
> +     * 8 characters has passed ( assuming 115200 baudrate ).

We don't need the spaces after ( and before ) here.

> +     */
> +    IMXSerialState *s = (IMXSerialState *) opaque;
> +    uint8_t rxtl = s->ufcr & TL_MASK;
> +    int rx_used = fifo32_num_used(&s->rx_fifo);
> +
> +    if (rx_used > 0 && rx_used < rxtl) {

Rather than checking rx_used against rxtl, can we do what the
datasheet says and check against "is USR1.RRDY == 0" ?

> +        timer_mod_ns(&s->ageing_timer,
> +            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + AGE_DURATION_NS);
> +    } else {
> +        timer_del(&s->ageing_timer);
> +    }
> +}
> +
>  static void imx_serial_reset(IMXSerialState *s)
>  {

> @@ -345,6 +414,10 @@ static void imx_serial_realize(DeviceState *dev, Error **errp)
>  {
>      IMXSerialState *s = IMX_SERIAL(dev);
>
> +    fifo32_create(&s->rx_fifo, FIFO_SIZE);
> +    timer_init_ns(&s->ageing_timer, QEMU_CLOCK_VIRTUAL,
> +        imx_serial_rx_fifo_ageing_timer_int, s);

Generally for indent on function calls we make the second line
line up with the first character after the '(' on the preceding line.

> +
>      DPRINTF("char dev for uart: %p\n", qemu_chr_fe_get_driver(&s->chr));
>
>      qemu_chr_fe_set_handlers(&s->chr, imx_can_receive, imx_receive,
> diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
> index b823f94519..b5f714add1 100644
> --- a/include/hw/char/imx_serial.h
> +++ b/include/hw/char/imx_serial.h
> @@ -21,10 +21,13 @@
>  #include "hw/sysbus.h"
>  #include "chardev/char-fe.h"
>  #include "qom/object.h"
> +#include "qemu/fifo32.h"
>
>  #define TYPE_IMX_SERIAL "imx.serial"
>  OBJECT_DECLARE_SIMPLE_TYPE(IMXSerialState, IMX_SERIAL)
>
> +#define FIFO_SIZE       32
> +
>  #define URXD_CHARRDY    (1<<15)   /* character read is valid */
>  #define URXD_ERR        (1<<14)   /* Character has error */
>  #define URXD_FRMERR     (1<<12)   /* Character has frame error */
> @@ -65,6 +68,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(IMXSerialState, IMX_SERIAL)
>  #define UCR1_TXMPTYEN   (1<<6)    /* Tx Empty Interrupt Enable */
>  #define UCR1_UARTEN     (1<<0)    /* UART Enable */
>
> +#define UCR2_ATEN       BIT(3)    /* Ageing Timer Enable */

Can you define this as (1<<3), for consistency with how all
the other defines in this file are written, please?

>  #define UCR2_TXEN       (1<<2)    /* Transmitter enable */
>  #define UCR2_RXEN       (1<<1)    /* Receiver enable */
>  #define UCR2_SRST       (1<<0)    /* Reset complete */

thanks
-- PMM
