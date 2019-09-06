Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp105626wrp;
        Thu, 5 Sep 2019 18:17:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwy+wkObMX1brkUt+iUejK+qZUQAQCOLHo6XTOB11RheW+tKw+k3v4NLHk56V0iQ7JNUV8/
X-Received: by 2002:aed:35ef:: with SMTP id d44mr6989015qte.306.1567732659385;
        Thu, 05 Sep 2019 18:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567732659; cv=none;
        d=google.com; s=arc-20160816;
        b=TsrN5CBrMY+7QkecrwfJq16s/VtK3vEiRAPn06zyWfPcEg8ElAY7xRvXdNwP9K0A6o
         edcCnPHbUAIlt7nJNGo5nAQ3Ont/jRBcv7UEeMKXl9MAeyZCet5G/HHWngb2VIn4YY3K
         uR+F3311MiD/DAAnCvlq+D+U199al5mtjSW2LriSFLr7Ikl5EaZUpxRM0k3uNIhMHRH/
         uDe9rG6TXokvPMku/0ZjUaOjI3fF7PaJjlmIKo7cQ1RuBotdEYh9rWzwmvlOe5mQrRGr
         +kaH/Eo7tOTPI1lstXqfdjD7986exupecv9NVA5bD5UHs/zdNzV9E5UHPZLAjzbpRrjH
         2ZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bkIbC9kLBWNJAFXoYR6IXfcc8WNbQurNRzah/yIoSjw=;
        b=fjezi31n1GXJlT1N4B+bc1wHwiRYwBvjJlc6mYIvBamgsl4OGd88nT5PpVoXlP9iOK
         peJhZiWnB+esek/SphQ9gWiVm/COMAr8ehElIlevZ+VXXvP359RPicHGEQz27kcoeDHg
         5B7ZL6NfSjB0B//4LrPHFmtB/N7GW72qnwEUawlIgi56KkbqY7Cdz1/NYxmIwTpxIGuM
         NNh367hhYty8QdYvODmxV886reQ2jvWTotI1l1F4CDa6fQKnxuZ6oK06cLlCJbVYkGDa
         0cgrYIif/kjHfVEgJOL/vrE0z9IF3tDKJahGYwaKGDsUl4PHkpTMrYIgqjy9QY9b623e
         ZOnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=R8sl6cxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27si3189320qvw.97.2019.09.05.18.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 18:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=R8sl6cxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i62sc-0003Wl-Pg
	for alex.bennee@linaro.org; Thu, 05 Sep 2019 21:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1i62s9-0003UJ-3z
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 21:17:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1i62s7-00089Q-Tc
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 21:17:08 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:36075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1i62s7-00086j-Fu; Thu, 05 Sep 2019 21:17:07 -0400
Received: by mail-qk1-x741.google.com with SMTP id s18so4164813qkj.3;
 Thu, 05 Sep 2019 18:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bkIbC9kLBWNJAFXoYR6IXfcc8WNbQurNRzah/yIoSjw=;
 b=R8sl6cxgFi54BYBE/YM1na9Qq+lq6IsiDJkyldqxmHfO1t5vodzD35epk5EGp8rVc6
 ALERrFKO5Lzxf8Haa+v0oZ1Qma61f3fllCQzlwU02kTUsSN7NL8sjcFjkNB92VQKLqqJ
 KBhTPDZ5ryqW7eA2VWx5XCgU3bCTkgNiecqk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bkIbC9kLBWNJAFXoYR6IXfcc8WNbQurNRzah/yIoSjw=;
 b=TUPs5sRAL2rBMWTmCJXmdO6OTRtxocM7D4eyq5AkBN7N7DQ3DNn1o/2EudTlWmCaDW
 JuUaqNYUmmAemOZCdUrex5S6VsVrSDZ8uI0lBSCQZdpQcsGuud6EFE5Qvt1yKUYe5aAB
 rd5eoKbgbQ/kzTo5pdYclzFRQKLnrQpBaFtIin3ERlR3gk5nchzAlACvsNBW1NbKs1YB
 0EYHuS6Yr4zh/DRBrv/x6dFbXzsylEgaUtZFkS+VSk6DWAkK6BAmu38NVRDaGW29oDGJ
 HjzVI1KeIxL6qTURDV0UMKZbClCP0mw+sv3zrS7f1Kp0t/LuTQ+2MqpcFaGCo1td6/ya
 G6eA==
X-Gm-Message-State: APjAAAXGmonJ/29IlljxszjZqtmcXs04yCCt3hdgNJYtcXFlwDuAjGfY
 ZoygUjPxI8fjmbng1sFMwE1dvuC08VlfNzL6TW8=
X-Received: by 2002:a37:4f4c:: with SMTP id d73mr6360215qkb.171.1567732626054; 
 Thu, 05 Sep 2019 18:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906011010.1135084-1-amithash@fb.com>
In-Reply-To: <20190906011010.1135084-1-amithash@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Sep 2019 01:16:54 +0000
Message-ID: <CACPK8Xds26gq=e=7D9qtPJ4FOvhHb0Q-_Chj_MFHcWO99EBcwg@mail.gmail.com>
To: Amithash Prasad <amithash@fb.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-arm] [PATCH] Check correct register for clock source
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W552J/7GcdcN

On Fri, 6 Sep 2019 at 01:10, Amithash Prasad <amithash@fb.com> wrote:
>
> When WDT_RESTART is written, the data is not the contents
> of the WDT_CTRL register. Hence ensure we are looking at
> WDT_CTRL to check if bit WDT_CTRL_1MHZ_CLK is set or not.
>
> Signed-off-by: Amithash Prasad <amithash@fb.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for the patch!

> ---
>  hw/watchdog/wdt_aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 9b93213417..f710036535 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -140,7 +140,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>      case WDT_RESTART:
>          if ((data & 0xFFFF) == WDT_RESTART_MAGIC) {
>              s->regs[WDT_STATUS] = s->regs[WDT_RELOAD_VALUE];
> -            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
> +            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK));
>          }
>          break;
>      case WDT_CTRL:
> --
> 2.21.0
>
