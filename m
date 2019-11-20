Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1680910lfc;
        Wed, 20 Nov 2019 00:30:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwv6hYJQcGRljbr5PqpeAnX1znhTUf2EP7+WBi/+McGF1yuWgs4sA9KjyKaxEbR2TuJ+L7B
X-Received: by 2002:a17:907:212a:: with SMTP id qo10mr3719537ejb.197.1574238643947;
        Wed, 20 Nov 2019 00:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574238643; cv=none;
        d=google.com; s=arc-20160816;
        b=QDZZ6io82OZG+cg2tZ6cftHIK+pz7tieXpm2rEV01oriUaBrD6Og6ivY4RRkkfW1PK
         tuwndWkT95RbiwMrEVkNDSvJnXb+CmzqIIbkenjmmuyW00Cm4Sm+vJYVGXBJiS5c1HEc
         D1m7r+XaOAmC8l4+1GWWOvb+zBTGWIll45NwQjH26xan9T7OaeHiln8zJX77FNfjuEi6
         fLRmpc+af5e8jpgBNwScmfrdTnTBaGq5XSlmV4hbvBOWtMmoK6lhazpABgA79TDrQeHb
         Nj2P6E2QDnyErUPvpcYZhP4XvVsMOw3dIPrD2YkPpvXxha1mwUqCHqiyDIimZIOwBPIc
         CrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OUE3rUtxH2aruBzNmueOYuaThREWH+pjVERvEFbZT60=;
        b=wLh/GF41bGewZlICP+VA7yyBAA3W54SPn1x8gmavFPIL6u9g4BOdTO229zI3WiXTK8
         QDZElKtbH4SdBN/kON0cta9irC1taDL/jouY5cSE566YFh3vrE2Nu0Oc73BCWrcH91CH
         muL5ep6/HgkUmobIWb725GpB0TTYyGa3Ozh4+TRmSCz9qOYhHBp5G1lCwsKG74pEnGOX
         q39e9Rupv4Vskzpdw8Yxf/oyeIAIQ2AihKtQDMPFtqPpnFXYnT2W8yg4nyqGgoVgv0bM
         ViVI6R1Upsa82q2TKFPbK7MWg2RR0N+U+VcbusjRh5jZAWcYRQla3PkewrhZzK5dpLZK
         qIfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YgLm8H0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si17965311edd.140.2019.11.20.00.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 00:30:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YgLm8H0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXLNq-0007iE-OM
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 03:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXLNg-0007g3-J5
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 03:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXLNe-0002GD-A4
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 03:30:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56808
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXLNe-0002Ed-55
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 03:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574238629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUE3rUtxH2aruBzNmueOYuaThREWH+pjVERvEFbZT60=;
 b=YgLm8H0Q5HiGVSCOxyJY3+JQijPrDM+HsACxGA1SuoELtPaZMFiO3MVnIOWnpt1LOu9Ome
 RDvuGPJQZxDDmBa4GnrpSLsz0l+SWj53q8Ddhto0lHc39khuc06d1EpGMuaHuGpEf7Y8kH
 tV4kgRL9+6oC/Fu4SUa9U85qECKKZ8c=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-UOEYF8KxNA-4Gid3cMImUA-1; Wed, 20 Nov 2019 03:30:28 -0500
Received: by mail-oi1-f200.google.com with SMTP id v130so12128389oib.5
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 00:30:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OUE3rUtxH2aruBzNmueOYuaThREWH+pjVERvEFbZT60=;
 b=AQF7t80uTnBmZyOar0jG5IKuBbOMQwCp7IUB1uad5GnvTxXMVT7NRtNNjZPHVhw9X0
 Tpv4eOLatLU5LtOYyH7pKfzVG63+XIfKkaZMVDZVtDMTAUO/7pVuWeZvm3ih2Um2LzIW
 98IzcnnpUdQgkFu0ZmxWgj2iLi6/DAmid1s97sksPTcuSaw+lh5MEjnri2CLDuTM2sg/
 1CVfcMoVMyLHsKpc4fNpx3t6nc3HWBBvwAAa/GU8R6uc7AC2KDRZRDmnyvuQjfijw5Xa
 WcRyrgxAe533HiieUtFL/e23qDVhr/BxqzxsBaQE7dIelekAW3sOB0MHn5tKKQb0jfRC
 XkaA==
X-Gm-Message-State: APjAAAVJicEnXlq98QJSizcShWqHL0BcgCkHsSPBH0wsQpr2caJ7f/Ff
 Yr8dlNyP8cl4meiHg2lDa9VCKZilx6Kn+SlxqJU/QuGf2ugEjESWs2OvRa1bD2MYSmkfMGHdkRN
 C3eTz+KwX0RX/gOqYAEZ3yNF9QtUY
X-Received: by 2002:aca:4c14:: with SMTP id z20mr1751558oia.76.1574238627260; 
 Wed, 20 Nov 2019 00:30:27 -0800 (PST)
X-Received: by 2002:aca:4c14:: with SMTP id z20mr1751505oia.76.1574238626855; 
 Wed, 20 Nov 2019 00:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-17-marcandre.lureau@redhat.com>
 <CAFEAcA-dShnHHGEYrsmc+27aUrH7WUMn3=Pvn92B8XH=qtYFBQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-dShnHHGEYrsmc+27aUrH7WUMn3=Pvn92B8XH=qtYFBQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 12:30:15 +0400
Message-ID: <CAMxuvayKZXnkm_v5V1L=dE2-dJgMjcSBy0aufVjmGhLkuZW0hw@mail.gmail.com>
Subject: Re: [PATCH v3 16/33] serial-mm: use sysbus facilities
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: UOEYF8KxNA-4Gid3cMImUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-TUID: tU1x3ydzkcRo

Hi

On Mon, Nov 18, 2019 at 7:09 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Make SerialMM a regular sysbus device, by registering the irq, and the
> > mmio region. Reexport the internal serial properties.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/serial.c | 35 ++++++++++++++++++++++++-----------
> >  1 file changed, 24 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index 2f7667c30c..a40bc3ab81 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -1074,21 +1074,18 @@ SerialMM *serial_mm_init(MemoryRegion *address_=
space,
> >                              Chardev *chr, enum device_endian end)
> >  {
> >      SerialMM *self =3D SERIAL_MM(qdev_create(NULL, TYPE_SERIAL_MM));
> > -    SerialState *s =3D &self->serial;
> > +    MemoryRegion *mr;
> >
> >      qdev_prop_set_uint8(DEVICE(self), "regshift", regshift);
> > -    s->irq =3D irq;
> > -    qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
> > -    qdev_prop_set_chr(DEVICE(s), "chardev", chr);
> > -    qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> > -    qdev_prop_set_uint8(DEVICE(s), "endianness", end);
> > -
> > -    qdev_init_nofail(DEVICE(s));
> > +    qdev_prop_set_uint32(DEVICE(self), "baudbase", baudbase);
> > +    qdev_prop_set_chr(DEVICE(self), "chardev", chr);
> > +    qdev_prop_set_int32(DEVICE(self), "instance-id", base);
> > +    qdev_prop_set_uint8(DEVICE(self), "endianness", end);
>
> (this last line should be in patch 15)
>
> >      qdev_init_nofail(DEVICE(self));
> >
> > -    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], self,
> > -                          "serial", 8 << regshift);
> > -    memory_region_add_subregion(address_space, base, &s->io);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(self), 0, irq);
> > +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(self), 0);
> > +    memory_region_add_subregion(address_space, base, mr);
> >
> >      return self;
> >  }
> > @@ -1099,6 +1096,8 @@ static void serial_mm_instance_init(Object *o)
> >
> >      object_initialize_child(o, "serial", &self->serial, sizeof(self->s=
erial),
> >                              TYPE_SERIAL, &error_abort, NULL);
> > +
> > +    qdev_alias_all_properties(DEVICE(&self->serial), o);
> >  }
> >
> >  static Property serial_mm_properties[] =3D {
> > @@ -1107,11 +1106,25 @@ static Property serial_mm_properties[] =3D {
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > +static void serial_mm_realize(DeviceState *dev, Error **errp)
> > +{
> > +    SerialMM *self =3D SERIAL_MM(dev);
> > +    SerialState *s =3D &self->serial;
>
> Again, 'self' isn't idiomatic in QOM methods.

I made my argument earlier about why I prefer "self" even though it's
not represented today in hw/

> > +
> > +    qdev_init_nofail(DEVICE(s));
> > +
> > +    memory_region_init_io(&s->io, NULL, &serial_mm_ops[self->endiannes=
s], self,
> > +                          "serial", 8 << self->regshift);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(self), &s->io);
> > +    sysbus_init_irq(SYS_BUS_DEVICE(self), &self->serial.irq);
> > +}
> > +
> >  static void serial_mm_class_init(ObjectClass *klass, void* data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(klass);
> >
> >      dc->props =3D serial_mm_properties;
> > +    dc->realize =3D serial_mm_realize;
> >  }
> >
> >  static const TypeInfo serial_mm_info =3D {
> > --
> > 2.23.0.606.g08da6496b6
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Does your r-b stands if I keep "self"? Or do you feel strongly about it?

thanks

