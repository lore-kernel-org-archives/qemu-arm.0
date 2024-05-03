Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1768074ejy;
        Fri, 3 May 2024 02:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyPHc8LSjdQ5UqxDIJtro0E34WTn0I50Fm3+7lLyfJpAiqPkElHhfXCK7F5sL+4GqU0Yvzlk+mDOF3DVAa7wzUlXCeGvaB
X-Received: by 2002:a17:906:5a92:b0:a55:a8a6:aac6 with SMTP id l18-20020a1709065a9200b00a55a8a6aac6mr1208898ejq.54.1714729214745;
        Fri, 03 May 2024 02:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714729214; cv=none;
        d=google.com; s=arc-20160816;
        b=Nx7WLB0mTUd0wJ/YSRQ3Er0qsYN04xuVDHmiySwLjqHilzSQT6Jmr/9mVBJufG/MAf
         l/qEk99G1S/feR9pQCPuwFbwMyu4SF2Tgkz8sZI3iJ6nhcoPWyuKE4n5TkMNFSiUWrtr
         xrmFFZNE6oC/rZQuQSutvBh66TQFv6q6XHN+vG6VcqH9HXy/5TExAIIbqYFG+1hKyBRD
         PvE7iCCyEtA5btW5+oqJP0I3tPkFBIRJIbCdLTh3We9JKQLfPg52UpsfhDknzsNal/89
         8+/ZdJ1tscscPiFYelsT0i3wwrFphh4vySSjtqAr1gLk+bypQnm7lmfA/JlFISn7wwBD
         9Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+aYukAFjSkKANGHcVIV8wuIMZB/UvTg/F4UINqCVkZU=;
        fh=RENRkrd25gjQVBheh+qxHwSs0qNrFpiFwCjvi0Bc1Xo=;
        b=y9kElWSpx2g2qUKNK3zPgGHcNudb4z/jrsKVlsoJmPSmBdhpC8nyetUzXfR/cAUhUB
         NKpCXjnFsvdII8thrStPZq463x3JwcgH/BmwQ7q55iM+0SsaE/+lkvTUcEeJSVMAqtHe
         GeCzQ0Lmd9vWkeKjlUHLpY91z5qqmQc3L+yP+sC3REGl3WrUeO5urrMfT1lPjmukxFZQ
         i04uPDu3Z+CMZ6MaFrWAynbu/53n0bTMIGhtlWc0LaEuZWjuSa7uvnPnPRTy/gbqr0Nz
         zfFNkOxCkHSkA+aA97EJfuhfXHi6kmOOGZAnCub2j7r4cxumZtN6b9CEWDIhRTrpOpQP
         v4Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=leupeN3z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v2-20020a170906292200b00a587ccbf2b3sor1025364ejd.21.2024.05.03.02.40.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 May 2024 02:40:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=leupeN3z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714729214; x=1715334014; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aYukAFjSkKANGHcVIV8wuIMZB/UvTg/F4UINqCVkZU=;
        b=leupeN3zEhYf4mla18jAZeiDgRbSBaGJiSB/4zQn6Xql9qeENrUBLLztnT0y08kuP2
         iY8DzaleA3H5VqXbQH66juil82ysi2cxj+MxteG7awiVDqaP26VNzhM1XWtAAzhpznFV
         J4Jmz2XyQD5WMJHEyZ2uq0Ay9Qhb126nAeqA/2wtMtte6EXyDOv4IYdUtMCfdIIeDZ3h
         zxx2XtT4c6pn1kHJCGkA2q2n845zBKHcrB0lv0F6Qg0965FKo1XjUUbIGXjzKhalRv7q
         Uns69xgxW6swZi4bUUT/QDtZXer1rwT62VrN/Z4oy0n9LEpPfTMd4/UZ2PBlHxDFvnb8
         +/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714729214; x=1715334014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aYukAFjSkKANGHcVIV8wuIMZB/UvTg/F4UINqCVkZU=;
        b=w5rwrnFkhMkiFI0DDYaPOr8+ewCn1cZz45cFVj7PIIVn9os1Cco0agu2xZJDivjD2R
         s3QvK4UK+ISGyqFQ9/kf1LheHZD3Q14tEyGN7/UArf7qY23SmNEIT0PIHFz1pUJptu44
         pWpLgzntnblx/p2CzJj5Mh8JSX7eQ7GL7olI/pTXxl4DALp8gbl+8RPxJDE0ZE2TTY1q
         0qK0yQkfnOZ9z2A6aJ7WFmhS+D6wW0rt8V/2IVWXVsox9OU4qF0U0xAzWqLtHb2ozaj4
         EuVztpPaT+kdwAIZ0zMGXM8Hd67im4ZNxZmE264KbDEvVrx3GccwN/e7EWAjECo9q6IM
         0UPw==
X-Forwarded-Encrypted: i=1; AJvYcCX3/boQEofczvM5ntyj1/Bl5IDB/YWkwlf3tlBDbAVPCMltaz7ijMBUfzKJoz4qJ+ndh8dWfJS2HKK8WDQi+rn3mSq02IY8
X-Gm-Message-State: AOJu0YwqeNxT18zOhAn1rm+GXdL554WmlQniON7X0ElWdz9zT5tpn30S
	4hGpQBAU4B3gw4veIYUf453Vdz9UPg3QNcacYC6SXDtg7bK5CjacExrL/5+ZvFxoZw==
X-Google-Smtp-Source: AGHT+IHIToLEnpdNruYrQBoTyWj2gFK1Cz1QmwFWVv+7gCqdsuJSn9RcpPNSSbr6WOuF0nFrhPsslw==
X-Received: by 2002:a17:907:1b06:b0:a59:9a68:7283 with SMTP id mp6-20020a1709071b0600b00a599a687283mr489708ejc.12.1714729214279;
        Fri, 03 May 2024 02:40:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.179.187])
        by smtp.gmail.com with ESMTPSA id ay20-20020a170906d29400b00a58aff25d77sm1496488ejb.193.2024.05.03.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 02:40:13 -0700 (PDT)
Message-ID: <9747db79-4444-4d31-b014-8c368936cab4@linaro.org>
Date: Fri, 3 May 2024 11:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-2-salil.mehta@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240312020000.12992-2-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AaDBI5FurAS2

Hi Salil,

On 12/3/24 02:59, Salil Mehta wrote:
> KVM vCPU creation is done once during the vCPU realization when Qemu vCPU thread
> is spawned. This is common to all the architectures as of now.
> 
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doesn't
> support vCPU removal. Therefore, its representative KVM vCPU object/context in
> Qemu is parked.
> 
> Refactor architecture common logic so that some APIs could be reused by vCPU
> Hotplug code of some architectures likes ARM, Loongson etc. Update new/old APIs
> with trace events instead of DPRINTF. No functional change is intended here.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>   accel/kvm/trace-events |  5 +++-
>   include/sysemu/kvm.h   | 16 +++++++++++
>   3 files changed, 69 insertions(+), 16 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index a8cecd040e..3bc3207bda 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
>   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>   
>   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>   
>   static inline void kvm_resample_fd_remove(int gsi)
>   {
> @@ -314,14 +315,53 @@ err:
>       return ret;
>   }
>   
> +void kvm_park_vcpu(CPUState *cpu)
> +{
> +    struct KVMParkedVcpu *vcpu;
> +
> +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> +
> +    vcpu = g_malloc0(sizeof(*vcpu));
> +    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
> +    vcpu->kvm_fd = cpu->kvm_fd;
> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> +}
> +
> +int kvm_create_vcpu(CPUState *cpu)
> +{
> +    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
> +    KVMState *s = kvm_state;
> +    int kvm_fd;
> +
> +    trace_kvm_create_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
> +
> +    /* check if the KVM vCPU already exist but is parked */
> +    kvm_fd = kvm_get_vcpu(s, vcpu_id);
> +    if (kvm_fd < 0) {
> +        /* vCPU not parked: create a new KVM vCPU */
> +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
> +        if (kvm_fd < 0) {
> +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", vcpu_id);
> +            return kvm_fd;
> +        }
> +    }
> +
> +    cpu->kvm_fd = kvm_fd;
> +    cpu->kvm_state = s;
> +    cpu->vcpu_dirty = true;
> +    cpu->dirty_pages = 0;
> +    cpu->throttle_us_per_full = 0;
> +
> +    return 0;
> +}

This seems generic enough to be implemented for all accelerators.

See AccelOpsClass in include/sysemu/accel-ops.h.

That said, can be done later on top.
