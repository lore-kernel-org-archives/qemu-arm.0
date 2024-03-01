Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1322570eja;
        Fri, 1 Mar 2024 13:12:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwIYgfa37xgVF6cSVYXnfFH0WBrqkU6wuBgQleu0Kh03oeeQsKOx1kA+u91WwKnkOD3UVMgsdc1StteqthB30ArogO/2FN
X-Google-Smtp-Source: AGHT+IFNishwHiTGmc38jwPfpTBA8lUtjinW8qJVjwkY6bkm+BqeP/Ix4UCMJstVWrTcEtGyQ3hV
X-Received: by 2002:a05:6214:16d:b0:690:5220:8cb with SMTP id y13-20020a056214016d00b00690522008cbmr2945043qvs.51.1709327525674;
        Fri, 01 Mar 2024 13:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709327525; cv=none;
        d=google.com; s=arc-20160816;
        b=TSULCjxohFMU1TM146gOnxIiK4okSZbI0W55olmT5NIe2n9+xu9WKdN4WpQJWSBcFM
         KHpBQvSOLEigmbVhS64i7/qwayFcLYECYKwCtUw5CMPuI5RuBeVpHuvqFDZiyjLL4dp4
         NhUnilEq7u8n3dykaw5hfxEN8V+at03qvDrQ5snR1yF8hRmNDcwBowp2DogFtcuX5iGn
         iJnFA2Pw0HuqOC+5OXc7UIOnoVycUlxn5EMWdExEmxRcBD/Iyi/ot0m3k0Ygv58afrWo
         +4ZzM+aMvw7fARWPJEmud/HhQ7Z+dcvVqAy2TC5s3maf0OAW6q+b7yw3fr5nyj6Nmu7f
         k3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mWdjiPjr30glgV0WFI/rH5rwT595It0dyq+bAo7uky4=;
        fh=/u321mYqqpJG1V7uGqe3Gd47/gjfF1QDW3BkpXoA8Pc=;
        b=XXVze13BH6guYLFNtUo6DNP29Suy3X9t5SZ+uHP6VXRJAAU/xoz1n/0hToF58T1Fkf
         dK75eRyFaMoSIeWbvIhwBWGbu1uZKn11IX0+KWnkw7BbgMVlPA5wLhPFHye4oLgiM+/s
         dQZMUwmUiQaM9rkRo5Hf176YK7b7ZSX1D+j+uPtmh29GHK1naVBP35rvR5KYJV37/ITp
         EEDxtsTFUEnxUzdwn24oebgPFl2wm2MCf4pTGwTi+2r4f36QzsKHT7PVTG+tR3BbnhoE
         7jkEaTKqC6SxsN7SfKnGwcUzt/sJxMIC0XYs3ATT2FcrkMzj545Z/zdchJ9L6pNEDFwo
         g4eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LMW+hD0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv9-20020a056214262900b0068ff1888580si4421272qvb.97.2024.03.01.13.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:12:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LMW+hD0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgAAj-0004hR-Ow; Fri, 01 Mar 2024 16:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAAi-0004gX-NZ
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:12:00 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAAh-0005xB-B8
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:12:00 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2998950e951so1799972a91.2
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709327518; x=1709932318; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mWdjiPjr30glgV0WFI/rH5rwT595It0dyq+bAo7uky4=;
 b=LMW+hD0ecKupOnm0PLIz129NkO0MC0ntNQ1MRiVLlyuG91kuYkj1UXJW9sHQmMeipz
 j07qx1rVqtEit4ulVT++j3gzrfclarz8A6LIkPC6CV92CVBCB9ErrVbBlQVRbw2NxItO
 Uj/mrbp/3DNuQPIcm0pj04pKg1L+XiVzyOHIQZfllmz/VKmhWod5nFK0qbJq3fo54UVe
 KNTrxoo8Ip3zY9cUIWMZnuvS/n8n++heaCOcf7dBikAIjLKjkC4i1AoQDdZOeq5eg8+S
 6MLVNx/uANs3hnvUNXtnoHh9n+TzkgWi1bv2JPUyNblbJryZiz4HK+jh8nnoxN5J83mY
 vNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709327518; x=1709932318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mWdjiPjr30glgV0WFI/rH5rwT595It0dyq+bAo7uky4=;
 b=SrhlnKtTxc0mQR78mxSnXD4a2IC4innqUJTldi3hKO5ehWlu+1XSJuEv9M0TmgVaTZ
 sxSS7FKnR6z/qSL34rnUpYojNJmUZEAlD4FKWx+HQxL4+CUrBlB5XnyLO8CXmxTa+Pg6
 hPeBPXvpZl49leJ8K/HAOfR/2hW/k0mSXU3dATXb90AYQhM4ZJV3x0M7PQzPnvUep0gl
 xId/5pt5KLDnbHfu8Crp/9Cv64GbgcquaUtjAXGP00bdOodvraT+1O6ACybHxdZRvPvR
 R/BkrB5bYrhidJNUjGMQ3WMQ/xzGKzbK1MEso/I2gOZJEtnIeLFdHCovzxWdb51hjI0A
 jF5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/JGwZHdKUa1JLr9XwiN2OL69LNHwXCQaGo1s1j2FRm34Qw1pN+Dbd+JYS0Mw95zi+up35+FMD+qXYISGDwH+gugxb
X-Gm-Message-State: AOJu0YwGY+hxt9KlUsSKYJ77TaOocZc1HbpaMFBGdC3Xm1hfEY0JbHkb
 7IhwuQ7VDKY/oycX9rSdfgMvu/2sSRYH0DYUISw6sA8TcasAD5TUKW6WraZ2sp8=
X-Received: by 2002:a17:90a:9b0b:b0:29a:2788:c9d1 with SMTP id
 f11-20020a17090a9b0b00b0029a2788c9d1mr2800110pjp.39.1709327517840; 
 Fri, 01 Mar 2024 13:11:57 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a718200b0029ab17eaa40sm3654043pjk.3.2024.03.01.13.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:11:57 -0800 (PST)
Message-ID: <0404e89e-9d15-4f4c-9a0a-b9f4c46b9eb9@linaro.org>
Date: Fri, 1 Mar 2024 11:11:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] target/arm: Don't allow RES0 CNTHCTL_EL2 bits to be
 written
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: azORbzxi7qLd

On 3/1/24 08:32, Peter Maydell wrote:
> Don't allow the guest to write CNTHCTL_EL2 bits which don't exist.
> This is not strictly architecturally required, but it is how we've
> tended to implement registers more recently.
> 
> In particular, bits [19:18] are only present with FEAT_RME,
> and bits [17:12] will only be present with FEAT_ECV.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
