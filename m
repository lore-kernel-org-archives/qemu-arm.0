Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1398404lfb;
        Fri, 20 Nov 2020 07:25:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVaKU7EEP7/8dSwUnpOLuOKAj7+mS2y1/H5QvGmSKiMM4ZQbLK1m0yOR9rGkkbzbNsFEYB
X-Received: by 2002:a25:a481:: with SMTP id g1mr22363063ybi.319.1605885906653;
        Fri, 20 Nov 2020 07:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605885906; cv=none;
        d=google.com; s=arc-20160816;
        b=pX3kOyRfGQgCG3CVgpGyhsCkSvZF9cy541hzXp99p8s/Jbd0OOce5h6CfgENBjIrPP
         cSSh1QSlk8mpwWuK2VMEnVypWpyEYoFVLZpI5hypG4EcuOOzENO+HvXY7ijW+RtNdgrb
         bSV9LbOtKulP93cvJQOD3lhiutEFWF6Vuv0XOO7ntcU4cOeFAS7gPReUSC4wqDFC1mHF
         C4TY2L4djQsXMgbBcT/oRcFJWXmFH8IgxCQ6Gm20G3GZUZL5R451FU7bK7VUa+WiVtfr
         fYCKxgl+v8hlFfP68ntsGMAWtBamJbEBe/nQQJAzkClKDvy8wR31S1bE/GEPYfF8PbK9
         qnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JVnl6T2g9RlHwD+zgfuqXQhg1TplgkU8MBhc83TBUzA=;
        b=ARvoEP/RZnMb9p2uh+RUu8kufN6ar2Of/zqFzpwz2qiZn7L3vEZv5CSN4UoQvr1qHv
         AWkWc8Ql0gd03yJUbwYQrCslGN+iRnq9ONZ1Q5jLlj6eubAi7wXUENtshcDWpb4ZLZPm
         NzcbT1hwbt2PmRUNZwXBevd2kyLL3bfmpY0mzdV2sA26UKN6y1kZV/UvRdjLAPiWnwPL
         pumw7tXFu2JKx5kxCp2Mc6ad1NWRf4Afw0j7PSqvGEKtvk+AeNOyKUJbd3ujFsvGBpW6
         TL2EysQwpnG8nHfWOmXudX6mV01C5nfyVUoUKlp6NAZVgrF8FjA/fwTqmqR10vFArf7y
         dQ4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cC+E8ozQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a64si3065869ybg.110.2020.11.20.07.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cC+E8ozQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8HZ-0000WZ-Sd
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8HJ-0000UX-Bt; Fri, 20 Nov 2020 10:24:49 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8HH-0002ym-Ig; Fri, 20 Nov 2020 10:24:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c198so8812001wmd.0;
 Fri, 20 Nov 2020 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JVnl6T2g9RlHwD+zgfuqXQhg1TplgkU8MBhc83TBUzA=;
 b=cC+E8ozQRHkAzQmla6ykuT0Hv8ktE1m2gD7rqghDcSoe24ZGcPkAwR7PwznCws9nHX
 28XFYwlxYwOhss0n+fb0sc8I/FNNZYo1eCwb4Jv5yVJVxHqRbTfDpWDEIRW/eDoDTZp4
 bkhUOuPAF4ff/6/StrNno4Txz8J1x9f51skhz8alyrZDtgauRAyY3DK1tqQM0Tq0AtJc
 QEcXbIPkva+9C0K5543aocwn/R7r8KR0BFMWegGwfwy0sXpcRFp970Vu+Uaav+bx7t9v
 /jlaMpJr8BQraRPYEVZcQqjXLR3Uws9y8Z2cSSkLkWT4w49TFjPRmPgVQK8GEHJC3p43
 GtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JVnl6T2g9RlHwD+zgfuqXQhg1TplgkU8MBhc83TBUzA=;
 b=nqsZ2UknlQiEacMuI5APP5IxdV6B7ZnFgF5DQOHNwCOw4Sm8B8q4ow2P2njjKyWxSY
 KcFt5J8WkKQPmYnE6XCTJtFE0vQkfp+H4+gtQ1g0EUF+e4WdUZYFDUpfEVffrmOfilRY
 T4MS22PBelvZihpMZ4ux52s4uY02gVUscEOLMekemNMEx6sh57xC3wXX+RGgKnEbH1de
 rjIgt6X8/rMckU0Zus844ISee8JUdvnCoVhWB9gYfSe35SzVZlF9YOeggDmUzG6SxuS9
 myC97fbkckx8DXnEGvY4j5fksI0Rufd6MLSwm5UvCjJcf0yrcb/oc62eOjHtCvc5zK1M
 C1Rg==
X-Gm-Message-State: AOAM533qhhL5DwFweeCEEXrZUTsHeiIUgtHdF0FpBFRjKHorbQUEJNIA
 N5i9GOANmkNG9IkIf1/D/3A=
X-Received: by 2002:a1c:790b:: with SMTP id l11mr10989041wme.53.1605885885871; 
 Fri, 20 Nov 2020 07:24:45 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t11sm4704605wmf.35.2020.11.20.07.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:24:44 -0800 (PST)
Subject: Re: [PATCH-for-5.2 2/4] docs/system/arm: Document the various raspi
 boards
To: qemu-devel@nongnu.org
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <445804ed-62d2-63f5-d48b-3d1f4355a6ff@amsat.org>
Date: Fri, 20 Nov 2020 16:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120152140.2493197-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zTSBoZ2LujfY

On 11/20/20 4:21 PM, Philippe Mathieu-Daudé wrote:
> Document the following Raspberry Pi models:
> 
>  - raspi0               Raspberry Pi Zero (revision 1.2)
>  - raspi1ap             Raspberry Pi A+ (revision 1.1)
>  - raspi2b              Raspberry Pi 2B (revision 1.1)
>  - raspi3ap             Raspberry Pi 3A+ (revision 1.0)
>  - raspi3b              Raspberry Pi 3B (revision 1.2)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/system/arm/raspi.rst  | 44 ++++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 docs/system/arm/raspi.rst
> 
> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> new file mode 100644
> index 00000000000..b19284e4481
> --- /dev/null
> +++ b/docs/system/arm/raspi.rst
> @@ -0,0 +1,44 @@
> +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
> +======================================================================================
> +
> +
> +QEMU provides models the following Raspberry Pi boards:
> +
> +``raspi0`` and ``raspi1ap``
> +  ARM1176JZF-S core, 512 MiB of RAM
> +``raspi2b``
> +  Cortex-A7 (4 cores), 1 GiB of RAM
> +``raspi3ap``
> +  Cortex-A53 (4 cores), 512 MiB of RAM
> +``raspi3b``
> +  Cortex-A53 (4 cores), 1 GiB of RAM
> +
> +
> +Implemented devices
> +-------------------
> +
> + * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
> + * Interrupt controller
> + * DMA controller
> + * Clock and reset controller (CPRMAN)
> + * System Timer
> + * GPIO controller
> + * Serial ports (BCM2835 AUX - 16550 based - and PL011)
> + * Random Number Generator (RNG)
> + * Frame Buffer
> + * USB host (USBH)
> + * GPIO controller
> + * SD/MMC host controller
> + * SoC thermal sensor
> + * USB2 host controller (DWC2 and MPHI)
> + * MailBox controller (MBOX)
> + * VideoCore firmware (property)
> +
> +
> +Missing devices
> +---------------
> +
> + * Peripheral SPI controller (SPI)
> + * Analog to Digital Converter (ADC)
> + * Pulse Width Modulation (PWM)
> + * Security features
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index a0d5c57799c..bde4b8e044e 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -90,6 +90,7 @@ undocumented; you can get a complete list by running
>     arm/nuvoton
>     arm/orangepi
>     arm/palm
> +   arm/raspi
>     arm/xscale
>     arm/collie
>     arm/sx1
> 

I forgot this hunk... I'll wait for review before respining.

-- >8 --
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -801,6 +801,7 @@ F: hw/arm/raspi_platform.h
 F: hw/*/bcm283*
 F: include/hw/arm/raspi*
 F: include/hw/*/bcm283*
+F: docs/system/arm/raspi.rst

 Real View
 M: Peter Maydell <peter.maydell@linaro.org>
---
