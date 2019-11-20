Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1631498lfc;
        Tue, 19 Nov 2019 23:35:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiS5arUwvlowOUUu/2B8fzm9z9vpr6oBRjl5SrXz7GNgfnguF6DuvLfZyrCjPAF4/K1uiQ
X-Received: by 2002:a37:48d2:: with SMTP id v201mr1122492qka.277.1574235345868;
        Tue, 19 Nov 2019 23:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574235345; cv=none;
        d=google.com; s=arc-20160816;
        b=tVKqsN6y741hj2PAwx/zhkDwnvtfjH67ay6gYOwArWUuoiFiOFaC4dmbxN4kBEPf4i
         QbT9tqeSo1MstfYLJVB/xQ3u+66TjxpN+bTJg4CDFPUgjyD8B3Ihfkl2XmgxXnN+Y7LG
         yzx8sSX1S9gxnGj6PE8iNaauTE+tW80YY9W8Zk2y9Chf0Mbq1mIa6PRM6SmUUtWE2qJO
         9We9MRGfmeLPHCaUeS631QHQc5/VOTpMee+9kAtAgl45gMj6Wvpu+i9mXyDuCBHhQQEp
         LeD6hZy0atg9XuDh2KApx+4Ryz/q9Rbqvb3WnNv/M+UdTcIq2Bza4SmWSWBMt88Q5U9G
         KwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=316cTHKnaJdtIgeHH1iN6wxI4x0BhIlr2FEz4LwEfs4=;
        b=Rfyff5rNsyjDx41+wvOYRkzt8IAoPgOmGsH2pg5ro6MRQM2q2F/QzmZ7lYOIaDvXkS
         P8nT7WcRn/EHC70K35tZgPGbsXmebgMtcWCDi4qH5HBsB4rcsujg4dhJz3WmZCcy/Oh0
         KjXLyF1OOxJctpq1pApxtivRfQc6iEj/Hb/D3erYzYl+7aR+4lMsEMQXK5gCiQ31sxpP
         MpS5nYjybKRgeBwY0YaQsLcbk7/Oa62hA0PIdVoxlU8SICA16Z2NukK22dPsWwGzI5dt
         Fc6HUE/4Ij9xaysd47JmnX9OaL2W4oDEpzX3Ud+eS0nNsi9zXGq7vqDuyRi23ZwIjASa
         Deww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UAwdL1Qp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z65si14766867qtc.89.2019.11.19.23.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 23:35:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UAwdL1Qp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXKWf-0006uo-80
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 02:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXKVt-0006u5-J7
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 02:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXKVl-0005Oz-Gv
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 02:34:52 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXKVk-0005Kn-8M
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 02:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574235284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=316cTHKnaJdtIgeHH1iN6wxI4x0BhIlr2FEz4LwEfs4=;
 b=UAwdL1QpivMRwlYIHFGOTls3TSotVamnS8SaWy1XajE+4J5T6hXPSLIBmmu3VwV+SkoZKI
 RXBdCXGmGTjUvPHHK4yqdZJbBMd6Gdvp4UR3fWZFasywMLqbNICZCPVtk5780XPHu3D216
 +4lw6okS8FjjRxEgZDmCurxxv8zm4kQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-JvqCm76TMpyuAgjzXWM5Bg-1; Wed, 20 Nov 2019 02:34:43 -0500
Received: by mail-oi1-f199.google.com with SMTP id q78so12076065oic.0
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 23:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=316cTHKnaJdtIgeHH1iN6wxI4x0BhIlr2FEz4LwEfs4=;
 b=ROPUmf4s3ZzsBVYnfhTDvb4Y4y+oThfFUgtESAX2Ue4rEKWHVjkG2evqRvVDt6znQH
 V7NgoWzQrQewwUeMyllJp+t6xzEUwH4gRc7GQ9YRtJHKYIuTKaTpwUZ8TyprO4QeCTMw
 yzMI3emBnCZRmcyHAscupB0pcaGZghi1b2l/Jr+QchGhRC+PIPZOZ3zL9Q2s4LKZcX7v
 3+UCVm0OMxGRmW3V5vhfBEYCO2gmIl9BmXu4AIPR89hc4UoBZkfmBRPNhXmcgNPlI4Qd
 9BEiVoZLrZtqVNR1aspK4hs7wz4R5X2hK483MheLXjCKhuiAuumnx1xU/u7foiWwBXKt
 P1aQ==
X-Gm-Message-State: APjAAAXSrjqJ2XzPLt49h/hUMyTt7SHPjmuMd69232imQGQ64Xuakl5J
 bNJVNR8xE7g3ad9QqpUv1OA5Y+573EWi7iQ5VqZGENBFeb2inDxH2PVxoX1rbqe5l5UcxN2+VHF
 GO0jrddIDY5BTxV1qiz9gOS81e29A
X-Received: by 2002:aca:1702:: with SMTP id j2mr1485418oii.13.1574235282939;
 Tue, 19 Nov 2019 23:34:42 -0800 (PST)
X-Received: by 2002:aca:1702:: with SMTP id j2mr1485398oii.13.1574235282688;
 Tue, 19 Nov 2019 23:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-14-marcandre.lureau@redhat.com>
 <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
In-Reply-To: <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 11:34:31 +0400
Message-ID: <CAMxuvawroZ0jrQTJCbakft21Lgk2cHrE9VyihiUvYBVp+AXgXw@mail.gmail.com>
Subject: Re: [PATCH v3 13/33] serial: start making SerialMM a sysbus device
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: JvqCm76TMpyuAgjzXWM5Bg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: croCL/72LmAR

Hi

On Mon, Nov 18, 2019 at 6:43 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Memory mapped serial device is in fact a sysbus device. The following
> > patches will make use of sysbus facilities for resource and
> > registration.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/omap_uart.c      |  2 +-
> >  hw/char/serial.c         | 47 ++++++++++++++++++++++++++++------------
> >  hw/mips/boston.c         |  2 +-
> >  hw/mips/mips_malta.c     |  2 +-
> >  include/hw/char/serial.h | 20 ++++++++++++-----
> >  5 files changed, 51 insertions(+), 22 deletions(-)
>
>
> > -SerialState *serial_mm_init(MemoryRegion *address_space,
> > +SerialMM *serial_mm_init(MemoryRegion *address_space,
> >                              hwaddr base, int it_shift,
> >                              qemu_irq irq, int baudbase,
> >                              Chardev *chr, enum device_endian end)
> >  {
> > -    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
> > -    SerialState *s =3D SERIAL(dev);
> > +    SerialMM *self =3D SERIAL_MM(qdev_create(NULL, TYPE_SERIAL_MM));
> > +    SerialState *s =3D &self->serial;
> >
> > -    s->it_shift =3D it_shift;
> > +    self->it_shift =3D it_shift;
> >      s->irq =3D irq;
> > -    qdev_prop_set_uint32(dev, "baudbase", baudbase);
> > -    qdev_prop_set_chr(dev, "chardev", chr);
> > -    qdev_prop_set_int32(dev, "instance-id", base);
> > -    qdev_init_nofail(dev);
> > +    qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
> > +    qdev_prop_set_chr(DEVICE(s), "chardev", chr);
> > +    qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> > +
> > +    qdev_init_nofail(DEVICE(s));
> > +    qdev_init_nofail(DEVICE(self));
>
> Something odd is going on here. This is a convenience
> wrapper around creating the SERIAL_MM device, so it's
> correct that it has to init DEVICE(self). But it should
> not be doing anything with the internals of 'self'.
> It's the instance_init/realize of the SERIAL_MM object that should
> instance_init/realize the 'self->serial' object. You have the
> code below to do the 'instance_init' in the serial_mm_instance_init
> function, but are missing the equivalent realize code.

This should be addressed later with "serial-mm: use sysbus
facilities". I'll add a comment.

>
> > -    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
> > +    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], self,
> >                            "serial", 8 << it_shift);
> >      memory_region_add_subregion(address_space, base, &s->io);
> > -    return s;
> > +
> > +    return self;
> > +}
> > +
> > +static void serial_mm_instance_init(Object *o)
> > +{
> > +    SerialMM *self =3D SERIAL_MM(o);
>
> 'self' is not idiomatic for the name of the variable containing
> the pointer to the object in QOM code ("git grep '\Wself\W' hw"
> shows no uses of it at all, which is quite unusual for us --
> usually the codebase has at least a few uses of any non-standard
> way of writing something ;-))
>
> Usually we use something approximating to the abbreviation
> of the type name, so here 'smm' would do.

I would prefer something more straightforward than having to come up
with various name mangling.

Imho, we loose some readability, consistency & semantic by not naming
the object argument of the method "self"

>
> > +
> > +    object_initialize_child(o, "serial", &self->serial, sizeof(self->s=
erial),
> > +                            TYPE_SERIAL, &error_abort, NULL);
> >  }
>
> thanks
> -- PMM
>

