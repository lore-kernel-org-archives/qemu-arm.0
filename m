Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp572837njb;
        Tue, 13 May 2025 07:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViJhy4B5iRoMBvjqab84zeJPPStvE8o8MIzidOngRRtZqvr0FKjRy2RMWldFDzJ3zR0WYsMxisaFzZqg==@linaro.org
X-Google-Smtp-Source: AGHT+IFL8Xyn4/feb1RAAgZbLFmNiXM0UNSyOe+oMLyDXm4gabckmCBBlOimz3k8hjOJmd7Ql9/J
X-Received: by 2002:a05:620a:1a92:b0:7cc:8a96:8a2d with SMTP id af79cd13be357-7cd01143e1bmr3624926085a.40.1747147678043;
        Tue, 13 May 2025 07:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747147678; cv=none;
        d=google.com; s=arc-20240605;
        b=L//4x7Df5dmZz6rfjG7J5ZP72LXcbHrOzJgdha7ZUdVbuFb9hbSzKmhwhKNEb7u8za
         q2zOFUbzNHxL4dHLNg+vLCfX96/e/VseSuJfX/M20KzRSkBhW+9qpcJuTyJq3pwgjTU+
         XbJXx0VVqu9f4yUfOGtR8i+4hQc6Jh4UDi5UP5upJUyBGSfCT6ocSOVdJaeH2X6dG4J/
         7lSpk4cZ+ihNk2M4bKBDTbLuFoGAE1Gq47a4HOvSsyUW6olWbx5uapHT883B3LG+Dq2X
         VCSJN33kc8SLDAH9R/v7S+GKayjexDpKXHWvk3Evf/Gs0bZewfvW7XehCwzAcdaEFn1m
         //VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=KO5SYIXLZCeX5S3WIj7POPk8p8ZK2T5x7U07pEAcVtE=;
        fh=85JEiWbKvWydRU8n9YCVhZs0Y5QFBUHNljgwzj14BUc=;
        b=JwWyjCPCjBKo3KsDgTHldRCYimiwzHk5RSa7AHiXeKEVPzBmIgammfIYYqiLVM3If3
         pHI5NtHI0D6NQ96HvVLEyWpMgCRRyzAdUAXV2P0pl4vZQjRccFQMDOVntsLM+XTGNaxd
         G2QJcv4blX1PfxE5/w7cN6l9K18b1lk/UJORfcaH7zLGacN9I1NMvL+Letb+9F1W1Nec
         EfqdzkRXVXtvmVM+s7akEhsUsMfHopt4Qaw2fA3p+l6hNVhtxTZ1StwxUaVdF9EMoNmF
         dRHOKXWibIfUTDWTO3/tavwtZfMelFrTx4tbXUePgDhdQiYZL9vXzrt6XKRl0mj+WuWs
         NogA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TObxP9Ra;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe262asi1075847485a.408.2025.05.13.07.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TObxP9Ra;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747147677;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO5SYIXLZCeX5S3WIj7POPk8p8ZK2T5x7U07pEAcVtE=;
	b=TObxP9Ra5YOj93l0MpA4/ihPWJHpjooCNqHyUXQ0Sy8VpfTcxSl3Cq+yclft8gpVcj4KLo
	6cL9aTM+gydyEzPq1gjY+YxXbwOF2UdSQn7WoeArK+wVpC5Dwo0Mdr2dCFYmeaUZ4vI0dA
	ijBykAcgzAV1cardauMxA3chMn7ORpI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-nyXcvXvjMy6r3EqmijNYgg-1; Tue, 13 May 2025 10:47:56 -0400
X-MC-Unique: nyXcvXvjMy6r3EqmijNYgg-1
X-Mimecast-MFC-AGG-ID: nyXcvXvjMy6r3EqmijNYgg_1747147674
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43f251dc364so35420605e9.2
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 07:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147674; x=1747752474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO5SYIXLZCeX5S3WIj7POPk8p8ZK2T5x7U07pEAcVtE=;
        b=KAV0JCo854v7VXv0KNUWsS5GeUkQxXeqVYAkvcaEvv17scF1K8SPyy9R0DCM0P8lDJ
         43s4l2EubweqDpPymPaqm8Jp8wLm1xpox51hyGSp2ZUjuH7zF2xME32/WJrZH3LY7/SW
         T0kXLEzvYU9y4/Bkz91KRKnIBU8KvymoJ7khLqahW3mC+yBUQqjvBVeosRNMzMtbnWFF
         bS/az77tSyUD2yZ9HPVJwrPZ8C9h0Y9q2YYj28EpbN8yMd+TwGCJWJrGnz73zpECV153
         UqHcw94DmAG4SjoP210+11U3FXHqWFngwLx3LF3dtdvm7ZNs8hJcJMMuvCPMTgVJynJc
         II5g==
X-Forwarded-Encrypted: i=1; AJvYcCXz3GXfv9ca3T/5gp1OpDMKbl6fgvoFKo8DsPrHgrtkjqAytjmin0NZactbVDV9b5ZytUqpJQmZ9xnkOw==@linaro.org
X-Gm-Message-State: AOJu0Yx310T/SYS0f7woyaQ8BPRvPWT/JRdrFajJIbs7UR75AjplJ8Am
	Zp5C77rB4o99Sm09ZWT7jN+DKK/s6bgNKGi/nUGO1Uj8HnJGRylHAKo7I7O9GaT2kOepkisaWj9
	gJW8c0tewQ6W+sYzZtbxbwi9UXVV/MM77h1vLWwPNZNbVBK7WTdludw==
X-Gm-Gg: ASbGncsUPd63DU+SZtBG7nVcQZFinLl9XB/C3Cxc8mZCKeIwHbUdAPmBgrHKZTn2FfL
	TTB3ph7Vi50sU9kWp+Vx39rPO901dKZystvrWd1qar/1T3KKcxZe6Ja3gjlr8XOpjYNkqsC43CE
	ts7xCsUWn9zomtbeSG+jI9qgM+Rum+eyIxLbg25R2zVcRTzdMwyGZ+2yOqh6avP6Sp7Su1A0MGy
	uB+BPm4jUZYoFMbh89tJ/In+VJqGEwK/rzD4qjZnVp+TX9ORJXjCad/VSBrqLwLMAiTfUwoQboB
	1ua7gaJ4ulA8olJx2EmkV0uiM/A+3gO3JZzI9/EbawECLiyy9xapYyBWd0Q=
X-Received: by 2002:a05:600c:3d0c:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-442d6c31f3fmr173950975e9.0.1747147674313;
        Tue, 13 May 2025 07:47:54 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0c:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-442d6c31f3fmr173950675e9.0.1747147673885;
        Tue, 13 May 2025 07:47:53 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442e9c9a193sm53493925e9.21.2025.05.13.07.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:47:53 -0700 (PDT)
Message-ID: <7a9279ee-99d3-4871-b9f7-5d5529864f1e@redhat.com>
Date: Tue, 13 May 2025 16:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 08/10] arm/cpu: more customization for the kvm host cpu
 model
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-9-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-9-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dfrMkWwceuXRHYDraiDYkxeEp1S8JH_1t_RFlnD3-HQ_1747147674
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: nrxgtPoJJ2XD

Hi Connie,

On 4/14/25 6:38 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> If the interface for writable ID registers is available, expose uint64
> SYSREG properties for writable ID reg fields exposed by the host
> kernel. Properties are named  SYSREG_<REG>_<FIELD> with REG and FIELD
I remember we had a comment in the early RFC that suggested to remove
the "SYSREG_" prefix. I introduced to ease the qmp introspection if I
remember correctly. Could we manage without it?
> being those used  in linux arch/arm64/tools/sysreg. This done by
s/used in/used in
> matching the writable fields retrieved from the host kernel against the
> generated description of sysregs.
>
> An example of invocation is:
> -cpu host,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> which sets DP field of ID_AA64ISAR0_EL1 to 0.
>
> [CH: add properties to the host model instead of introducing a new
> "custom" model]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>
> ---
>
> Interaction with the existing cpu properties is still a bit unclear --
> at the moment, the different configurations can overwrite each other.
> ---
>  target/arm/cpu.c        |  12 ++++
>  target/arm/cpu64.c      |  22 ++++++-
>  target/arm/kvm.c        | 135 ++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h    |  10 +++
>  target/arm/trace-events |   4 ++
>  5 files changed, 182 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a3de5ee2b19c..c03f38ad5cfe 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1991,6 +1991,18 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    /*
> +     * If we failed to retrieve the set of writable ID registers for the "host"
> +     * CPU model, report it here. No error if the interface for discovering
> +     * writable ID registers is not available.
> +     * In case we did get the set of writable ID registers, set the features to
> +     * the configured values here and perform some sanity checks.
> +     */
> +    if (cpu->writable_id_regs == WRITABLE_ID_REGS_FAILED) {
> +        error_setg(errp, "Failed to discover writable id registers");
> +        return;
> +    }
> +
>      if (!cpu->gt_cntfrq_hz) {
>          /*
>           * 0 means "the board didn't set a value, use the default". (We also
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 60a709502697..c595dbb532c1 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -757,11 +757,31 @@ static void aarch64_host_initfn(Object *obj)
>  {
>  #if defined(CONFIG_KVM)
>      ARMCPU *cpu = ARM_CPU(obj);
> -    kvm_arm_set_cpu_features_from_host(cpu, false);
> +    bool expose_id_regs = true;
> +    int ret;
> +
> +    cpu->writable_map = g_malloc(sizeof(IdRegMap));
> +
> +    /* discover via KVM_ARM_GET_REG_WRITABLE_MASKS */
> +    ret = kvm_arm_get_writable_id_regs(cpu, cpu->writable_map);
> +    if (ret == -ENOSYS) {
> +        /* legacy: continue without writable id regs */
> +        expose_id_regs = false;
> +    } else if (ret) {
> +        /* function will have marked an error */
> +        return;
> +    }
> +
> +    kvm_arm_set_cpu_features_from_host(cpu, expose_id_regs);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>          aarch64_add_pauth_properties(obj);
>      }
> +    if (expose_id_regs) {
> +        /* generate SYSREG properties according to writable masks */
> +        kvm_arm_expose_idreg_properties(cpu, arm64_id_regs);
> +    }
> +
>  #elif defined(CONFIG_HVF)
>      ARMCPU *cpu = ARM_CPU(obj);
>      hvf_arm_set_cpu_features_from_host(cpu);
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 9e4cca1705c8..63e27906cc42 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -335,6 +335,141 @@ static int get_host_cpu_idregs(ARMCPU *cpu, int fd, ARMHostCPUFeatures *ahcf)
>      return err;
>  }
>  
> +static ARM64SysRegField *get_field(int i, ARM64SysReg *reg)
> +{
> +    GList *l;
> +
> +    for (l = reg->fields; l; l = l->next) {
> +        ARM64SysRegField *field = (ARM64SysRegField *)l->data;
> +
> +        if (i >= field->lower && i <= field->upper) {
> +            return field;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +static void set_sysreg_prop(Object *obj, Visitor *v,
> +                            const char *name, void *opaque,
> +                            Error **errp)
> +{
> +    ARM64SysRegField *field = (ARM64SysRegField *)opaque;
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    uint64_t *idregs = cpu->isar.idregs;
> +    uint64_t old, value, mask;
> +    int lower = field->lower;
> +    int upper = field->upper;
> +    int length = upper - lower + 1;
> +    int index = field->index;
> +
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (length < 64 && value > ((1 << length) - 1)) {
> +        error_setg(errp,
> +                   "idreg %s set value (0x%lx) exceeds length of field (%d)!",
> +                   name, value, length);
> +        return;
> +    }
> +
> +    mask = MAKE_64BIT_MASK(lower, length);
> +    value = value << lower;
> +    old = idregs[index];
> +    idregs[index] = old & ~mask;
> +    idregs[index] |= value;
> +    trace_set_sysreg_prop(name, old, mask, value, idregs[index]);
> +}
> +
> +static void get_sysreg_prop(Object *obj, Visitor *v,
> +                            const char *name, void *opaque,
> +                            Error **errp)
> +{
> +    ARM64SysRegField *field = (ARM64SysRegField *)opaque;
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    uint64_t *idregs = cpu->isar.idregs;
> +    uint64_t value, mask;
> +    int lower = field->lower;
> +    int upper = field->upper;
> +    int length = upper - lower + 1;
> +    int index = field->index;
> +
> +    mask = MAKE_64BIT_MASK(lower, length);
> +    value = (idregs[index] & mask) >> lower;
> +    visit_type_uint64(v, name, &value, errp);
> +    trace_get_sysreg_prop(name, value);
> +}
> +
> +/*
> + * decode_idreg_writemap: Generate props for writable fields
> + *
> + * @obj: CPU object
> + * @index: index of the sysreg
> + * @map: writable map for the sysreg
> + * @reg: description of the sysreg
> + */
> +static int
> +decode_idreg_writemap(Object *obj, int index, uint64_t map, ARM64SysReg *reg)
> +{
> +    int i = ctz64(map);
> +    int nb_sysreg_props = 0;
> +
> +    while (map) {
> +
spurious empty line
> +        ARM64SysRegField *field = get_field(i, reg);
> +        int lower, upper;
> +        uint64_t mask;
> +        char *prop_name;
> +
> +        if (!field) {
> +            /* the field cannot be matched to any know id named field */
> +            warn_report("%s bit %d of %s is writable but cannot be matched",
> +                        __func__, i, reg->name);
> +            warn_report("%s is cpu-sysreg-properties.c up to date?", __func__);
> +            map =  map & ~BIT_ULL(i);
> +            i = ctz64(map);
> +            continue;
> +        }
> +        lower = field->lower;
> +        upper = field->upper;
> +        prop_name = g_strdup_printf("SYSREG_%s_%s", reg->name, field->name);
> +        trace_decode_idreg_writemap(field->name, lower, upper, prop_name);
> +        object_property_add(obj, prop_name, "uint64",
> +                            get_sysreg_prop, set_sysreg_prop, NULL, field);
> +        nb_sysreg_props++;
> +
> +        mask = MAKE_64BIT_MASK(lower, upper - lower + 1);
> +        map = map & ~mask;
> +        i = ctz64(map);
> +    }
> +    trace_nb_sysreg_props(reg->name, nb_sysreg_props);
> +    return 0;
> +}
> +
> +/* analyze the writable mask and generate properties for writable fields */
> +void kvm_arm_expose_idreg_properties(ARMCPU *cpu, ARM64SysReg *regs)
> +{
> +    int i, idx;
> +    IdRegMap *map = cpu->writable_map;
> +    Object *obj = OBJECT(cpu);
> +
> +    for (i = 0; i < NR_ID_REGS; i++) {
> +        uint64_t mask = map->regs[i];
> +
> +        if (mask) {
> +            /* reg @i has some writable fields, decode them */
> +            idx = kvm_idx_to_idregs_idx(i);
> +            if (idx < 0) {
can it happen? I understand it asserts?
> +                /* no matching reg? */
> +                warn_report("%s: reg %d writable, but not in list of idregs?",
> +                            __func__, i);
> +            } else {
> +                decode_idreg_writemap(obj, i, mask, &regs[idx]);
> +            }
> +        }
> +    }
> +}
> +
>  static bool
>  kvm_arm_get_host_cpu_features(ARMCPU *cpu, ARMHostCPUFeatures *ahcf,
>                                bool exhaustive)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 90ba4f7d8987..ba5de45f868c 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -157,6 +157,16 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu, bool exhaustive);
>   */
>  void kvm_arm_add_vcpu_properties(ARMCPU *cpu);
>  
> +typedef struct ARM64SysReg ARM64SysReg;
> +/**
> + * kvm_arm_expose_idreg_properties:
> + * @cpu: The CPU object to generate the properties for
> + * @reg: registers from the host
> + *
> + * analyze the writable mask and generate properties for writable fields
> + */
> +void kvm_arm_expose_idreg_properties(ARMCPU *cpu, ARM64SysReg *regs);
> +
>  /**
>   * kvm_arm_steal_time_finalize:
>   * @cpu: ARMCPU for which to finalize kvm-steal-time
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 955149ee1ac4..8d2a234d5272 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -15,3 +15,7 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>  kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
>  get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
>  kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
> +decode_idreg_writemap(const char* name, int lower, int upper, char *prop_name) "%s [%d:%d] is writable (prop %s)"
> +get_sysreg_prop(const char *name, uint64_t value) "%s 0x%"PRIx64
> +set_sysreg_prop(const char *name, uint64_t old, uint64_t mask, uint64_t field_value, uint64_t new) "%s old reg value=0x%"PRIx64" mask=0x%"PRIx64" new field value=0x%"PRIx64" new reg value=0x%"PRIx64
> +nb_sysreg_props(const char *name, int count) "%s: %d SYSREG properties"
Eric
