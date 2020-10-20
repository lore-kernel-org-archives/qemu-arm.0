Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4776697lfa;
        Tue, 20 Oct 2020 06:14:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaZqsZ2VMGUY4NVvTduTjF29pGHUrn5q7y7CJxFVm7V0y+fa4nQoD4oZ7e0+arAWiS6nxC
X-Received: by 2002:a25:a221:: with SMTP id b30mr3874371ybi.523.1603199653740;
        Tue, 20 Oct 2020 06:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603199653; cv=none;
        d=google.com; s=arc-20160816;
        b=W+vNvYHWt4mK+t5JeFWCNXPJCKIhR9maEkii43r2nO1Jaj16WX1njx/myLSPfZLg4f
         yXEnrJv8joc3bfDfkP22Jzz8g6/LZ9fM/DpKqQlOz+pEku6LI1Wx+V1O6gRP7AmlN2Br
         k0CxYbydWyVOcZSny9rPxgXBYYfmeroo4dMV0aDSWI/fNs97Vdsn35fIhWMhEpov8PXX
         mkeGFuuoZr8MCsRI1OaO3MzJ3D60eny3jvMyXELS0rxr7LER+mUVFuMzZsPS+AZbCuzI
         YZnZQ/fJ1eG3DdSW2mgbINrmrPgvYcwyH2gPV3cEP9rvESAc89YWQv74BqPanmnnyuzx
         JExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcFjEpu1PkbYpdlTE/21YFQzqWpDrKJtELTUvSdxWlY=;
        b=QSlTTXJQC1ViHUa62DxPRpkD9nprUZ21pkJFU5P4Zt0a93W2qvC9iYc8TWjbbU8Ipg
         JHfB1aZGtlkP9HSxFf58YaoZYzqbpNbnJb81f/GyKdpYD8OydupfafBNk6GqRiSvOsgh
         WmglwWVprFx5u/hZWtogs/RityQFkd0Wp3KS6zBqPbFDV2MvNmVln1uAAbFF17KUMu3s
         E+ygiXWUER4AtStFha67XE7xKAyWXu2jcfdcqjbzNEYDKykpR8Ls8A+7SZ3KxFuT25Eo
         cPwt1QCC0eeD5b9Q1yo+gfi93PnhGM3HfeZXyRj/mE5HcN0mJOn6IV6aqXT81ZIYSOIP
         7GbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ajO27+Or;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si1522256ybp.81.2020.10.20.06.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ajO27+Or;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrSv-0006cZ-5G
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUrRZ-0005Kk-KL
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 09:12:49 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUrRV-0006mg-BX
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 09:12:49 -0400
Received: by mail-ej1-x641.google.com with SMTP id u8so2646217ejg.1
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 06:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcFjEpu1PkbYpdlTE/21YFQzqWpDrKJtELTUvSdxWlY=;
 b=ajO27+Orw3xAiwYD55aPINzenPnhw53mP/6WYR1I1sBeAPymoquy9kxrBPrYm9cEsL
 q4uM+RaGlrYG/4F9S1ZZIkDF8VGaWf3D1Ohq1Gq3jWtM8fYxEv28sGpyvZ5m+NiLJvIY
 5q2rkfuSSkj8GYFje6wtIxi2CcqqtjY4nHv6G64dbPoBRDJt8wedrzRBd2gPVO6+nawM
 9hq+YVtkjrTWH5PiaAyEe7KsWF5vQd+4arvmf0Ghw8bMA05Wpgb6mfvlH48M6BpS1Qqi
 zGNv2ipZkE8slcfK6QOttiqePNFlpQTpHduYUN5wNkoCvSj6tOnQbWboPDuVuwbTsReb
 wEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcFjEpu1PkbYpdlTE/21YFQzqWpDrKJtELTUvSdxWlY=;
 b=Z3XMw031FzsYd+ftLjuH4Lc7Sl/BKqmGqJh04W4Ol4u9xcoHP5txUlrAOdDlRIMhVd
 FW1zCdgmJYLd0bOovE9i+rMpftJGoLV8d5OtK3zB/TM0zPbAeqQV74+kledFoTWDbG4d
 VWj3qIeVBaM0gJr+18WN7co1RM6EZj6NKPglxMx87FU/s3q7n1H95mgbaWgBGRC/YDYT
 cjfAwqwrEGQixVPeSpDCE/Z3hydkb2xcDwjqHrXrdK964TwzQ00MjN4lyvbQkDC5Zs4E
 iCpa6907qR5fMFW66GhVDKoCAChyU8LMdSYUKNtu9zJ1oJBZUhkfI9WHCoXL/VDjNh6f
 YbTA==
X-Gm-Message-State: AOAM531pvSLglY/rKBLLr+wVU57PdGtI7lJh+O8UU7J6LR8rUH6Ti2Xt
 G0/YgWOX/EuU8mkSuhzBMg/SsvDLP78ltZiRtIQnaQ==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr2950264ejk.407.1603199561269; 
 Tue, 20 Oct 2020 06:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201008232154.94221-1-hskinnemoen@google.com>
In-Reply-To: <20201008232154.94221-1-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 14:12:29 +0100
Message-ID: <CAFEAcA8xej=3eVpEYYL1Ly_PPLPuz0NjF0gA4LN=DO1ru_OC1Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] Additional NPCM7xx features, devices and tests
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3lwD/Pbd0GWy

On Fri, 9 Oct 2020 at 00:22, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> This is an update to the initial NPCM7xx patch series adding
>
>   - A timer test that found several issues that were fixed in the final version
>     of the series (see
>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg739516.html).
>   - Watchdog timer support. This makes the reboot command work.
>   - Random Number Generator device.
>   - USB Host Controllers.
>   - GPIO Controllers.
>
> The watchdog was implemented by my new teammate Hao Wu. Expect to see more
> patches from him in the near future.
>
> This series has also been pushed to the npcm7xx-5.2-update branch of my github
> repository at
>
>   https://github.com/hskinnemoen/qemu
>
> Again, thanks a lot for reviewing!

I'm going to take patch 1 (the timer test case) into my target-arm.next
queue; I've sent some review comments on the other parts of the series.

thanks
-- PMM
