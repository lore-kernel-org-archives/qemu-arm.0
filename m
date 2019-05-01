Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6172033wrh;
        Wed, 1 May 2019 11:35:47 -0700 (PDT)
X-Received: by 2002:a63:5d3:: with SMTP id 202mr27214346pgf.363.1556735747337;
        Wed, 01 May 2019 11:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556735747; cv=none;
        d=google.com; s=arc-20160816;
        b=RlDRjibBeqCxiD1RkxPGflnjt/P9gw79iAQuE4/fkDvAk9NUNmQLaDkHBzicuYq96s
         COWuJnN3gIIW7MvfkALgMuMnv9tjhW4oUJScmWtaCW6T8F7te4UM6vlLuySLbFrx6Phf
         DYMtBAetEWIHBjiQQo5mduF03rwIFwlFtYOjmtC0GUZz+/UdDWzH5RgiL9sFp3F08TGH
         5f4wda+kA3BIx/my5YDxkcPd58AvXNkrQ1G7lbm1Egk94IbqhT+diTjXwbo44mnnnx4e
         UTU2aLeNV1UaRl0QkuNO+qIfOh9AYe9BGxVM9sxAPbG+K0fmEHY61Pbsipw0EyeuOM1k
         Mf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=XUGPEUxedUCxBVt9SRj52ALy7ewssWD6AjmHlbbsC3U=;
        b=AZEm0VRWCDsJACB/UvePHlvCxyC+Mcn3njp4OTMyCz1UCkRB46wT0VYyImR3813kUW
         LtCVDsf4O9gzPoJ5ySqs23lNTPTjo2Lehd0OXFyJETmEwZCpV/OWscLqZZnXK3L3rPgr
         qQ4MnRCg1lFoo4dcqMzWQ2EGlaK4uq8U4i17Raykx8J1bKAT5zBTIZxdak9FUZ1heDVs
         j2xWFRwPWhYydqd+SJw7uZ++uItvE+pPLFUwf5c7GMruHvcRqSEEyMtuQX5ff8HZQSbT
         uFkSF+wCm1zJIxtjzlSSFc7lOC6dlkPB4NCkfuilJhewD09JUl8eJ2IvF13HKjXyFNvU
         mMEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2LsA3rC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 15sor45337954pfr.9.2019.05.01.11.35.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 11:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2LsA3rC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XUGPEUxedUCxBVt9SRj52ALy7ewssWD6AjmHlbbsC3U=;
        b=a2LsA3rCfW/ZnGIHvGudkoGXL1c379iW+aWChfdb6Jnb0ffab9PvDTLKUHDCtlfxyN
         CmuI/i7bzuk0mkci/vbQJawmxncFmM9hVBgL5+kwBWq0p87qsK2x+43cLPfPIM8DWzNJ
         EaraORheBy51fuQVfG9J/TvFQ+wbVqW+DQy9U12kJw29zjorKOsayuYB8RMcdnaehRkH
         KyZ4gXkwCeQkR2+HxE2wmXzb02GcWHEkcLQ9vf266uFtCVik4dpj89XbSPdRUI02Ks2X
         bfIQaKzc/ggkgDnR3t4OYd7SlC5eaf4ViZip4Ek1Bi0edlFss1nbkvEpvh15NEEHaByJ
         bhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XUGPEUxedUCxBVt9SRj52ALy7ewssWD6AjmHlbbsC3U=;
        b=e0zpV1Ky8xXV+mOp+PJkOj2yBa/t4CN9xO0K9Cop5XtdqtM+SLRGsIJRPFfzrInE/L
         7ctdJzmVXlYbs+fr3qgvCBij+UCDSE7fxb+5t4ITAxtZPJfS8uI05LUQHE/riudA/VQA
         VQK774JyNbb0sVaQ1j7+NFge2bl/+JOc6bAgrUp5iWgcP6yT3Uhhy6iX9wJipPXY0Yj3
         TnkbDkeA+VKYg7KplmNMmVk1is4L3ZgOGcqVt9/zztE8tWlHfALQPrblXp17F+hdcZHx
         aJxczKHaSyRyM5HqWo/TGwQP9IGCL54/R2sEqkhGa8NhEg1QsK/uhr2hQmbZVYXtZNrS
         o2eQ==
X-Gm-Message-State: APjAAAUntRjeC7Ebq+eJXARPShTWtnogzaz5F8z8lGXNIqAl5Brhxsff
	xEl4BK2WGRxTJ5zKqNKgtmX4Ot1i
X-Google-Smtp-Source: APXvYqxmQhm+E8HSf60UAxJdq1BAV2oYJyxq+EUFrIHF83sYKxOB+nfF+tVMZzB6Qe2iobqBvHibcg==
X-Received: by 2002:a63:7f0b:: with SMTP id a11mr70655312pgd.234.1556735746908;
        Wed, 01 May 2019 11:35:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id t5sm50925926pfh.141.2019.05.01.11.35.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 11:35:46 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 04/15] tests/tcg/multiarch: move the
 system memory test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <243c271f-ffff-6a6c-d5ad-1b5ced78491c@linaro.org>
Date: Wed, 1 May 2019 11:35:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: nnoeOisa4qmg

On 4/30/19 9:52 AM, Alex Bennée wrote:
> There is nothing inherently architecture specific about the memory
> test although we may have to manage different restrictions of
> unaligned access across architectures.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/{i386 => multiarch}/system/memory.c | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename tests/tcg/{i386 => multiarch}/system/memory.c (100%)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

