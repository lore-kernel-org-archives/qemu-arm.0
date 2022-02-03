Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1548176lfk;
        Wed, 2 Feb 2022 18:30:34 -0800 (PST)
X-Received: by 2002:a17:902:e849:: with SMTP id t9mr33506922plg.106.1643855434578;
        Wed, 02 Feb 2022 18:30:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643855434; cv=none;
        d=google.com; s=arc-20160816;
        b=uN9+SdCCzZh8BUArqSVicxsnG0T4AI8KTeBYR8MkBk2gF28XGodGaTt9eWkFn1eLh4
         rdleFfvMeMq9uBsKPeVhXeS0cTntClFfgBxN4c4o8+PnS9Pc+Xa463SzpHtvh4n/7coo
         a8hQFWAYWmXOyReuC2qP5x1Lr63k+Tybr44rsbK0azGjJuJtLPvwdcYz5cZyxCksKtN8
         W9SSKG1JqjBLdSCxQ+Uktt6YD9ZMo76vyOZxmfvCKVWAEvX7bec1HMDn69zGUrxHVYLy
         iRwTSu97CWscPgjOwYbRbwQnQ51b/8U7laD4Av7TCm6jBI0p3t6jsr1XpeFwrOZxR70w
         OY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5k8P8ft/590WBkAcO00R9atoa7PNz54SNNRz1Z9B4Xs=;
        b=g5ySe7vsrYB7dM/+0+R2Xk60WgoIKgYHifVuBAtd+gr+moKstPVSXWLCxjzt9Hy1HO
         M8aKqLmYwbbm8/dqCA1Cq/5J0ltQ8DXulssvUGMUbFEgLGO3wnVaKtQ+L1e4epBlvhPO
         luKQX+HsZByHv9YxRjrEw/jM3kTGTqUKf9KTLyVwcFslJH7AURz7TsHg8I/pDXntBOHA
         luBcw/mM1DWzEJQ4tNjFDFwDfoOVu8lYy2lhQ0hrilv1webwi1zZnZ6ENvXypSjwtHY0
         H5FdNeltO9xa9L33w1U35/++2AL2pgHcn+rFSkRLtsqcSENrqoCqm8LKdLsrhmJiq5q7
         60IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HgAerBQ3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q13sor9089347plb.189.2022.02.02.18.30.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 18:30:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HgAerBQ3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5k8P8ft/590WBkAcO00R9atoa7PNz54SNNRz1Z9B4Xs=;
        b=HgAerBQ312V83+cp0V5A6+6QJIciYPdimk9xaUOaYEKJ6TH6JLkzzf7u0JyO1EQT2T
         0yDJ7aX+ht8/gOgtHL6+AtEOfU7UjXP509fPaj+f+hi/jAitE+FKPsUvsIGQhK1Hl7PB
         1lw9khnGrD5kXJcku/0HnbeMsVEUz+TPJW2aJ0XTiSJ56Bn681fHDUJ24sdTIBsAxOBi
         mrU5CNOfIAabPGmZl28lcEuKuHs9jbMDLJiwd63kRSQ1GZLbxFI74aqdiRxoVMfNY5If
         YALtelEZWJOP0W/PfnUiw1hWkGorADBpbSBbW15XONx323RfKQb6Y3mWCd+rpSggWuY7
         7aCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5k8P8ft/590WBkAcO00R9atoa7PNz54SNNRz1Z9B4Xs=;
        b=47+zaoZOm/vAb4At/y1iLqxCdf4WWtQoaAs5Iwi9PwZsFZuKFadXQ9cLyGv0JNiayh
         V4i7lFFwkwHH7Vibq6BAl3HaVmqwwqPSBzuDyDhM9KOYcsuS4vwumJ6RJhTX9p5qVN3S
         hcHGfwrxUsJWMsmmSw+WPcBqHBKkyJ66hYoQJZS+CxExy69ntRBRu5b93rHCuC+FbCPn
         ABGHofuwS2fyx+xIyc3w/hPIR21OfCmXfVzVe8vFJD4k5isT9fmy3Vwq/NVf9I+W9mtE
         Zr649OnGY5N/45aQWjorAkxiXXH6sq1wxfdssehkigfREI2G5mploWqnAzkNAIWOnIMy
         oPvg==
X-Gm-Message-State: AOAM530BGtz/BDydiOLFcesbgnTHudoyl8JTJTGrH6mewdAlx6wo7ouv
	7tNznGqpW+t1gSv2+5vXLUYl4GL3
X-Google-Smtp-Source: ABdhPJyKpLZegb3QGxG1vWX/v9eahSYNlnueCljGDVKYHoFDUOE6mnX5kmPHTlB4fEg4ESxNK6qwLg==
X-Received: by 2002:a17:902:e8c9:: with SMTP id v9mr33621128plg.171.1643855434068;
        Wed, 02 Feb 2022 18:30:34 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id mn2sm7504523pjb.38.2022.02.02.18.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 18:30:33 -0800 (PST)
Message-ID: <e9e11a61-131e-4360-e760-4175d75cd27b@linaro.org>
Date: Thu, 3 Feb 2022 13:30:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/13] hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: go2wRjke/WWo

On 2/2/22 06:31, Peter Maydell wrote:
> Make update_dte() take a DTEntry struct rather than all the fields of
> the new DTE as separate arguments.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 35 ++++++++++++++++++-----------------
>   1 file changed, 18 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
