Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3484792lfk;
        Sun, 12 Dec 2021 12:55:02 -0800 (PST)
X-Received: by 2002:a65:4bc6:: with SMTP id p6mr49050740pgr.544.1639342502290;
        Sun, 12 Dec 2021 12:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639342502; cv=none;
        d=google.com; s=arc-20160816;
        b=QxnXp2oHywOwq6Ccgg47P2wP/b6WFJjuzUOTZFNRKuxru4jvgf2s71i5zvGfxENjKp
         CB2FfOsoDnRTsVag2YFq6yQKYL9LztMq6tMegF1zS5t9XLtbeUe0gM6/WEwDe4FEMB1G
         QD5BgAv7K+jsUZVl3/tXKJ84veKnFhl6rsNKmGswXwjJkVtSr54G0RYgLMJl2eZkzsV4
         IpVDdDaqAaDc6/bfkgaEdzIqkh2U+ncawaJzyuXWwUh/sIxe1xZxlzGIjIaAO7zjg4T5
         0ykYt/LlbyoeITBRB4jtfoUKFpjHlV14exzoegOv7J3oAymE0VHIUcLEBDPk+AjYbwvz
         WltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=X+UeYsBhFjCydbUuQ5rgpZcpkx46cZyRXNoHLfigUbE=;
        b=OAECh21mYxq3uwIH+3jZyRTEVwfK4ESWRhx0ig0T/XaNPkZqwq8payIoyzZyKxsZw3
         MXWwDMBCkPHqyu/xUgAB/49tq2x5iotCN+OqQburoL7NFC4tgodmcwH3AlL8xPTr4R5W
         eNBiYvqGpAjdOYLAblT6dM1oLoCakGaifUoGF/pZE9mBhuZaSFpLpBwFjdlOr1qCCn4m
         R3Vb0Z1Vybtyscu5TfNkUykcs62RhiAMQJVQKZu1ISDecJHGxDjRzmWSoRUlDIX20ujQ
         4J4JJHpOkSkd05aX3ntfbNbv7CYepDmfpEBaoSst10hFBXo1PCQ8a63j5a0Weac4aXH/
         Fmpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XZJ37AuG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p1sor5116789pfh.86.2021.12.12.12.55.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:55:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XZJ37AuG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X+UeYsBhFjCydbUuQ5rgpZcpkx46cZyRXNoHLfigUbE=;
        b=XZJ37AuGnlwbEPTEaSRhkSYBCuVWn/uAct2xDy7VaIgkxErFBVZjT2fzycxoRnIEYo
         YsBUfk9YjgBU0845XTk/y58j+SIF5R88ORTMZh1kYVSDV9gJQQkjK8+AFCiSkd3WvSTk
         CdNB43C3nz0ebMH5AD2kpPXAKS9WnfMcwdsKJHyYA5BXR2z2lNYivj866pGIMXMYWaon
         /dHLBa0X8FG/u3tcesevDXwdaG8Jne39tX6jWwsmt2Wap/5w/8uQ7MPOap1ecWMgymXq
         qUgcdS28ENgowinI+dkRvkIT191gRJHNSV25KbbgC+CyH4YBg+UUXwzRG3MgDjJhYHE6
         dgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X+UeYsBhFjCydbUuQ5rgpZcpkx46cZyRXNoHLfigUbE=;
        b=Pr53eziEh5MR4n9EU8gTl4SxVIaWKHO74T54mRwPM5YJtMJisZml0f3kk4L++MXQLe
         Ki1/2UrIPyjR/kQCHhGyB2f3ecjCoCQtILImaB91cOe+Hq+ucyKecBtQNPfDocNPVe/P
         vrLdlW3KF4gJrq1WefRsik+qLopJCDhzviLCXsswPvpDMUBd9AmtYwAOo1cZxN08mrb4
         CbG01Uh1X9ZTATGtmvWLgg0apZDJOdVhhDO4HzFgHx7BIOYB6n365qR25yKqKTTPdoRl
         FVDYsMlYrRjCcyRc1B/U6Esd3Y4u5a63qQgvo9/pMMxKPhXbgaVymvpqCiDIfw1t3P71
         QGpQ==
X-Gm-Message-State: AOAM5305V4HEXKPtDn4PjC1io3G5EqY0XXXn/f9cxBo3Hdvg4Z8OLFd5
	LOR8d7NY7hCJ6CLPswFmBXNbDdi3sKEzgFiy
X-Google-Smtp-Source: ABdhPJx7OeLUuCDdjXXADo5Az99yAKqaG55e45qhEop2vnYidQSZ/1/mZiP+M6tol2y3T69ZYZO8og==
X-Received: by 2002:a05:6a00:1305:b0:4a2:75cd:883b with SMTP id j5-20020a056a00130500b004a275cd883bmr30135877pfu.44.1639342501852;
        Sun, 12 Dec 2021 12:55:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id e29sm8082552pge.17.2021.12.12.12.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:55:01 -0800 (PST)
Subject: Re: [PATCH 19/26] hw/intc/arm_gicv3_its: Don't use data if reading
 command failed
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73cf1d60-4f99-8fc1-63ce-a055a6b4801f@linaro.org>
Date: Sun, 12 Dec 2021 12:54:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: plcTVl6tsZbc

On 12/11/21 11:11 AM, Peter Maydell wrote:
> In process_cmdq(), we read 64 bits of the command packet, which
> contain the command identifier, which we then switch() on to dispatch
> to an appropriate sub-function.  However, if address_space_ldq_le()
> reports a memory transaction failure, we still read the command
> identifier out of the data and switch() on it.  Restructure the code
> so that we stop immediately (stalling the command queue) in this
> case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
