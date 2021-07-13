Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp334805lfc;
        Tue, 13 Jul 2021 00:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtL6VLMEyXXAWvT9HyRqqtxwZFrZYRnu2YO09W/0oGPMKy2NLzgYRK/vx9BaPKpYjojC3I
X-Received: by 2002:a67:b40a:: with SMTP id x10mr4437786vsl.6.1626162132334;
        Tue, 13 Jul 2021 00:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626162132; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7Kb/wuruuwsP1LOzQD0yQhYocSGdTBnkla0umD1YemJr9E7UofzX3lT00vg3cMXEf
         GHmCFzqe2fZWGxIUWQL+5IXdjv6u/XEuApIxcLtVd2IhCITWmVijWwxuOuhe6XEGSQ5y
         myd0ilp5WjMbid4jdSaZft8SX0Ggy74rmyAUk8omqt9KUjqN/rfX1V/9ztC87YBpODuz
         u7/iRx4R4HSd0AtuTAt6hqEp/erMQSfGmeyhREn1l6i3gytwsq4nOBs/uZ4DKytdsHPg
         vCye3zKCfMNy3WrKRBc49EUEyIagIAiUkR9ED+EsqvraJBDUl11VDJnOpvhb0p0Bro/L
         jEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=zBIuddja685c24E6dnKH3bKIcRki0Rgq8+pCOGs0uIs=;
        b=XqmC4Ko7qWMktnzhZisv8G9NGI+9t36fqJol6TASZ2A6PwtxPlYt8VhZv55dxxBckc
         ejq4qIKYeUj0kqN7sZLd5sXZThspm4utawDrS1MZ8r1qC9VScD2GFpo0eVN9iBW2s3DI
         5uOOrzHeJqm3NTVjYp+B/oRt3rmJN5zuJmecuyf8uWtkuqIpAuNZdkD8lzn5kS4xkY61
         IcziyCgNpSu2W8uqYn2Mi7h5LZJJTHMmiq9dTrCPEhmb/YWZMgvN5N0I9PNcFUn2YA9X
         f7T2O0+cmRTvQtWvJJneBr1/Qz1DY4QLtfAaI8gUrYxinT+IlTnrs7lrVZn8eRQeBgJ8
         13kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DR2SO9Lr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si15182554vsq.423.2021.07.13.00.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 00:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DR2SO9Lr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3D3T-00048g-Mh
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 03:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1m3D3L-00048R-Fw; Tue, 13 Jul 2021 03:42:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1m3D3J-00070H-TZ; Tue, 13 Jul 2021 03:42:03 -0400
Received: by mail-pf1-x436.google.com with SMTP id 17so18798976pfz.4;
 Tue, 13 Jul 2021 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=zBIuddja685c24E6dnKH3bKIcRki0Rgq8+pCOGs0uIs=;
 b=DR2SO9LrRmyodTBTP2wVmctUfgpZ+gWUlB26jKsbzeLqJOipWNC+W8X+uMeksMR450
 84fzfRzRO2BMXdwgFAbOxAWB55hVARd2z29vhqC5+6ryPF+Pa8NTKDCwtL3sz/TW3oUC
 QdSY8tVF7XjpLpDrBJKQDMvRQEo+hfWwqYNP2/FTYswjPjAJzNj49s+74d5uRwX/0hAC
 HLS0VWcGGTZmu+3BNaCvatZ80xwmcJWqb6LtjYvDVMN7/OGCIMFJP6LHPVmxrJj0tD60
 2G9q4LBebn0XwCG2BiqhEsqIHkOTS1rpivCRKcngC/dKZLzMg24mflMX2ptwPesf/Vpk
 HHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=zBIuddja685c24E6dnKH3bKIcRki0Rgq8+pCOGs0uIs=;
 b=lDaAXNoxnqfjtJm7Bx3Dee3GsOqHL0MZ6/qknKb9SG+lmLHlBgGcAlLGIhZvuXezU/
 8R92+9ncKPdQvMA22BZ7jGtMjvXFSqRPTwbPj++LAGAjldA0mKP3nWi9Ou6ERkaGbNBT
 LzrlCZ1UgNpra+spt+v+VcUyElbiJAgM8cOMk/Atf0K06uJdN03zxJGTimNqyFjqn7RQ
 x89zBe+6lR+6i9MNF/q9xSmzSnktr/4JJSMzDOrIghHnFLm2GQoEySXpxyDW51kIzedK
 R+DPjI28oKukKBkQ3QUd+4xp7e0+VQmxAzOWVdIvrYAxvkasw/2hBib6ztV9Wb/zs9sw
 OQDg==
X-Gm-Message-State: AOAM532j5xx6gYSjgGAX25J5YYa/6/CoCzdmCzGh683WgoTBFNpjWYen
 79Xr2rqMYI0uOSUzRiRQqFE=
X-Received: by 2002:a62:4e0f:0:b029:329:20be:287a with SMTP id
 c15-20020a624e0f0000b029032920be287amr3304167pfb.55.1626162119439; 
 Tue, 13 Jul 2021 00:41:59 -0700 (PDT)
Received: from [10.0.20.43] ([103.217.166.124])
 by smtp.googlemail.com with ESMTPSA id y9sm17636881pfn.182.2021.07.13.00.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 00:41:58 -0700 (PDT)
Message-ID: <e3f179b3e2dc4ca79a3796a4001ca89bc8b819ff.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] hw: aspeed_gpio: Fix memory size
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Joel Stanley <joel@jms.id.au>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Date: Tue, 13 Jul 2021 17:41:54 +1000
In-Reply-To: <20210713065854.134634-2-joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-2-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=rashmica.g@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wvEcmIcXK+JW

On Tue, 2021-07-13 at 16:28 +0930, Joel Stanley wrote:
> The macro used to calculate the maximum memory size of the MMIO
> region
> had a mistake, causing all GPIO models to create a mapping of 0x9D8.
> The intent was to have it be 0x9D8 - 0x800.
> 
> This extra size doesn't matter on ast2400 and ast2500, which have a
> 4KB
> region set aside for the GPIO controller.
> 
> On the ast2600 the 3.3V and 1.8V GPIO controllers are 2KB apart, so
> the
> regions would overlap. Worse was the 1.8V controller would map over
> the
> top of the following perianal, which happens to be the RTC.
> 
> The mmio region used by each device is a maximum of 2KB, so avoid the
> calculations and hard code this as the maximum.
> 
> Fixes: 36d737ee82b2 ("hw/gpio: Add in AST2600 specific
> implementation")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

derp. Sorry about that. This looks correct.

Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  hw/gpio/aspeed_gpio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 6ae0116be70b..b3dec4448009 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -207,7 +207,6 @@
>  #define GPIO_1_8V_MEM_SIZE            0x9D8
>  #define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
>                                        GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_MAX_MEM_SIZE           MAX(GPIO_3_6V_MEM_SIZE,
> GPIO_1_8V_MEM_SIZE)
>  
>  static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high,
> int gpio)
>  {
> @@ -849,7 +848,7 @@ static void aspeed_gpio_realize(DeviceState *dev,
> Error **errp)
>      }
>  
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
> -            TYPE_ASPEED_GPIO, GPIO_MAX_MEM_SIZE);
> +            TYPE_ASPEED_GPIO, 0x800);
>  
>      sysbus_init_mmio(sbd, &s->iomem);
>  }


