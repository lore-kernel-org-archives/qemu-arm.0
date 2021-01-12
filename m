Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3099186lfq;
        Mon, 11 Jan 2021 16:21:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHFhlmTL+p9FVA73h9fkwAUs5ToUAvY/AYJQCCIcXjydL0eOAQaBxt25rSBf06xVucePx1
X-Received: by 2002:a25:e641:: with SMTP id d62mr3266201ybh.80.1610410908329;
        Mon, 11 Jan 2021 16:21:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610410908; cv=none;
        d=google.com; s=arc-20160816;
        b=vXvkSmKmqtqN445FoRTEFM3Isl1SdXZkAd8oPv22espSK8k1yVqpPQ/VK1KzrCNYOj
         rshpfX/3k2Nw2Qh7CHXjkqMIzuTCv96wJTeowRFRePe5De1No8l3e+s8tN+H0+QwWatY
         gTStpyaibIYfhXtPn/Zm1CK9qNEZGg2hkJcSHPO+9kYgHQ7Hf+2PUIDsF/8x0SHmleIi
         NzNPrjUcmOqrfzwvLsYRy98zi9VQ/WcocvxKImvFira+8R8O3npmuHXCiPwi/JixuaUg
         thbHfs3iOPOrcmFCFLXrCcvhCiezqQnqm9KMe1OOhyM2aL5f+OwH53Ozns6OpBI7yaGU
         43nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DNp5GAfjGCpmYqnBW3PDn1/z8JA2tW0PufcKIWKap/c=;
        b=ribI9J9ksjkdVGmLA7mzFiNMlFzGhEUNzZdybHkUBV+ZC28SeEuDCoBwkiE9YTjJFF
         0Dy2XRUTab7G55m8Y6jfVLww0CExzs8p6pQcH3tZ465FoavbLoK2CqeMm+tV/sUnd2GU
         6h93Q2eDKQm/BkdWmPQR4mzDK6xiWY7xfshyVXMVDVekOAbLtXIXc9LRKCXHvj5Jybbc
         d2YZa7GAA/I8t6ItwvaoJBaH0eYmNEUJXAquxpNCxuO7CN2L3sw5iD1WUfhoVlcTdv89
         pfP3Tm/wT4cgKQmdBKVUJMRfsBbeMrewW97uHjQ2uJsXhsCt845Nyf1ua771REkTnsC3
         oKqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YuxZN00m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si1201624ybm.446.2021.01.11.16.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:21:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YuxZN00m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz7RT-0008Ul-Jh
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Pn-0007Ii-Ef
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:20:04 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Pl-00064m-NZ
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:20:03 -0500
Received: by mail-pj1-x102a.google.com with SMTP id b5so566378pjl.0
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 16:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DNp5GAfjGCpmYqnBW3PDn1/z8JA2tW0PufcKIWKap/c=;
 b=YuxZN00mLa7r7vPsBADODzzyQ/dkFUvezQpPQc/6IFPygR4gToDDopz64AW5twVqQh
 XfuMc8tDesUFhzX1jwexJ2PrYvAc52aR10db0WuOx+GEn2oms94XVD7e9o1ebTroIhdG
 Og4J/RMq2lRCYLfs3Kd3vY74cyAStRNaizEwEjWqsi517nR9mQAK5DME4ONOlep/vcRV
 arbKmbeITrT2eHAjCQFAUybpuHpxy5yGJPG1pIPUBLGP6S9eu1OVFrlPRYg28hEfbzSS
 Bs1B9iX/n7bVrqLDt9jRpKsrf7umc3ULFt9fKvrKWiz/2KH3wsJOVMZGfbE9enclPpXR
 Zl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DNp5GAfjGCpmYqnBW3PDn1/z8JA2tW0PufcKIWKap/c=;
 b=fhgcJYvWdCyMrJVh2aZkFvuif3df7ub2uTpkTYwejm923hoLOFqWCldOlj8psVCkjB
 FGQockApm4u6nvMx+e7tGXFv/FIoXwqHGKEtNkhUNL/aA3jBUTmBVcAaZRA9KGMK0QPk
 bEtWTOlnx8tTqYe+qUNmghQ5JohgyqlgtOld8vaGmpcYvKw6DL4y2uD8nq9tDsntTve2
 bPtIJ6hUJ0f55n02k2Ob1GkX8qPOANM8aN3qLASxHwBiE7Zvnl4LMENAISxp7HQ7Ofrn
 v+9voF68HuOpb/oRYuBN7dDZOzNw6HtKwZaZSiwKvFt0Tyabzj2Vm6dFeXrBPJods6B1
 y1DA==
X-Gm-Message-State: AOAM533d/MBv6rNVE1zlCtuIxkQJ2sP2P6zId2fXAn7wctgmz1KswGDk
 TDiN+/IUQ7jX63e6YJVudALHpA==
X-Received: by 2002:a17:90a:d806:: with SMTP id
 a6mr1481826pjv.170.1610410799705; 
 Mon, 11 Jan 2021 16:19:59 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id j3sm602656pjs.50.2021.01.11.16.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:19:59 -0800 (PST)
Subject: Re: [PATCH 14/18] target/arm: secure stage 2 translation regime
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <785079cf-fb1f-a380-00bc-783126090a07@linaro.org>
Date: Mon, 11 Jan 2021 14:19:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-14-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e8/S4DgCckr6

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> @@ -11286,8 +11299,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>  
>      ap = extract32(attrs, 4, 2);
>  
> -    if (mmu_idx == ARMMMUIdx_Stage2) {
> -        ns = true;
> +    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
> +        if (mmu_idx == ARMMMUIdx_Stage2) {
> +            ns = true;
> +        }
>          xn = extract32(attrs, 11, 2);

Does this want an unconditional

  ns = mmu_idx == ARMMMUIdx_Stage2;

When can ns be true and mmu_idx == ARMMMUIdx_Stage2_S?

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
