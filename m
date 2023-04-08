Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp679257ejb;
        Fri, 7 Apr 2023 21:30:02 -0700 (PDT)
X-Received: by 2002:a17:902:e1c3:b0:19c:d7a9:8bf0 with SMTP id t3-20020a170902e1c300b0019cd7a98bf0mr3122568pla.10.1680928202674;
        Fri, 07 Apr 2023 21:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680928202; cv=none;
        d=google.com; s=arc-20160816;
        b=diEuD3EC9yViUz7NmjKusMcwoT/wqKbYbk7zxUDYqb9Y9TT+WOgqw5LA251nrcdDiz
         09DW4EyFD5YaKHa5rHlLiKxKUJ3GAOzB2jsNgWIKCFtE5RAQysD3QC5vMig7q44HdGsz
         Z4sYuI4kTavDMYqY5S8D+nfxfuC9VCbsAP67+SoiPvLHV6xyKaCmRo5TmXgCBdJKG1wr
         vxnVClzM2CzxUXuPIW/B/POZV50D0KcoBB9d28k24YvK2TA+98KJkwuFOaKSZSjD4czc
         5QMVdUAa3Po5AvwvSh3TzBgRF7ciNZQtONKp9uO4RCppQBgdFnLhdDB9ms0390nUu9ZL
         Quug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wQs4SC5lYlKd/34OSFcaA0sSEu14qWxU3jsCupypxlU=;
        b=HoQIFusjWHhrAVlBf7mwVEmMLkj5OA85gKz67Qpe28uwo2k1bfg11zA6Y+SnCjg/eY
         QbN5LtlasTzXWOkRsYEVr27/4LBB3cMsxCbzLU8PcoMGsRCRByhaC7f+0qPV0XpVNSv7
         QCl+iw6iZoBcdSWHVJ9l7zxfgCigzVw6nI8hAd73ah1o430osZAWKkDp8fFb69qWS8yq
         0jdwLbZT+zlZ38okYyTtAuGrgDvZ+oQjCtY1HYyadmepupxm2DbayW5Co3r+yDEN3h/7
         q1ZFA+F0HN6dLiapKUeZh2uAJnrZm7I3PgoD+0RhhvyD5wyLssiw2rNR7aDKngjIaKs7
         bsDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kUaGPTve;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e1-20020a170902784100b001a1a395d5a8sor2628290pln.70.2023.04.07.21.30.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 21:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kUaGPTve;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680928202;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQs4SC5lYlKd/34OSFcaA0sSEu14qWxU3jsCupypxlU=;
        b=kUaGPTveG0lxEI28vTpDb9Jw7OfLi4TPDm7kQSZcLfBmpgcZpWdfC+nC/VxxkU8g0D
         uhY6ay8Ow6fqnxgPs2ScCkFW1hcpY7bHeEG4IdUb84QinAnoHlZ/bD+jiGDDXNMAb7wl
         Npca4GkUEsp31W/9wZ0nnBKCzHIqzQFY5qH9Qc0eEflC/0q10hpGTG2fpyWmuFAX5HvI
         oK64dK+t86fzN0Fs16v9ZDiZm2LWdeyflbaMdQKGIXyrAgXu103KIOcVnM9mWpipo5OX
         Nh6sD6s0cr0WvBlYzRNzJAi8pxf7y2zmuhnUcQx+8qbwYEnNCaHWH/aUzB2Bef22N40d
         KNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680928202;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQs4SC5lYlKd/34OSFcaA0sSEu14qWxU3jsCupypxlU=;
        b=Q6IYLpTyLXqnFCkfo+oAP+l7AfC/BLf+JBhBgVczvGG9JByigVa6JXawpsjqWfjpPE
         3voe09ZXyOlV92wQdLTSLZeKcx4WAGBJCbtenL/IIanEl1fynOdP8FOYwZEt8vKQSIWM
         IIugFeDohHkv0ua82dTMX+dSp+ibSH7Qq3721V8R492jY82ryR2hmbASf7sbPG97v7QL
         n8+Q9uMfl/3hoZQAXfVR/4BzOXKhNrvXa/KyV5rNlbiN29pKrjp3wdWBq+EyLArAqjmy
         2pGPcA1myVQYyvcI+nOkrq7bwlSb5UBa9ibJATDSGcQDm7VWys1yGxxFaqvXHp6jnUMl
         j/1g==
X-Gm-Message-State: AAQBX9fKmzOFUVXd2aluW+ZRkQb2RavHkqRsx7a4uV8opFtLOxmSXt44
	icL+qvvqIhaKmmQzwk2ng6SRN8gAsiNYQR/9SLtBbQ==
X-Google-Smtp-Source: AKy350bSf+NJer4y36s5JHSJa51+w0WLdRxuVnS+TxQLWRCkIT+ZrofzrzsIKVKZztNYWN9UFvABiw==
X-Received: by 2002:a05:6a20:ce1f:b0:d8:bed9:33cf with SMTP id ic31-20020a056a20ce1f00b000d8bed933cfmr4258225pzb.17.1680928202146;
        Fri, 07 Apr 2023 21:30:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id j10-20020a62e90a000000b005a7f8a326a3sm3781655pfh.50.2023.04.07.21.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 21:30:01 -0700 (PDT)
Message-ID: <73bb88d3-7218-6ecf-2feb-2ad340d5e61c@linaro.org>
Date: Fri, 7 Apr 2023 21:29:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-10-philmd@linaro.org>
 <ef63cacd-ea5a-16bb-994c-bf7a0ea3ac6a@linaro.org>
In-Reply-To: <ef63cacd-ea5a-16bb-994c-bf7a0ea3ac6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tjHARLi1E8Sw

On 4/7/23 21:28, Richard Henderson wrote:
> On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
>> These fields shouldn't be accessed when KVM is not available.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>> RFC: The migration part is likely invalid...
>>
>> kvmtimer_needed() is defined in target/riscv/machine.c as
>>
>>    static bool kvmtimer_needed(void *opaque)
>>    {
>>        return kvm_enabled();
>>    }
>>
>> which depends on a host feature.
>> ---
>>   target/riscv/cpu.h     | 2 ++
>>   target/riscv/machine.c | 4 ++++
>>   2 files changed, 6 insertions(+)
> 
> Yeah, the kvm parts need to be extracted to their own subsection.

Oh, but they are.  Ho hum, it's getting late.


r~
