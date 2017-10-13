Received: by 10.223.197.9 with SMTP id q9csp1122409wrf;
        Fri, 13 Oct 2017 13:44:11 -0700 (PDT)
X-Received: by 10.98.95.197 with SMTP id t188mr251665pfb.230.1507927451386;
        Fri, 13 Oct 2017 13:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507927451; cv=none;
        d=google.com; s=arc-20160816;
        b=TFbnynHYDd3rNrMH4c8E2SXuT00EIypRjPNNOa6iQsDvwt5amDGEGPaDXmN4ns5jmw
         D9zeVsxPkl/VzEdSocBrIpu9n4mOkGx0SKGNwaOWCwr+rwXLp0c2jxk4mBXevnLAJvmi
         PQcvI1LyMeWU0Hxvb2TWxyJKOuj51oAe6OiDFuwODJ0itYJhYKMOShJEUefPGnN94jrE
         Cd1G2rKrlJi/1EXa7H60l9aK/kDiP/dTNIP8S+W/CUYnXLpBfUnpWYT9ZBNd0GgxRKSf
         3zkznW1kCTmOYgB66eLQ0epDrNcYcwLQATQtCW1LKwioZilM5TzMuOVt180G1YyQyzFQ
         uOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=CzzpLXcieSlQnbYsG5JnHNgbhIX5KRF/ghkFlLTyAbY=;
        b=mtoRi29/KWTWP1DWib1ss+sA9uNDHzRQ10Z8O4xH8ks48V+laq7YXXfBb9kNHGLz1I
         PUNBj03kJMHyRD5sm5F76fTuOWjjS2Dg6pqeRvNJCJcwJzOddQiti/giwIy6U/JMM9kF
         4eymdI8ZIW+Mty3bEMfjFsOrn8lJpguGi2QeE95BysNubtL11ZELP3sk9p17TuVMIJKJ
         kWbsPVk68CS6hPTdy3xGWpGCXrb9U0b1iadszv+xDT6i+dL6lqd/WcsQsnM8PbcMXrBH
         R5i11bsWKFKqyreWKtASabyWgR7q7HudPXTVQ7LqC1xYZoq5652VT3JlpeadkCJAvp2N
         vh3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h/n2R0S2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h8sor658549plt.140.2017.10.13.13.44.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:44:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h/n2R0S2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CzzpLXcieSlQnbYsG5JnHNgbhIX5KRF/ghkFlLTyAbY=;
        b=h/n2R0S2/Y+vTEZGfvUPyT0d/pGPvm0ShL5EzyjfuFr3LQHKSL3YvR2c3dBbv4S9Is
         L8kLfTCbb6DnPUGacMHBtxGM6M88ntBGF+l628by+adfbKCFhEQU/nfM6ZCbifUCkTyL
         aVq0uv5dBGeDIGtJCvwyRLVWitO6oeQB8QFiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CzzpLXcieSlQnbYsG5JnHNgbhIX5KRF/ghkFlLTyAbY=;
        b=bUiKsr5iNR+BV1BrkbP7HaHLPATfZnBUaY3UDbPRLyleQLSLohxFeOdmFEBGHTxKTg
         UZPry0R8DXzuMyXibF3r+ZkJeN6U31mtnUbG8YxhKBeUWiTUL20VVpeCSDs1PAe5bjL6
         2AL9lOYEzaStzhyUhbr/7ivnMRPd77tMPeweFICqAyxR0sfEAEtx8CXLFpDb16hDUaiz
         pk92QTnAJzczVXJHZfdh2d/05RNOcSczV/yzprRlhtEqwfzG9DWp8y5J1B1b4Zwjn7Ph
         hResfhjf1zYkKWZheT8nOlh58E/0akHJV1+/JNYTyhEy+rpS+FEQlCAupujGGR8Uzyf+
         eWXw==
X-Gm-Message-State: AMCzsaXLbIJXVmGqK7FysqYZuz8Jp3YvIm/FdxCka1VdwVb6lZus+0xy
	ZZ+ZeVwavDng7QyWR5HmGljCtFv0lwU+tg==
X-Google-Smtp-Source: AOwi7QCF6fIgDLkZ6aud21e8novu5LHx5dhVcWwVAQdGFZXamiPQvfLwqjNdDhBQKN/VYxKtnr/dDA==
X-Received: by 10.84.132.66 with SMTP id 60mr2415403ple.158.1507927450795;
        Fri, 13 Oct 2017 13:44:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id d124sm3738281pfc.42.2017.10.13.13.44.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:44:09 -0700 (PDT)
Subject: Re: [RFC PATCH 02/30] arm: introduce ARM_V8_FP16 feature bit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <585e84d8-90be-2e76-cc60-db0baad1d511@linaro.org>
Date: Fri, 13 Oct 2017 13:44:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8b5gDuVlrVwC

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> ---
>  target/arm/cpu.h   | 1 +
>  target/arm/cpu64.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 89d49cdcb2..3a0f27c782 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1340,6 +1340,7 @@ enum arm_features {
>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
> +    ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>  };
>  
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 670c07ab6e..973614dfc6 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -226,6 +226,7 @@ static void aarch64_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
>      cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
>      cpu->dcz_blocksize = 7; /*  512 bytes */
>  }
> 

Need to update linux-user/elfload.c, get_elf_hwcap as well (HWCAP_ASIMDHP).
I suppose that will be a separate patch, since we're missing 8 bits from
current linux/arch/arm64/include/uapi/asm/hwcap.h.

... and we probably need to report a kernel arm32 bug that there is no
equivalent bit defined there.

Anyway, as far as this goes,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
