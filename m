Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2154342njc;
        Mon, 4 Nov 2024 06:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpeq1F8SN9v8h6Dux15vApG3v0Bsleb/WKmLw94ismOKvf6VOh+DVNcCZOa9r8sC5NjiKOxMO0HwrVqA==@linaro.org
X-Received: by 2002:a05:6a20:3054:b0:1da:2e7c:e510 with SMTP id adf61e73a8af0-1da2e7ce558mr21192792637.1.1730730994723;
        Mon, 04 Nov 2024 06:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730730994; cv=none;
        d=google.com; s=arc-20240605;
        b=IwLem1Zn1ws+C060TdX3N4yOUglWEws+aBshFH2BCrsuJ80PnOhLTlcdXldKSKQmpe
         xaBI8FA7tf3RZZhLu+6jgkKMYjMOJf2LyeIRa/vNW86R8xEPtt1f4H0zA4mj1fTSMLNW
         Km4d5endVj3dp84qBZDgr5a5ZOl5tThmTYUQFZDd6aeo58SbxN/1qymHPdNYnELgUUuY
         uz1JW3p3GUgDSKlUzJxfP6JuP7BG+zejfl5Rou5RLMVfj7p1ndz2NqpqR0QL7LyTbdaU
         nunWsJU/4rErA68+lAyTFTjacEpKQqS0eg8XGbonPHZP/NunBxMZbASDMKMM4io88Jvv
         9oFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=w8M/FL/xjMX5xGJffF8YSjnj9dbeNo9YjNKE+lvn3Qw=;
        fh=u7LXuynynhOjUO1++sOMNhRG8/YbxcQvOhkbdPnYThY=;
        b=ilJdx2ZcEgmvhsY+UpFJgwKeZqur+lKWRxZEUybIq95fN2qfRGou8ZNCfnJgB0J/Bn
         yZOHIREWo9VbS1Jy5soYM0EWuEFX3zM0qLg4MBVnGqns+7MXELDUno5qF1eF0Fstbb70
         jv0IpYMa3PJxIdUccodGo6CTp6Z/VnKbd3rq6RjaVaRKz6Za/ysjt9uiUcXEsiHbvoY+
         xargZmL/UDwtiBnJdvGyKBM9LAGGWkHAaDvF68CLZYwSJ+FK2X1MBKM/dgVQ+H1Ciiwq
         DxzipGDcaCIxVvBXq0mSA1Zoale3EypBd3PUCI/kQSgfm5FvFb/m3eKCVpaRNYEuGKS6
         4Svw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbKQfGKG;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7ee458fd394sor4521113a12.6.2024.11.04.06.36.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 06:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbKQfGKG;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730730994; x=1731335794; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8M/FL/xjMX5xGJffF8YSjnj9dbeNo9YjNKE+lvn3Qw=;
        b=jbKQfGKGqNkDQ7/13gGU3gDh83Xb7diBgLEV7+98ll669rlAVoDpZCHWIaVk82vDOt
         aHtdfFMnNnU66PcHJMdfVT703jsrvJ61qRPS7qceXnHQ9AXG/l88547KoTnaw96TutT6
         NyNBF5bjbzS8XfZlraGobWQL0NVxLTIvZV48cXpLW4em82ikPy5qJhdtUzbQUMzZQYAM
         DoTl4LKEVqpHuaQVYL3RozER/604/CzV/B+DPNE8dyJBc6u5UzReVHQkpcLEKovPGKeb
         8zybFtjMoNGTjWYfxNyGSpBrMy1WDqsR4L6LNLuOMSjqRsXAJFyT3WP/MZbadOEZTqnU
         /GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730730994; x=1731335794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8M/FL/xjMX5xGJffF8YSjnj9dbeNo9YjNKE+lvn3Qw=;
        b=M0Kiw5rkMQJ0DIwBUrBY0Yc9IpDjCPQq+0UhWYCoxpCfma+og8rdZnFLm1NG5DYNlw
         T66P/7EG/Halzv2rFULSgKlwaJd7s/Nn6cIl+h5UHPaKWFl84C17GQ1Dd5JaB8SsczBl
         NQILQh2auTW1sAUGglKK38XYQk2m5PnEwZT0E2ZekF/636Opbpp/QODROKlWo/rM9tqS
         aKskCP6LALbNrbWXe+VoJ+1O/Pxed7M3UTr9jESHevdYUPViGqpyW+RREmP/6TBzMivH
         B3sj1oz0h7TEBFgRmJPT+m9xky7hEopZH3eDYohrSlKrmntnEwjwJSwArml9F3d08qnv
         WpDw==
X-Forwarded-Encrypted: i=1; AJvYcCWSC2fG6eNNo7sUNQRpMt5bfDhViORErouOpVYUPVTshRtFMI72Jefe1XVTA1fzx/zHztWMaGqIPswMWQ==@linaro.org
X-Gm-Message-State: AOJu0YzeHZMpbGgCKY3b9h0E0O9ZSze92nDDEdESyzAE1AmtYt4rvmRu
	Q2dKkfFPQt+mi0S5D+tynIKSN2SzCZ+P68RvXk984bj6W5AKMGThY4x8xN8yaZ3YlA==
X-Google-Smtp-Source: AGHT+IEfofvv++LSViFzOXpu2nP2BPbSQMPosmxNaaD7qa8vvCNAbxofsOIg6HSuELn7xjsAi8QeYQ==
X-Received: by 2002:a05:6a20:121a:b0:1db:a33e:2c6 with SMTP id adf61e73a8af0-1dba33e02f1mr13030321637.18.1730730994211;
        Mon, 04 Nov 2024 06:36:34 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] (200-207-104-238.dsl.telesp.net.br. [200.207.104.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e592asm7530342b3a.60.2024.11.04.06.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:36:33 -0800 (PST)
Message-ID: <d8827389-1de1-45b6-b572-33c6697f3b13@linaro.org>
Date: Mon, 4 Nov 2024 11:36:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Enable FEAT_CMOW for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20241101013541.883785-1-gustavo.romero@linaro.org>
 <9994b8dd-0522-43ff-94ff-1a94aafd5ce2@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <9994b8dd-0522-43ff-94ff-1a94aafd5ce2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0im38ir/TTGR

Hi Richard,

On 11/4/24 07:59, Richard Henderson wrote:
> On 11/1/24 01:35, Gustavo Romero wrote:
>> FEAT_CMOW introduces support for controlling cache maintenance
>> instructions executed in EL0/1 and is mandatory from Armv8.8.
>>
>> On real hardware, the main use for this feature is to prevent processes
>> from invalidating or flushing cache lines for addresses they only have
>> read permission, which can impact the performance of other processes.
>>
>> QEMU implements all cache instructions as NOPs, and, according to rule
>> [1], which states that generating any Permission fault when a cache
>> instruction is implemented as a NOP is implementation-defined, no
>> Permission fault is generated for any cache instruction when it lacks
>> read and write permissions.
>>
>> QEMU does not model any cache topology, so the PoU and PoC are before
>> any cache, and rules [2] apply. These rules states that generating any
>> MMU fault for cache instructions in this topology is also
>> implementation-defined. Therefore, for FEAT_CMOW, we do not generate any
>> MMU faults either, instead, we only advertise it in the feature
>> register.
>>
>> [1] Rule R_HGLYG of section D8.14.3, Arm ARM K.a.
>> [2] Rules R_MZTNR and R_DNZYL of section D8.14.3, Arm ARM K.a.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   docs/system/arm/emulation.rst | 1 +
>>   target/arm/cpu-features.h     | 5 +++++
>>   target/arm/cpu.h              | 1 +
>>   target/arm/tcg/cpu64.c        | 1 +
>>   4 files changed, 8 insertions(+)
>>
>> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
>> index 35f52a54b1..a2a388f091 100644
>> --- a/docs/system/arm/emulation.rst
>> +++ b/docs/system/arm/emulation.rst
>> @@ -26,6 +26,7 @@ the following architecture extensions:
>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>   - FEAT_BTI (Branch Target Identification)
>>   - FEAT_CCIDX (Extended cache index)
>> +- FEAT_CMOW (Control for cache maintenance permission)
>>   - FEAT_CRC32 (CRC32 instructions)
>>   - FEAT_Crypto (Cryptographic Extension)
>>   - FEAT_CSV2 (Cache speculation variant 2)
>> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
>> index 04ce281826..e806f138b8 100644
>> --- a/target/arm/cpu-features.h
>> +++ b/target/arm/cpu-features.h
>> @@ -802,6 +802,11 @@ static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
>>       return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, TIDCP1) != 0;
>>   }
>> +static inline bool isar_feature_aa64_cmow(const ARMISARegisters *id)
>> +{
>> +    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, CMOW) != 0;
>> +}
> 
> This isn't used, so it may be omitted.
> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Got it. I wasn’t entirely sure if I should add it for future convenience.

k, I'll omit it if I come across a similar case. Thanks.

Since I'm using it after Peter's comment for v2, I kept it, and added your R-b.


Cheers,
Gustavo
