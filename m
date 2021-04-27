Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4717479lfb;
        Tue, 27 Apr 2021 05:06:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIPl5EfXik3UxgMPhPXTKxUTB9HiT2wvARZ/7n1XLt6AP+PgbKrWaZF/jJfTfzr4+ma2c4
X-Received: by 2002:a05:6402:350f:: with SMTP id b15mr3898433edd.6.1619525166507;
        Tue, 27 Apr 2021 05:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619525166; cv=none;
        d=google.com; s=arc-20160816;
        b=mziU3vheMra3oxl70WmxEds3buNF2THVXltu80FAo+qkagg3hB8W5zdJPugFF8081w
         OmM4l+jCXIJ9pYchvnCitL6GnVEIC3pkWCHWKvr4dqYMWw5/sTmO4RSAHipL28F61UIO
         4Y3HcjGBbec5C0BDHbYnJwnOz4aht+X3JXLk+Tz65uMou9Mot7+SKPNCiCMeM/zqdJwY
         WRi+OopBsXYrotm7PqwUI48dEuXD4GapQgf6mEXIJ3ahDsRxeE90XQxmzju2lNueuLSU
         6EraESZB8FJrM4SdSmRG7NNuMihDkxJwkkx1mGd561XvpgC5vnLJdvxbGobO0xgZ8Qfn
         iIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/Ah/2JvbBuYvoheSUmxbqbrJ6PWC/FbJSlGeZThUQU=;
        b=opNYYsqkDrqDX7uWdxq/9Z5gopeuJV8QE5d1a54vYt5Co69NSQajGBu9ra1Z+VV324
         6aygTUK/imcgSaSdBzCHAcUqshHwp3SzfMxQx7Logc+NidmFggiZANe+9tBj3SibXYaP
         E7IOdM02RYCyNJ5UgquXO6p5SwUzjw6WMNB6XnKjhd83Ue9j6aTfF+RsqPmYuPhsr27s
         WYNeGPIlxRI6J+Z3rNidxJ3cUfS3+JfKHPaewIpQwsgH+LmPdOREN+tRJdxNZBESKEpN
         CQ0pYwgTn+dgmsGoxS3XXkkOKH5WPn4v33d4zT4RfB3jRlzhc0sPcbcKZHFVjFBBw/9E
         GC5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=saVgiQZl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si2496216edl.212.2021.04.27.05.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 05:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=saVgiQZl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbMTd-00054a-9P
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 08:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMTV-00053P-Gg
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 08:05:57 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMTT-0004o9-OK
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 08:05:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id n2so89128889ejy.7
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/Ah/2JvbBuYvoheSUmxbqbrJ6PWC/FbJSlGeZThUQU=;
 b=saVgiQZl8bwcb6kK9dqn/iRtzg/KZaVVQYiz6OG1IjXwtMRMfP/N+B1Z3nnDDOvhGW
 SSYVzaT7LgbBuhnPEWEHc5DpYMoTL2GJdcYGEo+NJED2q3jXr5zKfYL2jV7AFqDLLf0R
 0gn7f4hVlGD6u22WbPAkdkpjqG1zpsO43skKdqbZjQORu0GPabFbO3HEUVl7/uxWjUva
 Mk1Pecsl4Mbr+bF2l67eHnLXUz2L5bOeWtuW4PZHRdRYn7Lkb/5eMoerKfG+EdfehJfX
 3jqip0XsvcAKnplhBNOxn2yS3iuhflyItdVrFzj2Ycv2J9LMAeVg/r8Z1d6U0akg/cMi
 G4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/Ah/2JvbBuYvoheSUmxbqbrJ6PWC/FbJSlGeZThUQU=;
 b=JcvV1ApvCXUfpm6egHLlnKVWsg+X9njJq2sKXduLYQGRNIGFXZAjXP2ZmVLgermPBm
 37My1e1H3WE5g0ieFL1MuXcjVTWz5YLk4EqkIm/249Bl17fOGiqjywSSv6hn0UgfKU0S
 27PFNDOEofDnldzVP71JnnVDUIRh3JwF/ot+tBrfAqPpn+watOfwlb56AYN3BOojsOc0
 /aJMH8jQ+SCG1pKGNe+DQeO8sEU9ixkxlCD4mA5iuPMKZVy2jkqvdpIA9mkrFWYEs3Pp
 ldXO3ah2ZNPUfaG+mWprkq+iDprrM26dVP93FJYGpkZrtU+XOEp6esoR9f7dJJoXuMsv
 VvLg==
X-Gm-Message-State: AOAM531dtESSSoWQBMzFqhkY5ZQEv4yaZVr6KaOqBUOIflngJO3kTZ/V
 Cf2b6PRXriBAmkFc+i0bB2meRvco+oBuVZTZJpRJAA==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr22665861ejh.4.1619525153741; 
 Tue, 27 Apr 2021 05:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
 <20210427092423.q3ktw4kkd5xhapad@gator.home>
 <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
 <20210427094924.pgivurjrgtzovcwa@gator.home>
In-Reply-To: <20210427094924.pgivurjrgtzovcwa@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 13:04:54 +0100
Message-ID: <CAFEAcA8kH0RsS993kwbsH9+ziCbxT5151LFGnnDkcy10EODEaQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mey8Ve+Df8rh

On Tue, 27 Apr 2021 at 10:49, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Apr 27, 2021 at 10:38:00AM +0100, Peter Maydell wrote:
> > For new features added we want to use ID register bits. However,
> > a lot of older pre-existing features are keyed off ARM_FEATURE_FOO
> > flag bits. Trying to convert an ARM_FEATURE flag to use ID registers
> > isn't necessarily 100% trivial (for instance, the ARM_FEATURE flag
> > is always checkable regardless of AArch64 vs AArch32, but the ID
> > register checks often need to be split up into separate ones checking
> > the AArch32 or the AArch64 ID register value). So we aren't really
> > doing conversion of existing flags. (I did a few which were easy
> > because there were only a handful of checks of them.) As a side note,
> > some features really can't be checked in ID registers, like
> > ARM_FEATURE_V8_1M, so env->features is not going to go away completely.
> >
> > The only use of cpu->has_foo should be for the QOM property -- the
> > arm_cpu_realizefn() should look at it and then either clear the
> > ARM_FEATURE flag or update the ID register bits depending on
> > which one the feature is using.
> >
> > vms->virt is for the board code (and controls more things than
> > just whether the CPU itself has EL2).
> >
>
> Thanks for the summary, Peter. For this series, do you recommend
> attempting to convert from ARM_FEATURE_EL2 to feature bits first? Or keep
> the ARM_FEATURE flag?

I think we should stick with the ARM_FEATURE flag -- there are
enough uses of it that a conversion would be complicated and
I don't think we should tie this feature work up with that.

> Also, while I agree we can't use vms->virt for the
> same purposes as the CPU feature (however that's tracked), do you agree
> vms->virt should be true when the CPU feature is enabled?

It's the other way around -- setting vms->virt should cause the
board code to set the CPU feature. (Conceptually, the board
owns the CPU so it gets to decide what its configuration should
be. The CPU doesn't get to reach out and mess with the board config.)

thanks
-- PMM
