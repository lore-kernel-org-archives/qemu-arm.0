Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3690224wrp;
        Tue, 24 Sep 2019 02:42:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUhsu8RZKlYin3VZk+L18GstEEhSaPkh/Um5IjJlRW6JP1BD6fwvgHA8Y94WooyqmFC/hf
X-Received: by 2002:a37:4286:: with SMTP id p128mr1498414qka.40.1569318162778;
        Tue, 24 Sep 2019 02:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569318162; cv=none;
        d=google.com; s=arc-20160816;
        b=TbyJPeLXm1wDIXC6ZGqjvS6QoOuL1e+RdlPFtcI/JSULCtN6Ca6F14gFaZheN5XWq1
         skKYGt4unhrGnqh+8dUPMehbOOMVGyxnkyeB+XI/LuumKKHdLR9eq441tNZJtQ5gn1UA
         U9be03mojMjj5CpDAVdKtUodqBsAPieFlKra8VqHEf+K95WOx0/xsTIsNkHFRnDqcjzJ
         G8QkzzRpxWfjoHs2HZKcxCLgunhLuQYM9gI2XzB6J16hrymUOYFaJNG7GyPAMx328LIC
         2j5xY6iZXWl03xuy+USTiQUq2Aate6b015AU2C7MMIxXZVqNoYWb/lYhtO15Mb3oi3Qs
         Zt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cnAncg5xcYVP1+ycJjXSP0cv8GqoSd2D/1n+EMJyTyc=;
        b=eeJkr09f1/Hn5gGtV3gVGPRutrFjcdFrv8DnSSFaS0lbO+Nf69QByV4GgacJ0/39X5
         2SituYq92KbkH10gZDf/XftRG4bCHLoQ9T7j5KAS9kZgUFsbn7HiCeC6lf6qQDprRDyw
         sWiDMD3ygA7PX+q8E8fpbWpnZSmMB4IBGbq8/E5KHgxrfExNM6PHGt09+YPl9FoxSA9h
         jrYPDcx0Us75eR6j3+jRcPc92QMHBgu3HIPlErSX+qGyhRYjGkoXpHOZgbCqPKtBG6GY
         uFkxYjdFKL0hA8p6gqdrmUl8eYJcWAOkt7DBN93ONBdiN6g5Ka5+JcA+r8x8abWxTlSL
         w+7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OETQ8pce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g27si821607qkk.319.2019.09.24.02.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 02:42:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OETQ8pce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iChLF-0005HD-Vl
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 05:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iChL1-0005FR-Sp
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 05:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iChKz-0000pQ-Rp
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 05:42:27 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44351)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iChKy-0000p7-5S
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 05:42:25 -0400
Received: by mail-ot1-x341.google.com with SMTP id 21so883543otj.11
 for <qemu-arm@nongnu.org>; Tue, 24 Sep 2019 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cnAncg5xcYVP1+ycJjXSP0cv8GqoSd2D/1n+EMJyTyc=;
 b=OETQ8pceIAqHlzu7h8mkYSCJ1AEkjBcAQnnJY/pS5LHnP52AcMDPp9TGhr2frFDFOi
 jb3I1mEE86hQSbrf5Dfsbo93y8NorEE6xRdhavAb3Zzgzb4bweesVYaKex4Y+3ktvdpX
 wX8bVUlvcwOKu6gV5jdQTe872m1ESMSFepTzk5f1Hgx7IMyd/STQwR0LKtE5ixwoRmYh
 JL4LvuRj1ab7oTi+mo8NKptFfhQ5lrHR5nlJrg5ttw+V54tnPHWiArZfCnB00al3VDec
 9paESACf/2Sasa2qyaaGtkFphtsSDLjl7SvSV+GhkFrakRW1/R57+DvBiREzoB7x7nQ8
 Am8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cnAncg5xcYVP1+ycJjXSP0cv8GqoSd2D/1n+EMJyTyc=;
 b=PQAOWTMJd8QJAkNP8i99Mnhqqrc/HvdKccUN0uFfTwKFraK/t6VbEsO2Wo6sKNGyla
 az8P7VWH9oPvgs4cBu7viPIxZsP/6jEpCMwGNO8arb8Q2586frOTkpPm8eHqbG8uiHbR
 E0C2ATQMnyTpLjx0vn99KesUZIy1a7vRlWp7PxT3Hr6bQN0NZlmNVjfZPvPrbgW/ryfP
 m3Kf9uK9U2aejbIPxw6Bi5JBOHEpoD5UUr+y2IXouIkB/RSS5qQsTIpzw+tDplZwfEw5
 JFkcbvMop7LgLouVa1CmABMg0rJJeGjKtTq7PvndqJ45ld0OmT3kP2U19kjOAbwnUajR
 YhcA==
X-Gm-Message-State: APjAAAU0FOHS3uVDp/pza9Kt0kuSOKvvQdH7F4zrJSmXn/aj8wcJ/bqJ
 fs9HeF8gfAimFrn80FzXXVRscB1s9E85xoCipx+66A==
X-Received: by 2002:a9d:562:: with SMTP id 89mr1131804otw.232.1569318143210;
 Tue, 24 Sep 2019 02:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-4-thuth@redhat.com>
 <CAFEAcA_6UxMBeyOMM0iT5cnCQEpWXfRO2XMuV9ez_0Su2osXNg@mail.gmail.com>
 <0389e9dc-7f78-5b27-4764-51f0bdef5bef@redhat.com>
 <CAFEAcA8XSQs=fw839O4+tTUqy-DpNh-jdHxQsfYQxm-nTbvH4Q@mail.gmail.com>
 <88bcb5b7-4f91-1cc2-39a1-bd919608737e@redhat.com>
 <CAFEAcA_QAtK3GmyZoR7swNKwdxkXWZCzdK0G6Sk6OU_tQ9FV2A@mail.gmail.com>
 <3a21d31e-fe74-9e0f-fe8d-f9c00a184fe3@redhat.com>
In-Reply-To: <3a21d31e-fe74-9e0f-fe8d-f9c00a184fe3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Sep 2019 10:42:11 +0100
Message-ID: <CAFEAcA-ThXGZKr8--YZGUPiw4MaMVqMxKODhVepXCgjxox6ZQg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Move armv7m_nvic.c to hw/arm/ and always
 enable it for arm builds
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XKI8gkS4ZGjy

On Tue, 24 Sep 2019 at 05:44, Thomas Huth <thuth@redhat.com> wrote:
>
> On 23/09/2019 20.50, Peter Maydell wrote:
> > On Mon, 23 Sep 2019 at 19:36, Thomas Huth <thuth@redhat.com> wrote:
> >> Just try to change "obj-$(CONFIG_ARM_V7M) += armv7m_nvic.o" into
> >> "obj-y += armv7m_nvic.o" in hw/int/Makefile.objs, and you'll see it break:
> >>
> >>   CC      alpha-softmmu/hw/intc/armv7m_nvic.o
> >> In file included from include/hw/intc/armv7m_nvic.h:13,
> >>                  from hw/intc/armv7m_nvic.c:19:
> >> target/arm/cpu.h:1416: error: "FPCR_DZE" redefined [-Werror]
> >>  #define FPCR_DZE    (1 << 9)    /* Divide by Zero exception trap enable */
> >
> > Sure, so don't define CONFIG_ARM_V7M in a default-config for
> > a non-Arm architecture. Then you get the behaviour you want:
> > the file is compiled only for the arm targets.
>
> Sigh, the point of this series is that it should also possible to
> compile *without* CONFIG_ARM_V7M in default-configs if you want (and
> yes, there are people out there who want to be able to compile a
> minimalistic QEMU). It's currently not possible to disable this switch.
> But ok, if you're not really interested in providing a possibility to
> make qemu-system-arm a little bit more flexible in this regard, never
> mind, I'll look into other issues instead.

No, I'm happy that we should be able to compile without CONFIG_ARM_V7M
selected. I'm just confused about why you think this requires that
we move this file out of hw/intc.

Case 1: arm target, CONFIG_ARM_V7M=y (presumably in a Kconfig world
this is set by default if the user doesn't flip that switch):
obj-$(CONFIG_ARM_V7M) expands to obj-y, file compiled, OK
Case 2: arm target, CONFIG_ARM_V7M=n set by user via Kconfig:
obj-$(CONFIG_ARM_V7M) expands to obj-n, file not compiled, which is
also what we want Case 3: not an arm target, CONFIG_ARM_V7M will be
either 'n' (or empty?) and is not settable by user: expands to obj-n
again, which is also what we want

Is there some Kconfig restriction I'm not aware of that
messes things up?

thanks
-- PMM
