Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp430209ocs;
        Wed, 28 Sep 2022 09:58:05 -0700 (PDT)
X-Received: by 2002:a17:902:f689:b0:179:fdac:c4e2 with SMTP id l9-20020a170902f68900b00179fdacc4e2mr715977plg.119.1664384284990;
        Wed, 28 Sep 2022 09:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664384284; cv=none;
        d=google.com; s=arc-20160816;
        b=PeX3L7IrTnGabl5rViY6kR119etSFT5pfxQ+4DcCgLLfn5oTeqw25sTW8elS0F3wuS
         b83+CfndIClcfFolILQhQPrOxkNymFnNMrutaUlNskKUgy5u5n5nP6FI5Nos7t62hSaH
         oToh2ToRhyYiIkA/BYtSW3mHaAQMJInvB3y0gSbg8B6XevfeYqoRAZBpOSouuFGi0KvA
         +nEhVHvu/HqrO/kyjmm8LEdjnzmzP9bJLnFLeX6b8n24gYSiPvfYiX9D40QgAU6RxrAg
         M4YBaX1F+p+4WBNv9KDq0O0WbfElaAJ92YWrkSgMORxvYdv5ss0is7P7HJ4pd+g2ecvy
         qNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bX7IGLe/Ms9KNpy6vNdz5xZwIzbPR1K1Pum85llrbyo=;
        b=GAc1Fq8siPFCwh/X8arUPdld9q/caRpN/zmkinJsAQPRANbYCkF4lM3yYybIO4shDT
         kTbEwRhNp/B6oQV1TPuW7QL//Yv0+7X5C/yIvArcWio4BnJsHR72DkaSy7vK//HER+HN
         yNj5v0aNW6KWq1EdHSRz7Cq6he1KjAw8Gov/mkDkNyHNwmDed7483YXQe3AG3ouW1Cob
         qc+o4A7vx3m2f236APGLiJbSZnnfW8xDoClRc6ggqo8Dq12kgt08WiltAq1b+7qhlkgY
         Jv+zqS4IcjEJaszvZmHWXuzXL9pBtYitjXKBEhQjBV+9IxMLWOw9c95UhMG/lmNrDvYv
         fWYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2PylXBz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14-20020a170902ed8e00b0017691f1960bsor2445320plj.178.2022.09.28.09.58.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2PylXBz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bX7IGLe/Ms9KNpy6vNdz5xZwIzbPR1K1Pum85llrbyo=;
        b=u2PylXBz1cNaJx9EcAtvzSbqxxZCr2uHW1i+/BgSrx0+P0e0fKhR4nfGLqpZ0h7LnY
         6OFneJ83VA+WvUKdQSSsm0k5SGw+ao5I250jomDDIOB/mKjMSBfq0w50apFat7LSXz+N
         4YfLREVIAn4ciFLVZOPk2EnxMcIT90kXqlEendxNOCK/cIjDShFE6lKuzf1CJhezZV5D
         EUSNs9kE2rTwlv23hyDsouc+N+brtouh5Tv+tHsCTbBv+buIbK90IaGXO+40LYK8Y0/C
         uHQw+pnKFz+7xBFX/ZfFlDg9CaLhp0qgpW864AYJ02b6QPBwzdtumoxfschAzSANTfYQ
         aBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bX7IGLe/Ms9KNpy6vNdz5xZwIzbPR1K1Pum85llrbyo=;
        b=HchauHj7V04+/seFp1Silg9hcNr14kzdk0NCJ28NIxhaTPc11940IlWHYxq2m+7KUg
         8h4g2+4g+PqzVqCPFVwTIF74LidrO15WTBMMAdM8Q5ea3CFCLuOTYmUBu3T2rAky7ZWS
         z7NpzHceNRJboOJA9u/r2Wo6hwoOkadE5tTwHyNuCjNNi86SAZNF0e6nzZ2S9ecAhBaV
         WRuEgpsSSYFhlgW3CLqrhXrdVSMLMzKlbhEgGZHae4zoxKUX38CRcX7W53Yy5fIZ8RxI
         9StEIEc20EhaS65uNPap/U7eE9IVPvLw1HTCnwsbDEQ6j9hjOiJieCSEuKsPri7tTXmV
         /y/g==
X-Gm-Message-State: ACrzQf2IuLVzcRuN/7d6tXYUwuCF7Qtg4Eou/GmkVzGXDVwD5q1t+cdV
	VckJl2QeS/FS+f9T2mVSN+/lv2kSeOTBjPnS
X-Google-Smtp-Source: AMsMyM7taKnMkU8+uaRgVFhqz8MpRlE0Xdg9NIGws2dcu1yQpQZXu1jt9vMSv2qVdCQYCzxSTD4qmg==
X-Received: by 2002:a17:902:da8f:b0:178:399b:89bb with SMTP id j15-20020a170902da8f00b00178399b89bbmr733746plx.57.1664384284644;
        Wed, 28 Sep 2022 09:58:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id 22-20020a621416000000b00541c68a0689sm4220465pfu.7.2022.09.28.09.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:58:04 -0700 (PDT)
Message-ID: <7986cfdc-3ffc-48d5-abf9-56fbc0337fcd@linaro.org>
Date: Wed, 28 Sep 2022 09:58:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/15] qtest: make read/write operation appear to be
 from CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x4n5trT+n4P5

On 9/27/22 07:14, Alex Bennée wrote:
> The point of qtest is to simulate how running code might interact with
> the system. However because it's not a real system we have places in
> the code which especially handle check qtest_enabled() before
> referencing current_cpu. Now we can encode these details in the
> MemTxAttrs lets do that so we can start removing them.
> 
> Acked-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - use a common macro instead of specific MEMTXATTRS_QTEST
> v3
>    - macro moved to earlier patch
> ---
>   softmmu/qtest.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
