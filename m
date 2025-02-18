Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp768843njb;
        Tue, 18 Feb 2025 07:33:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYXE8vBr4x19XpNUxeab/L3nT/FlTiWnobRUsKM/6RN1wwP5injZDkyajxOmyCLq0m4TSWHagWgT+tkA==@linaro.org
X-Google-Smtp-Source: AGHT+IGq5F2dhIiHh+dQCBoz1d4X2zLNB5ncqqaMPUvsbZTFYXUDVpmbbo7YN4lnY6tqvAeagS10
X-Received: by 2002:a05:6122:87:b0:521:bdd8:989e with SMTP id 71dfb90a1353d-521c33b73b9mr172723e0c.7.1739892800860;
        Tue, 18 Feb 2025 07:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739892800; cv=none;
        d=google.com; s=arc-20240605;
        b=BiyuzRbidr6z6IdElWt2bNgRPDJZHLm8ypSxh7GBGWtyPDsH1T13J2kFZ00pQUESbg
         TrW/+1KwlwM1/EgCSGxgK51qMBJjGb+HqgocW0S3+huussg8SKzM6UD4k2k2OrRTGc0h
         Rp8W1bgs2CE+n5spVpmx5/+5OI0eKJXM18xfWs80JNuN4vH0X0J3ircoPjVfV9dL5oob
         ojGI4MpJHlCRWsbcTBGs7sjXEcpvAKt+1nHofd4+00jChQv0NhSNHj/Ybk9JRL0WpQXq
         3/mbZgZFvIrda5aVeDRIBEtyPlAxGNsIZ9YHLAWk+QqAJlYeKulDEQsS5shccHinRIUa
         spaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=0UCjt3mp7yDvSEsnhqs87k56LFrtYTUCWzATqqG4knA=;
        fh=0wuzy7Ogg5vp4DER6mgLGIR/FbqwryyAMv0jCQLwEWA=;
        b=D2ekrBbptQtMlm16b1zypWtSUAIcKTXxLdT59hZmnX4LlNauR1EJQ6j7hMtlnosiD+
         7siqAJ8P8yBaPEKrCYzwyo2k98PtVHUyhJYiazu58Ih1SfZJEF1BTbT/GD8m4bNWsOOV
         lQ5Rl1LCqDppq1KTGtsROZUrMNbhWzwW6zFmooHzg3abz3qWaa8qtDRisiD7w+TEb10X
         DOLLn1uiby76Waw5EmqCawFeyhR5N5cJrCnqY5AMnWIbx692MbllDoYtqvrbn1b4/WIP
         eQwkqXh6ptehsHopoyoYd/TwLgomle84vP0frrkPXeb2UGK2bVIsOpzsswWr2wAQBmux
         3OcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DL2g7cSo;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-868e86bbbd0si2049782241.93.2025.02.18.07.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:33:20 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DL2g7cSo;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739892800;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0UCjt3mp7yDvSEsnhqs87k56LFrtYTUCWzATqqG4knA=;
	b=DL2g7cSoa83cutkxLiFEqq1r4YDYUj9nmw4fc9uquHKzuTA9zsuf7kIRuWrH2aUaZ91qFI
	YqDy33m+3/2rRkLzDew5sTUPEHl/OMXt1WPNNGcqritCd/1nLHq4H7phFQ9XTtQ1D8lNrX
	OadBFLDwaO7LPimy3rclGGrv+RfY7cI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-bJgM3oCQM7qU8bSET2E-Fg-1; Tue, 18 Feb 2025 10:33:17 -0500
X-MC-Unique: bJgM3oCQM7qU8bSET2E-Fg-1
X-Mimecast-MFC-AGG-ID: bJgM3oCQM7qU8bSET2E-Fg_1739892796
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f394f6d84so2015498f8f.1
        for <alex.bennee@linaro.org>; Tue, 18 Feb 2025 07:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892796; x=1740497596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UCjt3mp7yDvSEsnhqs87k56LFrtYTUCWzATqqG4knA=;
        b=RS2PCko8uw6+fANv6dJeCILqY18Or3miEagIBTlkWZkbUHtvA4vQEmj9o2EQSj2lJH
         dhPiz7fyZjRMWGDu5BA+1dHJxyw08RmGVKlX0qpBxGB4/lqJK4vG552QGKjhVBwWXT8z
         /qqmITTThdhB4dZD5VfT1OQVVUs0idbxZ0or02/oma/CoSVXgQQiMinhdWP+RN/zcDYS
         QjlkxI4R/3yvzVHAjhV+N6Qjc2nuPxJURcHiyFFTx6Aie1WLiF6zjG4NpwMsYxdAaI7p
         Eg2kX9ELppZt/8eK+Aitmi8Jsi63k7k8VcAez0rVKk0DhF+pzUKukYcsoV505Bt+RqGt
         29kg==
X-Forwarded-Encrypted: i=1; AJvYcCWTJUAsj5HEnR+5XPOEoVr5D56eS+X450ovVbMSsF4JoJ1o9FA/ySz1OF8gw8uBGo/HufNCMW6xKeBXUw==@linaro.org
X-Gm-Message-State: AOJu0Yw13ko24ounLW4THMXLR8nYYiiuGCRnV/47aDDrzzzUOxHV+uwC
	LJYBlUFWrTGBzudRZTPT8K0ZHgIl7kuonCQbCbgTYPx4D19DQhH2cXC5snhsTwYNj7GmAqaPgOT
	FgR9NL6GJcvj2eb0tm/ipBajfGgRVrlb8miheSdp1RT8pzDYLR1+v9A==
X-Gm-Gg: ASbGncvklZnflYHvnkLM75AbUIZnUsIFK13A3aeUqqJ0dAFpIzqgL+qHw8Q4rzRWUjO
	/sCG0W9PNMs5KhfkgUqJ8IC4n8uyUtcwyZm6zrY/5jG/XRhUTOjipR2MaIhgHbjAqZqTjfCUCTR
	tgaxn2EeZXu44CwESCxoOS0IH4n+faCCL1fOmZEIXzXeBrxoQNm9EPcbQWV/jg8G7nre1zV9j1f
	NXtwrsPHFau8CuSS7uAjbWSg37Q+xmGn+VxXpxqtt0Rf9HDhrK0BWdSS67mJSZ0BaRbnB5NiZ/m
	W5RWhGSXqhxhm8XC6wuWW7uJ8UtYEWcw+Jciw4BAXZN9CxMk90Ex
X-Received: by 2002:adf:e80a:0:b0:38f:2230:c0ff with SMTP id ffacd0b85a97d-38f33f4ea6dmr10548877f8f.30.1739892796520;
        Tue, 18 Feb 2025 07:33:16 -0800 (PST)
X-Received: by 2002:adf:e80a:0:b0:38f:2230:c0ff with SMTP id ffacd0b85a97d-38f33f4ea6dmr10548858f8f.30.1739892796174;
        Tue, 18 Feb 2025 07:33:16 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c36sm15486329f8f.67.2025.02.18.07.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:33:15 -0800 (PST)
Message-ID: <b1a2e796-b2f5-4acc-9d6d-e85d99d67a0d@redhat.com>
Date: Tue, 18 Feb 2025 16:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 02/15] arm/kvm: add accessors for storing host features
 into idregs
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-3-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250207110248.1580465-3-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JHCsu87NW0sV2MeJUfj6xd4M4AchHotWIcuXg7wOhwM_1739892796
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: GHzanCAYRqVS


Hi Connie

On 2/7/25 12:02 PM, Cornelia Huck wrote:
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-sysregs.h |  3 +++
>  target/arm/cpu64.c       | 25 +++++++++++++++++++++++++
>  target/arm/kvm.c         | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+)
>
> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> index de09ebae91a5..54a4fadbf0c1 100644
> --- a/target/arm/cpu-sysregs.h
> +++ b/target/arm/cpu-sysregs.h
> @@ -128,4 +128,7 @@ static const uint32_t id_register_sysreg[NUM_ID_IDX] = {
>      [CTR_EL0_IDX] = SYS_CTR_EL0,
>  };
>  
> +int get_sysreg_idx(ARMSysRegs sysreg);
> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
> +
>  #endif /* ARM_CPU_SYSREGS_H */
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 8188ede5cc8a..9ae78253cb34 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -736,6 +736,31 @@ static void aarch64_a53_initfn(Object *obj)
>      define_cortex_a72_a57_a53_cp_reginfo(cpu);
>  }
>  
> +#ifdef CONFIG_KVM
> +
> +int get_sysreg_idx(ARMSysRegs sysreg)
> +{
> +    int i;
> +
> +    for (i = 0; i < NUM_ID_IDX; i++) {
> +        if (id_register_sysreg[i] == sysreg) {
I agree with Richard that if we could get rid of this linear search it
would be nicer.
> +            return i;
> +        }
> +    }
> +    return -1;
> +}
> +
> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg)
> +{
> +    return ARM64_SYS_REG((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >> CP_REG_ARM64_SYSREG_OP0_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >> CP_REG_ARM64_SYSREG_OP1_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >> CP_REG_ARM64_SYSREG_CRN_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >> CP_REG_ARM64_SYSREG_CRM_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >> CP_REG_ARM64_SYSREG_OP2_SHIFT);
> +}
> +
> +#endif
> +
>  static void aarch64_host_initfn(Object *obj)
>  {
>  #if defined(CONFIG_KVM)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index da30bdbb2349..3b8bb5661f2b 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -246,6 +246,36 @@ static bool kvm_arm_pauth_supported(void)
>              kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
>  }
>  
> +/* read a 32b sysreg value and store it in the idregs */
> +static int get_host_cpu_reg32(int fd, ARMHostCPUFeatures *ahcf, ARMSysRegs sysreg)
those are defined as static but there is no user so this will break
compilation locally

Eric
> +{
> +    int index = get_sysreg_idx(sysreg);
> +    uint64_t *reg;
> +    int ret;
> +
> +    if (index < 0) {
> +        return -ERANGE;
> +    }
> +    reg = &ahcf->isar.idregs[index];
> +    ret = read_sys_reg32(fd, (uint32_t *)reg, idregs_sysreg_to_kvm_reg(sysreg));
> +    return ret;
> +}
> +
> +/* read a 64b sysreg value and store it in the idregs */
> +static int get_host_cpu_reg64(int fd, ARMHostCPUFeatures *ahcf, ARMSysRegs sysreg)
> +{
> +    int index = get_sysreg_idx(sysreg);
> +    uint64_t *reg;
> +    int ret;
> +
> +    if (index < 0) {
> +        return -ERANGE;
> +    }
> +    reg = &ahcf->isar.idregs[index];
> +    ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
> +    return ret;
> +}
> +
>  static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  {
>      /* Identify the feature bits corresponding to the host CPU, and
