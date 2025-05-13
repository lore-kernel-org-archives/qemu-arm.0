Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp408586njb;
        Tue, 13 May 2025 03:10:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULK7vWzG80Z/L3CHpuIG/wf11vGnrW2o6L048D2BbuWiLUr8Gox0kAcu/TkLHliqKstzZx7rKuXKnVgg==@linaro.org
X-Received: by 2002:a05:600c:1382:b0:441:d438:505c with SMTP id 5b1f17b1804b1-442d6dd515dmr129757145e9.32.1747131006155;
        Tue, 13 May 2025 03:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747131006; cv=none;
        d=google.com; s=arc-20240605;
        b=IEZfdZGTGFnJBWZ2xiJCptPy0m7tAtg6derdeMjCMf5j15a30+jzs4khPn5Z/L1DXs
         fqP1HGpuh3CjZcluoHf7eC3YiiU321gb5V4+fm3N/NhVXtK2ChswRiMh0L4HlnYgKawu
         GWU3TWd2pkwLk7Mg1YyWVHHDziiPjATPPQavYTKAMWetpnIm9HDotsuIMvvavadAjxGT
         fLUyYQPpE+ZA9hQATdzNwa+wMQbIPzqb2YDHTPbFgz/oLmvtCflV49b09XGOTcwaKGq7
         EmQ/T+10zN38YuBFtxBELaNOYN32IM6SmNI3lwc/E3GR7oX6agncEm5EAU+ZUo50ohHm
         /oeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NOAigfDLRAGWVzplLf58yZ9Svxs+dmsZC52tDhTGccQ=;
        fh=0f2b2M8ruocPre/UO78UMvPvEMaAKXofdQGwx0ekWu4=;
        b=cic7CbOBkMkAspqv4d1dgsX0Yr+FZzzvopdxT/h1l7jQ0iboMGborJc8a3Cuad3PKb
         nj9MhTX24WAh3cnJPRDul3DRyYttvZbElqaZJmo/u4xv+0qD8IDYR8pmjXASvT92BK1f
         LCjr9fhI7nqZsPnTie1/Yb0Pe5zNMmeQg7AUNOL0hYduGBxoQTLmVieeHL4cQJ/1k3Bq
         rk07+OJlhr+ar5SPb2s7nRodvkauzkWRiSbBZ2HmGwYQwmhGItNGhpC81JabMoq4TDED
         /aj15ZVVSvan/n2OsmHFHUfyExl//HJBJKr/HVmXGgNBLcBKrVyYijSe2OAfa2GUPL6a
         a7kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0zIHj9p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d689c791sor33936295e9.8.2025.05.13.03.10.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0zIHj9p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131005; x=1747735805; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOAigfDLRAGWVzplLf58yZ9Svxs+dmsZC52tDhTGccQ=;
        b=Q0zIHj9pvBtFs0CVBENkaWElBqnZb3JxH1wmKwOPLg5wm+jVo2UWKGVS1IA9VSR1p9
         4ioPKP5vWStkrxEEolYbIGMew4k/XEeUH5WpI+gnX3DuaI2UBJMq/aStlct+ZCZ6tGQO
         bKFy5oxBQ/Am7gSMfyHyl3cxdD7j0ZZiRBaUAPG/hHLoFYiVWKaBMouCIeL6fmsP+4AD
         EWI4GvkT/BWS63qYWC5ieegL9fpe5otxWU8p3uMOV4sAW2xDxbmlNwkMvXcAGau0vfjr
         nDbYnpz7ORZQDKSdKDQL7koHXGK5pJ3MlazR+p/h8wRHmDpEmLtYYjNSeCqyHARswoJG
         lBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131005; x=1747735805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOAigfDLRAGWVzplLf58yZ9Svxs+dmsZC52tDhTGccQ=;
        b=cmEpN10TIPv5mCOqRdlIXnh+IT2cpR9sVc8MmcH7JNStgLVcKrSa71pXwV6uvcmGQZ
         s9W44yJgNZxEmeVAHXPBP0xF2uJix7W6xt5p9uqP4jY/VwWwZzIdYDAFehJP8TrF/KAD
         Uv310aqu6RSzBetLOQkXN1GpnGmsibiHuY4bWCS1hlPvXHRfWoHBHLDFQNNCanITCLpU
         xHyw6vUJrdrNd6ps2Bh0lrMt3gdvSbVZnmeqNotTrwZT+LW6F77A5qexiiScp5YSC7WM
         2KHtSeJwnpLssl8R5sMKGoxMubgae8JZkGnlhHfMNO8Cpo3JVo+0//Ap5/hDRuLT/Ldb
         K5hw==
X-Forwarded-Encrypted: i=1; AJvYcCU1M4RKLfMpsnt8nOVnVbtaeH+kTb8NxTrK/C5E7Fnn0lZLt94TTxrEikwfz5zOMk6KIKnkZXqaZBBKSQ==@linaro.org
X-Gm-Message-State: AOJu0YwaUssL0wqEVcIKKlWDm6sKiHD9+j/Ew0n6hF2n47JUbMBppHP2
	EVPlNcI9sPWMuDuUnXwMvM1hOVQDr8atrBorgYjv+e+IUOZnXKBT0dCU99VTaf6NTw==
X-Gm-Gg: ASbGncsqHQZmdTWWsktMfxZulLjQXbP0FiHyCHBpLiW5oJyG3Vf3t4zxsahYQUtAzS3
	g5eHMpz5yZgNkXUapssxsN28+1k5u9c0QdN/yRG/D45qNY9+7DLMIBxZ0/VT+bMaC4tknGZXigu
	PFzloFlQGRXjceGhH+C3bEQG4JUF5yoUQuC/KzF6Xs0gB/OAmiXizebXi5+QfeRwxiRZJj0vN4R
	uIuvI+GnmJ1xIT8G0+FWulHKE9GOYmfKQY9ecC3JQp0j9dTc7OulMRNGi99k4NrAL+e0RpTN+Sc
	zxI9QjI5vSySSTDJkSFW+2JntDAlI5Y1C4o0xlodPddMYM+R17vZ5VvtEwG/oTfI4zq8cEhK9V6
	kcYneJ9xHxH0a8tpICg==
X-Google-Smtp-Source: AGHT+IH/BJmKeG8sCCjsrnEU4GvBCUJ7l4E3/vLrsI8yqEHlrC8lIIvVJnGpT7mn94M2UYA/kQCk4g==
X-Received: by 2002:a05:600c:8284:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442d6d1fb3bmr160420685e9.10.1747131005348;
        Tue, 13 May 2025 03:10:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb79sm205060145e9.27.2025.05.13.03.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:10:04 -0700 (PDT)
Message-ID: <69c83783-e2b4-4487-ba0c-d94fae9c7b75@linaro.org>
Date: Tue, 13 May 2025 11:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 32/48] target/arm/meson: accelerator files are not
 needed in user mode
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-33-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-33-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wDUdu14YMFPL

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
