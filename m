Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp724319ejn;
        Thu, 27 Oct 2022 14:41:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SE0hEof/tY0OKwrl2L8OJxNAkcVFM8hH+xYY9qMhVM/nzOkpUEyY105+lbM+2VmtdY0RN
X-Received: by 2002:ac8:57cd:0:b0:3a4:f286:d14c with SMTP id w13-20020ac857cd000000b003a4f286d14cmr7989028qta.15.1666906896257;
        Thu, 27 Oct 2022 14:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666906896; cv=none;
        d=google.com; s=arc-20160816;
        b=IvZhLREvoe5vmBOQgwRqNy4H94tzs0WAB4GKZ/9t+E35cLeGGaREKo0s2pg+hde8ZO
         hsQ/a33jR6AKm1xk2C3d8UeAryH15j+w6qM8hfhigKq0IM26DGKYDnK4JwFBglP7YTan
         Aj7LAU6KRo/0lREsIwt3v7vmsuRMZ+TYCPhGVaAbEPUFieE42J7DINv2Y01j6f5t4/IY
         DY/xp/HL5hP40VGQc6B1SoLGzxdhsZXj2rlqOjQZyKl8ZE9rsXwC5P8kewd8A5ozUBJ0
         GwWg/dMOGtn+fPFyyOa+RwKb8qI/fJLaXfqp2WBweF4HRdRTDu2XDrHZvk6B1mGkxdGR
         FYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Tqz37kYB6uHx5KPzbhm445J/fwRI3Pyt1inJhMkHi6M=;
        b=vscVAS61Tk5p6vk9sOQfJZpLuNzG/VlnpUZWdJDoCADOyT/uHRHA02KLKinmYOBGxO
         D0pomizlgqz8WjB2csqkXRu256W5RDi2+lo7jIbHijBgRM1LWAdRHroheAkC47uMkPgL
         p0MXwmnu4rcLympazCLpcaMM+PAIB6Bq0edc/YlKcpzwq16qkyhHldaayFrKN8S8m2a3
         J06sJ3exu26xDhR+sqxUFwjY00AYYV5/63f9CqWF2BlVzFTY2Z787XAU7w25td1k8kp6
         /gFll82tTcQz7z+7ik0ARiYcb7IYCjWhN8fPKiFaJPU/kVTpbP9smilVPcXQwLOyiiGn
         9OlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UqmNUduY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt1-20020a05620a478100b006ee88caf51fsi1649712qkb.200.2022.10.27.14.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 14:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UqmNUduY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooAbo-0000uZ-Lk; Thu, 27 Oct 2022 17:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAbm-0000tt-HZ
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 17:40:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAbf-00074L-JN
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 17:40:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id v1so4350590wrt.11
 for <qemu-arm@nongnu.org>; Thu, 27 Oct 2022 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tqz37kYB6uHx5KPzbhm445J/fwRI3Pyt1inJhMkHi6M=;
 b=UqmNUduYk6+GVF5ZnkIamxcaHVEl/QehBh0mSQB9SvFLBSZhTqazB8xO7ztwVJqpF1
 otgFpLnLZavXSeRASKvyIrs8Ip1LDJzKUEldpWbewpnXhP40Dn9HmUf+UsMPPBYAp5l6
 p0CGIz4IyEB2E1Y80ooG/LSt9+/E27WNdjRNS9BHtFjzAdoLOuf26G9jh4JBhdNMTC6j
 jU3h9B8YQq40NhyZ9hnjk+2hpKip9eHfmsVkr2vVo3py1bWKcbBXA4TpS1yi2bcWSL6I
 6V9JObNHDWWsFtJh9spfh+pg6Wk7r6y+S2qPAnGtFd1EZoQ6hjy2sZiyILQlJJiopLUK
 dkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tqz37kYB6uHx5KPzbhm445J/fwRI3Pyt1inJhMkHi6M=;
 b=tgX28gaL6d630EniUxYpNl/oWohtnrIbBOokDTZ6HUrW2Xm0Y67yVS8J69CiuPPoCc
 opfeyHR3wv79bJCULiqBTucRgc8/FFTMWk1SFD97xmAAL59M4AiFIWkKrolDuYhowX92
 nCcCYWaINwGUy4NUjFI/st+NfYomDBNr5htlt9v81NvqsaYFTXzycqhNxuTBioJHf7wD
 v198Tf61vbUKZEoqpNachPaVq1ZKb16+AfGsO9oi6WqlctOfaGCdg7tDChiyPqXJKhq3
 7A+CQPmgnMa+7+yQ7YLPCfnyY3+hM+eytHC1s16sGtsmp0A0zyxfSv+xKZ8wcJMh6+YG
 WYUg==
X-Gm-Message-State: ACrzQf08BWIGOxogGinX4je2KhlgFYlMWy8TjFUl38cbJgBI5pwb7028
 +OCCAxWa9/NEsgAwXECW7saC4g==
X-Received: by 2002:a05:6000:1686:b0:230:e1f7:71f5 with SMTP id
 y6-20020a056000168600b00230e1f771f5mr32487228wrd.185.1666906805094; 
 Thu, 27 Oct 2022 14:40:05 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a056000170f00b0022cd0c8c696sm2163244wrc.103.2022.10.27.14.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:40:03 -0700 (PDT)
Message-ID: <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
Date: Thu, 27 Oct 2022 23:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 6/7] hw/sd/sdhci: Implement Freescale eSDHC device model
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018210146.193159-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /nek+WLx7xWp

Hi Bernhard,

On 18/10/22 23:01, Bernhard Beschow wrote:
> Will allow e500 boards to access SD cards using just their own devices.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/sd/sdhci.c         | 120 +++++++++++++++++++++++++++++++++++++++++-
>   include/hw/sd/sdhci.h |   3 ++
>   2 files changed, 122 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 306070c872..8d8ad9ff24 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
>       s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
>   
>       s->io_ops = &sdhci_mmio_ops;
> +    s->io_registers_map_size = SDHC_REGISTERS_MAP_SIZE;
>   }
>   
>   void sdhci_uninitfn(SDHCIState *s)
> @@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
>       s->fifo_buffer = g_malloc0(s->buf_maxsz);
>   
>       memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
> -                          SDHC_REGISTERS_MAP_SIZE);
> +                          s->io_registers_map_size);

I don't think we want to change this region size. [see below]

>   void sdhci_common_unrealize(SDHCIState *s)
> @@ -1575,6 +1576,122 @@ static const TypeInfo sdhci_bus_info = {
>       .class_init = sdhci_bus_class_init,
>   };
>   
> +/* --- qdev Freescale eSDHC --- */
> +
> +/* Watermark Level Register */
> +#define ESDHC_WML                    0x44
> +
> +/* Control Register for DMA transfer */
> +#define ESDHC_DMA_SYSCTL            0x40c
> +
> +#define ESDHC_REGISTERS_MAP_SIZE    0x410

My preferred approach would be to create a container region with a
size of ESDHC_REGISTERS_MAP_SIZE. Map the SDHC_REGISTERS_MAP region
in the container at offset 0, priority -1. Add 2 register regions
for ESDHC_WML and ESDHC_DMA_SYSCTL, and map them with priority 1 in
the container. ...

> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t ret;
> +
> +    switch (offset) {
> +    case SDHC_SYSAD:
> +    case SDHC_BLKSIZE:
> +    case SDHC_ARGUMENT:
> +    case SDHC_TRNMOD:
> +    case SDHC_RSPREG0:
> +    case SDHC_RSPREG1:
> +    case SDHC_RSPREG2:
> +    case SDHC_RSPREG3:
> +    case SDHC_BDATA:
> +    case SDHC_PRNSTS:
> +    case SDHC_HOSTCTL:
> +    case SDHC_CLKCON:
> +    case SDHC_NORINTSTS:
> +    case SDHC_NORINTSTSEN:
> +    case SDHC_NORINTSIGEN:
> +    case SDHC_ACMD12ERRSTS:
> +    case SDHC_CAPAB:
> +    case SDHC_SLOT_INT_STATUS:
> +        ret = sdhci_read(opaque, offset, size);
> +        break;

... Then you don't need these cases.

> +    case ESDHC_WML:
> +    case ESDHC_DMA_SYSCTL:
> +        ret = 0;
> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd @0x%02" HWADDR_PRIx
> +                      " not implemented\n", offset);

But then I realize you only treat these 2 registers as UNIMP.

So now, I'd create 1 UNIMP region for ESDHC_WML and map it
into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - 
SDHC_REGISTERS_MAP_SIZE (= 0x310) and map it normally at offset
0x100 (SDHC_REGISTERS_MAP_SIZE). Look at create_unimp() in
hw/arm/bcm2835_peripherals.c.

But the ESDHC_WML register has address 0x44 and fits inside the
SDHC_REGISTERS_MAP region, so likely belong there. 0x44 is the
upper part of the SDHC_CAPAB register. These bits are undefined
on the spec v2, which I see you are setting in esdhci_init().
So this register should already return 0, otherwise we have
a bug. Thus we don't need to handle this ESDHC_WML particularly.

And your model is reduced to handling create_unimp() in esdhci_realize().

Am I missing something?

Regards,

Phil.
