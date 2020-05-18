Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3113966lfb;
        Mon, 18 May 2020 08:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+0AP4Ve8ybwkNiIuulnOEbrM+B1KXDuVpVGxu3czmXtw5S/0+ylkNxtS+8Kn98rzv6WUZ
X-Received: by 2002:a37:498a:: with SMTP id w132mr14689490qka.221.1589814067794;
        Mon, 18 May 2020 08:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589814067; cv=none;
        d=google.com; s=arc-20160816;
        b=qocWQ+JFk1DGzklDvBm5285/UrT3cpuqzLqWlpnXeUNZge84BAZIP+EUCgKov19Mzu
         ZWHgFeLY7orv8TJSm5FnFWzsxA6DtoRUD9nRO9rMdTzz1vRSf3OSIWajsTylCIXNNlBg
         usNMgrRn4GpveWc7u+0h20dEVnr7MW062FgT1jHSdeFEUDxbtPgrpoWO6E5fjaXHQwek
         vItwxhmnlxFJn6vKrJXEN9GMv6jhnMAIZKEuARTCYrbjVKTDtdtCiXo/TOlRsb2JrDYC
         TQH4fbj/eggnb/UZEQTnYFXw/cip+zRaRyzARKrSDHJhJu/ONmqXZtksyUdw5VVHCcP1
         tGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ii1AnzEvzSMZmxK7quxS5plWooN7Tke86O9bHVaUtW8=;
        b=X+NY0TJ8R14Fm0sqZEM8w1bHTB2t5yf0rAtOY7SsGEKk6esssJErMsLWds2hlcZ/Yb
         BYU2lndTS6slrm2D2SwOf31YYRrasXW3OPcykcANBU7gBm4WXKrCqAYEhcnBlOQaB2T5
         zOxOulKYQFwBv3oR5qTiC/Dv2EOImC8QmbZ2oOeWk6pSPdS3hrVnfDpK0PlWbd1g0VaX
         aBxewI0gV3LtQ7yjWjGz9mDL5etYqXL2kvrvFa5mY0D6QaTVLGwdKA88lMx1P2wBrjgq
         xpxbLLuX2iKeQJHUh/4U041LKPR54Ezc7FAGjYxy7wAuc1x/slaX/JRoC+uo+53H2XRu
         miKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dPwV67Bg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b54si5739309qtk.217.2020.05.18.08.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 08:01:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dPwV67Bg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jahGN-0005JC-3h
	for alex.bennee@linaro.org; Mon, 18 May 2020 11:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahGD-0005Ip-GR
 for qemu-arm@nongnu.org; Mon, 18 May 2020 11:00:57 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahGC-0002Bb-Fu
 for qemu-arm@nongnu.org; Mon, 18 May 2020 11:00:57 -0400
Received: by mail-oi1-x243.google.com with SMTP id i22so9193273oik.10
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ii1AnzEvzSMZmxK7quxS5plWooN7Tke86O9bHVaUtW8=;
 b=dPwV67BgHodDWR/0s1Zf8I4B6r9s7PhufLTrAIeK65V7w1gru+Ux4Ksfn6Vn9VtIaz
 wtXXelnLdFU2f9EZj0t2WeAfgQYRu8U2JYzOjRLk/0jM4qdFYEEt2yne7XlIHiaaCSYf
 lskmmGegMIABZRJDYX3JKWoSYzN3rwWdcg3M4DY5q4xKseyCmXhLNV3tkAk3H9KLet2i
 kQSA+azxR2r5mkWIddxIbC1EKZuCCx8sjK7AZzjuTDEz8CZ31HizrQa/i91VKyfG+/us
 kQ66fi5citcn09WugZv/1gROM4rcv778ORIYcv0iTnX1jehPqFe4wgWNqIDVMxq1BBjW
 Hjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ii1AnzEvzSMZmxK7quxS5plWooN7Tke86O9bHVaUtW8=;
 b=DzsCdRVd1WzZ512tbAjCyF0kkOHtMoEjpY0qaC/WrUXoe2Y5cRBft0WxU+kC6zUaXz
 nKEWIpkBwRiGLLtpSuoRaxz8sdX1x+Rgpe8MR2V6zWc9NStIMqJue/k9xIDlGQ6hAhCY
 CA7jZM4+sQsetQp8/WtgnQducox7sjKvK+K+SidGOP0zkH9z5obnP25SL5mClHn6B4BU
 hRdYyQuJ+qGGkg3LofKztxZzlC2MlkKqr78MSy9psVWXJjFbshHjz+Jmn55SLR9q/2EB
 zdQrUFMGDPhvgpvq6FSDV7rskRtW7L02W0x9OeYcRvSiPR/jMuiyTlj2YRWyBoDVC33G
 KcfA==
X-Gm-Message-State: AOAM5329hvoyXf52axIUgfydh7d1R4GMd1tI0VcI5GoXYbO2BTOucqXG
 d/HnoPKoyU7ioQ+gwtR8MF9cKPt+qBrnce2jjnTsxCZjc2Q=
X-Received: by 2002:aca:eb96:: with SMTP id j144mr10329944oih.48.1589814053716; 
 Mon, 18 May 2020 08:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <CAFEAcA_T+07JhcY8rGLW6dchsfyez54fenZtJAYV++d+dxzn9A@mail.gmail.com>
In-Reply-To: <CAFEAcA_T+07JhcY8rGLW6dchsfyez54fenZtJAYV++d+dxzn9A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 16:00:41 +0100
Message-ID: <CAFEAcA-mLdOqi2oc12vz26OryLT7FvhQ9EV=yTHpWAGXofD8Dg@mail.gmail.com>
Subject: Re: [PATCH 0/4] linux-user/arm: Fix BKPT, SVC immediate handling
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: omerg681@gmail.com, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5uODv0O0AGB

On Tue, 12 May 2020 at 13:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Apr 2020 at 22:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This patchseries fixes issues with the code in linux-user/arm/cpu_loop.c:
> >  * it incorrectly thinks BKPT is a syscall instruction
> >    (https://bugs.launchpad.net/qemu/+bug/1873898, reported via irc)
> >  * a stale line of code means we incorrectly NOP SVC #0xf0002
> >  * we don't implement the distinction between 0x9f0000..0x9f07ff
> >    (should return -ENOSYS if not implemented) and higher numbers
> >    (should cause a SIGILL)
> >  * we abort() for bad immediate values to SVC (ie not the 0 of EABI
> >    or the >0x9f0000 of OABI); the kernel delivers a SIGILL for these
> >  * for Thumb mode, we never use the immediate value from the insn,
> >    but we always read it anyway
> >
> > This patchseries fixes all those things. (I started out fixing the
> > BKPT bug; everything else is problems I spotted along the way while
> > I was reading this bit of code...)
>
> Laurent, do you want me to post a v2 with the -2/-4 thinko fixed
> so you can put it via the linux-user tree, or should I just take
> this via target-arm.next?

I've applied this series (with the fixup) to target-arm.next; thanks.

-- PMM
