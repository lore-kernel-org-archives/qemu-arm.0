Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3140307wrg;
        Mon, 13 May 2019 11:31:30 -0700 (PDT)
X-Received: by 2002:a62:54c7:: with SMTP id i190mr13879806pfb.87.1557772290020;
        Mon, 13 May 2019 11:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557772290; cv=none;
        d=google.com; s=arc-20160816;
        b=xm25kDTyfCVVHVM0H4uLm0lhfuCmy4vkMGwdBCmwEAsY92KMLCFn+m1HF48W9a8RZ5
         oOF1ribRMKzoAXfIajDUSQ5NjAnjgh2zkst0myg6UKQZgN+w/NDpf838zJOa/vMTNUXH
         jjFiC0RmIP39RSR30hjGZIWJV2wMunSmlHhr+WEttJXxICJgPS+TPjHh28/swPCESpXg
         dy2xb89lzK55mUb3TrZsNxpDH4sJhozEEYjixwsuoI158OK8t79xTayzXM2ROla1XHwp
         hal15bDWqRUtSJP/35RWZ+3V/YR0LH77P5EaNcQHIEtssE0sPWxemVSUsMtGTR6MYJx9
         yKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=xb2WBROopJ6wexUXZZHUN0JJtLxExXrH+yhRAr3GUuY=;
        b=h1Ib88BtbJZubqFQeYlQg0R9XGJZaxxOV663FbB1rffeVtmxxqGrwjHKAjzYoBxh4x
         LVjFt5WFlgfZE1OZyFVbMlbNqutyIGMRlZa2ZpKD7v8l5y/qzp+9vnY/UQRwYf7UwxzL
         Tn3wbMmNKYZ4SyGWGLizU6sdJyEXn4qdVpi2RTLytn2A4rIQSgwX6HWAsqqPqpz8u1la
         H0EBZv6g0+BzcNH8es3YmBgE5fdijItLoOPrGT1+ibqIr0hdStFDE2YKjOWladCny665
         0lZEdA3jg4j8cMfKukgrgHK5LP5RWKdQXDAZiwYR8GMnpwytF+SUY6H7qfyKcPkWHEMJ
         DraQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaDXf4i1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a20sor17449348pfh.35.2019.05.13.11.31.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 May 2019 11:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaDXf4i1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xb2WBROopJ6wexUXZZHUN0JJtLxExXrH+yhRAr3GUuY=;
        b=UaDXf4i1tJOOAPIbuzmFrK3xERze9I6dyyuNScD5+M+7gdvI3/WOIc259lt+4+/8C4
         vDtA3HHzv+SaFE3qe5JVNiTg3FI6LLNjLHuJxh3GPeLRuZ4AaXxxnAsqbTcgCZHCPNKn
         /b5NZyp6+0upv9akWf4cRH/kBAW0tSsXwnRIAHadhUVNQmrxORD8j5pQKUJofgMS7yVt
         OSSANfZm87Crg5Mv6DFcYtfR8rJaGJRLLKW87eV7eScGYGQEVH+JGSTwQkJ8z4mmVgj8
         JlwFUv+NDIC8nww0paFKkoyqJ+OAuX+YKd4iniY+2y7bYQl0/UAoiY80Z33gMiwtdPS7
         D5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xb2WBROopJ6wexUXZZHUN0JJtLxExXrH+yhRAr3GUuY=;
        b=N9R2mm+Of273p+4JS5m3DbtB52sNSt5KQ2jrasbCtZCqr25VMlzAGE4nCsHzwmC3lJ
         Wc4dlk5PcA1lbUqGlji5Z8QQTMRfBAUV+++2PW5jgNfjMsXMITlmCOqVk9uLYn6Z8oVw
         oJ83EJCMf0/q2lIVoI9o8KgaMWoroGJlBdLWcSxXN75yqsWletnYI6SdlddA5BEAIkZ5
         2MbWZnbpe/Wd4luLNvi4pyHk+IzzFNn8KlVi7ih7Snh4XbdttB+XheUiXfnsOw1lAdKk
         84e5o7LE04EU9xXvccWos3IXZap3Uj/rhsSgc5apl7xKJwOglkC5DId4F9fY2qGL2+fE
         p3cA==
X-Gm-Message-State: APjAAAXeBnN723iv6RD5+MUsyCb1pd83Yu1PV++2MIbvHYteeTldO+6X
	oWRELDLNbn4nRnGSjfQVwmNLCYkd
X-Google-Smtp-Source: APXvYqxwpzIvhEdABMcaogDbt70BjGIJn8JMPJPOxYazEhMtn5w4y7bLMqA9B0aiKBBPUbdw4U7BPA==
X-Received: by 2002:a62:5ec2:: with SMTP id s185mr36494250pfb.16.1557772289275;
        Mon, 13 May 2019 11:31:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id n27sm24000524pfb.129.2019.05.13.11.31.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 11:31:28 -0700 (PDT)
Subject: Re: [PATCH 05/13] target/arm/kvm: Add kvm_arch_get/put_sve
To: Andrew Jones <drjones@redhat.com>
Cc: Dave Martin <Dave.Martin@arm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513123110.GE28398@e103592.cambridge.arm.com>
 <e35ba07e-2844-fe2d-ca4a-0f795a1485b1@linaro.org>
 <20190513181421.g25e2zqlkks7ntxb@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9ac95348-54c0-3213-e971-959136241ac7@linaro.org>
Date: Mon, 13 May 2019 11:31:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513181421.g25e2zqlkks7ntxb@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: DRu6yV+2INdZ

On 5/13/19 11:14 AM, Andrew Jones wrote:
>> Indeed, to me this seems to be the wrong kind of swabbing here.  Exactly what
>> format is KVM expecting?  Surely it should be the one used by the unpredicated
>> LDR/STR instructions.  Anything else would seem to be working against the
>> architecture.
>>
>> If so, the format is, architecturally, a stream of bytes in index order, which
>> corresponds to a little-endian stream of words.  So the loop I'd expect to see
>> here is
>>
>>     for (i = 0, n = cpu->sve_max_vq; i < n; ++i) {
>>         d[i] = bswap64(q[i]);
>>     }
> 
> That's the opposite of what we do for fpsimd registers though. I'm
> fine with doing whatever KVM/TCG needs, but so far I was just following
> the same pattern we already have.

The behaviour of the hardware is different for LDR of fpsimd registers.

FP&SIMD LDR operates on datasize (8, 16, 32, 64, 128 bits).
SVE LDR always operates on bytes.


r~
