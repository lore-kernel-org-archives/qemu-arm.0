Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp512375wrt;
        Thu, 22 Nov 2018 02:42:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5e6QLoexgtrqV4prW/FVN2ACHfn2depVVRuu7F0FZQZ7ub7oEKs8Q9TE7ExfVbx5H6hzyV9
X-Received: by 2002:a81:5142:: with SMTP id f63mr10496954ywb.11.1542883327570;
        Thu, 22 Nov 2018 02:42:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542883327; cv=none;
        d=google.com; s=arc-20160816;
        b=dBqdJQy/bsDvVvgwvBl/uA9X1esn6ObM1MXGHfbSzaElMf0hnellwgNX39rzppDnZS
         wPd2dtWTzEcaieXngJrNF8YJqb4UPUX7ezv9RufXb4268RlguX8cjihJiW8NHzibfQPb
         thJYJl6LxUVaRkojOeo5VBuAqDYPoA/cMcnad38Dfwb5vt6+nTLy0/MR+P9+lG9UcmE3
         F11/sBDIaWB5dgd4s5U/bTGy/SRYMzrX6z2MrkYdyHz010+FxatDCqZKlkphwsfMyrfs
         tvMQqZU0wVi4eetKMzRUtiA4edJ6ULXqoYIcvhqYAeGfZFD3xU260PQCMSa29UrJQWsD
         5asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=NQz+4H2SCCqLEVOGkgwo66yyRx2OcAOQq//9do4pBvE=;
        b=NtIifU+BT/MMcHfpEoJGSpiYY32YPDp8cVycQNIjkrir4+FqNhUMJsaboF+nddDHhn
         W5HA0P79pLVngdhC1hK8U8hAVrCWfaA+VWuZ/AlKTWMfdxe7MclCLHLpLhVQS7dA/9p7
         5rYN8zzNJhp3+1pQgKNT+QKPoB+d/49JmUOiyXuPEtO6lUQk6rnAaWmT8RtTXT3BoDpw
         +tfVZB5KYrDtwBIPMlNvs/Q4UFmW8Mtvqd4X5GXDuOBLUC7uxVv1VO7SzmsCZfgroJ6J
         4xRGP4oYBqregZdUVTWACYhfNxHFkOv5nnYn0e4B6qyiEvUGjM6FZlJCn1Mc+181wbdY
         7pNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=EIPch0Fi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si10960132ywe.426.2018.11.22.02.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 02:42:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=EIPch0Fi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPmQx-0007Vo-2w
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 05:42:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gPmQU-0007T0-AY
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 05:41:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gPmQT-0000eM-2u
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 05:41:38 -0500
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:38885)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gPmQQ-0000bu-Rq; Thu, 22 Nov 2018 05:41:34 -0500
Received: by mail-it1-x141.google.com with SMTP id h65so13190451ith.3;
	Thu, 22 Nov 2018 02:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t9JYX3TiWwTMyf6f5gga1ygeEYZqguDqRojo87pUtt8=;
	b=EIPch0Fi5E5UNeMi9ZEqASE057oX8gZpcz9Etyriyrt07Og8ryPZdX0ROXqlHqav0X
	XxzXDtVTBzBW7kAY/N2Bz4/t8/4sOyjNA0vqQDEigTekDZLZyI2zSQXZgQDgCdPEsFsN
	XQq0+bs1BphXzPK06it2bar2g4CWXkKqJyF057oh6eNwnib+sdigeHRzZsMmp3atRukx
	dgcAY+auQdARh4ZCyp3fahc2PPA7QnjXMM10FZvvwOBeA+FTL95/yo6vo9IAoX1ugqP2
	QatLNbXc3Z1opjdNkDfnqkYyWIoNAKb09SMr/yLrdIljOIRbShsgV1wYBb9lyATJSxzN
	b6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t9JYX3TiWwTMyf6f5gga1ygeEYZqguDqRojo87pUtt8=;
	b=hMcO5G84EiHcarFSuqrsZC/7BWu0VBaIogdyYHOoE/UOD3Ac1nc5sT7Pr5bV0tHbbE
	NA8QKy9VmfqNxVkvcicbDBhgeYAsDsI64H1p6uXmGqPgAQdJStNgQpt9Tqmam1ZDZmFf
	qNwFI8L+R+y8+QTtUbNzJ2o4D/1ZiOe9JqeOGDGI+UHS+37IVg83w+Tioo4f0N+CHEHg
	dov75PNJ9SNH+OzvGb2yllOXTThZBfZHSirNgzhOh9D+6Ade0REI0emJHAgXg6IBs5WI
	dzVMQm059NMiGeLpESiGzugt+jPEiyIv5t9fgyyO88BOkYXOBi9sFSDhVz64uf8f5cJG
	XMzA==
X-Gm-Message-State: AA+aEWZ4cAQjGVKQB7+8AQRCeXUOjeOEPL2LoSABa/6wR3vmNUIMSEf6
	5PHbFl+2vrI2V6ZAAxganVmSp5jYtjQ0sOYBDBk=
X-Received: by 2002:a24:c343:: with SMTP id
	s64-v6mr8554952itg.20.1542883294268; 
	Thu, 22 Nov 2018 02:41:34 -0800 (PST)
MIME-Version: 1.0
References: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
	<e61b7517-a736-8cb5-ce35-815225f18c52@redhat.com>
	<CAFEAcA8XgZRXyHkjWnOZ4d_yrqzWdxCDJjo6DtR+PTzx4t1cxg@mail.gmail.com>
In-Reply-To: <CAFEAcA8XgZRXyHkjWnOZ4d_yrqzWdxCDJjo6DtR+PTzx4t1cxg@mail.gmail.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 22 Nov 2018 18:40:58 +0800
Message-ID: <CAKXe6SJer_4EVPSc9gY0TMVmihMvX8=rmPRcP+4nvdyd+Sr8AA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] hw: arm: musicpal: drop TYPE_WM8750 in
 object_property_set_link()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: maozhongyi@cmss.chinamobile.com, Qemu Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	jan.kiszka@web.de, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emnwKQt2pEkK

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2018=E5=B9=B411=E6=9C=882=
2=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:38=E5=86=99=E9=81=93=EF=BC=
=9A

> On 22 November 2018 at 10:35, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
> wrote:
> > Hi Li,
> >
> > On 22/11/18 11:00, Li Qiang wrote:
> >> The third argument of object_property_set_link() is the name of
> >> property, not related with the QOM type name, using the constant
> >> string instead.
> >
> > You are correct.
> >
> >>
> >> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> >> ---
> >>  hw/arm/musicpal.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> >> index 9648b3af44..726ae29394 100644
> >> --- a/hw/arm/musicpal.c
> >> +++ b/hw/arm/musicpal.c
> >> @@ -1696,7 +1696,7 @@ static void musicpal_init(MachineState *machine)
> >>      dev =3D qdev_create(NULL, TYPE_MV88W8618_AUDIO);
> >>      s =3D SYS_BUS_DEVICE(dev);
> >>      object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
> >> -                             TYPE_WM8750, NULL);
> >> +                             "wm8750", NULL);
> >
> > Since this property is not related to migration,


This property is not related with migration.


> maybe we can resolve
> > this the other way, using TYPE_WM8750 in mv88w8618_audio_init():
> >
> > -- >8 --
> > @@ -255,3 +255,3 @@ static void mv88w8618_audio_init(Object *obj)
> >
> > -    object_property_add_link(OBJECT(dev), "wm8750", TYPE_WM8750,
> > +    object_property_add_link(OBJECT(dev), TYPE_WM8750, TYPE_WM8750,
> >                               (Object **) &s->wm,
>

No, just as Peter point out, the property can be arbitrary name, here use
'TYPE_WM8750'
makes confusion.



> > ---
> >
> > So using the same definition would protect someone to accidentaly renam=
e
> > the property name.
>
> I think I prefer Li's patch -- the property name is just
> an arbitrary name not related to the type name necessarily.
>
>
Agree.

Thanks,
Li Qiang


> thanks
> -- PMM
>
