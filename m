Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1560897lfk;
        Wed, 2 Feb 2022 19:00:47 -0800 (PST)
X-Received: by 2002:a17:90b:4109:: with SMTP id io9mr11560448pjb.244.1643857247047;
        Wed, 02 Feb 2022 19:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643857247; cv=none;
        d=google.com; s=arc-20160816;
        b=yosHSpm50rLqn4N+TKzkUh9ro3K3EAlXw+AOSkOi+10EV32j8inJP7LdlZr3EUkm7Y
         ohyFwC1xrFb0q15sL9G/XUS9KbbyD35rxPf7plfcy4YMm3vSDA38c8MVTOcuAn9A1RWB
         3lwr2lOdgTit+M7EGm9E+VK00ZS9OcEXv0aYMH8Jyouo8BkiV0yS33qyAbSFqRiGLoE4
         iwRE/mytIfErFhJrTONXHar1t0w91VI4c423o5ly0BkpZ7vgBOqGfOUXm87Bhdj60Zrg
         qc+3XhGNaJi58kS/kBF/Nek4dbJH/bWxsQPpoG1MCCTQ1JS+8FJ6tCPVpJ/TGhB4QvYM
         HC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pC5MO/b/XHy7CcW4lwsMv9vH0UZCr/PBAQ2khe6PfVQ=;
        b=xngqFK6dFCykqvx3NGzrDRdHEtIt1hhW2ulAbo/DU+Xx1MMUFj/QoaHPEEK3YlvOLH
         +5cKcju3XvbZQGtl3yWIYMjrJOBIBEAQZoGYU6OD/QdD0Lb6NP/iX2bS9gjwfDAgMB2b
         ujmutLHbtzFAAUb59NZEz9BbdWT4LUKO+fshqDMhQtB3Gj4l1q/zbE8asGmr+kCjYglq
         7uMudqVPuhZvPRx18Hgbg2dQ5VMGIPngDb8Goq7Dr5JsCwmMKOmejMhItwtJYKWRgbLr
         XplmgJ2Alk4cJlLWS9yIMe/MJLZDk2OlFH/DLTJl7Vmqdk/bT8wDmTC9aSX1yVyAbsZp
         gxdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnotnBOb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w189sor8205781pgd.12.2022.02.02.19.00.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 19:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnotnBOb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pC5MO/b/XHy7CcW4lwsMv9vH0UZCr/PBAQ2khe6PfVQ=;
        b=TnotnBObwfiT5zNtwiMTqjAdXiWFFc1luey1c3u2JQtmjudK2WWGEM+JDpnmR9OSGD
         fWKu09sg3tIEzcXpYkLm7O7aXiORXvWA/sGRAPDoNW23bBdPrYX6ZEJT5qh0v06Oktm/
         uuKPBh5MXYU0s5YDcDtlDzS2GzhVUEOrcuVjO/JM2TSteZIC0TLvrZtxXeGPfmEAL5lm
         TVabNT4Ah5E+Enifj1tR4iHHxQMnTddM8eZcvAsjiuLfNZAMiMFRRNGkVbOqGxj7YrcL
         Sz9SQKj1Xg2u6iEFIN454FXDJQDDR6npK/6WdCNru2G4yUOHSmBIKic8sPxV3ct28lX0
         d/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pC5MO/b/XHy7CcW4lwsMv9vH0UZCr/PBAQ2khe6PfVQ=;
        b=ABCcHxrKZVDUO1natdT5bNxm8rSmZWz9sVWwf/mIZR/ThTTuUe+M5LKcEXJJkM3SJk
         3r6LN8XswW9p5t55Ep1J9LhJdREzTcxYOx86T1lCR/lOpzaMXEfnndouxUlMKiXl9uyJ
         +FEJtgM1l7f4BIuPcvALVUtgByVyU0baLSceMKtXqBDJ313wfcOwZ/Jw//i0Zgzi8nDJ
         BxGaGV7foeeo/ZdWkLYGtjTne5DcWPAm+BR5akD9Sf09oTI2qwgFIKal6RstvwRRssZF
         gnwSU7rqWTn1DBoSZCGsB+LXS45zMOcFUBYL9uy4ubdHoGpgHHak4GQqyjfIAYvYrWwl
         uI1A==
X-Gm-Message-State: AOAM5325SEqSaRwxBwLvlfEJnyCNDeLtt2CRpxU7j5OtBIvGhekk9lCX
	TZyAcWH3US897/ZO+EkWXVSBel7x
X-Google-Smtp-Source: ABdhPJwJQesLBJdWBRk69+KJAAx3NCOAlm2lJdE8UrOrlFqWIewZRHGgUCQ/Ld4yLSGDXZIyUJ/IHw==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr15522058pgc.252.1643857246476;
        Wed, 02 Feb 2022 19:00:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id lb3sm8330399pjb.47.2022.02.02.19.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 19:00:46 -0800 (PST)
Message-ID: <3fe945dd-e3bc-8473-2b7b-d3e03594ad0c@linaro.org>
Date: Thu, 3 Feb 2022 14:00:41 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/13] hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5BCWOWnyIYzA

On 2/2/22 06:31, Peter Maydell wrote:
> Make update_cte() take a CTEntry struct rather than all the fields
> of the new CTE as separate arguments.
> 
> This brings it into line with the update_dte() API.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
