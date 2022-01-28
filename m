Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp67138lfk;
        Thu, 27 Jan 2022 19:15:45 -0800 (PST)
X-Received: by 2002:a63:a011:: with SMTP id r17mr4977090pge.537.1643339744930;
        Thu, 27 Jan 2022 19:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339744; cv=none;
        d=google.com; s=arc-20160816;
        b=RwN/QpBcnmvQ5bEkJX2CuTa2uG0mc199twGqJ+DX1WpNFOfkGIlApvPvKXR6CCumnV
         fzVTl0rkb8yfV20vKlUCEGbhsDjFxWB/48wUhKPrMksSyoWZlhPiS6MeKEHGdRYjzgZh
         cNpLHrVLy0pwt8avyfX6929Y/Y6up3nl8XXWhyFmIfZ3zgIE9d8HaUNPcQXGku1Whyrx
         dKzRFOe/tQDi+rLd01qhhv12pMgXHiBDSnkveafodoQHqOiGCJt1/covRfqapLcCMlEd
         ZpLHToy27bM7eRWOtwegDlL/D1/nNP1pkrNTbhLbtHbqxpaufQMVSI9AOYMLuzIYHjkU
         alUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EZt81jaNhoY98TNkVvN44GCtkogQ8kkgDfpI9ov+V9Q=;
        b=b+JfvUE3x5Yb1/ge2Jv6Xeo5/GHvFUXyukXUltqBo5X7TCApSsPSGTY7cRw8yDtpe1
         /tqE5eqGEGB6VHVg5sStqzvb+DCmCm3lXJxxZGjRO0x9keLISY6eq4ZxHVATuLdZlvEw
         gLF5BCEv0RT4S1tGQ+qZYa9qtzT27+dKaew3QqCwMGU3iRoTM4jkOOOGxpd4UxGB3kG8
         M//1Chas6LKBn9au6ktuNzehGNskjzP74Abg5JI3K/tri48WCIvmA5rmEu/Me2R0oCHF
         O8YE6kdaLdip8c7HJCU8hn+FPF6yguRjuw1W+0//O5yP9P3+0HKbsoPH784YL+wk/c+n
         MXDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5Zbv0Xr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w23sor510678pjq.30.2022.01.27.19.15.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:15:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5Zbv0Xr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EZt81jaNhoY98TNkVvN44GCtkogQ8kkgDfpI9ov+V9Q=;
        b=q5Zbv0XrU1BoSXziV+SG8ZSNvb9VeORVSQJZcMJnHksMgstcya7KuiTLDCISIaCHNB
         namXrZz7SiFJ0hK7WWhc7XY/cD2r/yDVIHGdm/6yO3tTO1SRqsY8/lykTfnrp7uJC/g/
         EHHVd33MKDv/TcxLZi1qaLR3Uo38GzLY9EG6i25xJc0l+qr/zsK+CtjAN6ZbJFSaSwAj
         eNJbwBXcxaCFhJL+Tr2SbxviS/Q3Sv6iO4eGMuy1M6kPfHPzsI6lL0QYf+P7DXdRqLqb
         bau3qLn8NjUyvIgBElO8dSuTrIcxBo5bA560WOfbMsBUPzmaix1sKkdkqpRKrAno7fGX
         z5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EZt81jaNhoY98TNkVvN44GCtkogQ8kkgDfpI9ov+V9Q=;
        b=ZTUZkLt+dcst/W8cxYtJsOcRJKnumI7QQlFnq640/8C30WCkQlr8hxV0Ni2jpo4hHj
         JcAP1sV9pYyMfWBMf2slp8IllnrQ4r2pfnTvlZSTP87A1ODlPy4Lx9nTvNeY5gdYNexC
         SRod7HuwJwxFjKQgolwG9muNy4674s1HZCiE03Cnwn8vaBBxp4cYS1oaWl2Jf/ejRkd8
         z+5FmNYHVTPd/tAkInSekBSXW/4JCSS9tA5Sv4CliSYfzYgFLDgT6YI8sDw3fVuVtRiq
         AgRYmYyiXmAKhXtiNroUBKRLg5euHknl9gyidvcRR+HLZfQE6kBxsl+OCscxhmZ8oQzE
         rJPA==
X-Gm-Message-State: AOAM533HV/aqYpAyRES9EPabrAIDUssKP/v61Kh1RW4qDYLNkFaPFdhT
	mT7CdPE0zEUgetTfCPHnRpsENbZc
X-Google-Smtp-Source: ABdhPJw91vCH+EpKLMw31KuBOKnaN8CkZ0vW0g5zW58Oyx3xuan5bRz5ewaGcrogtukwf+/sdBN6vA==
X-Received: by 2002:a17:90b:38d1:: with SMTP id nn17mr4581436pjb.219.1643339744429;
        Thu, 27 Jan 2022 19:15:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id h9sm6769626pfe.101.2022.01.27.19.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:15:44 -0800 (PST)
Message-ID: <2343926c-8b5a-9210-a77a-662b35d28963@linaro.org>
Date: Fri, 28 Jan 2022 14:15:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/14] hw/intc/arm_gicv3_its: Sort ITS command list into
 numeric order
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: TnSHQt1GyYWh

On 1/23/22 05:24, Peter Maydell wrote:
> The list of #defines for the ITS command packet numbers is neither
> in alphabetical nor numeric order. Sort it into numeric order.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
