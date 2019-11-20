Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1806196lfc;
        Wed, 20 Nov 2019 02:36:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQrDJmEAr5xJOFDs/+8xGgSoM3eILNi+huxlgmBXIZekm0aJTcC4he/31g8NUjXjtpLoHk
X-Received: by 2002:a17:906:351b:: with SMTP id r27mr4595801eja.120.1574246212460;
        Wed, 20 Nov 2019 02:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574246212; cv=none;
        d=google.com; s=arc-20160816;
        b=WmOlJo6SSrPK9pwcih7Wz0Rll9rbSfSuL/ZcA01Rv7A/vGQIgE9oz1UIHpDj8fXhkv
         kSbsMzmrzu++KfHKYbu1knGLZygTg8O7kyNRNqGy8VLlXpsPx+6sgEQ4Gt2sPaYa3vsp
         WSdxtv6frmyeYNPfvBZgwCQwE58vcswg7nXxnB2FAfkvrI7qPYanAQfQ7z0Ww7C+W2Mv
         boqsAUClQbiUcXdP5KOy/Mbco6i35bdOAgIXit6SZRawKIn98qGghkEGJFhTdl4o0ULb
         TFCl80u3HYieLAbRmnE9yyVC5+4fHnAZSGIfcTVa7G6Je+ksyG9SemgA8q1Y4SCd2wOG
         bbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RtIxhKscXKv9SP0Cu/koEsS13Uo3TXhTms6kVgHWxfM=;
        b=uMimzHsNOpKuVmbnCt8lhDuDAq4VYE7a3eMpWietfl3SieaK8OjXRrMNP+weK27JSx
         SKBr8mlvHsmUCwDkeJn04jjOMaHZyWTCBRg5/HrpjBi8XIl+lFX4b1BbXVbr/f1LOVMY
         4CKxn/VvnKm/+9fNBf59WdNLnMJqK2lsWrdsMb7aV2cs0idTcm4gQ4g1hC2TYNpLOxx7
         rMtNZgsSlFBHATRr0wpoNqR16Iy6R8Y4Tf65v/MwNa5mYn4u9VyovKfHwgl1UcXSmAQ7
         QroZCoYf1P3kvcNlzxwag0CkPsXELlkywue0WLeMHcQ661Agaxin2NnAXL/MlnVOc+Hx
         LJWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aPUmXQVx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b29si19052189ede.118.2019.11.20.02.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 02:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aPUmXQVx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXNLv-00045d-Gk
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 05:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNLk-00044k-Gv
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:36:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNLj-0001MQ-F9
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:36:40 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:47032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXNLj-0001Jk-B3
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:36:39 -0500
Received: by mail-ot1-x342.google.com with SMTP id n23so20729218otr.13
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RtIxhKscXKv9SP0Cu/koEsS13Uo3TXhTms6kVgHWxfM=;
 b=aPUmXQVx5y2DHnk1t0Ty2KlnD2IZfB8Rpe3NwBxyQEFZZ1qUIJZ+0DjKEWJmZc8FCX
 UP4Nwtg671PhLvAVYfTsC2xyA8uwqs3sbVZBXV7u2yt1X0Yq6HXQiAGw4TtN8ZSUwpCi
 FUMGEhgcSUDbbezkebqEAVwSwBrp0ebrimD/Ufn4bcNKHIJg7CfFfkv8W9uiuPjqw9BH
 AgvV0vJlD1AD3pQUJG2dgFrLldLWyka74A5qMYQ5ufuUvRfbPt08+I/eol1r9VvybXja
 MN2pc8an0Paj07p+bYPfxuLsA/1hJ0+Iu2ik36GhcajXx1mjOJaU7Prre2HGYOfm9zJr
 Eh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RtIxhKscXKv9SP0Cu/koEsS13Uo3TXhTms6kVgHWxfM=;
 b=OmM0ZtgEyRmyZoOFOam5UxKaXn6kH2kT75/421U1CUsMXJ6jKgOqQSK17rnhGl1AO0
 caRdWxjWFLskTFRtgV6DgJ/HvL3p00WyBT7PIozw/KF5Fyp6wpwxlBeulPb13QVm5OGo
 l2s7IAK7xjjkH8EdunX9a2no5YETHrPfnJDugNVpngKIaVrgOBlL8/an40S5PBgoxUGa
 zpE5CpnWJruqhAX7Zbs7NG88jZsEjRk54DWtRBuMyiaeGO6euOGaq+IW4MSSilvqq3pn
 werrus97m1ZESMNIRyd2JJfwNyOE4MGNFGi8JXdUK29uxXCrSPUlaZ5jIRapBSH+9oht
 uJJA==
X-Gm-Message-State: APjAAAUsoIfFo2uvmVjPBeAdwfWBRXPzjM1WQatJHib4JRs250BhQf1d
 0lxokaBQGee2OXLXxRablVEVZRntEiIaHknhbu/Tsg==
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr1431546otn.135.1574246197642; 
 Wed, 20 Nov 2019 02:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-14-marcandre.lureau@redhat.com>
 <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
 <CAMxuvawroZ0jrQTJCbakft21Lgk2cHrE9VyihiUvYBVp+AXgXw@mail.gmail.com>
In-Reply-To: <CAMxuvawroZ0jrQTJCbakft21Lgk2cHrE9VyihiUvYBVp+AXgXw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Nov 2019 10:36:26 +0000
Message-ID: <CAFEAcA97LxS0LhCN-uqmO++D2U3dXBn3KctW7n-4tA-b50xKcw@mail.gmail.com>
Subject: Re: [PATCH v3 13/33] serial: start making SerialMM a sysbus device
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: 9CGNPRiwtAgz

On Wed, 20 Nov 2019 at 07:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:

> > > +static void serial_mm_instance_init(Object *o)
> > > +{
> > > +    SerialMM *self =3D SERIAL_MM(o);
> >
> > 'self' is not idiomatic for the name of the variable containing
> > the pointer to the object in QOM code ("git grep '\Wself\W' hw"
> > shows no uses of it at all, which is quite unusual for us --
> > usually the codebase has at least a few uses of any non-standard
> > way of writing something ;-))
> >
> > Usually we use something approximating to the abbreviation
> > of the type name, so here 'smm' would do.
>
> I would prefer something more straightforward than having to come up
> with various name mangling.
>
> Imho, we loose some readability, consistency & semantic by not naming
> the object argument of the method "self"

There are two problems here:
 (1) "self" gives no hint at all about whether it's the Object*,
the DeviceState*, or the SerialMM*. All of those are the
object the method is operating on, but the type differences matter.

(2) *Absolutely nobody anywhere else in any other device model
is using the 'self' argument name*. It's not a convention if
only this one file is using it, and adopting it here gives us
absolutely no consistency -- exactly the opposite.

Item (1) is part of why we do things the way we do; item (2)
is why we should not make the 16550 UART some weird
exception from the way we do things.

thanks
-- PMM
