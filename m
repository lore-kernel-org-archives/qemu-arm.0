Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2962241njb;
        Mon, 8 Jul 2024 16:30:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWF6kxBEovd3+92vOCia1q6YGF4CjqSQ/HxR5bv8gxencBOAiMfTLDytWo9/Ok2L7J9wFvnwDkqB1SFxEs+5+Y0VmxmLDQn
X-Received: by 2002:adf:9798:0:b0:35e:6472:4390 with SMTP id ffacd0b85a97d-367cea6b7c9mr599956f8f.27.1720481404258;
        Mon, 08 Jul 2024 16:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720481404; cv=none;
        d=google.com; s=arc-20160816;
        b=zRR0bdBxWNXEijpk1SwFVjOA7BFM9RFQBZ2k4YSUg9dM6+HVaNqiZ3Wvet33kXivrf
         bc9eGmXd2p7Y9hFXcdN0GB8yiqin6Fk6O6mM/Ff+3pi8R/yxE0Zx50GSReRX45w2pHf1
         9YG9yJuAilhuYd+g/rHsI4VVIpi7/thefq6x4PjCOTADUcHGs8YDEc7RCNEblhjWk231
         NOVxKynfcVK9xbWTDEqjUMhI9aJBczA++BZT31XUXQ4wQwb3PXsL8EYU2vfg8pFVggJw
         /1TaDZFMBDLqzWznZxuSww1HK9sN+mc2U3YHc05JEAAhgKou5Z+OdzC3i7+YPp1jZevB
         3pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LeEWBDUnSE8T2MXF9CJ5tN8DkUm3ThWysb2CZv2tP6s=;
        fh=3zaRt+rVTtQG3OugXoOCirDYVTkHxxNLMAgGDfJmyWg=;
        b=gxiuAU6bfnenWQvSfqER3NMuV2AC/21ZWNbPa0XkDiZs17UXfSIYGUPMDJJh6xSui/
         z/kL+wkFGLaOP8TgIcZ4L7jhQM6y4mSbzgGQxFtkAPbLyGaQTadHPm0Gi5nIpp5IZr17
         dPpJSUBIlK7HZzZuD3bSu5LlXXgN26N7I9wAqr7Vl/WoQ4usOZkhHeYNFsydPRqYMt8U
         8bsSQHPuxoxTI8+XEmzg8tMHV1k6q+GWSpincCeeBq9CYA3E/Pb3EbwN2+mQPy/gnFVr
         UtdP82UbdaZIeOaxPF0s9UgwziYJ0UYUiLATNNRUVbW+RbdFJZIbMklxFWgaxUNbQAPb
         tJmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="gu/5Uj0j";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-367cdfa07fasor281203f8f.6.2024.07.08.16.30.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Jul 2024 16:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="gu/5Uj0j";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720481404; x=1721086204; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LeEWBDUnSE8T2MXF9CJ5tN8DkUm3ThWysb2CZv2tP6s=;
        b=gu/5Uj0jevhCVB2h59sScdHx1kEzHT4jm+smm8h1OUSRxbyRkiweebi4itR365b1Rd
         uApx3MlHqOGxmEK840ztnTWWCE6mwAa5nzlZ8NlxZCLVcR+q1seZscErJ+C052nF7dcr
         XCrxvHLzHO7LGVqxnPtvbsoook0bkdNYFJ9KXLzY+cb5UOQPWvfrO6a2eCP/6V/hF8Gh
         s6SIyAR/cNDhjHuKQn6K1LNUU9XRrAqMZXUM5A748sbyGHYpxd9g0rf2xjRL66MO50+2
         t5LzGCdlVGzp4tjQN+vTGd7N/jqmQMXQtbBSvngtu9y7mJiam9pZUSJKpgsd8aN3WWW/
         umcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720481404; x=1721086204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LeEWBDUnSE8T2MXF9CJ5tN8DkUm3ThWysb2CZv2tP6s=;
        b=HfebqwXijItksovA7CakVHvHSY8bwEWgjVpZZGd07G2fhmM8sOhTHGg//iR2jfTC3E
         MwpvrSeTpNMrUUluKUEF6L/wDfgmuNj4u+CSJiBUR/MJf+F2JQQ6rDIcJzaGYTn1+92V
         4//24VRuRI7L445I04DiyqwRPDytq1fQQkpn+4aaFHZlcoBF7Y4K6nGrelzhglzGVmRP
         dPbsss1ODpsrMU5KyXqo90cwfT8ovQ3xf58/QiKSSYMUdwpQbgZiSgdF1kaEz/xlYTfM
         ytxDtSNmp9x4x5G3c1XC8UHAJ1VWYw30t5F34xKpDV1Ty2CblCbDjD8ZeYXe3rXQtU1s
         EFaw==
X-Forwarded-Encrypted: i=1; AJvYcCVnCVo1ikK3jXKWU8Cogtty5OpK4u6L78otQ8LRJmeFSFFpqFJC1U2jHeAlJgl8Yt0FLTHU+FS4VfS361KYTj5Nw4hsIVtv
X-Gm-Message-State: AOJu0YwTbe98HVbaAvCmKZ27tvA7uKI4eGwBzo75MFxL3lMhwk14RXew
	lc82ItuRZrAMQ3/iUPraD16xUMVE/dT9RJC5lW9hS3oosvjuihz74a7vgpbu9B0=
X-Google-Smtp-Source: AGHT+IHP0vovMVmZCvndeaWDmOXmntewIztKETapk+hpuVJ+e/n1Yx/5tfrhESgvhnukqf/+pKPPvQ==
X-Received: by 2002:a5d:4ac5:0:b0:367:9792:8bd4 with SMTP id ffacd0b85a97d-367ceac4988mr688827f8f.43.1720481403463;
        Mon, 08 Jul 2024 16:30:03 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e0b19sm14666225e9.2.2024.07.08.16.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 16:30:03 -0700 (PDT)
Message-ID: <01c2df70-0189-4519-8f15-7b96ba315d7a@opnsrc.net>
Date: Mon, 8 Jul 2024 23:30:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Igor Mammedov <imammedo@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-2-salil.mehta@huawei.com>
 <20240706151154.7c430b0a@imammedo.users.ipa.redhat.com>
 <CAJ7pxeZV6qmDR8aXE5LaDZdjvGCJhnE4RZeL4823XqaiDApe1Q@mail.gmail.com>
 <20240708153216.0d6d1ad1@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240708153216.0d6d1ad1@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: X/pODUJaXWgC

Hi Igor,

On 08/07/2024 13:32, Igor Mammedov wrote:
> On Sat, 6 Jul 2024 15:43:01 +0000
> Salil Mehta <salil.mehta@opnsrc.net> wrote:
>
>> Hi Igor,
>> Thanks for taking out time to review.
>>
>> On Sat, Jul 6, 2024 at 1:12 PM Igor Mammedov <imammedo@redhat.com> wrote:
>>
>>> On Fri, 7 Jun 2024 12:56:42 +0100
>>> Salil Mehta <salil.mehta@huawei.com> wrote:
>>>   
>>>> KVM vCPU creation is done once during the vCPU realization when Qemu
>>> vCPU thread
>>>> is spawned. This is common to all the architectures as of now.
>>>>
>>>> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but
>>> the
>>>> corresponding KVM vCPU object in the Host KVM is not destroyed as KVM
>>> doesn't
>>>> support vCPU removal. Therefore, its representative KVM vCPU
>>> object/context in
>>>> Qemu is parked.
>>>>
>>>> Refactor architecture common logic so that some APIs could be reused by
>>> vCPU
>>>> Hotplug code of some architectures likes ARM, Loongson etc. Update
>>> new/old APIs
>>>> with trace events. No functional change is intended here.
>>>>
>>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>>>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>>>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>>>> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>>>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>>>> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>>>> Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>>>> ---
>>>>   accel/kvm/kvm-all.c    | 95 ++++++++++++++++++++++++++++--------------
>>>>   accel/kvm/kvm-cpus.h   |  1 -
>>>>   accel/kvm/trace-events |  5 ++-
>>>>   include/sysemu/kvm.h   | 25 +++++++++++
>>>>   4 files changed, 92 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>>> index c0be9f5eed..8f9128bb92 100644
>>>> --- a/accel/kvm/kvm-all.c
>>>> +++ b/accel/kvm/kvm-all.c
>>>> @@ -340,14 +340,71 @@ err:
>>>>       return ret;
>>>>   }
>>>>
>>>> +void kvm_park_vcpu(CPUState *cpu)
>>>> +{
>>>> +    struct KVMParkedVcpu *vcpu;
>>>> +
>>>> +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>>> +
>>>> +    vcpu = g_malloc0(sizeof(*vcpu));
>>>> +    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>>>> +    vcpu->kvm_fd = cpu->kvm_fd;
>>>> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>>>> +}
>>>> +
>>>> +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
>>>> +{
>>>> +    struct KVMParkedVcpu *cpu;
>>>> +    int kvm_fd = -ENOENT;
>>>> +
>>>> +    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
>>>> +        if (cpu->vcpu_id == vcpu_id) {
>>>> +            QLIST_REMOVE(cpu, node);
>>>> +            kvm_fd = cpu->kvm_fd;
>>>> +            g_free(cpu);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    trace_kvm_unpark_vcpu(vcpu_id, kvm_fd > 0 ? "unparked" : "not found
>>> parked");
>>>> +
>>>> +    return kvm_fd;
>>>> +}
>>>> +
>>>> +int kvm_create_vcpu(CPUState *cpu)
>>>> +{
>>>> +    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
>>>> +    KVMState *s = kvm_state;
>>>> +    int kvm_fd;
>>>> +
>>>> +    /* check if the KVM vCPU already exist but is parked */
>>>> +    kvm_fd = kvm_unpark_vcpu(s, vcpu_id);
>>>> +    if (kvm_fd < 0) {
>>>> +        /* vCPU not parked: create a new KVM vCPU */
>>>> +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
>>>> +        if (kvm_fd < 0) {
>>>> +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu",
>>> vcpu_id);
>>>> +            return kvm_fd;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    cpu->kvm_fd = kvm_fd;
>>>> +    cpu->kvm_state = s;
>>>> +    cpu->vcpu_dirty = true;
>>>> +    cpu->dirty_pages = 0;
>>>> +    cpu->throttle_us_per_full = 0;
>>>> +
>>>> +    trace_kvm_create_vcpu(cpu->cpu_index, vcpu_id, kvm_fd);
>>>> +
>>>> +    return 0;
>>>> +}
>>> Is there any reason why you are embedding/hiding kvm_state in new API
>>> instead of passing it as argument (all callers have it defined, so why not
>>> reuse that)?
>>>   
>> It is a global variable and I don't think it is a usual practice to specify
>> the global variable
>> as an input parameter.
> Ideally, global would be accessed once at API boundary entry
> and the passed as an argument to functions it calls.
> It makes it easier to follow as opposed to mixed access we have now,
> which is harder to review since one has to check both
> flavors (argument passed or directly accessed).
>
> in this patch  kvm_init_vcpu() calls new kvm_create_vcpu()
> and the former caches these global into 's' local variable,
> so I'd reuse that local variable like kvm_get_vcpu() you are removing here did.
That is one perspective, but:
1. kvm_create_vcpu() will also be called externally from other contexts.
    It would be awkward to pass this variable from those non-local places
    where it would seem unnecessary.
2. If you look at other symmetrical functions like kvm_destroy_vcpu(),
    they also have a similar prototype.

I think it is about doing a slight trade-off. If you really believe this
change is necessary for us to proceed, I will make the adjustment.
However, please note that it will affect the IBM team as well.

Hi Nick,

I hope you are okay with this suggested change?

Thanks,
Salil
>>> otherwise patch lgtm
>>
>> May I request your Reviewed-by for this patch?
>>
>> Thanks
>> Salil.
>>
>>
>>>   
>>>> +
>>>>   static int do_kvm_destroy_vcpu(CPUState *cpu)
>>>>   {
>>>>       KVMState *s = kvm_state;
>>>>       long mmap_size;
>>>> -    struct KVMParkedVcpu *vcpu = NULL;
>>>>       int ret = 0;
>>>>
>>>> -    trace_kvm_destroy_vcpu();
>>>> +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>>>
>>>>       ret = kvm_arch_destroy_vcpu(cpu);
>>>>       if (ret < 0) {
>>>> @@ -373,10 +430,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>>>>           }
>>>>       }
>>>>
>>>> -    vcpu = g_malloc0(sizeof(*vcpu));
>>>> -    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>>>> -    vcpu->kvm_fd = cpu->kvm_fd;
>>>> -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>>>> +    kvm_park_vcpu(cpu);
>>>>   err:
>>>>       return ret;
>>>>   }
>>>> @@ -389,24 +443,6 @@ void kvm_destroy_vcpu(CPUState *cpu)
>>>>       }
>>>>   }
>>>>
>>>> -static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
>>>> -{
>>>> -    struct KVMParkedVcpu *cpu;
>>>> -
>>>> -    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
>>>> -        if (cpu->vcpu_id == vcpu_id) {
>>>> -            int kvm_fd;
>>>> -
>>>> -            QLIST_REMOVE(cpu, node);
>>>> -            kvm_fd = cpu->kvm_fd;
>>>> -            g_free(cpu);
>>>> -            return kvm_fd;
>>>> -        }
>>>> -    }
>>>> -
>>>> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
>>>> -}
>>>> -
>>>>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>>>   {
>>>>       KVMState *s = kvm_state;
>>>> @@ -415,19 +451,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>>>
>>>>       trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>>>
>>>> -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>>>> +    ret = kvm_create_vcpu(cpu);
>>>>       if (ret < 0) {
>>>> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu
>>> failed (%lu)",
>>>> +        error_setg_errno(errp, -ret,
>>>> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
>>>>                            kvm_arch_vcpu_id(cpu));
>>>>           goto err;
>>>>       }
>>>>
>>>> -    cpu->kvm_fd = ret;
>>>> -    cpu->kvm_state = s;
>>>> -    cpu->vcpu_dirty = true;
>>>> -    cpu->dirty_pages = 0;
>>>> -    cpu->throttle_us_per_full = 0;
>>>> -
>>>>       mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>>>>       if (mmap_size < 0) {
>>>>           ret = mmap_size;
>>>> diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
>>>> index ca40add32c..171b22fd29 100644
>>>> --- a/accel/kvm/kvm-cpus.h
>>>> +++ b/accel/kvm/kvm-cpus.h
>>>> @@ -22,5 +22,4 @@ bool kvm_supports_guest_debug(void);
>>>>   int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr
>>> len);
>>>>   int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr
>>> len);
>>>>   void kvm_remove_all_breakpoints(CPUState *cpu);
>>>> -
>>>>   #endif /* KVM_CPUS_H */
>>>> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
>>>> index 681ccb667d..37626c1ac5 100644
>>>> --- a/accel/kvm/trace-events
>>>> +++ b/accel/kvm/trace-events
>>>> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd
>>> %d, type 0x%x, arg %p"
>>>>   kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to
>>> retrieve ONEREG %" PRIu64 " from KVM: %s"
>>>>   kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to
>>> set ONEREG %" PRIu64 " to KVM: %s"
>>>>   kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id:
>>> %lu"
>>>> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id, int kvm_fd)
>>> "index: %d, id: %lu, kvm fd: %d"
>>>> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d
>>> id: %lu"
>>>> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id:
>>> %lu"
>>>> +kvm_unpark_vcpu(unsigned long arch_cpu_id, const char *msg) "id: %lu %s"
>>>>   kvm_irqchip_commit_routes(void) ""
>>>>   kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s
>>> vector %d virq %d"
>>>>   kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
>>>> @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
>>>>   kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages
>>> (took %"PRIi64" us)"
>>>>   kvm_dirty_ring_reaper_kick(const char *reason) "%s"
>>>>   kvm_dirty_ring_flush(int finished) "%d"
>>>> -kvm_destroy_vcpu(void) ""
>>>>   kvm_failed_get_vcpu_mmap_size(void) ""
>>>>   kvm_cpu_exec(void) ""
>>>>   kvm_interrupt_exit_request(void) ""
>>>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>>>> index c31d9c7356..c4a914b3d8 100644
>>>> --- a/include/sysemu/kvm.h
>>>> +++ b/include/sysemu/kvm.h
>>>> @@ -313,6 +313,31 @@ int kvm_create_device(KVMState *s, uint64_t type,
>>> bool test);
>>>>    */
>>>>   bool kvm_device_supported(int vmfd, uint64_t type);
>>>>
>>>> +/**
>>>> + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
>>>> + * @cpu: QOM CPUState object for which KVM vCPU has to be
>>> fetched/created.
>>>> + *
>>>> + * @returns: 0 when success, errno (<0) when failed.
>>>> + */
>>>> +int kvm_create_vcpu(CPUState *cpu);
>>>> +
>>>> +/**
>>>> + * kvm_park_vcpu - Park QEMU KVM vCPU context
>>>> + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be
>>> parked.
>>>> + *
>>>> + * @returns: none
>>>> + */
>>>> +void kvm_park_vcpu(CPUState *cpu);
>>>> +
>>>> +/**
>>>> + * kvm_unpark_vcpu - unpark QEMU KVM vCPU context
>>>> + * @s: KVM State
>>>> + * @vcpu_id: Architecture vCPU ID of the parked vCPU
>>>> + *
>>>> + * @returns: KVM fd
>>>> + */
>>>> +int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);
>>>> +
>>>>   /* Arch specific hooks */
>>>>
>>>>   extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
>>>   
