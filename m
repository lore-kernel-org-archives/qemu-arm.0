Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2855200ejb;
        Wed, 31 May 2023 06:30:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Q5Q0yYPgXwI2FQS4vS+MNjeMiCGIVlqJPlJYya3FPnU2IAXBuhNZMLX6TqjzoncJEWzKW
X-Received: by 2002:a05:6808:118e:b0:398:fd9:44cd with SMTP id j14-20020a056808118e00b003980fd944cdmr4709446oil.11.1685539843730;
        Wed, 31 May 2023 06:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685539843; cv=none;
        d=google.com; s=arc-20160816;
        b=G6DG5Izvwxo60dc6Ex/ySSHgRt3MVIoZew3zINl3nIr8KJ+ppeTBNMhtXQeE6chreo
         O6svlMOEjjDprnjcH99QzxyVaRkSrxGR3/vwXPRA0t0ME6JdPUvwQv3vZw+AANpH5Sc8
         UHiqLCg19JWiyeTuuMT23ebfTHdiicAfsl+xjMrr0vdCvVy1y3qgysQerkdavvGTD/r3
         gY+7vCLpf5yux9fjP9CLK1WD1gkG4Uu7zNm1qreKG4SdWh0bJ4zbIzq/OftGh258uD8l
         P9eHDdt9cGp1U8JbgB6kmYZVKhiNl3u0AaevzNs82sqsPUE/GTLqjmgMv/e1f22I4+6w
         7Trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3BFKUZg0jQcaYDbVumMdm4J067GgtUMgiaV2++h2izs=;
        b=KuKQB2KC9CRwZMu8VDDAFCF1yLfFmkuhrk4sjHAE+P+Q03dedyvTv7mrOtoo49WzCh
         5NdWxyHvWvDI11zO9s3lChcF2TC+kajNJTxEfsK8F4vvsVKMY9XPTufAJSxr+FSm0JmO
         e3mDt9CdVjyUmCm9i2deuKxs/uwIzUBD47b5nyGHBRyEZxcg10YRY0q66kM9FU+ksXZN
         RfU3IMLBFMgRP71uXvoSF6F6bZuytfhcsYrrVdfSMp6yNKLWgKE/XO4rGKerTOCeD5D2
         xCoX/deh0xd87mPZHa6oWvYfstTZoZ3eLm+jLn16jcPYdDDforkPxSK46Kppq2p08TLI
         9TEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/qnULBw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25-20020a05620a15b900b0075b395bc3c3si7953828qkk.476.2023.05.31.06.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 06:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/qnULBw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Lu8-0006YY-EZ; Wed, 31 May 2023 09:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4Lu2-0006Y3-F6
 for qemu-arm@nongnu.org; Wed, 31 May 2023 09:30:14 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4Ltx-0005q8-ON
 for qemu-arm@nongnu.org; Wed, 31 May 2023 09:30:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30aebe2602fso2751211f8f.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685539803; x=1688131803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3BFKUZg0jQcaYDbVumMdm4J067GgtUMgiaV2++h2izs=;
 b=E/qnULBwEEIyu+Z0Ozvtss9KNPKTDE3fOBIIxkr4XkE2ldEFQP5vF/vylWRfF63+Ga
 DcgOn/MAx3zgjd1drRsfR2H/iS0n37Ap+LTdFTIucsQx1J3JBIoddAWh2NQPuUjpMWyq
 6W9I2xDNLWDlmGALhaqzhlw+0Wht9DrN2FtKtcdx5hKMZnW2z8gTiuCpNad31Dg7lDdD
 l/EPkdcEgSOynJZfXC0Za+UrMeg7Wqs0hHq8ri0vnszD456f4qmN7aGqVO4PQGtJLHo3
 2ZcD5BPAjqNhv5W497cguiSObOgu4vBAGEKg8r8+yJwJ+YMjPaiOw98MeBdcEZxI8flL
 wdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685539803; x=1688131803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3BFKUZg0jQcaYDbVumMdm4J067GgtUMgiaV2++h2izs=;
 b=kXRUSTxhrUYRXdJZ7K9yyr7+RWJXYiY6tTvXTlNyPsvWj9BhxQdNC6sC8VirdDDaiW
 jUFRWuSvXLClXdPoO3zdZADwQ+Wd3vS6e3N33m9I41erKVbTo8cSrBys+6k0QpnaWt5z
 I4KvPiMnxitkTcZR0IdPtMuouuuJcFpI5MDMDL1K2JMaBOd13+gBbo88MC+DZJmddm/D
 Sm8GL1SV+vaD0MScurhKQRrFY/Eav8AYaY92g212SUBH3aTYHKeFws5E6jLjdnVRLO9l
 O4Dcc7+WC68n2zc6D2YIHXvOL5Ri3fltEhLF5THiYGER7PB6IG9/v1lkofAqzcK85AP3
 aFWA==
X-Gm-Message-State: AC+VfDxtZ30sfeosP/ewsG8C8b2Zix8+XFPL72dAhJbVLv8XMbx5GaJY
 algplc+wwAu0rJQ97GX1OF216g==
X-Received: by 2002:a05:6000:91:b0:306:44d0:2bcd with SMTP id
 m17-20020a056000009100b0030644d02bcdmr3983986wrx.9.1685539803048; 
 Wed, 31 May 2023 06:30:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1c6a08000000b003f41bb52834sm24636427wmc.38.2023.05.31.06.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 06:30:02 -0700 (PDT)
Message-ID: <364e5f10-693a-4e3d-0031-865ad4e79b67@linaro.org>
Date: Wed, 31 May 2023 15:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: en-US
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230531095845.365019-1-wangyuquan1236@phytium.com.cn>
 <20230531095845.365019-2-wangyuquan1236@phytium.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230531095845.365019-2-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4rexzPkvMkPA

Hi Yuquan,

On 31/5/23 11:58, Yuquan Wang wrote:
> The current sbsa-ref cannot use EHCI controller which is only
> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> Hence, this uses XHCI to provide a usb controller with 64-bit
> DMA capablity instead of EHCI.
> 
> Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> Change-Id: I1376f8bbc0e25dcd9d8a22b6e061cb56b3486394
> ---
>   hw/arm/sbsa-ref.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)


> -static void create_ehci(const SBSAMachineState *sms)
> +static void create_xhci(const SBSAMachineState *sms)
>   {
> -    hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
> -    int irq = sbsa_ref_irqmap[SBSA_EHCI];
> +    hwaddr base = sbsa_ref_memmap[SBSA_XHCI].base;
> +    int irq = sbsa_ref_irqmap[SBSA_XHCI];
>   
> -    sysbus_create_simple("platform-ehci-usb", base
> +    sysbus_create_simple("sysbus-xhci", base,

Please use the definition: TYPE_XHCI_SYSBUS.

>                            qdev_get_gpio_in(sms->gic, irq));
>   }


