Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp2106725ejy;
        Fri, 3 May 2024 11:22:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaMw1G2e1AQeKIaPA/V4wSkzg5envKvd8gQH9vy7axMPbkJMx8+T0O25+rldS+swWH4IW2fWQjD+Idmtia8WWvjRC7cbql
X-Received: by 2002:a17:906:40ca:b0:a59:6ea2:aa85 with SMTP id a10-20020a17090640ca00b00a596ea2aa85mr2181184ejk.52.1714760568116;
        Fri, 03 May 2024 11:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714760568; cv=none;
        d=google.com; s=arc-20160816;
        b=BmaPhN0zz7q+5tCD3QFD79wW78M0yOWstOh6p7Xs8B6UhwpuHHJB7gO7ewCNGoO9iC
         CEjclbQY4MaospGQaGmBxMUsgX8jNx5Ia/dvOzLxJrBzaDVHcwXl2pYgBIrdAotOajI5
         1zrJsLWO7Tk1zlyeeN8+LpV7MHmM9SZ8l+x9yRogvg/G/Up4QHE1ThNNmZ9sRiC/ZSrL
         8HbnPqEF31Q3HkUQPFbl8CEu5AfA8fIG95qBECBX2TXT9rumILNVLDGxnVlnHuiERHgb
         Wrn3ijb9/encl5l+aI7x/r2vCCpSfWsHt+bWbM1eTDaUvl1bN1/6rpMYGihQR67ZMdN+
         ej9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R0B8Kp8I+pZe8HtYdpqqePpbeGetGBTcIfaEC3SQF7A=;
        fh=sn2od667VcwUt5+49x1vP5gZwEiDs45EFwSRkBm/h/0=;
        b=khMuTYZXtbR9AK5lNAvSVsYlv/k8JQrmPw05mVVBOZFcY1q4Fr4Fk+umEeO0nnfZ72
         F3Z15Uttyr8JY0TJQ6FSWI8zaWEyubKB5wKKqFGqWRj1fP2vnYtEN25JD61d1LY7ksIu
         NQPoTVKWlZBpxmbSCoJAKKtQ7v270zvYCASSHpky6Zg1G9rsKmPaOx7Y078wkDOKdvge
         UCh3h2hmS1WJKxbvkKXJ+KGaACPhOSbpi0fxvB8xaVrDyakhXPSv4e0ATl7o6bxGMFmh
         RbDHz/D9W7Qgss3+QP70QRBlj89q0zV5moNH5qlyw+xItr8X3SqNebHqV5xE4/SN6k2y
         Thjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aakBNIMe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kx1-20020a170907774100b00a558f2865e1sor1146929ejc.13.2024.05.03.11.22.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 May 2024 11:22:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aakBNIMe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714760568; x=1715365368; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0B8Kp8I+pZe8HtYdpqqePpbeGetGBTcIfaEC3SQF7A=;
        b=aakBNIMebQ9cKByJ37thtPnm1excW821Wwk6ns9lAlPCYLfE8Ulzc12xxSI3eY8lI5
         7ktDLmd/xAyZPp9//HAw/XwKGBhKtd+J3CaHCR5sifGMzuFSJ5QqMnDUoCIa8GHv5J2H
         Nwft2wvxUscwBKDARjH9cI2Hv2njHTyZoEuk6JkEvQiNlZVJDErd6uUUfOdfRwr0XWR1
         F+8nyJrwXVgsmL3VUo3VznP+VphGi4l5FVoHg2hIK9zkKU9j6CWGu5cHNeodMOhK9Abb
         XRMyQE6UoXo2ettlwOgR+IA91jYZoLy1sKcR0fEQz5HPTwwl9sWCxc2zWGEvQgbigjy+
         rEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760568; x=1715365368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0B8Kp8I+pZe8HtYdpqqePpbeGetGBTcIfaEC3SQF7A=;
        b=uZe6PJCpayVi+sXXlfqXo2K4mYc0oNXYbPIutoLl+juxAOEpxYrI5TBER0vb2aaUKl
         Gc8As/Ndeydt97+6HOGa9kCvzjRsHg5om+YjM5WB3bZ4CX02QGjW+Cgc1WEUT01SXCpc
         u1fJ4g3R2JLvP9rGolJDiDvb445IA/TPNNJ3o5xc3UD2YqDFy8Kr4PG9cQe4hF3zP0Op
         mpOrZ3xwcVXH5Jm613TueAYJDGEDUEwMdtkInicN4KDpy5Z1nimTWjpfQW1rCVhPogzH
         PJ4brH+0/vVkqgVAny2WjHNs7KsbquubuHnXII13F0DkA32X53ildr2L2qO7ydOED5wX
         hL4A==
X-Forwarded-Encrypted: i=1; AJvYcCXvLeoNyMngb/MniObd0FZRg27ikOER8CnVaKb0owLHVVsezRbcEVf85IppDeetQhgrGUAPnVZ3cVinASUCymkPwbY2f9Ei
X-Gm-Message-State: AOJu0YypYItawr8eHQDUhFJRy7rf050LaRG1YHoEj37tPZtApfy8H55n
	IL/bL/ve5ZvpRayV6/jRz2JqSjfERtjirQ27ZOvq/UYkYkkzmPW6+kSqaZzDUbZ4Jw==
X-Google-Smtp-Source: AGHT+IHaRKSzLB8eo2c1V8i9ct56vfFLivlDJKBcAPOObW/FTJ24uCx1lmd1NBR1l4qpEETGpNpOaA==
X-Received: by 2002:a17:906:4f0f:b0:a58:e569:1242 with SMTP id t15-20020a1709064f0f00b00a58e5691242mr1929230eju.4.1714760567635;
        Fri, 03 May 2024 11:22:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.179.187])
        by smtp.gmail.com with ESMTPSA id l2-20020a17090615c200b00a58f15b070dsm1952439ejd.43.2024.05.03.11.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 11:22:47 -0700 (PDT)
Message-ID: <2f817b76-8090-418b-8547-98d366c52838@linaro.org>
Date: Fri, 3 May 2024 20:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 Linuxarm <linuxarm@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-2-salil.mehta@huawei.com>
 <9747db79-4444-4d31-b014-8c368936cab4@linaro.org>
 <ed20ba7ef8d949fea9b81ed194c59bf6@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ed20ba7ef8d949fea9b81ed194c59bf6@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yb1uvJCqMpLh

On 3/5/24 17:57, Salil Mehta wrote:
> Hi Philippe,
> 
>>   From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>   Sent: Friday, May 3, 2024 10:40 AM
>>   Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU
>>   {creation,parking} code
>>   
>>   Hi Salil,
>>   
>>   On 12/3/24 02:59, Salil Mehta wrote:
>>   > KVM vCPU creation is done once during the vCPU realization when Qemu
>>   > vCPU thread is spawned. This is common to all the architectures as of now.
>>   >
>>   > Hot-unplug of vCPU results in destruction of the vCPU object in QOM
>>   > but the corresponding KVM vCPU object in the Host KVM is not destroyed
>>   > as KVM doesn't support vCPU removal. Therefore, its representative KVM
>>   > vCPU object/context in Qemu is parked.
>>   >
>>   > Refactor architecture common logic so that some APIs could be reused
>>   > by vCPU Hotplug code of some architectures likes ARM, Loongson etc.
>>   > Update new/old APIs with trace events instead of DPRINTF. No functional
>>   change is intended here.
>>   >
>>   > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>   > Reviewed-by: Gavin Shan <gshan@redhat.com>
>>   > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>   > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>   > Tested-by: Xianglai Li <lixianglai@loongson.cn>
>>   > Tested-by: Miguel Luis <miguel.luis@oracle.com>
>>   > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>>   > ---
>>   >   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++------
>>   ----
>>   >   accel/kvm/trace-events |  5 +++-
>>   >   include/sysemu/kvm.h   | 16 +++++++++++
>>   >   3 files changed, 69 insertions(+), 16 deletions(-)
>>   >
>>   > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c index
>>   > a8cecd040e..3bc3207bda 100644
>>   > --- a/accel/kvm/kvm-all.c
>>   > +++ b/accel/kvm/kvm-all.c
>>   > @@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
>>   >   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>>   >
>>   >   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
>>   > +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>>   >
>>   >   static inline void kvm_resample_fd_remove(int gsi)
>>   >   {
>>   > @@ -314,14 +315,53 @@ err:
>>   >       return ret;
>>   >   }
>>   >
>>   > +void kvm_park_vcpu(CPUState *cpu)
>>   > +{
>>   > +    struct KVMParkedVcpu *vcpu;
>>   > +
>>   > +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>   > +
>>   > +    vcpu = g_malloc0(sizeof(*vcpu));
>>   > +    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>>   > +    vcpu->kvm_fd = cpu->kvm_fd;
>>   > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node); }
>>   > +
>>   > +int kvm_create_vcpu(CPUState *cpu)
>>   > +{
>>   > +    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
>>   > +    KVMState *s = kvm_state;
>>   > +    int kvm_fd;
>>   > +
>>   > +    trace_kvm_create_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>   > +
>>   > +    /* check if the KVM vCPU already exist but is parked */
>>   > +    kvm_fd = kvm_get_vcpu(s, vcpu_id);
>>   > +    if (kvm_fd < 0) {
>>   > +        /* vCPU not parked: create a new KVM vCPU */
>>   > +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
>>   > +        if (kvm_fd < 0) {
>>   > +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu",  vcpu_id);
>>   > +            return kvm_fd;
>>   > +        }
>>   > +    }
>>   > +
>>   > +    cpu->kvm_fd = kvm_fd;
>>   > +    cpu->kvm_state = s;
>>   > +    cpu->vcpu_dirty = true;
>>   > +    cpu->dirty_pages = 0;
>>   > +    cpu->throttle_us_per_full = 0;
>>   > +
>>   > +    return 0;
>>   > +}
>>   
>>   This seems generic enough to be implemented for all accelerators.
>>   
>>   See AccelOpsClass in include/sysemu/accel-ops.h.
>>   
>>   That said, can be done later on top.
> 
> Let me understand correctly. Are you suggesting to implement above even for
> HVF, TCG, QTEST etc?

Not for you to implement the other non-KVM accelerators, but since
you are introducing this, now is a good time to think about a generic
interface.

So far AccelOpsClass::[un]park_vcpu() handlers make sense to me.

> Thanks
> Salil.
> 
> 
> 
> 
