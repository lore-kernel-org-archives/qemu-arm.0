Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp132565lfi;
        Mon, 18 Nov 2019 06:43:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqyy0bJBx0eb40IkuM3NagwNlqJDpNIE/YoPlBAKPEgC3WuluEsl9jVxwOGaL66xVaOVJ3dQ
X-Received: by 2002:a17:906:e297:: with SMTP id gg23mr27803990ejb.41.1574088235255;
        Mon, 18 Nov 2019 06:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574088235; cv=none;
        d=google.com; s=arc-20160816;
        b=NZWBA6V9ZNwg+edPfMABRuSfKkO4tc7fMthN63mGG/q0jhajUadEkVhAFvswT+vpwt
         kqPYRiVcUXCMgm24cwZ+icJGfCmt58xRFyFcMnPJTrRGNbqxcsFnGB0JQYI2sc61soIF
         4R/MvDrPVqNUYJIW7QCuf7H/gjFUr2O1EG1lVrfnxeRZ/V6iJQvyCvECWQlP/mau3+Um
         RbSw5oFUS2ICvtWM9A49Utx0SBeR1EBwJxzPh+Zqg30kpflnaE29KYkgMxbtbxIj9Fci
         PfIqH2D1+sT/61gfyJMRIv7sA4JldCA9FmhPYOClGiuaVV0L7aw3FNKPZ/Vnlnh6dx/e
         8s0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+jsIsPEQoLu9d8nup1pe9kvAUSu0Py/WlxBrGT80qXM=;
        b=kzUoz+LdIAgqnJ+3a7aWqXeDQW/zKtozVpgSoWL9jwiSNZ/HDKfPeBhIX+qyFlh9q5
         KEJGg0AHGilqiB5KBHnFpPVyagP8UU9XpC690AY5yttJziuwr1rdHnxQopSy3s+5zPS5
         6I6kZTKbELUjBGcKaT1KdE0G/CNs2XJByTcoWQGekgM+XGrcmGc0IE1uRBcnTPTmHXxL
         wYfAP80VbgIh0U1TcoAHpexaDnYbcDUxdCSfjPrJUHAsb8MFkkALMopRPUv83kjtWFUj
         swpVMNaUTkFHoFhhCXJKczq1P8USHJmpX0L/IgMRWvteiTgnLvRLMeDlsJmVS3IlFbFn
         LcmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fuTglVXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si11829267ejq.208.2019.11.18.06.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:43:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fuTglVXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWiFu-0007Jt-AR
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWiFn-0007JU-80
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWiFl-00067e-Tu
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:43:47 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWiFl-00066I-Np
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:43:45 -0500
Received: by mail-oi1-x244.google.com with SMTP id e9so15508609oif.8
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+jsIsPEQoLu9d8nup1pe9kvAUSu0Py/WlxBrGT80qXM=;
 b=fuTglVXnR6wykZFDZpJcrPQaaJPGGX42Dztzx9dyatGRdscDmuoDHi/sHu5+4dB68y
 xExqrNC9wX0Uyym/0urZ7kEFMDm/FraYD4s2On5drKUZDK/IXvnComefR9gpO/n/hRoo
 WEA4qYjaX3YIka8CDlk8HWgMgNUlCm0dFTisA7yX4rgackfYpU/D2HOrGZ/xn5/u77OY
 f18IdKh60+Z5sOMGjVau/FXDshDca1XjysifcJYLITBqGJwz6hH4dGlPxYzGv1fF8ryJ
 VyM6xlG7H4Y31TggsvYwvOLum78NJk+kZIvYtipQaCHH9v48jWcRIBqeSno8KD0g9UXe
 FulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+jsIsPEQoLu9d8nup1pe9kvAUSu0Py/WlxBrGT80qXM=;
 b=ryv74gBCrgSW3Brrb2T0qKsZkUw62I3jFQwKnu1F+aSKI+JT+voeOb5tvfbutcCWlk
 Krlf3hodG6025pqK1t05C2XLvlWg+KqK/1QVAN6knT+uAHSt1ffH3dIiQK36xS4DUdBY
 L9OQZQ7e8LqOm7S4Po3sX5i0eFg3wRu6+JXqBJQZKE4jyyDMOdfiq7Ra2gYTdDlVSFZJ
 vekx2oFU+BV2XbR/ZQMA6DQWt6AtOwFeQ+pxYQkylY1rMb0kdDunntkVeg4qBf3kkW7j
 EPeJo/cW3woBoiaIJS9gHnaj3bNSVOyeL0KMwbJ7yvpI+wbfE0d4KXps5t9z3ueLKJd/
 LgiA==
X-Gm-Message-State: APjAAAUpEGBI5h+1U83cGJBahFONgYDo6Ap5G8Gsg87LnOJ62AbHNnM6
 D498/TuX0RN8uOP6w0FKoi5fivtF5jKFTdkzyl0oKg==
X-Received: by 2002:aca:a9d4:: with SMTP id
 s203mr19873230oie.146.1574088224529; 
 Mon, 18 Nov 2019 06:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-14-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-14-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:43:33 +0000
Message-ID: <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
Subject: Re: [PATCH v3 13/33] serial: start making SerialMM a sysbus device
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
X-TUID: VieZrVrRkuel

On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Memory mapped serial device is in fact a sysbus device. The following
> patches will make use of sysbus facilities for resource and
> registration.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/omap_uart.c      |  2 +-
>  hw/char/serial.c         | 47 ++++++++++++++++++++++++++++------------
>  hw/mips/boston.c         |  2 +-
>  hw/mips/mips_malta.c     |  2 +-
>  include/hw/char/serial.h | 20 ++++++++++++-----
>  5 files changed, 51 insertions(+), 22 deletions(-)


> -SerialState *serial_mm_init(MemoryRegion *address_space,
> +SerialMM *serial_mm_init(MemoryRegion *address_space,
>                              hwaddr base, int it_shift,
>                              qemu_irq irq, int baudbase,
>                              Chardev *chr, enum device_endian end)
>  {
> -    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
> -    SerialState *s =3D SERIAL(dev);
> +    SerialMM *self =3D SERIAL_MM(qdev_create(NULL, TYPE_SERIAL_MM));
> +    SerialState *s =3D &self->serial;
>
> -    s->it_shift =3D it_shift;
> +    self->it_shift =3D it_shift;
>      s->irq =3D irq;
> -    qdev_prop_set_uint32(dev, "baudbase", baudbase);
> -    qdev_prop_set_chr(dev, "chardev", chr);
> -    qdev_prop_set_int32(dev, "instance-id", base);
> -    qdev_init_nofail(dev);
> +    qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
> +    qdev_prop_set_chr(DEVICE(s), "chardev", chr);
> +    qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> +
> +    qdev_init_nofail(DEVICE(s));
> +    qdev_init_nofail(DEVICE(self));

Something odd is going on here. This is a convenience
wrapper around creating the SERIAL_MM device, so it's
correct that it has to init DEVICE(self). But it should
not be doing anything with the internals of 'self'.
It's the instance_init/realize of the SERIAL_MM object that should
instance_init/realize the 'self->serial' object. You have the
code below to do the 'instance_init' in the serial_mm_instance_init
function, but are missing the equivalent realize code.

> -    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
> +    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], self,
>                            "serial", 8 << it_shift);
>      memory_region_add_subregion(address_space, base, &s->io);
> -    return s;
> +
> +    return self;
> +}
> +
> +static void serial_mm_instance_init(Object *o)
> +{
> +    SerialMM *self =3D SERIAL_MM(o);

'self' is not idiomatic for the name of the variable containing
the pointer to the object in QOM code ("git grep '\Wself\W' hw"
shows no uses of it at all, which is quite unusual for us --
usually the codebase has at least a few uses of any non-standard
way of writing something ;-))

Usually we use something approximating to the abbreviation
of the type name, so here 'smm' would do.

> +
> +    object_initialize_child(o, "serial", &self->serial, sizeof(self->ser=
ial),
> +                            TYPE_SERIAL, &error_abort, NULL);
>  }

thanks
-- PMM
