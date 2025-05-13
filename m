Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp555445njb;
        Tue, 13 May 2025 07:20:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8InPTzqsvzooDjFH2NPGQ3l3eK1Kkf/WfZr6uJoCPWayXiWc3YZSFQERaouWGMbyBs076IMyqXFJngw==@linaro.org
X-Google-Smtp-Source: AGHT+IGp+8qMpei/Jt0eTOrcJJb3VFtuukWXZfrk3NoZmLfP7hwcvZaiDcpLubwEX/IQ/NgNUcCv
X-Received: by 2002:a05:6512:4381:b0:54f:c4bc:d098 with SMTP id 2adb3069b0e04-54fc67cac5cmr6878332e87.32.1747146018860;
        Tue, 13 May 2025 07:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747146018; cv=none;
        d=google.com; s=arc-20240605;
        b=ABjzhzWyAMSVTyU3CnfvdZTstzEifE8HYrDjCqZa6VzScMcDYV7PHCEWTLlm5Q1Fue
         BR/EILt0k3XW8PwHADu/Y1dVrkdo3JHPH7+83TkKvfnKYVnGPeXdoDEJLm8WTnMYIqmY
         DXsocnMIIjqy3KlcltdXnQ/qEabSXoxdazWxRPxXIjKRqTgYcoUel06vMT+6sa5IMy5h
         ovgboAGNx8GLh/kLDkRyv9akz7ky9i6OhfNqROimjChOsXK+no//AuUvXfDky2EDJeeL
         sAzxGoVgegpHszNY5nauzRKdnYA27SsQQDTJQflM3HAcxIuGKb6ibtQesLNcUTE9JGYN
         EVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=eyscc4t3yNl1uSrVJZkh3Y4b61e+bOq9gii8cVcyfdc=;
        fh=WelLJ5J1W9dClddVG8BX9BesC1ZnmPOY3TaS7PkmstE=;
        b=SPPDVUqgVIljI8doy8sdrbX+s+U+N28Vw8iYHkxR3Qvizv0ogJMlnT410rG37YCk/j
         /PZ9di6mJWZJ3wrTRSSgUaAaBCYW+6SWhCwoqa6x2WLWGnLjAVwlNy62WbLYnxdTHTHj
         YwTbBfORSOar0GqSuxFc0OW10ZEUks0OIExdl6AGZQ39NJtpGF+0Qgvlw8dtxRgk8Q4P
         cg73i+f2BG1xYykblYublBj98/AyGzVBZWhLpFSfWYRu+7vTas3H5oWBRKKS735sGw1H
         TSt9RriKyW/v8A9e/gaGSkW/qiPk6e7s1vQ1Rf6k77Vafr54taZ3zqic2lTtFLP9UlBj
         +kXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ez55SzKk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 2adb3069b0e04-54fc652562bsi4613483e87.534.2025.05.13.07.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ez55SzKk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747146017;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyscc4t3yNl1uSrVJZkh3Y4b61e+bOq9gii8cVcyfdc=;
	b=Ez55SzKkU4JQUUjl6TmPBdI0ALJckHNXGfa1ndE7VCawrQ0gwGzDsyO0oI6JiMUFGe2lWf
	KRRtvGMATJYVUm8rTxIJnQHFk/1vpTWga9k5btN1UWIQevZhZ7eLcIrkw1F8goNZs1H6N6
	qL9/S4KxXT1uKv9jKhRaBHXXT32NOvQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-ytCLW8NpMfmsQMgTj31GUA-1; Tue, 13 May 2025 10:20:15 -0400
X-MC-Unique: ytCLW8NpMfmsQMgTj31GUA-1
X-Mimecast-MFC-AGG-ID: ytCLW8NpMfmsQMgTj31GUA_1747146014
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so23951605e9.2
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 07:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146014; x=1747750814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyscc4t3yNl1uSrVJZkh3Y4b61e+bOq9gii8cVcyfdc=;
        b=ezFq6ldrf/GtlfQby0TlTite3ssuK3JwwPWNF67V/AM3thSQFEgMEQGvKhmdT5uARM
         t928M3gpaoqgKZrblLTyXcdXQz3SXUIeh2DM5DB3CjnoGqTVHP9h9oJTKuDgAUjGb7vO
         JcuIRgKPBRbjQ6uHrc4f2qxgWu9HKhyPoQqvQkn/raRkwGpZ6V/wXOaa4l7nygjuJ0Aj
         qfIVP3Yx5vneIxh8KfBwC0sj/r3tQ8ILTXuvOBwO0+2EK46nflxW1m584XvXtWABsjOX
         L8YYBbfBXRyp6rr4fYzybjNFv0Uq+aKkeyXX9Uu3sL4qiR6EkupxXm33RqHQGYTj1deh
         VfPw==
X-Forwarded-Encrypted: i=1; AJvYcCVBSP4z3VBLu4wWcVeAvvWsQbzE9zCfVHJge1lbaNh2XyDdbMv5HuM0wP14Fk6pYp7WjnKGxMjJmfTFXA==@linaro.org
X-Gm-Message-State: AOJu0Yz9H5n1+JR+KIveE1cqVFio8lgvVjM0z8ckRrDN5wG77vvZSxQj
	HdKlmCIuh6vs2Tg+VS4iLrB4bJHyGcdVIa59A9gwO9DhLCBwg3e6NqX2e92Y8kO6/dk0TCVFPxi
	GVSdHbuEOARBVIIPD5l5pBbzEVj+OWQ4Ze6v3NQaU+AH2cPMbbQmZIg==
X-Gm-Gg: ASbGncsDQyI7R0stLSBJwvweBcSlLdr9kRvB4DO5FNCg6aSXPqvH+FWTH5Wdp0Oq2jt
	0wVvfPoN59PZLaVF/iByzF2ILfO0cDFbNQvLiJ7dpYEof5WSfMKSiBqpuCgvM5iRIm8JcNc+Y/Z
	qhBBiFxuh3+mClPHmNkvtp+kobjaFN/RsjLi3SQANkf0+sGMtxYIhJahYhMJLp2cAzVY+D8ysT0
	4UCuTALRS5Bbj7EuEWKOPkU4gJ+QCSNer0i86gOhVqZKhu1hfY1n/IpWu9SIFjpJTIkuE/xq7zF
	joGbcqIDLSOIHUUMC2c1vh+5ti34a1oX0/oiSRP/Dx6otgbFdK9PW0f6+DI=
X-Received: by 2002:a05:600c:8887:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-442d6d6ac34mr142266735e9.15.1747146013766;
        Tue, 13 May 2025 07:20:13 -0700 (PDT)
X-Received: by 2002:a05:600c:8887:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-442d6d6ac34mr142266335e9.15.1747146013344;
        Tue, 13 May 2025 07:20:13 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3285f9sm215246655e9.8.2025.05.13.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:20:12 -0700 (PDT)
Message-ID: <4f370fae-8234-48ca-97e2-3b7038092974@redhat.com>
Date: Tue, 13 May 2025 16:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 04/10] kvm: kvm_get_writable_id_regs
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-5-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-5-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1wZ91EfuzIBfks1rvp7sGEk1J3oV5DZE3RHL0AYivEA_1747146014
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: uSUzk5cw9oq1

Hi Connie,

On 4/14/25 6:38 PM, Cornelia Huck wrote:
> Add an helper to retrieve the writable id reg bitmask. The
> status of the query is stored in the CPU struct so that an
> an error, if any, can be reported on vcpu realize().
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu.h     | 26 ++++++++++++++++++++++++++
>  target/arm/kvm.c     | 32 ++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h |  7 +++++++
>  3 files changed, 65 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d27134f4a025..bbee7ff2414a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -856,6 +856,26 @@ typedef struct {
>      uint32_t map, init, supported;
>  } ARMVQMap;
>  
> +typedef enum ARMIdRegsState {
> +    WRITABLE_ID_REGS_UNKNOWN,
> +    WRITABLE_ID_REGS_NOT_DISCOVERABLE,
> +    WRITABLE_ID_REGS_FAILED,
> +    WRITABLE_ID_REGS_AVAIL,
> +} ARMIdRegsState;
> +
> +/*
> + * The following structures are for the purpose of mapping the output of
> + * KVM_ARM_GET_REG_WRITABLE_MASKS that also may cover id registers we do
> + * not support in QEMU
> + * ID registers in op0==3, op1=={0,1,3}, crn=0, crm=={0-7}, op2=={0-7},
> + * as used by the KVM_ARM_GET_REG_WRITABLE_MASKS ioctl call.
> + */
> +#define NR_ID_REGS (3 * 8 * 8)
We may rename this define to better associate to the KVM API. I tend to
mix it with NUM_ID_IDX now ;-)
maybe something like KVM_NR_EXPOSED_ID_REGS
> +
> +typedef struct IdRegMap {
> +    uint64_t regs[NR_ID_REGS];
> +} IdRegMap;
I would add a comment saying this is the mask array, just to prevent the
reading from thinking it is the actual reg content.
> +
>  /* REG is ID_XXX */
>  #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>      ({                                                                  \
> @@ -1044,6 +1064,12 @@ struct ArchCPU {
>       */
>      bool host_cpu_probe_failed;
>  
> +    /*
> +     * state of writable id regs query used to report an error, if any,
> +     * on KVM custom vcpu model realize
> +     */
> +    ARMIdRegsState writable_id_regs;
maybe rename into writable_id_reg_status that would better reflect what
it is.
> +
>      /* QOM property to indicate we should use the back-compat CNTFRQ default */
>      bool backcompat_cntfrq;
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8491f42a18d2..6e3cd06e9bc5 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -50,6 +50,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>  static bool cap_has_mp_state;
>  static bool cap_has_inject_serror_esr;
>  static bool cap_has_inject_ext_dabt;
> +static int cap_writable_id_regs;
>  
>  /**
>   * ARMHostCPUFeatures: information about the host CPU (identified
> @@ -488,6 +489,37 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      env->features = arm_host_cpu_features.features;
>  }
>  
> +int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
> +{
> +    struct reg_mask_range range = {
> +        .range = 0, /* up to now only a single range is supported */
> +        .addr = (uint64_t)idregmap,
> +    };
> +    int ret;
> +
> +    if (!kvm_enabled()) {
> +        cpu->writable_id_regs = WRITABLE_ID_REGS_NOT_DISCOVERABLE;
> +        return -ENOSYS;
> +    }
> +
> +    cap_writable_id_regs =
> +        kvm_check_extension(kvm_state, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES);
> +
> +    if (!cap_writable_id_regs ||
> +        !(cap_writable_id_regs & (1 << KVM_ARM_FEATURE_ID_RANGE))) {
> +        cpu->writable_id_regs = WRITABLE_ID_REGS_NOT_DISCOVERABLE;
> +        return -ENOSYS;
> +    }
> +
> +    ret = kvm_vm_ioctl(kvm_state, KVM_ARM_GET_REG_WRITABLE_MASKS, &range);
> +    if (ret) {
> +        cpu->writable_id_regs = WRITABLE_ID_REGS_FAILED;
> +        return ret;
> +     }
> +    cpu->writable_id_regs = WRITABLE_ID_REGS_AVAIL;
> +    return ret;
> +}
> +
>  static bool kvm_no_adjvtime_get(Object *obj, Error **errp)
>  {
>      return !ARM_CPU(obj)->kvm_adjvtime;
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 05c3de8cd46e..8d1f20ca8d89 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -221,6 +221,8 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
>  
>  void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
>  
> +int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap);
> +
>  #else
>  
>  /*
> @@ -247,6 +249,11 @@ static inline bool kvm_arm_mte_supported(void)
>      return false;
>  }
>  
> +static inline int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
> +{
> +    return -ENOSYS;
> +}
> +
>  /*
>   * These functions should never actually be called without KVM support.
>   */
Cheers

Eric
