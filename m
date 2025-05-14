Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1329660njb;
        Wed, 14 May 2025 09:53:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQn+BBSMFZH+uQaI6/8nLcVoeZMJ9nnAg3bbM/KQnhIiYV646qYy7yK5VqCDDRLGSq5ZA/trnCDlOQbA==@linaro.org
X-Google-Smtp-Source: AGHT+IHvY4pFb2qP69cH0voCLTJ/JR7MxEm5KLq6FAh8Nu1h9MCVSIGTF667aDqMGMz2HYbXfHSr
X-Received: by 2002:ad4:4eef:0:b0:6f0:e2d4:5287 with SMTP id 6a1803df08f44-6f896e57a51mr58795546d6.24.1747241622956;
        Wed, 14 May 2025 09:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747241622; cv=none;
        d=google.com; s=arc-20240605;
        b=ZvTjKDlL2uOhaO9JEdtTNKJlSgpZ4eJeQTjR8M+wUBzMJlfvMk/DapL3zQHlQ2pDpE
         yrCH2SDGI2pmv3WGT3SdYH0K13fMrRtXQ/SP8wcsN/BAEykAFj5WbwqPkhCQTyyaUUTx
         aBuK7e3Sh1WMOvq5+mKjzpXQT1j/4XO/tZM9XLouIEMVkBZ2PGTVhOTjQvI+RTUkD3GA
         5WNYb851mAQZHPTEoRY92pinLxrXxuv1lrV9hprx6T6eU6s88FKZg+gq5yTW3Y7k0FQe
         DP5kzSqrb3IuvEGf1NBGWv5wA1/sqa1tORkACydCG7RERkTSj7aPasxza6xCfrnLV2NB
         8kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EJDvpjsckjvN0xZPH1wXDoMTsindwY7WPuMUHXI/XOA=;
        fh=4M2uMVvqgd4D86qUSMmW4AkoSdqwequBmjuhPCK9gpc=;
        b=PDZ739iZMphf2VxfmofUJwNxr20qSAF9WcyINP8gQNL6So6+Y3Ox4JarDiXdosIdi0
         Y8CTKk0w27x7+EChFHz9v5SlC+5KH1wkgtRRsD/s3R+E7GQO1svtv19We/OssdMr1Bzb
         RqKB7K8KX/knJF3dUBiYkyuXuS56fxT+DjO3RdeDT1zfG3HFvokm/jthmslsLSjios2W
         3pdOaprnLI8wX1ddOqjpo9N0AJiHz8xFiVSKAMZ7uvf89OQNYdxAaw4vQJlFu6tV5YGP
         rrP54zgD6y4ms67GEcviYENKTgCekjcyiIvj9FaGY6BdIFBql2+cGQjfUPpaVaP2er/s
         Qcig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSACArT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a649b4si136463466d6.498.2025.05.14.09.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 09:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSACArT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFMJ-0002vB-JQ; Wed, 14 May 2025 12:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFFMH-0002p4-5Q
 for qemu-arm@nongnu.org; Wed, 14 May 2025 12:53:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFFMF-00060u-CF
 for qemu-arm@nongnu.org; Wed, 14 May 2025 12:53:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-441c99459e9so213295e9.3
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747241605; x=1747846405; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EJDvpjsckjvN0xZPH1wXDoMTsindwY7WPuMUHXI/XOA=;
 b=xSACArT7WXbRyt4GDoACwBIbYeFQCCcDHsguPHKeKKUViMrrBI2idcjTisMvsZ0xIp
 xiA6IVwXOC5fJA4wqHMZW3Vzq0KZ+stFOGTDp26hp4Ivd7VXZKCaGYa4hlKOaoGmrpJn
 nyoLbcTST327oYJDOQM96at4BcYh9XVCtADnxKZS8RrjnfdfxtoOE4+6NAosIEW3mZwF
 qZaJUToesb31OkgJo7E8ujkts9VJYi42Xtkt/9F3eFLKa27tSsZiksAk+mrqxC5Xhdpi
 eM7cG6tvc5iTIzmvjnv2Z0WU59hLCmwJPfNBb7DQqcqh8HV/UGjbbLvh7HeXcFB8UNRK
 ji2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241605; x=1747846405;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EJDvpjsckjvN0xZPH1wXDoMTsindwY7WPuMUHXI/XOA=;
 b=u+l0hDcHbTH+k9tWyAW8TJYgEKu0jirsfpwhv/+vRNFjgJ7gHm1FbGhnD1M8HHGW+3
 oCoRcaOvWHGcrz5a5luHsz0aGRkoCGdOWr/FWp3wucYAqzrUnREMN/qaJ3Dos8qhYzYG
 G5Tp3Gd2c7eNeuzKvrwZvvNf0AqiTxUjp+eZ3xuqRSFYiNCnniOBb1a41CuOoBXR3Pcx
 oxh3G4zATqItt+6+I6pBhtSvv+fr5s+2Y9bzsLhb0RYQDKVu1mTX1YIvWfcECa1+3sue
 J6h5tTPSjVv9HIle68HByZMkRAM/za6ucxN7SCxjwx9U6OlnfLyi0kPKBlZ8yjdIw8YF
 buNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQUsqRmdm5ruxsFYwXBvP6vOKahWgvUGvdt7RGTbyl/OAg+IoPTN/oxhVjcZiXJuQMF3a0Q6eqwQ==@nongnu.org
X-Gm-Message-State: AOJu0YyZ2tB121JNRNDQcGT39kiiJWuQtE4C1zcdOg77it0DUj9X7MjH
 qxOb7Wl+BTUsicCgXaJAfj5SMLxcR1FVj1MELyjr3/Wv9SkeUaUF4SWxze8PLBw=
X-Gm-Gg: ASbGncultWkmnSktKjJ8C9n7IZJ24cmGhU263tRRMDsI0c31qOLC0jB3WXoZvcTIqUi
 3TGirJ3XoHB6aaHCEdsK/bpp6P1VhIjm7ufOskoUaM3UlgPXIEdbNJ0v2RXGLNArZvYR6lnMlze
 XhxAEudKpCkmEyVLNpshLQB8F0Qw9ssiqpWEJ0oiuTexsdylnKLZNjjQvF33DNzSfMcUMQ0SLcn
 n5n707juFC8AzUZW6UAZSnqgddblMxr3Np8tFbW/3kEI7lP84GLajL4p1+HvpsPo0Kmf6qo5zOb
 qzEHINWQEsCL8uieXwC5IqhIfLJqG98Mo3esIJS7ysDm9eRTTm9Oqu7M8ud1ZmK9N1bypjYlAe9
 iQ9oDuI2l1eE8cmK99g==
X-Received: by 2002:a05:600c:609a:b0:441:d43d:4f68 with SMTP id
 5b1f17b1804b1-442f210de3dmr46598685e9.15.1747241605605; 
 Wed, 14 May 2025 09:53:25 -0700 (PDT)
Received: from [10.61.1.248] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f397b6fbsm37092555e9.39.2025.05.14.09.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 09:53:25 -0700 (PDT)
Message-ID: <f7bcd8b2-2c0c-4907-8a0e-af172c235d56@linaro.org>
Date: Wed, 14 May 2025 17:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] target/arm: Add arm_cpu_has_feature() helper
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-17-philmd@linaro.org>
 <b6c81748-091b-4d61-8d34-beaa0442aab3@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b6c81748-091b-4d61-8d34-beaa0442aab3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eDTbmPM3xVFx

On 14/5/25 10:24, Richard Henderson wrote:
> On 5/13/25 18:39, Philippe Mathieu-Daudé wrote:
>> arm_cpu_has_feature() is equivalent of arm_feature(), however
>> while the latter uses CPUARMState so is target-specific, the
>> former doesn't and can be called by target-agnostic code in hw/.
> 
> CPUARMState is no more target-specific than ARMCPU.

ARMCPU is forward-declared as opaque pointer in target/arm/cpu-qom.h,
so we can expose prototypes using it to non-ARM units.
CPUARMState is only declared in "cpu.h", itself only accessible by
ARM-related units.

> 
> Did you really mean to use CPUState?
> Or is it merely that arm_cpu_has_feature is out-of-line?
> 
> 
> r~
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/cpu_has_feature.h | 2 ++
>>   target/arm/cpu.c             | 7 +++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/target/arm/cpu_has_feature.h b/target/arm/cpu_has_feature.h
>> index 2adfccd9208..352f9d75bed 100644
>> --- a/target/arm/cpu_has_feature.h
>> +++ b/target/arm/cpu_has_feature.h
>> @@ -62,4 +62,6 @@ typedef enum arm_features {
>>       ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
>>   } ArmCpuFeature;
>> +bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature);
>> +
>>   #endif
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 8c9d161f2ef..759636a3b0e 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -54,6 +54,13 @@
>>   #include "target/arm/gtimer.h"
>>   #include "target/arm/multiprocessing.h"
>> +bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature)
>> +{
>> +    CPUARMState *env = &cpu->env;
>> +
>> +    return arm_feature(env, feature);
>> +}
>> +
>>   static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
> 

