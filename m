Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp373159lfb;
        Fri, 7 Jan 2022 12:29:28 -0800 (PST)
X-Received: by 2002:a62:8ccb:0:b0:4ba:c613:2211 with SMTP id m194-20020a628ccb000000b004bac6132211mr66064849pfd.33.1641587368148;
        Fri, 07 Jan 2022 12:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641587368; cv=none;
        d=google.com; s=arc-20160816;
        b=zpyGfVXa6idZWRYQFgnalpLS5RvW1ZvQ3mEkNWjqZYiQzMNRmpBWmHI90EeQy/WUmb
         GsmSxSI6eHcBZJH2IC2vL+dUlaW7osIYIhNIJWplxVwabC/ikU4aagLHerkPzIKF4U4W
         MOjvjB0OZeba1Tasm54UVDhP0bRLl/vAgSeOAACPE/LecIZgVcYGYqSbj8nPGHRO3V2O
         1+QPetx2KQ4v/wQy6Oddl+vgLDZ9GkB+y/z7IBjkb/C+B9STRz2wkMddPGelsj+B/KDa
         RZnucvMqeI3YgyuX3cBsQzxMkZndXC8zfAd3L0bFCAn7imBCOZR66V1EiFhTu6NqddRF
         /M5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pqzFHF17NqTJ1RO+IP8GmJaa+kOZt7zsY5kZcze0vfE=;
        b=c5Eb/4Ec5Ve+8lHC6QwY7XEQv161JrzcBZy9BIWopMUqx0DGc9FgU2XmeqEr+BBwmV
         rqRUMWIk2XGWeOZOJzCv1w+F+FVrBwjpw2m6REaBmCftGbW0YC918PAbp/pShQ5HpwDM
         ejogfMjs4E4u9aLAySNeESozaV/7oz2tq2aKdSmDYzCgSt+P2JWB0uLAdyXg1QbSQ6rm
         ZPnIXioroQkNpO9RSmARmS3PPfm8EKjx5WfHAfvz4MH69uTO+EQif4dRKYE6+hEZMTTH
         xvb/KH4kTJv5FO3NBznblPF59VcmTsi69ORUAL8Ljarqc/pzTatUzf3+DQCCJ9b0JTne
         t4Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUosrT+p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b13sor3392920pfv.69.2022.01.07.12.29.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Jan 2022 12:29:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUosrT+p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pqzFHF17NqTJ1RO+IP8GmJaa+kOZt7zsY5kZcze0vfE=;
        b=ZUosrT+pF7jZwpkz3oXtHFKEDOxmHVKXTBbe2/LYWDMpgEAUS/pF7RZmbXRLiIZntj
         rZMJbV27cyvjXob5c16r2gZXXlLGY6eOk8wOBpipK9n4j9Fdxz4nfJdyhTRfpP++2iIt
         MIq9gAdGqe7uJ7jOQ/Ee5joAri5kTmNANTlvNjxxRShZUsFQv8Hp+vtdcK57RwhazaGY
         KVbzC1yiSiWPOTC1FQb6a7Oqpa5RL8JaA1KG8G4+H7cpEGkv/FfjEHSBJRjcDN412Wp3
         bceuNyzJZ417dv5lhFAimdu2huU8ttKW/mR/j5fTf1jXop7HDEiJShu+eLAJ1yl7QSk7
         SIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pqzFHF17NqTJ1RO+IP8GmJaa+kOZt7zsY5kZcze0vfE=;
        b=JDj54cgK+x26dJ7vFggmTHPhuBGEc/2SpfI3x6QsQz5025/GVN2TLOJ/TzotsjpnHM
         opa6kaEOhS9zevwIeVDguEmUU/yjxuZPBdDThQezA8ofxp5Cda/zNwI5u2m+UJRmulAp
         lxKpC2j/bEXpfAeg/ldsMbqvONd86UgvnrqUe/Va7gsg5oGqFD6PwVVvkyUyfZsUs4vH
         8R+AlauFdJSjcXCCOYeLENc5HyVsv39fuap05IsACFuF3UpmYXkrInwVyKelTNiiO+jc
         MRL7CwmN9tbYCVzGkgHO2G5S7BZV86aVV17RruIevgbMtui+/v5hCyqE3ydzAJkYl+iw
         1dpw==
X-Gm-Message-State: AOAM532GDw4UOOzPDwaWxiraCYB/a4VUi57jrWHsJ83xzCj1LtbAe8Me
	O+atKZ75t/BAueW+JCeV2vekfJnJLTsJ61th
X-Google-Smtp-Source: ABdhPJwHfQv/Z9xLyjvhVG6aPgz1bqpbuR+xy+EksppGwwaHeh0/nn2H8hZYAGPL1ArLp2lE/5gXLA==
X-Received: by 2002:a63:7983:: with SMTP id u125mr49259195pgc.569.1641587367625;
        Fri, 07 Jan 2022 12:29:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id ot6sm7240115pjb.32.2022.01.07.12.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 12:29:27 -0800 (PST)
Subject: Re: [PATCH] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex Bennee <alex.bennee@linaro.org>
References: <20220107155406.344273-1-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a8576f3-2e45-a58d-7a56-692a8bba54f7@linaro.org>
Date: Fri, 7 Jan 2022 12:29:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107155406.344273-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: RP52d62EiCDu

On 1/7/22 7:54 AM, Ard Biesheuvel wrote:
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 15245a60a8c7..3dede9e2ec31 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -903,9 +903,15 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
>       return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
>   }
>   
> +static gchar *arm_gdb_arch_name(CPUState *cs)
> +{
> +    return g_strdup("arm");
> +}
> +
>   static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>   {
>       ARMCPU *cpu = ARM_CPU(obj);
> +    CPUClass *cc = CPU_GET_CLASS(obj);
>   
>       /* At this time, this property is only allowed if KVM is enabled.  This
>        * restriction allows us to avoid fixing up functionality that assumes a
> @@ -919,6 +925,12 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>               return;
>           }
>           unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +
> +        cc->gdb_read_register = arm_cpu_gdb_read_register;
> +        cc->gdb_write_register = arm_cpu_gdb_write_register;
> +        cc->gdb_num_core_regs = 26;
> +        cc->gdb_core_xml_file = "arm-core.xml";
> +        cc->gdb_arch_name = arm_gdb_arch_name;

It would be nice to split out a function in cpu.c for this,
perhaps arm_cpu_class_gdb_init().

Otherwise this looks like the correct approach.


r~
