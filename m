Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3545230lfk;
        Sun, 12 Dec 2021 14:37:51 -0800 (PST)
X-Received: by 2002:a17:903:4053:b0:143:6d84:984c with SMTP id n19-20020a170903405300b001436d84984cmr92104527pla.37.1639348671158;
        Sun, 12 Dec 2021 14:37:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639348671; cv=none;
        d=google.com; s=arc-20160816;
        b=T7bFsz1NPsrKsmNeCvjHS4v+XMs6WXYJrNIaKxEjZ3z/cbFz8/8KasrB7bDqAaZ9CN
         Yr00LWA+4Mnhd2/K0UiU8rsR5HGGhsiacA0KeFRHRV/XNX4wIj17ZfMTHC99j9M2bCPQ
         sah1ZOLtTtU0MYPDBGPBMZ20tx+BGTTTxoitXtsfqNkjUZIp+aku9QtorrhMAmfjrYkL
         BSbf5BZrxlyyIRsYyAX//LvqxSIkjx7/APySEwaXbcN14I303KnepopPJLz6onL8jsL3
         ieol2LQd0SOKza29JL/ovoepLO0hsWzaKJ0v4c6GknOzcVQBdgu1QVlWreQdgr/pUd1w
         GM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=p15k33xlPH4prEcCoiFPOhhkf5Zj4JUYu+dQ8jkf8g0=;
        b=z63xQUnmX4OQdDPnvZAy/G682GtSwOVAJ63NArt6zNt+7eZUOtfOfLhWHASpmDzkyl
         2EGhoQP/Y5O7t5iZnmtTvH68H9IpH3WKliX3ka3lqyr35rCwMCHAoL/Z11jJTqaAyHUe
         YBfQLmqU+ia92v0jCdF4QccCaF8gLy9phXAlN2voi5Hw0PNWnKTg6rTKoF+7bCGqDc5K
         rynb7R5uUfhknP2tt2grJo+pWruEPvrlBYna5zU0T6VW5K/ZxraaPmb465eq5urlyzHt
         ze2v28lTgZ/DI0xnarU5OfAZ3AkUWnUk+jEJdQE9Xff9vIIpHtbS7RukrvUEpmrrtc83
         aSrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEgLT2Js;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s4sor5554272plq.38.2021.12.12.14.37.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 14:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEgLT2Js;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p15k33xlPH4prEcCoiFPOhhkf5Zj4JUYu+dQ8jkf8g0=;
        b=dEgLT2JsiYhDJuPoCchn33KO8Ga6u3T8TgBS+k+kEVvKCuJdjXj56le+Rd9NJl2wuS
         ZP5ePKjL35HZ/ICLu8goAzXX1S/s6gRgCtqCDwPApE8I4blYsusmo3SVcS9xEDwRl+FJ
         f1hjeoBu3p3FGYmXA3rLt34+/B8QEgpHPm2wqnxTn4KCcQaf5enjotnEYyr/pJEAqPCh
         j/bqJO4McFFw2DWCTr0lijCvHEuS269bJTBUh6vIQTiAVv8OQVuLD35fUcqoixx2bUtv
         JXPkG6BClbFV/8UsaevzKjmDhVzSttVpOgKCq4MwuD7+lm3aSc485miRKDQP+dtKiajy
         4S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p15k33xlPH4prEcCoiFPOhhkf5Zj4JUYu+dQ8jkf8g0=;
        b=2qeH+WAIhGan0B0wgp4AvHQO+wwbLhFgVzBM47rSgobOHu7/U4qjupM8rcD5ETeo3m
         2iscc5a6u8mYKvAWLnW9rV6w+g0WzsFQwpx+nC3lGlY4oxyOGvsy71+2e67bMKVavJds
         YI1hwxgU1UMR4TAA9qreLza+ZTd6AWq2oatyO7XhduEbGj/PF2Ri9E11Gvh4m7GmijQD
         ldoUVlNHj/goWFsTgozH7OOfPXIuYeu3noUL4d2HI39VKwJnI7w/4hxx+VkRiOa2YHyT
         YbdhSd1VACwxTG2VlASP7yJ57Nv4NM7NloXVcVFM/EwphvkSGhyMfsg2MNJTz9O10Thv
         Ha4w==
X-Gm-Message-State: AOAM533xz7+QlNxXsern3iXJch9inRss6buLeoIibbzPcjQtoE5R4Adw
	fIIBGD6T18cU1dgyORAWCOzitoxCQs2NokxK
X-Google-Smtp-Source: ABdhPJz2b2PNeDeqrAFhjyUTDN57MPexDFsGu62t0PU4lzciRTf0NXA3YZrf89azZJ1hH2g6c8kKBA==
X-Received: by 2002:a17:902:8e85:b0:142:7621:e3b3 with SMTP id bg5-20020a1709028e8500b001427621e3b3mr91160408plb.84.1639348670702;
        Sun, 12 Dec 2021 14:37:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id mz7sm5035448pjb.7.2021.12.12.14.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 14:37:50 -0800 (PST)
Subject: Re: [PATCH 24/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapc()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ddbca15b-2557-3a50-3ff6-47248f4311a6@linaro.org>
Date: Sun, 12 Dec 2021 14:37:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: NnGSEI2kdliu

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_mapc() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
