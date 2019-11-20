Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1652622lfc;
        Wed, 20 Nov 2019 00:01:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyI0xWsDzBnm8cDfSgbpAwJWrdfK6nC3QXXLY3D5VqzrnytJQ8+py6PHTBGzBLA4ZCTaJjC
X-Received: by 2002:a1c:6641:: with SMTP id a62mr1571177wmc.54.1574236891003;
        Wed, 20 Nov 2019 00:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574236890; cv=none;
        d=google.com; s=arc-20160816;
        b=05dXHGmc5SlyKOtxG0RIw6Hy4KQ0l76l8Qa1Oep3W9g9P7OawitsgdA/1jzQ0empAo
         yZ/FUQv88xJDcgf9bPs5ENhr8pjufdbXXP9Q08+Usqi9Ad+8MxCk1ww+vmNL8zQDD8fd
         NyxLXrPVWGzFREkbsbTmjAhF2if5agR0JynckYJpKd977hjD29bImPnr0rhoNifCh85J
         LH0fFd3RYWr26Jjx2J3vCCFk3xiNSpd6u6NFwIVXPMhT+Q8NdrW03Q4mFklPyI/APy1P
         uYP0YzxwwWOZ4M7yZaK5Kt/M0TBTxdT8dXSpQ2VPhJMzq6yq22DiFlnXjelw3Iorxgux
         tBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=F746zgA8JqqgChdMAqH+9H0HjT1putHM3OkKEsKa34s=;
        b=NVarzb/7WIbARy6tJcyzLShjkEiDvEbOS75RMDL9emYvdbpkjRhEvW9avxfbI4Tozz
         GAyjeXaZ0Bs3YrbRfRU/LhdUnIKKCGz03EjhU4/ouo4Af8lmx0OjOGrtPimakJen1gH8
         uZx6VJTxkQCeiRDH0nwWdpOUgvi8+lksxWFxjeDkFCjSEVOJ5c8kwdJG5xeRhyDHuQ2w
         xkRxnP2x7SaeAF5cHykiGIjgDMpy5NFDWCvhzZMy5yAgvnNb2DNebky0Qsw70enCOCUO
         6WwJTmfv4jepgyPgKYtbygiILpq2CL1TSWqobqcNLGxLyoEZqdiCNaA/Mlyg3st0T0FO
         0DCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cwJnRk6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si16080866edq.340.2019.11.20.00.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 00:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cwJnRk6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXKvZ-0002Zy-Vy
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 03:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38553)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXKuM-0001Q1-2e
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 03:00:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXKuK-0002Js-BT
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 03:00:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41794
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXKuJ-0002Ht-TY
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 03:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574236811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F746zgA8JqqgChdMAqH+9H0HjT1putHM3OkKEsKa34s=;
 b=cwJnRk6xg77uS3eOj6RDT/Rwh2CuaFT5T+PCb3W7no1wfeKvGl+aPsChLeDUqObU5QjvIr
 LpvjViFPQhMAlk4zTneGgSr7S4iA2PhTBTjb4Z4YiG25uAjLzdKrgIrJ59ZkH+hhKJAi6G
 vWWyjICM5CeRtUNxw2SFeDfHVAzhXrc=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-_NSJb-B4MpSmu8-vrqkJDA-1; Wed, 20 Nov 2019 03:00:09 -0500
Received: by mail-ot1-f71.google.com with SMTP id 109so13567248otv.1
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 00:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F746zgA8JqqgChdMAqH+9H0HjT1putHM3OkKEsKa34s=;
 b=RVJMz1yzwfxrCE7widPLrfITUR1roO4ivuljypXkDlyCUeRXk6rs75pg4LIf6sCAF6
 cM3uhoy6TrfefmgxiBlkm00rQ6Mu3Ht5h+x8kiY8dEdVINijpOxPsJrmdURlJLElsxBJ
 KEvWrAKDKScSyRbfyDB5ibwVNmrb/vBH01MRkae6qXZhVakEFxyvKu70QlZbYxJ1prSQ
 lJJyb2KsyoKv6IUq87rfhTnLk63fBRIk2+ZL+zKc37XYUMdg0JyXPciPPfmzE7qdxNT9
 y5nLX3jTDvsTlEWJr5hpGAMvAqyzr4WiKJmomhld3O1wrqz2UsZ7GRXm6/RnXlBzZD7S
 SYTg==
X-Gm-Message-State: APjAAAVxngGUsHO/6y67gZTHsNbDEltYjA+d0Gg7HMMGD3bmNwMp3ftT
 /HgzHHTIw+t8rdFbPElhbFBiwNuwfSRViDxOx/BANh/hFE1R+1v9WYVrQ30K/HH0+Kl9E4v4E1y
 I1JI3cpK6XNvBLFjL5yL3S9AapuGB
X-Received: by 2002:a9d:5388:: with SMTP id w8mr915229otg.368.1574236808550;
 Wed, 20 Nov 2019 00:00:08 -0800 (PST)
X-Received: by 2002:a9d:5388:: with SMTP id w8mr915206otg.368.1574236808364;
 Wed, 20 Nov 2019 00:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-16-marcandre.lureau@redhat.com>
 <CAFEAcA_e4byjW-zPWPWdwZX0qFwUesKo+FTFK6Y9_tMTejSsBQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_e4byjW-zPWPWdwZX0qFwUesKo+FTFK6Y9_tMTejSsBQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 11:59:56 +0400
Message-ID: <CAMxuvazCLfcWsWadPE0LP15Ej6k873FSD_rWJDRkeTf4xfzy6Q@mail.gmail.com>
Subject: Re: [PATCH v3 15/33] serial-mm: add endianness property
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: _NSJb-B4MpSmu8-vrqkJDA-1
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
X-TUID: A+xS/iolNAVP

On Mon, Nov 18, 2019 at 7:07 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Add a qdev property for endianness, so memory region setup can be done
> > in realize.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/char/serial.c         | 2 ++
> >  include/hw/char/serial.h | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/hw/char/serial.c b/hw/char/serial.c
> > index c28cfc94fd..2f7667c30c 100644
> > --- a/hw/char/serial.c
> > +++ b/hw/char/serial.c
> > @@ -1081,6 +1081,7 @@ SerialMM *serial_mm_init(MemoryRegion *address_sp=
ace,
> >      qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
> >      qdev_prop_set_chr(DEVICE(s), "chardev", chr);
> >      qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> > +    qdev_prop_set_uint8(DEVICE(s), "endianness", end);
> >
> >      qdev_init_nofail(DEVICE(s));
> >      qdev_init_nofail(DEVICE(self));
> > @@ -1102,6 +1103,7 @@ static void serial_mm_instance_init(Object *o)
> >
> >  static Property serial_mm_properties[] =3D {
> >      DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
> > +    DEFINE_PROP_UINT8("endianness", SerialMM, endianness, DEVICE_NATIV=
E_ENDIAN),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
>
> ...on reading patch 16, I just noticed that here in patch 15
> you define the 'endianness' property on the SerialMM object, but
> you're trying to set it on the SerialState object. This bug then
> gets fixed in passing in patch 16, but we should just be
> setting it on the right object to start with.

Correct! fixed.

thanks

