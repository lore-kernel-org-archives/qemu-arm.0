Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp157658wrq;
        Tue, 22 Oct 2019 09:48:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzm3bi38jEd1zIpINzcsVy2lxUnqdrsEoZHfeeZO6+JaeWLJF7x4YxKURSgjJuyR4X8NQDF
X-Received: by 2002:a17:906:6848:: with SMTP id a8mr13554299ejs.306.1571762908977;
        Tue, 22 Oct 2019 09:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571762908; cv=none;
        d=google.com; s=arc-20160816;
        b=0b91JldAVUzAohBpK4PBXyC1sHvQwvLh3LltzmSxcGo9WchstrwNXBTvIAP3qMvMN4
         e0Cg/2RyZ1HVLiVNo+7I/GcvIquajDIlwcMIiaDtfUEosGCssTpmsPzy7fEe6lqhyL16
         kBkPdA0Xth6UyiLFyie0J0bVX3rcr5JS/e4AI4wDjNYYJidfzPC8gM/qVjZ9vU5QgHqX
         nwCsPpzWdfBVlEJSrVOq7MmfCE52wiCHuTWyISCI1vhZmvkh+4xVQYfRJB/mYHrSuHTj
         pQjUc4b0MQRQzfCIBQsrYR9DtDMWWyE0cvc8XFUDTRTtQhyzlkxiMgwwj3o2GqVjE208
         UUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RXMHFBShVmiszzOvNW17FM5H8iVamBoj76040flZLAo=;
        b=LjATcY03mOFnI0Whzm9OxGIaR7qwFGhPUiB23kRBJJGiEKci2ncVT89qSUgGqwagMP
         zgS8CJDCPUDlfB+sG7GlVldybt9+663Ot4ULhI6J+gg+RJLhf7r93EQFFSfpHSwQhqNm
         n4Cgz7jY/MsCiOKr4/oxrTMadhlK3mqIA4ro8TFJgDLTb9Ob6QCDfM+NMUfLKjnTpyza
         yPi5p0vh/7x4iscZCx2k1JxmxmIjmEsxlnaVXNbMzAgdsjsOyESZtYGBYgwkXhqYw/2H
         xPh9BnPGDPGaKyMTS72FNXnEcceMnN+1SMb+DSDH7sJ4I2a+OwEMfOeKUnmhB92QUoD4
         9C2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMctjm9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si10779887ejb.182.2019.10.22.09.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMctjm9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxKd-00035F-EV
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMx4o-0001NO-Jj
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMx4n-00039x-8k
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:32:06 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:41726)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMx4n-00039i-3g
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:32:05 -0400
Received: by mail-il1-x142.google.com with SMTP id z10so16028239ilo.8
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RXMHFBShVmiszzOvNW17FM5H8iVamBoj76040flZLAo=;
 b=oMctjm9SIIbHaWX55nm4tLFuSOKeqkHVaA54WQWXrI/vaVBeFyzHudjnV0IwNGFCUa
 EG9sTJ5877Qnw8xFrJjTp6bY810f2cyAP1gLKCzoBpyKZulbye31KRKcbEenNRh0loWI
 cKXFdxRpeIdhZAWAspB+tRJhkYu9FOhZXs61nMJS7S0ePH0Us/RLggmlaTvPIQONKZBk
 lJNx04Su8OtYbdBwnLB72V5TzvNPPSc1+V907fbuAScShyoh1UV+M7nuOoRkYj0JBGxP
 9a7bnZvS4F65KxPCGLy7/jC1DvPoRwwEutMusYZcZiOePJYOS19vbPJTq3XVeXaxCHB8
 K0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RXMHFBShVmiszzOvNW17FM5H8iVamBoj76040flZLAo=;
 b=idmE/uS1SOCXBG8zkIzA7wg0IO7zlTXZEufcAntkHm3syX4iijs9r8j7bnoQdp12UQ
 cLPuf18bzaYyHBrmZgRRkT5EWUuk8BOftT4KluzsKxTPSA7bZ16jE++P6KHssKNfI27l
 zvUUppzmQZXxM2Pv8lQ6q09uy0Jx5fcvmqkmgHr71rEVXuHQRdNCeBYFt5fcZ/YT4/ei
 jcDM4nTXjGHHdsfZNq2CwNpPHfPIGUh5zhL5rUdlPrQMtJnUtpsNFGkINBwjt1vjrMs4
 wgDosXmyCwKP8INxuMjPPZRPPN64f54uq3bTtoTPHZ0eL628YafL8V9OaszCI+PQ+xg7
 z05g==
X-Gm-Message-State: APjAAAWSO3rSiGkcdlEwmMcBwQBwscls8sPWNgjMpWNExGNdH+hHgaB4
 Zqu4MBq5z9/fxqoMqcJVIT/iK4eJA7SGqCdeot10Tw==
X-Received: by 2002:a92:dac4:: with SMTP id o4mr34780227ilq.137.1571761924033; 
 Tue, 22 Oct 2019 09:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
 <20191022162137.27161-11-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-11-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 17:31:51 +0100
Message-ID: <CAFEAcA-5DkdB-iUHBRONB0SHO6rYmU7ZzdojJd5iZbQdLHswTQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/28] serial: add "base" property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWeOxWRsb81i

On Tue, 22 Oct 2019 at 17:23, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c         | 3 +++
>  include/hw/char/serial.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 0ae52ec60c..4748a2b023 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -990,6 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
>      qdev_connect_gpio_out_named(dev, "serial-irq", 0, irq);
>      qdev_prop_set_uint32(dev, "baudbase", baudbase);
>      qdev_prop_set_chr(dev, "chardev", chr);
> +    qdev_prop_set_uint64(dev, "base", base);
>      serial_realize_core(s, &error_fatal);
>      qdev_set_legacy_instance_id(dev, base, 2);
>      qdev_init_nofail(dev);
> @@ -1003,6 +1004,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
>  static Property serial_properties[] =3D {
>      DEFINE_PROP_CHR("chardev", SerialState, chr),
>      DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
> +    DEFINE_PROP_UINT64("base", SerialState, base, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -1083,6 +1085,7 @@ SerialState *serial_mm_init(MemoryRegion *address_s=
pace,
>      qdev_prop_set_uint32(dev, "baudbase", baudbase);
>      qdev_prop_set_chr(dev, "chardev", chr);
>      qdev_prop_set_uint8(dev, "regshift", regshift);
> +    qdev_prop_set_uint64(dev, "base", base);
>
>      serial_realize_core(s, &error_fatal);
>      qdev_set_legacy_instance_id(DEVICE(s), base, 2);
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index ecbd3f1b40..6e9c9768ed 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -77,6 +77,7 @@ typedef struct SerialState {
>
>      QEMUTimer *modem_status_poll;
>      MemoryRegion io;
> +    uint64_t base;
>  } SerialState;

Devices shouldn't have properties to set their MMIO base
address -- instead the memory-mapped serial device should
be a child of TYPE_SYSBUS_DEVICE, and should provide
a sysbus mmio region, which users of the device can
map at the address they want to map the registers.

thanks
-- PMM
