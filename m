Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1594236lfk;
        Wed, 2 Feb 2022 20:26:43 -0800 (PST)
X-Received: by 2002:a17:90b:1e42:: with SMTP id pi2mr11881984pjb.176.1643862403488;
        Wed, 02 Feb 2022 20:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643862403; cv=none;
        d=google.com; s=arc-20160816;
        b=c8A5AoZ7ljal8Xpa/trJ9JFWCvS96w3bpjTq72LGOVIJL01ghZhewXxMQjarmoonB4
         gvsRlprhmA6h1vHxjLR5QQwyL/nnAOAPFa4VBUELypuRTOU8E7eM2oCrMrGVJ1Yz2dwy
         mFvs0IDgaLaf7T06l7Ux8Tjziq4boCQriSzfpyaWoqtam5pY309SDtVlfnazNpG6eBXG
         Zm4GpVPJE5u1ZekcXAVLmhvOjTAbqXhQcuLargej4WMvonAyvRXZLTf3FEvzJht4MfNC
         m3PUFIcthw4qjbdkaRZBEw7Oo/nLrlX4UW1stHeoromCU9cRua9a3DLYihfD3u21L1le
         3bVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iRCM7mXXnZuVOqkcLrXXLcCpWi6KRthzXINHZrPDhAI=;
        b=DWDYxkXV9t1dCJVRS8vv7EhTMZmy0dZ/wfeUV7y6+9pw7nrugDhSm6RRdjTa6U38wt
         F1JoV3CygTdwYMSDRGa+Fj+M+7TMYiPYgY6G7kHr4vcLQJPaiXZCQvhfOjCXCQp0guXK
         iUvxufx3eiOvQeV1waG807THcFYNsPdSUNIinlp7jFHf9crM9pClTA9KQbSXtSHSkmj8
         C19i24N4Qt5iBhnhURyskeu8Qxqke3k5gGLdi+ZFlgemjhA+QTnAyEpAh0hV3zJkLpBu
         OVe+twtDqoNwHW/MsgPgHNbCdHP1rjLD3HPiFW2EL/wd3J31QyzHbDRrsyxcc2+LheqV
         0P1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RS+pRBT7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m10sor9547361plt.130.2022.02.02.20.26.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 20:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RS+pRBT7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iRCM7mXXnZuVOqkcLrXXLcCpWi6KRthzXINHZrPDhAI=;
        b=RS+pRBT7YwVg/wyNiMPrM8kX+Yj5QMy9r9fnaaCBmnnw9j6vvcfBAfgVMPMG4GQdA+
         MyOwnD4PQsE/ogbGbQocDwjnu1kPFoBXRdwlPCDzt3Vh0E+k7VfDWJZzLHMBoGuPK8l8
         nhmGD5/mjNL8eJOvWiPyqhgSkP+gQSiWGuFc/0I7vR3O4g+sdAR6U/rNSbdLptPYGodn
         7XDupEmphlAhJcqDkTyMe3NtCabTwlwSxbbUpj+jwG/IzDBzu931i3rB70p9K+c9yp6v
         zLvTczlAfWpKJf5NrwU8ktO4/u4oOKcSRWWt5C9FXttxiQCjlTm8ploZWrPPRHET1QAy
         8WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iRCM7mXXnZuVOqkcLrXXLcCpWi6KRthzXINHZrPDhAI=;
        b=lTLDCpTQJjjXzm3ghUp7yRVxPGam7BKEim7gbI7CBAEjdXO6Kvz4jV5UFj7ZDpr1wn
         Vn7siqGprdANVm3xgzVPblfLSUgwILT+itoLLPHSLUVXoz+MPLKQqrE84We1vUU+Knqg
         9e/3OHFSaZTor7DPa/e0vFGvgfeL1NFhkTWS2Tax2FcZHK8MQZ0dBKsMT+wWw/3ad9xj
         UXOkly83QOg+CVrsoywt06/BNPM21VpctWHqZbOUX6totiTBOyZYbOhqCAW9wNiUMWpO
         CwTUHNWnYzYRc8v70ONWQyYCP/rD4+Zb+NC8PovVld5motxDWUpY3PjAVKyIR8PG6Pn2
         mRKg==
X-Gm-Message-State: AOAM530LmOPSLJ8q7prnnlI+KVcsFQVhNGXL/x3LTc+0cYW8DRcWipyc
	+wpn+g6HbXInnUoMWJ4kpXGqfzOERSLDqLuFw8s=
X-Google-Smtp-Source: ABdhPJw63O5rF2Uh4AoE1qfQXGIfNR5inEsx0ZxMwJBSoRWkZNK37vfgeHXQR9S3tpfl95iM7gLMWw==
X-Received: by 2002:a17:903:41ca:: with SMTP id u10mr28240821ple.71.1643862403015;
        Wed, 02 Feb 2022 20:26:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id p1sm18421831pfh.98.2022.02.02.20.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 20:26:42 -0800 (PST)
Message-ID: <c1a0c0b5-2d91-ca81-d3dd-77fa8250f278@linaro.org>
Date: Thu, 3 Feb 2022 15:26:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/13] hw/intc/arm_gicv3_its: Split error checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NLmYzHtEvzuY

On 2/2/22 06:32, Peter Maydell wrote:
> In most of the ITS command processing, we check different error
> possibilities one at a time and log them appropriately. In
> process_mapti() and process_mapd() we have code which checks
> multiple error cases at once, which means the logging is less
> specific than it could be. Split those cases up.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 52 ++++++++++++++++++++++++-----------------
>   1 file changed, 31 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
