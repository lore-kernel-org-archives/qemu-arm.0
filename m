Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp50700njb;
        Wed, 4 Sep 2024 02:23:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJiO/vyTVueMHtVMFu2cI89qvNRBVmoOjA401TIBvmfyf2ocJfSGD+BMCkrK5/JhMqPgTVukJc4qYmDg==@linaro.org
X-Google-Smtp-Source: AGHT+IEMxxzR66XLjPlhrlDtDVN2sfqJYtLBRdWzRNxkQl0UG8WZTAtBvlRBcxguBbl4UVIzT6V5
X-Received: by 2002:a05:6214:3da0:b0:6b7:b277:dd12 with SMTP id 6a1803df08f44-6c3558475afmr155849626d6.49.1725441786226;
        Wed, 04 Sep 2024 02:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725441786; cv=none;
        d=google.com; s=arc-20160816;
        b=w5pK3879+orQVLlNn1GaPAaSj9n41dnUocy7K2+pIZsgTbnuGimVnY8J6x0YjSiPQ8
         JHQ75IdJOQgNq4c18VAecI+AVIKROOzMrwuFs+udTIb4oltY1d2md5VhdciR+l8L8By0
         5dwNVTyuo7kCV2bNq01d/r4Y+32MXnJ+GNzQ4WMsWZNEL1tLRZYxqFr8LUcmoJ7KOEtZ
         iic/BFhT9j7XjPp4y0YPx4wGtGHZeXbmL5X092sqQMXAHtEG3F4TdAw9fm+NoVVKRVR+
         91eZ+0Lx7+DsEo9WE0+yTZerKDrLPR5BDO6TUhL4ed/ckN7UndpGoPX/vuR8mPA/SK5T
         drtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6XkE1raRaz+7qmkHF821LkX9BHPx5zoXet1RsVnWVAg=;
        fh=TfkJASJQZEi1u82yrjG4XvOEeKalzEvweFsBg5QB0FQ=;
        b=PHx+CmAMPvjg7A/IAefxLEhoZFjBZtToGEvEzjBs5xK+gPLCXgf0dMgT87eUHKazf5
         KHWYXXoThzZBnL4k5LMRIqa/ELzYKZgT1rCoxt24Hl4ht1iiW1BbniE1yW4CiCw1wkp3
         ojuumd3HV/gfSpNRdiPb25B3zsOMQ7w7CyM+tc/ksEJDzdQrrGy83hfyxVj9VjDJOLtn
         j8jqnw3eOpTbRr/s87RsUn/SpuwIftjuQcwY8Zmudfx8rvrDS9Omi/B476Rql+boyuSD
         byOOCMoeeadjCncjAZKCQ7j1i1FtfaS3M6xLbDn5S7yi1PpONx0tj6YIxzFVIBiSvLQ5
         elIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3PJOJ+n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35bfc8088si89587966d6.393.2024.09.04.02.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 02:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3PJOJ+n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmDv-00062Q-PC; Wed, 04 Sep 2024 05:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slmDu-000619-Ld
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:22:46 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slmDs-0001Fy-R2
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:22:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c0aa376e15so3551171a12.1
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725441761; x=1726046561; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XkE1raRaz+7qmkHF821LkX9BHPx5zoXet1RsVnWVAg=;
 b=J3PJOJ+n5ZhSwGMnLqZB8MAxILUFfp3Jd63NFDswUOhHbc24I20GAModRTniTqyfsU
 +iN1fRZmAqRIrsFrmP0Pr7jl7b9jrEz/0kBL2FcOmyxrqetcey+vNZIEfqyE7WRyds55
 ss5BoloUOinXhhDDljZrUuaqOcvlLlPVh50eJC8uwQ5vND1KOHQudPNmhRhG3lwEu66p
 MR62wgnKJl97oiLS/KBri2UrjxTIAhHrIZZu7otFmR5zOvirXyNgaHv6MApSrEEb9wWw
 PYnSl33nGXqv3lzH15c5BFSebIpefLsiKqXqML36gG76kMf/LQ4Jjf9FwTRfbTZnES98
 qPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725441761; x=1726046561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XkE1raRaz+7qmkHF821LkX9BHPx5zoXet1RsVnWVAg=;
 b=cMmr5kNqIQ2H6Dbk+gDLIvTvO3TuGaDz3bTf4MEraC2DHeX8VVuGkrhD9AR59CTq2T
 bUrqMnKlXNWU343gakFv1pjbbM2vYyht1PtUIlw4m3j07NSD2IV0WyK/9cxLBRZ3tFPI
 el4SVGKkct6mr2b+mgsojsCgwyoWThBYqHPiKw8jfRc4Uqz871jIlnMWwEs9BLencTxq
 OOL32vSzD5wc827Z7sImx5rYl38BN97HmskuoW6UT3ke+FrYSVdj+AezKna5YrLerUMC
 lAFUhSrojXGrl6tM4e1pq9G/6Y/QXuZX7HfzNJSGNRrCnic1a7uqyYN1zuX0cJdykgYc
 USaw==
X-Gm-Message-State: AOJu0Yxghz8OlM+bBn4vRFizNrCdwSoWzNbhxmxERrr5fDlhocGoGxl2
 e0mcluNBstBsH+Xg0a2mipLPiGWT9TxRbrOHbZYFGTPv+jgSTRPFengtwwu05hRCkm3laA41Rg7
 pEGeZ4bEbDs5CwIYy8hNCpA3nh8bhjQrsTrredV/MDvgQ2H5vUGY=
X-Received: by 2002:a05:6402:2803:b0:5c2:5f09:bb9c with SMTP id
 4fb4d7f45d1cf-5c25f09bc03mr7264760a12.30.1725441761103; Wed, 04 Sep 2024
 02:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-27-peter.maydell@linaro.org>
 <f65053b7-f909-4ff3-b938-05cff490548c@linaro.org>
In-Reply-To: <f65053b7-f909-4ff3-b938-05cff490548c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Sep 2024 10:22:29 +0100
Message-ID: <CAFEAcA-U+YAg7qqAu9LYmQ-YbNsxMB4AYCdQrm-r=pUe-O2=fA@mail.gmail.com>
Subject: Re: [PATCH for-9.2 26/53] hw/misc: Remove cbus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J8DBos1P97U9

On Tue, 3 Sept 2024 at 22:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 3/9/24 18:07, Peter Maydell wrote:
> > The devices in hw/misc/cbus.c were used only by the
> > now-removed nseries machine types, so they can be removed.
> >
> > As this is the last use of the CONFIG_NSERIES define we
> > can remove that from KConfig now.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   MAINTAINERS            |   2 -
> >   include/hw/misc/cbus.h |  31 ---
> >   hw/misc/cbus.c         | 619 ----------------------------------------=
-
> >   hw/arm/Kconfig         |  14 -
> >   hw/misc/meson.build    |   1 -
> >   5 files changed, 667 deletions(-)
> >   delete mode 100644 include/hw/misc/cbus.h
> >   delete mode 100644 hw/misc/cbus.c
>
>
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index d33d59bee90..a70ceff504b 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -142,20 +142,6 @@ config OLIMEX_STM32_H405
> >       depends on TCG && ARM
> >       select STM32F405_SOC
> >
> > -config NSERIES
> > -    bool
> > -    default y
> > -    depends on TCG && ARM
>
> Maybe squash this ...
>
> > -    select OMAP
> > -    select TMP105   # temperature sensor
> > -    select BLIZZARD # LCD/TV controller
> > -    select ONENAND
> > -    select TSC210X  # touchscreen/sensors/audio
> > -    select TSC2005  # touchscreen/sensors/keypad
> > -    select LM832X   # GPIO keyboard chip
> > -    select TWL92230 # energy-management
> > -    select TUSB6010
>
> ... in the previous patch?

I left it til this one because it's only in this patch that
we get rid of the last user of the CONFIG_NSERIES define:

-system_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))

-- PMM
