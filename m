Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3306974lfk;
        Wed, 26 Jan 2022 04:22:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvKZlsklYvjnDYV42+dyxjqzLYYl2UcEkBVL7ooASCuA9DaQhhQbMzP3wDEccm36ZfNXkU
X-Received: by 2002:a25:1381:: with SMTP id 123mr35430390ybt.168.1643199754304;
        Wed, 26 Jan 2022 04:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643199754; cv=none;
        d=google.com; s=arc-20160816;
        b=k0rhZU3lL3JphZHtFbIZeAZmQ17lDxYwa/uFy5g/7xoMpJFgk7VoyQScYd6MLs2/AM
         t8ML0kHMELeNPTuRqJPtzBARVvS4OVb9mZPt7lGcD586KVZqb4bb73rCNRKxpD1F92/9
         dK/Q5Fgq+PwAV7QNGVzUVWZxylYRBuUXb66ILb0cxFVz4A+jvXuodIIDEHBtiWRUXN8p
         rOQarlLKwYOMrXMtQrMk8vQ5o3oiyRo/ZrtS5W5LN/BFXJBJ9SrSlA+RfFDg162tFPAF
         ydBu4T15atnAdamb+DjbaWP3kgVJoTjR63brgrkeiobFcZaSdQhDgN2Cx2jhW516dyHv
         kzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UBuUnIZNm5KLWkYG4YJLLW1ngheo3ySIxVnZntTiv04=;
        b=EnizRilqFNs6Tvrlxe3FLUzEbW9tXNqXyOBIuPCWhYvXGwQPZsXVoqC4mio/QczK/f
         eH7JXA4gYfPWef4K1OuerNvJ97aTxrb3a+/BI6+qAlvnEKd7M8vlgY5CaoEXn6nm7SdF
         +XmnhJJOKEENuINgullK75oU6zVlMtNVQH/xuS0Uy4bqaTw9lYLBwqAJ0yJt8V136zkY
         Xr+lUQhdtykuF8kNrz7S77bCBcie4Ed7Sgz58z1U81Hmxg0q2mRTj0rqbeQHUryVstF7
         AJ95ShoAGi7Jnwb4/16oH9hBWdk6hfd54cR1/1gTEvmtSMLV4n/OJdnSAx1PxSPH1l9H
         qOoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OCVjgRvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si20423508ybk.716.2022.01.26.04.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jan 2022 04:22:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OCVjgRvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nChJp-0002Tp-Nk
	for alex.bennee@linaro.org; Wed, 26 Jan 2022 07:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nChJL-0002TA-9O; Wed, 26 Jan 2022 07:22:03 -0500
Received: from [2a00:1450:4864:20::433] (port=37487
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nChJG-0002fp-WF; Wed, 26 Jan 2022 07:22:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id w11so13288511wra.4;
 Wed, 26 Jan 2022 04:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UBuUnIZNm5KLWkYG4YJLLW1ngheo3ySIxVnZntTiv04=;
 b=OCVjgRvuc5K68iFGq6lGU8FuvMKvl2jl7Xet5JIR49Zv7ASShah7cpF4qyXu47oNcA
 lBQj8PF6kPMrf4QOuwFxZnBIIXAcYe06mu5ZTb0BBggKmUc86vNIUUtWkjimqlSJ5BtL
 KmgLAPCOwPgOKT7lDoR05RKXyJq1hCJJ4nlxs83TSzhWBYWBX6xdcwHfrSfvSd4gDPwi
 kPZZKts6+M4Kpr5OIasfRhHVXaManvwgSDKKOitn369dtdpYvkz2G3poHZdT00Uuxro0
 PQgy9FZwXFyaqXG+HsVFqFI9Oq9dyXn9msh4p9gm08YDz/Op5BdCTUBjxs4Kz5ky8fLQ
 QHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UBuUnIZNm5KLWkYG4YJLLW1ngheo3ySIxVnZntTiv04=;
 b=S5tCuE9qnKyFoEJB1Soe14GMnVkNGkhPnu814EPJD6IwsjmU527SE/KAMYg6anfleo
 irNGUlbkmj0Jz/G+nJy6sYC4hdtIK6QsQ4YFOOix8wgRQV5A87Vt3DLIG7IhJCCvBbhV
 kUM8+zUuLyrrNf8QWOEtkPMDq499Dfs4dZ6mOQrqQZHo2jgnD8XRQC1b1pFhUQh64zwl
 HI9eDF2gW39oval/21/lqDCPwESm9+q0jygk0qYBawVW91J9wRhJviPE9BPEVbyDIXoV
 8o40g/+HPrTL/1OYGbo3x0BiJkvib2fbD7tJ8gaTIGu654eFhx+RxyDhQ0iqmsRDI8xd
 9JqA==
X-Gm-Message-State: AOAM530UqnVhsyRBUiJVfj0ao2Eu4xF//ay+p2sW9fOkcojyy1Y78AG5
 mI8EpgvSM927CiGu1Ta6UMjce0hwsyI=
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr9937243wry.190.1643199717281; 
 Wed, 26 Jan 2022 04:21:57 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id c14sm1431332wri.56.2022.01.26.04.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:21:56 -0800 (PST)
Message-ID: <d370195f-436e-37ff-546c-6675f592aced@amsat.org>
Date: Wed, 26 Jan 2022 13:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/arm: ast2600: Fix address mapping of second SPI
 controller
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <troy_lee@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>
References: <20220126083520.4135713-1-clg@kaod.org>
In-Reply-To: <20220126083520.4135713-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: 45mjfmT8ByXv

On 1/26/22 09:35, Cédric Le Goater wrote:
> Address should be 0x1E631000 and not 0x1E641000 as initially introduced.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/838
> Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
> Suggested-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index c3783bd87a25..568205fa6e9d 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -29,7 +29,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>      [ASPEED_DEV_PWM]       = 0x1E610000,
>      [ASPEED_DEV_FMC]       = 0x1E620000,
>      [ASPEED_DEV_SPI1]      = 0x1E630000,
> -    [ASPEED_DEV_SPI2]      = 0x1E641000,
> +    [ASPEED_DEV_SPI2]      = 0x1E631000,
>      [ASPEED_DEV_EHCI1]     = 0x1E6A1000,
>      [ASPEED_DEV_EHCI2]     = 0x1E6A3000,
>      [ASPEED_DEV_MII1]      = 0x1E650000,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
