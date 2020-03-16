Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp471465lfe;
        Mon, 16 Mar 2020 12:36:30 -0700 (PDT)
X-Received: by 2002:a63:1404:: with SMTP id u4mr1354887pgl.172.1584387390005;
        Mon, 16 Mar 2020 12:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584387390; cv=none;
        d=google.com; s=arc-20160816;
        b=Ixl48PnE7asl2QgrO5vNoae2wKb9FsbZEmORISYvbQB62HF9148BgpRkOWSgSk/Ryq
         w8I+m1mSJ/RAAj40d2ObF1hb7kgTMhA8UvEgZg4VO4FNLDU8PgUAywYbvBwYNO+wJVnu
         ufD5U6RK/fyWnWhC+Pg/kJR2f/0QxKlwqj6MoV/quoj2oTY34vebWZOzWU+fEse1qHNy
         oZedI50Jw26a4A70Kc4dXseeEFpYqggZuvUJ73gPD4rsLgQXG3rfWAIt7xpMy7q6u+I2
         zsZGH6al3jgi06lVi7kRL0173WCkxOkILKBEMSo7pPz6XjmDaPsXooCj7yH2z0zCseVJ
         tAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4LmArg3GTu54ll1HNRtasTPkMr+nwPGShFSLJ6YeUnI=;
        b=sf5Vx0kVSdlMsYg4LgsW9r4aNfLRdJjhj7SJbXGW1+zok6908+oUJRl1bQiM40Mfj+
         gV8bYcY8H3/d/AqKDMrvJCSDn0jC4HMTTMHIo4NGDdsgdPTOTHqMFt514rb6n3z3RYps
         CWtj7vWrtdHB6Nn9dxbzbYb3QiNwcx3+QtOepZoBGYNFNbCpCVRwCj9Jhevm68P82EC5
         5gMPrkVbKRM2Fn2CwqyQywhHnD4rwFLaidz5uXsAaeif4ywyw10aWvFRMpb9FvmMIPfK
         DtCfJ3MSE/mi8B3IakjvKLi47mWFW4bHAYCbeH1JWrdpFMMB5lJXmJCx0RifNV//Qt3I
         +cDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCMqjmpf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w6sor790040pjt.35.2020.03.16.12.36.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCMqjmpf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4LmArg3GTu54ll1HNRtasTPkMr+nwPGShFSLJ6YeUnI=;
        b=UCMqjmpftx/SVaAcJC2uV0Mh8wWzRMNLzGmKyg2r9FKUh1a+nm610urYYMC0euiben
         wdwoaeK8aZNWW1uvuVCokCyF6UkNhWiNY5jCrf+HgruIXY/G5m50tQXxoxFlkiIom4MS
         IiF2qaNcF93JRGICwiVHlhDp2cCEJEo+x8QqVw0gURa/ImowPkDSrmW6x+KoYXKea6Yr
         29tCDsvaYT2r+dK4EyvqXlxis3TyjerqTa1H40pQIx9hKRogNjk6VIWWbLUz0Gf/FSAt
         UyppgclCH3Qu/wwEdAhfir7lWmTSo1YcnN8uXe+rUAextBb53XOLcYO3Opcq0rNjWnn7
         1oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4LmArg3GTu54ll1HNRtasTPkMr+nwPGShFSLJ6YeUnI=;
        b=MgFKbsZZKhNBr8GIaGFWet3JYIp7fHb9nYmU9iITvGRN1RXTXoJM1OlDHRK9VKH/lV
         JpooX13OYMB9qOMod275Ud5Zl6Q3rycWyx0PNOdSI7X2pXZWMaLIRZNNvqIhWBWIcNhX
         Q7kozvjeiueW4sjrsisaFfEvxzTSiMjMad9DQfXs+J1R0bqfvlMdHMq/MXZq5bSO6M2U
         3Lmzr6YCJVGO3x7Mujlfj39ddetsENR0gAyCbQPQRgKH8vXPTqEkHaQPrYqSHV28kqLw
         D0/fuajoBJrPZrTLThBUj5TNc+fddyG0ukzo1UFeY5ojPAhIVsLDNC1xM839f7Puy06o
         dAXg==
X-Gm-Message-State: ANhLgQ3xlxKb7DOnw5U0fuzSi0+WIBVrVzppSizkJ6A/oAEEN30SSjFj
	RaCXz4K7kSVUw6DzpoQYO2trWgKg2kg1dw==
X-Google-Smtp-Source: ADFU+vtZgb/dz6XW3yb1GA5ZDRSuPFgkv5SJph2TK2P9VA40H7gjfL+36QxLD2o/1YkyWhcuBFX92A==
X-Received: by 2002:a17:90a:faa:: with SMTP id 39mr1196481pjz.190.1584387387544;
        Mon, 16 Mar 2020 12:36:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id i197sm655801pfe.137.2020.03.16.12.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:36:26 -0700 (PDT)
Subject: Re: [PATCH v3 03/19] target/arm: Restrict DC-CVAP instruction to TCG
 accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f570579b-da9c-e89a-3430-08e82d9052c1@linaro.org>
Date: Mon, 16 Mar 2020 12:36:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HU2B5uynw3ES

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> Under KVM the 'Data or unified Cache line Clean by VA to PoP'
> instruction will trap.
> 
> Fixes: 0d57b4999 ("Add support for DC CVAP & DC CVADP ins")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b61ee73d18..924deffd65 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6777,7 +6777,7 @@ static const ARMCPRegInfo rndr_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>  
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>  static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
>                            uint64_t value)
>  {
> @@ -6820,9 +6820,9 @@ static const ARMCPRegInfo dcpodp_reg[] = {
>        .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
>      REGINFO_SENTINEL
>  };
> -#endif /*CONFIG_USER_ONLY*/
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */

I'm not 100% sure how the system regs function under kvm.

If they are not used at all, then we should avoid them all en masse an not
piecemeal like this.

If they are used for something, then we should keep them registered and change
the writefn like so:

#ifdef CONFIG_TCG
    /* existing stuff */
#else
    /* Handled by hardware accelerator. */
    g_assert_not_reached();
#endif


r~

>  
> -#endif
> +#endif /* TARGET_AARCH64 */
>  
>  static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
>                                       bool isread)
> @@ -7929,7 +7929,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      if (cpu_isar_feature(aa64_rndr, cpu)) {
>          define_arm_cp_regs(cpu, rndr_reginfo);
>      }
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>      /* Data Cache clean instructions up to PoP */
>      if (cpu_isar_feature(aa64_dcpop, cpu)) {
>          define_one_arm_cp_reg(cpu, dcpop_reg);
> @@ -7938,8 +7938,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              define_one_arm_cp_reg(cpu, dcpodp_reg);
>          }
>      }
> -#endif /*CONFIG_USER_ONLY*/
> -#endif
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
> +#endif /* TARGET_AARCH64 */
>  
>      if (cpu_isar_feature(any_predinv, cpu)) {
>          define_arm_cp_regs(cpu, predinv_reginfo);
> 
