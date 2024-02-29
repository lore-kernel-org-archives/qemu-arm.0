Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp263528eja;
        Thu, 29 Feb 2024 01:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHkOPYR0l4Pqq4paaqO9hxS5y/icFCX8hK8xJdTjcfk/RNfwsT9ve0hEx216iuz8K4hXRjP2JA2iKw2nw1vmNDRlLZxqL8
X-Google-Smtp-Source: AGHT+IHNcwcCuxYXHdVOkE5sDXdf0CNBbMcEE9q3WGPNFgO9vpohJiTbqhqqCJX/Dw/18eiNMgty
X-Received: by 2002:a05:620a:1657:b0:787:8545:80c2 with SMTP id c23-20020a05620a165700b00787854580c2mr1465954qko.69.1709198284288;
        Thu, 29 Feb 2024 01:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709198284; cv=none;
        d=google.com; s=arc-20160816;
        b=bLTT1csjOPNPwe0V6hXld6mxxDWG28JLQ8F0zllyU1dpEzwZL6te+mXEnGlOwdFfAD
         xDhKRMUjYWJqOHWO1GIuIDhmxZJqdL3CVjUvhcCN5VyS26gBexRv71tcfMa+o9Y0f5uz
         tWDHy2pDpfqx3Zrw3pbtHatT5IQcj1+9MaYTC7ZV316DXoI4RANg6+Ub8Cp7GBvdLnMq
         bCtQ8Sb4DjultptIApy+auaNp+HxxqV70QiEx3DN77Xf2CCceyBBWgUSOrJYpbzNpuwX
         ez8Xj+iM75BFfvGbvVCt8KwklU/hiyc3lGe5ZAqfYA3NDlKxHsux8h/9ngDWwBAOFJvL
         jl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GHrh/nNkQh7TYgndSEQQ8I9OPrs3wS3MtBzdmWGvMMo=;
        fh=ENMG2tTiNe1cWXZJSJM7Gpp1VP89Fos/AtjYwoB8Odo=;
        b=iI+zBN2f11OAyLkgMA/i78iV+s1Lqi0Q/0Ydsl830I0/Zt1kMt5tMASpjfhjq3UgFo
         0to7Iy+p/PBiKKl8QICkLZC378K8K1sAHfREd7tGQ8Ij8QEgCGIOwR4zsZEzumgRtWwx
         6zdCih2wLDu8dIiZe9ktcPlPKG5yAeMjpEthNm82mpjpOJYgMNAk2dZeGvs+wkN93mqX
         zBZ5HYGH65ILxO6A8iAq/j/NJcMqPV148aAT7iWfwnGGjoEjHKsPt1Rrpfz7GKl8VhsH
         dpt6GYGtBuMH9ccHAYWf3t+amjkmVrWm0UgsCd1xn6g4eRP93uKZFhy52IN0R8AqYjla
         v5tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wu/ikibp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq17-20020a05620a469100b00787a61b4023si1085217qkb.252.2024.02.29.01.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 01:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wu/ikibp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfcXq-0003dT-DA; Thu, 29 Feb 2024 04:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rfcXj-0003aD-Pe
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 04:17:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rfcXg-00080d-65
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 04:17:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-412a3371133so4785895e9.2
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 01:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709198246; x=1709803046; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GHrh/nNkQh7TYgndSEQQ8I9OPrs3wS3MtBzdmWGvMMo=;
 b=Wu/ikibpyvX33VWk1OyFjoAmTFDs+1qQtRTm0ifSNzlbWbtlGa1HP+y1I/fikfsbcE
 OuZmJdBBdbZ5hRQU6WhJXQq9M9d9Isx5r4vD5xW8GQfk81E1QBfqxNxUjEWfGgBh77O7
 6VzrKSOVbE9GTmHJIRNxEX9+OfK7a+477xCQGI7ya8GpgkyvnY8SJtlzMWUvTpTnNYGR
 iVWQgfLCyv2bIjeQshnuwdd1hGFLlF9zkBC5ZHpMs+pVa474yB3op8Qh5ux+IOHZX/m2
 /fouvkQr0sInv2HH0wI4k98juj/RtT8niB4JWx0hqIPV01OhJM5RTNy6t4qNH/dHkY4J
 N0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709198246; x=1709803046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GHrh/nNkQh7TYgndSEQQ8I9OPrs3wS3MtBzdmWGvMMo=;
 b=SqWAiyXqvz5/Mkq4oHlM34hZR7ojp4dvyQFI31ONe+FyXJX99MxDDN7R1n4Y9SH9Fe
 M3+d6wVAL53zYyZ49VFQAn0OwWlmeNLa9QrN6RGpz7ZKi4PiPb95U+xKXQ/+bCWhICwt
 bJvRCEjA5WCnYkqQH30ezkyRQU2EiXeOwf8U12vuqQhISGgRQ5XR7CvuJEwJkpMmQsWR
 1DTXz9D7UQZZav4X+aaNoJhrOR6Le2y/pNIy3ui4W95poYvgeGffrXyh2nXq59XEFEPo
 iap2jqlmTqsk9etBfgFDu37GzREa49YhPnQsTCve8pgw1dVeW1AyAeVufGrJUaqDpSbc
 +Quw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLnZ0inxx5HwEQmx4bNkfkObIRJeiqjiyTmdLIB5+QEFt2VozjTLfHFXFPHelRPn+MjVnYQXn/YdPFC83WYbrgSyCS
X-Gm-Message-State: AOJu0YxwwN3ZAW6Dv+pecC8gZWwQYH6tedvU+ZmIbF8WWJP3+V12T8PK
 18DNbbcJDEii5JnpG8qEBoWVpKXRk2Uu8mSwKxhOVosOVmL4fpmOlFzcACWe+nw=
X-Received: by 2002:a05:600c:4e91:b0:412:b6c4:ac21 with SMTP id
 f17-20020a05600c4e9100b00412b6c4ac21mr1441657wmq.41.1709198245978; 
 Thu, 29 Feb 2024 01:17:25 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b0041297d7e181sm1455306wmq.6.2024.02.29.01.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 01:17:24 -0800 (PST)
Message-ID: <06696a4e-ae61-4fa0-984b-481e680f9989@linaro.org>
Date: Thu, 29 Feb 2024 10:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] aspeed/sdmc: Add AST2700 support
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240229072315.743963-1-jamin_lin@aspeedtech.com>
 <20240229072315.743963-4-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240229072315.743963-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: CB6hLJT+l81/

Hi Jamin,

On 29/2/24 08:23, Jamin Lin via wrote:
> The SDRAM memory controller(DRAMC) controls the access to external
> DDR4 and DDR5 SDRAM and power up to DDR4 and DDR5 PHY.
> 
> The DRAM memory controller of AST2700 is not backward compatible
> to previous chips such AST2600, AST2500 and AST2400.
> 
> Max memory is now 8GiB on the AST2700. Introduce new
> aspeed_2700_sdmc and class with read/write operation and
> reset handlers.
> 
> Define DRAMC necessary protected registers and
> unprotected registers for AST2700 and increase
> the register set to 0x1000.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/misc/aspeed_sdmc.c         | 215 ++++++++++++++++++++++++++++++----
>   include/hw/misc/aspeed_sdmc.h |   4 +-
>   2 files changed, 198 insertions(+), 21 deletions(-)


> @@ -231,7 +270,10 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
>       AspeedSDMCState *s = ASPEED_SDMC(dev);
>       AspeedSDMCClass *asc = ASPEED_SDMC_GET_CLASS(s);
>   
> -    assert(asc->max_ram_size < 4 * GiB); /* 32-bit address bus */
> +    if (!asc->is_aarch64) {

Maybe name it 'bus64bit'? Because this isn't really related
to Aarch64.

> +        assert(asc->max_ram_size < 4 * GiB); /* 32-bit address bus */
> +    }


> +static void aspeed_2700_sdmc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSDMCClass *asc = ASPEED_SDMC_CLASS(klass);
> +
> +    dc->desc = "ASPEED 2700 SDRAM Memory Controller";
> +    dc->reset = aspeed_2700_sdmc_reset;
> +
> +    asc->is_aarch64 = true;
> +    asc->max_ram_size = 8 * GiB;
> +    asc->compute_conf = aspeed_2700_sdmc_compute_conf;
> +    asc->write = aspeed_2700_sdmc_write;
> +    asc->valid_ram_sizes = aspeed_2700_ram_sizes;
> +}


> @@ -51,6 +52,7 @@ struct AspeedSDMCClass {
>       const uint64_t *valid_ram_sizes;
>       uint32_t (*compute_conf)(AspeedSDMCState *s, uint32_t data);
>       void (*write)(AspeedSDMCState *s, uint32_t reg, uint32_t data);
> +    uint32_t is_aarch64;

bool.

>   };
>   
>   #endif /* ASPEED_SDMC_H */

