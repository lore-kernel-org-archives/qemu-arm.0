Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2782462lfc;
        Mon, 18 Oct 2021 02:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUArFXovzH358GFEY8AhO4Nhc41o4w8i2D8efyjDzaAs4m1KK0HrBtx8sNO4bsd1/5lrIH
X-Received: by 2002:a05:6602:158a:: with SMTP id e10mr13277966iow.157.1634547872715;
        Mon, 18 Oct 2021 02:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634547872; cv=none;
        d=google.com; s=arc-20160816;
        b=FvNGjDDMG2XqkO7a08fouylMWa+kTiAGGCkTZR/45IfGU6AkUCFMkNmZT6LdC3N38M
         z3HA5MkKm4egz9RCvaCsuILgIkgxjJjMjVemdOVcng0VreTUt0qiDlXsDtY2IshpyF3f
         NIgeRp99Tzk0phJSdsEr5HOozWP7H19bRq2TXtsX25KHP4H8f9FBxnUYAGi/9WPgpR7C
         U7jAedLWgNt/gUD0212mbrG+saay8gJfNdR97lSZdgkLsKh714Mfo9lq/uqJScp52k3W
         YcozFPsiCUZBrMVdjXTZkVYV9OA8OhHp8c4n8W+Lo/XksDrYAbI9+y8JVNirzaQIqD4m
         VxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=W5CahzuvOrSk8pb0L33TERMtgw+bzh3PmD4SwczZqSQ=;
        b=hZM0PJIEqqaZGzu6nWlfCTG3vmRqWSzc9duRC08x2QMO+KeJuq7e8K7mEaOsE6F8CO
         cN+d2/wCopGUuYnv8+1kH2/PFfy+ApX00OJjQeaQitoMjtUAt0yM6uRkY66fd/VnUbYn
         zXHW/nA2iJwRcnJlrxgJGS/2QO1vEkDOH1tSuiNB9uAjqrQ0DxvBDOQcKJwD1oujt/DU
         KGJHZbcB4qfDCK91XZvclNcL5+eK0Dio4SMNON8NSDOlVCn23Cv8F5kC4Ft7WFUupQOY
         XqvmAlBoh2C4/8Qm8I6CN8vngaSTOx631cKBXqUPUEAbjX+G351e4DYp/5Gol4zRNMoY
         Fs4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=XLIDcthh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si13833254iot.102.2021.10.18.02.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 02:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=XLIDcthh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcOZM-0008AX-0W
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 05:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOZ5-000897-Tf; Mon, 18 Oct 2021 05:04:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOZ1-0004YG-8m; Mon, 18 Oct 2021 05:04:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso7848982wmb.3; 
 Mon, 18 Oct 2021 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W5CahzuvOrSk8pb0L33TERMtgw+bzh3PmD4SwczZqSQ=;
 b=XLIDcthh7QAVLY1G62+M1o/h6SFcs0X8kXh9ZixQAkZF3AFGH8EXGAsBwY0+jg9fhK
 RZtWSuD3P6gDTlqbUlgrEUkylD6YJuXUeamFrRP0Mw76ZlLcAkVxCfxoDkarzb0ozkcH
 vcP060PMxus3HXLM6FhwXj7Usj8ehh5mSOn6SV9ZPXGitoUWgXVuqN7I+U4t+S88o2lY
 ktfg/GCTEtWdAqLlJwwIYRanFu/RI6ffUjzWJM5BEGaHTPhLaEAcswzoKZAd0bEPbTTV
 ROKZWhTdwirEzYKJkFQbKmpr71JbTvBrD1Q1eTwNK7IAdyj9hrJsCCOtn6R+hmfE0IBD
 oVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W5CahzuvOrSk8pb0L33TERMtgw+bzh3PmD4SwczZqSQ=;
 b=5dCbmZwo4xwESJq3Hoj6uFuD6uqrKHEY+yWZVsaqjMu8P57Xdbdkf4/DJfZX2rwSTi
 JHLXWx3B+vyI1CBWa/qkvpdoNItbmZgCzjwjasy3VTs4x8nqO3qbd1v70i6KwZljtE/k
 QDl5oLfDPXwL/Y1SpcdUrdBAUEHykgdrZ1c7nV0v5f1nPoyijYBeIyBEehWJdWi4VYUx
 0lepWLcHCeFG6AP/AKbq9HxPWvxVrSb0yhRXKUpSDWzzfrnw7R1+Ewl3gAKOAj3tB6Wb
 y4q5fcKrZQxUZk5sYL4SP1ApSUjaQfY0Zg7oyXTaCD1xcwS6EXmccPKJokYpSlA1XXMr
 z2xg==
X-Gm-Message-State: AOAM530h6KgBgmNIFYSOsc+fBXCaX4JSFI5YL/A2UWwJ+EPpQoxKddSY
 NIoytJTvsGO44faHHRYjoKk=
X-Received: by 2002:a1c:c908:: with SMTP id f8mr43076037wmb.142.1634547848447; 
 Mon, 18 Oct 2021 02:04:08 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k17sm12168042wrq.7.2021.10.18.02.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:04:07 -0700 (PDT)
Message-ID: <484941d7-d6c8-70df-87f5-525078d072e6@amsat.org>
Date: Mon, 18 Oct 2021 11:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/4] aspeed/wdt: Add an alias for the MMIO region
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211004154635.394258-1-clg@kaod.org>
 <20211004154635.394258-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211004154635.394258-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F11Ps0m+j0cK

Hi Cédric,

On 10/4/21 17:46, Cédric Le Goater wrote:
> Initialize the region in the instance_init handler because we will
> want to link this region in the FMC object before the WDT object is
> realized.
> 
> Cc: Peter Delevoryas <pdel@fb.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/watchdog/wdt_aspeed.h |  1 +
>  hw/watchdog/wdt_aspeed.c         | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)

> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 146ffcd71301..6426f3a77494 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -261,6 +261,16 @@ static void aspeed_wdt_timer_expired(void *dev)
>  
>  #define PCLK_HZ 24000000
>  
> +static void aspeed_wdt_instance_init(Object *obj)
> +{
> +    AspeedWDTState *s = ASPEED_WDT(obj);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
> +                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> +    memory_region_init_alias(&s->iomem_alias, OBJECT(s),
> +                             TYPE_ASPEED_WDT ".alias",
> +                             &s->iomem, 0, ASPEED_WDT_REGS_MAX * 4);
> +}
>  static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> @@ -275,9 +285,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>       */
>      s->pclk_freq = PCLK_HZ;
>  
> -    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> -    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_mmio(sbd, &s->iomem_alias);

Exposing an alias that way seems odd. Don't you want to use/expose
a container instead?

Anyhow, by moving memory_region_init_io() in init(), the region is
available for linking before realize(), so why do you need an alias?
