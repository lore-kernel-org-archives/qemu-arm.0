Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2285971lfa;
        Sat, 5 Jun 2021 14:55:28 -0700 (PDT)
X-Received: by 2002:a62:6805:0:b029:2e9:a7c9:2503 with SMTP id d5-20020a6268050000b02902e9a7c92503mr10436830pfc.26.1622930128117;
        Sat, 05 Jun 2021 14:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622930128; cv=none;
        d=google.com; s=arc-20160816;
        b=VIM5K8tp9XWJvhdwkRPcuwrUe+dT6zH9btm3pTvhxBvjqn1pMuCwZDqcAE7gp/Yr5K
         NBNAal2oc2+A665NCAZ7nK0F6b4JWri8v1uxYsfLZGETTy+MX9fVDHiTq5OYzxqmwPm5
         OuagjoW+pChYoOU4Q1LXCgacIRUuiar6DFEiPlwmdoQp1Pk7QrI1XUQUeNdjlaPJDN0C
         5bRySG3nmkRGYc2hygIU/KXZYw7X1iCh5qaO0pQ65HPo7CZPHoj3nzbjnt2waeDES51k
         oYM4EQ3xvSlZT3TJH7b2K60WsIwcscyp0iDrB0yN19op9D4ooiFz37OIi3BEPZSrhtIY
         pZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=nhXsm8jFV57ph7GSv0aYxnm6vZTRxaH1TSpl97usJSk=;
        b=nk2iCJFAYqCUJCRW7x7t71StpRsg2PynzVZ43MZDIta5j5UFtt+PdRpf82doX3IKWR
         bx5mCfvsjeMid2G4SwCQgdbAA5DxAQsFp27VRbkYoIIX9Ero3mUR+32VEDDW9Uh+zpWT
         cFFF+WIKUl05+O7XWLC3imedaq/SksLXOi5tClbLJT/2fThM9kYh+l0dZKt+j5EbgbC6
         Y45iiPnDdTgs7Qzq5p4LRJAglIDzTaYhsj9crDO8WRoWbcCMokdYxGOJVpgPv5J8hMxm
         9oljnTPJT9rSrt1LeXrnN7nwKXM3PxWMakymDd6Zh6KAeRnxW1bfFpxsp++rlMHd0PFZ
         hq9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zc0twz5w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u16sor3716730pjr.18.2021.06.05.14.55.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 14:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zc0twz5w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nhXsm8jFV57ph7GSv0aYxnm6vZTRxaH1TSpl97usJSk=;
        b=Zc0twz5wGhkmD+YX3/xZ8vFW/5sy8niqkyJ6DWSM2Tburm0w5jipsjxwmIyufOrTXU
         idN55i/LRehvjShIV3tbgzWGddSuanPqttAPupPFlSz8wT0a+7OCPOmblettSHN8ahMI
         GzqAe9I3oPcAxn6rTpMYHuVQme6nIoysaXbUEguZPBFMuXKFXfrSSxh8J6jw/v3A1I3u
         zQFr59KV8pn+vyv98NAvZXEw2P+l8gzVRqGGRhBjjsRTU8h8OfdNTEzLE3/NPfsIwWJC
         xGS3OiYhSr9cyQ5pevSCfUQelgL1qs7mmW2mZp3bgJexeEYqSTfNbKZAvCo8WlRLwJlJ
         7K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nhXsm8jFV57ph7GSv0aYxnm6vZTRxaH1TSpl97usJSk=;
        b=tkM1fyudt8JL+TiEVGKKjx0VlTQpUjyI0jJKdJusWauTjrTQpfEjKJjMsOal4IUzsk
         KlTAQysznR65BcfDR0lWj4VltrYHd4JFn87kqGf/pa5Beyt96CARfLN4dp6n2hJabTHW
         TfBwSKsKABAHm6eTo2+HW4ArMpbkHo9pGsJK2EfFgI2DtLI9Qpe+pZ3xgi50lJWNEEZz
         afys9jLM0UDQDndsV3VR2sxEu38iTk2yErxXlOZo3Tj+LVzuY6cjYuoTKFtSvTGo7qv4
         Rqd8ZVOOv3dlwXto6bMf2GEw54HTuXoFUBlR4nthOX7CQoMQXsTnZN4Qi+OKa5LINJh7
         YTpQ==
X-Gm-Message-State: AOAM531P65g23VuL41xaaWIQzGYglbqkz5FF3unYqujer40bMDsZq1AT
	fVPmN7XuB6NgEx3XKtD3xDHXYddQ
X-Google-Smtp-Source: ABdhPJzonp94EeN92ccWA4yx5OAhWeymUABO8CuWA+e+AWZi3mIarE73Im2NIXsNBOG6XUWJAZwKIw==
X-Received: by 2002:a17:90b:3796:: with SMTP id mz22mr12044018pjb.16.1622930127635;
        Sat, 05 Jun 2021 14:55:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id 76sm4622688pfy.82.2021.06.05.14.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 14:55:27 -0700 (PDT)
Subject: Re: [PATCH v16 84/99] target/arm: cpu-common: wrap a64-only check
 with is_a64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-85-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bb406c5-f51a-01de-8b61-368b7f96eb93@linaro.org>
Date: Sat, 5 Jun 2021 14:55:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-85-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6MgRKBa+BI0T

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> now that is_a64() is just always false when !TARGET_AARCH64,
> we can just use that instead of introducing a new ifdef.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-common.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Ok, I guess.
Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
