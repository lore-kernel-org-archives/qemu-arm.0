Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp331936lfc;
        Mon, 2 Dec 2019 10:26:35 -0800 (PST)
X-Received: by 2002:a17:902:6b85:: with SMTP id p5mr628524plk.32.1575311194940;
        Mon, 02 Dec 2019 10:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575311194; cv=none;
        d=google.com; s=arc-20160816;
        b=vN4h+RWA1QgZFx/cFAkkhuuPb8lYYwuCG9B1ZFLNhQd8S6PwHZ8z3lDDVcQ96S0OTv
         5TfcS8TME9sB5Vz4Zjjk1J2dgcaHk4lVhQ1agVPzNolNGwt1jp3OillNwWqS6M2fErpy
         ci+Z0LuxgX7ECe04DpRcHBPbH0Ylipj5QamxNgulGOwuUWTSf08WrkqNdiBDPJwYmNx+
         5s0rKvBWjg0af86AtrJcCEmjaYTXcbPpkXXt/fohqGRA1gZx6rUAeWvomRHL5ifoVMTm
         sORugRO3Qn2LE2GNIM2mH+I5kQs4lnXCBOeh6+ADaw31YJlTbHSy6drk5JIK+mdhvOqH
         ajRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aGJgiHH9sd1ke5gnSsQDTZuuqeW60GiMKpvcK0Se2Rk=;
        b=oA54xNzdyMr6PJM3y79aYIto1yplRJI3hSOGBpoz1jElY3eCxlJkZ8aLtAPuCD1KFa
         TNO4cOZroxW86u6vBx65oiFiawN51jbrjfClv1skfioM40HsfYwyuFMSmQCcBPHarm4V
         OnmDwN1BaHSuSV9AXrTKyqTOCbSZuBP5/9/kHQChThPOtX+34fn8KFXKOJgNTz29Vzob
         5OGyYWZzUr8BsuDa9ID8K7wesFBcwYM61/iwn80MJEy9unLvf/3ytQySKMD8llCbTD5b
         L8ijTvFseZMMOsCJ0T+/fV1zkqgnyqan8ob/f15ty7Ee9Cg5tr/XGYyIkgjmIvWEXoZr
         S2vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbFA0cfg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d19sor456478pll.42.2019.12.02.10.26.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2019 10:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbFA0cfg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aGJgiHH9sd1ke5gnSsQDTZuuqeW60GiMKpvcK0Se2Rk=;
        b=wbFA0cfg9jMunP65qtn8Bc1FH2baEVFtUo6E4C01kcsKJxC0elBMKufSbMAB2XkjXz
         wud0TC3SiSK7UBncKEc33NmvO7psra0r0YiGk0oUrPJ1Svvj3bIVrkbtO8Opobh4L2Tk
         nAwUr1ON/flvPyhJhvwSX7WsXh7qb2Q/gOR0sniMxHauhp7eHiYnnjTdGsuRW79Q3x7X
         ISSHGE3HO58U0/DVAc19HhGAThNdvu71ze1SRoOGNgz34ojWyTl9adv6+06RmKtQ7MKM
         grmHzglvqWpG+BYbbDLAFzgoXHgh4FXqaYpRo72O2KuC8WPtaXOGwYCA52G8+cg3inNJ
         tJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aGJgiHH9sd1ke5gnSsQDTZuuqeW60GiMKpvcK0Se2Rk=;
        b=rrfL77efgEErN+Pzf2kWhO8sjsFfZdABitCBrv6OgNJYP51u8EdrhMPFvjV1Y7MydB
         Bg0AKoKBOLcwwFT8ENzIvwuavbiFTPBBBcwuzO8k2vT+L/GM+lBSYD5Epnis5vjIHNO+
         h6bn2yPNVIgeqZkNay4ngIOF8GiEKhpavmVLTjQLkxTIze//MuxBEmpcXamXWqExXRb4
         /Cpx3JLUG2WX/drXegVV3bn0zuP7e2GfRl7k5EpPvBElxPHSwj5C8ciu0YZCgqrss4GJ
         5TVgvPz4rdXXynavb+QQ3rFoXXlX51RWP8LoEIoU2upthkRdvuCNEFGpWwQSiOaczB1w
         50NA==
X-Gm-Message-State: APjAAAXJFcysjR62q356f/NzeBU1gzujqVZX07iY3WgA+8ecT03NpF1C
	SMWHSJHe/rKMNS6lyMiop8zhg608+SkzYA==
X-Google-Smtp-Source: APXvYqw4rG2Z2KWwfgK5P1Z7QpqglitI/r7ECdLCnnd78swk7kYEyuyLpkH1LL9bL7967OKvVTsSxA==
X-Received: by 2002:a17:902:104:: with SMTP id 4mr636294plb.130.1575311194391;
        Mon, 02 Dec 2019 10:26:34 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id y3sm145344pfe.183.2019.12.02.10.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 10:26:33 -0800 (PST)
Subject: Re: [PATCH v2 09/14] target/arm: prepare for multiple dynamic XMLs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d088175-4b98-bd03-75db-f19b8a31bf8d@linaro.org>
Date: Mon, 2 Dec 2019 10:26:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BOZARcEVy4ae

On 11/30/19 8:45 AM, Alex Bennée wrote:
> We will want to generate similar dynamic XML for gdbstub support of
> SVE registers (the upstream doesn't use XML). To that end lightly
> rename a few things to make the distinction.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h     | 20 +++++++++++++-------
>  target/arm/gdbstub.c | 30 +++++++++++++++---------------
>  target/arm/helper.c  |  4 ++--
>  3 files changed, 30 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
