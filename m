Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp453666njc;
        Fri, 11 Apr 2025 06:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXljHXOx7Vdmt/9GZ2J2mJnLzURns8tL+bKyoin9jwqe5pbc/PIncnhPbVEN3qZopWbCmr4ZBdLmTG2BQ==@linaro.org
X-Received: by 2002:a05:600c:1e14:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43f3a93d391mr26276595e9.11.1744379142458;
        Fri, 11 Apr 2025 06:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744379142; cv=none;
        d=google.com; s=arc-20240605;
        b=loN2WRdKZkoPjvwzU13kpTmiwsVPapk6Bjf2jeZOwbzDaHKl+hQuF7cUVoxZcSqZfU
         ze5H2AXm8mRF7t361lNtyDTSLjhiWC4nyUAP8w7ii9LJ4M8LqvuOh7U84hWHC74oYM+m
         W7TBblz8ToQpBTKKt0K0w5gaNJkhA56tDAfIgNOgjjO/ocX6a0jwt8v37aaiyJIMo5w1
         j4xDojI3el+LU73qQlNcf9IfLfVIMsR9TZi4O49WbAVX4J4NF6SeQnhvHLxpWtnTGpsc
         n0XP1wNQ7XtxU5TRtZoVpCDQZmGwI0Em0kSlf0mwQL8XGDqH6k9YyTZM3CZnn+9fYEsU
         p5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iFE6na5+1WuN0sT4F1WllP0/etgKAUZ6MGWqK/HtPuA=;
        fh=uG7k1Y16UyJOhsveQDVUwcKfW4QM2hR9zrJPstrCVY0=;
        b=BvzFWXqORnf31qt29MhLZhrcIttg5CpC2CQb6X8MufAS9h0HelJG7ihYswqf7rMfVt
         c2VSJNUsWbxxpKm4GsliODuRUVK1+yq8325V4XnX9Bq/O408KCyI3Eycx1m1FyjMFtZ4
         kkGg+HaftSeCQ08ZdoVgYAS0ifp8fHunvfsTBn0X0r1H5XMlv20ID1ab4Ry5GSpfw7EX
         2acXxFs3LRWP13wk1hlaImBicSi4JzSq+NMxsLphaNnww6XxCRDkXCC0rYMSXZkBMbh5
         6u7gSCoBpvx2aZpLLQ2ajrsVHBrHbNeAvA5X+5HmTOzBWiCPEPkGtKbo0mjG41F4kzIp
         utVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KF3LkPc3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f23380fcbsor32222135e9.2.2025.04.11.06.45.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Apr 2025 06:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KF3LkPc3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744379142; x=1744983942; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFE6na5+1WuN0sT4F1WllP0/etgKAUZ6MGWqK/HtPuA=;
        b=KF3LkPc3UutzxfTrpoFvoztzlVMrvCSr2IcpRiZEHrf3OHv94BFTmvPqtm/XoLqjFd
         aNV0gevpjUQAtS7jUCHkPVU+RReyF/P35okXjAa2ZwDSKn4bV8yLFHgz32iwdpZEBKyw
         NSzbD1xi8G4NIgdAtCN6K2EcxpjZnWW5kKiZKGvXGDfmPV8QfgCLk8UCHkj3Wli10bMt
         YQMLX2PvprfODYJe5dch6sOeMAst6NXD62gi0hbFdmJ7ifAuZZUBmzbXeKVcMD5p2Jvj
         jYoAot4RdF7djiyhCcX/dNFich82eT+KzL460nWXj/hufIhiZ3RKdQldqgwL/VPGKYqU
         XsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744379142; x=1744983942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFE6na5+1WuN0sT4F1WllP0/etgKAUZ6MGWqK/HtPuA=;
        b=Q6/u61IokMjFVX318kgigALidMKWfoOgwc49hmkL4mv1pz4ardjfTkFi7VvROKzUdO
         ZcyvH7IwTFdwDx7FmDVL2fel752s/OtXE79vAYCzxjZYFAi1vGNpXhNSJBfHZhrGKGMd
         JHbN3yNfOWof415sKtvSQ+b5E69EgO/hGBr/Q9ewMpiKujgLCL9EgPW1uK7B4s9SHMPs
         Enqvr/g8sD2kZRRUe2kiPkvfozJlEhzLvT7PbilfyKEA/AshL7R/vo30BZyPyuwXpsW9
         wNw9mn67wf8o5svJ+DKmr9heW3eke0DE9Bv+IVqI3h1gjJ8SG3o63Jdm+/SrXMO2i95K
         3EpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIsIOreARkIrZGmYuDYkbd+9d/7EMa3TLjfMAkfOP0NEtDRb9Q83WyNUPB9A/VPe+TtA4m7ZyPnz1Lww==@linaro.org
X-Gm-Message-State: AOJu0Yw+9CPDas95nsUOS1MK02DRRVSYRfojTffA8cO0aSPH47PVsqtU
	FRd9BjBKTj04WnVzs/vPhcKFymwqnHtWyF6n3gmsQC9eJ+1WXBXJIF1McLMT1Vbsng==
X-Gm-Gg: ASbGncttnJcuOI1uKEydKDipxzaAvPjxfB+E1lT/Q/1ODqOhDf8sE/h5UV/dPKX6tz2
	0l/ltdsaXoiOtKuVG52pwWJvxWfhng1HCfBV/cOopYKNYNEkxJlDdb9uvMsokenabzFNbkHy5Mf
	HW/N+0cxAEvKCIauU9V3NwUVxEvGA+bwHcv8l0e3kpQjc84BzK+Czu1ua3wJUvX04pdImCwgddz
	trReU+jxY37HQaHduHznHrGY3eRC7kGZTKfRSKJJukMxxjPYCAnMIAvRWE0QJ23IJzmd9oA+2DC
	h9bcso1QuzTMrS6MEvov/+ClSqoyjED+H1pXHbwK6y2BgtmTHhXt6u1UoObElr9HEhXRf8tUF3K
	qrWzKRq97y5eqUQ==
X-Google-Smtp-Source: AGHT+IEJV17QnlYb07AiVSR7htKmERFpL27QZ5VyO22hZJpP3t7zPW5QsahOya7LY+qLX8hVL8HGAw==
X-Received: by 2002:a05:600c:5008:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-43f3a9aa623mr23921805e9.23.1744379141939;
        Fri, 11 Apr 2025 06:45:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a273fsm83125745e9.9.2025.04.11.06.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:45:41 -0700 (PDT)
Message-ID: <fcc6f187-5030-4fa6-8c2a-12382b91276e@linaro.org>
Date: Fri, 11 Apr 2025 15:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] target/arm/ptw: extract arm_cpu_get_phys_page
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 qemu-arm@nongnu.org, Yannis Bolliger <yannis.bolliger@protonmail.com>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
 <20250410210022.809905-4-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250410210022.809905-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EGc2rwqQNKqn

On 10/4/25 23:00, Pierrick Bouvier wrote:
> Allow to call that function easily several times in next commit.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/ptw.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
