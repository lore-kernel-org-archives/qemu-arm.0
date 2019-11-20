Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1813853lfc;
        Wed, 20 Nov 2019 02:44:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxAsl6pTPuElkIbxa3sR6U+BlDV2njfzrfHvsFlS+DPbw/SusKLfC+RHqI05efv3CoaScE1
X-Received: by 2002:a17:906:2e5a:: with SMTP id r26mr4515137eji.283.1574246681393;
        Wed, 20 Nov 2019 02:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574246681; cv=none;
        d=google.com; s=arc-20160816;
        b=HNTPukT3iCiC/Z8/6+UlJvjLfE3BLq14F8OxTFbEas36R7GNyVJ6ezb11co1l2GiAK
         XSXO+ifSPBWzvNYi4jyv3P6eNmU/vr4BhLsN4weD0iDWZDrzadZBgUbMIcecx0G025MP
         KPaP78of0PdJClBIO0NGpn/ZSX2kAAFezSXmyhrfuslCu6MZzv+vo4ZXFU2L0/A33bGB
         0mo+2Z94m8O+xpxMnv2S64ajwDkCqS91aSvZOyaxi8LtNOgjIl78pw0iZJoIUS9QU/Jk
         RWFYZTlUb7FzDUhLO52rZjRVRsEnWjPKT24kDQAU2pBhc373Oqkt61HI0x3tzYbHnIt6
         B1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MpVCv9Ixf6/DfcBFJ+SNRHUVUUgICqu7sWMbrPHm8Ag=;
        b=B+KAIyrlcoiQbjq6jDJYgs3m6+sSEs/CPIjjGkVjruc+cKPYyaCq5cKKD/yfDGrogS
         xNubLQNSgiT0BHZ+zHCieX0AoP4Pp1NYksiWXk0+jAmfRiCLlV85qXV4h9bHTRniFg2+
         6oPjVUzMWDFNqu364cFYSCkVLu39Au9zc75/I/i67mwe9PMfwaOodeq4g7hxJUw0HTSR
         6zwhPCvlLR1br6BsvERN9EIH4qP16Xfp79L/rYNQ439df3PsBwmkB9NU8hgWJ9Bbqzy8
         AgF5bBGKVSz5sKtoZqwGTrjyM50a1yXn8O4mfvBUb7tLiH1tYTuKGMHdGKz9sQrbdQuV
         sTbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=piXVvh64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p24si3448959eja.385.2019.11.20.02.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 02:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=piXVvh64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55963 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXNTT-0002as-Vw
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 05:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNSk-0001tJ-Ty
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:43:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXNSj-0003Zz-Oq
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:43:54 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXNSj-0003Y9-Gv
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 05:43:53 -0500
Received: by mail-oi1-x243.google.com with SMTP id n14so22029662oie.13
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 02:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MpVCv9Ixf6/DfcBFJ+SNRHUVUUgICqu7sWMbrPHm8Ag=;
 b=piXVvh64DuFi5ZFJf2NwQAE/AqhwJbRnyoZsgW+bditlhziDCl2dnXxZSnUzMVE367
 NAzn32Ak58HTs+udYOOShW0uuIIu1qJO3WVVgFL7IwbmrvHC7rL1I1ruqLP4USxHN3KR
 so7IiP7MRaSH9e0WKYmAccSf/bApxr9uAwgcjv9JMaa+tsWlNG/jzm2IwuadQoMqM+8y
 ndjrS/kpOIiaRmlyk1agDBb0n3TvLhBHzC9+UGgg9gkeL4WFRPbJVp1f2t6mfaA0ez9i
 gXx8r8p51Cql9+RBlqoiqllgBywQHVfDhIDGZybkJncuoxxE9kVc3FYRuvgSjNbFj4cw
 frxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MpVCv9Ixf6/DfcBFJ+SNRHUVUUgICqu7sWMbrPHm8Ag=;
 b=LksWDZTGFUlo2ZzYwjcewVZRS52iICJtqyv5dgJHnEePIiRI+fOcDHKh3hElS/2YDx
 +qlwOp+YMRgan9ytlz0jGRDriBIYo35dJP558Gbmvg7SIIIX8uEXNaGh7wMICqbr2XYj
 9s6ulIvajbY8IdNrcVUwB5c4PSa5CP7apZeqMrXPiFofKEY5qTZQM1MkHlabevSqZzXh
 72eHKAmKOJ6ezujf/iXDMYaWWVwG6QqQXiT4+3EhU80lIz1STTfbpZ+c3qQF/W+V8xcL
 2Qgkai27zXYd+QbzNsCDdxS4V5fVO7a1SVomSlqHtXIJCMnDwLeZHIk8WZ4/etBPx5mo
 Q82Q==
X-Gm-Message-State: APjAAAVXKaDdduWA3DnWnTeKHzvAsQlPdSEsT0mXcj3g+kuwbCF+dFXb
 /BSbj38X+jjI7CgmEaj45VLzmBfNGaCAz3vk2ProKw==
X-Received: by 2002:aca:a9d4:: with SMTP id s203mr2126160oie.146.1574246632670; 
 Wed, 20 Nov 2019 02:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-15-marcandre.lureau@redhat.com>
 <CAFEAcA_2ct-fOfBGgNExjCrjg7WKb-Xp44GghHWXiW2+3HjWbg@mail.gmail.com>
 <CAMxuvayTGh6d5H_JXnKRoG7E1MeY-dsw5XqSeR59fdM7njPVeQ@mail.gmail.com>
In-Reply-To: <CAMxuvayTGh6d5H_JXnKRoG7E1MeY-dsw5XqSeR59fdM7njPVeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Nov 2019 10:43:41 +0000
Message-ID: <CAFEAcA90uuQnWXjq=1RjiU5949vxaSuuy7EPFGjMJjpqmY7wMg@mail.gmail.com>
Subject: Re: [PATCH v3 14/33] serial-mm: add "regshift" property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: jz36gIgzKemT

On Wed, 20 Nov 2019 at 07:54, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Mon, Nov 18, 2019 at 6:54 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >
> > On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@redhat.com> wrote:
> > > +static Property serial_mm_properties[] =3D {
> > > +    DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
> >
> > This could use a comment describing what the property does.
>
> "Set the register shift value"? Half-kidding, do you have better
> comment to make? Otherwise, it's probably not worth.
>
> From what I understand, it's just applying a shift on the IO addr,
> probably for alignment/access arch-specific reasons. You probably know
> better than me ;)

What this is doing is defining the spacing between adjacent
registers. Some MMIO-based 16550 implementations have the registers
at byte offsets from each other (that's regshift 0). Some have
them at halfword offsets (regshift 1); and some use 4-byte
offsets (regshift 2). Something like this will do:

 /*
  * Set the spacing between adjacent memory-mapped UART registers.
  * Each register will be at (1 << regshift) bytes after the previous one.
  */

(basically the comment bridges the gap between what I know as
somebody trying to use the 16550 model, ie the behaviour of
the hardware I'm trying to model, and what I need to do to configure
the QEMU code to give that behaviour.)

thanks
-- PMM
