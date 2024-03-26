Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1301046ejj;
        Tue, 26 Mar 2024 05:17:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjlY9tYEodjF3q94Iw7/JZ1PqzUdijWR2hJqGCTYDVWMGqgEAI8EtvVMDt6TbwIw2BoHgSWEwlVnCo7KYdtCChB4mx6pcE
X-Received: by 2002:a05:6000:1564:b0:341:c83c:374d with SMTP id 4-20020a056000156400b00341c83c374dmr7955866wrz.71.1711455463551;
        Tue, 26 Mar 2024 05:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711455463; cv=none;
        d=google.com; s=arc-20160816;
        b=hKWo6iwYxpI9IdliY5dN20DuyPdkKbpWSTmbSnu5TfZAWnvBm/YHvKbRjR/0G04CMY
         6kx3tfNKPZSgk7uAYo6NKGmXy5aTvtszuC+I5zni7MQTNqDTPiq4iuuK20rlu35Bznfu
         GEGQIIk4gGhcp/VIjYSrkNNnjqx50rxkViL0XQo+zfaD2jkyB043wBbLUj6AgQ0vAftE
         LYGWFCiGqi0C94IpKPo9NCsnHX5Y9Dc/zdrCTorOqKeOEAF5WI5Gsct1ppdkauchz6qV
         sKufG/02a2JJ/XEqpZNlzWt9vbgXyMuGFf06o0w+520iOb4SdbqBdB80gfg96tjYfKkB
         VJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+CvJbbwaN3gu2LDxLhWXeNXxtcBh4rdfLG4lvNAmVmE=;
        fh=J7Ha7Q40RJUvQ7fHF0TIkuGs40DkXvAluPAtLUrHzHQ=;
        b=r+6FfD7hz/pf7faThryrwMN9zcxZhRkBCWkQJ+XIc0RZm6B2VNxgtWmGdJEt/jRewp
         JgZ9k9bylA+byG7PbCJKTQS5asDXxCJmrBPtHT4Zzgy5C9OUhXe0GdH5GQWJUY7VdDhE
         a0ExY4a3Lv6it2GLBPICWt00m2igvImoUNyx9tbnJiYqPJ2ZoEWnOdr08XhzB8gQKSWo
         gXdoP7/PJ6Jr/BhOxY1S+AJvSyv9AIkR+2z9RMSqTRCWUxzcUTjxvay6xgpz+K+rFfyj
         fSsZYQeWsmBptQonJ/f7WXFwFhTxuNNfYCHyx3qtlNr60ZAev5uw5SYv8z2fVFdcFOUq
         Bg/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PJip5nKz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s16-20020adf9790000000b00341d977bd66sor249555wrb.2.2024.03.26.05.17.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Mar 2024 05:17:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PJip5nKz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711455463; x=1712060263; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CvJbbwaN3gu2LDxLhWXeNXxtcBh4rdfLG4lvNAmVmE=;
        b=PJip5nKzDJuod9ZmCMM0rMAX3aZex3GeKW1GGf2Q4NUime3dkC7lRip3lIt+lHJitQ
         77rzGLewI63DLaiJcpheHrXLlxRmcg9Nj/k8uepfYHVm+oUZUljXW520MnyAknqIFPDE
         Y1nmBznEQ/tX3deT8IfMYpsGYaZMGkxmP6/+neB5ZuiV0tjbKmPib3SwLLwj9hYJYnYB
         lPneYL+xkovpHw/0REnUrGM7YVqTQRPWIwNRmSI82AvDzqWaVo6DsC1oLi4B8ubC0ICY
         KeA1YsYyt7dOwKQdAMplt8SxZ+sBcnjDVKILD40OHSR19mXmY9bBStxh7aud9WTU/6+W
         f/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711455463; x=1712060263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CvJbbwaN3gu2LDxLhWXeNXxtcBh4rdfLG4lvNAmVmE=;
        b=XqE/yQ8KNDPkBLAOFCjwOGlv6wl4cpg2kKPZIpgTchlN1mNDo2M1A80hEi5S73t+35
         Pch6MlKbkKPpB+z6k2ZDAQcegWzHzBh0+7uevbAL1uTGBhAIyhFprbURTEBwCgJCZm9z
         E4Md+ZFAMxzE18Pkl6qRBqUHF7K8s46yX8Ar+7jodzhw0u9o7NM2eIGXsHeJjhSkDtwr
         fDLngSxX0IFoUXxvV1lHXA7XOHfjjaEz3Xs+aMjHjM0xpIP8upo7+Vjm//ZkpDo0o+0H
         9j+89ORqhBVJjxeS1RNkQMboRoPb60RwrVm22KtM4Mcgbzw1jy4bs/0A41UJmPj/U2Kq
         stkg==
X-Forwarded-Encrypted: i=1; AJvYcCXfTXjUYhwPzcQCSFaIeQOTt9GMoWyGYgYpaLk1Gbq4QWkqZ5DjGhl7Xwzs87Ih9EHBqepXJLlfs0tfguerUsTOAiLI6ge2
X-Gm-Message-State: AOJu0Yy1NXEsoQvhMvNr3F3mwPSjr9oFkXKhzd3GmyK5C5DjGcT0u4su
	RKy+u7kecvCOLO1Tfb0nwzWhwVsW7hFTF1qYloUml51lMxH9iWcRZdcSLxS+5Q5HZg==
X-Google-Smtp-Source: AGHT+IH/0x881Tg1KCQEHgOO/amUEa7aJ4sRVYGn/Uxud+HM5UfeitXZcj58rf213bJ8cHlsfoVulA==
X-Received: by 2002:a5d:66ce:0:b0:33e:ca3a:1bba with SMTP id k14-20020a5d66ce000000b0033eca3a1bbamr8851064wrw.20.1711455463091;
        Tue, 26 Mar 2024 05:17:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.155.229])
        by smtp.gmail.com with ESMTPSA id x16-20020a5d6b50000000b0033e93e00f68sm12087753wrw.61.2024.03.26.05.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 05:17:42 -0700 (PDT)
Message-ID: <94e841dc-3589-472d-b6eb-b96d19c93407@linaro.org>
Date: Tue, 26 Mar 2024 13:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 06/21] target/i386: Make X86_CPU common to new
 I386_CPU / X86_64_CPU types
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-7-philmd@linaro.org> <87h6gtp8f4.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87h6gtp8f4.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +R8Y+kxln4ZS

On 26/3/24 11:57, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> "target/foo/cpu-qom.h" can not use any target specific definitions.
>>
>> Currently "target/i386/cpu-qom.h" defines TYPE_X86_CPU depending
>> on the i386/x86_64 build type. This doesn't scale in a heterogeneous
>> context where we need to access both types concurrently.
>>
>> In order to do that, introduce the new I386_CPU / X86_64_CPU
>> types, both inheriting a common TYPE_X86_CPU base type.
>>
>> Keep the current "base" and "max" CPU types as 32 or 64-bit,
>> depending on the binary built.
>>
>> Adapt the cpu-plug-test, since the 'base' architecture is now
>> common to both 32/64-bit x86 targets.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
> [...]
> 
>> diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
>> index 7f5dd5f85a..97316d131f 100644
>> --- a/tests/qtest/cpu-plug-test.c
>> +++ b/tests/qtest/cpu-plug-test.c
>> @@ -90,7 +90,7 @@ static void add_pc_test_case(const char *mname)
>>       data->machine = g_strdup(mname);
>>       data->cpu_model = "Haswell"; /* 1.3+ theoretically */
>>       data->device_model = g_strdup_printf("%s-%s-cpu", data->cpu_model,
>> -                                         qtest_get_arch());
>> +                                         qtest_get_base_arch());
>>       data->sockets = 1;
>>       data->cores = 3;
>>       data->threads = 2;
> 
> Doesn't build for me:
> 
> ../tests/qtest/cpu-plug-test.c: In function ‘add_pc_test_case’:
> ../tests/qtest/cpu-plug-test.c:93:42: error: implicit declaration of function ‘qtest_get_base_arch’; did you mean ‘qtest_get_arch’? [-Werror=implicit-function-declaration]
>     93 |                                          qtest_get_base_arch());
>        |                                          ^~~~~~~~~~~~~~~~~~~
>        |                                          qtest_get_arch
> ../tests/qtest/cpu-plug-test.c:93:42: error: nested extern declaration of ‘qtest_get_base_arch’ [-Werror=nested-externs]
> ../tests/qtest/cpu-plug-test.c:92:47: error: format ‘%s’ expects argument of type ‘char *’, but argument 3 has type ‘int’ [-Werror=format=]
>     92 |     data->device_model = g_strdup_printf("%s-%s-cpu", data->cpu_model,
>        |                                              ~^
>        |                                               |
>        |                                               char *
>        |                                              %d
>     93 |                                          qtest_get_base_arch());
>        |                                          ~~~~~~~~~~~~~~~~~~~~~
>        |                                          |
>        |                                          int

Sorry, I forgot to mention this series is based on:
https://lore.kernel.org/qemu-devel/20231010074952.79165-1-philmd@linaro.org/
"qtest: Introduce qtest_get_base_arch() and qtest_get_arch_bits()"
