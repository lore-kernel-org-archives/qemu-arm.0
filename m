Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp58250njb;
        Thu, 30 Jan 2025 14:05:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXc3h5VI5IEo4AYf9zX3RYVm7V7cjAAL2fUDHpHYRQ2gd0LAPvln+REjbUw9rIKIJPiCtFspS0VUvno9A==@linaro.org
X-Google-Smtp-Source: AGHT+IG2ANQ1egQuf/QnM28NCLKbm1b1HU285mzKp57Jwo7ii9mtl3k99VeFRVh70JDNYwtCZdPl
X-Received: by 2002:ac8:57ce:0:b0:467:53c8:756a with SMTP id d75a77b69052e-46fd0ace368mr127154471cf.26.1738274739173;
        Thu, 30 Jan 2025 14:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738274739; cv=none;
        d=google.com; s=arc-20240605;
        b=G6g4o9CZVQIaiVWLo9Z/WB0ZyfWLGdqBMYHb/HOX7rWYM6HeRdL5fqSEzNNed7YnmE
         9xMqNqQg+qtBH+L2KxkqHQghd1qtCe1804begOM2QUb29dCFGSNtKhWQafJxJn5v7v4/
         Dhs0V830W9iS0N0e9JW8SOpZT1/Y/HNp0pysJeBJYjemTM3S6xMfHsS6tX2mdbW9Qoid
         TBW8MoOhUw/Hf50fjO3y7AUPS3y6i+sobRLtUYD6jKQe4sZDdHi58S+RO7O2s2pQWZQ+
         ZsaSBKRQAk36CPXLyPwQKJNwDbILQqTOH3InZBYrxxycjV0yglYzXOlaB7OHDb9LTiTf
         /N3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Nqp604v9ga8iHYkwtDxqtMWMeqQl0AndasmsmNIJX9I=;
        fh=QR7IOaK7cFCqGChi8ME2N/bkkFS601fA/eIhztLx1kw=;
        b=lXaQ0GtG+oOfJna5JUY+ZSv4VAW4jyS+vxM2po4/Jjm7D/qWlmf6eYppTZ6W7OI0ie
         +2HZqbgtmrHxuJPnlyjWrPv8rUolx86fGHewU4xbCv51kkS3YdpgHuWQrA5otpNMykWa
         F5rj2u0+9QTL22v+5cIzi25X546FCaOYMJ/CrG5Aua/ugpphLaeNO7U6a3Zz9g0bRPJk
         M893SWsa50n1ZKIDe/wSNJO1mbAAOc+vRNEyo+SNKFei1baCbqhBKjG788uNA5zyEA8N
         FxguCagSuK+V6uNkt1hJW6Fbq8ljwMV5rfV0UrJ3MA6MUA5hiDNfzOvMkFsiWSP90JTj
         ohNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cVIj33Oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ada4esi24646161cf.90.2025.01.30.14.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cVIj33Oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdcf4-0006zO-AE; Thu, 30 Jan 2025 17:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcf2-0006yc-E1
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:05:20 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcf0-0005mj-Ef
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:05:19 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43635796b48so8556065e9.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738274716; x=1738879516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nqp604v9ga8iHYkwtDxqtMWMeqQl0AndasmsmNIJX9I=;
 b=cVIj33Oh9NGGXx1rzCgmGR5jch47v5rFqUiY//A+2ZhHPtp7BJP5Mlk1SfSTG+X2RA
 o08jJnO4utwVUUgfGiUJH4Dc0duhi8cqJHX7grYlff51e6mMX5d+HbSjJNX51QVPEqi7
 o4Seje5pVKaj0JDnH8HP0E46FNikC2+HM1dy7VBvPlxtBHgmAeissuciVELmaK0h+dVB
 8FjyKqkMxZNXDD7vi6oAZZSVryMcA7RiswMCZAyxEMA+FxfU25vkH1V0l7kaV6AXrBT6
 TuaXm9xo4WlKyoEWMdRo+0Dgs0Mf/Q2iK/CYHUkvacc8ddPfD27rEPpvTZ28zGMdhkPt
 Fr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738274716; x=1738879516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nqp604v9ga8iHYkwtDxqtMWMeqQl0AndasmsmNIJX9I=;
 b=mU0YFDCzn6HPPZCd0OCIgzg1wHyKYp5dmLHmkjtQ858S7ZKV9Z46vMl20vGHrLrvo7
 3MYlXc+lQfxMpzzRHax04EwSfDjwVJklnAW9QlQefHshYYmNLikyyfTAGZ2DFJek1ez5
 lOK4NZCSei65iXzEHyh9aX/CPfFbTEvx5l5NlEyks5R45dcbNC3sm1eql3BDZzAR1xfE
 mzefrrDd0fHOs4yE09S2j02sWfBugg1txKd042x+nITzrcER2CMVAgzu93JBHm8laB2/
 +fhe9+CQKy06c1V0VKVjMViL6mQZxNDVxsI6j6biCVZMePWa4/12ihqFZLajRjxExXGb
 RkCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgqkKstLmpwFapChNOt9TtRQrn73tit9pregm+z/bH1gLkNuKUVH63ILOYCRdxmRpb90hCkiRRBw==@nongnu.org
X-Gm-Message-State: AOJu0Yw7CCz7sm4EWgzHwjCsdaBbifIfg4tAchjOuGOilUmDfs4k9jk/
 rVPIlHX5U/A79EkYkUxU+yrqobzos+qX1sIqtoawnfiCTCAObkvIupf60gbLEQ4=
X-Gm-Gg: ASbGncvCM4XgCr5RgtPUiBHc3wzHMsYw0NCb6nLFd/hoclyHSr5/VtaXrO3m6LVHy8f
 3abKgpnJ5HpCxIyM+eX0d0/ZLkajQvnEUPqK62c8qhkz+elWAbJnw3U8GuAtIuoaQHFrMjPZKbn
 9IW7KclTBCgMTM8aXHVXJwxrYP9I5KzEepTjeb8Nar5KwVYj2HZe4S8nrcNNWs2Qc3H2J/dyXHX
 YajqEAsKppKjFzfP/HX3xwlLWqthmBf0P6EGPOrr6eRPcoDAEPrMkckbRwor5gBUk4w7VkQVgKK
 +XwR/343daaFnr4V8p/CxNGn0eMqWKuYXr1vyBZQt8cfp3Bwa/QiMTpwm1w=
X-Received: by 2002:a05:600c:1da8:b0:434:f3d8:62db with SMTP id
 5b1f17b1804b1-438e1e18200mr38464015e9.2.1738274716594; 
 Thu, 30 Jan 2025 14:05:16 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244f087sm35243535e9.29.2025.01.30.14.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:05:15 -0800 (PST)
Message-ID: <b9d7391a-3091-42cb-93b0-b6e7e049f144@linaro.org>
Date: Thu, 30 Jan 2025 23:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] hw/sd/omap_mmc: Convert remaining 'struct
 omap_mmc_s' uses to OMAPMMCState
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 98Ypo54m8GJu

On 28/1/25 11:45, Peter Maydell wrote:
> Mechanically convert the remaining uses of 'struct omap_mmc_s' to
> 'OMAPMMCState'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |  2 +-
>   hw/sd/omap_mmc.c      | 20 ++++++++++----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index 6339c5a581e..7d1a1afc4f8 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -530,7 +530,7 @@ struct omap_lcd_panel_s *omap_lcdc_init(MemoryRegion *sysmem,
>   
>   /* omap_mmc.c */
>   #define TYPE_OMAP_MMC "omap-mmc"
> -OBJECT_DECLARE_SIMPLE_TYPE(omap_mmc_s, OMAP_MMC)
> +OBJECT_DECLARE_SIMPLE_TYPE(OMAPMMCState, OMAP_MMC)

I was expecting this in CamelCase to be OmapMmcState but then
looking in history I figured both OMAP and MMC are acronyms
(Open Multimedia Applications Platform and MultiMediaCard).

commit b56d351e25065d46fb959081fe13e8d031df35f3
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Jan 28 11:41:26 2021 +0000

     hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER struct to CMSDKAPBTimer

     The state struct for the CMSDK APB timer device doesn't follow our
     usual naming convention of camelcase -- "CMSDK" and "APB" are both
     acronyms, but "TIMER" is not so should not be all-uppercase.
     Globally rename the struct to "CMSDKAPBTimer" (bringing it into line
     with CMSDKAPBWatchdog and CMSDKAPBDualTimer; CMSDKAPBUART remains
     as-is because "UART" is an acronym).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


