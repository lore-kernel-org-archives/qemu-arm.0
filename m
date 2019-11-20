Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1693363lfc;
        Wed, 20 Nov 2019 00:43:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDToA2sHPtsHT/9oRgmdg8V0W4Dnh0VbhdKhQkrvPsRV/euhmzvJ/sXsE1aW40KLWpoA7A
X-Received: by 2002:a05:6214:907:: with SMTP id dj7mr1525775qvb.108.1574239426570;
        Wed, 20 Nov 2019 00:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574239426; cv=none;
        d=google.com; s=arc-20160816;
        b=MfRxwfPKRWCPR9P7YzgWyCTa7fuBUP5tnbxfoVaffoFcKj9fVPJTTG52XThfNHrasd
         7UNGPZ2lrmq1HfNHKHKH3mr7ke8No4c0LsrKKXnB4ViocdiyO2N1RUFD4k6dv09eeQ1g
         31/Vg/ZOfzOnJK8/gHZoOsdbLn5Vs401+DEmcbopvdRVu8CpOx5Awc5iQjCd9nIjXsQg
         8Be5maofVdg/4e7a0dxd71hIkP5nM3SfNfQx+rtKWPJaza6+bQifaRHETU2IwVADHzVA
         Lq+YqfKPTZHOQGIQlguJVChZDgp/Q23p9agvYMrROT71KZ2/Ag2elB7Pnwy9p71aGht4
         yJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2Xfafg76e4Rt6GpyQj/9X9Bnuy1msy0V2PDUMoK8fY8=;
        b=XyMKL9fwrCyWCt5HrSpO9HXb/O/bcZsMKvSBKG39xlNi2MaOJfXEkURk4xe8gyRrvS
         y4vCiKMgV6mzI3K6x90urjYHRmC4/66TfugMcb2xYrM/DEYZhgwz5t162tlpV9WSRkKA
         iKPieQ6D11IUiSQ7kutxsY3bMzYmwpDmtkaFxR4PRsMsLvifCMQnQluldETRX2a4LF3I
         fUWujz4lrGC4P0L37ofaW2vmaXmBUzPdMCwJ+fEZpCJdWXZ0iWyYaHZpjCKudP05TXhw
         HbKqsBes2mXLyxGwOvgXqO20cr6ey7RaBG6WtowZ9647jhEmwmWzPBgI2YRdMyaRUiq/
         5WLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YwMIWwoY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n31si15000159qtc.102.2019.11.20.00.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 00:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YwMIWwoY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXLaU-00085m-0y
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 03:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iXLYj-0006aZ-5Y
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:41:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iXLYh-0000v3-Ur
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 03:41:57 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36452)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iXLYh-0000uY-Oe; Wed, 20 Nov 2019 03:41:55 -0500
Received: by mail-wr1-x441.google.com with SMTP id z3so162204wru.3;
 Wed, 20 Nov 2019 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Xfafg76e4Rt6GpyQj/9X9Bnuy1msy0V2PDUMoK8fY8=;
 b=YwMIWwoYl9umQMkhjIA3lBDRc1Dg6dP2FANJfbucKG7id6/B7g60F6T1so2OgGxgRw
 ejjhTUtzeem278yZvBZqv66PHbr7Xvowy7QjdwLH1/UOH3gvCghwhM8m95KSpoI71K4H
 Jdjh2Aahd5j5zqajg4JQR0FOERuEvLy70rSjZMsj2kY6L1dixnZB8w4+Zuep0VuN0sU8
 H/Zw0CHTfPTGSJI0eW20fOOJjor6ULypnuZ3lFOYaQhvG+02FRuWsF4kPyI5jeh7hj0P
 igJ8wbTDkaYV7pfHgZn/ezfU+X0kWL7TBG9fnQMGiV/T7qgYzXEHuKj7Yne1WwJtPGGQ
 w33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Xfafg76e4Rt6GpyQj/9X9Bnuy1msy0V2PDUMoK8fY8=;
 b=kzcxhnUM7xYnciQdqv+BQEPy7H0AQuQ7LAxpR5+IKf3hjcRSxsXF4Q6LpzzSeyCbZq
 pLOTomszO0i0nEZQ4PxB/25+oJBXPyXhl1rO+KfFUG/5P5b32WUBE9atnHtQqn7kc6RV
 xR1NGNf2gzpauSLYLQGh8GTxIeHB0Xr/bR+2SM+g81MEWPcazmRsTBqOJbxRfYSQt6ZW
 3KehItHzo0YqCvwQjanlELqnUXP7XiDwsoT0Q90U+sdPPP7aTH/1u0W0gB4j6Pfwv3nE
 T2bb7NE/A90BulrtCu1+Z8i/g7SzFNOQ4Igde///AwQcN02MGyjNUxdOkOmVIPrHxAaC
 wqCA==
X-Gm-Message-State: APjAAAV2K/9EEq4MRwRQi+rBs9gbEIo33EQ8NI/8KpLw1PlZU7S2sksy
 gca/8m3YUYxnOsN7WTViMOcRQp8sYyaEoXWFRnw=
X-Received: by 2002:adf:f20f:: with SMTP id p15mr1621683wro.370.1574239313803; 
 Wed, 20 Nov 2019 00:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-18-marcandre.lureau@redhat.com>
 <CAFEAcA-raK3HOjQjQCaOpqo0QQdT8WChx-njh_8-26R15tunaA@mail.gmail.com>
In-Reply-To: <CAFEAcA-raK3HOjQjQCaOpqo0QQdT8WChx-njh_8-26R15tunaA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Nov 2019 12:41:39 +0400
Message-ID: <CAJ+F1CKmPo9ccLdEVpGOSzbQmomQg5qxk-AU_eT92NvRb+irtQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/33] serial: make SerialIO a sysbus device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lZPDBam6Enel

Hi

On Mon, Nov 18, 2019 at 7:17 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Make serial IO a proper sysbus device, similar to serial MM.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/serial.c         | 58 ++++++++++++++++++++++++++++++++--------
> >  include/hw/char/serial.h | 13 +++++++--
> >  2 files changed, 58 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index a40bc3ab81..84de2740a7 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -986,22 +986,57 @@ const MemoryRegionOps serial_io_ops =3D {
> >      .endianness =3D DEVICE_LITTLE_ENDIAN,
> >  };
> >
> > -SerialState *serial_init(int base, qemu_irq irq, int baudbase,
> > -                         Chardev *chr, MemoryRegion *system_io)
> > +static void serial_io_realize(DeviceState *dev, Error **errp)
> >  {
> > -    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
> > -    SerialState *s =3D SERIAL(dev);
> > +    SerialIO *self =3D SERIAL_IO(dev);
>
> "sio" or something rather than "self".

"sio", or something, "s", "si", "serialio"... "self"? Isn't it more
clear that we are talking about the instance itself? No ambiguity,
less weird naming. Isn't this more familar to any OO programmer? Let's
keep the discussion in "serial: start making SerialMM a sysbus
device".


>
> > +    SerialState *s =3D &self->serial;
> >
> > -    s->irq =3D irq;
> > -    qdev_prop_set_uint32(dev, "baudbase", baudbase);
> > -    qdev_prop_set_chr(dev, "chardev", chr);
> > -    qdev_prop_set_int32(dev, "instance-id", base);
> > -    qdev_init_nofail(dev);
> > +    qdev_init_nofail(DEVICE(s));
> >
> >      memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8=
);
> > -    memory_region_add_subregion(system_io, base, &s->io);
> > +    sysbus_init_irq(SYS_BUS_DEVICE(self), &self->serial.irq);
>
> You could say '&s->irq' here, since you have the local variable.

right, fixed

>
> > +}
> > +
> > +static void serial_io_class_init(ObjectClass *klass, void* data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->realize =3D serial_io_realize;
>
> For class methods where the class has no data that needs
> to be migrated it's helpful to have a comment
>   /* No dc->vmsd: class has no migratable state */
> (which lets us know that it's intentional and not a forgotten
> thing). Some day I will get round to writing a patch so you
> can say "dc->vmsd =3D no_migratable_state;" ...
>

added

thanks

> > +}
> > +
> > +static void serial_io_instance_init(Object *o)
> > +{
> > +    SerialIO *self =3D SERIAL_IO(o);
> > +
> > +    object_initialize_child(o, "serial", &self->serial, sizeof(self->s=
erial),
> > +                            TYPE_SERIAL, &error_abort, NULL);
> > +
> > +    qdev_alias_all_properties(DEVICE(&self->serial), o);
> > +}
> > +
> > +
> > +static const TypeInfo serial_io_info =3D {
> > +    .name =3D TYPE_SERIAL_IO,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(SerialIO),
> > +    .instance_init =3D serial_io_instance_init,
> > +    .class_init =3D serial_io_class_init,
> > +};
> > +
> > +SerialIO *serial_init(int base, qemu_irq irq, int baudbase,
> > +                         Chardev *chr, MemoryRegion *system_io)
> > +{
> > +    SerialIO *self =3D SERIAL_IO(qdev_create(NULL, TYPE_SERIAL_IO));
> >
> > -    return s;
> > +    qdev_prop_set_uint32(DEVICE(self), "baudbase", baudbase);
> > +    qdev_prop_set_chr(DEVICE(self), "chardev", chr);
> > +    qdev_prop_set_int32(DEVICE(self), "instance-id", base);
> > +    qdev_init_nofail(DEVICE(self));
> > +
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(self), 0, irq);
> > +    memory_region_add_subregion(system_io, base, &self->serial.io);
> > +
> > +    return self;
> >  }
>
> thanks
> -- PMM
>


--=20
Marc-Andr=C3=A9 Lureau
