Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1485806dyc;
        Fri, 4 Jul 2025 15:56:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhbhkD3Dhj5y713Y1Vy5AcwnRGykx4d79lKAp9oSCyXu9uVZvJNAsXNDg9kEyJKWlb/quncJauhXHSiQ==@linaro.org
X-Received: by 2002:a05:6820:2002:b0:611:a5f4:42c0 with SMTP id 006d021491bc7-6138f9c3c2bmr3304495eaf.2.1751669773999;
        Fri, 04 Jul 2025 15:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751669773; cv=none;
        d=google.com; s=arc-20240605;
        b=X1BDQFZSwjvY1OkTdjuRYR6N5g97jDU9csTMa1gHKkYXjcIwPiHLzvDohxDYH5wElT
         +2jIfjKWmetKktQhyearwckQgp5vlGy8SIy8gRDxmPFwBCkkVp8uqjcK+H2ZsKkADlLT
         wuzk5aTz7ezSpslrWo2/MpQjVQjNkgR4LkaNa4jddg43wpC2iG99ieCOvzcPr5LweGAk
         Y4NQ2QDy5+oxvDOHS7zthWxPxHH8JqpbL4eXITutGieJKVyhuycpextEHmfusmNB/PBy
         PDfRZR/uiUfp/oV8mUDuxZR6gRVVEOtS9ksgIInTeJdyCP2I/zPv5KJiqrelTfDS3O4X
         rUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ou+0WFq2STWCoZpLVCiZpnuZ5I6nDVFyUDgY7umpZLg=;
        fh=zYYfNwjICBKN9qYzCqZieMeF7sphT3S0R2dOKxavfkE=;
        b=hPmBKgQHtPGCFX7k1x1Uz1aHqz/RAESFNtpu40yB3Y07+wOwemUl95XzZ6na++8U1U
         2J+COBZyjUSKNOeUzSg4l76OXdZDiVcawbThFsKI/Yysiz80nfHeNzugRmcn2QdiZN6/
         w4goIqGy8/ak7Q7nbU3kPRL/jgimPqYyJQqsSz1Pl8mPhBQ17W7gTjt988hw7ARMUIA/
         6nTW0F8DeMWJa75OBVeTCnImNiQdctwMfdpPkc5s8ptBGQudcRIjiNEtI5d9GwOnEErd
         2EFNbnZuKo4iMzgQ2g4k0r7OJ6RUnA3Xo2vT8TyDtGTwzRG6XdURYi4hBwkH4XqjUIgR
         +JMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKboQHqN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 006d021491bc7-6137cff3b97sor1018910eaf.2.2025.07.04.15.56.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 15:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKboQHqN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751669773; x=1752274573; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ou+0WFq2STWCoZpLVCiZpnuZ5I6nDVFyUDgY7umpZLg=;
        b=JKboQHqNaNzP/CgYL1D2GMo6p386MYREAnrv2iNY5RBHR6zHCcv/gH5fgaxTSc+Bf+
         EmDvu5ZFwRxfSGCMlgLRjGNF8m00trwLfVMaLFXhIXzvj1NhjxV6yGIA89xBpkhYMU6D
         Mjnx2FySRi4Oy6D0geXMtgYFMHbb+6jR+GFD+tYamVhFTcLA7QyceZlGDMEHI+0vL73J
         VXlHct5+sN8D+dc1QrS0MTAi2HieXdDrkyI7LNCF3s6yEJcIuHazvFsO7Vb0+blOxHKY
         8mbQ8JHoZxS2kmvupTf2aIDNQG6Zta/jwQhSCUwJJJQNoc7OjkO0GakeTKKVwgiZCYrf
         9WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751669773; x=1752274573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ou+0WFq2STWCoZpLVCiZpnuZ5I6nDVFyUDgY7umpZLg=;
        b=sSFHXIQd+9GNxkYCUXsbMHm9jiAIBpeupWSIzRMrw+z/DLVc59MyTtAOEF3W/JaGyZ
         MDz+vfMp57z8gYnW/EzoCbe00pr3iIs6y1GN9GeEj0pKgyJtU6lIvGKzs8kTN7lD8MyH
         w3Y9vVyXUDEvUu/c+sRb94mNAqOlLzNZseuPhprW8VO7BX2T2fvU0kM+d6m10bgQjOMV
         7GKqB1k2FHQYD5f4ofUfXb1t07uGAGFQgJovdHP2PwnK3pRnVzGEnIEw3L2DAxXQXlfB
         WL7mNIwLf1NCp3xK055VRgH9p8Hcqwo3xShM/HZkEYl85i2KMKiLoQ9qZhkZiFWLjkxa
         6RbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEMHCdsZfy5cLYDN/Z6ACIiekprDduqp9yEFTUApiz1a13pgl5NytxOI4UJfzvMabGga5MCoimFtGq6A==@linaro.org
X-Gm-Message-State: AOJu0YwmBkP9skiyqMPbhoURBfF+s+haqlBlAotbzo5cINp1uckKazT9
	J4gGYC9VKkjArAGJGHbjLXNCOtRvg9k/Kekm2zGvvyHuSRLPrQT0Cn9yPOflJdGxCawxRfdAp7l
	fAFO4Fi1uuw==
X-Gm-Gg: ASbGnct5ekOes8alFjHFzz9yClTOoqWGDZQ4u65/yl62OPiGpgQ1DzzDHFbYtrhZmXs
	aFnmqgzzIyCGOvU4yM33rZGwrYU5vPxlTbi8fHpUa21ujf/ZCW1HJRSgbAphMeHWSXw4meNkm3/
	sykFR0chy9qS7QhgG8Fkk9p0Bmn/s67aEyAAR9xG6Vcqtnq9dYxR0CQmVFvbsoDpbMIXd5kK93d
	jb7fh1HLqDsPacwM//wQc+2F7VXEPBqHghkNajI4Vkiq1Cc5LZnqWl9w8oYsgPrFgcxcmn+A7bQ
	EMJvmtcfuhiau+DveHULiMLkuV2wqfHuKym3+eiwlzEzsXbiQQ3R/aHiiiX7U1DjvK+g28owVKP
	gchsI3twZKNTliHejARs4BETBGaneCcq9T9MqMqRroE72OM46O6o=
X-Google-Smtp-Source: AGHT+IHTawUUsQ6glpnrHxTd7cf6x0AI/Cp0cZaPjYUbdedgO91BKeT6aj2IZmdR7czXYLDweuv4Fg==
X-Received: by 2002:a05:6820:4684:b0:603:f521:ff26 with SMTP id 006d021491bc7-6138eaf3c4cmr2810056eaf.1.1751669773427;
        Fri, 04 Jul 2025 15:56:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6138e5b8c9fsm422819eaf.34.2025.07.04.15.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 15:56:13 -0700 (PDT)
Message-ID: <af3c8b1b-63e0-43bf-8d9a-6c6bf699fa97@linaro.org>
Date: Fri, 4 Jul 2025 16:56:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [WIP-for-10.1 v2 5/5] target/arm: Advertise FEAT_MEC in cpu max
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
 <20250704151431.1033520-6-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250704151431.1033520-6-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lp60X6fzGhzY

On 7/4/25 09:14, Gustavo Romero wrote:
> Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
> first step to fully support FEAT_MEC.
> 
> The FEAT_MEC is an extension to FEAT_RME that implements multiple
> Memory Encryption Contexts (MEC) so the memory in a realm can be
> encrypted and accessing it from the wrong encryption context is not
> possible. An encryption context allow the selection of a memory
> encryption engine.
> 
> At this point, no real memory encryption or obfuscation is supported,
> but software stacks that rely on FEAT_MEC to run should work properly,
> except if they use the new cache management instructions, which will
> be implement in a subsequent commit.

You really need to implement the new cache instruction before exposing this feature.  Like 
other cache instructions, the insn can be a nop.  All you need is the accessfn to trap 
when EL2 and !SS_Realm.

> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 611d7385d8..14f17febe2 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -89,6 +89,7 @@ the following architecture extensions:
>   - FEAT_LSE (Large System Extensions)
>   - FEAT_LSE2 (Large System Extensions v2)
>   - FEAT_LVA (Large Virtual Address space)
> +- FEAT_MEC (Memory Encryption Contexts)

We probably want to document that this is a stub implementation.

>   - FEAT_MixedEnd (Mixed-endian support)
>   - FEAT_MixedEndEL0 (Mixed-endian support at EL0)
>   - FEAT_MOPS (Standardization of memory operations)
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index e6a731472f..009618fd9c 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -603,6 +603,11 @@ static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
>       return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
>   }
>   
> +static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr3, ID_AA64MMFR3, MEC);
> +}

This test (updated for master of course) needs to be in the first patch, because you're 
using it in the implementations of SCTLR2 and TCR2.  So patches 2 and 3 don't build alone 
at the moment.

Alternately, implement SCTLR2 + TCR2 without *any* other features which would enable valid 
write bits, and then add the MEC code here.


r~
