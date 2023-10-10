Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp7037ejr;
        Tue, 10 Oct 2023 02:48:30 -0700 (PDT)
X-Received: by 2002:a17:906:6889:b0:9b2:b747:e460 with SMTP id n9-20020a170906688900b009b2b747e460mr15992077ejr.55.1696931310404;
        Tue, 10 Oct 2023 02:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931310; cv=none;
        d=google.com; s=arc-20160816;
        b=jOlTm4jt8lYizrIfk8BxC6iIXfl0ESi4cA2VB5p9hy5qbv+CQASQ+jCGVjLFOg32ma
         eFEH7us9hd1Gjym3cJ6uTsMwpnOgzZgzGDDNLS09H23eR7cpbiaUn7in5mgzLgV5hDhg
         ePvggbmUFt9pgy8P2BzqrBDyl69xotGISTvrCowzVpIc4/4MpKOvw0ht9G81mgVZxAoA
         g+oyTaIFEBIVXyDosWsCNLklz1Z3G8EVYCpC1iIhtHF7Qxk+EUl9eiUhE8sUmWfKTPAH
         xNcRG1LjdOESDIUxCJe6d8o7IeIUkSDYV0E2e+h+jKB7YrxsMWjso03u3MLbs4f/8ayo
         PuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NjRgnkdnq+Xnm7xoAs4BcpBKYlROU4PW+5xYq+lCe5E=;
        fh=m0ADrs1Gs4AqKruuDZEoBjBG7qb+0sHKlXSUagZW128=;
        b=RoKnlB0mxWi9vYH2suCg1Z9gCdK4dd5q4vIUUJwR5bXkROxqQ4wfzpHH89nUV+Y2tq
         IRl4gsN5VUYdaF7J+YzOEtlJBQBEvxl0o7QinueAqdv+sHO3xJg4msjRtiSzqvdzW88E
         c8pyl8bz3KSs0Ul5D65Us5gpHPr76XE82aL3k2/v0bmwspEb281wEBtw+ES69MERUP3l
         r62Fz9TzGf5L8L1Ovn5jlN1/L3y8b1rVudJGxH5Vn9kInFOjoQRjHE+1WwZbGt1nWv+w
         lOzodDZ/lqN0CBa0Wb5s5hrlark4baEGXmgi+I7ACulgmHaJLrj7jBD8cwc9o8r7cdyH
         8PZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRALgSid;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gs40-20020a1709072d2800b009ba321b80e2sor825038ejc.6.2023.10.10.02.48.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 02:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRALgSid;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696931310; x=1697536110; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjRgnkdnq+Xnm7xoAs4BcpBKYlROU4PW+5xYq+lCe5E=;
        b=HRALgSida9SfXPUeeLyerHu4EBoqE1hiPK1B5xNzcFc0CwYrT7X0Sqbcjh0ClFEFEO
         uoRuy9+sFwU+xLFZnScLFgL1XPcjSI5KChItgc7nbZ5og+9VfrQ7oNfbkr8Utk+N43J7
         HElBQ83t+L+xR7Kvax5T9Jj6NpLz3sV4O5b4Jo7qr9SIE5bbP/okzAgvV6wxXRe6Y1vq
         tpJmw0aakspTD6X3JnrnsNPmbXkq5N2twnp4iIoCp1iOTrPpjXFufSq5qn1eBVT6aeFy
         rZOlqnHWBkNarA2S/PB7G3HRmL2QzCCcfMLCwN2eUqE9g64JTxbxAiuypJ9901sK95VQ
         DYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931310; x=1697536110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjRgnkdnq+Xnm7xoAs4BcpBKYlROU4PW+5xYq+lCe5E=;
        b=n/B6ql2h8W0BUJA/IPvBuuTLpK0wuwfS9q+CUAaD29n1U7vhW2Sg2P48TuU0aeeQch
         egFbzahOH+6hDOjDWzRkrg+6Jkcky+CzXxJ/CbAFHQ6bqWy6XVAq4vXifrf6Y4TY1ahO
         45toZhA3CTvS4mYwCoygaU3s3YWJIoKEJfVhYfgxA6qCJPKkcU+znQDbrOMSGUnOq5Oz
         9iIX64NWeZBiCWIOnI+7JXsd6en6pHOKD/UJWwIvIokXaxZ2M9EbMB7cSEkSEKGrU8Rq
         XiM0E9+SW8vH3OV+8/KIgGM41pEZcaax5Q47nX3nt5YxJLbr4oM5In1UCogP4yXuzx3S
         rSig==
X-Gm-Message-State: AOJu0YzQ1ybHWaHde3iTuAFSu/xMfFkkER79E0F+HqIcsvt0e9BZ6+tD
	19eJN+8IeGl0NJR7HaidQF3izOEkojC/Vw60LbTqaK50
X-Google-Smtp-Source: AGHT+IFEHsBCz24KEtiGpKDSCOQa3M3jGui/uPzOG8OKTM6Jtu+TAvshZuUSfV6Lvug6hP8HxLs/nQ==
X-Received: by 2002:a17:907:9724:b0:9ae:50e3:7e40 with SMTP id jg36-20020a170907972400b009ae50e37e40mr18923706ejc.52.1696931309984;
        Tue, 10 Oct 2023 02:48:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906a28b00b009737b8d47b6sm8137657ejz.203.2023.10.10.02.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:48:29 -0700 (PDT)
Message-ID: <6fcc827a-02fb-7fad-a853-5bcdf9aaa7a1@linaro.org>
Date: Tue, 10 Oct 2023 11:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] tests/libqtest: Introduce qtest_get_arch_bits()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-2-philmd@linaro.org>
 <e108d282-5eec-4430-1a10-8cf3170bb18c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e108d282-5eec-4430-1a10-8cf3170bb18c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qW8d0YIEb+Kf

On 10/10/23 11:46, Thomas Huth wrote:
> On 10/10/2023 09.49, Philippe Mathieu-Daudé wrote:
>> Add a method to return the architecture bits (currently 8/32/64).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/libqtest.h |  8 ++++++++
>>   tests/qtest/libqtest.c | 21 +++++++++++++++++++++
>>   2 files changed, 29 insertions(+)

>> +unsigned qtest_get_arch_bits(void)
>> +{
>> +    static const char *const arch64[] = {
>> +        "aarch64", "hppa", "x86_64", "loongarch64", "mips64",
>> +        "mips64el", "ppc64", "riscv64", "s390x", "sparc64",
>> +    };
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (!strcmp(arch, "avr")) {
> 
> Just a matter of taste, but I prefer g_str_equal(), that's easier to read.
> 
>> +        return 8;
>> +    }
>> +
>> +    for (unsigned i = 0; i < ARRAY_SIZE(arch64); i++) {
>> +        if (!strcmp(arch, arch64[i])) {
>> +            return 64;
>> +        }
>> +    }
>> +
>> +    return 32;
>> +}
> 
> Since this function might get called multiple times, would it make sense 
> to cache the value? I.e.:
> 
>    static const unsigned bits;
> 
>    if (!bits) {
>        ... do all the magic to find out the right bits ...
>    }
> 
>    return bits;
> 
> ?

Fine by me, I'll do as suggested in v2.
