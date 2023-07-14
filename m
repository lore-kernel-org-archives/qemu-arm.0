Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3846481eje;
        Fri, 14 Jul 2023 00:03:45 -0700 (PDT)
X-Received: by 2002:a9d:7dc1:0:b0:6b8:7eef:a236 with SMTP id k1-20020a9d7dc1000000b006b87eefa236mr4174654otn.30.1689318224959;
        Fri, 14 Jul 2023 00:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689318224; cv=none;
        d=google.com; s=arc-20160816;
        b=Uu5shyjSUpvf0MNfTuAM+ezS2PGXpLL6WpsyjSAOAWf4JRitNTkZj9xWWBktxCF5Gq
         hs6twLA8cqk4TUt2Lhypl3K+MVZtgGJj5mHeCczOKDTHBBDxlZC14t2GQICJcUvriwLC
         kCwUxrEtcdkSF1kBcvCOupfx5Xcm6Mnr7yH7Z9MK4xgl7rMQjT4h0bYgN5ltMIswMe/z
         hhKsTtiP4kpD/lDWR5rWGHCtF0pLcDZ7U9up9EZSYwbsWUzhB7OZH09hY8ZHzV963roN
         Dipxtond2OIw6lEwaSSbsUu/lSMLSUrfVsKDZtPWGHYxUt88lYbfWiFqS0Orue3UTMEY
         g8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vn6i0sOk4SopbFnYPoexXUbZ0GTL9sUbPNgqCBEmX2k=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=YgLSe3s4Yy9VfZ+GUcRKm2wjONnZoQuEQ7GKiKO5yW+n2gAfAqca4bgBmZWJ0u84zP
         4rkwkB+4HT+/sHdUKbtNMV3X+TtNlPy9bABoDCTrmqeDxGgQzOED5dDoSo/FraQY0E+x
         yOyEikInJFyDt7Npywuady8AdZ9FJVKNXY78uObXg/po5hDI8JLSc6XQtbXnx0Umydnu
         bQbNjKkJEyjWQ92d3/mTgxrxvNsLpu0Qt5iS+ebVArOKrPR7GxTiUiuuGsXm1M4sAwcj
         jyffzxXYm1j/wAyMw1IL/brg4A7SCbchAdUgx+RYW6kFa0Sg1xqLRlNoAtZJz/ExHH4V
         XowQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckWcJ1G6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x25-20020a63b219000000b0054f9f9d3b20sor2554053pge.5.2023.07.14.00.03.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Jul 2023 00:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckWcJ1G6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689318224; x=1691910224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vn6i0sOk4SopbFnYPoexXUbZ0GTL9sUbPNgqCBEmX2k=;
        b=ckWcJ1G63YnqLE77HTTYuJA7nBjzKJIJAuN77QO8Fb/b5VdVevphOsJtRG+V3A2Wpo
         sx0qheQST/HPAKvq3UTtxOtNEGTUf6ZEbIO/UhBpaEoHcjLIRAz6B6PAEWbDTj4Zj/QE
         uiY2MW9/mMABCqCq/guFAa5soCqjV86o9s1iBgcOEqJbFSr+rxJTJqE3OJ3T23W63a3Y
         b6VONnuo6R2uyKQHLwg9WQda8wkuxCoLapqUnrjAl1p5SwaUXGJXSqOI5SmERxbukBMi
         H05kiCtUirby7LgFkc0L2WN+T5JJj52YRehugLOdyb9QODOGfkYCk1zYuQnx5WffU66y
         vK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689318224; x=1691910224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vn6i0sOk4SopbFnYPoexXUbZ0GTL9sUbPNgqCBEmX2k=;
        b=clxKVO3DtR0KhxOB4AYpo9GaR24e316uXz6May4xCylR3kKE/UOet1B4/SfjlESCJY
         xB2rlpUJfRMMOETcSIzwKfEclUqVOeCp3PLmajee0nN8osas6kXD9PgPukSGkf7dBEXf
         5HLk98xlVCRhhCnk38nqF1/4ggBQu8vuPd+13GZiv6gmps4z2/tMmT72FtHmiQRhVpHh
         rXZQlDHIBmYc7TJY++Zoe1EI+vRPnBMDclv42sbIRIE4pB1xoqkQXYttEyrsidtCBya0
         SOe7uPN2OcyykLl5b+6GS8/8KRgCOWZVHrQZ0BwaoroyraxJSRnd6ycK+a2yNkON+yem
         Pu7Q==
X-Gm-Message-State: ABy/qLbjIHs5WeQjenb6SUmNtVj4rdRCBnRYnIonzxgeyleaELJ+6Af5
	EFyx7Z02dCe+c9xY+kJQBPkX7PAH
X-Google-Smtp-Source: APBJJlFwywz4IS5/06FZvOa7SlUO8H3NDHeb8EOlSBMMR4kUvwYC+4JpEWSXamMw+QygYLDKqzBzfg==
X-Received: by 2002:a17:90a:9b0b:b0:25c:571:44bc with SMTP id f11-20020a17090a9b0b00b0025c057144bcmr2665250pjp.28.1689318224367;
        Fri, 14 Jul 2023 00:03:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090a2a0f00b002676e95cd3bsm101744pjd.0.2023.07.14.00.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:03:43 -0700 (PDT)
Message-ID: <968d3032-d4f8-a580-c808-57a8a6341081@linaro.org>
Date: Fri, 14 Jul 2023 08:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/11] hw/char/pl011: Check if receiver is enabled
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: f27Seg0ZoOFL

On 7/10/23 18:51, Philippe Mathieu-Daudé wrote:
> Do not receive characters when UART or receiver are disabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/char/pl011.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

I guess this doesn't fall under "my first assembly program" because it isn't part of 
"Hello, World"?

Anyway, for real stuffz:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
