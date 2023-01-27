Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1477478ejc;
        Fri, 27 Jan 2023 14:19:32 -0800 (PST)
X-Received: by 2002:a17:903:22c9:b0:191:e0b0:f8df with SMTP id y9-20020a17090322c900b00191e0b0f8dfmr55322932plg.58.1674857971976;
        Fri, 27 Jan 2023 14:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674857971; cv=none;
        d=google.com; s=arc-20160816;
        b=f2EBcw+VDgvDvvdhECSoVi4L7OzO7qFYKGqimFu/4R4yJS1YOpkHy4j7NzHxhqNlb/
         6qljYPKVTbsXoLQisnDfdRRpXynvooYfXWvJUxTA5YlUv33y/nyLy0EyWkYDOZyqHeJu
         gq0g5PEMsJfAO24zuScHWPzQe9MwJLv9i2tqraQ8P8eCDf1RZeVzJjuapniDthgqwmJp
         GBDoluacXw0gTiv2j1QK+Lg71vMr80qs9xV8Ao4Iz122DPS+yzZJ0SJrjoobOaDUq2uG
         FHnl83Bz562608Pwq2OjoL4sHMClL6JhCX3bmf5tNj9bxJvH1ChTWDY70tlC2byTr5Pz
         9D1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2F0G/KYZ18cB3iNKPz0P3iOhR9Epfc6t0GxL0CsPIEo=;
        b=WQLENda8nap3Tff3RFKa3Tb6gumku++3drZC4KkZkjyZQepn9gL7M2qk7DZiIW7TLZ
         klHAP8yY4ok0kO+9wuCvd9u9Ef2pF1vwN4BWA3fEYV1mjxjVp16An7JdYvMmsoN3mAky
         05Uq2IU3YFVyMTyjXrhU9MckwYYiJ1kbCz7paLAu20vUZ1jZlFeNr1Vz6UsNgmogj7uT
         fPX1qJDTQ+IIiL1cG4nO6NA72R30uA2J8b3zpHlRXI3xQ636pMNxppESTTNqOidzewqC
         kjbRshh/Vm4YzcAanee2eiql47sEAuGj30gZEZVgu1NB/Lsvk49muRVCvU46QmGDsSIZ
         MNwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ah1h6zUX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a2-20020a1709027e4200b00194d4f9e9f6sor2539741pln.5.2023.01.27.14.19.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 14:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ah1h6zUX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F0G/KYZ18cB3iNKPz0P3iOhR9Epfc6t0GxL0CsPIEo=;
        b=ah1h6zUX7Ig8OzT0bhI+tRViLelxk3Hx2gbF4XcnBlhTxwrVUsQLyyXX+u9bj+QnPd
         EzdhwSJAuxdgrDonDze5+bUBwqa5wlLNvpOGbpRF08UjG+U2aFM53iH72F9itLCVAsVZ
         37ckuS4q+m3VfYxYhHmxs4n20U7saX34ycY72BwYSjsnhw8C4nPk1ufA3uKEyPKZmqdP
         cjgT32mWJ8rMVIYlzzOY4B29glEElVLXyUgs8zus5I8p3+9HAFx7VrGf3eGXUVBJ/7z+
         9be3UxzBxBZgMvvF3XewsN/XxbrpM8CQgszBnWBwjmjbhSPAKHVUjjfdKf0sZHauSqYN
         4kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F0G/KYZ18cB3iNKPz0P3iOhR9Epfc6t0GxL0CsPIEo=;
        b=xBOrtMf+jQoZx19Rim6tfGEnRju3J1k3Ogz1dBdC/IoHU4Gc46DvW6kG5wz72bX0o9
         6tw/TgrNdtL7zmw4i3eni+iB0Er4pFzYpaD5V2sOitp/IbdEWcb6nKrSJZMg3jpr/2fp
         kKXUbMboL9o7RnPva/1M2xF5Ut13LEkoZOoN1f5ihkF0B5s4XyNeyOVp7ONMkFFv+pbU
         +0Fti/MKOApCaQX5FqZQjWe95eMk/n+sOR2V56IbOhOGn25jZ+ok3LXaVC2jXDtfHzE5
         1Kx0s6zwI0natgkKR4G4GqzfFU1JTJYehNkNYt1kZY4OsWr3FGzYeqPeQLx1k+K/d4ds
         By5g==
X-Gm-Message-State: AFqh2kpkWEgwIWT3lMzAVXLBDxBoxDyA/Zk2jWrKucR9K+ATJw2Vh3un
	9rFqgGOpeT/YgYjfZ4XndZZTeAii
X-Google-Smtp-Source: AMrXdXtkSb76iuI4yLfek+BJ7WDwNji/pgUKtHI00AbsKbAiF40o7jToP7zdzwMk+N0GR4PLLG2eIA==
X-Received: by 2002:a17:903:124c:b0:194:d664:be3a with SMTP id u12-20020a170903124c00b00194d664be3amr37843329plh.16.1674857971443;
        Fri, 27 Jan 2023 14:19:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902744700b001948ff5cc32sm3323606plt.215.2023.01.27.14.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:19:30 -0800 (PST)
Message-ID: <ec1ca676-8dcc-e18b-4f86-0cb6238c0816@linaro.org>
Date: Fri, 27 Jan 2023 12:19:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-7-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-7-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /+AH+dlV7X+N

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
> realm. RME support does not use the register lists, because the host can
> only set the boot PC and registers x0-x7. The rest is private to the
> Realm and saved/restored by the RMM.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   target/arm/cpu.h     |  3 ++
>   target/arm/kvm_arm.h |  1 +
>   target/arm/helper.c  |  8 ++++++
>   target/arm/kvm-rme.c | 10 +++++++
>   target/arm/kvm.c     | 12 ++++++++
>   target/arm/kvm64.c   | 65 ++++++++++++++++++++++++++++++++++++++++++--
>   6 files changed, 97 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9aeed3c848..7d8397985f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -937,6 +937,9 @@ struct ArchCPU {
>       /* KVM steal time */
>       OnOffAuto kvm_steal_time;
>   
> +    /* Realm Management Extension */
> +    bool kvm_rme;
> +
>       /* Uniprocessor system with MP extensions */
>       bool mp_is_up;
>   
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 00d3df8cac..e4dc7fbb8d 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -373,6 +373,7 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
>   int kvm_arm_rme_vm_type(MachineState *ms);
>   
>   bool kvm_arm_rme_enabled(void);
> +int kvm_arm_rme_vcpu_init(CPUState *cs);
>   
>   #else
>   
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d8c8223ec3..52360ae2ff 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -126,6 +126,10 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }
> +
>       for (i = 0; i < cpu->cpreg_array_len; i++) {
>           uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>           const ARMCPRegInfo *ri;
> @@ -171,6 +175,10 @@ bool write_list_to_cpustate(ARMCPU *cpu)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }
> +
>       for (i = 0; i < cpu->cpreg_array_len; i++) {
>           uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>           uint64_t v = cpu->cpreg_values[i];
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index d7cdca1cbf..3833b187f9 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -118,6 +118,16 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
>       return 0;
>   }
>   
> +int kvm_arm_rme_vcpu_init(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    if (kvm_arm_rme_enabled()) {
> +        cpu->kvm_rme = true;
> +    }
> +    return 0;
> +}
> +
>   int kvm_arm_rme_vm_type(MachineState *ms)
>   {
>       if (cgs_to_rme(ms->cgs)) {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index f022c644d2..fcddead4fe 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -449,6 +449,10 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
>       int i, ret, arraylen;
>       CPUState *cs = CPU(cpu);
>   
> +    if (cpu->kvm_rme) {
> +        return 0;
> +    }
> +
>       rl.n = 0;
>       ret = kvm_vcpu_ioctl(cs, KVM_GET_REG_LIST, &rl);
>       if (ret != -E2BIG) {
> @@ -521,6 +525,10 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }
> +
>       for (i = 0; i < cpu->cpreg_array_len; i++) {
>           struct kvm_one_reg r;
>           uint64_t regidx = cpu->cpreg_indexes[i];
> @@ -557,6 +565,10 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }

I don't think that simply returning "ok" is best.  We shouldn't be calling this function 
at all with rme enabled.


r~
