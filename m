Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4726981lfb;
        Tue, 27 Apr 2021 05:16:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHXdSx7R6tGMJw8N7va++TCLL4in1IlCEH1QjD03o3+gXHuxChek+Z4k6VdA2HAB0PUeOI
X-Received: by 2002:a05:6402:1c0b:: with SMTP id ck11mr3995557edb.264.1619525816893;
        Tue, 27 Apr 2021 05:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619525816; cv=none;
        d=google.com; s=arc-20160816;
        b=MDMUlbeeXreX/gp3pfyFcVN99DZCTEGYwkmhMLkU+yA2kqiEJTO88u3BzheeRJyFMS
         hx5pZo09QHnWuFP1mlq7LCMozS7wZwKz8r8d6g1iX9vrabqic9kGvKXxlrC6vT0SGaJS
         da83zw2QCHPzQCpGg5wdiX5zpS6NtYGl358XVkHncAi60s7xCB9QPyoiSl6XVquxPTLO
         XP7jy00gmzJNi9L99ZNj5PMrgkWVKIvVwW0zMElrLjDLzw2Rej/4DaP84PR19l/0pILM
         wxMOEJG3NKiyFKjl4EILsvWjJXhATPeHbj8WOv19bxts/8woezUspWd5uFsyjCGt3ycE
         TbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iOHl+WXov6I35hiaUgGBs0hZxf5f3OFbwgK2AgpIoOY=;
        b=vCv4qEfQIrJeT5ltAX03nbd80mvAUfzxJN7L8RYEgPs/Z2+d0fvltRTnTbBv5thcm7
         bJr/WsrIwviut3YDsxCpgjSZjkqADox8S61XizNdB8Yc8913uIIN4D9ANSRdUi4cv1b6
         dNz+pQMkXz8UHF58jKh4gIgCkhPmZj6sHuZO8LkVpy0by4bqdaPn23+4mYSTkEJcCy4D
         ZvQfQB6WnRDxsOb6c0yTchaD+wTt8YFjnK2KtnteEpbkE0P5StMp8AfXJ/rHxOBabOwC
         HwqInTWNSVwtPtYpnqCs15FQYtE+xwmCfklMg/tYIVCsTBbeLBldIC56q1InKCf1Dy44
         c4Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J0Ql2aSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si2404561ede.84.2021.04.27.05.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 05:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J0Ql2aSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbMe8-0000fG-0n
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 08:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMdg-0000cK-Nw
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 08:16:29 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMdd-0002eV-E3
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 08:16:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u3so10501056eja.12
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iOHl+WXov6I35hiaUgGBs0hZxf5f3OFbwgK2AgpIoOY=;
 b=J0Ql2aSSUdrJGXv13R/IIFbQ/0g0HNid0CL3JRBmKeFUjv3mveZqFe9tp8hdOQbwJO
 UanxUxkmQBHIE9750Zb2R6bMLANA2q4k3dnQoDxyG+hpy3GD62iARBC8gXw7HIKWAI58
 B+GAgccIIMJ0+gG+sns5IDDtP76EQo6b4vcQlsbU3GLQ8MT8Y0oRjTuQTJQ/rBXIZYVG
 Y50x7K9jOJbv1BBVj5jj19uqQm9GrTbViyfq5fzSvGbEc2EP/dM0JqK33srJEJD60kcl
 g12/i3qV+oEmjgf7hTSVL5suY+CUxnkuDkG79vZkK+Pkzfw6xrXlAm9fHfgXl0mha8G/
 eLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOHl+WXov6I35hiaUgGBs0hZxf5f3OFbwgK2AgpIoOY=;
 b=l6h2fPuALEIRuGRZmnoVLYexBTLdLIZnssb9VecHWoFDsXCmwqjKJrm8wN1W6mVWUw
 6+usZprYfAlXZcyk+lr5hJ3pgM/NHg9jFCIKlhLhWz2rjHd+xd7uBfxDQbofQJX1czMp
 D/cBRsabf+U2UxxqBQFvUGKWG90GZOg/G5pWT7GYp4YK7kBedkfVwwTjyy6mjhB7BIWL
 yF/qTmqSLZkMXN947phtqxuFMzCAZiLLX1GyS0JMUK3i+gGZeZGUAD5Y26sfam3fPbCl
 rh3F/OhEOZli8xcnCYoLdUaozkGwncRe5C5pblKw37VelJ34fSWY1U8P6ImK/XnMgZhh
 xUTg==
X-Gm-Message-State: AOAM530fGovjrMUVOvgdAq4tMxwflO2o2SIETFgJj7Dc3CxjZFMmtemK
 nQsZ4ODK1nKJ9UAePaoa8rli/ZhFNoLz0bHqP/1JZA==
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr23314144ejt.482.1619525783656; 
 Tue, 27 Apr 2021 05:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
In-Reply-To: <20210427095458.3hbckyqbmfztcmge@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 13:15:24 +0100
Message-ID: <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UEkuSxM7fAzv

On Tue, 27 Apr 2021 at 10:55, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Apr 27, 2021 at 10:42:18AM +0100, Peter Maydell wrote:
> > Why are we making the UI for "enable EL2 guest with KVM" different
> > from that for "enable EL2 guest with TCG" ? Currently an EL2
> > TCG guest is set up with "-M virt,virtualization=on", which then
> > does everything it needs to enable virtualization on all the
> > components on the board including the CPU.
> >
> > Unless there's a strong technical reason why KVM EL2 has to
> > be different, I think we should use the same switch.
>
> I agree we should use the same switch, but I think I'd prefer it be the
> CPU switch instead of the machine switch, as it's a CPU feature. There are
> some board properties too, like the maintenance interrupt, but we tend to
> call a feature a CPU feature when it shows up in the CPU manual, e.g. the
> PMU is also a CPU feature, even though it has a PPI.

This is mostly not how we've generally opted to handle this kind of thing on
the virt board where there is something that is not merely a CPU feature
but also has effects on the wider system: look at 'virtualization',
'secure' and 'mte'. Granted, the effects of 'virtualization' on the wider
system are less significant than those of 'secure' or 'mte' -- but I think
we implemented 'virtualization' on the same pattern as 'secure'.

If you want to propose changing how we handle those things, including
a backward-compatibility setup so we don't break existing command lines,
I guess we can have that discussion. But we should either *first* do that
change-of-course and *then* implement KVM EL2 to fit into that, or we should
just implement KVM EL2 to fit into the design we have today (and then do
the redesign later if we decide to do that). I don't think we should add
KVM EL2 support's command line switches using a new design that we haven't
committed to and which leaves it completely out of line with what the TCG
handling of the exact same feature is. And I don't feel strongly enough
that our current approach is wrong that I want to impose a "first do this
big rework" precondition on landing the KVM EL2 support.

thanks
-- PMM
