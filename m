Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3546046lfk;
        Sun, 12 Dec 2021 14:39:22 -0800 (PST)
X-Received: by 2002:a17:902:e842:b0:142:dbc:bade with SMTP id t2-20020a170902e84200b001420dbcbademr92153212plg.45.1639348762764;
        Sun, 12 Dec 2021 14:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639348762; cv=none;
        d=google.com; s=arc-20160816;
        b=ykGBSxZXG0WZrHP2ImUuL6P6pLtB2ENlaJkLdTNodgH1gH8BVIyD4lItRq4wXkLKhQ
         7S57VOSIUwPxbWPxwq7dmoExSDDoNNx0oE88PSF07+d4koEqsy7QJwrUzNbaOj8dbPGy
         /14vIWbhgER4Q7s0GKMd2RqlD+zKiOefYrxMk4+WMLqHJa06DFqweKdBRQ/4594pmtAc
         Chtub+4p7KqeO40GbvP8rOwcVwx5Gb+w8bDjOsmybPsdm1UQok6OMJ8NuZFylolnzJKz
         Njdp/v/e+8Yxqbfib3t2KKPLtq7+ELpYJSpnOozAu+qJ5cmQxYQakUIaQwFy/S01ggy1
         7FOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9vmmXETX0924Dub9xVWaPCxG4nt0KoGN2B97LOzgPXo=;
        b=SI0H2jHKrAM2ygOa4x/AnZRbXfK/8S0UZ0VUDeabaUjrwUeMwtgcVmg3buTNCWIXu8
         lwZr3cbmMypUlXmDvgdvf5WmMB8RI6r4PYBGzt+6HX78lS/ZwTpxaXfrYvd+3ecyskPy
         nz5ELS84uHaZy4QBCRv+mHtpitoz8BoGJrWeivaGrraIbyJ9DC4rJQ7Wzy2PV7j3knsa
         iqHIyHr19FB8aWvhqBMCkwQhoVAPN5vz0QvF76Scmwx7iCbEMfIJOtuDvS5xIA65/iDY
         /56EL6LmtkZMTBpO5hQkxVM63dO31rhNQGB+Sv+YAb0RAp41k15OKdKg5Moe1Ej0qK3l
         0zOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sqwql/Ju";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l16sor5568748plh.20.2021.12.12.14.39.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 14:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sqwql/Ju";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9vmmXETX0924Dub9xVWaPCxG4nt0KoGN2B97LOzgPXo=;
        b=Sqwql/JuUJ01zm8rmuEI8mqHdbJCKw3RG1IIIba2tHpVHWNROgViaWnMEnRZPkwQUa
         e0XAeAtqOCVPAWEfw5GEwd36WOCR8iGe+jvLPKopVSrc3kBY0A4mSPnJgGP3lsghH1dr
         yesYvzu9obMhQR3r4I0cfa0vuGBXgGQFP6QZKkt12931IN2piH5UJ3GAw58AN5+oLYVZ
         gZIgeSAIg4OzPj5W70HfBFh22xF2g+o4LzP/v3CQO+IE+7TeVfolECY7VMhtOE68tgTT
         gkybCAEhRa1JkVHs/sbAg9P06KUsNRnxkseeV4HwBHGrtdYwScSNXAQOSLH0SAZth0Dj
         HKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9vmmXETX0924Dub9xVWaPCxG4nt0KoGN2B97LOzgPXo=;
        b=tIoctO/H5gOupoFKcwrNnL9MAR9UjtcPDFMmJSicyR/L6+OXD59K1LrcTOFVHFu/4M
         asiBOyozBQOGgFkmuyyDRAw4gtDcTBu+d0Zq93IfzXCFCLdzcEqtmcL1YDmzch1QMWUG
         47oWq+2i5prdjqIxJ2YcAUBdyT+fd1zC1oDeEl+OQlQfu+3mcxmWsYPFE2Pw4za6iGbo
         tDaLNEWxyIes05FnBROmwyWSwVgS9aMo14Rcw6iYdap7vlE0nDc0sSP0Y60HeOnG7PtY
         giaZklmS/cC+n6mTCDaK8vsHzuG3HfS/H1Gf2Z3pijIMjva+t4h2PM7BA/0+1b4M/uo4
         6Zaw==
X-Gm-Message-State: AOAM532Gj1RAK0iXDKZT7N89N/EqR7nWPkgJ+LjI0SiaG8+bYG7r8LZr
	6n7HuXr4wcnCSZitCQqAp5UCViZ/pA+9TDUS
X-Google-Smtp-Source: ABdhPJyej3IP+Q8D3oVsYEtC8Jmz4yEFe0wbhdC8dotprGIdiylaPBxB5rqukupT7IjTuN9CYR9beg==
X-Received: by 2002:a17:902:db01:b0:141:ea12:2176 with SMTP id m1-20020a170902db0100b00141ea122176mr92433785plx.44.1639348762301;
        Sun, 12 Dec 2021 14:39:22 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id b19sm10586606pfv.63.2021.12.12.14.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 14:39:21 -0800 (PST)
Subject: Re: [PATCH 25/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapd()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e28a6a6-eda8-521e-2500-f3ad502aad36@linaro.org>
Date: Sun, 12 Dec 2021 14:39:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: CObjywlc1jTw

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_mapd() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
