Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1200818wrm;
        Thu, 17 Oct 2019 09:44:12 -0700 (PDT)
X-Received: by 2002:ac8:74c9:: with SMTP id j9mr4813072qtr.126.1571330652339;
        Thu, 17 Oct 2019 09:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571330652; cv=none;
        d=google.com; s=arc-20160816;
        b=vXaVxRBe6uePnr9X1VvVX2ZrD283gU7nwLzRQ4tg4PbHlcxwhAZDpqTzmiBsGWxnF7
         UqMIwArtw+NbRKxgmWCdOTjIO41Fo7hs+tbxoPQGSv36RK/W6fQynDoBwOuYA+c8CytV
         Ju71rwouonlAIjvBsdSUKfE/HCc0Q209JL7ChRAIms6cY/HFasomVewnnK/MWeyZ/sXo
         d981abScv9VqJxj7HBA9GtUaV4XMCDbn6Lnx+De9zerstd2vhfjv9+iEI346doAtefa1
         /Azvk9EsJqpDvpuEsc4+4VfiDtLdYco3NZgm39bzIp6A94Yip0J9auIYH1/9VahgyT0q
         7yCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=h9q8Pc+WDp35mofry08Rs0+qfTQt4B5s1h/hLQXXb9E=;
        b=Alo73nztrP1F1n8XdeJLW2iIDNgc05YIyetQfhJbTLMz8j3Vy+NMuhXh/+EeYlQxeU
         iSpAIq0vlnTWjAVMNPM9ru6b75sWt0Yb+txEzEq/rYvYsAP/DbuEGt10GtMHNQB+uz/l
         dNdcabxs8GRDOErWpgLUensLHrb6J0OwBgSJwuh5E3ukyf0kUlu2DYB2Mj9099BrP4gT
         vBobOnybAqeEtLI1KTObw1Ieefeb0Vu2m5XA49HfKxLfiVsjPNBhoTQAtJTYmBg28mgV
         1mrhQfKJaBbr2pz1d/DCQ0iKJFJbqtkwVavJlL4DvZSe6BZCvWfC/FW0lyqromjq6oZs
         9Ttw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SBHaRncs;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <msys.mizuma@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d65sor1374880qke.13.2019.10.17.09.44.12
        (Google Transport Security);
        Thu, 17 Oct 2019 09:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SBHaRncs;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h9q8Pc+WDp35mofry08Rs0+qfTQt4B5s1h/hLQXXb9E=;
        b=SBHaRncs3a0kSYLnMuDQ2muyXiWIgrUCkpK1KCiETHiI75NCpPWyLjXe6vK6HgoSEI
         fxEqyf3n+TpsGpuqPqsLEG3Wce6SbNZj6YTjLT4p5rOr86qbpI+MaYFCY8X2EuwUk2Xa
         1out+lWnpgvjdgyqe/kY7kuS4KOvaITi8XJv9SNkYtOV4KILPBXtMdLdbXj3lsGKy151
         uoRS48TlrhREY3qx19F84KCjJODd9lzfsPWiMgkCD9gNObAYaLZm3Ubve/XDzgc0Kc9W
         3pa3IrTr+0ZXpOEC6ZWgC+rLeW58y8+wq9jP5Q6BAlukaxgBgik2WfSuKPpceVWOOcSm
         ZOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h9q8Pc+WDp35mofry08Rs0+qfTQt4B5s1h/hLQXXb9E=;
        b=TJ9West+ookFZM75cU9aVRMWtnQUYWWcIAhlzs+vs+HXj/wLgejGvDU0M1dIH3d8ie
         tOfOw4Ealhu0pqnuqPdYrKfVdGDbjcN0HUqx1q3IXJJPqJITBX5MH4/rmxo4uP7OA6FH
         jbwg0c6XLtUo4FohPKWOKu8yZZ75DJa8niS31K+p5HXHlTJ2DfFKFiBGHjgZJHRAn96/
         KODWakwtbLLKvtIJbWNe1mEaoWADfRQ71kGsNEz2qGXcaj1NOYjqurmv0Kp3VemYUqRM
         Xl7NZnAkmhsF2RaavVDQKcThKDAn/ZVMShI5wW97XIW9+rtrXNdghbc8rQJKj9EA/bGo
         TXvw==
X-Gm-Message-State: APjAAAVDwdad43Sm8/sgK2wtC0lZx3u1ZMywR7SXX6gyCrnmHUwNlq/3
	eLk7a1jZad4JYm08tTHtJw==
X-Google-Smtp-Source: APXvYqw0Vpegw8MrL+WhVpa1I7mnkNgLDaaOE30Iz//GZDMH3rkNefouS7duIf10J5Dk5RZCSTz1lQ==
X-Received: by 2002:a05:620a:896:: with SMTP id b22mr4247013qka.216.1571330651957;
        Thu, 17 Oct 2019 09:44:11 -0700 (PDT)
Return-Path: <msys.mizuma@gmail.com>
Received: from gabell (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o38sm1871411qtc.39.2019.10.17.09.44.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:44:11 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:44:08 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
	Dave.Martin@arm.com
Subject: Re: [PATCH v6 7/9] target/arm/kvm: scratch vcpu: Preserve input
 kvm_vcpu_init features
Message-ID: <20191017164408.k56d2u3swgkvunyx@gabell>
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-8-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016085408.24360-8-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-TUID: Y1jLJu8Aikys

On Wed, Oct 16, 2019 at 10:54:06AM +0200, Andrew Jones wrote:
> kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
> parameter. Rather than just using it as an output parameter to
> pass back the preferred target, use it also as an input parameter,
> allowing a caller to pass a selected target if they wish and to
> also pass cpu features. If the caller doesn't want to select a
> target they can pass -1 for the target which indicates they want
> to use the preferred target and have it passed back like before.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

This patch works well on aarch64 with SVE machine, thanks!
Please feel free to add:

    Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

- Masa

> ---
>  target/arm/kvm.c   | 20 +++++++++++++++-----
>  target/arm/kvm32.c |  6 +++++-
>  target/arm/kvm64.c |  6 +++++-
>  3 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index f07332bbda30..5b82cefef608 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -66,7 +66,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>                                        int *fdarray,
>                                        struct kvm_vcpu_init *init)
>  {
> -    int ret, kvmfd = -1, vmfd = -1, cpufd = -1;
> +    int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
>  
>      kvmfd = qemu_open("/dev/kvm", O_RDWR);
>      if (kvmfd < 0) {
> @@ -86,7 +86,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          goto finish;
>      }
>  
> -    ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
> +    if (init->target == -1) {
> +        struct kvm_vcpu_init preferred;
> +
> +        ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
> +        if (!ret) {
> +            init->target = preferred.target;
> +        }
> +    }
>      if (ret >= 0) {
>          ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
>          if (ret < 0) {
> @@ -98,10 +105,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>           * creating one kind of guest CPU which is its preferred
>           * CPU type.
>           */
> +        struct kvm_vcpu_init try;
> +
>          while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
> -            init->target = *cpus_to_try++;
> -            memset(init->features, 0, sizeof(init->features));
> -            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> +            try.target = *cpus_to_try++;
> +            memcpy(try.features, init->features, sizeof(init->features));
> +            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
>              if (ret >= 0) {
>                  break;
>              }
> @@ -109,6 +118,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          if (ret < 0) {
>              goto err;
>          }
> +        init->target = try.target;
>      } else {
>          /* Treat a NULL cpus_to_try argument the same as an empty
>           * list, which means we will fail the call since this must
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 2451a2d4bbef..32bf8d6757c4 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -53,7 +53,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          QEMU_KVM_ARM_TARGET_CORTEX_A15,
>          QEMU_KVM_ARM_TARGET_NONE
>      };
> -    struct kvm_vcpu_init init;
> +    /*
> +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> +     * to use the preferred target
> +     */
> +    struct kvm_vcpu_init init = { .target = -1, };
>  
>      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
>          return false;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 850da1b5e6aa..c7ecefbed720 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -502,7 +502,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          KVM_ARM_TARGET_CORTEX_A57,
>          QEMU_KVM_ARM_TARGET_NONE
>      };
> -    struct kvm_vcpu_init init;
> +    /*
> +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> +     * to use the preferred target
> +     */
> +    struct kvm_vcpu_init init = { .target = -1, };
>  
>      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
>          return false;
> -- 
> 2.21.0
> 
> 
