Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3027839wrg;
        Mon, 13 May 2019 09:40:33 -0700 (PDT)
X-Received: by 2002:a17:902:12d:: with SMTP id 42mr25827174plb.4.1557765633222;
        Mon, 13 May 2019 09:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557765633; cv=none;
        d=google.com; s=arc-20160816;
        b=nKac7q+SIQYUYYbtdt580eckR/zHJoDXq6Q8L2Cqb2seUl7jY1l1JFFiOqyx7VTK6G
         JMO1RIY2Bjxsu4flgs6SvPwFRAbj38EZ2BUcQ0un6coXzc3ylkMnrLzpS8+OD6muCyfs
         dOrjvpSV0eU1fpflnhvf6HpNJ3vKbyb91YjuUVNOUvUe8HpRNXMtbrGT4lqHycNJZIUG
         gc2ldd6XSVa5VAjRDN++oV2Vvo5mGfgift5f4yJbIDBZimtEBer6Yfx+Jas/ugd21Zpr
         ZBoFcOBIHIHIleGZaNkIo2XdWWSbzPLLvJPyY31FijU86SOqj9bVPhagAscJKA9N+Y26
         ZJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=9emRe7+SQWHfpiOONHat52ULNuh6E+wMqmRqVatJvPg=;
        b=sJTWjj0XVdlpbBTgPu3Py7u84BJKgBelxaZXXisskMzKRpPXSwbatlcLa4bGAh12WY
         D+yZzoSqzqQ7Ju52bayAGRgQvk3CpOo0SLq74pBTxaZJpVGcBxTWePRbDfnPLMsVfebr
         wO3i12REjHL1NnbCctOQT3TJvBJX2YFcw6OOp4srsBx/IJkvmhAWm3EHkxRZ0iJ/Qver
         BQZXo0OijIt2Bl0xAv8wGGLfzxg5BpA+INLFvWwbo1aL5XDlA5nejplLEFA8EiIxr/ZX
         zqIpFJoH9heOhnVkoLIMB4D/dbCyGq6QP2qFHPv/enTJhv4xdpEnJbyCVR9H0UZhCnVN
         PV0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOrrFFKV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w5sor15248336pgw.13.2019.05.13.09.40.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 May 2019 09:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOrrFFKV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9emRe7+SQWHfpiOONHat52ULNuh6E+wMqmRqVatJvPg=;
        b=jOrrFFKVbrFhFs9mhivPp/tHHCJPMqi7iJ/yk+u+YInvHU0ZTLiKoDbE55rHelZHUP
         mH3V/2me9vDUytT0DCABn1oeyNZ3rrAPj0i+g4kRqiz+jj+TBugiR6QSBv9TLOsHzFRU
         cCUX6Y1HluAbzShlsLkNAZZcV+YExMLUh3LcZzS0Buw8zSJREZPfqElkDWHtbcinSLPu
         zo53Yu8icM3cdD1TNoBcJwa2khCWFkV8TM2JuED0ngSBlmuPJA3o42yRetVyNiUKUo9/
         FgEbEXVdcfoi4x4u7/W/2NZuDB7jG8rnnxYrWsVIvSDvTOFPwEu1RuOHPZkEiIA+a0XU
         B3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9emRe7+SQWHfpiOONHat52ULNuh6E+wMqmRqVatJvPg=;
        b=J1pIC6kv3/34cifRTCd9G/MMYuxxHWjm4FiRJ8cv/oBTYsbGUUMvXAiVW5YdCI70Zk
         q/JnHMD8DmL0JRs+nj+55RjtpjmsuOQFnC09JtlIjl4fZKBP0OSPatfFaXFH97ALpbPm
         OFGOysnmUYoMyrn1mrTz8YB1+YuEr21+SehWVurnTu+4j7k3aIPuW+/kRe5ihYbU3Jbl
         jdk50vh5k8I2ok1TxahSpRLsMMSuEP5KGwPWufLazrNe0Zdh5ScH3eXPZSDn6lRC19go
         IFbqyEBPhU5q9Y5KZZ2vh/RFkvundN/wvquOJgfaQyu1+Iv+vkT8fjxbsDQkAavKstKg
         0hVA==
X-Gm-Message-State: APjAAAXeOvlVNYCi0F5DyWvEutTEIVJF+CMMtwSPPFhl3VMpyFxorkmW
	gKIJ3hAb/dYZsCllqAKZtVVpHHJ7
X-Google-Smtp-Source: APXvYqxJyB2o2w7xR7AQfxdrxQnvD5Mf72IuIvvADwPnOKN/uXcJxStjd3ufP7T6U2ARb5Ghbzl1Ng==
X-Received: by 2002:a63:90c7:: with SMTP id a190mr33206956pge.23.1557765632636;
        Mon, 13 May 2019 09:40:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id 17sm21449966pfw.65.2019.05.13.09.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 09:40:31 -0700 (PDT)
Subject: Re: [PATCH 05/13] target/arm/kvm: Add kvm_arch_get/put_sve
To: Dave Martin <Dave.Martin@arm.com>, Andrew Jones <drjones@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513123110.GE28398@e103592.cambridge.arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e35ba07e-2844-fe2d-ca4a-0f795a1485b1@linaro.org>
Date: Mon, 13 May 2019 09:40:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513123110.GE28398@e103592.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: iwayHT6GZ9VL

On 5/13/19 5:31 AM, Dave Martin wrote:
> On Sun, May 12, 2019 at 09:36:16AM +0100, Andrew Jones wrote:
>> These are the SVE equivalents to kvm_arch_get/put_fpsimd.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> ---
>>  target/arm/kvm64.c | 127 +++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 123 insertions(+), 4 deletions(-)
> 
> [...]
> 
>> +static int kvm_arch_put_sve(CPUState *cs)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(cs);
>> +    CPUARMState *env = &cpu->env;
>> +    struct kvm_one_reg reg;
>> +    int n, ret;
>> +
>> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
>> +        uint64_t *q = aa64_vfp_qreg(env, n);
>> +#ifdef HOST_WORDS_BIGENDIAN
>> +        uint64_t d[ARM_MAX_VQ * 2];
>> +        int i;
>> +        for (i = 0; i < cpu->sve_max_vq * 2; i++) {
>> +            d[i] = q[cpu->sve_max_vq * 2 - 1 - i];
>> +        }
> 
> Out of interest, why do all this swabbing?  It seems expensive.

Indeed, to me this seems to be the wrong kind of swabbing here.  Exactly what
format is KVM expecting?  Surely it should be the one used by the unpredicated
LDR/STR instructions.  Anything else would seem to be working against the
architecture.

If so, the format is, architecturally, a stream of bytes in index order, which
corresponds to a little-endian stream of words.  So the loop I'd expect to see
here is

    for (i = 0, n = cpu->sve_max_vq; i < n; ++i) {
        d[i] = bswap64(q[i]);
    }


r~
