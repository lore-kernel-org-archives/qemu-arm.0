Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2227928lfi;
        Thu, 2 Apr 2020 10:17:56 -0700 (PDT)
X-Received: by 2002:a17:902:9f84:: with SMTP id g4mr3989203plq.2.1585847876141;
        Thu, 02 Apr 2020 10:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585847876; cv=none;
        d=google.com; s=arc-20160816;
        b=K1jwuzFw20cgzlZBjZWTtSaYx0KtbW82KVOasi7RZNQrme59aabml1vB0HHUMnDJMb
         nIShJNVj3QJRsy+ncZ0OYM8sVN2HmXQJ7JhdJpxOk7NEnWIBeKm/qF6B3Orkks6pWqkK
         EJEsBhYjVhV79gpHwqnedKsoXPlTVHmzLLlTi3X14NfWO7iHchJa3Dq0Prss5DDOkR8Z
         jcLELPO3fiTzANLHyoTrvmm0hvzIkxIpW4dhrowC8CdRYwAwLyKZqu+VGV1pXfIh5y4F
         FWsLjrB2jq5wsG/13+hh+0RLQ3I767u07yYxBj9dgbHewvRfX9c6Nl+9Rh7oUgMljoiG
         qnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=qNMuSy6myQERHMzlzFwavqf8HUhcKDEUQ/y2TeKt/W8=;
        b=GEnvQHayaIdBv9JzJ54fKDcztcCbhr3fI/GKwQHrY+8hrDsniMLIauaIzu7tzLABjL
         zgYaNUTDmDodRiEVKQT0vX1z2T7omrJvFLQw2AR4GEmTldBejjrzR3bMBAL/5rF4d55Y
         Gqq88D6Rsa2Zx3S2IO3aY3SzPGaG+CnoJbAJCNTJT4RytefawMzO7cvhlk4/EI52Tood
         F2XR7DMnHElgfFsEuFtCGGwooN/O+BnNsMRTqO35oBbRTYN/nJxO6IFGsbMmSeolxquI
         5epgXgdT5YVMJld/16DhvAsZ1VvExEK02RpsDxMzxmVYuypulN9rewTVPJYqS7PJ0sOG
         2CjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q48eN1qI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v2sor7916859plp.18.2020.04.02.10.17.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Apr 2020 10:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q48eN1qI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qNMuSy6myQERHMzlzFwavqf8HUhcKDEUQ/y2TeKt/W8=;
        b=Q48eN1qIgfBSGB008QFETon0+zBn6G9va49ZXitU7SxtMMMRvrgNFxbImGvgaeXuam
         6uvEBGM/PJaaxa9Tl5s4RixZJ7/DX4uNyJRHl/0SuxyP/NkUpPoyqdr4H+zVMEJAxoFF
         qJ7VzTdhqNeIok6CSOa71kXrkFLBqw0Ln/i5dX0xrmlBl4Woic9dsWZoLTwcFtz914CL
         WId8Jr+n7qM50K1VWHHDIfDwdO1M1fBdKTNAA7fsJyHncVbd2WjpJBmCsUrf1XKEU14m
         XJWvmE6QICPXfR7gC3Gz6FXezz6H8SvSZVxRJh5jpCUGT4yXL1Y8VgFFJvbx/IR6SDW4
         Mwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qNMuSy6myQERHMzlzFwavqf8HUhcKDEUQ/y2TeKt/W8=;
        b=NPe53m9Bo0AQI2jxQpaLqXEWS4gp7zYekVCz+itTnsMXbMBjC+GE4dDlUrg0jd1yri
         dve4s9hQ8mGUOReRqDTOXUsH2glr8LH1kTeYi7eGYg5J3WowwmlKiRxf2BaH3qZavhnP
         1DLGsownsxofOYBVOEC15Uy56CHxQ1/X2Ru209W7GQM2xdENNfEEkbdylUF4kTmGZYQq
         wwOCa8Xnp77L4YUkjU7I8T51I491V54BL3gKIsJaan5Ti4TewF3wF3T518D9BOwK23d9
         N/3z/ACSM8Q2bOlhaZfvGRFqy9vWkUOdnnzVSS7NtX9bU3KHuLMU/rYAeFWvJtIYeSG8
         yKIg==
X-Gm-Message-State: AGi0PuZYAKMQPxamluvbeuXvbToofZrC7eRbzsRanpLeA/fprFuzZqDk
	gPFgzr69mx9VxISERogmy9mSCQaUFZ/F1g==
X-Google-Smtp-Source: APiQypIsfrFFHbcxytlP/1obJ17DVib2VGdCFwq7Rl//gsK9WvUTmh2+cNLxdWp26tIk8M2ugY2P5Q==
X-Received: by 2002:a17:902:7d8f:: with SMTP id a15mr3771722plm.265.1585847875560;
        Thu, 02 Apr 2020 10:17:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
        by smtp.gmail.com with ESMTPSA id h198sm4104607pfe.76.2020.04.02.10.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 10:17:54 -0700 (PDT)
Subject: Re: [PATCH] target/arm: don't expose "ieee_half" via gdbstub
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org
References: <20200402143913.24005-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6b3a94f-b7db-942c-2611-c9881c2da5d6@linaro.org>
Date: Thu, 2 Apr 2020 10:17:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402143913.24005-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: omEBHCteZrUB

On 4/2/20 7:39 AM, Alex Bennée wrote:
> While support for parsing ieee_half in the XML description was added
> to gdb in 2019 (a6d0f249) there is no easy way for the gdbstub to know
> if the gdb end will understand it. Disable it for now and allow older
> gdbs to successfully connect to the default -cpu max SVE enabled
> QEMUs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/gdbstub.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
