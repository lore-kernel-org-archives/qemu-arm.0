Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3553908lfk;
        Sun, 12 Dec 2021 14:52:04 -0800 (PST)
X-Received: by 2002:a17:902:7595:b0:144:ce0e:d42 with SMTP id j21-20020a170902759500b00144ce0e0d42mr92224021pll.39.1639349523892;
        Sun, 12 Dec 2021 14:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639349523; cv=none;
        d=google.com; s=arc-20160816;
        b=tXe/sbUlhr4tjLB2kPQ4MpR/C4tfC/R72RjJJxH1KUs/T0v1XZThIgoCII0Mpf/99g
         4F3kLngG34BKIbix4iKMCFtS0zmZkjY9zHWdDJ3zks8E7oBNuVcODKIZfL5fkUGnVqSG
         RwVUA2Rb5WtgaXiOeuPGajeH9WuBtBPH3OTMQnjPW2YKewp0jpsG2mpI/vpiikvtIrG9
         wLdy0FPuA59y2WTj56VKCO9/eW9wVJ24p9qm8ylJrdreNAslvMIT2P9WSdF2/Mq+hgqG
         nSiV1WB1nNzOJHhEnIJcrSJrQUEKF3a6yqQerPTdpvkYcGCep52M5/4q+xa/sLyk2dvJ
         BvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=eaecWj3ClF70OpjfgoNu9V4FG7Yk8ViKZhU2WNXXo7s=;
        b=bBgJ6Av0YSrm7ybFPotnRuCDueyFO5VytifjHvYr9vDKwsLcRTQMGwtyZXadqDIfAJ
         DkeXJaToGyDiB4JFiShW3WLjp1QXsawc8+c86os7EU/WsesHOJafLnmCJbjP99P+SBU1
         cARibNvVKAv8d2sPSHJDkNLgiyMNY52pS9yzqdDiyo/GWpnKIPm6ujyoNqQCsFieQHjt
         6CVKYbdXDS2ohgECc+rIq4O1m4WTjD2yKYcduHP0YGDzXTQ/EfFig2qszW64bMEC46i8
         iq9IRRxTLQisW8VKwLTWlbz+YgKygfjboA6Cp0xFKyyGKzF3vwG3hcHEth+dvkSnYH0P
         r/KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+8Qw4r2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u7sor2120314pjc.42.2021.12.12.14.52.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 14:52:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+8Qw4r2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eaecWj3ClF70OpjfgoNu9V4FG7Yk8ViKZhU2WNXXo7s=;
        b=S+8Qw4r2iso9UTQ+TWhosE79sLU1XB+osJOQHyvdEygMz9nwELnA+TG0TEHwPwnGWL
         B+mm+pDYVUl/qO1wZoKGu9QPL7Z2qTBesNNm8TpJwCOZsVFTpdcsupAUuyC2WhY/NI5q
         rgXgOosudpLJAVOpTdOFumldZsKDUBfYBvZp0pdYRDhx3EKSJjNSD5R8rWQmB+/1GQ2h
         8l9qOmTTrWLIphd5cBxF0YdRKVbaAsjA0LM9uYHCUVbiZnxAvG6+EuboYcFTcmIRsxwh
         L3xlBxf4M+oCLV9p1g5ma508ZfPE+LVLRtR2VTQHwXPsUFATWkm82nk7Sd+L5HGtFJVr
         iHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eaecWj3ClF70OpjfgoNu9V4FG7Yk8ViKZhU2WNXXo7s=;
        b=lwXJ6xnWfjtgHrh4cBanRe2XcY/0o6K6nSCMX2xdewPm/j7eWdNnOHEXMecdk0spWQ
         yjE7TRpIFgJMxlP3uIWHzWiDjO6S1yda0GT7PMsVTLoStgJhgaKbHYmo7urcquBIk873
         j0aRIwWBDkeDNN8mHAO6IBz9ZBYIdSi2cUdS5A1NMsD9wOjF3UEI6/+yyQ5sBjU6kP8m
         k1Arezy/XvRiSWICCfEaJf2SPZdAyffGnxCCGYwp+rTQ2lDIhq78W+q0uLwHcZ3b+rJf
         /SIMuhGwhGTaj5JHdIzMlyV/Lj4g4k5SO0yec6GIcwZvw456HsI1p4Ih1B5PZUE7nqTr
         c0wg==
X-Gm-Message-State: AOAM532KP0q2l+oJnDKw0KcFNp+hwibghTcmFeLwGq1zTse0EcEaWQrq
	WWKqpGvT+x2BAagFF6waUjH9eQ3C6YrOJ567
X-Google-Smtp-Source: ABdhPJytKZLy+OxrpaR/vSPaYZxatrzuuD62oxGMb6Uwmp/xj5mnaBE/8aXhjnHNHEVraUWzFewBZQ==
X-Received: by 2002:a17:90a:ac08:: with SMTP id o8mr40486927pjq.87.1639349523431;
        Sun, 12 Dec 2021 14:52:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id n16sm4976301pja.46.2021.12.12.14.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 14:52:03 -0800 (PST)
Subject: Re: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address of
 table entry" code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8406add7-f2b4-67cd-fd09-e0654ef16570@linaro.org>
Date: Sun, 12 Dec 2021 14:52:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: IXCqEeVssnN8

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The ITS has several tables which all share a similar format,
> described by the TableDesc struct: the guest may configure them
> to be a single-level table or a two-level table. Currently we
> open-code the process of finding the table entry in all the
> functions which read or write the device table or the collection
> table. Factor out the "get the address of the table entry"
> logic into a new function, so that the code which needs to
> read or write a table entry only needs to call table_entry_addr()
> and then perform a suitable load or store to that address.
> 
> Note that the error handling is slightly complicated because
> we want to handle two cases differently:
>   * failure to read the L1 table entry should end up causing
>     a command stall, like other kinds of DMA error
>   * an L1 table entry that says there is no L2 table for this
>     index (ie whose valid bit is 0) must result in us treating
>     the table entry as not-valid on read, and discarding
>     writes (this is mandated by the spec)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a worthwhile refactoring on its own, but still more
> so given that GICv4 adds another table in this format.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
