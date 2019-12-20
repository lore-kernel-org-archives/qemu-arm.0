Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3490065lff;
        Fri, 20 Dec 2019 03:45:29 -0800 (PST)
X-Received: by 2002:a17:902:b08d:: with SMTP id p13mr14853792plr.109.1576842328801;
        Fri, 20 Dec 2019 03:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576842328; cv=none;
        d=google.com; s=arc-20160816;
        b=HYw7TrqX6BAQ7x3w8yh5yquSU0grlE1coy183YhRKmDiuPAMf23I0M2QvpI33kFBs6
         NzGEvuWHT4NpEOgNqRWb4QSvRrdtnE3hlnsKBRLz7KPPua2zWosTv5H5mqUxV+D1+gJ6
         rfb5WuLX+87cezMqpscMNeeTOR9sOp/UutRGpg3NMZ9qHlvJTrw9VIfOEWLpzS04xLbc
         LXRDl9b3JQBVy1VMpJaMJBuzUV7cD4wWHR03EFn+c4rIIiZus0IHCyHjchQzgdiH1C51
         MEpDY+YNAg5ZQu0yzyMT+7dWygNL/NjtUyuZfBWxMHKmmFht8re3iyaZipa33kEKcZ42
         9oKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=crfuNxBVCngqn0yvcbXKI5joADyERlYsV08zUGbPnBM=;
        b=XUx5I5HjKbb+Ig9yzBS56AKor/iquEjQ0pyVpnwltn19m7NRZ/ZxiJ4qQkQa3LCMDK
         XEj29C395fh80CBo+Ig7v4RVNIpLI0vYSUioTC4sKayxN0y8/i0wCU/nGXaYFAgKWJP3
         hbL0LMMNUT7H4HvtOzhWkX4rqp+DOCNwwY+wIizrwawlCwCfRe6dFGpdcnFbz3ny4mTk
         CQgli5rTPqLF8dLIpBieSRSaWYnJAJdNcZ0j/2sIWjS0KWqEKCsFy2RqsoMyoJmkqODt
         bL/YEUXGtKmtvDMqk37upWD1NY8PrdZLz13ENSQ59/P8sPzgGttaIoS89iHeIOjdAODV
         EoQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mXwiQ1qU;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <luis.machado@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j7sor9507701pjn.25.2019.12.20.03.45.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Dec 2019 03:45:28 -0800 (PST)
Received-SPF: pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mXwiQ1qU;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=crfuNxBVCngqn0yvcbXKI5joADyERlYsV08zUGbPnBM=;
        b=mXwiQ1qUCvgaJHQLSrLD2pyQ+Or67gNf9z6ByTLgw5V7NT5OdsG7SqJWbAdDh4DHjy
         lgWGn6vrRy5AiocNZdYdwW1G3ftJ/bz9vKyeTJApnhMGB+MU6ahImZv6v9yxDxs2us6U
         ViOOkcbBd+KUSNpFuIjqMxcmBiZQEwFUJ0iK1EXKE/gXPjaSJE+eh9BOD6xbZ7sPaeUn
         3e/tUTg1inb0qChDmsLvo6CvHUC6+XhE1pV4NkzJPGYIdslH30p/woiYJHJoL2IkVWkz
         4+ZpOSqNLnXxC38q5PcfqaORoSkB5ZCccriOPnJ4btqXNA6aGnIeHgzdf6wA8KOi1Yoy
         IpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=crfuNxBVCngqn0yvcbXKI5joADyERlYsV08zUGbPnBM=;
        b=QJRMiTbk6YBW9jnqlp2XN8j5PX0vFb6mJ3d+cu/CWvqqljA+c6UEjDr4G2rzPHpXRK
         J9gR/T5vX39YtzBdDU7vglc14Ytp38ui3mH5+GBLMqgSZpHpfPwgVUgsS8aGeoTjman4
         Xzdkt6InteEQrCL4BcPQKW8xwyD1a9pV9/JimOLoTwQeKKAUMrcybsFxp3Da59V4s+Mr
         /C+0ajxjnkFzs9NxT298MpTFjAHFMisIThXQgTcq8Hxu9qkNZwGjCdMGp1XzTQV25A2n
         bttb++x7uAuECuQQs0MvrJ9sanI4Rva6gOLOULeDWRZRitg4Tn7CiIMLS9hEyyGbBfVc
         9OOw==
X-Gm-Message-State: APjAAAXhU/Qz86oDPMcmqthzuj6BqnZUIt9Db92HT7k/nTD7KhjsapBq
	jWPx0lZsvNxAd+E9XwkWvwCb7o9k8deZpA==
X-Google-Smtp-Source: APXvYqy2A+HB4lsHrr0ctuBOSy+8/zDyRdZHtoUdoS1b73lFX1aPoTFty7SFmks11dVvkQCssWYh9g==
X-Received: by 2002:a17:90a:26ab:: with SMTP id m40mr15812980pje.42.1576842328163;
        Fri, 20 Dec 2019 03:45:28 -0800 (PST)
Return-Path: <luis.machado@linaro.org>
Received: from ?IPv6:2804:7f0:8282:d06:e0aa:310d:b742:862f? ([2804:7f0:8282:d06:e0aa:310d:b742:862f])
        by smtp.gmail.com with ESMTPSA id h6sm10822686pgq.61.2019.12.20.03.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 03:45:27 -0800 (PST)
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alan.hayward@arm.com, damien.hedde@greensocs.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
 <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org> <87k16sdt4d.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <5c6dd0a9-23ba-63ff-5738-8bac11aad810@linaro.org>
Date: Fri, 20 Dec 2019 08:45:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87k16sdt4d.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: DC4fpphi/esp



On 12/19/19 4:15 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 12/11/19 9:05 AM, Alex Bennée wrote:
>>> +static struct TypeSize vec_lanes[] = {
>>
>> const.
>>
>>> +    case 51:
>>> +        return gdb_get_reg64(buf, (cpu->env.vfp.zcr_el[1] & 0xf) + 1);
>>
>> You need to use sve_zcr_len_for_el to get the effective vq.
>> Also, I thought vg == 2 * vq.
>>   > +    case 51:
>>> +    {
>>> +        uint64_t val = *(uint64_t *) buf;
>>> +        cpu->env.vfp.zcr_el[1] = (val - 1) & 0xf;
>>
>> You cannot hard-code EL1 without ifdef CONFIG_USER_ONLY.  If the effective vq
>> decreases, you must call aarch64_sve_narrow_vq.  You must call arm_rebuild_hflags.
> 
> I'm just going to drop vg (and therefor the ability to set it) from the
> regset. It was only meant to be an indicator and gdb doesn't actually
> look to it to size it's output. The likely dynamic extension will just
> re-transmit the whole XML when a change occurs.
> 

I'd verify with GDB first if vg isn't actually required.

 From looking at GDB's code, it does set vg as one of the register 
names, and this is regardless of any XML input. It does reference VG 
here and there in the code, even though it may not use it to size its 
output.
