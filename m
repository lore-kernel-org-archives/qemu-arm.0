Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1658866lfa;
        Fri, 4 Jun 2021 19:22:26 -0700 (PDT)
X-Received: by 2002:a17:90b:108f:: with SMTP id gj15mr8305715pjb.124.1622859746117;
        Fri, 04 Jun 2021 19:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622859746; cv=none;
        d=google.com; s=arc-20160816;
        b=iSdMoCMAUZhg/2FEyTGzCdaef7EQUgOcIOV2mEA51ycSNjFh34+qe+fPF2iGGrLFYc
         HjDAQtpp0lj8uiGmL78yh7UHt4N6T4sGXSLy+3xG/k4+Jcvx7jmmnTnpsRSZrdoX1kE7
         NPre4cgjPbgRPb/rEE6lNlSVpkkTKuCKvMWrGsYDAQC/XSSVIJ0LCp9weBi0g3rElOMT
         Nnw6IHJ4ZiMIWjNyFnY57H8KK9fmQDgQomu1cVKG5ImdnW7yN/hspxkKHPUgHid7iw6d
         kOTSMX1SkPau/BLbzDAEZxWruCrMj+4qbwpmUz1y24ykhIa7yG6/QxUNO1i/+lS3LsRQ
         9ugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=n+5rtVGtMSoon0Yri20dzis+2zLVd4SJGR9BVhMsug4=;
        b=BD+Y/KwXOyAHM4Eo9gu+phQYLpgUPlb5ammwTWmRMNB8pkvRxOCZhmbOxxezFFrZAM
         ksM3d20LEC/vLHc4yo+jDiyo02wffgG31WNFdFR298NKLfFCgkALkvJ4bp7LxgKziWPE
         T3nZePaGqibIBLu13gHF/AbEDpJC9MfkfD+U+dI8R2gWmJsOEb2CQ5ntvK8b6aZ7BgUI
         qTsghPjOOrf33TYUAu7S7bUlPLpObMNCQxkZYkaJPLz5OcFuMEF0iikmGDpaxKqePfHB
         odGZQRC75b2kwqCi3CJjEHmBd6GK6yhSDx/EYZqpy7X4eedF5/DR/I7fA4yP/QYsU/lE
         /w3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGBN1DEc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w22sor4529716ply.66.2021.06.04.19.22.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 19:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGBN1DEc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n+5rtVGtMSoon0Yri20dzis+2zLVd4SJGR9BVhMsug4=;
        b=vGBN1DEcnAhl4Kj7g5nv9glgarXTeUknxqRJhwZR8j/VtE8F5rNClZX9Ivj/o4vTcm
         Il9x0KAxKOe8yYU1WGcIPyJi0p8+OGXn+Zqr2cLK9p50A0Y9IN/9gntxRYOYeuymuOBK
         13lxqsV2J20694txXE95OBoOyBPpzjVlj61XdMhOsfCeZp4c5vNPPGNPthmYgKj+aMxZ
         D+WUE8Wg37D5fqexHxvGsB5XKm30svCFSeXFUvM49Pe28mI+MdsMPHolafouchXzLIyH
         KC/BJmzkMVcUVKUzPFdljo+Dt7oP2DlXN1bqWWV9+HN7F4dHVqwowRY5NMPGkam1Yk1T
         MgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n+5rtVGtMSoon0Yri20dzis+2zLVd4SJGR9BVhMsug4=;
        b=QyKWmAiq/uJYP4rt9YwDcu7AjNrVpdD6vzyDqQprxrU5vSRbMsWbTQ9YjCR52caA0n
         prmdf37rQGeIxkaphD08Byli0rQ6NBGwWMma25Hz5JeAOeyTtOD57FjHnYywpqARQFUf
         TLMB0I2jkEciXnmTBhpHHcmbsftxbj8WHHsZ76YGzlZNs1slIV7/zedXN1ziAV4ebqYH
         hoN6PTsA09zFJkX1i0wA/6s5WBiVIz9rNMP05ksK1QykDmqdUxWaE+b8guWVvF7TbCRP
         8COYjHHze6wCfsHf5TN/51m2X+sMDAmuYDCAt4pfbQyBEQSYGr4bTOmBY8Wy+k1pugHa
         lODg==
X-Gm-Message-State: AOAM530LJfnkHrsP9w17MmTM7tqeGtAtH5RBICDjkYfK6EhnTyvkxIP5
	YIF3szWKFjmuTpWngybboTCJGoxrLqoDj4+4
X-Google-Smtp-Source: ABdhPJxeW31AWiomQ9Gd1XBIKMY2ozbp9Kea3dTfEJB9z23Lp933H+pl+hnSlWqCeIwOx6rgjR8z9A==
X-Received: by 2002:a17:902:9a45:b029:101:81d0:c5a3 with SMTP id x5-20020a1709029a45b029010181d0c5a3mr7212479plv.52.1622859745641;
        Fri, 04 Jun 2021 19:22:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id a25sm2749939pff.54.2021.06.04.19.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 19:22:25 -0700 (PDT)
Subject: Re: [PATCH v16 52/99] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-53-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dcc5f77-e010-363a-367c-59effb15d4fd@linaro.org>
Date: Fri, 4 Jun 2021 19:22:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-53-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: QOjLiWYatNVj

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> make it clearer from the name that this is a tcg-only function.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/tcg-cpu.h        | 2 +-
>   target/arm/cpu-sysemu.c         | 2 +-
>   target/arm/tcg/sysemu/tcg-cpu.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
