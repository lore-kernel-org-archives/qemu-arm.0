Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp29455lfk;
        Thu, 27 Jan 2022 17:42:50 -0800 (PST)
X-Received: by 2002:a63:1c1:: with SMTP id 184mr2764367pgb.66.1643334170601;
        Thu, 27 Jan 2022 17:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643334170; cv=none;
        d=google.com; s=arc-20160816;
        b=s395QM2qcPauai+UvJZrw9bmw5u7NREiFvVpXrGOUqwf8rEBH+Lvr+vcXQykXSxqAz
         cjSHGhVyJu2Wvi/bYIbUjYtgCR0DMgeX0D7DoNeqa/NxaJnPScLPAVFMwhv5cqHLTZM8
         ICtVTjMVESDQfjwZXA2jB/AjEjGKPhcOdqRiuMtdj87hUfh5m/zHfYDDYg2t3dezba0F
         YaBhvIr+JJgSeEZVR/PhOiH533JmywdUnJHG71AS1Hd68GDSzZ++Vu7ZkFJb92TarOGS
         KZNpXRQXYGsAIqGP1GXC6U7c4sBclAZSi51cPcjSCslNcQNTfu4AA5v0mTLaNyiZEoBq
         CrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UBQg9YR5jTkdJ7S8Bcm4ntzYwqvC7Nk117MqSldtzb4=;
        b=NjGCqSDAlAmOt8LG42wwi5eMwK/xRh2B4Wir/XHxjznBFxIVpbS7Kk3BDaRYzooC8L
         K1SIk6YkQRZcGzzIpLpA2UcNeNIZIj+5W6Pl3aT2L6f4X5K+lrxY5fFywbr9VAT2ToZ2
         ujcuB0nWYmfvqn0kqqaH16Gc8ImSXr0+dYCPgZPqbe5ALf3QYW/3UTKd4/XAWqXVtWPA
         f71Wm1G8ze7cpX4l0JhWVoGbLqufJUwvPY2eMik4nqbQp5LwNRcA5rmsqVX/iph9c/5v
         j+op+KMe2Ribboppd1QdO+ilGAj+TnnY2EY3I85Oi3a++0PKL1yFKH52t3T+hMdBcqPe
         ygvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsHdHeqV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2sor1847467pll.0.2022.01.27.17.42.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 17:42:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsHdHeqV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UBQg9YR5jTkdJ7S8Bcm4ntzYwqvC7Nk117MqSldtzb4=;
        b=QsHdHeqVwghZ3cJPBXVEYchcw5aEgRfo5ibLNTnm5shpYKTtr74iA4Royq1XYetKMP
         MsOfN9ViJgj1sxkfdLP3FFmvUvuoPuCIx4yni0eZ6lTn7jjYfQIAtpurwGXUd6fH9OeD
         o2MN00qNIu9fqOLBDHRufwSQX1x0ZfcjlnOypsKtYto+Wnb67JivpQ6yT6a1BL4D37hI
         N+47ohQJo21rPZZ6opD8ciS5/X36ZREtzLGoqSRO/pgkC/oRqPxsY8R6HG2dngWxE4To
         Z19H0fgRDqyrA6DN+TdDXWFR+uT8bQqrgu1xUmZ0pDDqQg8PFHJQtG0luPgUTFR785YV
         7DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UBQg9YR5jTkdJ7S8Bcm4ntzYwqvC7Nk117MqSldtzb4=;
        b=sjaQBMjwtNAVGkMCkb6MZD4YIA/sCBwRC0ZPyZeHxQAMWt79NwlVVZfnucyizf19HC
         N8h6iyLrDtOHBfwl0J+phl5pMdIX326LgCbeJmkBEB0a4RdJfyW54OOkXGxeHMVtbSL1
         9xaFtgjxEP3UBT3+/jde5tDzz74Tn+kWwkfYkpASxgTIZTo4T1d1JcWJnGlkhyjRhC1x
         gaBL+uwLlueLDaaheEGASZeRexlvIqQVDwi5vpdtKRlSkiVmNQXqZ1oldjKsoUKNtdhi
         /J9Ru6oIp7LfBELyhuKKD5+xZVojCflBOpi4EJQqaDuuzIhJonblzxwumXAmZoiOHbDu
         JbLQ==
X-Gm-Message-State: AOAM530zl39DP92h6PLIy6CyGm9IG73VZlA4z3G45CUDFcf8/7XyPRac
	66pHZ/klQdH6AFjtZBiYC2XMLT0Q
X-Google-Smtp-Source: ABdhPJzznDjLOHgxnV+ij2/Rwia2RRl58i/J8BLmDa5ZQqnioKV3Rmr1aDpG5e0cQnjP93NHDI1HeQ==
X-Received: by 2002:a17:902:ecc5:: with SMTP id a5mr5841153plh.30.1643334170051;
        Thu, 27 Jan 2022 17:42:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id oo9sm532584pjb.15.2022.01.27.17.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 17:42:49 -0800 (PST)
Message-ID: <a90b72ac-104e-3a74-da54-4717d17fd781@linaro.org>
Date: Fri, 28 Jan 2022 12:42:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 12/13] hw/intc/arm_gicv3_its: Check indexes before use,
 not after
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: aDzWdDdRIDWt

On 1/12/22 04:10, Peter Maydell wrote:
> In a few places in the ITS command handling functions, we were
> doing the range-check of an event ID or device ID only after using
> it as a table index; move the checks to before the uses.
> 
> This misordering wouldn't have very bad effects because the
> tables are in guest memory anyway.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 42 ++++++++++++++++++++++++-----------------
>   1 file changed, 25 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
