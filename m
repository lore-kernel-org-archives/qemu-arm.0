Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3473506lfk;
        Sun, 12 Dec 2021 12:34:03 -0800 (PST)
X-Received: by 2002:a17:903:1208:b0:143:e4e9:4ce3 with SMTP id l8-20020a170903120800b00143e4e94ce3mr90244874plh.21.1639341242747;
        Sun, 12 Dec 2021 12:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639341242; cv=none;
        d=google.com; s=arc-20160816;
        b=ih57bcRDBwkq49opWFKbH1v2DDqSwgalWc/QFZLDH91ZnebRR8xGNE4xvsk39Uxt0X
         giF2go28JpewcXtOb+YVRSO32SARaUojRsBVYFlANZsbCWdcdSNT+84M48uncmRP+b60
         Oo/nft9awG9txpKZp7hnLwS01lf5CCkW13fb545bpXHyipkyY2JRAQImZ8i0GRy9TBTR
         3PMpf1pG6n9G81XN1wJhvyodocNuWNPjlt/CeKEQlOGO56UtkS/mWwJzpYVKkkaR64Yh
         qkpiUoBeLJtdwXiviY1VRvomJ3i42vPiDVyI1yKy23fPTJOjh5CKmTRTBuwmFyr2qV2m
         CDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=150NyKGhlMZ5ytZ9RYpVYcI6s8Key6ISMPYLcpW5mA4=;
        b=UssfNX4dQ343rCz/azwF058cU5Tx29gdPrdDv3c15eVqDbpICf46Qtn7NvsCVe2vU6
         wy/KI6WMaxxtzbYZRPD7iHkrZpjDGUMKBMeR2HjF7rWAAlzhfNBvY559b5bKvfM2ba9g
         3elcVhuZNxIXXr5DUhwL5JcQovARZxwdPhP+KkDo07vHRZrh68tv4xBiX4Oy/WPNe9aK
         UZI9REbU1ZQlwQHjXbh2ryopvMKtWygpN0ML4zNVHvkGZZmwJ+Hw37OBUuZb2lV7YwSf
         nADx7W34jejfi5o0mFC+h3bJhxtZDqMxdkS6GYSL7goYHAhwyA24ZPCJ6e0Sucqy/RRB
         Br/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GEaEL0y/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u3sor4202503pgp.51.2021.12.12.12.34.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:34:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GEaEL0y/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=150NyKGhlMZ5ytZ9RYpVYcI6s8Key6ISMPYLcpW5mA4=;
        b=GEaEL0y/F12UiM4iou5vWyPVIUbNLxWS3LFicdvR9nMtHE8HniXevVTIYv6tvEFDuJ
         KL4/k18T4pyXyI13Uhe/x87MJ0agoEwUHNWVToD0+AVZ1k7+vc/Xibz94FmzXSDuoGKE
         YFYp5tD8xpGG8M2dlDbYECiWcJbbQ9BhYP2x3cSfCrip0vpdEye+k8AnDJOU5qfob9dN
         BjYBT/D+pui2yMuHiwHlSmWV5IEEvTfebq1V1WO2mN8iA2xn4T2w2ss2DOPW7FJ9Ld9d
         40CLzLtYc4wjYvxp3wkYo3FwCM+WFgu+nUpIqwGvCdZGiRKVxfSA8Lh+6RHg3O3meuw4
         a87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=150NyKGhlMZ5ytZ9RYpVYcI6s8Key6ISMPYLcpW5mA4=;
        b=a0W25t4NJCfGPyhvTVqujLJ9LqtsWyruIFVLp95fm4+aKRhEASITxjZayrAyBLJq9d
         lR8THPIfRL/kES9nqds3GOj8HXtPjG7UBmpwhE1eUbnDXd87Pxq3L0Y76mBd+nVppXuP
         GuByx2BIavHl0Hiu51Csk5uiY/cxY79bghovBG1Lbrtrty4VsESw+dSXcp5vXLrtnKEV
         +fBBUHmGt6qyOnXIdNkak02vQ0ip/lp32cvzVQE8NkNsNgmtLzA2HWnWXx7oZJjRcVh2
         9zXpdg0uDTnyx8YCWA8gGrBJiOUuEz5SRwkYvTxke/1jAcdDfeI3Fe3v29GosezhMFDL
         7MTg==
X-Gm-Message-State: AOAM530TbagthjwvLI4bA8bOgeK0ocjK5080SluxR4n5OV4DM1l/tqI5
	igaZokyit1/kZpR+WDOcV3zTMsuBPUM7XQsA
X-Google-Smtp-Source: ABdhPJwdPQXupZJvGIdzGNqLUHsJZtrxv66bHumWm+8uVK4aRg1dJJSDOxsJHpmchTWmDb/rLw2Ftg==
X-Received: by 2002:a63:8a4b:: with SMTP id y72mr6095623pgd.1.1639341242206;
        Sun, 12 Dec 2021 12:34:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id i185sm9690536pfg.80.2021.12.12.12.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:34:01 -0800 (PST)
Subject: Re: [PATCH 12/26] hw/intc/arm_gicv3_its: Correct comment about CTE
 RDBase field size
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c187c5d9-7565-62a0-3599-c84575126df6@linaro.org>
Date: Sun, 12 Dec 2021 12:34:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 0vcCxNVJfw4t

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The comment says that in our CTE format the RDBase field is 36 bits;
> in fact for us it is only 16 bits, because we use the RDBase format
> where it specifies a 16-bit CPU number. The code already uses
> RDBASE_PROCNUM_LENGTH (16) as the field width, so fix the comment
> to match it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
