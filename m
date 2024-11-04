Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2019266njc;
        Mon, 4 Nov 2024 02:59:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+bha0MFgqmlBEDflolZCULhMd4mEXqwQ2qqEjYXLDCp9t7vQTW6zRF+mzlCiNoK/aLOv+oiWflmvVVw==@linaro.org
X-Received: by 2002:a17:907:9813:b0:a9a:1253:4d81 with SMTP id a640c23a62f3a-a9e50b56a34mr1185333166b.47.1730717967091;
        Mon, 04 Nov 2024 02:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730717967; cv=none;
        d=google.com; s=arc-20240605;
        b=V3mI3LTbrHOiuPYfHlwOBv9PvpL8zohtIjvOgZ6aDBEHaWpfeNahP89U4XZACgKXZG
         msVJ/QDuLxK8hG8liY9lN+doCzYl7AJfnElDcNEFB/1MRvzJkI3M5YbM+yw25BCqh95s
         5o7nQn2zhUK9pIwdjVIFGt4WU3sEUB+l4qt8uCYQdVO0gq03g4yo7BYv2dJBZjqFilfJ
         6y50gv0N9x9NTjXdmxhXkPp7GvsKm05AIRpTGKInHjTDrghe3iky2PysvnbyKHlDSLr9
         1+fU84+kd4puubMc1XWK3jMnETFdJ91T5r6EMIwcr2VjoEbpDa0rH65ij9oYN6M6jTUY
         f4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mz5OMtV/UHaaM9hW7xpbIoTcAeBFVS80t+xWnzGlhMA=;
        fh=pE/vyPT5odSqUnkm9BJXj3X11rAKCo33sT1KnhmeQa0=;
        b=eqpK02j7r2nezx8Is1WLTteQFx3f+YxMF+TD13aJ7LDUqsWCetkVkFnCrNpny56pq2
         0YcGvYBPzG35sfegizGPAzSNs5eTpn5jIrl9ejD0SZRWj6mgUxumZXc7ROWXsCISbzlk
         OrldlOM9DoqtFimHSVUoeSCccO5gxJ9Mmp/keODooleUv9IcED4GnFnr/H9Up0hW5fKp
         LcL6d4UKm3Hd8rVNU/sLQ0vCEixoLxB8dw1nMwTSD+6KeZlCihRQruTrTpwxJT7qDFeT
         l2t1He7BoJhqvIggTKPwrnJv7Ou/3uJgkFdX06eiSw7CZKiypbt4PiY+Pn4wwvXOp6sH
         3FdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EPOYi/Cy";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a9e56485565sor414302766b.2.2024.11.04.02.59.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 02:59:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EPOYi/Cy";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730717966; x=1731322766; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mz5OMtV/UHaaM9hW7xpbIoTcAeBFVS80t+xWnzGlhMA=;
        b=EPOYi/Cy77Vnk212y0qaSfDbWlTP9GdNYCQel8qWzUat0U0dGH0J9sZH8k8U5YKMOg
         fU1oHBfhqBsys0abu+kLbSM8NbpHR2VU/LZQZM1KfVHfi9WDxlkaFOOchlSITreAuQjI
         LBxCXuSuSpmDsOWSYwx8otAu6dO50ujJXqm9Wnupj6dDF9CkHALGSzIojqxxL9nZa+Du
         j+TlntfZ78PY9919yg49F5AmBYsqvmuCOYbEsRavg+J9f02gRjf/tMgJEbFUvDwBpy3E
         srJz8mvqTAuBGM+PzP4YwZZzF/VcDYrUFMSl4EB8ZpczoJnbPmMGVoy5OCapo4bM4Vjn
         RuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730717966; x=1731322766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz5OMtV/UHaaM9hW7xpbIoTcAeBFVS80t+xWnzGlhMA=;
        b=Kx9kellaWwkYZAYaWoEtz1MrcFfzgevhiGQd0PnuYguUee1Jf3r1f9bfqK9k9FRTbi
         +C5GCK+15C6rw0pV1THI7vrH9F1t4CLfd4JhGfyu9bp/GRiCR0HNDWyv5qM9NNf4n/zr
         NNVAFhiRXePOveVJyMQusEfIvaDighT3DaGcoa15k3kYdyBbFtoYUnOHEYqlb4oHzno1
         ZuoVPzHYvC7aLzgW3PT2v6UlpdW0DDcU79lQAUtx9ratKbO+pMvoytucduPEWYRq5ycH
         P66KpI7kvOCIn71/p2wHujpY/v24zoQ5LhupE6BY5BtWKoqZ07Ez4CPvC5u5Lh2Uezlx
         Ft6A==
X-Forwarded-Encrypted: i=1; AJvYcCXo83+gpeumdp05G9WuLLzsdnZ4B+dL6gnhHx6+BrlEYMYZeg8lUIJwcJvQXqjKPxSj5NH6nmlgNLqRHQ==@linaro.org
X-Gm-Message-State: AOJu0YynypYPmDt76wxx1gnCD1U1JJ9oGtSJGvkBND+gsiBLSkGGG8KB
	8py4L2I3QIoSe/dTp6S/idpOkXbtWUd+eOyoOL6audDTkxN0izoOmJOYnPvpcKQlsg==
X-Google-Smtp-Source: AGHT+IErrJSAtuCjMlQ1BeVsU2ECBAy6ra5jp7xH8Qm9FpUreP+5N1mNZHe+3ur+HWzWEjcDF80cug==
X-Received: by 2002:a17:906:7310:b0:a99:f779:ae0c with SMTP id a640c23a62f3a-a9e50916803mr1632279666b.25.1730717966455;
        Mon, 04 Nov 2024 02:59:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([91.223.100.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565ef518sm538538466b.118.2024.11.04.02.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:59:26 -0800 (PST)
Message-ID: <9994b8dd-0522-43ff-94ff-1a94aafd5ce2@linaro.org>
Date: Mon, 4 Nov 2024 10:59:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Enable FEAT_CMOW for -cpu max
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20241101013541.883785-1-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241101013541.883785-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AJg6WqTUwlMU

On 11/1/24 01:35, Gustavo Romero wrote:
> FEAT_CMOW introduces support for controlling cache maintenance
> instructions executed in EL0/1 and is mandatory from Armv8.8.
> 
> On real hardware, the main use for this feature is to prevent processes
> from invalidating or flushing cache lines for addresses they only have
> read permission, which can impact the performance of other processes.
> 
> QEMU implements all cache instructions as NOPs, and, according to rule
> [1], which states that generating any Permission fault when a cache
> instruction is implemented as a NOP is implementation-defined, no
> Permission fault is generated for any cache instruction when it lacks
> read and write permissions.
> 
> QEMU does not model any cache topology, so the PoU and PoC are before
> any cache, and rules [2] apply. These rules states that generating any
> MMU fault for cache instructions in this topology is also
> implementation-defined. Therefore, for FEAT_CMOW, we do not generate any
> MMU faults either, instead, we only advertise it in the feature
> register.
> 
> [1] Rule R_HGLYG of section D8.14.3, Arm ARM K.a.
> [2] Rules R_MZTNR and R_DNZYL of section D8.14.3, Arm ARM K.a.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu-features.h     | 5 +++++
>   target/arm/cpu.h              | 1 +
>   target/arm/tcg/cpu64.c        | 1 +
>   4 files changed, 8 insertions(+)
> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 35f52a54b1..a2a388f091 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -26,6 +26,7 @@ the following architecture extensions:
>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>   - FEAT_BTI (Branch Target Identification)
>   - FEAT_CCIDX (Extended cache index)
> +- FEAT_CMOW (Control for cache maintenance permission)
>   - FEAT_CRC32 (CRC32 instructions)
>   - FEAT_Crypto (Cryptographic Extension)
>   - FEAT_CSV2 (Cache speculation variant 2)
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 04ce281826..e806f138b8 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -802,6 +802,11 @@ static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
>       return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, TIDCP1) != 0;
>   }
>   
> +static inline bool isar_feature_aa64_cmow(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, CMOW) != 0;
> +}

This isn't used, so it may be omitted.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +
>   static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
>   {
>       return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8fc8b6398f..1ea4c545e0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1367,6 +1367,7 @@ void pmu_init(ARMCPU *cpu);
>   #define SCTLR_EnIB    (1U << 30) /* v8.3, AArch64 only */
>   #define SCTLR_EnIA    (1U << 31) /* v8.3, AArch64 only */
>   #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
> +#define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
>   #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
>   #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
>   #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 0168920828..2963d7510f 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1218,6 +1218,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 2);      /* FEAT_ETS2 */
>       t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
>       t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
> +    t = FIELD_DP64(t, ID_AA64MMFR1, CMOW, 1);     /* FEAT_CMOW */
>       cpu->isar.id_aa64mmfr1 = t;
>   
>       t = cpu->isar.id_aa64mmfr2;
