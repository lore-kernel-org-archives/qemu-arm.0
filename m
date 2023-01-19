Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp564696ejc;
        Thu, 19 Jan 2023 11:17:11 -0800 (PST)
X-Received: by 2002:a17:90b:240d:b0:228:d614:3b79 with SMTP id nr13-20020a17090b240d00b00228d6143b79mr12123525pjb.15.1674155831014;
        Thu, 19 Jan 2023 11:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674155831; cv=none;
        d=google.com; s=arc-20160816;
        b=BS7iGwTl95ulmrHSeMpLJMUn7cp2dfbwszwvfC8WQIFbM2TW4fOFRwPvWVYhvpLF+6
         +3f59ct7m1T9iKSRsLqZWHR0xEbDfwpChRNMvvHQ5WjVm6B6ndHt3kSGlRiqU67VQWpL
         Lvk0PLas+qWxYwS2DMlmboJZEsgMyYP8RgtUbJqll44zdso9q0IL88uWT+DDHFMuvcxc
         Zaohv0OSwfJxJ+H3RPPR8Hg4siYPWjSyr07l60AbhhfZFe2y9XzS4YMGp9y6Fktsn69i
         kJghBxDhporcsueT4gsUOL8sLmlbzaDKldneHeduqfBjnt7A56UViq5FHmbdSxJVeUMp
         A5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4aIR1803JxQEDZ4a88ke0Z/jtBLJPlvgWWKYT8SR2Pk=;
        b=DAKG3K+OBBPQHX+h4OCYd9S97ereYGENYuZgfxsiN5jYoCtcqELAenVYfdkxSHm7VJ
         AwaElXKhRGuTsXIyacgySfNd85q+WT6W+XEvWTG5XLe1DVvopugneZHw/ffBf7cqD6K7
         sKUIRVav1pe7s9wGgDe5gzTkn9+xMnru75ERtZYPruRpuvLU5L2mTRjzQyTYWsDg/XRe
         ncBKamUnhF9LZQ09SMjoUo5JfUErP+lMbmGNRGLr5fk+FlNhV0Ck3n5WxJHgVVZm+WjG
         MPLvgjnGmMFhQttkHDwfjo4TyXoB9cVS3OOYbAte4VSaqi3/s9dD882l7jRraqToGPLx
         3iXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rUL/at3f";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y13-20020a17090a600d00b00226019763edsor2589124pji.43.2023.01.19.11.17.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 11:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rUL/at3f";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aIR1803JxQEDZ4a88ke0Z/jtBLJPlvgWWKYT8SR2Pk=;
        b=rUL/at3fd0Rs+9PbeJbPoo0pXlSklYDgZ1CNPhksusmYyRMPM0bdAuTnkYqGdoApD0
         3crXqqsCDhG6lQGikpTbkWjNp4INqEh8sOFxep6sasku+JRsJ4TpJAIdWdPV304YoiCH
         R19kZS03DT2JBcgIYNkrVYIGW81++rq150e3RhW7Dh2bNiUn8GEMyxJ4cSS/blesJzq+
         7jO8Cy/2fcZv/6CgtJqe8gi+Kgc4xD5Mmqk/yWTthoFmc50uTtOV/wEXhNmOBhezRoCq
         B8A6H1d+QAb44pIcSUuB0AiwJvx9OLhBWmtGST6Ckb8WBtvn8A4C2fkg5PnpxGoId0J6
         to3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4aIR1803JxQEDZ4a88ke0Z/jtBLJPlvgWWKYT8SR2Pk=;
        b=sumVkeAM7QN1RSn5B+Hmo5V/PC4R7vBu23Qzac8M6V9L7khcC/1qcS8DmOeRzTIayp
         UHD4HpqN6/CPeWEEW61fN63nEFuxd66O7qxMtUGv8bcBXhJGIQBsQIlUClaBEeoCUpG5
         3voIh/qP71ZinLu4cZKFGKbYfdOFcnl+lxN8XrCuwmYSUCSQki8+Vd5yq0u8tsXWL5Ct
         svFgIZTs0z3UdB1o/5cX6OT/Bzlg4wNv2oIRhaPF438XJquy448sGQWRPJVp8CHVjw9h
         AlrB3YvFoAXYnaYDmmY4doWwURmb+yzw+3ZLRw950Y8hwNT26FTWLnBC3SdDqIgAM6oZ
         cLJA==
X-Gm-Message-State: AFqh2kpGVCVUk5rR2l0ckiAjzMhSEBmcf1cbWd2Btai4HCxY3i0fzEFL
	TJYGI3sJgoOFPvoCpbE1ZAc+h9MB
X-Google-Smtp-Source: AMrXdXsSuppHZZQCQyYn8iJwqC60UNuW7uiDY1bN9YBFegq9DmTOYUnSg0EyRCXNODwQuK9zv37txg==
X-Received: by 2002:a17:90a:3e46:b0:229:180a:a18c with SMTP id t6-20020a17090a3e4600b00229180aa18cmr12242441pjm.38.1674155830515;
        Thu, 19 Jan 2023 11:17:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id f14-20020a17090a664e00b0020aacde1964sm3358004pjm.32.2023.01.19.11.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:17:09 -0800 (PST)
Message-ID: <e8740dac-6c7c-8456-19cc-66fa7d2f6abc@linaro.org>
Date: Thu, 19 Jan 2023 09:17:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 01/15] target/arm: Move 64-bit TCG CPUs into tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-2-farosas@suse.de>
 <6fb8d60e-4283-1429-fd15-f8b799d277cf@linaro.org> <87mt6e4a2e.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87mt6e4a2e.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4lMExXHIjXum

On 1/19/23 09:07, Fabiano Rosas wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 1/19/23 03:54, Fabiano Rosas wrote:
>>> Move the 64-bit CPUs that are TCG-only:
>>> - cortex-a35
>>> - cortex-a55
>>> - cortex-a72
>>> - cortex-a76
>>> - a64fx
>>> - neoverse-n1
>>>
>>> Keep the CPUs that can be used with KVM:
>>> - cortex-a57
>>> - cortex-a53
>>> - max
>>> - host
>>
>> All of those cpus can be used with kvm, if and only if you have matching hardware.  There
>> is no rationale for considering any of them differently.
> 
> But is that allowed by QEMU today? If so I must be missing something. I
> see that kvm_arch_init_vcpu looks at cpu->kvm_target, which is only set
> at kvm_arm_set_cpu_features_from_host, called from aarch64_host_initfn.
> 
>      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
>          !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
>          error_report("KVM is not supported for this guest CPU type");
>          return -EINVAL;
>      }

Hmm, no, you're right.  It could guess that some of those could be marked 
KVM_ARM_TARGET_GENERIC_V8, but there's probably no point, since -cpu {host,max} are the 
only reasonable options to use with kvm, practically.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
