Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp155755wrq;
        Tue, 22 Oct 2019 09:46:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyg0PqLUFR7Jm+DfKRl+jO4fsX6gWkUuUzaFr9DElJfo//S+/Bb1cz0T/90lfGWrTL7Pb2h
X-Received: by 2002:a17:906:e290:: with SMTP id gg16mr9246874ejb.280.1571762809829;
        Tue, 22 Oct 2019 09:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571762809; cv=none;
        d=google.com; s=arc-20160816;
        b=NsM337HOIa0+4ykkwwOA0B5tYcarSCX7+qbUSWLlCjROn0iLOS9hpLEGRer3m1OJRb
         5UjtB2iWSKTkQgH8t96dSqtWc3o9mgT+LWKfUQNHD1k90CYeXmdSnQaezZS5QSwcS9l5
         dDcjH5q1QDsBWPO322EP3p3ePLwfnwEK3xTQPHWP7RCrYOZsrhR+WbMiPy90uIL7z0KZ
         QwUUx/K2boICCmUDolDRWdH8WServ6jsdQIsAM/Ut9WBZhLsXVftIdebpSPigMS3Z0kR
         KenH8ivInmlrd8JtlhaDEoauJ2aOj/d6NdAMoScJNVfJF9hpMxme4q6Np+6Cg5WUqNAt
         5J5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=S7GLYTWYwKDPqMMyl5E+zvOg9SPh+U8P5YdjfmkwQj8=;
        b=hPwmke22jeTJsvr37Cytoc96jlKx05lOxSa4UQJ7PVnn8Eu7XDID1R/Ftb0bgc6puS
         jGoW/GfDzdnkkPDVjrPGNFNnR7yhXy9U1WTdrMfaVBUvm0ufRw4AASzQR/EXSz5+RkBS
         YtGQKjoMrDbamWz6kS262uVPvp6KboPXnwy3mpZO5m4GJPH0d60JZnMIZKIW1d4bE0kh
         zAaAu9pGbKfZXIdl9GzJ385tgH7Tq7/0QEm0ZR7bTqQ9Zr0hfp5T4AVvyzUqpQ4OyHv+
         Qas23Uq8hxl82giDo8w+zg1wf+3psR6OrnivME2GG1CJ82VnUi23St/XgdoH3CrvdM5F
         d0cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mWSfDd1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qw15si3759934ejb.137.2019.10.22.09.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:46:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mWSfDd1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxJ2-0001Vh-LQ
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40577)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMx76-0003F5-IC
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMx75-0004Pf-BH
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:34:28 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:42358)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMx75-0004Oz-0v
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:34:27 -0400
Received: by mail-io1-xd44.google.com with SMTP id i26so11885819iog.9
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S7GLYTWYwKDPqMMyl5E+zvOg9SPh+U8P5YdjfmkwQj8=;
 b=mWSfDd1rr5Red/bw5zq3ut4i5XC3u+rCoQii8nz0HvyGNBf4TyWiSHqxBqUMMTXH8L
 9rRUBUHKlecIOD6Psm9Y+11k+Afxv0JZaMblfQSHSD249mBbjQpVkI56NMA35ieOPL+K
 yvNYbI4q92DqYJWGkp83B/+lAKD3sLuwc0gxuWffK2mzLjwYgRnL6oJml1lvl/HoOUji
 QGHGqjLwPcyB4UH23q+GkMMl+CDYGzsPTQRSW0S7yvLfefIXgUI3BbV7hsEkyg6E4mVz
 +ReBPcIOaJnPzW0bCaoOd83SFFrJ3JIwJG+N0Ny34ZZihaXIzNIkBiFz2Dnm/7Z6TdKG
 m5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S7GLYTWYwKDPqMMyl5E+zvOg9SPh+U8P5YdjfmkwQj8=;
 b=FN0riKiQzdZiSUrteeolWLEAWdIGA5hoM4wqhM6Zc6xAkxWGCkDdf+W/W2rPiLl3ZT
 VmUbwv3wl7Bo0ipQq674r0z8J/cfgKjHvBQ2k5ABPDWgr3LYCs2jGY4g2Wgn5P15wcH5
 7Z6n6yDMx3oeI43fIaCi6kTsEpBmM0xPUyBmZe5uc07opnjFEE0ShZHD7nrY++EqFcar
 sBSANCLOV2LYry17BpywpAGTGV4HRxRNgJxPnd7L1ZSPXKFhnRJAaVdDE2YFOyZWFxOu
 VzM39fMubev94X2FXKTJj2WUaxBpRd3wWVEpg1QFy3DC/iP6o6QbIE4o7r3pxj/PfMLw
 3aJw==
X-Gm-Message-State: APjAAAV1sq7TvnHFJ7RBm+jQ5skzM4fJ62Zr59W264FA72gNhMXqI4LH
 B1wI+EXuwGRcKUFJWo3z+Xyjoe1zpvaYA0LDqLkXNQ==
X-Received: by 2002:a5e:8219:: with SMTP id l25mr4712782iom.292.1571762066131; 
 Tue, 22 Oct 2019 09:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
 <20191022162137.27161-14-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-14-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 17:34:14 +0100
Message-ID: <CAFEAcA8B9x0nWk38bOSH_7NmD8FU+pRd22OTN2NFdvNVhCAktg@mail.gmail.com>
Subject: Re: [PATCH v2 13/28] serial: factor out serial_mm_connect
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aTViT9BvBZmU

On Tue, 22 Oct 2019 at 17:23, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Split IRQ and memory region initialization in a different function to
> be reused by callers that realize the serial device themself, and
> connect irq/mem after.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c         | 20 +++++++++++++-------
>  include/hw/char/serial.h |  3 +++
>  2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 72d48b5cd8..41548e159c 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1078,27 +1078,33 @@ static const MemoryRegionOps serial_mm_ops[3] =3D=
 {
>      },
>  };
>
> +void serial_mm_connect(SerialMMState *self, enum device_endian end,
> +                       MemoryRegion *address_space, qemu_irq irq)
> +{
> +    SerialState *s =3D SERIAL(self);
> +
> +    qdev_connect_gpio_out_named(DEVICE(self), "serial-irq", 0, irq);
> +    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], self,
> +                          "serial", 8 << self->regshift);
> +    memory_region_add_subregion(address_space, s->base, &s->io);
> +}

This function isn't needed if you make SerialMMState a sysbus
device which provides the MMIO region and the IRQ in the
usual way.

thanks
-- PMM
