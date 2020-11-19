Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1075941lfb;
        Wed, 18 Nov 2020 18:27:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/neLtS+sVZECoGyb+AW8dWpXDv4ah353NaZyUC7r5a6UPmrQlgjd/oiUXmBZAWw1DpIZI
X-Received: by 2002:a25:df55:: with SMTP id w82mr9824408ybg.135.1605752871838;
        Wed, 18 Nov 2020 18:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605752871; cv=none;
        d=google.com; s=arc-20160816;
        b=v4aOvI214eM0cqdetH5OqiFFONlsVKMGx4+xujhk0n7Ovdz4/9EmQ7HAc9SUnr2qG/
         QvUPzBq0d/OVkAaxNK+47N/w3erza8/PHpjT7Yt9f8rcDXB6tYyF9agpTyyDklVZ8BwP
         TORd6cLgKE/QBW5n65+6J5NkEph2pR91eQmjdTW6R9+x1o8q9M3hw27U41udzY+gXm/Z
         Ydmok8iU1d0JhNqYix10JqF1XCaFnY+CQ6K4v0AqMHXvotgFPDAH4wz+pD/tAqJu+Bpc
         EMjmTT0bPb45BpMDkY/95sXzrxMKRKs86zjejzBMYVq0Vwm61AmpcDRgkJzspwKP2HsI
         IkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:subject:to:mime-version:user-agent:from:date
         :message-id;
        bh=0TUkRJB50n712pgO5HmR6xj5xwLmMgILB7uyh83Px68=;
        b=mYykO5VMkMjsQ2nEqdssG7zcr46/lulJHmZcYkZYdYcDio41m9r8wbaYhQSA+HgO+G
         O5Ogxdfe25JN6V9dCpJuWEPP7XgZTyz5bDmIrONwdIYkRzzCAN8LRy88yP3xRTcBTCoW
         xrnWn9jRPpNNAisW9fatwZGhzx1d3hsKi5Niq6lWwUZWU3AsdLYyyXgdzU/qou8cMICQ
         UNlQ+8RqRVnhw3NEW0hmTR37ZJPNnZv0emWrOwH0EjO6vZG6skQauQldgrLGU7HibqGF
         Sn9CkcrEna+Z3qJ7OgVSfrQmSOWT/vpkRObjTInpJGtr9GOM74x8Lfm1zgcAzR9Y7k03
         U0Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si14665272ybf.138.2020.11.18.18.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Nov 2020 18:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfZfr-0004CV-7E
	for alex.bennee@linaro.org; Wed, 18 Nov 2020 21:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfZfi-0004CD-Cl; Wed, 18 Nov 2020 21:27:42 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfZfd-0007eN-J1; Wed, 18 Nov 2020 21:27:42 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cc3Tz6tbmzhY3r;
 Thu, 19 Nov 2020 10:27:03 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 10:27:04 +0800
Message-ID: <5FB5D7F8.50003@huawei.com>
Date: Thu, 19 Nov 2020 10:27:04 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <balrogg@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm: Fix bad print format specifiers
References: <5F9FD78B.8000300@huawei.com>
In-Reply-To: <5F9FD78B.8000300@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 20:50:45
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3btPS8kf1rJj

Kindly ping.

On 2020/11/2 17:55, AlexChen wrote:
> We should use printf format specifier "%u" instead of "%i" for
> argument of type "unsigned int".
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/arm/pxa2xx.c | 2 +-
>  hw/arm/spitz.c  | 2 +-
>  hw/arm/tosa.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 591776ba88..1a98f3bd5c 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -675,7 +675,7 @@ static void pxa2xx_ssp_write(void *opaque, hwaddr addr,
>          if (value & SSCR0_MOD)
>              printf("%s: Attempt to use network mode\n", __func__);
>          if (s->enable && SSCR0_DSS(value) < 4)
> -            printf("%s: Wrong data size: %i bits\n", __func__,
> +            printf("%s: Wrong data size: %u bits\n", __func__,
>                              SSCR0_DSS(value));
>          if (!(value & SSCR0_SSE)) {
>              s->sssr = 0;
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 32bdeacfd3..772662f149 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -586,7 +586,7 @@ struct SpitzLCDTG {
>  static void spitz_bl_update(SpitzLCDTG *s)
>  {
>      if (s->bl_power && s->bl_intensity)
> -        zaurus_printf("LCD Backlight now at %i/63\n", s->bl_intensity);
> +        zaurus_printf("LCD Backlight now at %u/63\n", s->bl_intensity);
>      else
>          zaurus_printf("LCD Backlight now off\n");
>  }
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index fe88ed89fe..66b244aeff 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -150,7 +150,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
> 
>  static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
>  {
> -    fprintf(stderr, "TG: %d %02x\n", value >> 5, value & 0x1f);
> +    fprintf(stderr, "TG: %u %02x\n", value >> 5, value & 0x1f);
>      return 0;
>  }
> 

