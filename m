Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp406564njj;
        Thu, 1 May 2025 11:58:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJHn9E4fkgz9fv9hLcYH8bpygQLOXt84ksak2tLx1ekL2BYvsJUZ4uoq+SRohh7LCgLvydLCLvXeInsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGLXx7SA3hdEHWTFy7FgZU04ogt4NSNo+vvcKIVKhNJtWW4CehkQGSlj1PcuaMasEL5AY20
X-Received: by 2002:a05:622a:2593:b0:477:e70:6664 with SMTP id d75a77b69052e-48c32ac8f8cmr152101cf.36.1746125921772;
        Thu, 01 May 2025 11:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746125921; cv=none;
        d=google.com; s=arc-20240605;
        b=Pa+aTm7MPOZI78kJn2e6CHyKAvpIUDGLuQEofm6Pff82NgJofmLhAqQaTqmgscANZ9
         X+eVtE4enYO1pouz/N1rv4rvKi7L8p5jhV/9Gc5NP00OzwMHb/xL7+DjWmo4EW8iD/6Q
         uvIXbi+aCAvXhwicRJn2UERQ1hgLFUZpQRystHGRRhMxzrd6+Mrz2Ae4yMIDJs/xthjc
         SmIhTEgxhZO9L6pdiaUlNoTvmlEADWNNOE1CJYAZwJOuK23yoMx6qRtO6EAYniYxiPs4
         UjMx3qgiOcH/ZZkOgflTBCfwGa5G87rjavDxqhOM+xgmIn/mm6Kn5c51pqGQttDVJYon
         bQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VqgPJ5g/juNUd3epRnQFTvcp4gyn80HGDjRO2mGRWfE=;
        fh=1AbyJWSgn+OYy+YNtIrRcg2l1FA0h+N8cXAnWvx4Psc=;
        b=Iu1s3qJgujeaAGt+hKPCrcs4R4fPG7n2k2+sAnvsxC2ltmuqUyJWaK1kmsweRkXQ5h
         yVmrbJ0fQHBOmUh8VYDekwMoPf4pKOgpmV9kX2+3/XhVhwZvqxOtPoJfTuE1UCX66tDP
         wPC+wb+5yY8JncLcOGF3L40tYsfv99MUWeWEvMms49CgrInm6otsj7Vg+seW/DcQ/p9n
         rcm4LCo4ysllIB41kwDyqPeqkw8/osPfcgHb9mPWuUz3xXWT/tHeB8OL1MCgo6JXSTo7
         d/Fkg7+G+3tnAxhmpJVNPzT1nEevvudb1dO147UDEkKM/0isOsmIXeRdbzuIpa2UMSia
         UVNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GFKQEzbl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98733b02si12421391cf.399.2025.05.01.11.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 11:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GFKQEzbl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAZ71-0006Nv-9t; Thu, 01 May 2025 14:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZ6z-0006Mb-IS
 for qemu-arm@nongnu.org; Thu, 01 May 2025 14:58:21 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAZ6w-0003k4-QX
 for qemu-arm@nongnu.org; Thu, 01 May 2025 14:58:21 -0400
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3d80bbf3aefso4808225ab.1
 for <qemu-arm@nongnu.org>; Thu, 01 May 2025 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746125897; x=1746730697; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VqgPJ5g/juNUd3epRnQFTvcp4gyn80HGDjRO2mGRWfE=;
 b=GFKQEzblvQtKHuBAFydx6b9DycEMEI7MLTu2+EbuPICmIHN16GuZNHBOjKAsAobe2W
 KivQI45y4gi4mpcSYvhayVlyNlh7DuviuCvvVrxdzoWka8f6rqtELy7YFDJZ09m+IyJC
 IhzCrQr96nFPr/Dn0NMfMHYpzY2cNsXub+hzvH5hIybh7JsesM/Ox7abY7mN9eHZ8u0J
 J5wRsXc9sh5lVhbTzpV/qTJKaX3JPRQ6YDWQN4cZd0Y45o84yz4KHaZd8ILDL8JmgNeY
 AypOAfA/+PH7m8b2r8MC/CSHrFeQtGPb59TM6hkm9co/R93KCWslbmZuEVGCDlolnJyd
 /uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746125897; x=1746730697;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VqgPJ5g/juNUd3epRnQFTvcp4gyn80HGDjRO2mGRWfE=;
 b=S6p5b709pd3ssqsmrhjjz7ogwx7PQnGRlO43c+iLBVfRuUY73lIndnqXBStIV5ARgs
 gGWgWcwvOX9MbiNQg8LHNNrbzKWwNg5MI56Ey86ARFrbgDQ0AeZyBHDw6FMDIjLZDGFl
 nPcmg9K0YZV5lTEOWXVW3JJBnOLsWkeiiHMQG0CbTgSQKeGwdOgX+iztMvoPljtk4IZK
 Ujyfygo88SsOX7dtFasJwGwaQtr5plmNkxvAZPn5OB7cDITPyuG2ZXBixzK3sQk6w5KP
 F8Ob+2UNoCgVJmD1aOCS407du8wdZx1nbzWy3semoehy9Alp94LBPEfTehg7lUFywZnd
 t2dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCkdwgsTKBKodEV29T3KlyRjmzgZPW5+QY2Vnt9ataRrpYIbDGi4zHEf0jImlqrFmulnk95/Tm/Q==@nongnu.org
X-Gm-Message-State: AOJu0YwAAByWU+Yz3I4HPQtw+SpAB4/smogrHPZKcIn+pPwV5rZOx9PN
 TiggJtlTuQEmKINs4ZRoPwy+9DMbkjGWkj7uVI4YgG1wu7JmJ58UqoEqbs/S55k=
X-Gm-Gg: ASbGncvV1n6r/tbpD4eV/z4Lid0JAzNeQTvniqUHg4rX6kkJh+NtDQYvWoUbrki8gkd
 oKU6BahApgEifwRZ4EADkB8mkFEBx0vZoBB1O8g5p8ehtgA5LTyDITubzGsqkYB7mPgEDAYGqm1
 da9WSGHTuQih0l8+zMmCuLUL+XzGwVxYqs3/o3wvqzGGKqL9rkehAzaUnIo9VfJ24Ublgsf9ZPU
 Q/LpBIhlnjpnmNYM3EmGC90TvBNb+ucKFFALQBP9QX3Km/Uwr3FQzApOgQnBicBxhqXwr/OgVtG
 uQzsT3BSBrNfoYfya1/V9SdKLcc067adDkPPmucMa7i8M1X68EcwU8C5iu2bXkFYr11yU05vHFk
 g61FPRtPhJkGhIA==
X-Received: by 2002:a05:6e02:174e:b0:3d5:893a:93ea with SMTP id
 e9e14a558f8ab-3d97c1bbd2dmr183625ab.13.1746125896764; 
 Thu, 01 May 2025 11:58:16 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975f6dd94sm2652515ab.64.2025.05.01.11.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 11:58:16 -0700 (PDT)
Message-ID: <c1c866fd-4457-421a-ad37-ee0630818246@linaro.org>
Date: Thu, 1 May 2025 20:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/pci-host/designware: Fix viewport configuration
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>
References: <20250501183445.2389-1-shentey@gmail.com>
 <20250501183445.2389-3-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501183445.2389-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Pz6IJob/JC49

On 1/5/25 20:34, Bernhard Beschow wrote:
> Commit 6970f91ac781, "hw/pci-host/designware: Use deposit/extract API"
> accidentally introduced a copy-and-paste error, causing Linux 6.14 to hang when
> initializing the PCIe bridge on the imx8mp-evk machine. This fix corrects the
> error.
> 
> Fixes: 6970f91ac781 ("hw/pci-host/designware: Use deposit/extract API")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/pci-host/designware.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index b4bff14579..f6e49ce9b8 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -348,14 +348,14 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>   
>       case DESIGNWARE_PCIE_ATU_LOWER_BASE:
>       case DESIGNWARE_PCIE_ATU_UPPER_BASE:
> -        viewport->base = deposit64(root->msi.base,
> +        viewport->base = deposit64(viewport->base,
>                                      address == DESIGNWARE_PCIE_ATU_LOWER_BASE
>                                      ? 0 : 32, 32, val);
>           break;
>   
>       case DESIGNWARE_PCIE_ATU_LOWER_TARGET:
>       case DESIGNWARE_PCIE_ATU_UPPER_TARGET:
> -        viewport->target = deposit64(root->msi.base,
> +        viewport->target = deposit64(viewport->target,
>                                        address == DESIGNWARE_PCIE_ATU_LOWER_TARGET
>                                        ? 0 : 32, 32, val);
>           break;

Oops sorry :/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

