Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp406768lfp;
        Wed, 5 Feb 2020 10:03:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgnaxWn9ILR0Npwvt90wwsdv9em46OiW6v2sMFApPNAT5O56kIwIXYm2uRQsiwdiPN+exY
X-Received: by 2002:a37:4d8b:: with SMTP id a133mr11502392qkb.14.1580925820065;
        Wed, 05 Feb 2020 10:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580925820; cv=none;
        d=google.com; s=arc-20160816;
        b=OAW3YAX7Og4EoXW+UDcS6UKTrXwkTUoTp1+hulbChIosi4elUNdHW7n+aLK+GVSebZ
         UEpkzDE4x1Tz4Ox4hyfEnfwWgr/lL1fLxg2n5l4T5h+MTuhQMbt0+1Nr7pNNPiZFXIH4
         4o+ku2zOPelHx+GKU8rcTlja3eKR0+N4+/iP7Kcr9nJL29hRcuIj22Pc/8dLZwI4fIQx
         Ogdfh1PrmhkwGiHbRkdMLhd4SVOpsAZJgUIPabTuzYE8c5gSD+DiuDwdh9mO/Yb5A8v1
         WM7MDesHsPY2/9df8TYm97+6d3QzLdPz83XV3rziis+DajHWfOUpD6VyYQHrJd2psnEH
         5prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q5F9z5GTzKruioiIN8akW+j+HF5FBcfXn9UBrSai4iU=;
        b=FNiDadT0Z/ATNrgcwMK5JNh4L6LKNF6f35FlxDCgS89GzjZPDs3HcxF5/jZPG1mSfa
         qmlAKpduXe9gus/q0RHs3yU0VTwW0NiiKXUAfrz+3kP9AnVOqOi8e1krrUFJqV0ljZLl
         QrnsS+NRWVvdqUIvI1mIb1mTgfXD7TZ0Y7jJ4MLLKPkrsUgtWBd+IBXb95w+Pg+IijBi
         m/GQf2eXVrtiZZK6XGbx3o8NuxpI1Ir0tx3gElyzwuY2L997y830xWK+u7v6hrGwxjEX
         fHdQppbn46n4o5lgYsArKq75vVBoEtrPavJRR0a/jDcPOU63hI/SkAFAuy3HBc77VKDS
         G4YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EKdoHU4Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w126si289120qkb.269.2020.02.05.10.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 10:03:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EKdoHU4Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izP1X-0006Bk-07
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 13:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1izP1C-0006Be-Ik
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 13:03:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1izP1B-0007dj-DY
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 13:03:18 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42538)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1izP1B-0007YY-8h; Wed, 05 Feb 2020 13:03:17 -0500
Received: by mail-ot1-x344.google.com with SMTP id 66so2775657otd.9;
 Wed, 05 Feb 2020 10:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q5F9z5GTzKruioiIN8akW+j+HF5FBcfXn9UBrSai4iU=;
 b=EKdoHU4ZAaGliFUZstJnXWu5BlKHb3nEH/3fG7B32r4crFLJPU5RBzZO33syw85Vtr
 hOCuPO7x4KJfg3pdw9oQPfQi3Ht5NAUMbyK944OXvEko3SSqhTdMnXrt5CYA6ec8IyJB
 OgeenQQVq7qJHeiibtgvlE/GY/blSSOh50Pd9m/EfD3V5prJOIxf+q/D0qITqbkHNSvp
 DPtqQxemg5lpIwnmVnoNI99AC3vLT78CZDwaUFbHpAHsRXUXPXa/MspxEHh9VRQ53QNL
 nq2V8EDHEmSG1KLkUbcl1hSUzfxZ8AT8AHfSq+vI9gvMiDx+IT/APxD45PmyeV254/Nx
 wxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5F9z5GTzKruioiIN8akW+j+HF5FBcfXn9UBrSai4iU=;
 b=AM65TTqLf7JIHqBaBfN0O1aWpEg3V3wpRaLOB88vSFjpULBbG5l4HsK5FK1r3+fZXB
 uqYO73lcm0x0RD9o19ldpzQF6eY+RK/OSwZQRzod9FkMnBoqWPZ87pUenrhAiXUHf0Wu
 zvt+eb2BeZJbCWNvSptfH33lCefTktJQBl3ZnsXCzNR162V/AlOr988MxDsY9Hx9pgOH
 alihhcdc7aRyl6ziD++hirX9hFVU8XGB3TpKOaV7rZhbH+J9GdLtqzlSB+bsh2UH0+ul
 leZ14kfJXNPfYZQu29wvKmfUYFzAfElyILC/mDmLt1P7XDwj/TeMMhS7g9tZ5bLDT49R
 onfg==
X-Gm-Message-State: APjAAAXp3N4axzds9BwBCquHtcbnp2EhJdaI0qe9V5epCvHEt1lhfGzK
 8V0tASUd/1quncMzI4sfs59ilaSdE5NE6/WQ5ck=
X-Received: by 2002:a9d:7305:: with SMTP id e5mr25733884otk.64.1580925796470; 
 Wed, 05 Feb 2020 10:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
 <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
 <20200205175115.GT2221087@redhat.com>
In-Reply-To: <20200205175115.GT2221087@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 5 Feb 2020 19:03:05 +0100
Message-ID: <CAL1e-=jHpNmTdWSiHZ_StC0MXjLLsyq0cfSE=45=6SwoFnfiaA@mail.gmail.com>
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NYqfzhNeIdJY

> The deprecation policy is primarily intended for notifying of changes
> to QEMU's stable interfaces ( CLI, HMP, QMP) which affect behaviour
> and usage of QEMU at runtime & are liable to break apps managing
> QEMU.
>
> Changes to build time options have no strong reason to be subjected to
> the deprecation process.

This sounds reasonable to me.

But: Should our deprecation policy be clearer on what is subject to
our deprecation procedure, and what is not?

Regards,
Aleksandar

> If we remove an option at build time the effect
> is noticed immediately and the solution is straightforward (stop passing
> the option). We have added / removed configure options at will with little
> negative feedback historically. We'll have far biggest changes coming to
> the build system in future too, with the introduction of meson.
>
> I don't think we want to constrain & complicate our work in modernizing
> the build system by declaring that any changes to it must go through
> deprecation.
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>
