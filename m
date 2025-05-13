Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp423372njb;
        Tue, 13 May 2025 03:41:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlj84UqZ6pvNw9hkFnr3qqRZAuOPJv0gcT8YdX+QYPrBQxWuIMhaxqej9SpTrTil+8/YZUKpAHmIjepg==@linaro.org
X-Received: by 2002:a05:6000:40dc:b0:391:23de:b19a with SMTP id ffacd0b85a97d-3a1f643d7e5mr14542968f8f.31.1747132905975;
        Tue, 13 May 2025 03:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747132905; cv=none;
        d=google.com; s=arc-20240605;
        b=TSq0vXi2Tqer+muaPtdEgYzUFlNgFodLvWc2h8jFWkm/yDWigAFeCo0FMyvh6Zkn5j
         ULdwg54ccdUcuKH1vH+00Dx5WaB6VI4x1uQvFC4B/CUaJsVk9FynGyDRQipU5S+1dZAE
         kr3c0M79IjzE8DHvFVkJBHmXP3wCo8pFeL8cnl+YgmYjW6IMub1tVraM+C+tbzRDrFab
         e5jU9kdPHUyeEUy1AYHOQKhYcNSq6nc4N/RmyCSYbpvosSgtWaX7s8iFPC2MFWt9Ra4h
         b+SPS5w/gCYOOeLCCOZaEUVCS6XJ6r+BBVNvea8Vlxl5xuCN31Rmkkv2kwm+OjLMd+GI
         9v0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FZfg5AI2wrxSnX+jqnGfkFMNeBi5XS88rO/72M9QLbw=;
        fh=8TShTyjtnzmh1d9iEdn5ZzgWRpGxVCN9Z3+RjGsJPa8=;
        b=Ja/FzLxHG/5J10Xne/M4nZEZqws4QCuOQWLaPEhxlNp3NxG4gMjLX68vJnve1TYalJ
         6BEd+PVW3NtQc6TvvZtu08d7Sced697qmUQPW/JJmu9pte+obLr0CEKFnk8MOSEEfNfe
         8l3ey40t8hnt0HYjzEf9szDSCy03cDXv6Is7WrKahyjOVFAGNQzomo+XQF0g4vyt2bzQ
         ulbKcYGj0SPZieVa/tOKYnc0Thpvzo+T/B2B6hM7gbLAa2t+AJAHpEVXR/+VrgvLE4Mg
         KpYb77pZ7jXWQ08LBHdoyCSWYL94IVY1+DXWRD2PVafS3tM4OfqmZbSiolBqfadpT2Hh
         t+Dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oh6FPUuN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f5aa6b15sor3535887f8f.9.2025.05.13.03.41.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oh6FPUuN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132905; x=1747737705; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZfg5AI2wrxSnX+jqnGfkFMNeBi5XS88rO/72M9QLbw=;
        b=oh6FPUuNFtX8U5iLWP2L8boFskpFT8VesXFjiawXNvD8gn3Wb2pjDKAzVkexFLKlVi
         Eh1GOeqboYQrd0cg8a/rDKqy4zRps7kYdEwi7lJkY6XnqHzfLVJMY08CWKAbW4VNIefs
         IqsYugw9c+iEk7yMVS5c8aJZenR+e1l++KC4Oq78tKQ6xmnFTFNk2zuLA1p6lAKLUVrb
         OwwyQV3xH8bIG62bFbQAUIyhB1lXs/vthyyZCROl5BLzdQNCmonBe33Dd5I7zsbi/HsW
         sSR3HTgdlvwkSDrT6sd47nFb18qnVS9jmhjEG+gesdzV7lNiGyQlufxBB4XCnb6F5xnO
         cVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132905; x=1747737705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZfg5AI2wrxSnX+jqnGfkFMNeBi5XS88rO/72M9QLbw=;
        b=iaiMEjLsAKaTj2VYXZHdorXEOuulXczhb2OC95/U6+eDUZdrvVbo2KtNLfU36NIzRf
         7Mg0x40suuLsv6XKvl15tPIriSyqMS5nCNSZp6G+b9CGLJ+vf7CDOqLMgUuwH8d3UjwG
         myeROpJB756nCPHCsRHpgalORFCVJbeRgwgq3NmBYgPhHUcxLbeqvNkhjrGTEXt3+zcT
         s1PJ53/UGNbyzfTdLH0t0E7SDkozOusnc9mKR+fQywMp/XFHF6YAH9xokOgu5hjYNRMC
         yoGOeJf9Z7uvxGVpubl96/8saXmXgUJ2mUmL4Hh1U6Be1lLKBCxbziu8KhBf1mIQblWj
         4Ysg==
X-Forwarded-Encrypted: i=1; AJvYcCVkCaAuJyIqqw5hR6EEcRhULaZfaNcEeBn7pQ6FHTpQAwp/jkZ14dSn37RdF83rrMaooh9JxAyyoJisvg==@linaro.org
X-Gm-Message-State: AOJu0Yz56c5z2EWSvE7ajO7TBToGJ3Ea97YIRPbHzJVeaprjqpP2mte3
	psQIKncb20+vwtLKaBiLTzSLJfaMRIUDeQKbICgzPYMVF9neluWyVp2vcIAwoz9EYg==
X-Gm-Gg: ASbGncusXz0Mk5WKyswchUbp+sLJmae07PUWENPc205dAUgfQ3kXG0KDDoIPipF0yNw
	cuJRu2NoZBYZJodPOmcCL13vHGHEwhFQSSRBydh74cf7WhOLjG6sDEAImW1tQgj+DzcFUJmNifX
	0/5mZvrVAbJ3XB3UWF/uTE0OvuCn6+l6UEqvCHtsjwbaMTCB2V002cb3tjlggkYERnBU3LmCc2R
	nyO4NujCg3wsuq3Teq95bunqlkTNiObUq5uW7fL2F58uptxiAmeSb7ATo+MSRYoNUJG3UTlELYr
	mpiDO82l2o4HYPyf62T2iZ5XruNVu33qQjF+J7nTAeUKyzLw6INtnnK/icODI0kzLynM1QcbtxE
	dwOQo42bIbhYEFuhoK1regMBuzGcj
X-Google-Smtp-Source: AGHT+IHtjDxcFamTEzcXxzi/hHZllWxOf6YDpL1W23amCk7IKRTeNkY7wBHcB/icbLzMl2A/GC0boA==
X-Received: by 2002:a5d:64ce:0:b0:3a0:b8b0:441a with SMTP id ffacd0b85a97d-3a1f643ba6bmr12118934f8f.25.1747132905377;
        Tue, 13 May 2025 03:41:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca31sm15841490f8f.65.2025.05.13.03.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:41:44 -0700 (PDT)
Message-ID: <91cd9b9a-8c67-47d3-8b19-ebaf0b4fab5d@linaro.org>
Date: Tue, 13 May 2025 11:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 30/48] target/arm/ptw: replace TARGET_AARCH64 by
 CONFIG_ATOMIC64 from arm_casq_ptw
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-31-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-31-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: p7AnjcWoIOtq

On 12/5/25 20:04, Pierrick Bouvier wrote:
> This function needs 64 bit compare exchange, so we hide implementation
> for hosts not supporting it (some 32 bit target, which don't run 64 bit
> guests anyway).
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 68ec3f5e755..44170d831cc 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -737,7 +737,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>                                uint64_t new_val, S1Translate *ptw,
>                                ARMMMUFaultInfo *fi)
>   {
> -#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
> +#if defined(CONFIG_ATOMIC64) && defined(CONFIG_TCG)
>       uint64_t cur_val;
>       void *host = ptw->out_host;
>   

I'd feel safer squashing:

-- >8 --
@@ -743,2 +743,5 @@ static uint64_t arm_casq_ptw(CPUARMState *env, 
uint64_t old_val,

+    /* AArch32 does not have FEAT_HADFS */
+    assert(cpu_isar_feature(aa64_hafs, env_archcpu(env)));
+
      if (unlikely(!host)) {
@@ -854,3 +857,3 @@ static uint64_t arm_casq_ptw(CPUARMState *env, 
uint64_t old_val,
  #else
-    /* AArch32 does not have FEAT_HADFS; non-TCG guests only use 
debug-mode. */
+    /* non-TCG guests only use debug-mode. */
      g_assert_not_reached();
---

With that:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
