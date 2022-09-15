Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp209745ejy;
        Thu, 15 Sep 2022 01:07:35 -0700 (PDT)
X-Received: by 2002:a05:6e02:ec4:b0:2f3:9528:4303 with SMTP id i4-20020a056e020ec400b002f395284303mr11858664ilk.158.1663229254947;
        Thu, 15 Sep 2022 01:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663229254; cv=none;
        d=google.com; s=arc-20160816;
        b=IsDqzqZlOx0gmixj4HVUlG1b2edW74u5EFG+pSkP5X4DvU8iWgupYo1RKQjNGS10ud
         /EVTtrMc6X4AnGTGGTnngRGJT6noHEYyF5fAKhYZ9DnWGDCuvWS6UWVrhoWeGIkLJzqO
         9cwDMPktEA91/6kAdPn1OD3tr+wdO++Z7Nzw0YFSS73T1rEjHidVvV0KENZuRLIW3nf6
         vChhDPKSYnW3tsx7kzXoUd4lcP2qz4LeuDuuTQ8EG4AXK/n0ux0KR+e4r3AjSBX1kJEM
         mq0H994QpRFkGG2Q2F/Tue2SIxgsxPnSjI3RoUrZ/rtQHabsAWPxzvbuqvGVjt1sMiyw
         xLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=e59Kdp7IusKVdXAHcR1y5J4qLxewCCFQwsbIuJRuj3Q=;
        b=a2LoSwz3qAGiSVzwXXNkkpBjhqUNIvm/Xu5UTxdS4+XxKcaGnChqJ+GY/krzCEmJZm
         uP7iMNQbv+bTW8d4JFO+wXnRIc7alymUN1Tfqyvx+rkJr7sNPJAs/xVYmaCgUu7V8Sj3
         f9pe1FSzmsrfdMfhf/GKV7DUX6TRziLYqb5ZUf8kR3KmeNQvVWRv+o29xQ1K5tIGOcYs
         QNXpEHtC2ATQf0VHp48yHq1Q9yGXEQ4pKWYETPhdYGiN5ehizpDwmeK19mFOL80C4tId
         yhdPoJmZ1P6xSH84UFvY0qGKwW4Xb9ylHH7OWTSPD7YIwKOcbneQagxkcV9lwRGHTFe8
         R1NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKuNvwdL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3-20020a92cb83000000b002f1b043b91bsor4492389ilo.80.2022.09.15.01.07.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Sep 2022 01:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKuNvwdL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=e59Kdp7IusKVdXAHcR1y5J4qLxewCCFQwsbIuJRuj3Q=;
        b=OKuNvwdL0CCzLpxWWXGZwOz801RHT7VOZEUeuzIf6p4os7SswwuEP9IHGJbMgotQ8+
         r95SutEY9/jsZDXQDjTsGNgaDJFgb3qs3zQUQ9TK/X5qR08DaVJP0oOqDrbo82MnUTOm
         tHdBmhbPj9IppybYmbeClDmMcyamoStMjrxOiPnC5ALbvON0bmH9np+qD5+0I8xzxIlt
         2RRsfnue1plsZj9S6Vt9hoBogFlZ1jBDMP5sM1QIdDDUfICt7Iu/cSI5jxHHjRZzjCn+
         LElkR2/NtFOV+lQjfqjThOjhv7dz0SZMJSfk7EZFBadgeMc38a0xwx5C8z7UnZYNCXBG
         MTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=e59Kdp7IusKVdXAHcR1y5J4qLxewCCFQwsbIuJRuj3Q=;
        b=GvGOLZA3SD5XH4OBOwrww2O6x8s22HnsvGhvs21P2pnFi7rqGnrXh0gN0fVLoYRWHL
         Ow/MgBPo7G3spTQzy7SjCfI/t6ifBuNbSohsWkKO6LHhpz4NkNWxJGtonEXDXmrj8C/T
         QgXVF1lx489rZXZgTeKbtYc9abFf33kIcsNZM1N55xPIiUqFKUu3lE59xAXlo/jQlxux
         ThXDI01j0ibfLxeHnulufp7NNhEhtUMP3WmdERW8iGAaxvHlZ2CFFYZN+cyXFYeaqMlu
         nzhA0PbMFV2NmcFd2AHADiHYUdSFWf3x0EIGxXsC2Iq+YMs4Ed7G3uAalcSaVRYZTEk+
         h0lQ==
X-Gm-Message-State: ACgBeo0F2828lDR1ia265eOQIlO/UiwDMv1Ig4vG0dJufj3J2LGTyn9+
	WpWFnAdx6bey0fI4WdGlj1Yxpa0AaXD8P04DA04=
X-Google-Smtp-Source: AA6agR6dkm6FtFyFjDJXJ/C8H7ai6wj7SzjQkege+yqCeydV5TVaDf4mruM/SLw+SClz4qXXR8U7dg==
X-Received: by 2002:a05:6e02:1524:b0:2ec:71c6:7b85 with SMTP id i4-20020a056e02152400b002ec71c67b85mr17168929ilu.237.1663229254383;
        Thu, 15 Sep 2022 01:07:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.85.227] ([172.102.14.25])
        by smtp.gmail.com with ESMTPSA id a18-20020a029992000000b0034c0b4c13c2sm817595jal.23.2022.09.15.01.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 01:07:33 -0700 (PDT)
Message-ID: <f7de79e4-a0f4-c212-6960-afa0a82bc80a@linaro.org>
Date: Thu, 15 Sep 2022 09:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 1/4] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ia5HNzO54Ye+

On 9/14/22 17:09, Alex Bennée wrote:
> @@ -1340,8 +1340,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>       uint64_t val;
>       bool locked = false;
>       MemTxResult r;
> +    MemTxAttrs attrs = iotlbentry->attrs;
>   
> -    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
> +    /* encode the accessing CPU */
> +    attrs.requester_cpu = 1;
> +    attrs.requester_id = cpu->cpu_index;
> +
> +    section = iotlb_to_section(cpu, iotlbentry->addr, attrs);
>       mr = section->mr;
>       mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
>       cpu->mem_io_pc = retaddr;

At first I was going to suggest that this be done in tlb_set_page_with_attrs, so that it 
could be done once and not duplicate code across read/write.

But then I got to thinking how this ought to interact with MEMTXATTRS_UNSPECIFIED, and now 
I think that we simply have to leave this to the cpu's tlb_fill routine, where it fills in 
(or doesn't) all of the other transaction attributes.


r~
