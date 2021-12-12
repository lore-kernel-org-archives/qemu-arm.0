Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3544464lfk;
        Sun, 12 Dec 2021 14:36:33 -0800 (PST)
X-Received: by 2002:a63:374c:: with SMTP id g12mr50338205pgn.35.1639348593053;
        Sun, 12 Dec 2021 14:36:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639348593; cv=none;
        d=google.com; s=arc-20160816;
        b=hohaamq5gqaTE+bt00iDFDd+1q7Zcy97InDhQ77vlx59MphNxgrlUjXa03TpG5q2oN
         d1N9fyA7PLbXrRmcWKI+abugKHPsT1XuSuRTA0SThOuQ0NhBTw+8KmPPj+Hgx968noOe
         5XejsgoFadHfH/xKb2H35jhJg9JQb9Ji7hI0L3A1pt2SjpKidiUKzXGYGSu4+SUbW6zd
         /rnJU20z2482vA2SfMjCJgnpExFJTTsn2gFZQXC6QQJJ+wuM3pzgOBxIly4asUxZIeop
         iDNBgj/YNfisArRkPLdCiWXibb5GOIs5YlzGpgauaeE2lmoZvOe6VJeYspszQrX6Q2Eh
         hKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=eKNaoHD2AK7lxzEuUdpZCfhra2X6IX5F6/WuTD8cYlk=;
        b=JlXuyFZeAtPnnKZn/RCoMYJN4kw/Xsy4cqdOnFKpF9MfHOgu+Curt9Nf+grxNLyxGV
         krIr8imzUgDM/yDv3lcUKPfOwJjveDFRlMYIHV+hy24juTCSo4zZtRx3bqh34l77RfxF
         Xxiiw1QxCpY2c1tMKT0jciKFrgIipIol33orKiOlEjLVm0BntzzjAufc7u5rjsE+O1+p
         59ZhsQ/QztTKmEAx7sYX/1X/vzmMY90zhr75X9psJWsWPoQPS2aogodUzxmuyOpgqQla
         G9dtCdHQhYRT0kasrT/Sy75LUUzzbMYn+KWfVlEGDoCalzQfPaCPvjCW6ENuqsbUNvFJ
         aWRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQZFzLCZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n2sor5602897plk.19.2021.12.12.14.36.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 14:36:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQZFzLCZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eKNaoHD2AK7lxzEuUdpZCfhra2X6IX5F6/WuTD8cYlk=;
        b=rQZFzLCZFAVktAqT5PC+jZKWb1TOeMV/62KE8maHCDRbdGVh9Y1BHCdsGxQt92rHWZ
         sDxjc9ELwrHM9sQYWvmNhjbSZm/rjxrJ/u594gmGFNWdlX4Wcqgp5VYgxWGD/tYv0pnD
         oQwPPV9QJtGUklMZ5Y11chQXL+axc8XtjFTQZ1WWAsgt39Cg32wLSpqn5wpr5FMRkjqF
         oNaLxrjZWXywLQE2BN0TExtbOpam15x7WvZ5BW/Xntp3jSe+xxYyXOixvdCrWyBv+iKK
         lE3qZLleu2xkJCWaemI2yYHJtxEl4brKQ9SrYw7wMSC2PzD7fsyUKefZfWKpAQ8vQOFd
         sVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eKNaoHD2AK7lxzEuUdpZCfhra2X6IX5F6/WuTD8cYlk=;
        b=HtfDcR26r27xpj8KyEsu/CpkloarBssN7V+GHFeR2rVF56H9bQzFITyp+/kE5prMWN
         Q+s0t5LKLx550bKEWt71Ns4lT3rGm3Vn638O6iYNbQ/bjrMbsUMkNKce3wV92aVruAFH
         0Pp6DSet0IkpxNdkD4cfeXF5vFyMUN18kOdgGcmBTXDbGs4ovNd1bFdoycyA4Bnbiw7k
         p8GoJuJ6lGmQ6t8fF5ZmjzvK5GSQyJW0+U6Ddchm3PotGooA7C4Lz3N/a5xmgtoi20Ls
         EKmYJMPyn19xrrXX6bdcbju1F1BNZg9suQo8MRbe3goDjmCTJESqfhHycYieiHbIWF2r
         ZhgA==
X-Gm-Message-State: AOAM530SLPAHIycfTMPOtWjNyypx1NPSN1BvA95UHIWtte04p1Kbn2/k
	EQ6vOgmRZmefsAHRNHe6FwJjXoKYSKbTmCdr
X-Google-Smtp-Source: ABdhPJwa15xxLm29KD1m7hlHErNKa8W1rF5L6vJLiViZVKOwLTSxcVgkNCCucfIWXjQ5gLPtZuEqjQ==
X-Received: by 2002:a17:902:c7c4:b0:141:deb4:1b2f with SMTP id r4-20020a170902c7c400b00141deb41b2fmr91022726pla.44.1639348592549;
        Sun, 12 Dec 2021 14:36:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id t12sm4820300pjo.44.2021.12.12.14.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 14:36:32 -0800 (PST)
Subject: Re: [PATCH 23/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapti()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab056f00-ad46-652f-e82f-8be3fae72879@linaro.org>
Date: Sun, 12 Dec 2021 14:36:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: v0l9U6+tzwHt

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_mapti() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
