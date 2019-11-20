Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1826669lfc;
        Wed, 20 Nov 2019 02:58:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpZbShRW489Dd1WDMkLAQccWHA/LWsFb9dTl+cVcElOoj36ZoUtCMAIcMn51X9gt6FIAfv
X-Received: by 2002:a17:906:4304:: with SMTP id j4mr4615238ejm.10.1574247521366;
        Wed, 20 Nov 2019 02:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574247521; cv=none;
        d=google.com; s=arc-20160816;
        b=EQ/K13NIuLpmaGxtNQfiTqYw9BxMTbcJKfqybdeAYIXvzmN92gQLtOWvVSBwUkrldp
         XSFd4f33N1sJb3OdjCNIlCgqQdLMu0D8029Ga2d0rV6jzwVojzmWIb7F7H45gqKhM/Oy
         8yr2Plli1axTnsIFmKtzbPZdfR4s60qxVAXu61Y+MqQrZI8qD4GOvdRXghjNKuKUp64d
         V10bx9yAo0RkDA6pvSTs3YVhNbSaaRA+faLT29MBviGRbYcSANVRzRccelQtz15QcBdF
         F+wBP9tF3sqMLh1+IEBDcoYI0+sXqQ/mCp/ybHZc37LHKNDYpN63Z1DSeJM5ZUirUE7z
         Nkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=d/usWlDKJbBWd0S5wNfzU9U4UxVZNWPmRsySSJAeVe8=;
        b=mDLYSHNpOj6srgc0tapIX0fktEptLcWSfaSVCGUdwb0XfHZvc76xvKMw4/faP1KIKv
         9i5Li5go6VyRs9/lL/ojE4L3GVrKna/cflRmf78Gvs+U2vU/uVtYtzzebKpNFOtn0ZWc
         6L8ZEY8+60d+CaHOIlCCMYcNGpFQmSa97VeWRdD5BqReJswzs8u8unOzP2keFuFsM4Ah
         tP6+u1e9Yht0eXTOwnzapeDCOUOUM4zYr/tkAaowQws1HChoNseKEEaUDL0KBIUDzmo7
         8nEl/s287s8QKAz6W+QApCtXR4R9x2Dpym3Zs1g7zhsMdKjmtLJn7HQoDRf03w8RIig2
         5K+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z4K1YC4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si7538114ejj.188.2019.11.20.02.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 02:58:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z4K1YC4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXNh2-00074q-5R
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 05:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNge-00073H-Pn
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNgc-000779-6j
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:58:16 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44079)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXNgb-00074m-SO
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:58:14 -0500
Received: by mail-oi1-x241.google.com with SMTP id s71so22081749oih.11
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 02:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d/usWlDKJbBWd0S5wNfzU9U4UxVZNWPmRsySSJAeVe8=;
 b=Z4K1YC4vSz4gZ+dCEZ/bAfojVig9hD+C4NQmhwJcIAvvTj2w9gTy9DZQg3mxeQUUS3
 Jezf3CoeCS0q6pkznPs+FUC25izt/x+QqejUDn4M4naUAgGNyYp6ttU3LVs7U2rQ7iGm
 9l4XBL8F9PdVvpA2sejcx1FulAnz5XIgYsfkrbf90zUl/M0wA+ooi2QcbEQXgmKIhMyZ
 KINPHyT5QHZ4qEiNW9vvx9bcCteYx/UC2mN5ZaPROrKRh12l+9yO8BhpJYx4Nd1X9CJv
 r2vPiqOCegtyBvnN8wEWYKJNTi25m2GEYibpSc40xrbsvUaxkM4SjbzLzUgcKJmEIbki
 HmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d/usWlDKJbBWd0S5wNfzU9U4UxVZNWPmRsySSJAeVe8=;
 b=BnwWjZ8ZPfn4E40GuEF97zlTnZPIJoSnlyWHRGMxjuBh76MFtnVV4xL/1Ok/nSA8ol
 alXRgmxGUipjvQfSE8CeoGZYIDDQs53ozNOMbFhWn7XeiZtSHhQ52p3flafrdMkLQaJN
 kdLrEK5pnv22j1pofkqCIC39KU5gyINJ12aq7OcWpwuPFAqUmMisqCudJoJCma+bV/0M
 L6hbChMqh8vb9ctu91yN4cV/ADNv1Xg0GNVsksKO6zQGdh8Ii+CMtPOXM8gw2KbTKJKr
 6NL8ZMqFL5wz1oUekkMwBr0NRDavBOzVf7alpk9FpirpqPEUNO9TL60rO/2oRoA/FJZm
 q7xQ==
X-Gm-Message-State: APjAAAV+/WzdRX+yJkO7O01k/Zes9GCnN0ccZy+wCYrQOJJ1mGEHp2MJ
 5U+Dcwk/Rl+nJukcdqhK+9y0wc+BjkLeQd/s/KIToQ==
X-Received: by 2002:aca:451:: with SMTP id 78mr2280473oie.170.1574247492167;
 Wed, 20 Nov 2019 02:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-14-marcandre.lureau@redhat.com>
 <CAFEAcA9Cq_MkAzqAjt5uPNu3HDUfxO0hyVWtqEiAashPEEq3=g@mail.gmail.com>
 <CAMxuvawroZ0jrQTJCbakft21Lgk2cHrE9VyihiUvYBVp+AXgXw@mail.gmail.com>
 <CAFEAcA97LxS0LhCN-uqmO++D2U3dXBn3KctW7n-4tA-b50xKcw@mail.gmail.com>
 <CAJ+F1CJGHeb2aT+8t7vEdB0bKZ8r6OAnnqpDdnkGbfDRcV=JjA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJGHeb2aT+8t7vEdB0bKZ8r6OAnnqpDdnkGbfDRcV=JjA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Nov 2019 10:58:01 +0000
Message-ID: <CAFEAcA-_fexNrzgdqwoaJVEyHMG-GAPZkEawiE59EX9+u_Kr5Q@mail.gmail.com>
Subject: Re: [PATCH v3 13/33] serial: start making SerialMM a sysbus device
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
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
X-TUID: PV9nPU4s64WS

On Wed, 20 Nov 2019 at 10:40, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> On Wed, Nov 20, 2019 at 2:36 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> > There are two problems here:
> >  (1) "self" gives no hint at all about whether it's the Object*,
> > the DeviceState*, or the SerialMM*. All of those are the
> > object the method is operating on, but the type differences matter.
>
> "self" should have the type of the object that is being implemented.
>
> serial_mm_instance_init ->  SerialMM *self

In a typical device implementation, some functions take the
object as a "SerialMM" or other specific pointer. Some take
an Object*. Some take a DeviceState*. Some take void*.
Which of those is "the type of the object that is being implemented" ?

> > (2) *Absolutely nobody anywhere else in any other device model
> > is using the 'self' argument name*. It's not a convention if
> > only this one file is using it, and adopting it here gives us
> > absolutely no consistency -- exactly the opposite.
>
> Since there is no clear convention, then adding "self" isn't breaking
> any convention.

There is a clear convention, which I explained to you already
(variable is named with some abbreviation/initialism of
the type name, or sometimes just 's' for "state"). You are trying
to write code which ignores that convention and does something
else *which no other code is doing*. Please stop doing that -- in
particular, don't do it in one device in the middle of a refactoring
series.

If you want to argue that we should change our convention for
how we write QOM code, feel free -- but that should be a separate
discussion and probably ought to come with a plan for how
to do a general update of the codebase to avoid a weird
mix of styles.

thanks
-- PMM
