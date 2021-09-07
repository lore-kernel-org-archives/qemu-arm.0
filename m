Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4503901lfb;
        Tue, 7 Sep 2021 01:37:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzl6xuBZEvZ7pXtmZmKjrWzM91iZDEEHU7M3d3Gw1WckHqa3l7w66H3OX9ZLnkqPFA/OxZ
X-Received: by 2002:a25:ad1a:: with SMTP id y26mr20522211ybi.5.1631003834183;
        Tue, 07 Sep 2021 01:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631003834; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZZ1iL14z0NlJbGFcQdEj4UyICAUvkQvVYe85kSdys7yX9A9a28+SuPwOzV6th2GUy
         C2dqDzmLRp6yaRiwShcgDiQctGtuuQu79W3cRATc0so1Gv7soWgQRzR/5ABw6Qn0NTw7
         EXPcugnT+1937tEv+hPg6yGydyIFA4sPC65JEIBo+CfH4sbQzXtD5j+LCPX84bbdP6Zr
         81+vtBqMW0HmtL2EwRduweCUV1kv/mA8pv70YhuXPA7aVPoew/VfG6KOXHqjyTDo0N/l
         vzb8eReh+iLyhfImiPW352NOuCU1Skom2sVhG3NnhgpcMIGF8vfciSlf341ujt7lahED
         zQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aY0SG9zXMxDTVpWt0FDaIE5RHsqaNhDGalP9dvIzl84=;
        b=iNPmGWbk1qFlCtY1fOHULR9GVgM809CgJZO3MCQrV7K4cssd3M0JXYFENLHRP9Vyge
         bSE7Gps4wtH2Ca5mhtBze3SPtPLQJuIYQ5W2e93nSiqyCLGn/SWeKgCIlrHWgRZP8Muq
         Tb9JqjhJiDfomjqTtpbA98gEE0mbcHkjokS7hNHnuX+zZp75IcYZAEwBZFsy0SMi8OVj
         glPreYp2y8103gcQfefRJu6Y0t4CQRYSW+GeFZTSqthOS9d8NtJ6tuOJgHWgfD2utoyK
         z/kmFR3LxKJ3Jzmc1IStDwxSflT5OiLyJxA1GqmQaNMW4CjAtOw+AfrfBxlgzvxN1D0E
         kHkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="DwZDF9/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si6680520ybk.169.2021.09.07.01.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 01:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="DwZDF9/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNWbR-0001SC-JZ
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 04:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNWbG-0001Rv-Qw; Tue, 07 Sep 2021 04:37:02 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNWbF-0007od-3n; Tue, 07 Sep 2021 04:37:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso511307wmc.1; 
 Tue, 07 Sep 2021 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aY0SG9zXMxDTVpWt0FDaIE5RHsqaNhDGalP9dvIzl84=;
 b=DwZDF9/Dy7RztEk9AQwsKbVIAewYEdYxvgq/yFYr3dlGePrGKhAeaNnfEDqttcZSvy
 Xu4Qg1W8RSM+MWB5tk/s3baDj8J/W8u3SszHWBYxTHx8rwXzx/EeufnLJRn3j0YfGedb
 IfquZ44E17QqiThLeWEO36hQJF1zlchvTE+Y5knK6Y1oySA68Fchh9qOte496lJW5qZA
 Go+AssWozQINDibnQJk6MBuezuRKdblwrd4Nde6hPmSCRBHWavLUYuz4NTiNNAForq8l
 aAHeGJubCmQhZmcOt7DkLRJ/cIDtpjDqus35Rv+aSd6rU81OssPM/3+RyPXr5aTXSgHf
 QFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aY0SG9zXMxDTVpWt0FDaIE5RHsqaNhDGalP9dvIzl84=;
 b=kgkQual94MRGdC6Ye4yUiQcXK/sPqldwoix2aJpuWoqw7EdkLJQpbBCMBDUcE43OWY
 HuQHMmYUTOBb7e66pVTg4xREUj1KQSb/K7cMGWpY3N1hvbIYTTvXY9p1IU5elk88sTkD
 DsZgb6EmkERG1byiNl7tfG4P+ZDtSMSsPJfSozvq5/uXr/tBcc1CTrx/S9xijqoAl8Nr
 QbvGS+zQY99Zfwe5ELGFRbEph7p92gV2O5xqQw1nMI6DiImmprF/q+SYFFE78U22Lme6
 SjcHSZqw3vizyTqepDdvlmwG/S/5Bas97d1v93KBKB+WmHUXZX2dcq2VewdpEmzrFu+S
 5DrA==
X-Gm-Message-State: AOAM532j6w8EC/Sm5MvgVZ1c65585E0pl6ZDl11+9j00MDFE/DLhO+xq
 8oNsEAwpmjSIzWK23int0xvwyEDBW48=
X-Received: by 2002:a1c:f206:: with SMTP id s6mr2836772wmc.102.1631003818803; 
 Tue, 07 Sep 2021 01:36:58 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s15sm10073657wrb.22.2021.09.07.01.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 01:36:58 -0700 (PDT)
Subject: Re: [PATCH 05/10] aspeed/smc: Remove the 'flash' attribute from
 AspeedSMCFlash
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <497a0a23-570c-964d-80cb-e590749d20f9@amsat.org>
Date: Tue, 7 Sep 2021 10:36:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907065822.1152443-6-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fQy8ihFbbOb0

On 9/7/21 8:58 AM, Cédric Le Goater wrote:
> There is no use for it.

Hmmm this is not the correct justification.

This devices sits on a bus, so its state will be released when
the bus is released. There is no need to release it manually,
so we can remove the reference.

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h |  1 -
>  hw/arm/aspeed.c             | 11 +++++------
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 0ea536a44c3a..f32f66f9a838 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -37,7 +37,6 @@ typedef struct AspeedSMCFlash {
>      uint32_t size;
>  
>      MemoryRegion mmio;
> -    DeviceState *flash;
>  } AspeedSMCFlash;
>  
>  #define TYPE_ASPEED_SMC "aspeed.smc"
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 95ce4b1670ac..64c3a7fb66db 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -274,18 +274,17 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
>      int i ;
>  
>      for (i = 0; i < s->num_cs; ++i) {
> -        AspeedSMCFlash *fl = &s->flashes[i];
>          DriveInfo *dinfo = drive_get_next(IF_MTD);
>          qemu_irq cs_line;
> +        DeviceState *dev;
>  
> -        fl->flash = qdev_new(flashtype);
> +        dev = qdev_new(flashtype);
>          if (dinfo) {
> -            qdev_prop_set_drive(fl->flash, "drive",
> -                                blk_by_legacy_dinfo(dinfo));
> +            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>          }
> -        qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
> +        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
>  
> -        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
> +        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>          sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
>      }
>  }
> 

