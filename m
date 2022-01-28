Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp68650lfk;
        Thu, 27 Jan 2022 19:19:54 -0800 (PST)
X-Received: by 2002:a63:87c1:: with SMTP id i184mr3626800pge.28.1643339994479;
        Thu, 27 Jan 2022 19:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339994; cv=none;
        d=google.com; s=arc-20160816;
        b=UxODIydn8cniUGp1N3gdbu/PJtRr3B0uqQqOCXzlkgjcKW1Y8NnHTU6pe/5UKyo+id
         6Olyw57fIeNzAUO8GMFgx6tY2o9gJgwSOWKu8SoFgkA2kouXdi7XUOKJVS1Okn3pGFik
         9ND2T5sjoWIcp+W+2I2UN32nh8uzxctp9uYhchzEFjWo/E/EnzCB9EdB6oBLcvVdH7oL
         j3rP95gvtG9GLO/ib0x2HaWZJMtgJGzCUTJH6n7LbeAzkgARM4jT+LDihxJcsIRayVck
         7zfKktjoT4llx4DcxS2dlLgMeDnjZRy+h6zno6DhDNuJznEM/wYbGB++wkhA/8B/Vo+M
         vU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nYYGRD4KlQQExaYnv0cSY9JPe/ZoE2+j9NoRYASs6bQ=;
        b=XxV6TiYFGCosKrcNuM7ctmh/0Tp9OMj9TJ3y1E7mCCtID0rSIXw/ECUhL82VJTtJzK
         KRrV/kPWbF6ghWvRn2Sl8iQ2gw2mAO3XyfWBJSqmL9W2jDJCoo55Lnh2mlF2wc/SKzdF
         t9Bb6njYVkKuX4S0vagXk53XZot9VjxInGXR3qC6kNBMjZ1udG8dJeGcRMYifovOUUSe
         +WdGsyMLiDKvrbwa1gbdbwlv4UnBkwpzBF5iEp7p3od0czaK6Bs/eRFejE9BnA9Rh6pl
         KV1wvTAegg1gxGLQQaV4OwhAXOX6m/ErT3TJFxXNkZgfndG1RDRjY/jRnTHvNmRqW62q
         5s2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EkG3Vfaf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s9sor1942504plq.160.2022.01.27.19.19.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:19:54 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EkG3Vfaf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nYYGRD4KlQQExaYnv0cSY9JPe/ZoE2+j9NoRYASs6bQ=;
        b=EkG3VfafWznH2pAiANaMEb6/f9jIQwbRcgokZfVKv/bicB1iHLTxYe390AhvpQJ/Wo
         YpwazMYg7hC3eMQvK74tGyQ1/Thc4qVU1tQsUoWakxR/Io4tFnSzihySJ/D3jutpe58/
         mGSroMuhtObPDmAcJoxtBDpRNI94SGd0EMbEhX3ZZ9HbqqrldY9IcXFchA32OC70UOPr
         PIMyYE4J4dVZnJUbcWzVz8JKlXvgd1rXCVHKsJl5cWbpyeGZekfogXwmbA+gspyCaf6j
         Iw/BvMYLVrbgolkyaH86WelSEHSc95TzybQiK1d/5TWe7Jje83oi04WcLDz5ptrY+vtY
         k0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nYYGRD4KlQQExaYnv0cSY9JPe/ZoE2+j9NoRYASs6bQ=;
        b=EmNbTTY2RWuTZU+yE4SZQNsYlZF6QIy18h65O5GJ9Rps1xc/DHWKvWcToF3pgvucs/
         NKcJ1uY1jcPaIzcDyTF/fIReFT/HQdoQPvkHAzpGckI9oGnmIxNQzXZcPYPdcuTh+9uF
         nro6x2PsVvdtmZP6rE2hEL0H3Im1BmsXI4TywW2jjenpubSaiGDVyVwxlvWJ8s9q8dfY
         bl6uzYFPRFK6AJHYTBirGgozRc3i+Azb24uaIeto+0AZtuSTlipKMKebG5mWcYxp+yMd
         36d/apSshUGOdyq0Ef9zYfIjDGAk7GXhjWP1QDsdHyZqmZoMcnvv1PxCf/hUOzlLCjBp
         FHaQ==
X-Gm-Message-State: AOAM531StaVJIxpMnfCAcLRgQ7gNQlsTYlesG87s1Rrf0LiSeLPIwq6R
	n2R+jdEvPezJhFqoSjb+E5GpBeAQ
X-Google-Smtp-Source: ABdhPJy6h/Zcx1U2yXdjT52Pl5xaEeguAKlskM6+jOPD793YnbMi0p8+HSsFDW2t1DZ++B98qAqilg==
X-Received: by 2002:a17:902:aa84:: with SMTP id d4mr6684632plr.137.1643339993991;
        Thu, 27 Jan 2022 19:19:53 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id s6sm20802116pgk.44.2022.01.27.19.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:19:53 -0800 (PST)
Message-ID: <306460d2-5d1a-6e68-0c13-758cb490bea2@linaro.org>
Date: Fri, 28 Jan 2022 14:19:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/14] hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are
 supported
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: HkRAv8CIzfSx

On 1/23/22 05:24, Peter Maydell wrote:
> The GICR_CTLR.CES bit is a read-only bit which is set to 1 to indicate
> that the GICR_CTLR.EnableLPIs bit can be written to 0 to disable
> LPIs (as opposed to allowing LPIs to be enabled but not subsequently
> disabled). Our implementation permits this, so advertise it
> by setting CES to 1.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 1 +
>   hw/intc/arm_gicv3_common.c | 4 ++++
>   2 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
