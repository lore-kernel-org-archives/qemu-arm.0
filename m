Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp628667nji;
        Wed, 28 Aug 2024 13:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUD/8w0UY46e1OPLh5EWKLi6ZWQdBTnhDQnXddOQqhDXs9t3FaA/+Nya2nA7+D8xbk9w+Ac/F/33Xwfmg==@linaro.org
X-Received: by 2002:a05:6a21:a343:b0:1c0:ef1c:b80 with SMTP id adf61e73a8af0-1cce10dcd98mr564907637.52.1724876650341;
        Wed, 28 Aug 2024 13:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724876650; cv=none;
        d=google.com; s=arc-20160816;
        b=nVPFDY/65jYdu/vhMU28bo15FD7MHR0T3BX23ebJeZH4IjuWpuP3X0JK8Z3iQr3eZH
         HXb1wySGwmyxbcbxOgOKBWL3vQhHacWt4kEsd1stF0WAQbtUkkxkAlR5EIzqn2RcHuME
         UKwiBeXQcM/O+bHyW++OM96f8VzhXcmoTe/sulGrABPs71Rxs2mmYNcyXcYajK6LX+zA
         y1vTMGuUQrf//4ZLgmKT6r02TpBui88Ys488tYHvMomf3acA+guq0mdiSkF9rfCQuE2D
         numh8D9kzR+Zl0AX3Ex6mS/sIkAdsPBcb/05DifJggwCNvmw1EhANMxgAVVCkePrAYmS
         EQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gguf8t3rKhToKTPy5d+X9ibzd4TMeHO1MB4Pi9unjgo=;
        fh=wDJkqIdJLTGYRbW2Kpnud6B9xeEnlULa9rbudKtl9AY=;
        b=lYcksk4iXUmc2D0leV3xbwIIJLOBVN8xj7hzVDu7PUXg1nDKpRKT0W659KxHx+WbCu
         gW2Vkj7OSbFYJtVyAZ/zH9NkDqfhrrqRVHGRHvu5a0e5tMesrvr6EP9x+PE1yJMxAIeZ
         TDiUDDIK1/iMbRhI09zuImYjxUmnsfIMqReqiFluu80hrdluEBdNzyRu6mpb7R7sR/Hp
         pDOpQ9WTIofaAkskvr0Be6NuHEqdAzf1VDC8jIsI9zGaOU11sGpfkl7koymeK0oRczAh
         6I6BPleWl+i8hNmzUJhtAhlh86qMjdQaRO0zLGYDaYUfgFvJtIy9M0HaZ0aDXLDpN0MZ
         jljQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=REpvPf0D;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-714342312c8sor11186446b3a.1.2024.08.28.13.24.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Aug 2024 13:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=REpvPf0D;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724876650; x=1725481450; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gguf8t3rKhToKTPy5d+X9ibzd4TMeHO1MB4Pi9unjgo=;
        b=REpvPf0D8Qa6Rn731e60geBvB8f4tRJrDDSNYOpWq6QSpVm+2TIuLXCJNak+Fqbk30
         epbk2u6zuCKJ5/uEjzaAO9NOndXiIf+XP9WpOtYuAKs50xQeLq6yA6+3Epu4LQqdDMPE
         x2FYkddhYfhimmSoy2EJWgpLDUuqeaF6Zl4X/PcyzyhA3cD1TAET6kW5Hs1ts3mY2rpx
         inKUsz3qeog+XLGTLxPv9pRhiSlMXEXLe6ysEPaSfWnCPFWuXyA3V1L1VkrtD6UKqlmr
         OHrd0bT+uldmoODR5mTzimoVwcx0HPdps15NayN/26B5I33IK9Xm+8IpGrWi7UzcYCoE
         uMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876650; x=1725481450;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gguf8t3rKhToKTPy5d+X9ibzd4TMeHO1MB4Pi9unjgo=;
        b=Li0fhVXCFjxLfs3yIJ8I/pTAONhqGMYGBSYXq561ZzmJhPp6naxwvqyvXWw4vkAcQd
         ismnJz4EpVAE3TIhXnXn/b5XIIHONfR8nRzEoUHAz27E1NMWNZY1nLylY6AQHqhzxgZq
         StmFPTAVEkM8wQYJBCbyYvPNN75vKD5lfjF1AH/6w5nROJ4TUazWjZVTVpjY7IZuFfuz
         EsRSInDLz8+HvmdYtl58hMslk7u2WYijtTewm0jc7Ccrr42xr0Co4CL6CiZ56JS48lPm
         4rLEyO8u4XUjxjdY/EBiTHmmIYQoyAIVaC1KNE3NpMYCpII6x+pjMMcSPjRdDkPAfSGY
         fOQg==
X-Forwarded-Encrypted: i=1; AJvYcCVXyBh5BQifUMLJLC+9spWzOT74Mj4vUizdTztkAjiYjIsWc+OhUw87dzB978Ol5SUrGRfGel0HywDFPA==@linaro.org
X-Gm-Message-State: AOJu0YxXgweR/67cD/0y+AhcWkwdZBonVNQF70bEtBL1Ilmm70VNv3do
	dA52PENce0TmC5Y0jf4aTYmzIKjkH2Z/XvNmZ76aykTewN+oNj+oLgHkX8OBsEfS9w==
X-Google-Smtp-Source: AGHT+IHXBdX2GWacJtu/ZCYA1GSI/ZEm37DGFP1j+ITVUMRKps8USMB6yKK34yttZLp405lr71NG9w==
X-Received: by 2002:a05:6a00:1747:b0:70b:2a:15cd with SMTP id d2e1a72fcca58-715df97c536mr917622b3a.0.1724876649752;
        Wed, 28 Aug 2024 13:24:09 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPv6:2804:7f0:b400:bb79:4bdf:de43:1f6c:1151? ([2804:7f0:b400:bb79:4bdf:de43:1f6c:1151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143422ec2esm10521121b3a.27.2024.08.28.13.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 13:24:09 -0700 (PDT)
Subject: Re: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
To: Salil Mehta <salil.mehta@huawei.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
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
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-25-salil.mehta@huawei.com>
 <87v800wkb1.fsf@draig.linaro.org>
 <2cb51f91bea3472e8ac04854d7c6bb71@huawei.com>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <be14d023-f65f-96e4-45ef-8fe002e69bc4@linaro.org>
Date: Wed, 28 Aug 2024 17:23:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2cb51f91bea3472e8ac04854d7c6bb71@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HeQzyJJ/IbBT

Hi Salil,

On 8/19/24 9:35 AM, Salil Mehta via wrote:
> Hi Alex,
> 
>>   From: Alex Bennée <alex.bennee@linaro.org>
>>   Sent: Friday, August 16, 2024 4:37 PM
>>   To: Salil Mehta <salil.mehta@huawei.com>
>>   
>>   Salil Mehta <salil.mehta@huawei.com> writes:
>>   
>>   > vCPU Hot-unplug will result in QOM CPU object unrealization which will
>>   > do away with all the vCPU thread creations, allocations, registrations
>>   > that happened as part of the realization process. This change
>>   > introduces the ARM CPU unrealize function taking care of exactly that.
>>   >
>>   > Note, initialized KVM vCPUs are not destroyed in host KVM but their
>>   > Qemu context is parked at the QEMU KVM layer.
>>   >
>>   > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>>   > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>   > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>   > Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>   > [VP: Identified CPU stall issue & suggested probable fix]
>>   > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>   > ---
>>   >  target/arm/cpu.c       | 101
>>   +++++++++++++++++++++++++++++++++++++++++
>>   >  target/arm/cpu.h       |  14 ++++++
>>   >  target/arm/gdbstub.c   |   6 +++
>>   >  target/arm/helper.c    |  25 ++++++++++
>>   >  target/arm/internals.h |   3 ++
>>   >  target/arm/kvm.c       |   5 ++
>>   >  6 files changed, 154 insertions(+)
>>   >
>>   > diff --git a/target/arm/cpu.c b/target/arm/cpu.c index
>>   > c92162fa97..a3dc669309 100644
>>   > --- a/target/arm/cpu.c
>>   > +++ b/target/arm/cpu.c
>>   > @@ -157,6 +157,16 @@ void
>>   arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn
>>   *hook,
>>   >      QLIST_INSERT_HEAD(&cpu->pre_el_change_hooks, entry, node);  }
>>   >
>>   > +void arm_unregister_pre_el_change_hooks(ARMCPU *cpu) {
>>   > +    ARMELChangeHook *entry, *next;
>>   > +
>>   > +    QLIST_FOREACH_SAFE(entry, &cpu->pre_el_change_hooks, node,
>>   next) {
>>   > +        QLIST_REMOVE(entry, node);
>>   > +        g_free(entry);
>>   > +    }
>>   > +}
>>   > +
>>   >  void arm_register_el_change_hook(ARMCPU *cpu,
>>   ARMELChangeHookFn *hook,
>>   >                                   void *opaque)  { @@ -168,6 +178,16
>>   > @@ void arm_register_el_change_hook(ARMCPU *cpu,
>>   ARMELChangeHookFn *hook,
>>   >      QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);  }
>>   >
>>   > +void arm_unregister_el_change_hooks(ARMCPU *cpu) {
>>   > +    ARMELChangeHook *entry, *next;
>>   > +
>>   > +    QLIST_FOREACH_SAFE(entry, &cpu->el_change_hooks, node, next) {
>>   > +        QLIST_REMOVE(entry, node);
>>   > +        g_free(entry);
>>   > +    }
>>   > +}
>>   > +
>>   >  static void cp_reg_reset(gpointer key, gpointer value, gpointer
>>   > opaque)  {
>>   >      /* Reset a single ARMCPRegInfo register */ @@ -2552,6 +2572,85 @@
>>   > static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>   >      acc->parent_realize(dev, errp);
>>   >  }
>>   >
>>   > +static void arm_cpu_unrealizefn(DeviceState *dev) {
>>   > +    ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
>>   > +    ARMCPU *cpu = ARM_CPU(dev);
>>   > +    CPUARMState *env = &cpu->env;
>>   > +    CPUState *cs = CPU(dev);
>>   > +    bool has_secure;
>>   > +
>>   > +    has_secure = cpu->has_el3 || arm_feature(env,
>>   > + ARM_FEATURE_M_SECURITY);
>>   > +
>>   > +    /* rock 'n' un-roll, whatever happened in the arm_cpu_realizefn
>>   cleanly */
>>   > +    cpu_address_space_destroy(cs, ARMASIdx_NS);
>>   
>>   On current master this will fail:
>>   
>>   ../../target/arm/cpu.c: In function ‘arm_cpu_unrealizefn’:
>>   ../../target/arm/cpu.c:2626:5: error: implicit declaration of function
>>   ‘cpu_address_space_destroy’ [-Werror=implicit-function-declaration]
>>    2626 |     cpu_address_space_destroy(cs, ARMASIdx_NS);
>>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>>   ../../target/arm/cpu.c:2626:5: error: nested extern declaration of
>>   ‘cpu_address_space_destroy’ [-Werror=nested-externs]
>>   cc1: all warnings being treated as errors
> 
> 
> The current master already has arch-agnostic patch-set. I've applied the
> RFC V3 to the latest and complied. I did not see this issue?
> 
> I've create a new branch for your reference.
> 
> https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rfc-v4-rc4
> 
> Please let me know if this works for you?

It still happens on the new branch. You need to configure Linux user mode
to reproduce it, e.g.:

$ ../configure --target-list=aarch64-linux-user,aarch64-softmmu [...]

If you just configure the 'aarch64-softmmu' target it doesn't happen.


Cheers,
Gustavo
