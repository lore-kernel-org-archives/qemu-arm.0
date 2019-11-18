Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp441709lfi;
        Mon, 18 Nov 2019 10:55:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfvoqR/0osrbXVX0/3B0X8e7h7Ir2kT2aJHfx1a8a9CXOZ+0QFN1uRZ6eh6njXObfmo5Hu
X-Received: by 2002:a0c:e647:: with SMTP id c7mr4355589qvn.93.1574103326171;
        Mon, 18 Nov 2019 10:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574103326; cv=none;
        d=google.com; s=arc-20160816;
        b=jnlfryqyNvX8NDWIYiYpDplvA5ZPyRKdW+Xev6EhtoAogM2VmWMbVkGZs5Jp8wwrg8
         S9niCR0+14U5lU3NwtTaZ2UYPlABFaiHL8+KfnSalzNDHoprN8aFLa6dQCHLPH6QzD7D
         Nr66l5/L12L9rcFSZ13gWM7CrZN9ZXCQYgstt+FNdFjgu0tfCBYx8pxXiufvEwr6we0v
         R6BARUsGJIoVYp6GeNQtbjLThLhUNaJaTmd2mmxYStzj9KxBJpSYeoCTlJ6S0Sdn9sEq
         4Kq5/XYdEsEOQCMkl1xnqY3xhEsVYDxqgjjQCPOQyTMMmWmsGkeg/OyS5zZ6/rvslpuv
         EvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2wuC6zZgRTcwujJGj51sXk4BJT33h+rRfRk2wdXELLE=;
        b=AxCW4sRLt56FbHNt2gtOcnIEWO8yF3zhG4z4c/hV2a3x9eGiqBigsp+mvWT+FRpace
         8KbMMqbQyv5SEgk1mASyRfdQQUPq2HrqEth4a8q7tFaKgrpHKtnCmYOmjx3ARAVPD7dF
         xyd7FQyZfXv7X6JeYs+Bi0KA1qlJHcgRuhWGJChhmAgOMpdJnb9yE1gtS8nDiRQ+m8zQ
         HmL/MrkrcNbV2STz9j0HJ9vDOVVJThCw5Ji/rcDYDZa22u5Emxg+ZiZBxqktqKZks6lb
         bGhW+gIulmDnFa3jXLlxyVySQ/hsYkBUPil9q+p9pYrCiVp4A/vVsd2kSLp3jI7kLzlE
         0jSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QCW/R3XI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si12030024qtq.123.2019.11.18.10.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 10:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QCW/R3XI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWmBJ-0006QR-6a
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 13:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iWmAy-00062u-8u
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 13:55:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iWmAx-00056B-2A
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 13:55:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53912
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iWmAw-00055i-Qz
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 13:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574103302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wuC6zZgRTcwujJGj51sXk4BJT33h+rRfRk2wdXELLE=;
 b=QCW/R3XIAy3woUD/B1QWGOlAACyiFYZDGS08M9a9rpOaPYFx6a5zf4mfmMf/n1CYCL6juI
 3Addqo0L9Hik6+aJIp6dCi1lO2W08BQ5G0NyWtVcI+dEPALqclxQFH/tR0BaGsX4nLLGNw
 Xajzr3R+KYcQ913R29llT0v79Wgk+1g=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-fZ4BOfdDPQmR3js_N49ExA-1; Mon, 18 Nov 2019 13:55:00 -0500
Received: by mail-oi1-f200.google.com with SMTP id s9so9212311oic.3
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 10:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2wuC6zZgRTcwujJGj51sXk4BJT33h+rRfRk2wdXELLE=;
 b=TgkbOj5UgqqSr434lWho73ZsJfm5Bt4JeGmb4rk40JAYQouCfo3Etu7wYcL1PEL21T
 VVTrZH0cInTE3Zjuw8POEbpwar4xT5YPyRfS+Ruf78lEJxfAUEElqwN6ndd3UzIF6gt4
 OiVaFIQu1v5tH8mCTBBMyAqzbC5NEo/l2B1H8YySxCggk3iNcthYTWfJKxGXx3jWClfx
 0gxUwB+yrYqXQG4/MyosEvXzuVFHYrPdjMPSPtEETvum9VdLKu5D096EGo5LiXJ7gsis
 0REeXeqOg5MMt1YsKQUPLtmMhZpip0y9DBiiAdR9gEnPAIItdVYmyZ3STWXEYq0FhuUN
 DBLA==
X-Gm-Message-State: APjAAAWUJi5hJRvRmmFa/qjvuTes8jASOojT/u5cKh7FceOWEQBw0uQQ
 uWSJGzsfY+8xAF1rX1Cm8I9FhvzUWr1yJ9B8TyOivnjy5SeSWIWIhcRl03e6+7Aokl1bitFxmup
 ozNrPgC6FJ/St4b8wEYOU6SFYZ2Se
X-Received: by 2002:a9d:67ce:: with SMTP id c14mr575266otn.38.1574103299667;
 Mon, 18 Nov 2019 10:54:59 -0800 (PST)
X-Received: by 2002:a9d:67ce:: with SMTP id c14mr575242otn.38.1574103299298;
 Mon, 18 Nov 2019 10:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-5-marcandre.lureau@redhat.com>
 <CAFEAcA9oV-fHLmh3uJTwJrQW60=HFQmRb_brkRpB5BYYVDqF+g@mail.gmail.com>
In-Reply-To: <CAFEAcA9oV-fHLmh3uJTwJrQW60=HFQmRb_brkRpB5BYYVDqF+g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 18 Nov 2019 22:54:48 +0400
Message-ID: <CAMxuvaxLKUYWjJTY0HN0zyFU-tFQk3_qTtvaQ9S9zDN6Xvg+Bw@mail.gmail.com>
Subject: Re: [PATCH v3 04/33] chardev: generate an internal id when none given
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: fZ4BOfdDPQmR3js_N49ExA-1
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
X-TUID: 1/4d279NRY7b

Hi

On Mon, Nov 18, 2019 at 6:12 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Internally, qemu may create chardev without ID. Those will not be
> > looked up with qemu_chr_find(), which prevents using qdev_prop_set_chr(=
).
> >
> > Use id_generate(), to generate an internal name (prefixed with #), so
> > no conflict exist with user-named chardev.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> > -Chardev *qemu_chardev_new(const char *id, const char *typename,
> > -                          ChardevBackend *backend,
> > -                          GMainContext *gcontext,
> > -                          Error **errp)
> > +static Chardev *chardev_new(const char *id, const char *typename,
> > +                            ChardevBackend *backend,
> > +                            GMainContext *gcontext,
> > +                            Error **errp)
> >  {
> >      Object *obj;
> >      Chardev *chr =3D NULL;
> > @@ -991,6 +992,21 @@ end:
> >      return chr;
> >  }
> >
> > +Chardev *qemu_chardev_new(const char *id, const char *typename,
> > +                          ChardevBackend *backend,
> > +                          GMainContext *gcontext,
> > +                          Error **errp)
> > +{
> > +    g_autofree char *genid =3D NULL;
> > +
> > +    if (!id) {
> > +        genid =3D id_generate(ID_CHR);
> > +        id =3D genid;
> > +    }
> > +
> > +    return chardev_new(id, typename, backend, gcontext, errp);
> > +}
>
> So presumably the idea is that chardev_new() now must be
> called with a non-NULL id (should it assert() that?),

Not, it can still be called with NULL (mostly for qmp_chardev_change()).

> and qemu_chardev_new() can be called with a NULL id, in
> which case it will create one ?

Right

>
> > +
> >  ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend=
,
> >                                 Error **errp)
> >  {
> > @@ -1003,8 +1019,8 @@ ChardevReturn *qmp_chardev_add(const char *id, Ch=
ardevBackend *backend,
> >          return NULL;
> >      }
> >
> > -    chr =3D qemu_chardev_new(id, object_class_get_name(OBJECT_CLASS(cc=
)),
> > -                           backend, NULL, errp);
> > +    chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
> > +                      backend, NULL, errp);
> >      if (!chr) {
> >          return NULL;
> >      }
> > @@ -1061,8 +1077,8 @@ ChardevReturn *qmp_chardev_change(const char *id,=
 ChardevBackend *backend,
> >          return NULL;
> >      }
> >
> > -    chr_new =3D qemu_chardev_new(NULL, object_class_get_name(OBJECT_CL=
ASS(cc)),
> > -                               backend, chr->gcontext, errp);
> > +    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(c=
c)),
> > +                          backend, chr->gcontext, errp);
>
> ...but if that's so, why are we calling chardev_new() here
> and passing a NULL pointer ?

Because it's qmp_chardev_change(), it's a transient state, the id is
set after, and reparenting too. The code could probably be structured
differently.

>
> How many callsites actually pass NULL, anyway? My grep
> seems to show:
>  * this qmp_chardev_change() call
>  * gdbstub.c
>  * hw/bt/hci-csr.c
>  * tests/test-char.c
>
> Maybe we should just make them all pass in ID strings instead ?

Well, in this case, we must be sure it doesn't conflict with user ID
(presumably with # prefix), or duplicate etc. Why not leave it to
id_generate() then?

