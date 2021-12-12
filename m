Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3360113lfk;
        Sun, 12 Dec 2021 09:31:40 -0800 (PST)
X-Received: by 2002:a17:90b:4f4c:: with SMTP id pj12mr38297846pjb.217.1639330300448;
        Sun, 12 Dec 2021 09:31:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639330300; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3Al1h8TADuCANYHDaO4le4k1cZ025ElfsF9b2Ld/Hpt3d2OZTkVjMaByexvy2fnQ0
         8ul9skhU6nYWf31WeywGwXXOuK8DMrA/chtH1+Eu3vLvXyqOUzgfEe8cfRffstZdi8jx
         8ooEETC3l0J/W0gQ+oAg5CzwKQIcoBN7dXsm5CH9bdjf/yqefMIX7g7Tj/J9PrU/FxQ4
         JbQbz77BGilHkWmtzhYse2TODsPtVeHMF1ChIL1IPKMsRV+DhoQT5CvI+5BLrJIr9vKk
         qQAOPi4AhdmTsz6+gv89I49D6CIZ0HluHe25OpzUKeGXtzkE7VVDWb85dtMKbtAWmEH+
         uzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Hv5YrBursWBGRKklo2pQgpOF49HdwnDxYVuUOO9BGxQ=;
        b=KE8uUxX0tE9/7Dy8yVbWUVDWgstTPnsLvji2dqBLaC8OpKiRu7EBIPqbBXlNg7GYqy
         eRmfO5n9K+Ov8JIgjQb++m1uhMWU5Vvcas1uw/tfbmRkF0l7MxmmsqtgMbSTcMZdhLwx
         bD7tswbAvXNSa2ShGFljbuF4k6Q7PZOFw0RUGV1/QI5JMgeapDDjbq1zwNO/jKbWGNmF
         oaHmhRt+P5JSDrH6G9Fmnqygkcs/CTf5mxi+F8k1rQtXyDz8Qk2VKXY04itEt6EIlrtf
         xpaCUd7e00fLLC+zvzIJHECJiadDLIGWU0/63rgDGN3m6ZyWh/JuOM2sQm1KcBWwbmBW
         bziA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x4nr3u2/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id nv10sor1988090pjb.19.2021.12.12.09.31.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 09:31:40 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x4nr3u2/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hv5YrBursWBGRKklo2pQgpOF49HdwnDxYVuUOO9BGxQ=;
        b=x4nr3u2/FGoEdlExKbZxUiKEOQkmkySZL4xvsbNkhaeqGxgMhQZB2hcMsOTjj34jWV
         eq0r9w63HV3aoVZEjz4rMyNZ9wosJ0PHQghsA/ZVi31evUyK7bL8isNDlP5keq97wqsY
         xLjlDRTGI4SNno/cEKtqOTLUWqmgPHyMNaTxATHHHUPLB6wIeXs0omzhJSKjuEYUU9Ox
         WXAkf2uZG1V/i5x7rMF/nqZAmt/i7ciRr0bUKQMzWUr7n6D3B0i+PTduahF1Su8EGhM5
         Bu6ku31iyHXVYeW8vQLPIOkKRLhrzHQg0aR0q8FcrIFANiyCADfv1q4RdoGg+0sjgXHf
         3TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hv5YrBursWBGRKklo2pQgpOF49HdwnDxYVuUOO9BGxQ=;
        b=5bF6k34GUga83N1LimwOpGvb1a1/tm6zwNh3EAiK9CUkPsZsQS0cHHQb2A5ktvGUZi
         XqP3J0Nf8YbI08yb9vmScGbna3Rv2SgSAiGtlWYfZUDEIHso5U93YVzXyRePsj+G/LIx
         aPGMDiHXDYblc3gmdi3+q1pNv/CRrxI6pDEjfRIfj2Mqdn74Tpms/iU9b9chE9mgBm5g
         3EmoI/Ofi9zXaVNw2xT7xvOuNjyiPbiH4CrutNkC3ECtM9EF1J2v7hrir2scIZrDWyft
         YGv46uECILjy842ZgN9NZ+4jnFguICbohWshDS5b6D+kTXZUDvSCTEHncWGnqPfOZpWb
         Y3BQ==
X-Gm-Message-State: AOAM531lsYBoCE8jE8IBv9oOfcbVixuUU0mAiwlDQK3Vcyr2E9OqutxX
	6dUX2QMH2oFXmBRNqM8kvRUWOiOake8nnVyQ
X-Google-Smtp-Source: ABdhPJzf4L7EJDP1ilxVe7yKdGRqSRnRo+wC1vw8/s9TEA1NdGP6Uzx7FknxGIzYFYaix2mV4xDekg==
X-Received: by 2002:a17:90a:4b03:: with SMTP id g3mr38672451pjh.167.1639330299917;
        Sun, 12 Dec 2021 09:31:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id f124sm1970531pgc.32.2021.12.12.09.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 09:31:39 -0800 (PST)
Subject: Re: [PATCH 01/26] hw/intc: clean-up error reporting for failed ITS
 cmd
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <212e570d-b1c1-73eb-bfe7-10a216b637ea@linaro.org>
Date: Sun, 12 Dec 2021 09:31:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Gi/V8KqG6ufU

On 12/11/21 11:11 AM, Peter Maydell wrote:
> From: Alex Bennée<alex.bennee@linaro.org>
> 
> While trying to debug a GIC ITS failure I saw some guest errors that
> had poor formatting as well as leaving me confused as to what failed.
> As most of the checks aren't possible without a valid dte split that
> check apart and then check the other conditions in steps. This avoids
> us relying on undefined data.
> 
> I still get a failure with the current kvm-unit-tests but at least I
> know (partially) why now:
> 
>    Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
>    PASS: gicv3: its-trigger: inv/invall: dev2/eventid=20 now triggers an LPI
>    ITS: MAPD devid=2 size = 0x8 itt=0x40430000 valid=0
>    INT dev_id=2 event_id=20
>    process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_TX: 0)
>    PASS: gicv3: its-trigger: mapd valid=false: no LPI after device unmap
>    SUMMARY: 6 tests, 1 unexpected failures
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Shashi Mallela<shashi.mallela@linaro.org>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 39 +++++++++++++++++++++++++++------------
>   1 file changed, 27 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
