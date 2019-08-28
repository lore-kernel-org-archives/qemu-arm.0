Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1274903wrs;
        Wed, 28 Aug 2019 14:12:21 -0700 (PDT)
X-Received: by 2002:a17:902:31a4:: with SMTP id x33mr6451603plb.68.1567026741097;
        Wed, 28 Aug 2019 14:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567026741; cv=none;
        d=google.com; s=arc-20160816;
        b=zqgl6MWNIm9Zntup2OlMNIFV+Pb4F5YnAFEEsIOqyfSCMYX5LEoXrxcMjOSTV4KXI0
         3nYxX2UcCNY0fQKVEwBIv6ZreVaaBG5teqgQiUwNw7ZreY9NU9wXo4NRPXZL27tEJl7K
         ic/hPf4pFyiv3sCKWKsrDrLbKvveqY17IFmdVrBBr3KaSFDxHAHBKOVR2ca6tHQzG7pc
         xn3u8RladL467VAH4QeOJ3jdcs4e18YuABPV6LB+9kAsnOjGMKhXA8imLF/XNs64fu1a
         dAybuc3FeFA9ozdcJ+kpw4WtPgEssrxZGVeqtTZm3Afx1hcNimt+/kisfCHJnZkx6j+6
         5Ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=mxFK9Jg6tc1xBJM545UmyeNtwpYh5rHWr5WX30nzQsM=;
        b=GoXeAduPXcFgh+FwueoRNTBYISVWfSO4bvsxFGxymQFzirtX4XMdhB/XTtwxdnOPrC
         1av/qAxaUUGimygC+EcevZMjp0uiUcgFZhxTymtiHhv2F+kpGGVCqupw6Pz3sQgXKN+B
         kbXBHqFDQ5pTBQU+Ftak9OHtmdW0ngPiSEAejEYK5R5L9Zm3Nz2zC1dfyI/OzaXyrk+h
         N9dvyd/ZwMiS4jN+I8+Vd3MNTKW9ooQQUmbGUVzVHXWPt0l4NKS8o/zJtyDZ8ZuYoKvj
         ixav89ygNM65uW8SSKzYLTWmBxQCz0pxzyjNOYC8Pt1kWPYMYZFk56Zqeu26HKHqM869
         w32A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hdf2Jq3w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d5sor631408pjj.19.2019.08.28.14.12.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Aug 2019 14:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hdf2Jq3w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mxFK9Jg6tc1xBJM545UmyeNtwpYh5rHWr5WX30nzQsM=;
        b=Hdf2Jq3w3beOUQn4NLrl3lmXAlm9mNh2U6rpeVIwtibJMb7A2VzXkTkJLuOZ11QaCR
         kQEELY3hJVnLEk2/JXXTlpbysEQ5h1dpHS1OzyIai2MXw+Z6E3L+R71cQkOMFpWS6jJ/
         UAnuZn0xRzfy1ejqh/OxDP9zeo51PPOBkCRjChqJPFoeQBSXtJZJaaLugIf7OyFgeS+R
         kmhgzoQCgFEqh//zhABNUzCEkNCtPhUMDYierhcMmMzUJyCnzXsOpiHxexwgimY008Hn
         vMab3bIsp1sGS7+4qMOZW7mKOveXOshgw3pK+PFfvMxIIIxSNmqTT9rBfduG3fVn7K2U
         sRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mxFK9Jg6tc1xBJM545UmyeNtwpYh5rHWr5WX30nzQsM=;
        b=Gm7BXSTevNhTGX/8d1nQarHW2WLua1uRGGOtquo0SFpgPJOin3x8BnZcPFiTAYOWbW
         kToYMjq93q+LDaOdhOp47IfBeRzMDW9UB+92ceKvxBghF3dREvA8whveI1lBFKw2OGtx
         kHczxJxiCpniq5viTPVnTx+RHpDhy+APTIv5ZcNBuk7ZNTNSZHw2M/3X7SbTNR6xmpM6
         6NitXaVyoKnO69E2E9emtBkAgkMvewdcf2vcb9JGVzAdPLfC/JxnDmRCNA57NFSk+kaU
         7V/hoJbrdtKaiRb/m9xHcCYFwINNu3uxEOC8C2H2oP8IeIFyucd7ZZfv7dZTGGNlniSx
         OWgQ==
X-Gm-Message-State: APjAAAWMgqd6CklQaTf0Zd4AMWnxv8vJdoX9IWbQNRZ6naO/8wCImc3V
	Ddh6rG/HAMJOheHMtO5BCf0BeWJ6VJmljw==
X-Google-Smtp-Source: APXvYqwkq2YMStdsa8bM5S4tRjBO67CZbeKpTydKac1gTOa3Ta9IBo4g0tUQf9qXnJb2NBGnxbloLw==
X-Received: by 2002:a17:90a:d793:: with SMTP id z19mr6194069pju.36.1567026740557;
        Wed, 28 Aug 2019 14:12:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id v145sm324772pfc.31.2019.08.28.14.12.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 14:12:19 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 4/9] target/arm: remove run time
 semihosting checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20190828165307.18321-1-alex.bennee@linaro.org>
 <20190828165307.18321-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a46f7e41-ce51-e467-859c-eacbc64b4568@linaro.org>
Date: Wed, 28 Aug 2019 14:12:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828165307.18321-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0gBLNjg/XqxV

On 8/28/19 9:53 AM, Alex Bennée wrote:
> Now we do all our checking and use a common EXCP_SEMIHOST for
> semihosting operations we can make helper code a lot simpler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - fix re-base conflicts
>   - hoist EXCP_SEMIHOST check
>   - comment cleanups
> v5
>   - move CONFIG_TCG ifdefs
> ---
>  target/arm/helper.c | 96 +++++++++++----------------------------------
>  1 file changed, 22 insertions(+), 74 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
