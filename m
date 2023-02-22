Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp34750ejc;
        Wed, 22 Feb 2023 12:40:00 -0800 (PST)
X-Received: by 2002:a17:902:eccc:b0:19a:fdc9:7983 with SMTP id a12-20020a170902eccc00b0019afdc97983mr10118483plh.63.1677098400014;
        Wed, 22 Feb 2023 12:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677098400; cv=none;
        d=google.com; s=arc-20160816;
        b=u70dPFfaLYieFvcCyTMqlLrV9I7VjIOHBhlXxwVDiI7mXFgzR+FYw+ZkoUO/q1JVkt
         8FBqA8PxOIG6ENjqH7XlPr/3ZDc8mgQm9xDnWvsBSgUdlspBh970c3X/c1ukBGqehq4t
         NpH3CQ4MPO2zXR1sYm6DwoybNGh4YRMty7pD6n2qlcfLZ1zDR3xgAukNVu3vKF6Qj2th
         aOzLeRbUyF3sbddiSpq951sm05DUsCdDokLI1y49hQ1I/LBIdDsqvUBAVkXAWOMyso2w
         K/N+pgHAj1aDpqMjLarSIFNdFTAGze3iVfmF6Q9bb3CQxc6fspXogzsteG/TMPt6zpth
         qgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dKSDfODMV2VAcFgs/0HYFyD2vnyh4rsLX915QyzLoUs=;
        b=LSd0Aja1KYkI02D7lrMDc2ZL2h3b1bQ8AGGnjK5fYxc/9DwUqcjMocxQP3qLDchKM5
         TyvpL/GyPfg0ORC2ssG/zF80BGA4XhqS6rIXJWqXZQ91jtwMWFYaW9rchxRd1x0HCIen
         oX1oPz30Bwk/LWnpDTQN6A9jv1+ERcgZwqvtZD9gSA4s0qv2M0ZRMWNU4xmfDwWICPfy
         50kNm9uutKSp1Uj9Luo37xvZB9PFBtUc8oqzsQR87uT+e+rsIDWvGrXOIOocNOL+Ja8H
         Xr0OWIjaCKOXontMPcDVzDInVtEizxrwLafxoqcFszFzYx6Evo+1xv+u5zf8jZJPKr3C
         ARNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OyEF3956;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h22-20020a170902f7d600b001963a1a641fsor1431275plw.59.2023.02.22.12.39.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 12:39:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OyEF3956;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKSDfODMV2VAcFgs/0HYFyD2vnyh4rsLX915QyzLoUs=;
        b=OyEF3956Sud81We+dlKy/28dFHUJ5zXmij7Zc0Ns53OkuPbyEhHBQWcmY/RQV7C15M
         BHaOkTfFnQCVRVM1WgUyODjdF62hNojlMsq0fUIZHJQm7l9G/IoqCH7Czpc4k/xw8WZZ
         NR6MLTzHSN2x7MSwJWf5eYyhlJZ0nNLfZgXXaPXS2e6bOlWc5eyXAzJLFoG6NbQw5uEi
         m4Pc/TwrHp67f6y2RE7Qr8823F2RoGAzoV0asnOBtqCfsJxtBnIMLi+iQxiXYfnWeyT4
         Shwm2/Pt6W/N5GSaNBFpzaVKUrouOLsbQ1HPvTWdRTpiLzGDZMB+GsOtuDItgGyXEAaj
         kXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKSDfODMV2VAcFgs/0HYFyD2vnyh4rsLX915QyzLoUs=;
        b=4ZWsfc9/EpfgEfj8IZulh/IXju4Fa9GQUG+Jg22eH5NAd8Naddh/nK2CSWOGitYgyz
         5rc3h4alLlN8KlCAhGo06TtJXLkBBg6zT1tOyuLK7Dpbp2a05TIxbU1oBCxwYTtnYsGo
         dRG+tla3HYEnaoQcknz8NLmr/cjSSFXnxy20/ZRpnFKbheHArKeLFFQw5a3xgzUvSX3l
         UPrlK0sqJvivjk2GevfhkfX/Cn6BlUdUx8YSmCTZEl4NLXDz3O+33SwyRmOOSyk3fYOu
         fGfdHZuJODcNGV5RpCs9DGp0uqF/yBX8Ng5R3scAPMgroY8vOhOlOD3vfKrr/7UkmvB6
         3Kww==
X-Gm-Message-State: AO0yUKWn1ry6P/BORAAE13Odzi6OAPx6MERcCoVW+Jp4DZ/HxVH5gzj7
	qBZD94te63l6yZhrxbmKRUicPQqO
X-Google-Smtp-Source: AK7set97Dq73azu9rb52WDOKpFJYFOoatjF9pByNGmHctaTq0aFrvHEC4/qoXqZugMbOy2o5dA8naQ==
X-Received: by 2002:a17:90b:1d82:b0:233:f3c2:a86d with SMTP id pf2-20020a17090b1d8200b00233f3c2a86dmr12332509pjb.47.1677098399511;
        Wed, 22 Feb 2023 12:39:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id ie14-20020a17090b400e00b002372107fc3dsm3185560pjb.49.2023.02.22.12.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:39:58 -0800 (PST)
Message-ID: <64398ad9-f480-82a0-1083-ef66a75ba7b8@linaro.org>
Date: Wed, 22 Feb 2023 10:39:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] target/arm: Implement v8.3 EnhancedPAC
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-4-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-4-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6hK2tUDO+20U

On 2/22/23 09:35, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay<aaron@os.amperecomputing.com>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/pauth_helper.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
