Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1932333lfc;
        Mon, 25 May 2020 04:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOX/WxPN6TrSuRjYDV9NnDXKZeMR5Z9bfunQMxDCq34c6DNhJp+jzuNmrDaxt74tULt5Gv
X-Received: by 2002:ae9:de06:: with SMTP id s6mr5761042qkf.173.1590404977075;
        Mon, 25 May 2020 04:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590404977; cv=none;
        d=google.com; s=arc-20160816;
        b=FRNHgkaqg2r2WfdZbO1UKBk/Cn/bAGxcPyyYs957wbsBicn2JvhVGFjB9gEFxVLq1H
         Kt7lOS8834w2r3xUpjisW8A2YWkxIipIJgwYvFteczhWlUbtgyxQ+4pdw35zXCH62IF/
         2C4MhtwNY3WxQTwYOgXzTQ2UznZh1Y2oyCAZ/tTXtuuvC8z70sgTe/KnZO2j9qiirtlT
         4Zodm39icNDBTmPqBAnAF0RWN9yN/LgdbfUwcapjwjeZam+18McemjjKFLfb547jMpLM
         F125R72YKKg7vtTGhnuS79nzW7jcmRL0+IAdcerF1Llcm9uzPEELryiwSe1wJ9kflR9K
         vR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qsDlFr7X5YpYxj34oz7cBsGY/Z0+d8AKGL3oMvP1VfI=;
        b=s/SRvbJmpRTfnBW9KmfGXQO0FlaQOP/nk89Az/QB69xBJLDT/y8BLyKoaZzhl6MSAi
         iuhcHJfmULu57+d210JqPIsC3FRD8O2bLvG4h4HMoefbvYWX6O2aUbBBpBXMc/jQLG1m
         h0SoazvpZYBXtDmpIbCSidg76ti4Inlw06vlNSUndXHLF+qedzbdRoWzYhHHE/Uz/bft
         W0FH4d8k+Yika9/SYrAmSAgcS56L8pZU22lkc0NAM7vy2qpuqPkIH0VeCTqCxKcDQHGi
         CyOhhnblRbYjc2OwrQ1SWoJFNBvBF02bfhywntnrLSSWZZ9qZskn+aRwVjPvYDZg3JX7
         0W9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EasWQ4C1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y62si9434451qka.278.2020.05.25.04.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 04:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EasWQ4C1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdAzA-0001lk-I4
	for alex.bennee@linaro.org; Mon, 25 May 2020 07:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdAz3-0001kh-OJ; Mon, 25 May 2020 07:09:29 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdAz3-0006lx-6L; Mon, 25 May 2020 07:09:29 -0400
Received: by mail-wr1-x443.google.com with SMTP id y17so8326358wrn.11;
 Mon, 25 May 2020 04:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qsDlFr7X5YpYxj34oz7cBsGY/Z0+d8AKGL3oMvP1VfI=;
 b=EasWQ4C1KLkYFLSU2hAQPnqxFsGvqrNyvxzGXwcgXzrrvW+ubPRXkbBbuMn+YTp+P9
 5MvKHFlbwGKHMwYcvJdGzxJzlctUYfJ/gh9Q0kPvr+pNyJdzEmKVHKyc2CNsxpHbQ/ZZ
 vENWNCWFXBTqdTsgdCULxsHTYz1A8/apdpRfghUjvnVhEo7nR/2g8qIjkZXKxB7ylPCc
 rzshwJGNkJLFf/V+fSj5ClncbNuWzrQKi0FSGYOEuz6Ai7OzYdPzvstf1mFKCPEBue5n
 7YhAVBSOA8QfeTDKS0S3+rSlPII7zLT2nPYGEFj5wJ0ovnH5JTQbQmAXFqS4O9EMlS9C
 nRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qsDlFr7X5YpYxj34oz7cBsGY/Z0+d8AKGL3oMvP1VfI=;
 b=RHKM26d/LJEQfsSFNOYNjy69lyFF+tykpTfUS9tA6oEoFi3B2TPwbQVh94ByDTxXuf
 nYUuC1GpwX3S6nkYPpsVUqvshwKNJM77kdInO1OJWR66xWtfnkXckGPIeDFsW86CDJLj
 UdYqZ3W6p4W7IeCMuebT5k3QhglCraQgLuYcKw6VLVVWCfb0y162w/N5Elr3VvIFtlQM
 gWqnq0mQ+11Fbrx0UNkWbXi/7EFdAKZLTgziwy0GxFfhY08hHLCPzPUhfWZEHfD3N8eQ
 aHNKCNeLYP8n0K2N3vxb59e4XeZfh0qjO+9AOo7WgJBGQRXiA6zwFjhAJgD0JruTqS97
 +/xA==
X-Gm-Message-State: AOAM532pdE2N26Zhi3yRU0gp8BpnJ8QY1kXX/XCFRfdbiLpaBl9/3PZp
 hA4H8yCoSEyEDWqEZM/YpFw=
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr13969152wrs.323.1590404967016; 
 Mon, 25 May 2020 04:09:27 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id l204sm8009785wmf.19.2020.05.25.04.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 04:09:26 -0700 (PDT)
Subject: Re: [PATCH] hw/adc/stm32f2xx_adc: Correct memory region size and
 access size
To: qemu-devel@nongnu.org
References: <20200525110800.7230-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c247002e-f3fe-cac4-9a04-a78d86571f6f@amsat.org>
Date: Mon, 25 May 2020 13:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200525110800.7230-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ql7W4n4uhDOl

On 5/25/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> The ADC region size is 256B, split as:
>  - [0x00 - 0x4f] defined
>  - [0x50 - 0xff] reserved
> 
> All registers are 32-bit (thus when the datasheet mentions the
> last defined register is 0x4c, it means its address range is
> 0x4c .. 0x4f.
> 
> This model implementation is also 32-bit. Set MemoryRegionOps
> 'impl' fields.
> 
> See:
>   'RM0033 Reference manual Rev 8', Table 10.13.18 "ADC register map".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/adc/stm32f2xx_adc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c
> index 4f9d485ecf..5d834a98f6 100644
> --- a/hw/adc/stm32f2xx_adc.c
> +++ b/hw/adc/stm32f2xx_adc.c
> @@ -278,7 +278,7 @@ static void stm32f2xx_adc_init(Object *obj)
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
>  
>      memory_region_init_io(&s->mmio, obj, &stm32f2xx_adc_ops, s,
> -                          TYPE_STM32F2XX_ADC, 0xFF);
> +                          TYPE_STM32F2XX_ADC, 0x100);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>  }
>  

Please ignore this patch, it is incomplete.
