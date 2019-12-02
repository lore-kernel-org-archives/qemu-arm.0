Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp74354lfc;
        Mon, 2 Dec 2019 07:24:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqylK1/TVi/GFzgPd9HTnE4dsLe3UMWVHoJ9opZRx87NteyWKUeRThdSTHDrfTJSUQ4A90XW
X-Received: by 2002:a0c:8c0e:: with SMTP id n14mr33252515qvb.179.1575300297048;
        Mon, 02 Dec 2019 07:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575300297; cv=none;
        d=google.com; s=arc-20160816;
        b=z+1qymxYav3wTyC9F1o9FH6tyBQ3+idfs5POE2276KpcYtbFw/8RBnN4tTaUsnPO8q
         8dnQcILlnyUkAJw7pF/Qi/rjZ8wLrjUfXRWHwt3jHWUtUg0qkkGFpzCZSI0rziNqfbUz
         JQH+5vQN6zejwFyfwLYUqpJ9CmUEp4LP6q3YerRgYFMD/Edz2VODi9T3YP+yA7f6v3WG
         bbrXfln1281vXG3aSqEhHOjul+T3ugCCfEUaqlCZMG8+Ctd/4md/JWPdyOlQ7bDcLUTb
         znPpKowfA242jo/3EAKUorliT+KZ9hGGwR41mnCDSilMAQlG7RwHFDI2C2n1srjEbvfr
         TQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJOBjADfA+ccFaGnSH39XSvCu6Wstd7Jkr8Gx+Uryd8=;
        b=Lopv0M8mPQw0ML+I8qq/bypjq7hEL4sx3G3ga7jFDIfnS1PVWalznuMWQ5HikKdlaJ
         b2wXmfrDNAUot35qB3InLSaCu2AiW0fBwAmqrs+iCFIql54j/d3ADGIuf+rKCEavZy9c
         rZ0efR1S/9G1wFn4AE78Gyr2fWH9M40AGe8/ZqYB8TkYkJd8SJ3bg/ae1vdsm9GRdpxz
         oSNDczhhJjyGCdv69t5vgV7l3spBQcHobYcOCI71HnBD5UUh3dve+L95SQ59bNTooiMN
         EKgpzsdTZGl/VKTMRPEfr4urTrk3r4LveyT97wxo+t4r9aEL8qdFaHUv/6L6hUH87XRi
         9iyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r9S8ttlO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30si20740274qtj.170.2019.12.02.07.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 07:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r9S8ttlO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibnZI-0004Rt-GR
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 10:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibnZA-0004RV-Pj
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibnZ8-0000w3-MZ
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:24:47 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:41965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibnZ8-0000vJ-H2
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:24:46 -0500
Received: by mail-io1-xd41.google.com with SMTP id z26so37454586iot.8
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QJOBjADfA+ccFaGnSH39XSvCu6Wstd7Jkr8Gx+Uryd8=;
 b=r9S8ttlOFu9FrNkNhafD22Ym2jqdHI7GqFoRxy0httgyf4nbuWCsksV0WtiKhZIjYx
 lB0mvqEv45ErC5LUI8zxMIEoyUtlQVXsnHmM4ZzkvnWjxefcvBshyWgNeK/B0z6FLbac
 fwtuAFo0TzHl81W54r+NjN/0G/2eLYMRxNZUDwqPGwnIBuP+TNxJXHEcA06kmXPBuvqJ
 P72NT+mFSDwBRctmy0+ZxYWSf76qdaNyOEGvFNXxMyiWz69iNpBXcnmqjbT2jp8AiplM
 8fLaaWCqpbsl5u8ELyCVzGOfTdbPopLw/SnVnezQ5CVd1gqMzqbs7VxcXqD1RwFbvI/U
 nvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QJOBjADfA+ccFaGnSH39XSvCu6Wstd7Jkr8Gx+Uryd8=;
 b=VX+YDKwRdf7h/eH80xbWAfLLPdqpkhY1LV+1WzvVZk+s525aZpuIwy5Ijo05gETHuc
 ugJhmXHnOeELtMJoMU/ydfkVTtG/7NcBv30gBxU2QZrdrZot9qkfZgZR1WrWFdzoI3PR
 cEutWhPCMiI5u1bqQU9OBFeKcS7gbZKRFBQ6hRwLpyBw6W/3g3vVXwZppOekHtJg7ipK
 zgirDkoe2ak3e2XCE4r2RcPOHcII0On/wm+x+ecfZgZZo4TVFCoomtDesQryc1bghBEw
 pLnfyJPyM06BK2aRLZYmJPxI4bKi9HXdqmiJKfP5B2sbuqlXOAYOQY+FGIV10KcEjSwV
 YEmg==
X-Gm-Message-State: APjAAAUmM10OidqD0hOL0B3PHMAb+k/on4vovAo88n0fo8tdk2hT+5bY
 It2w6A9FBSjdGeMSgjZeIneLXmvk4jkx1n8aN2LzXw==
X-Received: by 2002:a5e:920a:: with SMTP id y10mr12339198iop.292.1575300285908; 
 Mon, 02 Dec 2019 07:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-9-damien.hedde@greensocs.com>
In-Reply-To: <20190904125531.27545-9-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 15:24:34 +0000
Message-ID: <CAFEAcA8=7yhQR4Gw2OYmiF0cFJDaVn2hnUrfnZGFJK6wyuB97Q@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] hw/char/cadence_uart: add clock support
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33dbIGBwkZhF

On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
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

>  static void uart_parameters_setup(CadenceUARTState *s)
>  {
>      QEMUSerialSetParams ssp;
> -    unsigned int baud_rate, packet_size;
> +    unsigned int baud_rate, packet_size, input_clk;
> +    input_clk = clock_get_frequency(s->refclk);
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

Any ideas what might be better? :-)

> +        ssp.speed = 1;
> +    }
>      s->char_tx_time = (NANOSECONDS_PER_SECOND / ssp.speed) * packet_size;
>      qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
>  }

thanks
-- PMM
