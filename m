Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1172697njm;
        Wed, 30 Apr 2025 12:06:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMYEOxWts2jkN64nDxbtUSEUkWRVwJ5gKGVNkIPK6U9C67sNt73FmxTYbxSEtgRy28KF/gWOQrZ/pO1w==@linaro.org
X-Received: by 2002:a17:90b:6d0:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-30a3336807bmr5363964a91.32.1746040016834;
        Wed, 30 Apr 2025 12:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746040016; cv=none;
        d=google.com; s=arc-20240605;
        b=JsYlekbOVmm2mSeTBZvxCTiZ/8BBZTN4MaEuRuRowwywMFkf1i8RmTxOc39abTgLkr
         t7L2PcQ5mvV7utSbYAwZedPqSf6EyMFBDlbZQ8So+mEDGvjPpXKo7YOE3I9/QOnm7pxc
         8HWd19xYlug4ivO0wcHr5U9RRN2xWPoQoiiE/ZJ2nJtOZ9TPA9TWyP9prGP5e2GIZBZd
         P07A6niqSf/KbL4DhMf8V8VVKbGxjPbQ95qMLlWVwUnPYEW9a9OAS0bLS9CBUXTPCyBm
         ZPUsVDTkMhWk1dzrw+vn3al7qoW6tG/2AYTLwef7BM5t1DPdl74MghKyYxg2Re5Bebt4
         ldQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oHH/CJ/HNr3q5RCvWrg5ycf+bD+rJTBVJLQQPcyxTPE=;
        fh=TCaLhq6Xl9WrG3T1FGng23VZT0+ajX+iGe16rxRIY3g=;
        b=HvTL6bxNgCe+gbdO9B5nE/V7xZf3lwBWtZouWBEiVWSoy2Cz/6Bkdd59SxsoWO6i13
         rwh/h9c5P/WoDYNXLFi1VliA5zgHJASBQf/+l/zFVCZ/sLfCyjpphT/d5yCIVxAWu8jX
         cCjk+khjnw/eCBx+AQFIVSDyAXqFnRNt+g59qcd6AtgB69X/4hQPSZylQkO+qnTEPmAs
         vQ6c9I9thPPojZ/PVvBRZ4OqIM166VgqqlF3Tta6AYtpEAL0bCwiYVFm3lyLQiFEdbhW
         Qtg834ZzhBvucLVUYafDPlNMn9IdBkNL2Ei8qp7ZG9SSCFW+Q84M/dWWLrHXrlaUQYwl
         P0eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Beag5Q7N;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee877cd5sor9519269a91.8.2025.04.30.12.06.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 12:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Beag5Q7N;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746040016; x=1746644816; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHH/CJ/HNr3q5RCvWrg5ycf+bD+rJTBVJLQQPcyxTPE=;
        b=Beag5Q7NxZ/PIv4n7OLb284XsPuqDIbIY5LocyQ4Vky/TKXQ1Dm4McUZ/yU/AzFtOC
         07hDik7jD86d2bwahP+ndh2aNqGGh+xW/l7f1LArfLDjYwgmEfUAR1aJ5YL+5K7ZJ/+1
         hQz3pdBUIEPmEgt0fRccQsR++FyaGb9tapzmGOWfRJywMDCuQGfcvXxAnN1lAWoBwJZZ
         0qqNwnlnAiyjiai2mRjHJkp6h5n+MGntQiMO4FDOfMycRgcZwgTbgYRpjj5vmU4v+NlO
         DlFBQt9dzk2lSYe9qHjXYbHX5Arwh9f+N7nhyY0sKWhXhpSpgwd6e6sF1niKn2o812DL
         WK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746040016; x=1746644816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHH/CJ/HNr3q5RCvWrg5ycf+bD+rJTBVJLQQPcyxTPE=;
        b=TP22kYjOF7NwWNsGBNxeK1/c3ETkoGNRJuiOGAyQzpfYQJsrltT4qOIYMcPvkQpTQZ
         RY/Xn0fzxKRbadtJWLOtSNb3YzhNS4Vfzin32bdw2j5NKsffFla6PWD24jkK0eMDGuES
         uPUwHszEMCoJCcvpJ0Ymfn3l5+qNGegjU1PuXtNLDkql/V8QgdNWrkPdacUJ6jKbYmPH
         tb+WaMUkVsaloay3LYogG3LvPXP5PPxJiXVkrZ9U9jwGZUtQ4PNgPe8ruFR/cOW540Tx
         pJTxViFNKOcuKT/7siBIM2ddgyKurFSVTENcX7SZdlg0myb+FJYgCdibkpe90pLwYdU8
         W9zA==
X-Forwarded-Encrypted: i=1; AJvYcCVI+r41AlYQiHFjI86NO1BPj8AhLxS2WYkKYeyq4v8CzHSdVX0KEwJMxlIwb1KLBJDUWWayXN6pTbMMAQ==@linaro.org
X-Gm-Message-State: AOJu0YyjbwoYgfWSU3MXiUZ9muDfmlEJCoYbriDNwUVBXqfmDSO3X9oh
	UlpqQQolB41N5A70opUp7GJyI8Pf+21zgpShIUm5IplOZzLsiZfb416cN/bvkhjePqJArESK6xW
	nLZI=
X-Gm-Gg: ASbGncvzQ9bhFqtjCOCDmnxB9B1LSv0TE4jGpTr93PjBZZyPa8Sf3n5jYnPRfEMMM9m
	gkI61BOYcBG7nNp4DZ0EFqO7yDZpALL1X/klgd5ZLWVftbeWhDgoy40HKtllN6SDyuNdTIoP3FU
	oyqN+GL6Nix1y8I7PNqQasqI73+g/Q4DQKdya1eDMtrxA+okGpG4ATsm2tc8hVCulj2W+VOV79G
	WRUyIxBfrrBuWLuBnHNHRh1PH+lj59GKfw3wPZtjeAT0dPxFI+X3fGx6qVDV/uSz5iKChA54cmW
	ggozclGlA8Xt+DhJC23KxbUYEg6DwIoKMUbBWHIRZAQveVHK1dLcfA==
X-Google-Smtp-Source: AGHT+IEmtsMxKzfl913AuCQz4vQAnUz/8tQEJ0yj76c7JEnnFdJLPruhJNFw8n2y3PV37pbT1B8rvw==
X-Received: by 2002:a17:90b:5347:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-30a332f2c24mr7242936a91.14.1746040016332;
        Wed, 30 Apr 2025 12:06:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a3bcf1sm2018153a91.37.2025.04.30.12.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 12:06:55 -0700 (PDT)
Message-ID: <1e223128-a2cc-4070-a7a9-9a34e5abded8@linaro.org>
Date: Wed, 30 Apr 2025 12:06:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] accel/hvf: add hvf_enabled() for common code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-8-pierrick.bouvier@linaro.org>
 <db654764-8377-4080-8f68-7fc61e8eaaae@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <db654764-8377-4080-8f68-7fc61e8eaaae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +/NGJt9Q1Thp

On 4/30/25 11:43 AM, Richard Henderson wrote:
> On 4/30/25 07:58, Pierrick Bouvier wrote:
>> +++ b/accel/hvf/hvf-stub.c
>> @@ -0,0 +1,3 @@
>> +#include "qemu/osdep.h"
>> +
>> +bool hvf_allowed;
> 
> Even small files require license lines.  Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

I'll add it, thanks.

> r~
