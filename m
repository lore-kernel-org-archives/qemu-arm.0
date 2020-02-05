Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp457439lfp;
        Wed, 5 Feb 2020 10:54:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3feT1cf76PXO65oAzrB7O+ZBHvBjcEEDHvKfvoSgkMiOCtLqj3QjLS1F+gY2nZyATKSpN
X-Received: by 2002:a37:8cc:: with SMTP id 195mr20779172qki.456.1580928858119;
        Wed, 05 Feb 2020 10:54:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580928858; cv=none;
        d=google.com; s=arc-20160816;
        b=POtdLUdlmDarzmmrJbvCQTSe5Yv9pCOW1R9bjzgH/Z7NhLuw/HbF3WLFA900cJ+VBP
         +M3Gw/0rdqw/7Sr9gz4A63ATWxeBThxY44JzeEtBAHt7TmPlk2aOG7HDO6nTzC1eesdx
         pct/R1QQM2ZIx48lvoPgMyV6R54UsMfFr/kLHsFjGwwzCrpZyiZtiWcxKEtwwvDpa6y4
         jwrFSTjWSxqg3jo3qlfGy9gH9lRYFD/QPRu2a5pcPcvQCigLvy4Cei4881RXmvHPcw23
         b6MzKnxYt0yrifwWL6szJIvd/FbtFgcyeBLuMtBL9mVX0QuCunU7+evl44eQCFAeJdq5
         XzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UZ0bX6T6pi3Kt/fWzzu7atALwWihp9KxFsFA+tnR25Q=;
        b=pK5pkW05KqumpF34IRCGd894vfwVEgM5uTbDhl2v2s3HpvAOHLZH9DiJS9A8DzvmrV
         vbyA+nuhnpi6nUF5cq4ATh9BU05yf1LcMXlPDqZC8lqUbt7g+U5jG8h2l9ZgRjhlvpxS
         juTjwknP9CsxEb4l2VqGoBNB0qLLVD9VjzzUaPm+ht/yhF2MMY8sJBpfclmQVR63pkpY
         0zdbP0hSqmOKWOBtnX4HJou4eN/ASNu5312ofyYzG0T6bX0oU38xD4hEMYr26lvnqx6o
         Bdqv9SCokn6XyU0bVx/hJ9N5ujXq5klJYXiwvzHPQACaf7f4XEFUYJzHSJiaYsd06sLK
         JGvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ka5K5z05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si359144qkg.63.2020.02.05.10.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 10:54:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ka5K5z05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izPoX-0007un-JA
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 13:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1izPoP-0007qv-2m
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 13:54:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1izPoN-0008E1-It
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 13:54:09 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38453)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1izPoK-000831-PF; Wed, 05 Feb 2020 13:54:04 -0500
Received: by mail-oi1-x244.google.com with SMTP id l9so1828775oii.5;
 Wed, 05 Feb 2020 10:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZ0bX6T6pi3Kt/fWzzu7atALwWihp9KxFsFA+tnR25Q=;
 b=ka5K5z05vBeVpJqUQmtLw8DdEx0GTGXptUn8YP2xnvhWtfHusUZy7+EOwdqpEF9RZ4
 hJKxn4qDEZOXT4FR67ukmVczBGqe8j4TH+zlgAVcQ7Xy2lwQ1msm22TKjWB00LBSg3Gb
 /f/Ni8RUNZrxVBY1YWjCupCdkc0TVasBgdy75BjrE7eQqMCV/KiFqRkBesxM/pFV3qYl
 wcOuK1ASWngr3H90awsv3xG4BiiIzeddZjReboYiHXvAIv/N7oilhV16CjCZLAs+TH7C
 PNycdT5TP/tYjuVCYQLcTmMgl/fYOlzEKLTFBd0Vobm4wbBmTUXVL0eBiNWrqR3LSxNv
 xPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZ0bX6T6pi3Kt/fWzzu7atALwWihp9KxFsFA+tnR25Q=;
 b=iZiVc/ReYZhjzBFCYMq2hGDI2VgI661C5eZosfcuKq2tt+aag3/eXwiQX8H3ehEY4h
 Cf9QQzKSQRAm1RTF34u9pBSxxuKuVHY5ZTiwzo52wsGP8hKl+L+2Glfg68A1pSR6j+4P
 J2lpJ7ja1M9rshEhRUIwXKOonDLx7N+HvjLRQFhkr0rI9G19wnaeUmdgEFZKth4p+rC/
 JJSxVa17cyd8hs2iA6J1eTvVEfAcaE/B3vZx1vGnWEVB0zE80b7XT6abR30Cn4bnp4mP
 YikG0AUV1+1JDi2tbqPRd9xDvrkRfqQX0xjiEhXjghjPdvCVn33G94fKNMsAaIhOR0jW
 VaJQ==
X-Gm-Message-State: APjAAAU5Dc5PnaW6OAcRMkQfLlBxFglvhevSreFXnnoDXalAkeU0cL9+
 XxrGNU76BzTZfQ6TjPci4qsV4BG1CemGf9lB+uo=
X-Received: by 2002:a05:6808:64e:: with SMTP id
 z14mr3815280oih.79.1580928843800; 
 Wed, 05 Feb 2020 10:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
 <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
 <20200205175115.GT2221087@redhat.com>
 <CAL1e-=jHpNmTdWSiHZ_StC0MXjLLsyq0cfSE=45=6SwoFnfiaA@mail.gmail.com>
In-Reply-To: <CAL1e-=jHpNmTdWSiHZ_StC0MXjLLsyq0cfSE=45=6SwoFnfiaA@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 5 Feb 2020 19:53:52 +0100
Message-ID: <CAL1e-=ivAZCj990c+47kVdcaOUgU5sDvoWZNWAMHmVJWd9L3Vg@mail.gmail.com>
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3uf02r0Yg6u

On Wed, Feb 5, 2020 at 7:03 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
>
> > The deprecation policy is primarily intended for notifying of changes
> > to QEMU's stable interfaces ( CLI, HMP, QMP) which affect behaviour
> > and usage of QEMU at runtime & are liable to break apps managing
> > QEMU.
> >
> > Changes to build time options have no strong reason to be subjected to
> > the deprecation process.
>
> This sounds reasonable to me.
>
> But: Should our deprecation policy be clearer on what is subject to
> our deprecation procedure, and what is not?
>
> Regards,
> Aleksandar
>

And, there is even a section devoted to the build system in
https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features :

    B.10 Build system

    B.10.1 Python 2 support (since 4.1.0)

    In the future, QEMU will require Python 3 to be available at build
time. Support for Python 2 in scripts shipped with QEMU is deprecated.

The wording above comes from the file in our source tree: qemu-deprecated.texi .

Shouldn't the cases like "--enable-blues" be documented here? I think
the deprecation of bluetooth devices support should have included a
short section on involved configure options here.

Why is Python 2 support different to "--enable-blues" support? There
should not be some unknown and arbitrary criterium what do and what
doesn't come in this subsection.

Or, if our build system is not subject to our deprecation policy, than
what is the entire subsection "B.10 Build system" doing here, in
section "Deprecated features"?


> > If we remove an option at build time the effect
> > is noticed immediately and the solution is straightforward (stop passing
> > the option). We have added / removed configure options at will with little
> > negative feedback historically. We'll have far biggest changes coming to
> > the build system in future too, with the introduction of meson.
> >
> > I don't think we want to constrain & complicate our work in modernizing
> > the build system by declaring that any changes to it must go through
> > deprecation.
> >
> > Regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> >
