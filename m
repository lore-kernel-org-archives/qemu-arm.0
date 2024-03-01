Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1316981eja;
        Fri, 1 Mar 2024 13:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUsHZYjqXl+Lym98NLcY7VNtMXJKWVzEdQDVK0qOyKBGolxpFOcHAM4fB7p21nr8kEhJ1FH4CWlO90zSDP6J9FSdyUkqE4S
X-Google-Smtp-Source: AGHT+IGu/HBe8e+JoA99xlTmhhNaBgvqmP59hdbpFHdRWriR78vb+NteePIrLEb9gQQkL18vLP0a
X-Received: by 2002:a05:620a:4152:b0:787:a6bd:da9f with SMTP id k18-20020a05620a415200b00787a6bdda9fmr3677082qko.60.1709326915935;
        Fri, 01 Mar 2024 13:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709326915; cv=none;
        d=google.com; s=arc-20160816;
        b=08ityMzqH0SBSjLrvPPbllHKs+ebCHbDkblPaR4+8Eapcs2tEmbejywdCpumjdvoD3
         FRji5GmkWvLHLkXjVw6w0zWade+GFc+sZ0F45Q5pKWRfKfyjB2oOYTi4svn4Ke2kFMfR
         ugJOit3KGVib8OBivyqblPWEocGuGE5F/bFEaEGR56qwrZ6zTjY19HcR9Dqn9UK4Bo8n
         8xvSlKYt75X73tuAP5oshP8BXl4oHeqll7naJ8n6QqmwzC8Ewz8wDVdLgSLiDiI+vwse
         IRgJbh1c3bdwXj/x9BqN1uYgYv7fZ6JyE1XmerL5gcDbc3Oy90/qj87JpK1OHPTJf41Y
         JkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RU9YZj8AagaoCGRFPs6L7I/TWTREjW4XzxioQtL0dMU=;
        fh=WuIjVjgZWf7KvzLTSUO5v9uKEL2cjewUlYC/aFjo03g=;
        b=nji+/feZ0GFLPa2idhDuUgyYZrJeu888LbWu+aXixIEVytGvZh//0dgmlAQSCnROPk
         XC8ZeJ4vY16JUGjLuxiHh1qiCaCew1oxUea2ASHfTp63S9sQXpJG0sK+JFNwAEuuOUCQ
         6OINy+8hw8JszLY6SqEfwMXdLVmxKksQw/SPI3Ta3f3QlrxSN1IscDoxyegyk0Dzblzv
         8wzrokrke0T/AiPV6bKxwkPrQNYRngVJjKhmxnFT3vyow0WovsrgvXjgO+IbSI8j2npI
         Yaa12JYTwj33/ob6ozi3uHrp9z7wnynAwAiUUOqHi2cxu0wZ6gEpWFjXSHXAnZppLL6J
         Edwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYNegoMB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020ae9c207000000b00787b5bbfdf4si4189530qkg.521.2024.03.01.13.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:01:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYNegoMB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgA0t-0006m0-SV; Fri, 01 Mar 2024 16:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgA0p-0006lp-Tk
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:01:48 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgA0n-00032e-FA
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:01:47 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1dc9222b337so26017925ad.2
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709326903; x=1709931703; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RU9YZj8AagaoCGRFPs6L7I/TWTREjW4XzxioQtL0dMU=;
 b=ZYNegoMBEESxaeJ7j69RIyJoywrKnym+iv9yN/KygchO/QSbu2oziaOqz5imo+YJtK
 teZmJO8rcTf/D/NnaqMVWB/hCLVfrzXB+MdMnDjP6lNtiQya4ew6tP+V8K0h6sW4C/fM
 Pi32a++Sz5hj1sJBbRrkmUcDuB4Ef5aCjj9uZk4cxoh5nYR9bbzQchv0PJpflXHLy6lH
 ih0ZLZTQTHCzguvdFiEUUz4hZC6Q2RyDjB5ddwKgaN0LjLL/NZCUD4hgKI87QNd3lr7h
 BaFHjqYSJadG+XUga4cK27d5Pki/jslaxpC7IreWiGdXlG3+CSXLxRU+mbEuGIkW38IP
 1YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709326903; x=1709931703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RU9YZj8AagaoCGRFPs6L7I/TWTREjW4XzxioQtL0dMU=;
 b=teKZxn34SjVibCi8Hl6actqSAJeRQMTD9XQ+VHzUEuc4RYXwQDmuO168PVyMI/TR9U
 PIZ8Hg28WJQs0wKbsVEN7dw2ni1z25qwHHoxmHrXvBLR1jOebBuKXt4j2M5voXaYqAg3
 1KyDFdERtatdeRlSMD6ZAxhAjFtXlpSzm7uIe1Tc62Yg7BLveNNvnPum1p32O+C1zzmS
 CSd9VqN0bgM4gKOvm2qLfNzHP3sEBw48stmp5ID1NlZ5doFbnvObmwaKmACrf1yZH88f
 QA8q2ATbaNFjQZXLzC8li1UHQG+ENPd243W5pxNGKNf1fIdU36320pztBedxza+ibz8K
 YB5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkYqKFdA+EgFpDtwCVfa5jCyJF2MHjutIkM7ZT/aybsWRil9GGUnls76WMCNGyWp/pKJ8NmQ5913p5ukPD9OwqEAyO
X-Gm-Message-State: AOJu0Yzqw5MayoGBT7iHsPACyajKARIkE1gUWo+v8fHQibJepecNjeC9
 wdCO1S1jdkFi6xccofbeOVYD7284cKRZmLYqikSgkRgtQ1jakgHTLO+YjgSQQNg=
X-Received: by 2002:a17:903:984:b0:1dc:8b82:7f56 with SMTP id
 mb4-20020a170903098400b001dc8b827f56mr3315619plb.20.1709326903319; 
 Fri, 01 Mar 2024 13:01:43 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 w7-20020a170902e88700b001dba739d15bsm3908461plg.76.2024.03.01.13.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:01:42 -0800 (PST)
Message-ID: <c48b6ae6-87ae-4033-8a64-0ce756115922@linaro.org>
Date: Fri, 1 Mar 2024 11:01:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] target/arm: Move some register related defines to
 internals.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FTuhqFq67VKy

On 3/1/24 08:32, Peter Maydell wrote:
> cpu.h has a lot of #defines relating to CPU register fields.
> Most of these aren't actually used outside target/arm code,
> so there's no point in cluttering up the cpu.h file with them.
> Move some easy ones to internals.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I want to add some more CNTHCTL_* values, and don't really
> want to put more into cpu.h. There's obviously more that could
> be moved here, but I don't want to get into doing too much
> all at once. I pondered having a different file for these,
> but probably we'd end up pulling it in everywhere we do
> internals.h.
> ---
>   target/arm/cpu.h       | 128 -----------------------------------------
>   target/arm/internals.h | 128 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 128 insertions(+), 128 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
