Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp424572ocs;
        Wed, 28 Sep 2022 09:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3d87:b0:205:feff:7d67 with SMTP id pq7-20020a17090b3d8700b00205feff7d67mr1124059pjb.63.1664383668163;
        Wed, 28 Sep 2022 09:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664383668; cv=none;
        d=google.com; s=arc-20160816;
        b=GY2oma2mzKwb677dBP5W6yrnHoFaJ++hNafGe90GJpBm1rleHSOj9JMZQtv/1XJmFO
         PmTZK0fE8Rbxkv3Ag+2H+Y05NBLyRrDcGcNQ94mRLJ5+hD5zYpgjMK8pEUs9Gbhi1hpK
         eCsnQp9cXRH1Tzss0acpMxIf0mzcCos4XjoINz/pfjB+wSKJ1JOKTG5kiOXnqqbDuqxJ
         stAei5rtDB+VmNQOm6VkSeDIuiamp2uP1fCLopKE/Io4FLI4cCeTgTptSntOiIzNrbZ7
         E6ZWmOSj2fZaSvYTh6rXVe2lHmj/4HOOHd2xi9hPFNl/kkKw1OmK10e1V/zQMMgvpbE6
         jK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zjTRZYpJJ9YN0VJ+QDGE4G5rvyfPXWAZmyhtRugYBAk=;
        b=OCJGS/GaKcuv2zGC8IJXuvn/hvrxqwWIAywUgO3Hmj5uhzQozFTH3F72OkJekYSSLG
         rIGLbyQeDcSFvpq6TqufGnvHsDvH7JGMbit1xvSj28ckdEqSuRQyuQr3hmw7QDBaRAHg
         e/tP4gbemhuB8FKHHUtDjfy+lbJ3dTkQXb9iMrTp12lJxXLjShbIMo0Yu/YkzpHj7ls+
         JPsJqXbkIsSzuMXPDo8ptEa5ssG8OAXd+GDSkEwAwj73rhuE5h4oWEhCLzJSBB1+0Vkj
         bn0iAs0XTJhS04wwzbuuioLwUBVEB+r+SEbvf1jAFlx4NQ7wGOmFiZ3IlnJImNgSz4Hu
         qbHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kze63Vc/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8-20020a630408000000b00439433aa9e1sor2501012pge.87.2022.09.28.09.47.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kze63Vc/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zjTRZYpJJ9YN0VJ+QDGE4G5rvyfPXWAZmyhtRugYBAk=;
        b=kze63Vc/k2GQDfUfVjGGterLi9lIFKl+d3n/m3UoRP8NAmBW4f1Fxu5HIvzB3Yk1zd
         jn6MSL+ul0twnxPQrG+nqEwWjnLfJ4Co5bCCLtm1l5fAJXDdyYOH74UQbIE1twfIQSIP
         drLjx+DekHfvo4O0WAgLUBcIQJmefPLxFwGprjo3wuyoBAyLJEU+sJLDnB2R1pUZLpxF
         1dpEtsQAptdN2f+CHGJrAKDHPe/KoODW4vL4X/4sc1lAdW7bUgOZPiw34GJxhlUS8L4e
         YdXA2s5zO8ESyKQTZEJBla4dBZIkuUqjEZvpLuuKXOka/4xu7Eu14C+tkxuZFqPdGdvj
         EDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zjTRZYpJJ9YN0VJ+QDGE4G5rvyfPXWAZmyhtRugYBAk=;
        b=0ClIlgfnSr7oeDzZQM0SejVG5Xb5bCc5Q2mJSd3I0TWcmDMIyaG1E20rFu5gvfCRPd
         YMaDuS0dy2lQGvRm36oxfgn0XiBxJNjzB/srM/tuUPuqQVpOcSiLTx6mPM7cxcMi5pZ7
         7Z38et6nd/qDr5loEJpTukaOar18QidtNYpWjMY2YsekEUF9gt+x7cDDOpRvb+xcn9SW
         DNK5sKOs0ZitBL5SVPY2bNQqs+x+z75cvzY5ZiUzi5qx/71QiHmrPGyySLg23B1eR5MR
         JMv2bJbS0tBgp7EQv1g407AQ27bIAfcwDQxq/y1KX2lE+Jqh70JK49IhgON1iDvwlPBi
         Fvxg==
X-Gm-Message-State: ACrzQf0rI9i0UAoCE3EFCn0HFqeNmXl1tP8ZFRj5MWuL8I1uqj+UeCOY
	IEctWewX65Jt2LQbX6cJTXBi4f5jRn3Wzswy
X-Google-Smtp-Source: AMsMyM6Um1qLC+Dw8VCI7VOvZepm3WonMB1woWmF4nP3Q8Fd7MF++LmqYRMYp80ZEQc69xk786dm0g==
X-Received: by 2002:a63:6ac8:0:b0:43a:18ce:f681 with SMTP id f191-20020a636ac8000000b0043a18cef681mr29451110pgc.244.1664383667767;
        Wed, 28 Sep 2022 09:47:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id g1-20020aa796a1000000b00537eb00850asm4264461pfk.130.2022.09.28.09.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:47:47 -0700 (PDT)
Message-ID: <d7ccea3e-04e9-a2a6-a91e-d9a3df5e08bf@linaro.org>
Date: Wed, 28 Sep 2022 09:47:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/15] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yDcbtOVh1HKA

On 9/27/22 07:14, Alex Bennée wrote:
> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
> 
> Acked-by: Alexander Graf<agraf@csgraf.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Mads Ynddal<mads@ynddal.dk>
> 
> ---
> v2
>    - update MEMTXATTRS macro
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
