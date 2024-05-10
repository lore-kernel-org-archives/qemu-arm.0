Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp536021ejb;
        Fri, 10 May 2024 07:43:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMEoH7P7x7Ja1XjlC4W1LHJnsKzK0mv1KnkNPOzxRy5FrukHtHyUpsL/o52ejPRbr67+eIFV6bS2yRL480yQ/EaU1KWU5G
X-Received: by 2002:a17:906:4a49:b0:a59:ba2b:590f with SMTP id a640c23a62f3a-a5a2d67806emr162058466b.67.1715352222917;
        Fri, 10 May 2024 07:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715352222; cv=none;
        d=google.com; s=arc-20160816;
        b=gZz6Erpqr7VJl35ZMVf9ftO586w1QDlqHKqjPV0+e2ENJ3KyxY/DbmSe1ATHfdF2H6
         VYJ9nXX/Fwu92gqSMPJ3v6LE858g7ju2HZslQez5dqUpHcVL/HlmW/DCJ7qJlk+BLh9K
         IO6NYCCwfegA9dp/qz9dG4Ja+lN8Ofq8RMJ6SKwDeA7QLbMO81U/elnXXIUxJUNCowa0
         dM/9tS/9nBHerIwwk1Doo+UslM8F9p0lBSbOAWBX1y4l3XP7AHYYeK7nGBV4rCYNOtMp
         GzhgqK5/PvzjAYykfVirolR/SBi+CtnZU3Dho6qJFYwe78GCUv0RbDHoo4MhnoUNizIA
         05Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pzrPkNNMUY38XC4/Eb7sqyd3JaDqPzJLdSElwVxzsVs=;
        fh=0CvMrPK3qj88tHw04p1dB9clWqt44MEpx3b2ixqTWv0=;
        b=h1HGkjCyuw56t4ojeoYFGWlUCZaOKYNnlJOZMUVz76EzqFZQGyHngpI1cR2T08wRz3
         R90PSbcvAHzrzETAyUe0t2eeoLC3cwmyvNO3PeJ9IL3AW0Jn1AGGkaBHNolyLxJ94bQU
         a9aAZY5o/pUEyGwa2UGm+ODBOy2VSNml+jkQxe2f9g0d2LMF9oFtfPek/6LdU/5YH/dM
         WC7LvQcDVGpnGfo5dj/f7OiBX78JSSybfFkO4Gw02TE46bhWhA6SDlNl94opXEf7Scpu
         UF1nKYmXs4uMtwIxCxOAI2DxeFjE5g5ljivauYJif1BpNBIGX7cnQ6UCO7bA6apdDvGi
         fS5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=itbkyuuy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a5a178aa193sor117316166b.7.2024.05.10.07.43.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 May 2024 07:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=itbkyuuy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715352222; x=1715957022; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzrPkNNMUY38XC4/Eb7sqyd3JaDqPzJLdSElwVxzsVs=;
        b=itbkyuuysW3AVZh+3NPwFqtJe1ABqk2G1zQVVOIG1F+XE/tV3KXL2qslKL7aE7kp9O
         FrR8LDIKo1Jg7oWkTnSGyWGxogIcRnAq6uTvL6U9sOhqppfdun6F3pek15nUtRA1InoL
         rMZsEa8xUf1GN9z9GIUSMFvNa5TCCNcFAiZK2buyMNppi/BzRLSFsCD6Y7UprlQnD+rl
         TrHj/DTwSVIwsMh24ApFfOkf9jBp2ZHyBTgtqgxa7+AbMrFhXC+RxOZT3SqGp1VZL6N9
         iHer+dvJNlHPKOPeUU55HZrI1at0rwkpqTgjennggmbni6DD5Y+T41rF9abNvYTIgCFY
         /g0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715352222; x=1715957022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzrPkNNMUY38XC4/Eb7sqyd3JaDqPzJLdSElwVxzsVs=;
        b=vtw82JMwwUaW/y+jfK3HXxQ+roOCvDyOGKD18HADQ32disWtWFVxJKyaU7L5QzvAHe
         Vp+ol8P+kU/pwdxgmm85D/frVlOjUAO3CZCsa/bIEnxEAJSqBuFYdf+CrMPSwFcMfXkg
         WNvMzJte8Y2ne5lV4Jv53jQ9hactjF7MJ3r1cPnyjKUq1x6yo30I9Jb1qLaehj53rkg+
         H6CsktBApZGzQOsGRm8fR7CPe76d+Pss5YipgCwcxxt1bFBhHFHKAbldNytMnqDFdvIp
         KXZV0zXqhajmhBPlK89IjA9TKClOdk3JWNc/ysX7n4jGD+rpt/RRfaVBnYrYtlDuPQ6s
         zDQA==
X-Forwarded-Encrypted: i=1; AJvYcCUD469/X6FwO7aX76gGuOXMeCAcRQO5ekt7QkvbineSB0BxtvI3wTchOneDw8v8wosyDEa568IIG8pi683Tus/xpFHcaQnt
X-Gm-Message-State: AOJu0YyFo9VqbYXOHnv2iiRXxxfM0TEGZK53h1WOOz/STFSKG3Lk10Ve
	pqMguRwisU5jt327f3aqXzHdMNcMnjfhdh7nXoS6475j4yOfRfVImsb1B4NhKR4dPw==
X-Google-Smtp-Source: AGHT+IE/x+aFqSAIP+P33UWs1eMwCIVtb4RQa4OiotnfVecAK9waIFaN5NjngxhvKJB97+RQw7y4ow==
X-Received: by 2002:a17:906:f1ca:b0:a52:2486:299f with SMTP id a640c23a62f3a-a5a2d67864amr189561266b.71.1715352222427;
        Fri, 10 May 2024 07:43:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr. [176.184.17.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17892450sm192570766b.63.2024.05.10.07.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 07:43:41 -0700 (PDT)
Message-ID: <e94b0e14-efee-4050-9c9f-08382a36b63a@linaro.org>
Date: Fri, 10 May 2024 16:43:38 +0200
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
 <2f817b76-8090-418b-8547-98d366c52838@linaro.org>
 <ec1f4df024d94542a55835c852eededb@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ec1f4df024d94542a55835c852eededb@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pTA1nEd1afOq

On 8/5/24 12:46, Salil Mehta wrote:
> Hi Phillipe,
> 
> Sorry, I missed this mail earlier.
> 
>>   From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>   Sent: Friday, May 3, 2024 7:23 PM
>>   To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org;
>>   qemu-arm@nongnu.org
>>   
>>   On 3/5/24 17:57, Salil Mehta wrote:
>>   > Hi Philippe,
>>   >
>>   >>   From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>   >>   Sent: Friday, May 3, 2024 10:40 AM
>>   >>   Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU
>>   >>   {creation,parking} code
>>   >>
>>   >>   Hi Salil,
>>   >>
>>   >>   On 12/3/24 02:59, Salil Mehta wrote:
>>   >>   > KVM vCPU creation is done once during the vCPU realization when Qemu
>>   >>   > vCPU thread is spawned. This is common to all the architectures as of now.
>>   >>   >
>>   >>   > Hot-unplug of vCPU results in destruction of the vCPU object in QOM
>>   >>   > but the corresponding KVM vCPU object in the Host KVM is not destroyed
>>   >>   > as KVM doesn't support vCPU removal. Therefore, its representative KVM
>>   >>   > vCPU object/context in Qemu is parked.
>>   >>   >
>>   >>   > Refactor architecture common logic so that some APIs could be reused
>>   >>   > by vCPU Hotplug code of some architectures likes ARM, Loongson etc.
>>   >>   > Update new/old APIs with trace events instead of DPRINTF. No functional
>>   >>   change is intended here.
>>   >>   >
>>   >>   > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>   >>   > Reviewed-by: Gavin Shan <gshan@redhat.com>
>>   >>   > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>   >>   > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>   >>   > Tested-by: Xianglai Li <lixianglai@loongson.cn>
>>   >>   > Tested-by: Miguel Luis <miguel.luis@oracle.com>
>>   >>   > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>>   >>   > ---
>>   >>   >   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++-
>>   -----
>>   >>   ----
>>   >>   >   accel/kvm/trace-events |  5 +++-
>>   >>   >   include/sysemu/kvm.h   | 16 +++++++++++
>>   >>   >   3 files changed, 69 insertions(+), 16 deletions(-)
>>   >>   >
>>   >>   > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c index
>>   >>   > a8cecd040e..3bc3207bda 100644
>>   >>   > --- a/accel/kvm/kvm-all.c
>>   >>   > +++ b/accel/kvm/kvm-all.c
>>   >>   > @@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
>>   >>   >   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>>   >>   >
>>   >>   >   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
>>   >>   > +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>>   >>   >
>>   >>   >   static inline void kvm_resample_fd_remove(int gsi)
>>   >>   >   {
>>   >>   > @@ -314,14 +315,53 @@ err:
>>   >>   >       return ret;
>>   >>   >   }
>>   >>   >
>>   >>   > +void kvm_park_vcpu(CPUState *cpu)
>>   >>   > +{
>>   >>   > +    struct KVMParkedVcpu *vcpu;
>>   >>   > +
>>   >>   > +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>   >>   > +
>>   >>   > +    vcpu = g_malloc0(sizeof(*vcpu));
>>   >>   > +    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>>   >>   > +    vcpu->kvm_fd = cpu->kvm_fd;
>>   >>   > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node); }
>>   >>   > +
>>   >>   > +int kvm_create_vcpu(CPUState *cpu)
>>   >>   > +{
>>   >>   > +    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
>>   >>   > +    KVMState *s = kvm_state;
>>   >>   > +    int kvm_fd;
>>   >>   > +
>>   >>   > +    trace_kvm_create_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>   >>   > +
>>   >>   > +    /* check if the KVM vCPU already exist but is parked */
>>   >>   > +    kvm_fd = kvm_get_vcpu(s, vcpu_id);
>>   >>   > +    if (kvm_fd < 0) {
>>   >>   > +        /* vCPU not parked: create a new KVM vCPU */
>>   >>   > +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
>>   >>   > +        if (kvm_fd < 0) {
>>   >>   > +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", vcpu_id);
>>   >>   > +            return kvm_fd;
>>   >>   > +        }
>>   >>   > +    }
>>   >>   > +
>>   >>   > +    cpu->kvm_fd = kvm_fd;
>>   >>   > +    cpu->kvm_state = s;
>>   >>   > +    cpu->vcpu_dirty = true;
>>   >>   > +    cpu->dirty_pages = 0;
>>   >>   > +    cpu->throttle_us_per_full = 0;
>>   >>   > +
>>   >>   > +    return 0;
>>   >>   > +}
>>   >>
>>   >>   This seems generic enough to be implemented for all accelerators.
>>   >>
>>   >>   See AccelOpsClass in include/sysemu/accel-ops.h.
>>   >>
>>   >>   That said, can be done later on top.
>>   >
>>   > Let me understand correctly. Are you suggesting to implement above
>>   > even for HVF, TCG, QTEST etc?
>>   
>>   Not for you to implement the other non-KVM accelerators, but since you
>>   are introducing this, now is a good time to think about a generic interface.
>>   
>>   So far AccelOpsClass::[un]park_vcpu() handlers make sense to me.
> 
> Sure, but what is the advantage of defining these 'supporting' functions
> as part of the AccelOpsClass? Each of these functions in any case will need
> to be defined individually for different Accelerators or unless we are
> planning to extract some common accelerator functions in a separate file
> and use them across all the accelerators?

kvm_arm_create_host_vcpu() [*] seems generic. Maybe we could do the
same with HVF at least.

[*] 
https://lore.kernel.org/qemu-devel/20230926100436.28284-7-salil.mehta@huawei.com/
> 
> I'm surely missing some key point here.

I started https://etherpad.opendev.org/p/QEMU_vCPU_life to
document the vCPU spagetti code. In that big picture the "park"
method makes sense to me, but we can discuss that later. Again,
certainly not a block for your work, I'm just trying to see
the whole view.

Regards,

Phil.
