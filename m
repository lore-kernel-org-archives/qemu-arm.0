Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F23ACDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:37:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPf3-00016K-9C; Wed, 24 Jun 2026 11:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPf2-00015l-Ca
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:37:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPf0-0006gX-M7
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:37:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-845a3c05e40so718821b3a.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782315425; x=1782920225; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iFJgAozVkMN3Tucw/rmuW5cyn2cnrsD0aiGmag8+PEo=;
 b=Hbte5nefbTQhiFbWBLR7PXxgX3CYnyXIlrNXaQfpwgEOnmgmMGs5dE/PD2eMbKclO5
 ND3w7Ivhm1biaW3xSNGGM9ZjyxYX3+hsQWsUk5xJnNwRubKxO4XU66/kJdz3z9+DcSIZ
 pbUATTXRo0siPsahi4Aj6Sh02mLYtDH25JUNfOuntKJxrTQVXi2NHfiHn9R/MwDkmnNM
 QIZrgKhtI7RiyOUVyzz4cv/LGXvz7R+yo6LhOFUo2nxLPuQ4GSzCKP7I/bJl5ntotxq4
 PdmS6l9MH+V19dpC77WosYNZ/gZDl/9SHKtI5HFz92PIBbtlajYZsC7Vm6obUQsHiNov
 UhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315425; x=1782920225;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFJgAozVkMN3Tucw/rmuW5cyn2cnrsD0aiGmag8+PEo=;
 b=Lmj2JnbzUIm2b5Rvh++y6XM8X7MT38orBO04fDWGBwS1g1mwV1KngVymHsF+YiRgM9
 6QPZFl9sX1/8W4t9qP4ImpYucVC0YBgAteZ7XljY1deiQC3x9emjzFlFDSY78KmT4WFB
 0hJXH4r1qTIGFvtZ+etNfVRf4r+AzvZnQ/NPiNoiDGplhn36KB0nXU0ij3l7TDChSyEw
 I1GKyHNbINpU8CwugwyU0qKG7oAT5ZkwkbMS+iZ/Eq09otroR0iZLtmaNYfOIAvRwqxB
 ePVHwREzrZIIOMjN+2V7gm9KGJcEGM5UrQ4DgMDz5utASjOZrJVBXJKpPFyQudn+F+jM
 ETdA==
X-Forwarded-Encrypted: i=1;
 AFNElJ90Pau2/zSf9k0FsLa4GtyxR+G72pIdHXIi5x6ip6FESjfg9tFYfmBEewUXoqejAVbexn35hFPGOQ==@nongnu.org
X-Gm-Message-State: AOJu0YyeaS5A70dQOeTiEPEhtNT0hcOiwAZK4Z87k1y+th/Vs2jVVGpi
 bUByokSMIxFAGkkEbSkD2UmiBk3OQlrXgjy2RLe/r+8phDP8jccsuBLIPHXKcIFzpkY=
X-Gm-Gg: AfdE7cnwR9eDf1qdLh5IZtrsOfknaT8xtU3CuToGv3tRH9e/ZpRaVxlKXROA1R6/NSo
 y1ghhOXO56jg9ScEipRs0huTntZ9kIgVzQX5VonElkDrxPx0qjiL2TxW16L1EANhyFh7NRnBhFY
 3XAVOwRNBUz1x0pZM42pUZhh0bnma3DRGuNHL8B0RcRT0zTQX9mcMDNRRSXy9gri6nWLGWbStuk
 xpk1DuODfnV+sXhA89dZnTjG1Pm67zpfOUdHeVqejzUZN7Rhus851pmb4f/UDtNnFSWXDFWFb36
 fKVG+DhKfaeT9YznsYK3ujXvGdaDitGO2ebB68risrbOlIY642tWmp98G8dYIwvMalL3pUrXGSv
 SWbv40gddP3r0JyDdiNUnjnW03NE4EpocYu9Xks4g0/0JiKhnBb5/gSSW7oFNjrJ87gX53aE0n3
 +6Y0++HTQm1UULHZHvCf+3NG6Ib2UwC0g3nXSAcI+i/g53n41QDytRCTfQIg==
X-Received: by 2002:a05:6a00:3916:b0:842:5b63:6114 with SMTP id
 d2e1a72fcca58-845a2a97e28mr4972017b3a.13.1782315425134; 
 Wed, 24 Jun 2026 08:37:05 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a3fcc371sm2727154b3a.12.2026.06.24.08.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:37:04 -0700 (PDT)
Message-ID: <e03d4a14-9360-4272-b314-517be0622b47@linaro.org>
Date: Wed, 24 Jun 2026 08:37:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] docs/system/arm: Add FEAT_FPRCVT to A-profile
 support
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex Bennee <alex.bennee@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-5-dc6cf8e512b6@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260624-jmac-fprcvt-v2-5-dc6cf8e512b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/24/26 06:37, Jim MacArthur wrote:
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index a8072ddb67..98c028f6a6 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -85,6 +85,7 @@ the following architecture extensions:
>   - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
>   - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
>   - FEAT_FPMR (Floating-point Mode Register)
> +- FEAT_FPRCVT (Floating-Point to/from Integer in Scalar FP register)
>   - FEAT_FRINTTS (Floating-point to integer instructions)
>   - FEAT_FlagM (Flag manipulation instructions v2)
>   - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

