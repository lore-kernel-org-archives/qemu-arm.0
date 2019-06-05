Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2943102wrg;
        Wed, 5 Jun 2019 02:10:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGQmoJPe+l9n0jAZwuJzPdl9fEZSr+fchjnh6l5/gzeKtfD7sP9l3YQXXfICW3Y2npkh2D
X-Received: by 2002:ac8:414e:: with SMTP id e14mr32198430qtm.74.1559725816567;
        Wed, 05 Jun 2019 02:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559725816; cv=none;
        d=google.com; s=arc-20160816;
        b=EQWYTK8qnrg0t9VwyblrR1jkpDzexi1dkqwXfx6e7iTexRpJJQ7eyFD1CO0FGl8fe9
         pQow6hA7UdJUvzLGzk/aiW4WKXN5pmteRKZIOyD9d7x0OYLvBZ2WIY+hFrCWlhSFbA+N
         36z4rpwbmxTOURngXYxX+i/ePDMmDk18Sz6l9ZD3Azh3oVYbUWHQLNwfRfB1nmmlnRfS
         FPDjCKxA/W1f7humVnlzInxDzGA4VwEh3/1zm7qjRk8BdDCiorZorGK7lQmko19dd0iT
         VPFPhfchkQcTB5wS8iY6+Tyca49k91EoFc5taFSAY8OGqDekocHlaKmcAIFV/m8SD/g7
         8grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=L4Fz3FQ4Gj+upUkBX1/hHhwfOtVk/TMnk/5MwR5l5ww=;
        b=f6w0PAnJ9bdVi/h3ZZ7P2E/wKBC3qX3KfQal7zVz/MaKjIYXRIu+Nimguh4oLI6kas
         tsHiybcRAgEBOegqCrOV1tLKO44rRmc+tWdTW4aTI09XLf4+Wu+brv7pK5Lr0WjHXiDJ
         3ApnGKivXohEQNN/WY5yhAWnhsiWGQKoSnAi/3CBW/vmsJlY84v172xDkJ1V+Y1Gh1N7
         r3nAlOLvua8n+GBSt6a5itIvA70Iw9fvYQkE/7XgW9QJVwrJLsJGI6gLkZ7dPLNBHUzw
         Rr1SGpHtvEbmvQdrn/3c8XwxuAh2+zJEGLAyCqWqdanpES0OI1zcBL4PM3xpZE2mXQ+R
         8iKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h187si10859288qkf.225.2019.06.05.02.10.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 02:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B254330C0DE3;
	Wed,  5 Jun 2019 09:10:04 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 503CC1001E63;
	Wed,  5 Jun 2019 09:09:57 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 06/13] target/arm/kvm: max cpu: Enable SVE
 when available
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, abologna@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-7-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <53832876-c973-7176-1c84-897a489f3656@redhat.com>
Date: Wed, 5 Jun 2019 11:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-7-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 05 Jun 2019 09:10:10 +0000 (UTC)
X-TUID: 0n33acpATCwh

Hi Drew,

On 5/12/19 10:36 AM, Andrew Jones wrote:
> Enable SVE in the KVM guest when the 'max' cpu type is configured
> and KVM supports it. KVM SVE requires use of the new finalize
> vcpu ioctl, so we add that now too.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu64.c   |  1 +
>  target/arm/kvm.c     |  5 +++++
>  target/arm/kvm64.c   | 16 +++++++++++++++-
>  target/arm/kvm_arm.h | 12 ++++++++++++
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 228906f26786..6c19ef6837d5 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -292,6 +292,7 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        cpu->sve_max_vq = ARM_MAX_VQ;
same line in the !kvm_enabled path. Maybe you can set the sve_max_vq
field in a subsequent patch and just introduce the finalize and
capability checking in that patch?
>      } else {
>          uint64_t t;
>          uint32_t u;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 599563461264..c51db4229d0f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -50,6 +50,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
>      return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
>  }
>  
> +int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
> +{
> +    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
> +}
> +
>  void kvm_arm_init_serror_injection(CPUState *cs)
>  {
>      cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 86362f4cd7d0..c2d92df75353 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -622,13 +622,20 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
>      if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> -            cpu->has_pmu = false;
> +        cpu->has_pmu = false;
nit: maybe document this unrelated indent fix in the commit msg?
>      }
>      if (cpu->has_pmu) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>      } else {
>          unset_feature(&env->features, ARM_FEATURE_PMU);
>      }
> +    if (cpu->sve_max_vq) {
> +        if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SVE)) {
> +            cpu->sve_max_vq = 0;
> +        } else {
> +            cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> +        }
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> @@ -636,6 +643,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          return ret;
>      }
>  
> +    if (cpu->sve_max_vq) {
> +        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
>      /*
>       * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
>       * Currently KVM has its own idea about MPIDR assignment, so we
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 2a07333c615f..c488ec3ab410 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -27,6 +27,18 @@
>   */
>  int kvm_arm_vcpu_init(CPUState *cs);
>  
> +/**
> + * kvm_arm_vcpu_finalize
> + * @cs: CPUState
> + * @feature: int
feature bitmap or bit?
> + *
> + * Finalizes the configuration of the specified VCPU feature
> + * by invoking the KVM_ARM_VCPU_FINALIZE ioctl.
> + *
> + * Returns: 0 if success else < 0 error code
> + */
> +int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
> +
>  /**
>   * kvm_arm_register_device:
>   * @mr: memory region for this device
> 
