Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1847050lfc;
        Wed, 20 Nov 2019 03:15:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwggqDSJHXbP2mhORLoksHksJoGY28fAS+WQm0MEA08U8gIY5AUKhySIwA4GzYK+Dl4vpQW
X-Received: by 2002:a17:906:134c:: with SMTP id x12mr4765729ejb.269.1574248534537;
        Wed, 20 Nov 2019 03:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574248534; cv=none;
        d=google.com; s=arc-20160816;
        b=rsPIGreIrX9sEAvsIheBQ+TfIy3h8HiLqtTJJiYBH71RZREu+n0F458Barsl64gEId
         HWo4/jFbU3e7aOhTXN8xpGDKMFihhiCwvX6rc+CKKIm/45NahL/n2m85vx7PKgkJx8Zu
         Q+tsXrtSzso+gnSAcGHr/NxEEpKzU4lVR+AK41o3yR4JzeW0VxQpQjnnGW7gR/uZgwEv
         H2Zqg85xVcpe5GIYfzrRV7vR58X7yywFpSKaa4AMH/Vt1cCthdHzsOqlxIhY/uMEpku4
         aj2DH+sH7l/tD5xicAhSMEmisvTrrD3uSigEwihfevfU3f8Dd4hDWJ80nMgiZL6Dci5K
         Q8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=F8JScVDCxeFL0hAEAFur6V/NaAmZm80CZ0SXrq1ZfYI=;
        b=IbXdjF4i3cFbVl9Ayt6oFk5G8fnjPGnN0gd6mrs1idatSnSfk4goQEvPswcCbVyq6a
         PKWii09ZkQ5pnXa8G/QNRnE5P//Wtw1RIm3eKT+Yp5ZzNFLhY1Z46K/E7XGpY+cvOanv
         GpYxlbz1Gr6GvaiqX6Fbktuw3e4BfQzCIlx6Mu5f4eYhb94QsLqg3Fg7syPQCYJAyQUR
         caWJwUh726nbOi7DnowxLTpc0LW5w18nWxiuxisc5ODIvdAvWA2hkMC6di1k3+aEGQ3I
         8tqVcjCNtKhwgHAiLzUUNvf17HJE3zI3Be/OC/e72dMhzq8fgW7JWGcWKIJJ/RMtRacx
         PVIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XoVPB1Py;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si13051234edo.349.2019.11.20.03.15.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 03:15:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XoVPB1Py;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXNxN-0005BE-BO
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 06:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXNxA-00059k-2m
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 06:15:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXNx8-0004P0-1C
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 06:15:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48103
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXNx7-0004MI-Tl
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 06:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574248515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8JScVDCxeFL0hAEAFur6V/NaAmZm80CZ0SXrq1ZfYI=;
 b=XoVPB1PyaeDjp8G88wkCZNWO38KWisuFYfw/G01moJH/wPE7kErXaL5KJdxvPqPAQtB7Bk
 eLdZNXdRJ+t5SdHJEMeERaTKqbKrhhomY2v6U+jGm6zG0qp1rMsP/ZkdUuAHao9XNQuaRO
 kQozs6fIj+aktJQa3qVBs+0Z7cVIUmQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-mVP8YRbvMJqXQCVE9ETQJw-1; Wed, 20 Nov 2019 06:15:10 -0500
Received: by mail-oi1-f197.google.com with SMTP id n30so12311813oij.9
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 03:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F8JScVDCxeFL0hAEAFur6V/NaAmZm80CZ0SXrq1ZfYI=;
 b=Wq2Jad/bJRaCKnyE6CspSY3nEvOoM0RPkJBSp7akluY4QLJM4bThZsQuoIPiof942Y
 FvyYmRlhpxyvTOaN36NBjI3mODhnQE7dM7TsinkMRlN17cRnB283VfLSM8uAEAIKQ5Vn
 qoNIPMypoQpQOggER0q3pITy2gpX/BuOcJQRuBC3xaHALobUBu7gWcy8Z+XDlFTBKwmD
 HDGe9ejC1DUijAgF1gBFmz9hDcyA2X4PM4Syu4PtdxvV3l2+0xDROqgBUTtl+wg2S8bn
 fPcenCtpaDc9xw1r7baRffb5517uFX/nr8eqcqSJKhScC55Yykw8dc9W3YgBVYCZDsQU
 7dsQ==
X-Gm-Message-State: APjAAAVSUX8l50nn5q8G8nIz3wesMVhLkxBxMHN8+sdy8YW69faueUHQ
 63yVwvzL6delmnwrBAWH2LBKQHohXsNR59wedKh0GE6jDLcJow6mlWz8JLh9939shEQieYSJLVA
 u1vMEoipBJCj2cfPUMkODdVlxc8zz
X-Received: by 2002:aca:484e:: with SMTP id v75mr2347929oia.6.1574248509361;
 Wed, 20 Nov 2019 03:15:09 -0800 (PST)
X-Received: by 2002:aca:484e:: with SMTP id v75mr2347895oia.6.1574248508897;
 Wed, 20 Nov 2019 03:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-19-marcandre.lureau@redhat.com>
 <CAFEAcA8WacEjmNT93MYyheqh8U=+7zrDbrQ1jzVO+dWdrNkVyw@mail.gmail.com>
In-Reply-To: <CAFEAcA8WacEjmNT93MYyheqh8U=+7zrDbrQ1jzVO+dWdrNkVyw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 15:14:57 +0400
Message-ID: <CAMxuvayF+_cJdzLtSmq6iGCuXErT-fGVxk926sRrNnjv-tXQ0w@mail.gmail.com>
Subject: Re: [PATCH v3 18/33] mips: inline serial_init
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: mVP8YRbvMJqXQCVE9ETQJw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: QWfX9uU6HQ8j

Hi

On Mon, Nov 18, 2019 at 7:25 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > The function is specific to mipssim, let's inline it.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/serial.c         | 16 ----------------
> >  hw/mips/mips_mipssim.c   | 13 ++++++++++---
> >  include/hw/char/serial.h |  2 --
> >  3 files changed, 10 insertions(+), 21 deletions(-)
> >
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index 84de2740a7..ca95e09ec9 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -1023,22 +1023,6 @@ static const TypeInfo serial_io_info =3D {
> >      .class_init =3D serial_io_class_init,
> >  };
> >
> > -SerialIO *serial_init(int base, qemu_irq irq, int baudbase,
> > -                         Chardev *chr, MemoryRegion *system_io)
> > -{
> > -    SerialIO *self =3D SERIAL_IO(qdev_create(NULL, TYPE_SERIAL_IO));
> > -
> > -    qdev_prop_set_uint32(DEVICE(self), "baudbase", baudbase);
> > -    qdev_prop_set_chr(DEVICE(self), "chardev", chr);
> > -    qdev_prop_set_int32(DEVICE(self), "instance-id", base);
> > -    qdev_init_nofail(DEVICE(self));
> > -
> > -    sysbus_connect_irq(SYS_BUS_DEVICE(self), 0, irq);
> > -    memory_region_add_subregion(system_io, base, &self->serial.io);
> > -
> > -    return self;
> > -}
> > -
> >  static Property serial_properties[] =3D {
> >      DEFINE_PROP_CHR("chardev", SerialState, chr),
> >      DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
> > diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
> > index 282bbecb24..26fb8fa4de 100644
> > --- a/hw/mips/mips_mipssim.c
> > +++ b/hw/mips/mips_mipssim.c
> > @@ -40,6 +40,7 @@
> >  #include "hw/loader.h"
> >  #include "elf.h"
> >  #include "hw/sysbus.h"
> > +#include "hw/qdev-properties.h"
> >  #include "exec/address-spaces.h"
> >  #include "qemu/error-report.h"
> >  #include "sysemu/qtest.h"
> > @@ -219,9 +220,15 @@ mips_mipssim_init(MachineState *machine)
> >       * A single 16450 sits at offset 0x3f8. It is attached to
> >       * MIPS CPU INT2, which is interrupt 4.
> >       */
> > -    if (serial_hd(0))
> > -        serial_init(0x3f8, env->irq[4], 115200, serial_hd(0),
> > -                    get_system_io());
> > +    if (serial_hd(0)) {
> > +        DeviceState *dev =3D qdev_create(NULL, TYPE_SERIAL_IO);
> > +
> > +        qdev_prop_set_chr(dev, "chardev", serial_hd(0));
> > +        qdev_prop_set_int32(dev, "instance-id", 0x3f8);
> > +        qdev_init_nofail(dev);
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[4]);
> > +        sysbus_add_io(SYS_BUS_DEVICE(dev), 0x3f8, &SERIAL_IO(dev)->ser=
ial.io);
> > +    }
>
> The code being inlined here doesn't seem to be identical to the
> code in the function above (it uses sysbus_add_io() rather than
> memory_region_add_subregion()).

sysbus_add_io() is memory_region_add_subregion(get_system_io(), ...).

I went a step too fast, let's make it a seperate patch to clarify it then.

>
> It's also a bit ugly that the code has to reach into the
> internals of the device to get the MemoryRegion pointer.
> Would it work to have the device use sysbus_init_mmio()
> in its init or realize method to register the IO port MemoryRegion,
> and then we could use sysbus_mmio_get_region() to get the
> MemoryRegion pointer ?

Sure, seems fine to me. The caller must have extra knowledge of the
memory region number though. This seems a bit fragile to me, compared
to static compilation checking.

>
> (If that does work, we should someday refactor
> sysbus_add_io() so that all the devices it's used with
> register the MemoryRegions that way, and then sysbus_add_io()
> can just take an 'int n' the way sysbus_mmio_map() does.
> But not today.)

I see, left for another day

