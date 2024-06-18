Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp896487ejb;
        Tue, 18 Jun 2024 08:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAuUv8vP54JffLVClNmLIX+5I8UftlZfCqU8frpDhZdRoRp0YpkPiSskkT6QxnM+A6Cli5lDMLDKzOCMimflYWWSFUvygc
X-Google-Smtp-Source: AGHT+IHFJseKeXn+KA+U7l7len9DQWMRcSg/RXoWapFEeOoC9oULC1jTNa1Z9P+gHRi5eV/K/R1n
X-Received: by 2002:a05:6808:1527:b0:3d2:27b2:fde5 with SMTP id 5614622812f47-3d51bae53bdmr185133b6e.45.1718726309810;
        Tue, 18 Jun 2024 08:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718726309; cv=none;
        d=google.com; s=arc-20160816;
        b=x8totssMp1sRwWIxpL9NZWvbnZeMaQsdcqWs3YTV1tBtgpH8kvOzUQCw9aBQtHC3Dd
         rG24/8JQHbAEmvsQeLrPtgPWpIQD9uVjnqXdCoEYdklDvXF1MRt+t6Xe22+uWRh4ep1H
         qhY6OsnWSi2ESf8MdnJtlowqFRoY6BBQEjO37A9L6cBFlHHKofOcVs4LO7tPC+Xo/fEM
         V6BYeELq0dCSU1WRpgMcz4Oh/fK24dTeS39yw7Hsa/vrkNvQi+2saberAXaKWkr4Ll7n
         udqQqapiQD1wsAQfottAKw/Uz8OYzV02mOK9Rz9+fkQXmXvzspwJKraG3RM5R0TyyuWd
         80tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5vo2r8U0wGbpNP25SjORQeMsDDFRBUkeoBBuJtuFQwg=;
        fh=1Ljr59BAWbPnfVpZ7dDtI7Zj8HFwwWXOrc96Jm6/tjA=;
        b=q//E3QxTs+A8Ut2J7sR5XZJ06KLLeKYZ2HZiBbiNMbPKvTYMnp2QBQ/rk1ZrDp8E4S
         poVw+FrDNTDejD/mSXRZBOCuniDo+kZLncvoJzOSBU1e7naCy0s/k+MqsfXLiXD+5hhI
         O7X/OWDjGHM7Jpyjp4ZLl0HhHfdYYiN3b4SEHDLFFOnnv7pklU0m9Ftz0tRdNWpGjQIR
         PE7c65MKwoHErZGQ4Wt42cAnkfpkuZzy99jCogVIp+5mtEUxcWM8yAtSVcrsKR29aT+A
         B7gbUN2jarLFbwM9TMNLYNfanq+VDDWfIZWNI18RHMCOopnYeG5uuJ6++juoRvHIXQZv
         9gQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7rjqMuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441ef3bd2f4si131413911cf.136.2024.06.18.08.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 08:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7rjqMuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJbDm-0000rI-Iw; Tue, 18 Jun 2024 11:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJbDk-0000qM-Vu
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 11:58:09 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJbDj-00069W-63
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 11:58:08 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f176c5c10so688551666b.2
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718726285; x=1719331085; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5vo2r8U0wGbpNP25SjORQeMsDDFRBUkeoBBuJtuFQwg=;
 b=i7rjqMukkjWbuz+g7bXDRJ5EW9IdBdoYmo4isadpCd9PoksmJG25fmDUVciCEpAOZm
 8oAf+Yj5KY/GQioEZF7wrwwn2xR+Z1OoMLFzstctyTMQyfqyCCSGeKmWBEUWUkDf7CFG
 eAVdF2+04Eh/8e2vn2NDU+YWI0pPFSkf7tfHosQYZ8Pe8Yz6jx7G9gOsBS3PP1MU027s
 +RovvQ2EV2HJ3IZq0lpaUz287aRKll1qIWaunRhlig7c3QCXLJ9sAosevQBrok47y6cS
 cHCdk8qfvCiahQvehDTLL56V7AJBVTfK05g7tWnIXjqDz7WSQUgZUu2VWZjDZJmwbxIX
 PGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718726285; x=1719331085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5vo2r8U0wGbpNP25SjORQeMsDDFRBUkeoBBuJtuFQwg=;
 b=JEVZ5li8mTqFv4AkDwoFYFGrYkeQseHhhJzZJWqXGrp4DpsxPygHUs/jlnq/gmY12Q
 p8Q0mEQXwIAilPMDVB4fpmOzbos6ty9cayUFaxa1QMtBOLuGDr15lVN90NVDpZJtK1OO
 HxkeqNupV/CClsqnRj1NJM3T+Fwf1tklmOSUesUUiPGQ8hGn+a5gstM2lUdwV3Ulp4CB
 FQbAWJ5+hiSJ24x8C1zI30lMJX1hlw3+2fskY05FV2J4cGqSXVYJG9LzOeiNwkuc6Ura
 CMlJFkaB6YKggGvy3qzC5BfmY2zL+nJ9HrBzY9zgFCKLWmoanMTPy2+qQxDNS4IMdvyH
 KOtw==
X-Gm-Message-State: AOJu0YwGG4TtNEgGlJG1llqyQPpk3euLbQFkVazyx4RBm2nQOlmnuy07
 ZEHAa1CLjHbsXOxg6TGpese+j3TllSH2WYzN3DbYyPGgdG2xJpjYy1xC9cP/qAo=
X-Received: by 2002:a17:906:528a:b0:a6f:501c:5da8 with SMTP id
 a640c23a62f3a-a6f60d27e07mr969494166b.22.1718726284945; 
 Tue, 18 Jun 2024 08:58:04 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db682bsm624711066b.62.2024.06.18.08.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 08:58:04 -0700 (PDT)
Message-ID: <f870bc0c-595a-4d9f-aac1-8361d70ea18f@linaro.org>
Date: Tue, 18 Jun 2024 17:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/misc: Set valid access size for Exynos4210 RNG
To: Zheyu Ma <zheyuma97@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240618155159.3183256-1-zheyuma97@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240618155159.3183256-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: hWF+pCNi96el

On 18/6/24 17:51, Zheyu Ma wrote:
> This commit ensures that accesses to the RNG memory region are properly
> validated and align with expected access sizes.

Please point to the device specifications.

> Reproducer:
> cat << EOF | qemu-system-aarch64 -display none \
> -machine accel=qtest, -m 512M -machine smdkc210 -qtest stdio
> readb 0x10830454
> EOF
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>   hw/misc/exynos4210_rng.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/misc/exynos4210_rng.c b/hw/misc/exynos4210_rng.c
> index 0756bd3205..674d8eece5 100644
> --- a/hw/misc/exynos4210_rng.c
> +++ b/hw/misc/exynos4210_rng.c
> @@ -217,6 +217,8 @@ static const MemoryRegionOps exynos4210_rng_ops = {
>       .read = exynos4210_rng_read,
>       .write = exynos4210_rng_write,
>       .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
>   };
>   
>   static void exynos4210_rng_reset(DeviceState *dev)

