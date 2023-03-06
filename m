Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4739006ejc;
        Mon, 6 Mar 2023 06:56:08 -0800 (PST)
X-Received: by 2002:a05:600c:444a:b0:3eb:4162:7344 with SMTP id v10-20020a05600c444a00b003eb41627344mr9999453wmn.22.1678114568445;
        Mon, 06 Mar 2023 06:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678114568; cv=none;
        d=google.com; s=arc-20160816;
        b=FExnL8bnrq5hYIIhDNebIyZEuHM625kPgvGie1oc/qhvnDgOib3iDUS6ZcXrIOjVFD
         oCA8Ycrkd7pHB+aLOKOz3TQFlNCLyUkHTLjuiI6KlrXZtFW33dO0iLwpjq0eYrsq5Myl
         GcqCTGByHvc8pBgcTU1+89EguoWVixB3eULXwp3+CdMx9bcB6AZnAtkoCj/PuOrxpa53
         f2AgRBQ2M+uZ3y3tNIvW9V0CH1k00Dj1Vr34WVTqEb2+VYZBaX1rlzOy3Ok4qcbmoiIX
         T+pdpzcP9vTq79BAOXuOdyj3skDRQ2SQ3lIGX8ywdBIL4nGe0nM+nW+dQ57L6b0o1rrk
         ktUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HSNlvtsNsid6WJj6EyGrAe6WXlCiD/g/Bz4qeivUmY0=;
        b=c52KDnDxDbJvLYqyPGMF6OETtSU8Gzv7n1nvEicT4e1yM36KPPqoXj5PbQ8rqEpfVb
         FKHbMWFLoxFM3gjzpRBCZaXqAps0sJt0aikwmfNK139GXN04DXbMmK1Vk+G5NocqcPts
         5JRtmW5rEbBSSkAy3Kk5ea30M8XncNA5i5ZmUDiSLViQbwd+mDhApN2GcqgmbkQknLFI
         /1otySBwdsvxwK+37vQbWw32kunsi+dloNoH83tRDMBux9mK3hEDy0WZVDflCgwZgrgV
         fEmwG003L9nx3NJDzPit0dAxhcAzZodFn/54alAl9rqbrNGIm4oGohcAzPxMSfFAVWHz
         FX4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oqt2bb8e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k14-20020a05600c1c8e00b003d9ebbd0e50sor3960025wms.34.2023.03.06.06.56.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Mar 2023 06:56:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oqt2bb8e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSNlvtsNsid6WJj6EyGrAe6WXlCiD/g/Bz4qeivUmY0=;
        b=Oqt2bb8ePN1P2UfEps2tUjKOfsG9rH27VORr8popXmXXRgGHVPyBtt8DnmmiwrLf45
         eQk9WIsrg/C/vofTE5oPgmUVBiGwxQXMW8EvZK1UZP2JhJBQIXx9UAlGAIudq+v4IL7D
         W53M1f7Ers2pi/HtcHdWfZObZH5SxaB2t6UcgXPWpuWxJMStEsqQxkXt34BXYQZXXfsl
         DjuA+SFDKMeeWYEZVJroEL+cMlPNwC20OYsrzF9qBr2oH6C9TW7Av0O92i8kqB6eVbeH
         HIpU/31mqlE476m7BH9B68Tvf3cDyjCQdBWDNXZinEUXKPWeRBqFoYoc/cn2He3TeKHY
         p5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSNlvtsNsid6WJj6EyGrAe6WXlCiD/g/Bz4qeivUmY0=;
        b=Bu+0DtJA+XbDULpGgHdBNgyPFIiKeo0mrws24l1saDto5xlc73DPd7aD1W/Jy99RXR
         fjXc8RH3HZGBL5lRS3OG/7NDuAinj/kn+ceU0hLhoUTdElxfAKo7WT0ETBBJFKshS5Xd
         S/wJqxT1kndEwebHvhpXwzbWbYJVIQt440Nf4zWhYIPti2xjlBWjJipxRIY6DR2d0pjL
         4a+EJgjLCjaaFel1WB9C6xEep119ew8o99MQ72OZI6fl2RgnzjP1NghVdWGzKN6Wc5jO
         C8soDjwjaISIbgiAWIbgB64VyrD0hPh+Dit3YGrVf+iXRtjnYs6K3cogJ+MSzL3z2V35
         8GMQ==
X-Gm-Message-State: AO0yUKVEkJs8oIfhEOciH1meKcj8q+Wj76DPTDXQ/RjO5pvRcvm4IUOa
	eKUfKTIDLqTI7Fk0waqzN840jR5+
X-Google-Smtp-Source: AK7set/s8L1UGgm9AiWwMENrcTLfGMTYfkneJNyQl1C+0XtXj8LbERh8o6P6UbeKmtlIgI33BKq6+w==
X-Received: by 2002:a05:600c:4e90:b0:3da:fc30:bfc5 with SMTP id f16-20020a05600c4e9000b003dafc30bfc5mr9417698wmq.13.1678114568128;
        Mon, 06 Mar 2023 06:56:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id w17-20020adfd4d1000000b002c6d0462163sm10121537wrk.100.2023.03.06.06.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:56:07 -0800 (PST)
Message-ID: <5470384c-d720-26fc-3b3f-78e32e804b4d@linaro.org>
Date: Mon, 6 Mar 2023 15:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZAXzUIs6wODe7/hf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6ylxc02gZW/T

On 6/3/23 15:06, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
>> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
>>> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>>>> [...] If a 32-bit CPU guest
>>>> +environment should be enforced, you can switch off the "long mode" CPU
>>>> +flag, e.g. with ``-cpu max,lm=off``.
>>>
>>> I had the idea to check this today and this is not quite sufficient,
>> [...]
>>> A further difference is that qemy-system-i686 does not appear to enable
>>> the 'syscall' flag, but I've not figured out where that difference is
>>> coming from in the code.
>>
>> I think I just spotted this by accident in target/i386/cpu.c
>> around line 637:
>>
>> #ifdef TARGET_X86_64
>> #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
>> #else
>> #define TCG_EXT2_X86_64_FEATURES 0
>> #endif
> 
> Hmm, so right now the difference between qemu-system-i386 and
> qemu-system-x86_64 is based on compile time conditionals. So we
> have the burden of building everything twice and also a burden
> of testing everything twice.
> 
> If we eliminate qemu-system-i386 we get rid of our own burden,
> but users/mgmt apps need to adapt to force qemu-system-x86_64
> to present a 32-bit system.
> 
> What about if we had qemu-system-i386 be a hardlink to
> qemu-system-x86_64, and then changed behaviour based off the
> executed binary name ?
> 
> ie if running qemu-system-i386, we could present a 32-bit CPU by
> default. We eliminate all of our double compilation burden still.
> We still have extra testing burden, but it is in a fairly narrow
> area, so does not imply x2 the testing burden just $small-percentage
> extra testing ?  That would means apps/users would not need to change
> at all, but we still get most of the win we're after on the
> QEMU side
> 
> Essentially #ifdef TARGET_X86_64  would be change  'if (is_64bit) {...}'
> in a handful of places, with 'bool is_64bit' initialized in main() from
> argv[0] ?

That is what Alex suggested me to do with ARM binaries as a prototype
of unifying 32/64-bit binaries, avoiding to break users scripts.
