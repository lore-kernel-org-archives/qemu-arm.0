Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp176684lfi;
        Mon, 18 Nov 2019 07:17:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbzmqMJGcEhNG6ZhvGwqwi3zcFBzjaZo4rRy5I9Is7U1gJOOPIf6fwZkZ2vRq/En+5C/+L
X-Received: by 2002:a17:906:600b:: with SMTP id o11mr26882555ejj.175.1574090235544;
        Mon, 18 Nov 2019 07:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574090235; cv=none;
        d=google.com; s=arc-20160816;
        b=eL2D1TQoBFpriOOY5Tas1mbyah2vQDW0qXgAIxVisNQ6TKod/goXcjtLrC5VSXvaPr
         I6MzgswNi6lYjYdRkvTgxbM53jZHAff30jLoX9HOiiwAbO0TJaF3rTWNCqhB2QGzb3ai
         cNtt0NAWz9lx9Bkhrkx6Nnr0g8Xo3jT+ZcTus0MfnrPaYb133AyWVSPyuTa9MeyB+nft
         Lt1+OGidN3cHE3ObmUHmdCduM7sJnre9FVJgKtdY7Bz/maCI1yw547rkhEpP/uDCqeiO
         jg/MBxPtkPd3FymAdqwSnnDh2btr7Zb8/poogbWfSbzFUPjN0S1rfjQ1lNOqv9XZAMop
         2P9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=opeqQ1By8GVGE1cHT+yBFuirg4hVOSqG/qOLZIMdCQA=;
        b=qI7zFfgVCR4fDZ/+ObUNU/3yHNSlgFKD0I9YOE63tlM0xPJfHYNRUZcb9MKq+PIwMj
         ft+bCsDJt5HeIx6ImmO9LFUTJXVoZPH856S+4pH9VMqwTu++DYxPVDGNMjKrnMUdAwoO
         UbITY3gxTmj2/pElpcVW32spGTnReC3UBb/hgIK0UnnpKDVWjmjU9pqGxHJxoR5Ba/sh
         jexqdDvfiNs3vTXz7hvGXs1LJyHwlXZdmYIuBCq/Quwk449suot6v11sM42ExJJCTeOq
         s0jiyen8ocNdfP3yBWDCqEGFJQxzNmabEDFZSvy7JUlB0ZlNDyodX7h8wXH05sunmmbP
         a33A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JAyc5Q+S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25si11766474eje.225.2019.11.18.07.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:17:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JAyc5Q+S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWimA-0006yn-8U
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWiln-0006bx-IC
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWilm-00072F-3u
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:16:51 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33173)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWill-00071p-R7
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:16:49 -0500
Received: by mail-oi1-x244.google.com with SMTP id m193so15639828oig.0
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 07:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=opeqQ1By8GVGE1cHT+yBFuirg4hVOSqG/qOLZIMdCQA=;
 b=JAyc5Q+SSR/R8qko0HfW5lWMD5NK7N7X0ZDSqqMJ7nR2ilupyhAAgukZyMUP9yVjqw
 QmA9uzqrC+/jyuy2OvI8zs+AQ5BZqmW07zuNMOQ3ED7L8oevk5c5Iy86GT+C0e2rT/b+
 +Vs8XBHIzCwaNwLxLy/MVZgLpY4d4hsF324i8UCMyCbDCN0vPRKd9i2CLDQCrY5iDmgv
 uV0A1xOhKvxH1A9RGzBUMbRdYlAKJS5O4kKoIvfRDZelgSqj1f3kzspA8xEBAdfo8QF1
 QJF0iiXL07ppAKrZjxG33hnX70sHgdBViHPDXch68v40TtXwPcD530zx3fIcGryFTwXU
 1dbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=opeqQ1By8GVGE1cHT+yBFuirg4hVOSqG/qOLZIMdCQA=;
 b=cLYAOJ/YXMqCeMbi1f8uFh6gP3UfVGPwK2wRld5SzMY17WB2limt+NITOjVWnDxdAg
 d7MLlJWDAHscgMs3VyCkiZVPvtwQHVlFaK3MuPjNRpucgAuTN9WGScLz1pM2Q4jKTOy8
 vS5tg1s2IACduwe1mBggbSk35N36Z3R8IU+s8xo/ymvMpGRlpmg+0Qa/EoMPWkQmH+Kb
 C95vdcai4Z2KI5OeI1mIhKDeHh37KRWqGF3pcBUCsUa0hgQDY0v/QloEQl3LQj/5lcr+
 RHUoKXY8Ay112tFjjPFuBEOijR90zroxj/0Y8QG9+Bk9PfTIvbuVEIpQivhQxcIz/28z
 dTUA==
X-Gm-Message-State: APjAAAVuYwiYxcqKS7mVQDU3WHrAFtWroemzVZo+4V6nGs8H9H394sBi
 /bvDvbl1pj5MUfg5lLKx69GLCE5+pgOhSDpwwJQLqA==
X-Received: by 2002:aca:cf12:: with SMTP id f18mr19632781oig.48.1574090208750; 
 Mon, 18 Nov 2019 07:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-18-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-18-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:16:37 +0000
Message-ID: <CAFEAcA-raK3HOjQjQCaOpqo0QQdT8WChx-njh_8-26R15tunaA@mail.gmail.com>
Subject: Re: [PATCH v3 17/33] serial: make SerialIO a sysbus device
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: m0r9g0AmB5gj

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Make serial IO a proper sysbus device, similar to serial MM.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c         | 58 ++++++++++++++++++++++++++++++++--------
>  include/hw/char/serial.h | 13 +++++++--
>  2 files changed, 58 insertions(+), 13 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index a40bc3ab81..84de2740a7 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -986,22 +986,57 @@ const MemoryRegionOps serial_io_ops =3D {
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
>  };
>
> -SerialState *serial_init(int base, qemu_irq irq, int baudbase,
> -                         Chardev *chr, MemoryRegion *system_io)
> +static void serial_io_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
> -    SerialState *s =3D SERIAL(dev);
> +    SerialIO *self =3D SERIAL_IO(dev);

"sio" or something rather than "self".

> +    SerialState *s =3D &self->serial;
>
> -    s->irq =3D irq;
> -    qdev_prop_set_uint32(dev, "baudbase", baudbase);
> -    qdev_prop_set_chr(dev, "chardev", chr);
> -    qdev_prop_set_int32(dev, "instance-id", base);
> -    qdev_init_nofail(dev);
> +    qdev_init_nofail(DEVICE(s));
>
>      memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
> -    memory_region_add_subregion(system_io, base, &s->io);
> +    sysbus_init_irq(SYS_BUS_DEVICE(self), &self->serial.irq);

You could say '&s->irq' here, since you have the local variable.

> +}
> +
> +static void serial_io_class_init(ObjectClass *klass, void* data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D serial_io_realize;

For class methods where the class has no data that needs
to be migrated it's helpful to have a comment
  /* No dc->vmsd: class has no migratable state */
(which lets us know that it's intentional and not a forgotten
thing). Some day I will get round to writing a patch so you
can say "dc->vmsd =3D no_migratable_state;" ...

> +}
> +
> +static void serial_io_instance_init(Object *o)
> +{
> +    SerialIO *self =3D SERIAL_IO(o);
> +
> +    object_initialize_child(o, "serial", &self->serial, sizeof(self->ser=
ial),
> +                            TYPE_SERIAL, &error_abort, NULL);
> +
> +    qdev_alias_all_properties(DEVICE(&self->serial), o);
> +}
> +
> +
> +static const TypeInfo serial_io_info =3D {
> +    .name =3D TYPE_SERIAL_IO,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(SerialIO),
> +    .instance_init =3D serial_io_instance_init,
> +    .class_init =3D serial_io_class_init,
> +};
> +
> +SerialIO *serial_init(int base, qemu_irq irq, int baudbase,
> +                         Chardev *chr, MemoryRegion *system_io)
> +{
> +    SerialIO *self =3D SERIAL_IO(qdev_create(NULL, TYPE_SERIAL_IO));
>
> -    return s;
> +    qdev_prop_set_uint32(DEVICE(self), "baudbase", baudbase);
> +    qdev_prop_set_chr(DEVICE(self), "chardev", chr);
> +    qdev_prop_set_int32(DEVICE(self), "instance-id", base);
> +    qdev_init_nofail(DEVICE(self));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(self), 0, irq);
> +    memory_region_add_subregion(system_io, base, &self->serial.io);
> +
> +    return self;
>  }

thanks
-- PMM
