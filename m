Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp553302ejc;
        Thu, 19 Jan 2023 11:00:06 -0800 (PST)
X-Received: by 2002:a62:cd89:0:b0:58d:acf7:9648 with SMTP id o131-20020a62cd89000000b0058dacf79648mr11932100pfg.22.1674154806181;
        Thu, 19 Jan 2023 11:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674154806; cv=none;
        d=google.com; s=arc-20160816;
        b=o2M0DNZtIzgl5qtixnl2f5k6gwDgcnw/xRaMoSdUmP0R3bevWwodS85anO2fbNy03p
         eufURqnsGxHi3FqKV+MEVxrOIpuoBAKWY1h+xzcbWMgi87Mc6y/DUIlgTAE5mPV7ceU7
         EUYLmdALd1q8dtCRA1LnoFE5Jg8H1f/QdWAazpjzXel0PBNy/b2HCpDcgmQloKXnE8R7
         QzkicSxiXIiiRoRN9+7S6nvdzzCJJ+buhx5WI0dSmgky1vJXerzPtcKRn0v+L3uTArqK
         5M7WPw6zykiKWxCX9uzlQHDMIYvhOnx1G3vYBSqpZWLkbWY9CR0YkKPNUgGk+mfnKH2F
         QaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p5zUFaH7Aq2zvSi5Nmn4CWYsKtJskudIcvLHlbSeWok=;
        b=RETDnzt4vBjqUCDLGmRKbvONAvcy2yelo1v6a5eUFiwRA1J4NjiJ+7jdle23XeAwhM
         lbhHDtvBiY7SC19W75U4gM9VOVZoDZ4C+etATV5UHL0TL7ZUdj60bKzm5py2SAGJbGCY
         hGt65hTzhD0NKK0KiltdVQ+zqR/CEvfOOzUglH6i7z7awKnjIo7KCg9lfEk77FbjR9xC
         SbaQfjobR2s7mbInaP5CIzHatY5q/GeQHBMHuviCRXiF0avveO5ftJ1S55wRtY3d313F
         p7UOM7uuR9i4wyzGnQk19LzfKHxzsmIXjmd6KhLOqX1Py+cwnnrvBJCD9IBmHSMO+I00
         uV3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wslYWQK1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c17-20020aa79531000000b0058923edb54asor9354002pfp.65.2023.01.19.11.00.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 11:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wslYWQK1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5zUFaH7Aq2zvSi5Nmn4CWYsKtJskudIcvLHlbSeWok=;
        b=wslYWQK1ByyRHOqBXHnUEN+6/nbXdv8DSEHSWYvkjIjaQ1D++O++wzSaZnNePEGqHQ
         LM2/ayDRmTN4hN7D+F06mW6VXLEQuWYdhFCpQlbkG/n7T0+I/yAm8CN70Cm4zgFp0gnD
         ZYzK4DWxac9nJymCKpNsOvciOIA2p6uBC1O1qro0XkadIo/6AAgGJD6mJaidmS3tS9L/
         Zd6dLg9ZF6poKY8hju85tddkxt2fUdkfXyBnaAKQnDslq/d+62T+yVQJnf5QffIMmL+l
         wY12Ep/T8qLIFn+z1cjNUB0Dj5jEuEOaPpkFU10oHl4ghaVmCKkNFGKhd4zJ56vHEttM
         Ux9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5zUFaH7Aq2zvSi5Nmn4CWYsKtJskudIcvLHlbSeWok=;
        b=RD94l3tRQiRac5wjDL74icPvLS8ZXXu0xUI2p5xzx10QaUHclJyNi9ubppkBdIAAUU
         e2U1kSL6F432jyAzeYb46HHCvf6melgTAEP0FHXwRspyg0OpB2ASCTtlaGxVwgt6PJm+
         UKjh9Iww5pSmAF4EjcvNvUPNkSL/6HO8oZUCaF9v221lFImbjkpR1/kkpt3pzhaWNJZv
         IhWGpllUjCLXdBrSe9JFdabftYsiwPwG9WyoPOtenB32MlgqwqOt3DV8ntEqcgxQ15ZG
         +0J8Ra3Oz85T5nyEQfF8AFhbvVmUCkcm7CxxjEZOqVUvvXsUQR+mPxALmQkzyTa3MMev
         Heaw==
X-Gm-Message-State: AFqh2kpfZqYjGLLe/Z3MUAn2/Q0kfMnhhywi4pksKG9EcTJjo67wfFAb
	3LNQ6tcW9ZLHeOSv4JQwNYGI5Jq0
X-Google-Smtp-Source: AMrXdXsgc1TVK7WR0cVMIdH5ODqOPT7oBe473BY6TcMAcfvO+dzI3QaRTCF7QDIAO/L0+cVwf7AjhQ==
X-Received: by 2002:a05:6a00:124d:b0:58d:ee7c:6cca with SMTP id u13-20020a056a00124d00b0058dee7c6ccamr7499682pfi.1.1674154805667;
        Thu, 19 Jan 2023 11:00:05 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id i70-20020a628749000000b005815837164fsm8944331pfe.59.2023.01.19.11.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:00:05 -0800 (PST)
Message-ID: <f014a262-1bb3-c08d-c0f0-ed3be8167789@linaro.org>
Date: Thu, 19 Jan 2023 09:00:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 07/15] tests/qtest: Adjust qom-test to always set a
 -cpu option
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-8-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jVNnlfLVN3FA

On 1/19/23 03:54, Fabiano Rosas wrote:
> Start using the qtest_get_machine_args function, which explicitly
> sets the -cpu option according to the machine default.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/qom-test.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
> index d380261f8f..462e3c4281 100644
> --- a/tests/qtest/qom-test.c
> +++ b/tests/qtest/qom-test.c
> @@ -78,14 +78,28 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
>       qobject_unref(response);
>   }
>   
> +static const char *arch_get_cpu(const char *machine)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    if (g_str_equal(arch, "aarch64")) {
> +        if (!strncmp(machine, "virt", 4)) {
> +            return "cortex-a57";

I'm not keen on hard-coding cortex-a57 instead of max, even if they happen to evaluate to 
mostly the same thing currently for -accel qtest.

Nor am I keen on replicating this N times across N qtest files.
Better perhaps in libqtest.c, or something?
Or even directly in qtest_get_machine_args()?


r~
