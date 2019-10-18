Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1165918wrm;
        Fri, 18 Oct 2019 09:50:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwl9ilfF5qPGAZmgs/HTJ49mspcR46ppnVXxqYnLO20LED75HZLSeM+DqcidTohDAlQ1br
X-Received: by 2002:ac8:1b54:: with SMTP id p20mr10717840qtk.8.1571417457318;
        Fri, 18 Oct 2019 09:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571417457; cv=none;
        d=google.com; s=arc-20160816;
        b=OJpc/nAIA/wNLz12S/ZRFBrEaqji+7033sPieVdkQ2c+uFnSvROA4/tjObZqrTL5yT
         APXM10BNbkcJvTzJioYcrrQneqj9Q/ToigRxkelEgMQjCMEsIyt94szhfP4hZB9EIpFn
         nUa4CT10C2MjALhXSlRcPIkUM8Mp7OB0AaiZNGS7492ooCcWptz/euaV2jZbnYNh/dhZ
         dX5Lhshi4/VINepo2oZlj7UBVtpp4RO9wjZC+/g76kgkjRUOlOEoQ1gx/w8I3LdrzGk0
         t6aoOmBpE8fy2EKk+2wo6Wmwp1K2chbrTSbMVePg7fKPvjhBnwEszI5qDNV/CzjKWnZ+
         6Rmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C4eO51fwA1ukbfwgea+E2N+xXGL/cfwgmawR3uZJAMs=;
        b=rNdGb3gRmSib42zP3txZwD9SnWtzdxl5LiOjZREtTRH3AIyciztcvDNPpDiLCwljhj
         Kowf4OWSwr+HSMEecNioVD3JG2rInd2GI8Sem1y3B+ggiOsa1L0JWQojE3+3vk4kYweL
         lFv9PsTCUrRf2rFCoq3C/RWqyvUI8cewCwJovY7sbRRsudXe8Rx3PQv2kPk4bX8eaDM2
         5z5Xg4Y82vXq56qpEALGLy32cq4Xq3MwI8czB7+tqdFb5iEhpq00aobG6UoffW7cdQKv
         LUr+NqAer5l4wde4Dv8nsg2ozChGRTHMwYt/YNs1s6qd/8gNc4qRr1WhocXFrON9Hd0d
         bfpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NMvjkleR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si5789093qka.86.2019.10.18.09.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:50:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NMvjkleR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVSq-0002a2-Ip
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 12:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVSd-0002XF-9J
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVSb-0000rV-UJ
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:50:43 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39767)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVSb-0000qr-Ly
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:50:41 -0400
Received: by mail-oi1-x244.google.com with SMTP id w144so5777714oia.6
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C4eO51fwA1ukbfwgea+E2N+xXGL/cfwgmawR3uZJAMs=;
 b=NMvjkleR5y8POmR0i9XQbuNlRFR2Vq2Vjzmay0avN+Xaazu0w2BXP25TUQHCqntCrV
 UeILQA5RjXuEYYT6spgx2i+bOlR6ST2Iq/PZZtncX+yG219PPYXynEnBtlGQcnjYc6js
 mTFCvyYmgA4NXVWkrpX1Fg5RjVG+cImIr6273f2JWyfCDXLon/XAVz+RqveqTyZawJCx
 Iu8PF3EEIL8lVU9Vyv1JylE8N4+VhhRGtENwb8/VJk8lZnKeTVRnWqdgUs+7U0iO421r
 4J/wcskVDeVuGhxupdE51bkIdMDDfeg+r8kjH+ap/gcVRmROXGyEmzJMy2GN4gpO25D0
 nwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C4eO51fwA1ukbfwgea+E2N+xXGL/cfwgmawR3uZJAMs=;
 b=nLjbXDCzabYde+gsBfMFesUgo6QnhAoyRk/qgy3MhG9XpETgcZYB4vvlQUZ/hbHR7R
 7xeoqM3gaaoPtArHxejRhWLPg5IlIn8kdS65fVzwqTtQ2VniqVpU5bLREocVKCBJleiM
 0UKUOybX8c+LtoZ2ECcYu5eAAlAsxRzPoMh09Ij598BWrwKyg8OhUlj+dsr9T03pBxyJ
 Mf0BcndhunH3lZE4j3jZNovNpCuWW/6yqlNeFTMuhGSYOS8OTO5NkPZNhUmwPunn/Itq
 EXxPOjqoK1SHuLix621BuezXVjFd3j+Ev6X74trWpHAY1U+RktNl9UtY+tIzOr4uAf6h
 A+SQ==
X-Gm-Message-State: APjAAAUpcOnXhDDK3oxtnFiAdgq3DmZ5mvieSQGgNUda6S5la93I1ztC
 mn0dZfwPDCLooBNSch20ODUT8lcL+iNcyybDDr5NpQ==
X-Received: by 2002:aca:2b08:: with SMTP id i8mr8464402oik.146.1571417440323; 
 Fri, 18 Oct 2019 09:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-2-marcandre.lureau@redhat.com>
 <CAFEAcA_7zxe6YfM6c8v_SQ+qh2L7Q5RS_xEPvy01q9aPZ6YyiQ@mail.gmail.com>
 <CAMxuvaw2CMqOuGXVq4Gk+GDNrjq++Ho+460WN9yo-pJFPVZhjw@mail.gmail.com>
In-Reply-To: <CAMxuvaw2CMqOuGXVq4Gk+GDNrjq++Ho+460WN9yo-pJFPVZhjw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:50:29 +0100
Message-ID: <CAFEAcA9fRzCKQp=KkqXHdrN69ZNhtuy=XU+MZHJsjP-smx6MzQ@mail.gmail.com>
Subject: Re: [PATCH 01/14] sm501: replace PROP_PTR with PROP_LINK
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: YcrLMylNoJPc

On Fri, 18 Oct 2019 at 17:36, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> On Fri, Oct 18, 2019 at 6:22 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> > So I think the right fix here is to properly QOMify the
> > code which is not QOMified, ie hw/char/serial.c, in a
> > way that means that the various "memory mapped 16650-ish
> > devices" we have can use it and can define a
> > TYPE_CHARDEV property.
>
> I see, I can look at that.

It would certainly be a nice cleanup/refactoring to have;
it's likely quite painful though as so many things use
serial_mm_init, many of them not properly QOMified themselves;
and because SerialState is used by x86 it's likely to be
tricky to handle for migration-compat reasons.

> > In general I think our uses of PROP_PTR are code smells
> > that indicate places where we have not properly converted
> > code over to the general approach that the QOM/qdev
> > design desires; but we should be getting rid of PROP_PTR
> > by actually doing all those (difficult) conversions.
>
> I think all user_creatable =3D false are smelly in that regard.

I dunno, I tend to think that "not user creatable" is the
default state of things. Almost all devices aren't user
creatable, because they need to be wired up and put at
suitable addresses and IRQ lines. Pluggable devices like
PCI, ISA, etc are the weird exceptions that are usefully
user-creatable.

> > Merely removing PROP_PTR itself by rephrasing the dubious
> > inter-device connections in a way that makes them harder
> > to grep for doesn't seem to me to be necessarily worth
>
> grep for user_creatable =3D false
>
> > doing. Is the existence of PROP_PTR getting in your way
> > for a change you want to make ?
>
> Yes, I am looking at improving the qdev vs object and class vs
> instance properties. I have a larger series of wip refactoring. This
> initial series is preliminary cleanup that would help.

OK, that makes sense. I'll have a look through the series
again; if we don't want to do the nice cleanups now then
probably these changes are ok, possibly with some TODO
comments noting what we ideally ought to do instead.

thanks
-- PMM
