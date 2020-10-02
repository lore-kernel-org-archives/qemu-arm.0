Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1587124lfq;
        Fri, 2 Oct 2020 07:17:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzZiXMEh3mUoKMKgkGo+LQXGY6A42WLBatsmdt6xMylG3unEuA/A/Wpwx13ZSmdeT1YkNi
X-Received: by 2002:a25:6644:: with SMTP id z4mr3062496ybm.347.1601648276188;
        Fri, 02 Oct 2020 07:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601648276; cv=none;
        d=google.com; s=arc-20160816;
        b=RP63Z9wqQuY0bQJ4EGkiZAbxczN2t0Glaf/Dl+urPGHEajhrKC4XE41bKqKPV3pBGM
         v9NYB60n+W1kVXx+MZwlVJb2sM3W6RQ1d1v2jAVXeJzk9KANuFldahHZV9GXeRyW6LpR
         PZn9/PNev/rXbM8Zlu+BrpmjvQyBNTukZz4oIb5yx6lzencKweE3iRK6p1P046i0I/P0
         d/QVveQRTueJ0c//eMe814Ay22hv96otBSFln5NelQnJ9CXOfJFSiaF7MdFlyitPahQT
         9Kd9KP5ySKZbSOYrIoMKgMnkRWtPrPCfwsA+pLUbeXkxfiOX1w9mJtmVZHXa/0GEtYiU
         Aewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JzF260npFDfcZ9JASf9Kvb/IM6bbY7fKtyDop8EwStI=;
        b=F2MvhqrXP5Y7qgPlPb2r/a7FIuosB0N1ME3ACdZV4jcQBwBmvSNxeEDfWbELRIPTBp
         x5uVKMOOEAKGtwyTXDbTsgbLUooXJdWObrVO8wg1U0HdKttjqk+a1mbzxPo8qhYE8vuz
         8qsbd1vnVvOyYZoE3ooNd+POJ98Y5PemTNZv7sVh4JMBmWNJxQGhnyCakssJw92A7k73
         evSybPB4c0unxp2yHFmcbnLxJQ5kW6h7VQDfc5sB1zBSitgcoe7jw7I0MLGGPKk+pq6o
         kuhz0lAfI3os4h3Q8X+EGNg6x41GDTImRsgcQns5M+fi1QpA7HwB4xAU9tf9FZOUdSXG
         ogZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGggeLTQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si1814285ybb.427.2020.10.02.07.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 07:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGggeLTQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOLsh-0005aw-Hq
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 10:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kOLs6-0005aM-1V
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 10:17:18 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kOLs3-0001Tv-G9
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 10:17:17 -0400
Received: by mail-ej1-x642.google.com with SMTP id u21so2228521eja.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2020 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzF260npFDfcZ9JASf9Kvb/IM6bbY7fKtyDop8EwStI=;
 b=CGggeLTQz7l2zsGH2CsPH53lOjJtEC2h29DFQjPZ6aCVpv3gzqHoyHZC6bkgfQH1ib
 WO2bzxkJ2ztOeoag5FiCvE2dbugfwF+s+REPEHbEfC3tsFaJ38yCBU43cnKLjNypGhNl
 cMto0UkJPEDoOQMuZ92gVuYsJ3inUiL6KbrOs3R5fQ1Lhw+X9z9QmexSQwpSplHc9tpM
 UOS/yTeYWiAhwsyYx5h8CjjrM1KG2I7+7FcDc1vwIioxV+xPxEbKKvGfzUueJR3mG+CX
 Jmov51vkpAE9u9LMjM8vQ95miyzi3QZQ+eOqNXV+UAbDmCwvtGJNRZELEQJPEDupAqL4
 aG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzF260npFDfcZ9JASf9Kvb/IM6bbY7fKtyDop8EwStI=;
 b=S56c92x1RigE+t7bGXlD97yIZEf3k82Ht2lw6McbPgXsCbjWQH5/XL3B8teODsbhj6
 xKy5ee5yJ8YJ/9MXTCwSm1DYbmb/HHHK/mj7axsY1AEJaNDNa1BexhmnheyzqdSb+XlJ
 E4hgXQ+KP12NNtjbOJjLO9XKe0znHyJ0yynnGRP3Y3EhXD96I+DZJzB2Dvl0/vJ59XEd
 G6yGMD3j7Vx+9u97s1s5MStEZnj2QPydkQVklzroOuMs1q/yIsLSNamugrLIX5a+UVAN
 r28l7w2GlNV2qZfmrDE/Q9Ze0+R8o5w3TgMny4EBv7XNyGT+XtNbBDF2o9VKB9BTCFU8
 E6Lw==
X-Gm-Message-State: AOAM530QLvnb9xcatOIva+SQMRa3i8Nb2m87c2cqXhFDVkmS+dSwriJz
 chrIotrQbUwnJBPof4/1pEHBj6vIZP8QWvGDT2omMA==
X-Received: by 2002:a17:906:d936:: with SMTP id
 rn22mr2552663ejb.4.1601648233570; 
 Fri, 02 Oct 2020 07:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201001193659.21685-1-maxim.uvarov@linaro.org>
 <CAFEAcA_76y5DoNw3tirFFaC9FfE6NnxwAkdgV5eSv9NUeBxdhw@mail.gmail.com>
 <CAD8XO3ZWW87Ze+gX9xWtrZ=XaETvE63WqzobQamoGM2_tb-4Zw@mail.gmail.com>
In-Reply-To: <CAD8XO3ZWW87Ze+gX9xWtrZ=XaETvE63WqzobQamoGM2_tb-4Zw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Oct 2020 15:17:01 +0100
Message-ID: <CAFEAcA9U=hrGZQ=1ZVHsFVJc1Ghygcueq0caE2U9nk29aBGCwA@mail.gmail.com>
Subject: Re: [PATCH] hw: wdt: implement sbsa watchdog
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gRnflEnKU1tH

On Fri, 2 Oct 2020 at 15:06, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Thu, 1 Oct 2020 at 23:36, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Hi; what's the relationship between this SBSA watchdog
> > device model and the one that Shashi posted recently?
> > https://patchew.org/QEMU/20200929180410.33058-1-shashi.mallela@linaro.org/

> Nice it's the same driver written a little bit differently. I did not
> see his patch before. 2 things missing in Sashis driver which are
> useful for me:
> 1. Add sbsa watchdog to machine virt also. That helped me to reboot a
> virtual machine with secure payload.
> 2. I specially did not disable timer on driver close. I.e. "reboot"
> linux path reboots with that watchdog.  And make timeout lower to not
> wait for a long period.

You should get together and figure out a single version of
the patchset that you want to upstream...

> Can this driver also be considered for virt machine?

Maybe, but you'd need to explain why it's useful (ie why
you can't just plug in the wdt_i6300esb, which I think
is a PCI watchdog device). We try not to add devices to
virt unless we have to, because they increase the security
attack surface.

thanks
-- PMM
