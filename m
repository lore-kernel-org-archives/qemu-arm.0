Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp213427ejy;
        Thu, 15 Sep 2022 01:16:10 -0700 (PDT)
X-Received: by 2002:a6b:cd0c:0:b0:68b:35ce:333a with SMTP id d12-20020a6bcd0c000000b0068b35ce333amr17727556iog.193.1663229770775;
        Thu, 15 Sep 2022 01:16:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663229770; cv=none;
        d=google.com; s=arc-20160816;
        b=B5hOMwzrinrECss9GKq/GSU9ulwVPaZU75r+w0QZ697dV6uEDsyD8EKXVeRc4+ovKg
         iNvyHxUrDHnAFVj7cg9gvtJFGpgVULzPMGb6t3TxvcHH8q64YNscaTJen8VfeK+PFV33
         NQg2wF9FbMXxETX6uylMvVBpc7AxsxvJgdEEXCr1XuHwjQ7ey0UgdoLWru5phTXsWOrE
         97W03TreAc5e9QMydY2bf/59qWXINB7SCY902K8dnXgKhHM9HorxWg3qBP/UWMnEmWFF
         v9J0uaDwKnMLQM+RP9XMtNkVm/Awdgntdf+5/KUlMNuF1Ah4GDaFuBS7U0kuiwwwODMP
         ftnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=et4yR2vZNnpuyu+Y+VxJoidQ9mI5mEVRdeAglxprfiM=;
        b=S5a/7b5R0m0VfRdcmHmtlW6kKyPqjJdqCMYMjxxKSrJ3ShS5ZC14HsorU9DEnX3nX3
         7Ct8N3BZtaDNMCtq8t1tlGid8SEy8TMXIKE6Tzqm6/mDMQ8rknDVjDRpGm7I1/HOnm4j
         a1MnCoqUaGEvNEIlAHwjTroFgJ/IugVexgKgq+cqIxMD7Y4R2xy1nAIONqxIleMfmeCm
         9Wfalo4gWEeTq5e2QiBMlwFF/Dn5Uw1R6sScT3dEOI2FhdbCI5t14EqG2snMhaO9Z0AD
         IL6YEQbX7MV2lTqaIu4UqcfjD8z8LST7ItQ2ep108W7a1CURJAfpMQ+iqVse3KQBdE9p
         0Pzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xk9Aj5GS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k24-20020a026618000000b0035a58d1db95sor514956jac.41.2022.09.15.01.16.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Sep 2022 01:16:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xk9Aj5GS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=et4yR2vZNnpuyu+Y+VxJoidQ9mI5mEVRdeAglxprfiM=;
        b=Xk9Aj5GSSHIAP9NBREZJdHwz7KUA8S3zYS4i7wuU4ym6blCi7BzBQMkzQ+oWdK3VJe
         EmPvViaxB7jNJO4SwUfE6KE+jjiAQxj4FaxZ9tXO4S1FGmUepPg2+CMVPPNxKnIWPSq6
         FOregoSD6xvBIxhG6wKcURjsMWAE4kWr35biouSFwCUQRPurGLqmMvPUcEuroo58LHsn
         bKye0qnY17WXBdZIIBCBHIQ0SxCVDglcEI7AcbsvpY/TaV8wMrAxQYcgaYHNDxE2aFaF
         bmFTIGDTh8KIQv1VZFuzi5+OMcO2sOwC24EfJRlPmlQs+Ur+Zm/vUeCAFDbkj9vyALxj
         XrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=et4yR2vZNnpuyu+Y+VxJoidQ9mI5mEVRdeAglxprfiM=;
        b=zTTSTdTuGAPnbREApxgOeb4/vwkY4btrg+p49MILLeLG4oZ4dtyPeJBNvFErhjU5U8
         wCbBbWZ1euHJ6wXQCNL3WJx5HqPX+JbHjpRoz+gQCNTIxMl48+Ajg8aFxFfDmlsGDxFi
         1K8MgctNgF+D1jZs9KlQo9e3SSpvHSo8mbRBj3FO5ondrRYUZ7IYA5rWYGW7AwIeMuWc
         7jh2iHk8HEW+NhHp1F+mok3kxBtlc1QtlRRge53w7MpJgpVghkY+cjfXBk+F7tMns7ps
         Gf0jgYpREFZN1xaA/b9+KZKqIXP8XOVuqHQkRUfI6iwGWxU13awsNECmBT7oZWXY2128
         KCsw==
X-Gm-Message-State: ACgBeo3xei1IXW8g4gZK1LOfH/WKbJPKV/UupOPRxeNamt7EofPfq86k
	GabbwYAshrfaiFD0MBNuvrcs3KQ2qzv685Uk7Nk=
X-Google-Smtp-Source: AA6agR5A4np2AhL3jI+J8X1NSSUMOV3qoYQsWUN8PAztLOB2yYqtNLS5pRU50hl+Czugx91L4IR/MQ==
X-Received: by 2002:a02:620c:0:b0:343:5e87:1bae with SMTP id d12-20020a02620c000000b003435e871baemr21010772jac.100.1663229770275;
        Thu, 15 Sep 2022 01:16:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf? ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
        by smtp.gmail.com with ESMTPSA id t70-20020a025449000000b00349fb9b1abesm813036jaa.106.2022.09.15.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 01:16:09 -0700 (PDT)
Message-ID: <c6d2e06f-75b8-0ba2-5e0d-51603873e40c@linaro.org>
Date: Thu, 15 Sep 2022 09:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 2/4] qtest: make read/write operation appear to be
 from CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3jJyE65bekyk

On 9/14/22 17:09, Alex Bennée wrote:
> The point of qtest is to simulate how running code might interact with
> the system. However because it's not a real system we have places in
> the code which especially handle check qtest_enabled() before
> referencing current_cpu. Now we can encode these details in the
> MemTxAttrs lets do that so we can start removing them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   softmmu/qtest.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index f8acef2628..c086bd34b7 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -362,6 +362,13 @@ static void qtest_clock_warp(int64_t dest)
>       qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>   }
>   
> +/*
> + * QTest memory accesses are treated as though they come from the
> + * first (non-existent) CPU. We need to expose this via MemTxAttrs for
> + * those bits of HW which care which core is accessing them.
> + */
> +#define MEMTXATTRS_QTEST ((MemTxAttrs) { .requester_cpu = 1 })

Maybe clearer as { .requester_cpu = true, .requester_id = 0 }?
Otherwise it kinda looks like we're setting the second cpu (index 1).

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
