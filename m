Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1151125wrm;
        Fri, 18 Oct 2019 09:37:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtl1igtim++/bnfdqgfvo1AXh/5B9UJsfGKly+5Rhr+RSgWpkG0QDEvMtP+Z4sMAut0s7F
X-Received: by 2002:a50:cb85:: with SMTP id k5mr10505463edi.131.1571416637992;
        Fri, 18 Oct 2019 09:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571416637; cv=none;
        d=google.com; s=arc-20160816;
        b=dEe8arFdvCH0k/24mO96ekcPvwBZ8/1lTVha11h+NWZ1quIRZLt22oBzYy/+A0v1ae
         fTSlIIOr1xoJSfQtAsU0T4WUMFjcUwfLYNxREqqJw59BPpB2DRj0C6skeHmRYdnKoScA
         nvOLnRqXTCw+73c7W1XoxgAgjXH2pAdmo3UOSwPQPUbl0ZkT9LnlDaeJ+4busYrQxuQo
         3XNOWeYLG0ziz1oTJuxRAVYYuxrgtdBzHgrjEboTgobbb5Mw2AAYubLgLhk5PGRsOtOW
         gqRWIJ85stmhA/Xh2WYWRp8xndYyW7Sxu8GZNjSdMJ+VRhYzVanG6ZbCykgHC6b9py/3
         sZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=LBwqDq2Dfi8/fiiAuID7RbJbgMcQBilq2FJMHLHi0VU=;
        b=bF8siU4Rl7IrbaLGgjtWbDm8mve/h6v3a8M68i3IHHj9nkoTFgbUPaFBxKCvaywhmY
         ge3VRqnckVAUQLQKJR++h0uXr7TJlHW6Uo0oNqsU5X9FvvrFua0PKGJ0RoZJpUKKrb/7
         7P+LldCsofnJrsQGQjXZ+4Z0QzMKbII/AMPuMhSvj+35djiHtScV738/xWQhZuUiw36l
         0G3a3xkkcsXnRLOGiB5oJIr7MY3yDFlmUHDd1O7EQegngXghvMcH4go59ZV72woeCxBX
         uMa80RN8mcu0EMyB3zJ+1xvI+n6gpFHmXn6Y40UVUnjr1stE0mLLUnnKcgJ3LGGoig6H
         Ge4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si4536923edj.354.2019.10.18.09.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVFc-0003th-SX
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 12:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iLVFL-0003iC-Cg
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iLVFJ-0003av-SC
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:36:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iLVFJ-0003Zd-Jk
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:36:57 -0400
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E34A4ACDF
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 16:36:56 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id u64so3514344oie.20
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 09:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LBwqDq2Dfi8/fiiAuID7RbJbgMcQBilq2FJMHLHi0VU=;
 b=nnllpo9K7Z0TSYAHL1SN3lQuntJ7D5Ap29dl5lHAyBgT+c6KFOmaNvHm/KvQUdtMbU
 iqDTy6LTNWxMI+tsLJJhJS5QgmUX4dspUFdMu2ylKN8GQHMzwJ2NADbwf5BOAvxQj/tt
 McY50CDeNpueKxMMaiuWzgdWdn/sfRfUazFOAFYx4ZVDoH7JovEKvt/5QNgPWZcx38Ws
 nrPxT30L7LfgpcbSvqpilfOCCdozik6SMP68236RTRLeZUUgKayOYQn9FRX4nEtpRNWB
 IqSMWEV9frNP+F7GyJy30/LP6EtR7NbrKcvyZs59Cy0HZZwfwAUaj7iXqaoVDWy0KNeK
 RRKQ==
X-Gm-Message-State: APjAAAWWJ8wb+QWCU8OTOEHSUsX+3RxdPS87Fd82B69GzHTAomukZH9m
 +o5ldFjsmbq5VPHj7CFITUJRDp7QKvlyu7P9Q/BRT3OImh2WmjXJ0f5Y/h74i9IjbA1eT1zrSRj
 dHVUSYWfLkZ2sFa9tqLdzuefxzf3d
X-Received: by 2002:aca:f356:: with SMTP id r83mr8512334oih.13.1571416615548; 
 Fri, 18 Oct 2019 09:36:55 -0700 (PDT)
X-Received: by 2002:aca:f356:: with SMTP id r83mr8512290oih.13.1571416615150; 
 Fri, 18 Oct 2019 09:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-2-marcandre.lureau@redhat.com>
 <CAFEAcA_7zxe6YfM6c8v_SQ+qh2L7Q5RS_xEPvy01q9aPZ6YyiQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_7zxe6YfM6c8v_SQ+qh2L7Q5RS_xEPvy01q9aPZ6YyiQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 18 Oct 2019 18:36:43 +0200
Message-ID: <CAMxuvaw2CMqOuGXVq4Gk+GDNrjq++Ho+460WN9yo-pJFPVZhjw@mail.gmail.com>
Subject: Re: [PATCH 01/14] sm501: replace PROP_PTR with PROP_LINK
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: zEFiaRnz4hT+

Hi

On Fri, Oct 18, 2019 at 6:22 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Fri, 18 Oct 2019 at 16:42, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/display/sm501.c | 5 +++--
> >  hw/sh4/r2d.c       | 3 ++-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> > index 1f33c87e65..a87d18efab 100644
> > --- a/hw/display/sm501.c
> > +++ b/hw/display/sm501.c
> > @@ -1930,7 +1930,7 @@ typedef struct {
> >      SM501State state;
> >      uint32_t vram_size;
> >      uint32_t base;
> > -    void *chr_state;
> > +    Chardev *chr_state;
> >  } SM501SysBusState;
> >
> >  static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
> > @@ -1968,7 +1968,8 @@ static void sm501_realize_sysbus(DeviceState *dev=
, Error **errp)
> >  static Property sm501_sysbus_properties[] =3D {
> >      DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
> >      DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
> > -    DEFINE_PROP_PTR("chr-state", SM501SysBusState, chr_state),
> > +    DEFINE_PROP_LINK("chr-state", SM501SysBusState, chr_state,
> > +                     TYPE_CHARDEV, Chardev *),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> > index ee0840f380..5780ee85d9 100644
> > --- a/hw/sh4/r2d.c
> > +++ b/hw/sh4/r2d.c
> > @@ -272,7 +272,8 @@ static void r2d_init(MachineState *machine)
> >      busdev =3D SYS_BUS_DEVICE(dev);
> >      qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
> >      qdev_prop_set_uint32(dev, "base", 0x10000000);
> > -    qdev_prop_set_ptr(dev, "chr-state", serial_hd(2));
> > +    object_property_set_link(OBJECT(dev), OBJECT(serial_hd(2)),
> > +                             "chr-state", &error_abort);
> >      qdev_init_nofail(dev);
> >      sysbus_mmio_map(busdev, 0, 0x10000000);
> >      sysbus_mmio_map(busdev, 1, 0x13e00000);
>
> We have a typed way of passing a Chardev to devices:
> use qdev_prop_set_chr(). Unfortunately it's not trivially
> easy to drop in here, because it sets a property defined
> with DEFINE_PROP_CHR to set a field of type CharBackend
> (note, not Chardev, and not a pointer) in the device struct.
> But serial_mm_init() wants a Chardev*, because it is a
> non-QOM interface to the serial device and is manually
> doing the qemu_chr_fe_init() that connects the Chardev
> to its own CharBackend. The QOM CHR property setter wants
> to do that qemu_chr_fe_init() itself.
>
> So I think the right fix here is to properly QOMify the
> code which is not QOMified, ie hw/char/serial.c, in a
> way that means that the various "memory mapped 16650-ish
> devices" we have can use it and can define a
> TYPE_CHARDEV property.

I see, I can look at that.

> In general I think our uses of PROP_PTR are code smells
> that indicate places where we have not properly converted
> code over to the general approach that the QOM/qdev
> design desires; but we should be getting rid of PROP_PTR
> by actually doing all those (difficult) conversions.

I think all user_creatable =3D false are smelly in that regard.

> Merely removing PROP_PTR itself by rephrasing the dubious
> inter-device connections in a way that makes them harder
> to grep for doesn't seem to me to be necessarily worth

grep for user_creatable =3D false

> doing. Is the existence of PROP_PTR getting in your way
> for a change you want to make ?

Yes, I am looking at improving the qdev vs object and class vs
instance properties. I have a larger series of wip refactoring. This
initial series is preliminary cleanup that would help.
