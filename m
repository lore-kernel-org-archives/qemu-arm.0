Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp48324wrv;
        Fri, 26 Jul 2019 08:12:49 -0700 (PDT)
X-Received: by 2002:a63:5920:: with SMTP id n32mr88646431pgb.352.1564153968970;
        Fri, 26 Jul 2019 08:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564153968; cv=none;
        d=google.com; s=arc-20160816;
        b=T/pdDGu0A9TOOZA8x4BCptoZ19XHt97it/fK/kaCoR3jO/OjepW4uQUONSDMeefaIl
         iexgR2s03qPa4dcOKs9m19PDCqWk9EPSyAsZoQHNSpOOghuJQNhLJphA03XNVwPNqtfT
         OTDT4pxt7RIsLbHxxXywcNIeWdf4TEnzNrn3KCJKUO+3j8zXYQ55javQsVcRRmxlD3x8
         hD1R+65RRgJlXm/qHaclMP5M+EPI0e2Mv7P9jMfrysH+JytYNZtfZG8g3OlgJPofSQWi
         fUpOZiDGoeT3LF55HcOwlUpk6ZAcjvTdMfN3DXkhSLxLFZ86WIabdOoGo/ALhJLvqsP6
         QQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=BmLIE9Ovo08lpzAVrvhfHtSERwe6Cb9atoTkj7O6iXo=;
        b=0g1AAacbhXn9Bx9upZkYcxky/z6aWKs+3BL1oywOO1039t/Y/2aFEn0qcrgADbujMb
         1VylmrGwrkZglmrCBoQeBwU5B2KwNt6gVNp9uhPGaDZ8yTFQpWpGGWiRyGoklFHcEDxX
         r4R+fntFx8HAs9LmaKoFcagq6QiWDqZOpWJsvjwiHu0wpgMhRCLiE6WZg+tzSCQLURWH
         /49LOfMJ8iHEmyE5uvVPL1QmfocIzfmnN85vy0ntfTM39CEv1PAwW1RbqzcT0BVdRgVl
         bVb3KOPlGZGzOab9CDx2zaJMySLCrK4vv8W6Gsb4OQoSJkUjeJubb4zpznb+IfdnIOx2
         Ym7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HcoH2dqY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g4sor64922809plt.30.2019.07.26.08.12.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 08:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HcoH2dqY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BmLIE9Ovo08lpzAVrvhfHtSERwe6Cb9atoTkj7O6iXo=;
        b=HcoH2dqY8N5RRk0PFLM+si06AXGx/3Pan1na1dlx3H/ceo1mxLCV1lw+UXgyFS9bFO
         gxDpBqJkekyPVBtrOvBqxm963TtY4WewdQvHg8mcib+u6+Wwf4TPt6Ei/vFaZXh88BGY
         u6QUYeMB6v5neTJlb7lISg/gBPErs0nUz8iBobb2d0pasUa/d3GHxEptfVLQQTq+Bwcp
         J0ZXjxhPj9jpHY5lDY0Z3IeTCtIyH/QCX+0c3xHJWLElTOFxws/tBXKxMopd7B+9QZMD
         9rHkvBu3SuRKvB9YtsOOYL4THRt4ZZjlHfSBmiliD4uYfED3tCzW16AfE5tITXeA77XP
         G+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BmLIE9Ovo08lpzAVrvhfHtSERwe6Cb9atoTkj7O6iXo=;
        b=lGplM1QPitBiHbXzuMn3erbJp2t1X6SATiUc5laP4Mn2kRoEB7ggo0ANtAw0f8CgxP
         hwBEqNHwcQ2vIXks5V+2TnWFF0w/PBlRXvsoKq//pMRbahBB1GacMtXc1/cBoNzbEKR0
         iOl4QnDRZYZ8rqGJ9uMgOCiRLwQa/15PwCNAKpi29i4QhOMOXzqmRDlwrhtpuR1TTGzo
         +a5V4uzbcM3L7Qj9DsKEQ9pjU2lvgEANCZyxMeo9GJrmlIr76VOA81p1DjSm1K5Tfwv2
         X78RSLPaGUMaojQeJsKiXAmv9z6U0kHEASahwP+dfi+xLOAdPSYBOlG6Dyk86Y52jZk3
         KzOg==
X-Gm-Message-State: APjAAAUOrfME0S0q3KEikZ6q+UKM1lHu50HUX4K6wcm41stpjyoqd/Bh
	yXaDrrfOxDKQMweG6d87XvRhzIzkZEg+AA==
X-Google-Smtp-Source: APXvYqzQJ6qy5UicRl7mfdx2dsb4J4HZqXwIluewRa7QZ3LJPmub1s7nQyYjY5tFo8Y7FJ/ITwSImQ==
X-Received: by 2002:a17:902:20e9:: with SMTP id v38mr98001660plg.62.1564153968462;
        Fri, 26 Jul 2019 08:12:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id r1sm59807643pfq.100.2019.07.26.08.12.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 08:12:47 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5] target/arm: generate a custom MIDR for
 -cpu max
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190726113950.7499-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9dc175a9-3617-3bb3-a03a-3def2ebda02c@linaro.org>
Date: Fri, 26 Jul 2019 08:12:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726113950.7499-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: lEa+SsGIOmM6

On 7/26/19 4:39 AM, Alex Bennée wrote:
> While most features are now detected by probing the ID_* registers
> kernels can (and do) use MIDR_EL1 for working out of they have to
> apply errata. This can trip up warnings in the kernel as it tries to
> work out if it should apply workarounds to features that don't
> actually exist in the reported CPU type.
> 
> Avoid this problem by synthesising our own MIDR value.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2
>   - don't leak QEMU version into ID reg
> v3
>   - move comment into one block
>   - explicit setting of more fields
> v4
>   - minor reword of comment
> v5
>   - VARIANT->PARTNUM and extra words
> ---
>  target/arm/cpu.h   |  6 ++++++
>  target/arm/cpu64.c | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
