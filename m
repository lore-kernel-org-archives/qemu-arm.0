Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp908887njb;
        Fri, 31 Jan 2025 23:32:54 -0800 (PST)
X-Received: by 2002:a05:6000:1012:b0:38b:ec34:2d62 with SMTP id ffacd0b85a97d-38c519698d2mr11290887f8f.24.1738395174635;
        Fri, 31 Jan 2025 23:32:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738395174; cv=none;
        d=google.com; s=arc-20240605;
        b=YY+RVnS78VRMzM9nHExamnMAumw3dOP/E4CiYgfTptrjFm2nAP3qr0oL5vbZFcDygc
         SHvvsWwMCNFNl5G559wqVoe8WfnlZudDOgytjSov27qn3PCTMLt8b9npL2e9dO3NsIVQ
         ZzLkLheIWMV3QWzrvQ3EmUc7FYyZaptZed+MO/zjSSs1aeyNT5behwyUCu1uqNB+cBF1
         MskyWeN7I0/Nv0KP90cKra+v7oay5pNLL6+zAlFRBouKUw6vtA+gV9D4Z87CDX7Xunur
         KDgTDYqdOUMxpm7f1eRsLs2bCiUHunR27xwcW2CGzzglNKfzlrfTBrfTkkwLhgkmWg7K
         xMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eAv2b0Ml9xVUwhy51rqf3bFg1hU8g4MiaooScBWE6KM=;
        fh=NlbtwF/BrJE1471IcGe+Edy7aeNNU+lgvbgPDcZcnYA=;
        b=jj55Tb21lOISQJR4ug7VFrTOP3ietzlPbwQMEgjzFI0wRnv/sSs/4KHjCzavzdK4YJ
         WEYhvhJEKcxrYEe+7dwTKcAZvJy8cafzD6bboarmUAuLmknCy8jJmEM7yJ/KMORtauQJ
         9gLLD0FYPreZN0RzCkC+Wsw/NITS0/qBXWfGltqHou7ZiLqnCyFyHnXfpWOQ5QK+huD+
         foWlndg2X5qetZMBxBRA2OdvzHk8lyYYYuUDpveKd82ugat+XoGa61Q6+b/5srufoOiD
         5rFxNsK+hmfb3Um1XqHwJxCii0IGO/cnv4GZNvKJCi74uv1LrTXNE0Bu4fbKENViEh3w
         lBOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kswKdZ2C;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e245ce00sor27362465e9.9.2025.01.31.23.32.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 Jan 2025 23:32:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kswKdZ2C;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738395174; x=1738999974; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAv2b0Ml9xVUwhy51rqf3bFg1hU8g4MiaooScBWE6KM=;
        b=kswKdZ2CZiww9/rZAhUt4OwBY0f/KLBN0EYzyYl7RZDgPQz3T9YsRKDOjoBqIJJ+8c
         ibxnUYu7SEg4PVO89hMYogaVmi0GrSUH/Dh70ZImrpYUr7lh0soECjcN+JMi46EpO1Gu
         bTN13xpWtzEUPFWghhuDXtZvwuzztBBJNN2KFIB0MKKGiEfgFMWiCn/pDrUHyDDGSE1L
         ZaMpMmYeYoBQa21kmFKj6JVsaHa0A6ltZXuR52Dza7Or9iIhGHqOSgmSRssHhmIdlKzn
         ugipK5nmqcVucK1dCy9rwZCKIj6m1hHEumYx16PJM27E06gIcuHuFquNxz2Bvkn7LU6H
         YZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738395174; x=1738999974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAv2b0Ml9xVUwhy51rqf3bFg1hU8g4MiaooScBWE6KM=;
        b=uEXqWVXuPm/H6xhAaG4deGrOcanFrRvNAEek28YGORo8JgT9I1sTQtzbx6F36KDguW
         BVc9jyXxS25XCvUM8blQmA0pjqLmoxrM0njRKzInqAiNSmb+T0lgCJiYgy5SgVB5Hojr
         8XH4nnwJMtX7Y7DdJD6uBuBln+dmsv5hySN7lY7eqb0bnQQQs82p8E5nONnI8UsghvQi
         LGYjLq1/irASkCfTxcOD3H7Qro2ZOKWWJMWaHpRUN/Ev/FWTFRJgUjuxrKezejCiiAXL
         Sncput/ZAbtW2yIMgKvUtPhMvQH+hH12/Z8c3KJDtS3ipBMYWU8ztnwDklYqg4nuQKcc
         w1lA==
X-Gm-Message-State: AOJu0Yxrfof00764oDHeBapxeJO/zoosjCpoA2FLpY/YTcRZ+0xNhfnn
	XoEBlMdAelxqG8cMsRaLL1oJvNGcFl9FsuH4OPH85uuL3Kcpi3uCbvKm2TJxgc+6FER5PXLgQgm
	3MD+L6w==
X-Gm-Gg: ASbGnctOT6zTo+y8kYaScGNsQAAltSiTTnu34oH0Tr4FX3v7Cc9TrdT7/kqaTY8g4ec
	XXnLPOLvdrU30Z04XKwsw37CENZTNbiY+6beBk+iDPev2KSBhainVyvtg41d+slkGOK1HQirEzL
	bLO5YzeGQr9CYOqjfCVmsrRx9+zQyQanspV+CB5McXv8Xtrv/fep1g+qvjCNvMlpj8zcDvb0/+Z
	SDdK2cWeoYj+EMOtOKmx32WBn+DCBetOrgSwiWVUfyEa3Ya/U0Fx52WyasQUy+MQzeogzemyQ/i
	fM9XLvSqeQ2lf02O65kdCbGw2ywC
X-Google-Smtp-Source: AGHT+IG+GT+3AH8S+vWN/U48AHjJgorm+2y8xgxW5i+RWXc0ScFg00isLDmQAK4VwDpZQhWvRVCMiQ==
X-Received: by 2002:a05:600c:5486:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-438dc40d3fdmr133383545e9.21.1738395174030;
        Fri, 31 Jan 2025 23:32:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [10.1.1.154] ([45.93.146.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec7f1sm6499911f8f.9.2025.01.31.23.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 23:32:53 -0800 (PST)
Message-ID: <828d1c4e-2271-4c3b-823e-df73053a91b3@linaro.org>
Date: Sat, 1 Feb 2025 08:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] target/arm: Rename CP_ACCESS_TRAP_UNCATEGORIZED to
 CP_ACCESS_UNDEFINED
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
 <20250130182309.717346-14-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250130182309.717346-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TtZ2bItxSfzP

On 30/1/25 19:23, Peter Maydell wrote:
> CP_ACCESS_TRAP_UNCATEGORIZED is technically an accurate description
> of what this return value from a cpreg accessfn does, but it's liable
> to confusion because it doesn't match how the Arm ARM pseudocode
> indicates this case. What it does is an EXCP_UDEF with a zero
> ("uncategorized") syndrome value, which is what an UNDEFINED instruction
> does. The pseudocode uses "UNDEFINED" to show this; rename our
> constant to CP_ACCESS_UNDEFINED to make the parallel clearer.
> 
> Commit created with
> sed -i -e 's/CP_ACCESS_TRAP_UNCATEGORIZED/CP_ACCESS_UNDEFINED/' $(git grep -l CP_ACCESS_TRAP_UNCATEGORIZED)
> 
> plus manual editing of the comment.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        |  5 +++--
>   target/arm/helper.c        | 30 +++++++++++++++---------------
>   target/arm/tcg/op_helper.c |  6 +++---
>   3 files changed, 21 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
