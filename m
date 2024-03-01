Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1144349eja;
        Fri, 1 Mar 2024 07:49:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFbE3TiJsEvORbCXrjG/AyRcU9kIqdnZM6QkS1fQj7/ueQ3IzCpPeBmRqUCPI2ThyBywy0gBqZckWuo0Db9I8VwPMZovVi
X-Google-Smtp-Source: AGHT+IH6RRoO08pdgM5zPcR1OTJf6u/ouWyMl0KnVNrQAOojIGbS6/9wrXne/Mv5VX1cnqO1CGRY
X-Received: by 2002:a05:620a:e0f:b0:787:d572:2c85 with SMTP id y15-20020a05620a0e0f00b00787d5722c85mr1962737qkm.23.1709308145199;
        Fri, 01 Mar 2024 07:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709308145; cv=none;
        d=google.com; s=arc-20160816;
        b=wZ9wBzfWGuIy/eoseYxEszi87kIn7Ynl6AswRgOD9buBcdijAiP45paIbn5AfqUB+0
         LqWUdZiSrObStQkZjGuUKuY8nu1yTaOQWutoS0jqWEQr3uAJfyhmIVSnjjtB8dsjWyic
         mrrzwo1XA4BWXenecsW02VhB6BnziLbhS4Cix3HiV2m5FVAJ0D80wcGNicWh46iprg0P
         vYF3v0SLoWGR8W2LbUz7zgGu8y50BLfmO9bR7tHfCAeQeUFoY8e7SWC6a3ZTwPwmlaas
         vZEHJMrWGsjEjGZNiRnMW8ICc6Mhtn+C6lo+P/0tgYOnpfY5slZCK8Qzvh2gGVNeMgED
         5YFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RHuuIrgiXICSKqK8qq6mrlldvq7XTPOBjMp5Ode5tpk=;
        fh=9CqcijPaWrANvuvSmFidbbnZf1Lued1Vk+j9GFKa5Z4=;
        b=ZAVpFWAuW2nfq3m436HKB7an8NctI7GLfnqrhBHfRzJi27UIvySRBb0FIWDe1vO96E
         GnlMIYziSx5WmcQKORqjQ0V3b6QUwEXNDoZGBU4pEMz8tTdLPlfarC3yg8Niu2u0fNA9
         VraArqoifg0bcLfwoRjm2PeSe3pvTrLVzdLDBx86Tp8zLXJoSt1FDY/e1PcJVvsVGXt3
         Q4J5i7oXUOYxnbW5Oe/rTPplhi+U0f3niZbql5KK4lXY04wnuIjbkLCls3UhZIciv81o
         BIYoiFwld97+WOfStpm5uBY6YnzWFIQldpIpLk0VSIgt6vSVWt8Wv14s8TlsI/qz2VG7
         POmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X1du9C+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05620a090b00b00787dfad0f0csi3655011qkv.713.2024.03.01.07.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 07:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X1du9C+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg580-0008Cs-Jb; Fri, 01 Mar 2024 10:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg57z-0008CE-4I
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 10:48:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg57x-0005nk-Bi
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 10:48:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412a9e9c776so20600695e9.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709308128; x=1709912928; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RHuuIrgiXICSKqK8qq6mrlldvq7XTPOBjMp5Ode5tpk=;
 b=X1du9C+rV4kh4t1UZMyQjJnGiBRQK576yvSdzRUfBFdsPEEaEDpRCT3DYFZYKHXU+a
 AgLPzQtoeRqKK5BuFIINJ5R3bPERRhMdOsGZwo/A5QfmXVFTetFlaHK+cL3JAR+ZTupb
 2mWsahB0m0UJTXMPFMAeJ6rzGRFfmn3Sq7v2ayU+ysBzpXb44bPANEOORV8JnDzz8OXe
 Bs7YYGyNsHZG1OEBbtnTuO/9sq+eN5P9Q7RxlDgQupBTFRrbI4J4oYGWk+QZd5+M2NRi
 0KMIP1CtwxYqxwt8f/0oFTYsbrnip2NJPGFAdK/4nAZhj9XilYZQbNpPa9SbvEUEhslz
 hR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709308128; x=1709912928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RHuuIrgiXICSKqK8qq6mrlldvq7XTPOBjMp5Ode5tpk=;
 b=Ko/fRta8MI5NdUxFFt66DWQJdNCVxiojGBGu2X9cd8PL+7n8T9xsruzG5wljCfi3SZ
 BVeQwLipDWyEtYsQdy7rswD9mufF3mgiuATOQyaiiIl4bZZo1qKRWHy8EgEtuq35TPD9
 NmrHOWkU1iO3byRrXJTLb7pYLD5vRSVNOLfwNt2XSVAdtlAPp6psnaBlxXQ9JBBhZMSZ
 Rz4oKluGMdODDaEmHpFxk9XjQx3Hl5UIbLbIxERMcDqtP097qQLuBNsW88eHdTL8rSiy
 85Z6oeDEpbZZPocOsE/BbCD8Qq+3PH33jgk9g4Qt+crYQTOKZd9HvxjoSYZy7Y0OPpvE
 6l4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoCcl1OuWd9+crPaLa3y8STWMdDcRoiVv9vziAJN54UOAUqGOfrQ5g5DThOVlOxSkFSoGK2aWSvBgcjPoZvSzrsk4c
X-Gm-Message-State: AOJu0YyssjofrXELv7QsHfmTAFWSQXvE/vA7dtRZB/u/zO60EY5/VHkm
 vXLvfRsoxYVwU8uG/wJ4jYAFgPjlMZc/GhwtbTuL7wtmR0cigH+NBLDQbDSin8Q=
X-Received: by 2002:adf:f141:0:b0:33e:1ca0:8706 with SMTP id
 y1-20020adff141000000b0033e1ca08706mr2129933wro.15.1709308127614; 
 Fri, 01 Mar 2024 07:48:47 -0800 (PST)
Received: from [192.168.193.175] (232.red-88-28-18.dynamicip.rima-tde.net.
 [88.28.18.232]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a5d5b0a000000b0033df46f70dbsm5117235wrb.9.2024.03.01.07.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 07:48:47 -0800 (PST)
Message-ID: <eb260acf-859f-4b48-a2eb-2aff8416620a@linaro.org>
Date: Fri, 1 Mar 2024 16:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 2/2] aspeed: fix hardcode boot address 0
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>
References: <20240227125201.414060-1-clg@kaod.org>
 <20240227125201.414060-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240227125201.414060-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: UOtc5sTDNxk2

Hi Jamin,

On 27/2/24 13:52, Cédric Le Goater wrote:
> From: Jamin Lin <jamin_lin@aspeedtech.com>
> 
> In the previous design of ASPEED SOCs QEMU model, it set the boot
> address at "0" which was the hardcode setting for ast10x0, ast2600,
> ast2500 and ast2400.
> 
> According to the design of ast2700, it has a bootmcu(riscv-32) which
> is used for executing SPL and initialize DRAM and copy u-boot image
> from SPI/Flash to DRAM at address 0x400000000 at SPL boot stage.
> Then, CPUs(cortex-a35) execute u-boot, kernel and rofs.
> 
> Currently, qemu not support emulate two CPU architectures
> at the same machine. Therefore, qemu will only support
> to emulate CPU(cortex-a35) side for ast2700 and the boot
> address is "0x4 00000000".
> 
> Fixed hardcode boot address "0" for future models using
> a different mapping address.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Tip for the email workflow: when someone provide a R-b tag for
a patch, please carry it on in your next iterations.

https://lore.kernel.org/qemu-devel/09f9ca34-4e0c-4ada-b808-643a8c578511@linaro.org/

See 
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#proper-use-of-reviewed-by-tags-can-aid-review

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h | 2 --
>   hw/arm/aspeed.c             | 4 +++-
>   hw/arm/aspeed_ast2400.c     | 4 ++--
>   hw/arm/aspeed_ast2600.c     | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
