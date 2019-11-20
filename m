Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1810593lfc;
        Wed, 20 Nov 2019 02:41:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyw7v0n4iMS9Cm4yvInaf3kSu5h90TINZp2uebeg77jIUpe1IOfuFX1dd0T8WXNtK/smNbT
X-Received: by 2002:a37:81c1:: with SMTP id c184mr1660488qkd.59.1574246479466;
        Wed, 20 Nov 2019 02:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574246479; cv=none;
        d=google.com; s=arc-20160816;
        b=f4ZjwVy91i2T8N0DBLmxuFxrCG2Cnj3yPdD1hl8OeWzFEM7m6oGVM9Sx6veKlWiGbZ
         JfvBgvcYMrF8Q7g4eORW4qmyL7Qc+2Fk4LJDb1gdBzC8Clq5BnX83Sj4x0FLe2pjqHJW
         zxWeQFVHke3o1w2jqQdY3l5mDrU+Cm39vczcLcpfpmtykNQA0ErKLnXc3n9DWbcx6xfl
         BnX/EKIFtWi3ohIh28l7XhnztC6rI5Qoe2zXOJGvLXR/l4ofyd8o9P91nffKZk83DbZq
         qsH68l8j9nzfRBhhokblKa1ywiYR4Gbb0X2wDrHb1TNGbHPHBrtDcisYAZ1Vyj8WtMEl
         dA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jdVziSE2yJjgCmCoewk2esye2yNz3gG8mZIZe2t2++c=;
        b=qRy+nS8mjKIeg7ebdH8hC8+LQCwQ6uRW7JlkFlyY7Tn60bKZgXt7rtmcnN6z9p+I0u
         52hlfzRlP8SRQZwjSz+IBX6PPxUTEU5ilWD4Du20BU18pNRvRtZ/S9KD9iFol8kqtqdc
         gddjeFSDBArXwbHGwKZFUtsRBxpkQrnO2u4VlhXcydBXaRPO69N1AnnFKQwEP59nhalj
         ShIzTbYztXK9g7EfFuwvi3V0pO6DJvate7fpnKA7lf129FVjBncKwu3O8F1wuShr+ZiR
         fLRrc8sptBY22I9Qx4y+j6KRPDwZnurWHFTGhaMwjbAKfffHZG8otttxXCaH8wzxsa0q
         HjmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mfrIgbyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si14889355qkm.307.2019.11.20.02.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 02:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mfrIgbyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXNQE-000760-9y
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 05:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iXNPs-00070B-N9
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:40:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iXNPr-0007s1-Bn
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:40:56 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iXNPo-0007nc-Pb; Wed, 20 Nov 2019 05:40:52 -0500
Received: by mail-wr1-x441.google.com with SMTP id l7so27518953wrp.6;
 Wed, 20 Nov 2019 02:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jdVziSE2yJjgCmCoewk2esye2yNz3gG8mZIZe2t2++c=;
 b=mfrIgbyK4rbIUtPKay5Tin7JAuHtVCEqdCxVenQN0h7k+Cml1PEFh2QITOun1aLBsj
 e3P81MqtqZN5Od9lxw6FaNDx2p1yvhBU7baVGs3aJvluAtMEjJmCFqcmgt8+/MZvFbgC
 z8JeMSnrYgK5gM8Zco9m6koU7v/UmfD4xJidWJ4z29qNitB6NFi0hwqNObPN/iFPFoPI
 JvyICNy/9tNBs8ZQH7CMYPvA3ldchA+vX5sl5OcSIg/y1pGXvnWxrxowKZ+tSiLgQumT
 H9ZLxHqnoJA9FDvw2NkPX1DPxJfTUI/cE9o6s+7kmRXSzxw90p8ufrwUDo5U/hNFxVVo
 vUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jdVziSE2yJjgCmCoewk2esye2yNz3gG8mZIZe2t2++c=;
 b=KKtDBKSJirVPbZJQsv0jgddNk7EuGFzYwD1RpCB9z+QUS5/fNaM8GcrhCyyJieNh2U
 4/c2X6tKUa8TROfQvVkBN3lxPaPqo60amU8BMCVPgU9w8vhTDe3Tp16vC1s0lh56gq9Q
 jG2nOFdWdjsxFEVRpmnkqcO6DzC3L/kuEh6qAax/hOd5InSNiHkMDBD+6oHkrSLYs83R
 cQ5rAFoqwP2TNoSR+BxDdIkDW7T6M0kHZjJ9UF2vxcyz8h7hoEjVy+EmiJ3S1tzmS51v
 hMnk7aBWQTW07VAEbLKi5aHlDXo80kU2iwpJCr0jXkc1lJYsUcWBx4oyMMatWlci1oeD
 8Yjw==
X-Gm-Message-State: APjAAAVWhI/7NKSA66457zYNKR7NxRcZtZrlV9/K6sOeZ/l3vPsbH8S0
 LOwp9Sb75Zq/z73bOkDqU9nY0E5RUqroIBPb8Zg=
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr2367608wrc.202.1574246450708; 
 Wed, 20 Nov 2019 02:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-14-marcandre.lureau@redhat.com>
 <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
 <CAMxuvawroZ0jrQTJCbakft21Lgk2cHrE9VyihiUvYBVp+AXgXw@mail.gmail.com>
 <CAFEAcA97LxS0LhCN-uqmO++D2U3dXBn3KctW7n-4tA-b50xKcw@mail.gmail.com>
In-Reply-To: <CAFEAcA97LxS0LhCN-uqmO++D2U3dXBn3KctW7n-4tA-b50xKcw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Nov 2019 14:40:37 +0400
Message-ID: <CAJ+F1CJGHeb2aT+8t7vEdB0bKZ8r6OAnnqpDdnkGbfDRcV=JjA@mail.gmail.com>
Subject: Re: [PATCH v3 13/33] serial: start making SerialMM a sysbus device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+6fKMp07D+W

Hi

On Wed, Nov 20, 2019 at 2:36 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 20 Nov 2019 at 07:34, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
>
> > > > +static void serial_mm_instance_init(Object *o)
> > > > +{
> > > > +    SerialMM *self =3D SERIAL_MM(o);
> > >
> > > 'self' is not idiomatic for the name of the variable containing
> > > the pointer to the object in QOM code ("git grep '\Wself\W' hw"
> > > shows no uses of it at all, which is quite unusual for us --
> > > usually the codebase has at least a few uses of any non-standard
> > > way of writing something ;-))
> > >
> > > Usually we use something approximating to the abbreviation
> > > of the type name, so here 'smm' would do.
> >
> > I would prefer something more straightforward than having to come up
> > with various name mangling.
> >
> > Imho, we loose some readability, consistency & semantic by not naming
> > the object argument of the method "self"
>
> There are two problems here:
>  (1) "self" gives no hint at all about whether it's the Object*,
> the DeviceState*, or the SerialMM*. All of those are the
> object the method is operating on, but the type differences matter.

"self" should have the type of the object that is being implemented.

serial_mm_instance_init ->  SerialMM *self

>
> (2) *Absolutely nobody anywhere else in any other device model
> is using the 'self' argument name*. It's not a convention if
> only this one file is using it, and adopting it here gives us
> absolutely no consistency -- exactly the opposite.

Since there is no clear convention, then adding "self" isn't breaking
any convention.

>
> Item (1) is part of why we do things the way we do; item (2)
> is why we should not make the 16550 UART some weird
> exception from the way we do things.

It's about trying to make things better, and not about staying in the
current undefined/free zone.

--=20
Marc-Andr=C3=A9 Lureau
