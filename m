Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4045311lfi;
        Fri, 6 Mar 2020 02:49:01 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsGnakazi/gX6iwqQlSleo8fYeB9SYBJHzPNbx/FBrqu+zAGRfWWkl4EVFd9Qix6kciyZwr
X-Received: by 2002:a37:ad11:: with SMTP id f17mr2208389qkm.118.1583491741419;
        Fri, 06 Mar 2020 02:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583491741; cv=none;
        d=google.com; s=arc-20160816;
        b=MrY0n+tdwOKxLCoXELCPZL26EnuCC0vPd7nThi9HqXX9mEWy9tDINU/o7l6sdtztQl
         PhAb1ZugR80BOOUnYK2UUWVHA9jQcN66Ak1DVw9faVQxy97JWtFchZ8xnpFc32v4VQyu
         2w1zQqb8E6QADETKqYr5l38dJ9Uh1A/gvcWBSBsO83GYdlrPfdXxQtQDI68jjOLnZHjF
         pG2dgRZkiwgnbP41UiO1iC1WjXnt2EWXim5mSESDbVjigQKf++3W1NIOrnKkCxDubfjc
         MEEcD3/jGXPm5S4mbPm686k4T/c5p4bfcVSIb+n6daGwkuB5fNBMfj5Hqi2tBGeJId3W
         6j5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=PvDM6ihZuAaTRGH5fOIJ/fhyCSjNoaXL0TEZo43taJ0=;
        b=dc+TSBfU4HJtyQc7Cb7zvShxXPRWoMEj5utnALL3iNPNdEhjmdLZdcdurmkItZxMr3
         NREPmEA/DhqK94Y7qLxYZOJuwogwk3/jE6l4cvohlXIDWay0NOtpFniOeKMFsflqboQ0
         t5qqEeMB8H6xBNZb77Q9PSS80KASCVr6Ns6gUP1LodXuIQ8Dd0zqh5eeTzWPSFJUlUFa
         FxtHbcqU/2HW0F4b6HauzLD9rP8/YvXQSS16Mvp/AmpygVdT1oA7yzPcj3zARCwTY5Uh
         NsuW3AzpTgbetxVv9OW3idaFKSfHdHtm/R8t4oU8X/wu7zdrIjCDldNzNlLwG8R1cqDE
         plwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Qd4ctvt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i195si1032184qke.236.2020.03.06.02.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 02:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Qd4ctvt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAAXM-0002Cn-SO
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 05:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jAAX9-0002AW-E5
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 05:48:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jAAX8-0008Bw-8g
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 05:48:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31128
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jAAX8-0008Ak-5K
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 05:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583491725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PvDM6ihZuAaTRGH5fOIJ/fhyCSjNoaXL0TEZo43taJ0=;
 b=Qd4ctvt/vycnm0NWvV2za1Q82+M/HVE8gs2FvgRBK4IeT4veWDslWlk4vhbLZCemHjb92Q
 36QTp/zUwjkIGQLVfY7GFtUm2rvumnZ7Vs8DLBH21LggG93zIGqlRhovIDUuZA4flVsqDL
 kK6ILgymoAsBmhzPcDc/db7yVfh8Mqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-JcM9Iv4DNbe2D0IEgRtCrA-1; Fri, 06 Mar 2020 05:48:42 -0500
X-MC-Unique: JcM9Iv4DNbe2D0IEgRtCrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 089168017CC;
 Fri,  6 Mar 2020 10:48:41 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4777277B6;
 Fri,  6 Mar 2020 10:48:39 +0000 (UTC)
Date: Fri, 6 Mar 2020 11:48:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/arm/cubieboard: make sure SOC object isn't leaked
Message-ID: <20200306114838.27603031@redhat.com>
In-Reply-To: <aef518d0-d8e5-7972-0530-8f8a4c64f1e1@redhat.com>
References: <20200303091254.22373-1-imammedo@redhat.com>
 <aef518d0-d8e5-7972-0530-8f8a4c64f1e1@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, drjones@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8JDVRZGFMmTk

On Fri, 6 Mar 2020 11:33:07 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 3/3/20 10:12 AM, Igor Mammedov wrote:
> > SOC object returned by object_new() is leaked in current code.
> > Set SOC parent explicitly to board and then unref to SOC object
> > to make sure that refererence returned by object_new() is taken
> > care of.
> >=20
> > The SOC object will be kept alive by its parent (machine) and
> > will be automatically freed when MachineState is destroyed.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reported-by: Andrew Jones <drjones@redhat.com>
> > ---
> >   hw/arm/cubieboard.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> > index 089f9a30c1..12f8ac798d 100644
> > --- a/hw/arm/cubieboard.c
> > +++ b/hw/arm/cubieboard.c
> > @@ -30,9 +30,14 @@ static struct arm_boot_info cubieboard_binfo =3D {
> >  =20
> >   static void cubieboard_init(MachineState *machine)
> >   {
> > -    AwA10State *a10 =3D AW_A10(object_new(TYPE_AW_A10));
> > +    AwA10State *a10;
> >       Error *err =3D NULL;
> >    =20
>=20
> What about using object_new_with_props similarly to commit e4c81e3a451f?
I prefer explicit object_property_add_child() and would use
above only if there are list of properties to feed to it.


>      a10 =3D AW_A10(object_new_with_props(TYPE_AW_A10, OBJECT(s), "soc",
>                                         &err, NULL));
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>=20
> > +    a10 =3D AW_A10(object_new(TYPE_AW_A10));
> > +    object_property_add_child(OBJECT(machine), "soc", OBJECT(a10),
> > +                              &error_abort);
> > +    object_unref(OBJECT(a10));
> > +
> >       object_property_set_int(OBJECT(&a10->emac), 1, "phy-addr", &err);
> >       if (err !=3D NULL) {
> >           error_reportf_err(err, "Couldn't set phy address: ");
> >  =20
>=20

