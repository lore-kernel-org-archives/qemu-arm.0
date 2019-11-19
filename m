Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp332067lfc;
        Tue, 19 Nov 2019 02:33:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwt/kpI57735bF65eODTA3tgIFW6r/Ujfr3ybQsMVC3DWxKY7jhkhdEdRHKLHAUk5YVfEg
X-Received: by 2002:a17:906:5fd0:: with SMTP id k16mr33798821ejv.243.1574159628419;
        Tue, 19 Nov 2019 02:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574159628; cv=none;
        d=google.com; s=arc-20160816;
        b=EwejJMknYhtrPOsbojoNlJ7DPLITXziSwwUjLe6rU2ReO81MhqlIX+DXU5DXc0B89A
         KoBV2Tg65aaZL2boBSkbZjfIk7Jzd2b+8QCIOtPKiIY/o0CTdbwA1i0YPqVCV3U5v70/
         kFN/HEP8TbD+HeRDX0gyTyRUyK8NedZ8BXFvUMUJFrHQFwNkw9JFGnrC028JhWNPfHrr
         j0//WMFSrHEQ3DkntQjeDfwoeVstQG6kLDUmYQ05w2De2TaS2SpKYGE+LggbXrv72/t/
         pd03kiR2AT88gYQ63AHPHTZ/pIr5KPCm2+eTAOcoP6iPut/R+TRED5NsVSPhIeA46671
         2cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3TUCNexgMfU/nLexGTBepoGvxwI+HbwU/fb1WjFGQUM=;
        b=NmQSTGFwmvgRdP1VkdDpMo2TmZ4gZ5ylDPTj5XQenbBeGRC3Wp6cwjmcjd3JpsFeBQ
         U5FD3SoKZ0Z87uD0U9XlniNwa7+woB9CUPH5iZUu+OVb3ZuN4QCfYYT8AgxSW+XUP8qi
         8Zy3pDkAUvlvN8sB7+9kNxgplRJGxyT1Al2i/b/SAG2vJ3ajvollSrW2ftqN/y0rBsQz
         fllX0Uu3d5bUUdeXDNr0Lhifnd++UQ4Vvo3hRFMRZJZoMBTqP932ebuHUUvCTUBm4VE6
         J87cGhMVcWSXOR8WZE1dwccToqCff9kVSNrS1IA+FTBA5+60HRjHkkbQeMNZVw3C+4FW
         BrwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TcFSGEle;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si13676893ejb.49.2019.11.19.02.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 02:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TcFSGEle;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX0pP-00065R-32
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 05:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iX0oO-0005hq-1n
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:32:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iX0oM-0007XM-7I
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:32:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43829
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iX0oM-0007Wv-3Q
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574159561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TUCNexgMfU/nLexGTBepoGvxwI+HbwU/fb1WjFGQUM=;
 b=TcFSGEleymwvhlaW+MxNDm8S0ix/qpiKHotPibKz+Kefu7qeW3+Sa07OpA4TA+GRZK4k8/
 m+en1arBiKg2/vH5WUa1vq7XQW15vHGgr/taHDT7lFOwILbj7hVpqg2f5iHPDwia/y/Kxx
 l4+cs21+dAldX2HZv5mYY68GFEHcEIA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-l3GbwZCRNE-JlKVzpgmfbA-1; Tue, 19 Nov 2019 05:32:40 -0500
Received: by mail-oi1-f200.google.com with SMTP id q82so10307248oih.14
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 02:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3TUCNexgMfU/nLexGTBepoGvxwI+HbwU/fb1WjFGQUM=;
 b=t+Mn+RVzPLs1vcZFACeHOAG5a/bFhknHwR670aPjYyG+yrGZH+A6AiVRaDC3EFCrYH
 rrf8rN25xUVNgg0l4sYwUSDHWzJB9RLHP7665w5rkQZPIxj75fAVYLHzynRCri/dEONK
 23OML3MhgJq154BhKq2CZ1D/hDnWFxR+CkwGNfEbTxwXZaO2nsk8c0RMKhpXrCwBR8kp
 apLrjCDVnQPVZ+U1FEs6O3vI+FXSI09/vRp0NhMuqU6pMc3GB10OO9r0w965y4nDY9cg
 z/D6+fQ/Lr3KefVUidY46O7YhmgEGwad3Xj8vOlxagQqXsuf8uOaLLXEHWxTOlOJnJ7/
 IG3Q==
X-Gm-Message-State: APjAAAUOtD7uFMxUYuJq/64O2wF1RNZsUoPbK4E/FY8HOzKRr9Qo+Hmf
 W6WKYR83Fp2a1JmAFWFYh+qnb0OgsEMYt6omCWGLtGdoGAoe83PTzM32VeCcBeg2CCkWFdz3HPh
 Jc4eOlBBomj/BbSIFDNzDYgm4YKUr
X-Received: by 2002:aca:62c6:: with SMTP id w189mr3532384oib.33.1574159559426; 
 Tue, 19 Nov 2019 02:32:39 -0800 (PST)
X-Received: by 2002:aca:62c6:: with SMTP id w189mr3532349oib.33.1574159559117; 
 Tue, 19 Nov 2019 02:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-11-marcandre.lureau@redhat.com>
 <CAFEAcA-vhJZSKH8hDsBYVi9WKMNOFL19Q+XrwRvp94uXMbyNbA@mail.gmail.com>
In-Reply-To: <CAFEAcA-vhJZSKH8hDsBYVi9WKMNOFL19Q+XrwRvp94uXMbyNbA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 19 Nov 2019 14:32:27 +0400
Message-ID: <CAMxuvaxkHpowe8ZLBiNpnN5QXOGU711FsR3iwWFYGAEL2WVZOQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/33] serial: add "instance-id" property
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: l3GbwZCRNE-JlKVzpgmfbA-1
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
X-TUID: qapYOSx7fuaW

Hi

On Mon, Nov 18, 2019 at 6:30 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > This property will be used to move common vmstate registration to
> > device realize in following patch.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/serial.c         | 3 +++
> >  include/hw/char/serial.h | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index 069d8715d0..0b61a71e4e 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -990,6 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
> >      s->irq =3D irq;
> >      qdev_prop_set_uint32(dev, "baudbase", baudbase);
> >      qdev_prop_set_chr(dev, "chardev", chr);
> > +    qdev_prop_set_int32(dev, "instance-id", base);
> >      serial_realize_core(s, &error_fatal);
> >      qdev_set_legacy_instance_id(dev, base, 2);
> >      qdev_init_nofail(dev);
> > @@ -1003,6 +1004,7 @@ SerialState *serial_init(int base, qemu_irq irq, =
int baudbase,
> >  static Property serial_properties[] =3D {
> >      DEFINE_PROP_CHR("chardev", SerialState, chr),
> >      DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
> > +    DEFINE_PROP_INT32("instance-id", SerialState, instance_id, 0),
>
> This could use an explanatory comment, because I have no
> idea what it does or when a user of the device would want
> or need to set it... (I am guessing that part of the answer
> may be "needed only by legacy users of this device that don't
> want to break migration compatibility" ?)

That's right, I'll add that comment.

>
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
>
> thanks
> -- PMM
>

