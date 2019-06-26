Received: by 2002:adf:a309:0:0:0:0:0 with SMTP id c9csp693474wrb;
        Wed, 26 Jun 2019 02:49:06 -0700 (PDT)
X-Received: by 2002:adf:f951:: with SMTP id q17mr2819473wrr.173.1561542546891;
        Wed, 26 Jun 2019 02:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561542546; cv=none;
        d=google.com; s=arc-20160816;
        b=nt+qQm5XwqQVBQIo3uCuidbZvV7Xal6DaZb/iJ4d73k5XloXrG+dxdeLo5EuVqcRKg
         lGOZCn82/KL4sOAMkXmgY67JuhSZvea8CE0zVfVRX3MzpKqRnAReJkttjK2mfpdEPFvP
         cpxKa16HP3EUKg3jIHzv45sxk2qfuhy+8TxIASf7HxVu5NSvf7re0DV4Ck2Y7JJ6Hk/P
         U4+Pp5JHnhryJu7lCx5QPqA+Y/nBIGWbUH3XQG1pS6pZER6kT6MGUoecSx2sZw0ytxG4
         3f7F99nK1LlEcoGQfLcSgt1BkQMkoRlRbHGJdgWdR3+45ohWRPdsiqJz930X3q0VU87j
         p1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=zUy5FMZLopmOCCAsFNI3/285Wur+YHkm+VqA7tRJ9zE=;
        b=MR9uMXNV8iTJjReTsJgUkH7eNF/S1QvjGPaWBJhZZe2dy3XRNE3eiovpAKilSukidp
         NUKo7YxxCd9KzD1Tkz7j2UTx9dfBATNI3zMj3HyLkbD7gBCGHpSDuCF4zbtzttfkYx/i
         oXYHr+mgQS8o7uJBdI0Fbo/6vFbsUngH3oMBC2bNhYVyYQ72boP5EwkY2aJ0Gp0PJQMg
         tGoWI3WjuieW5OKuKWMNPDjjPXAk/K/Zk1fexmOBTnFjXCUiwg9xG81qktaTo+tROvHL
         TosVADb8WjfHXmoTY6K5AWKuP0sKNOXkcmmWSJ76jr1jcFjTqbbPlqOeikF83r1TTWxE
         fiTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQy8nguU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y134sor809975wmc.4.2019.06.26.02.49.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 02:49:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQy8nguU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zUy5FMZLopmOCCAsFNI3/285Wur+YHkm+VqA7tRJ9zE=;
        b=kQy8nguU5N0vcpkgb41TF76DvAtBjMNEzojluxcxX3kbUEJQBu4tHr/TQpRG6IklkQ
         t+UsBG7zLcCq+JoOPC02UwywoKTtsMCodmL5jUo0G/p0PNfGbGVj/BMLjy+tMJiQj0jO
         rh6WbPAZdGS6Q+oYm1bRM1ziOG0pmT3zROVB9LBeGItYEgWKonpEuKcDF2Jo5oxRTa4w
         tIzysXQfuvJnw5UBKY2nhBHsEnZQOLBS3OqyU/P/lBuYMwkxKY4X3A2df3PafFQ0qqQt
         iy+88uQKNdnQFzxQg4qKicfPHjkz1gIUw1+wW63G0rxRonTAr8jsdYNKYa6+aUwRlMt4
         i3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zUy5FMZLopmOCCAsFNI3/285Wur+YHkm+VqA7tRJ9zE=;
        b=Ip05x1gz+bYBHF8eEpZygWrEdoWlwXyydpz3EcmHkHJEuUX3z1/yJi0YQ6eTqf5nYn
         vS1L6g/3xgUxQzFqyIYLfFZcpIGEp8o5V/7UTGVKc4NMJnBdXu6bjI7PPasY9qPQELJ4
         co09N4jfLetK5TnN9xQ8dK2MLJHpaBFN/kF12xDhSxDRFGnau277qDTN4S+EGMRQnC18
         YdZKvZxrjENswRtYOGCrQp8l+iqBXSpdi2D59/tPBm3DHwbWYqCnBqYToIUPxUpqQGdM
         LnOGXDXj2h+GnB5yKLOVprUv3n6nUNumP7ebY1EYxetSFlMGAz2aJmLFQbLpCBySnsqy
         6GUg==
X-Gm-Message-State: APjAAAWpWgc4VRZAmnHDugkdgOXWMNt6Ouom94wCZmBMUrSxfHKlMTI4
	JtQkhdHu6RGFK6cR0PICe7tobnCH
X-Google-Smtp-Source: APXvYqxTMOD4id6c9MT5sZSk/WOg1512ndHUDaD3uqSgMK1Dm0jrhR6W9TywuHUjwnKk0Qb43QGFhA==
X-Received: by 2002:a1c:c706:: with SMTP id x6mr2080419wmf.162.1561542546351;
        Wed, 26 Jun 2019 02:49:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id b5sm10997017wrq.61.2019.06.26.02.49.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 02:49:05 -0700 (PDT)
Subject: Re: [PATCH v2 02/14] target/arm/cpu: Ensure we can use the pmu with
 kvm
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-3-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7ba318d0-1701-39de-acee-d1a51385977d@linaro.org>
Date: Wed, 26 Jun 2019 11:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-3-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: CxJ1sHvtANcA

On 6/21/19 6:34 PM, Andrew Jones wrote:
> We first convert the pmu property from a static property to one with
> its own accessors. Then we use the set accessor to check if the PMU is
> supported when using KVM. Indeed a 32-bit KVM host does not support
> the PMU, so this check will catch an attempt to use it at property-set
> time.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c     | 30 +++++++++++++++++++++++++-----
>  target/arm/kvm.c     |  9 +++++++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  3 files changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 376db154f008..858f668d226e 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -759,10 +759,6 @@ static Property arm_cpu_has_el3_property =
>  static Property arm_cpu_cfgend_property =
>              DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
>  
> -/* use property name "pmu" to match other archs and virt tools */
> -static Property arm_cpu_has_pmu_property =
> -            DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
> -
>  static Property arm_cpu_has_vfp_property =
>              DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
>  
> @@ -785,6 +781,29 @@ static Property arm_cpu_pmsav7_dregion_property =
>                                             pmsav7_dregion,
>                                             qdev_prop_uint32, uint32_t);
>  
> +static bool arm_get_pmu(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    return cpu->has_pmu;
> +}
> +
> +static void arm_set_pmu(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (value) {
> +        if (kvm_enabled() && !kvm_arm_pmu_supported(CPU(cpu))) {
> +            error_setg(errp, "'pmu' feature not supported by KVM on this host");
> +            return;
> +        }
> +        set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_PMU);
> +    }
> +    cpu->has_pmu = value;
> +}
> +
>  static void arm_get_init_svtor(Object *obj, Visitor *v, const char *name,
>                                 void *opaque, Error **errp)
>  {
> @@ -859,7 +878,8 @@ void arm_cpu_post_init(Object *obj)
>      }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> -        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
> +        cpu->has_pmu = true;
> +        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu,
>                                   &error_abort);

This doesn't look right.

The static property is only enabled here if the cpu is known to support the
PMU, and thus the only useful setting is -cpu foo,pmu=off.  Which means that
the extra checking that you do in the dynamic property is unused.

It seems like you need to be checking for the PMU earlier, e.g. in
kvm_arm_get_host_cpu_features.


r~
