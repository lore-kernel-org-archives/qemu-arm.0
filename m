Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp91940lfi;
        Mon, 18 Nov 2019 06:12:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwoNgoyv2M9vWTjlmbNQUXMA6yMGMgHIADjPchO5GAuMP44+ZtX6vaMDXBRNwsv0ZIS8+uV
X-Received: by 2002:ac8:17e2:: with SMTP id r31mr28193445qtk.133.1574086346038;
        Mon, 18 Nov 2019 06:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574086346; cv=none;
        d=google.com; s=arc-20160816;
        b=gG5NmprN6uGkg4wCWX/jqJcKfOY4LZpX2SkIl2Njgof/Z61X5s2RVT7tZaScEsoa9u
         Xb/jw5AW54GQa9iR+eXlQADmOhC3R27jidTrrXfUEIuZk5iIpyuwpf43Fz1VtHpH/xje
         6ZnWm3FWljd/1bn1K+kEJnQknaLT8+RrNEDOui5OWksjJTw5+29+WB4B+cEwyQv+gEYu
         bVkpuqld27svKgSMNbi3zXYtCG1oclW5FKcXvbdR1FiijynYZfs1SijffOIiPhv6rgge
         GAviNVnaAMpdhXkjO493atJJs+tVqwOrTNGrcSxwJSoJkjU0FLuMiqTIHuOEcUbidNbC
         DqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fFnzt3koHgk6JHVK5bSTYoxjzZXzNfc38goaFNH8Ixw=;
        b=0f7kNIGEpfgDhswFHFE398+WkrEstR+9UAwSbXc2/h7JmvMq2bQ+wbfej+F+0Ron6W
         0HNy1pii+Q0YjmujDKH6cR0KUDuMn2a9+hZP0A1EViEVP2YWz1NarJC0Y2nkurNzR8Bu
         dxexm5ggovutGri8tGD1IWHuQIuhV/R/V5ngl7R3jJiCYpFD5qR6hxjwElxwerAHuU50
         CxzcB6/l2ytVm27vdBVEvHp6vfiqQdtXs7/Bgo7TTYIV4tPvWu58yFk3zXCJYbtCUuYB
         dSPi6gLFtKAo75krVq1PUlMOeBdF8y5y0wSwvlWBBSmbmzRIgFTITDxUitYtuC+LDFBs
         VoHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gWbx59MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si11285340qka.138.2019.11.18.06.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:12:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gWbx59MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWhlR-0005pm-2m
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhlH-0005oJ-7W
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:12:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhlF-0003Qj-UI
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:12:14 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34759)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhlF-0003QH-Ns
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:12:13 -0500
Received: by mail-oi1-x241.google.com with SMTP id l202so15441453oig.1
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fFnzt3koHgk6JHVK5bSTYoxjzZXzNfc38goaFNH8Ixw=;
 b=gWbx59MV6L7XF0X60iSsm6cTkvN3n67rqJjg3p4gg2dy/k6mXg3NOXjnqYtjgHDdDr
 Um9iP7E6iconcfhlypjaFU6cdbo+axwJ2KBc0DEpStly5hiqAqtJ6+lZGpxKyYK81LJG
 7sOr1UU56M09prWpbD0ny60jz8d3zwoS9s26TydKwmvML9x/0NmUbttlr2deT4arbd+L
 rn2PseM8+U9ETbPK0mexN261AcH8SENtHPqILQgzWUnDY0lQ+vZhR4xHXNQNYKw2P892
 UhAR2RpFHMw3V9tWFu7qmAeiip6W4/IUzy1kvlLQ215Rb6478YnjFWS8Ani/2nMmyH4B
 P0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fFnzt3koHgk6JHVK5bSTYoxjzZXzNfc38goaFNH8Ixw=;
 b=jpxli2lwBMczwb4mN428nFiIVzpCT/cPFRvviO9fZNBJ9XT2TQhZk/wcOzCRgFHIqf
 F6EdR9xWcEhQMO+4Ck6jfq7xVzsR/jKqAvyZtfVDJI4b01yftVb/Ak4tvX6qdU7x+hjn
 uVw0TS89kCvRHCIuZdlEhlRbFWAngdhTtHOVvAleZMFvFNvnLwI4KNw43+DDSktAOvgB
 fbewLRUSQD4IMvPt6cg69pqiKuMfyxW0QfaAWrsTg9fuBIeZHDeMe28K18nZ6Auv8/gv
 n6ouMtvD8ohy4INOymOgSl5ino2N0HsdEsvz04T866NGk3tJpVIah8F560CXLAHQSYkf
 j8Gw==
X-Gm-Message-State: APjAAAUvJhNlg9YlADBZ7qrgUlUTzlACtSY57RKdqB/AXRYJ/Efsiwbw
 cJdP1qmp9UK2MurjyAEQzKVv2BOf4AZ0HZx/v2IMoQ==
X-Received: by 2002:a05:6808:b04:: with SMTP id
 s4mr20588689oij.163.1574086332722; 
 Mon, 18 Nov 2019 06:12:12 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-5-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-5-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:12:00 +0000
Message-ID: <CAFEAcA9oV-fHLmh3uJTwJrQW60=HFQmRb_brkRpB5BYYVDqF+g@mail.gmail.com>
Subject: Re: [PATCH v3 04/33] chardev: generate an internal id when none given
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: SXGTRBss2Pad

On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Internally, qemu may create chardev without ID. Those will not be
> looked up with qemu_chr_find(), which prevents using qdev_prop_set_chr().
>
> Use id_generate(), to generate an internal name (prefixed with #), so
> no conflict exist with user-named chardev.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> -Chardev *qemu_chardev_new(const char *id, const char *typename,
> -                          ChardevBackend *backend,
> -                          GMainContext *gcontext,
> -                          Error **errp)
> +static Chardev *chardev_new(const char *id, const char *typename,
> +                            ChardevBackend *backend,
> +                            GMainContext *gcontext,
> +                            Error **errp)
>  {
>      Object *obj;
>      Chardev *chr =3D NULL;
> @@ -991,6 +992,21 @@ end:
>      return chr;
>  }
>
> +Chardev *qemu_chardev_new(const char *id, const char *typename,
> +                          ChardevBackend *backend,
> +                          GMainContext *gcontext,
> +                          Error **errp)
> +{
> +    g_autofree char *genid =3D NULL;
> +
> +    if (!id) {
> +        genid =3D id_generate(ID_CHR);
> +        id =3D genid;
> +    }
> +
> +    return chardev_new(id, typename, backend, gcontext, errp);
> +}

So presumably the idea is that chardev_new() now must be
called with a non-NULL id (should it assert() that?),
and qemu_chardev_new() can be called with a NULL id, in
which case it will create one ?

> +
>  ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
>                                 Error **errp)
>  {
> @@ -1003,8 +1019,8 @@ ChardevReturn *qmp_chardev_add(const char *id, Char=
devBackend *backend,
>          return NULL;
>      }
>
> -    chr =3D qemu_chardev_new(id, object_class_get_name(OBJECT_CLASS(cc))=
,
> -                           backend, NULL, errp);
> +    chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
> +                      backend, NULL, errp);
>      if (!chr) {
>          return NULL;
>      }
> @@ -1061,8 +1077,8 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
>          return NULL;
>      }
>
> -    chr_new =3D qemu_chardev_new(NULL, object_class_get_name(OBJECT_CLAS=
S(cc)),
> -                               backend, chr->gcontext, errp);
> +    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)=
),
> +                          backend, chr->gcontext, errp);

...but if that's so, why are we calling chardev_new() here
and passing a NULL pointer ?

How many callsites actually pass NULL, anyway? My grep
seems to show:
 * this qmp_chardev_change() call
 * gdbstub.c
 * hw/bt/hci-csr.c
 * tests/test-char.c

Maybe we should just make them all pass in ID strings instead ?

thanks
-- PMM
