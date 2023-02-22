Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp25488ejc;
        Wed, 22 Feb 2023 12:27:16 -0800 (PST)
X-Received: by 2002:a17:903:1c3:b0:198:adc4:229f with SMTP id e3-20020a17090301c300b00198adc4229fmr10617381plh.26.1677097636350;
        Wed, 22 Feb 2023 12:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677097636; cv=none;
        d=google.com; s=arc-20160816;
        b=rVMsEQQWABrXU6SJ/tDsgYKfYgaOPcKzTIBK/LB3/XIjwGPA4k3LtnhJOhpEQMMYIA
         8i1vT1rUsbBvoQns4yzQW3bgKTu526Pd807wJC+Kd6nUGBN9YEbeDF5ekmE/FdDyZpzQ
         74cr1Sso1M8BwBzDGvEXMVYrx9ZHB5ZE+/Pr3jreJBVyQ/QQ1xa0TooRNBID4ACPC0AT
         fOqrveV87eZAFs1dEicv++h3ls/EvGaqtVbS8qAjRjU4FyXKgXWstmUxC3PfzpB3oEpO
         IJ8rxd8WTBBLXFApia6c2Wl73dTnPYCSsvxzhDwcVgwutbBZLhBQ7mUnViAZKJasToYQ
         KO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=u3suQTQejdVMmbjkJadON+zQIkamwSCOXsDJZNZWV70=;
        b=0NQ6axFOrhiNXL6ArX0UG4ME7D12AHq1GEAThtkPaXxvDK0Ue04yCFB3FcJzZTFCJS
         09HV0lgcAZWIuEVQ3NS4Kg8phssJtH2337cQvZ44chSDKxdpyBf28oDYfcK/fnBvKsu+
         h3RdGDxZXlDEoySPZ7dikgmYgzaFikv6+VoOhW3XSuZnUU5HUEGshvhQjNUguHv36IEC
         DMS3OPm8g0+5gmX2qdRpxsZ6Fgq7WgxVzlwtqgbhbiCPKrM4U5FAzgDZjRrOnxvWWX1J
         C+iijGDxj5BL0lC48fqaGuRkXjSc4CZZGP+KStq3cdWsfK0ZaaRV9z6o+MoejWIAnRW9
         MPmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=STVbDD+T;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id jl2-20020a170903134200b0019c97a4c467sor2755879plb.41.2023.02.22.12.27.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 12:27:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=STVbDD+T;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3suQTQejdVMmbjkJadON+zQIkamwSCOXsDJZNZWV70=;
        b=STVbDD+TtKJtIVNtovsHNKlAfOVLilM10IHNfsDlafaoxN0FxJlYOT8suwchN27Efo
         pGmFIK8p8J1zDVMTO6LusJPPxu/bpjhYP9TRXKNoQuTefJW5cPJsftgUjnlJaqCNwrMZ
         ntzD6EM4thXmsXjZIMp8+v/lXlFIK/L6egQjdlLQk5+RXw61b8tD4SLy1QeiNLYVyz1H
         ddQwcV+Kmf4Ote23iJOViFkO0dq+Y9n/nJ8u5KSZCKYwgXGTeKkR8QrtR76wErpPi5Yp
         yAjEjJwd2zBXo7twgyCKSG7Y9tMQmumZjiXO6ZTkSXNjIXAkfuIIReqWloXvYiar/P9Z
         iv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3suQTQejdVMmbjkJadON+zQIkamwSCOXsDJZNZWV70=;
        b=sXrtbyYm5fX3eWpgXU/Vy+hCdzaRWCzrBDEOYBbmkYxxBhMU6LYB590mtmYPgyhCTa
         m1UFK30JoDDqzCIDcZZiBEbF45A2Js2QnRELZySEmDgtImJacP9yb/+0bgfkTwkBkAJO
         VH/ePoIeuM5AJ/EZoUQzlAOhrisWAAHZwftsyMyxRNH7QyCPtpicw4z77fmMS8Ym6uTo
         IjJetOGHHbfpcIgmTj0fPt4E5Kd338/5SraxDkWQ/0xUTkcRB6ckqPsGlpexRjE8l4lP
         cNlUMilOyw+L1B9u1+sDrYTsN1cDNb+voSib5jt1TJGr19ZzbtuM2b3HTxZHfvB6rarv
         PexQ==
X-Gm-Message-State: AO0yUKWow6IMM1PCt+/QHX0VU8uVpHYlgibtP/OIQRSPtDzgWE6vmqv6
	k4tYzkK8KHWCN2nb+lgcs9Nz071yQo7uqw7O0Aa9w23O
X-Google-Smtp-Source: AK7set995nRzSUSDIF2Yk2pB4seoqtKCtNwDT5lRtuOoglk7lZ0GpEtHI6PwpZfL3OFbcZpb5yx+mQ==
X-Received: by 2002:a05:6a20:442a:b0:c7:6475:4882 with SMTP id ce42-20020a056a20442a00b000c764754882mr10489091pzb.2.1677097635775;
        Wed, 22 Feb 2023 12:27:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id e21-20020a656795000000b00502f017657dsm560501pgr.83.2023.02.22.12.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:27:15 -0800 (PST)
Message-ID: <82e90bc7-8883-62f2-a6a1-9b90e032c667@linaro.org>
Date: Wed, 22 Feb 2023 10:27:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12]
 feature-detection
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-2-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-2-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: tspet8O8UebO

On 2/22/23 09:35, Aaron Lindsay wrote:
> +static inline bool isar_feature_aa64_pauth_arch_qarma3(const ARMISARegisters *id)
> +{
> +    /*
> +     * Return true if pauth is enabled with the architected QARMA3 algorithm.
> +     * QEMU will always set APA3+GPA3 to the same value.
> +     */

This language isn't quite right, since GPA3 only defines values 0 and 1.
Perhaps "to the same result"?

> +static inline uint8_t isar_feature_pauth_get_features(const ARMISARegisters *id)

'int' is a better generic result, as 'uint8_t' is 'unsigned char' to the debugger and 
generally printed as such.

> +    if (isar_feature_aa64_pauth_arch_qarma5(id))
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
> +    else if (isar_feature_aa64_pauth_arch_qarma3(id))
> +        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
> +    else
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);

Braces with if+else, always.

That said, exactly one of these fields is allowed to be non-zero, so we can just 
unconditionally OR them all together.

> +static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
> +{
> +    /*
> +     * Note that unlike most AArch64 features, EPAC is treated (in the ARM
> +     * psedocode, at least) as not being implemented by larger values of this
> +     * field. Our usage of '>=' rather than '==' here causes our implementation
> +     * of PAC logic to diverge slightly from ARM pseudocode.
> +     */

I find this comment scary -- "diverge slightly"?

All I need is once sentence to indicate how this is mitigated (by testing pauth2 first 
where required?), or "See function_foo" (where there is more commentary), or something.

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 72b37b7cf1..448ebf8301 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8028,11 +8028,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                 .access = PL1_R, .type = ARM_CP_CONST,
>                 .accessfn = access_aa64_tid3,
>                 .resetvalue = cpu->isar.id_aa64isar1 },
> -            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
>                 .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
>                 .access = PL1_R, .type = ARM_CP_CONST,
>                 .accessfn = access_aa64_tid3,
> -              .resetvalue = 0 },
> +              .resetvalue = cpu->isar.id_aa64isar2 },

All the code adding aa64isar2 should be a separate patch.

You've missed initializing it in kvm_arm_get_host_cpu_features and 
hvf_arm_get_host_cpu_features.


r~
