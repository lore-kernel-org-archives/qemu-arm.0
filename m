Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4631571ejc;
        Mon, 27 Feb 2023 05:37:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+nQQUoDWoxeTc17+f24Fpq7Wh3TTjk4epnlvnjymDhBnc687svjjc95p3sIVDS8cLBCxBk
X-Received: by 2002:ac8:5945:0:b0:3b8:1f33:ab57 with SMTP id 5-20020ac85945000000b003b81f33ab57mr42821566qtz.59.1677505040367;
        Mon, 27 Feb 2023 05:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677505040; cv=none;
        d=google.com; s=arc-20160816;
        b=SjMIEl1GfUUteUlbC8bPAeAbzDZhrnh8R8fwHr0vZ0fc4mzbNmaSIBR3hchJbtPqBd
         RZiGwnBOn9UK3RdaO2vp0nzkd9fxs1VTkmEFvZjv0LR8Jy2DTw1+AzX48IGVgRhkn7Qo
         zbPnwkkfx5y4M36Zvm70NvT2QLJnIfjN1GH2A/ncXuSxWA6t1SiCJo323ZuQzqtZs7rH
         LvOekWONyHACYjCWg9S91rjJYOlNaH3t0idSr/Ghini33BmTV5d6DzuIGNLN0smMuI4r
         Jtxb9yqdRGbiAQgeI/E3fEKl8zH2WI41XPWAoqo8loHY5yR7StLETxWrPfvhyWS/YL+o
         L2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZQ2vrDZNBIsBSNb8eZfl8obWkEBYq4wdGAnGqJmvtwg=;
        b=bsL8SfcTK5I7HHQjfBrJNPhW0fJkpA8HnlIF1N08aRbOozl0oqYZYfFCS6TwHr1UqT
         ZTaUQWzBc8z99zq1AXDwSclC2qWfaXNMrnni0uMZWxoZqB8n30uymXUWOjXaRSuPApPD
         XbjQk2LXjWr3eG9sZ58iyDoT7emQZRPG/NXdnvziuy0xYn0u8QV0GZe3Y4Wr3+XFFaph
         mOBoyZbusnsvo3LDokhtoMBw1EziTs3YLICU49oiyA248kgTCFXumq2yExnenKZzKrxe
         7D/DRRGyu4XrQrdBX0MmwkGpWnB9FBtnN3uIOeoG7M2etYsqhsgt3GrUqW46vYBZWCKv
         0jnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uOFohQpz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020ac85c0c000000b003b569f2ce62si6830230qti.475.2023.02.27.05.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 05:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uOFohQpz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWdgc-0002OA-8v; Mon, 27 Feb 2023 08:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWdgY-0002FQ-3a
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 08:37:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWdgV-0000LZ-W0
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 08:36:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id r18so6266758wrx.1
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZQ2vrDZNBIsBSNb8eZfl8obWkEBYq4wdGAnGqJmvtwg=;
 b=uOFohQpziXBAU0D9SGHCow3EsJIqS6N5R38I3C9fyBAOEaAhaDHztbbKHkkARxYzlk
 R9k+aplI2sVeoEsrszc3SOe6yeZzvqDBFkhHUUGDiLjZ8pTI9ckwToOR8PEERIDMzhWr
 Td/I/zCrxxQ617A+MY03VX0T5enYzs1CoLz47cRgPbB3jctdkRrHUFtMMS1Yp5DiR97g
 WqXJ9CZq3t2AjJuRNBb6YDITy13VmSYC8uUb8Jc1kYKB0RQrOaAjH03pm81hrCjZTslp
 Rm2F/bKNjzzlnAVay5Zevhpx6ENE1Drfeq0m5UeVQxdY4p4T9X3ySCGXnn1PMKd6AlEJ
 3rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQ2vrDZNBIsBSNb8eZfl8obWkEBYq4wdGAnGqJmvtwg=;
 b=OyO2dkxrVbU7NaTX1eCzGR7smhOQuuszGloQBjWNJm8sfag0nZ0R7b8A1mcKRgQaC3
 uyOuJD0198qSX6MOoXitVH0s3FH7tjpZ4mNhiVwgKeA0ow3CeGh4oPMd5EWZwL+1Sik6
 3V47eQLA4Uioy6s8Qedmkh7dsQw74u6wsaifmXv4Q7Kv4fPBpXIL9X+AqzuxZGVY98Mz
 nNwobDmhoDEzTghmbEA+3ZQk1M0AfWDJv7nr5Dld3WcLo6So9P0NV8S2NfCKBuXqXS5i
 vg5HbIjopEdmU6QGvR2y7FkGIZGTV2iSpOQXX0OUrLo1wfQYmPuMDWmqfy36Od9tlj5K
 /N7w==
X-Gm-Message-State: AO0yUKU/uAiEUdaHtPA4jCnElPZw6dxMnZpZz2+rEeMxOrNgYO7rFVxz
 m0n7fb17sNIBzdU3yRtzVIgMBA==
X-Received: by 2002:a05:6000:5c1:b0:2c5:4ca3:d56c with SMTP id
 bh1-20020a05600005c100b002c54ca3d56cmr5797965wrb.0.1677505014578; 
 Mon, 27 Feb 2023 05:36:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b6-20020a5d4b86000000b002c5691f13eesm7085390wrt.50.2023.02.27.05.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:36:54 -0800 (PST)
Message-ID: <efb25519-b134-e8d0-14ac-58189b39103d@linaro.org>
Date: Mon, 27 Feb 2023 14:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-13-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203145536.17585-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fUJZBlgCAofX

On 3/2/23 15:55, Philippe Mathieu-Daudé wrote:
> Since now PCI and SysBus properties are identical, unify them.
> 
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/display/sm501.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index efebd93f1e..98375138b2 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>       /* TODO : chain irq to IRL */
>   }
>   
> -static Property sm501_sysbus_properties[] = {
> +static Property sm501_common_properties[] = {
>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };


> @@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>                        &s->state.mmio_region);
>   }
>   
> -static Property sm501_pci_properties[] = {
> -    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),

Patch is invalid:

$ ./qemu-system-ppc -S -M sam460ex
qemu-system-ppc: Invalid VRAM size, nearest valid size is 2097152

> -    DEFINE_PROP_END_OF_LIST(),
> -};


