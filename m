Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1338134lfb;
        Thu, 14 May 2020 05:45:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXpNiwLmaEK9lM/x6ew+M+//6RZyzxVGPct3sErJWrBXmvD7XcexdUh9nPl+ZwW6lWbqzi
X-Received: by 2002:a37:9ac6:: with SMTP id c189mr4554145qke.398.1589460322527;
        Thu, 14 May 2020 05:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589460322; cv=none;
        d=google.com; s=arc-20160816;
        b=i5BGpUJVMFwTN/2ePMD1jxTdPXzgd74ZdwZ55hjUqjsHKcOzy3iJdT9Hd/tWbM9F62
         0oqK5OAswErKUWM1Mc+Rm6ld6LbQJG9Z1JgYNzOvSRxtKKd7u7DrnMdjWbY3TzPUvZxV
         r7rLN3mLV7a2dwLxIPMAgRwGXVpgUxQdiESwTWOPSpw0sh2P3qSXw9xLZGH7dLszXt1J
         FWDaACNP/0Sg3Dn/AoKjReVtnLKy+CEYUPf3CNho0oPMRhKbEPkLMAQ7TaXyIvi8Uk3f
         nkamfu2mNO2Wkfe8NbvAHJR87TVQV60ezObLtOsSXqf2P1h63fbcuKp8ii5E64ZBYisM
         aswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1oyf3cwa4ysv0F+1gus4rSNb6qxm3CMa4cO5H6tMf2I=;
        b=WBsVa0IG7bpMytny4hWfjmAdavWHNdTjb2Atm6wiJ0dBtr6CH/3FlN+J5w1CQzVICx
         fBMRM9GAt3QQcYcXURWtiVJ1+ME2gN7T7PVvqXY6gQk2l0Tfqx8/EmNFjFfzUr0mPTs5
         pLTqLLz0KOAmcCijG+SgFgTPTmoWd5SAzmm5+uIqqodj9pkesZAGzVAwjB2FkqGfrZle
         sgezCoJ7pGn//brNTbaKnX/8QOX0kMCnQ7geUQ4NWMJ8r7jJd16DWwaLaKjjtTvqJyIg
         p39lJT6A52tGc1tDGioQZfIOaCQmOnGZ2NJoPMppUnZNkkIHE7fNiXuB8y+6KlAyV9mr
         9qYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ypVTyL7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q41si1607134qtb.266.2020.05.14.05.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 05:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ypVTyL7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZDEn-0006lX-Qb
	for alex.bennee@linaro.org; Thu, 14 May 2020 08:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZDDE-0003j3-7O
 for qemu-arm@nongnu.org; Thu, 14 May 2020 08:43:44 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:41326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZDDD-0007s5-58
 for qemu-arm@nongnu.org; Thu, 14 May 2020 08:43:43 -0400
Received: by mail-ot1-x334.google.com with SMTP id 63so2195086oto.8
 for <qemu-arm@nongnu.org>; Thu, 14 May 2020 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1oyf3cwa4ysv0F+1gus4rSNb6qxm3CMa4cO5H6tMf2I=;
 b=ypVTyL7cDMoH7l0+bEz1PvWvRoTGnmzkwEhJMemYlViCP3ME+po2WXRtzCrH32ibpl
 Ms1yBFDXmSRlg2HsqN3ggloNRmZX4sDaqv+xAxgUqSM2vy1YLHlp4SotmgxRIgTfY9DK
 fUADazs7u19X1vHtN60EuwZXjpXIu0967bUwxdxWeS5JqLMUMqEQ/rcDPQaKGCRlHoEW
 MwLACr1ieJwkDjSJ6KCi/S2fsjhrTTDHj+0t7Ok+BOnI6+kp6CxAIyLdKw3Zo0/gKqtg
 HMYrOxcfSIR7MoHdK6lIzPzr515j5C1m1i1jHJ9oIKz85OTsEnofgAqDAcPWsRv67Kvk
 iZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1oyf3cwa4ysv0F+1gus4rSNb6qxm3CMa4cO5H6tMf2I=;
 b=XdQxUCkpZz2KztjMp/o4byVaw1eRXFpOMMfiBqRMSSj59HHXomtXfIa3ydHZFnwQlL
 /F80IvoqIUv2epczrS89sWlpDgxEkTrcOQkel1l3pFjiD3hmDnPgHX89ynkOEggxzWsv
 LiBiEx5S+OHvPJ9b8nllVf3tuaPA4WR6u6JyoOdIxRsGLBgRX7dYirqjcvuvdZfuky+d
 v5LIkapMNGjs0+WQte5npU3R/tev/XJRG4trzYFrV3gHaw1FiiUn8HpeU6/39v3wynUG
 xZ+zWVM4k/sybzBI+jzFjEbr677q6utcg6cXbpq7kF3GbGlbUPQPA2SaQ04E2wnmwQp0
 osaw==
X-Gm-Message-State: AOAM533CBE0ZO5iv8+Nvmd+0VqIMQi/xOOgyM6gwDAjeOtjl/b1nYA+I
 c4s1L1ro/UUO4mCXmQQeHc8OWyPuESUnMINN9eyHDA==
X-Received: by 2002:a9d:398b:: with SMTP id y11mr3378687otb.135.1589460221598; 
 Thu, 14 May 2020 05:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200514122334.25089-1-kraxel@redhat.com>
In-Reply-To: <20200514122334.25089-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2020 13:43:30 +0100
Message-ID: <CAFEAcA-Hmh+SygS7eWfYWsHSYnTFWFccz1GrXDbX=UHqOH38mA@mail.gmail.com>
Subject: Re: [PULL 0/7] Usb 20200514 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1NZ9PUpgpxcx

On Thu, 14 May 2020 at 13:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit d5c75ec500d96f1d93447f990cd5a4ef5ba27fae:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2020-05-08-1' into staging (2020-05-12 17:00:10 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20200514-pull-request
>
> for you to fetch changes up to 8b2b45c506f4d71b831473d8de93b3cedaea4844:
>
>   raspi2 acceptance test: add test for dwc-hsotg (dwc2) USB host (2020-05-13 11:06:37 +0200)
>
> ----------------------------------------------------------------
> usb: add dwc2 emulation for raspi machines.
>
> ----------------------------------------------------------------
>
> Paul Zimmerman (7):
>   raspi: add BCM2835 SOC MPHI emulation
>   dwc-hsotg (dwc2) USB host controller register definitions
>   dwc-hsotg (dwc2) USB host controller state definitions
>   dwc-hsotg (dwc2) USB host controller emulation
>   usb: add short-packet handling to usb-storage driver
>   wire in the dwc-hsotg (dwc2) USB host controller emulation
>   raspi2 acceptance test: add test for dwc-hsotg (dwc2) USB host

Could we wait til we've had the patches reviewed first, please?

thanks
-- PMM
