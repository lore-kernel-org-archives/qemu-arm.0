Received: by 10.223.197.9 with SMTP id q9csp2710441wrf;
        Sun, 15 Oct 2017 09:28:59 -0700 (PDT)
X-Received: by 10.98.64.207 with SMTP id f76mr6412346pfd.279.1508084938976;
        Sun, 15 Oct 2017 09:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508084938; cv=none;
        d=google.com; s=arc-20160816;
        b=vXJHoavL8thOivY178NnZfepoTlzmB6zWRd4cggca7trsYbhlZFQ+7/ysmsUmWWcW7
         8aimLi2sjbFFzUNxiaUfs/wdDUjbg5kCJk6c3+lhWZIl5JCkQn27uV0GLypCS4OpHihu
         KB5ih33W32osrdXjq6EOJtqsYFxQESj/sYdt6W9WAMq+Ng59l8osj8250iq2AaWLzjcV
         A4MZHzJ5HsXAXS9VBh32wNemlDeVC+kfCVoq8aFSUrQB7zJ1vpqsiU//dAt4hl3h2Be3
         kWAci9R0T3sTAhQhG+f00NSxEcM51ms1NFkgte2WdeAUglXQthqIYEKaFfs4mZMRSXqe
         3Iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=1Z4hSSaG1pnlI4cgtO/yBNXFoshMZFxv8ioAXa8zfsU=;
        b=TTDbtlbJrJlZ21EQq9AxrMN78bMy78iIf3YzsSd/LxM822SNjyPDgDEIgWuMY4YtXa
         Xaklt/ZRle5rCsPp7uMwWFlC2s7i+r1BEYjgs4iveJod8sOI99qF3/VK87O+4gT16IiB
         qbCVUIXC/zP0bnENuoMAls6PoUzGap20dRbQSPL03WOW62dGyBiyw3sEU5+s+HQbv36c
         kMwSgLgIsRUFEFe85IHQTc0UZlU4yABEZXcn8UNz1luwhdGOnBmse/sLVHDiepNsBmR+
         p83u/BJydBsjxw2NMxyH99Ur6B/oByWP/n3ullFzdrLXYYnbibR3WGkuaL5a2O75+HsI
         e+nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CoAqmFoc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay2sor1749342plb.42.2017.10.15.09.28.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Oct 2017 09:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CoAqmFoc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1Z4hSSaG1pnlI4cgtO/yBNXFoshMZFxv8ioAXa8zfsU=;
        b=CoAqmFocE0zdJIGa91hsseMhRHaM39U6Tp3t5wcZylePthIu8PqsAO3Epc1xFvU49j
         9x8Z/ZObv5a8ZMEH8Q9ncp3evTa5YLOYp/ZQlvpy38sp4eiep6lTCcUQLhqZ4Gz0dsUi
         RbQeMV54zL7X4+vrORwa8Ae5pAcfx5MiQ8xII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1Z4hSSaG1pnlI4cgtO/yBNXFoshMZFxv8ioAXa8zfsU=;
        b=aRUh7RMgIpneAd4uHe3l70WJyMlM/6Of5JBbl4NhWT3FgcLKw6PmNG6hpRuuB+ySim
         vTj1nUhejSUom1AqIElr5IAbgJn2JqBDkAsnSTGTuvLQg3K9+LeJ0Ft9E2ypWCxCIj/o
         2ydr7lkEAOQ6gsT8tVsHooNMBgYiL9WfnFElicBiqysTelWqlFd+DHewqf01Il0hqYJa
         MglzKs2Yd8I5Osh8IE3ECmCEes7q6+KLtPciSBMUepo6O5O7M0/QR1wq0d8AfKvzqgWW
         cXZrXUTF0AFMsgAb6np9DTls2N0oyNEzR0EeVejeVujsjJpsah6N9Ame0WABwGIDQt6k
         /hHw==
X-Gm-Message-State: AMCzsaW0VpmK2K79yUTejrXIAjT9xF+7zS+jWIcRKjAHfum8iMLE6n0h
	6R/0V5c8QAXrH1pGjRcuTdo5dlLH
X-Google-Smtp-Source: AOwi7QAHhbytZ61opsho87SxSAIu1869sC5t95Peq4ule2yD8ozhDnHMvnuBLiQN7s/tZtRrqXpSDA==
X-Received: by 10.84.235.134 with SMTP id p6mr6872219plk.326.1508084938484;
        Sun, 15 Oct 2017 09:28:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id u6sm11535490pfg.175.2017.10.15.09.28.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Oct 2017 09:28:57 -0700 (PDT)
Subject: Re: [RFC PATCH 12/30] target/arm/translate-a64.c: handle_3same_64
 comment fix
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7381a57-4028-ab03-3858-0e984288fcd6@linaro.org>
Date: Sun, 15 Oct 2017 09:28:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Hnzv78zf1sFG

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> We do implement all the opcodes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate-a64.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
