Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2885659ejc;
        Thu, 28 Sep 2023 16:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUUybeNKYvHB0AkGszqr0VKGwd2IOic8OSSDgQS3uk+Uhlq6VANVV+XdoU56BSwYnuAG4E
X-Received: by 2002:ac8:5c15:0:b0:418:1ca9:8678 with SMTP id i21-20020ac85c15000000b004181ca98678mr3003213qti.1.1695943104822;
        Thu, 28 Sep 2023 16:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695943104; cv=none;
        d=google.com; s=arc-20160816;
        b=Ew42aJs2TkmSNwB3+pcxcQQmO8ntvQNmz2HYJ5XLY0yIeA9boJ/cMBn7rwvBM+Jaws
         PsHoHB2N8/9GwOSkBbIgx08LgfJITi1GSsEC8BSEAJF9nl97NN8rofsASgTO3CMVrX2f
         tonyt1lgMxxgELkhfJLyGUqkprd4hfZKllCVdojwLRWb8hQN2Yv0RGYCWDpAXX5Y80Dt
         z9mgqwD6Uhqn4L7v4cxpHYABjLNvDl42Tnb1kc9yW+JZDi2UXrqohfwlpRal7/Gpeksb
         5PdmrFUsNd50uQFdt13PJ+qlcf9AwabOFYoE+erRoTbpwSZxLN+XOm5pfaBxjedwr1Pd
         lraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BHL/skch3O5y6l+up3a0CvHT3tJgOE/wMIIHZaKvcek=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=G+MPsA8N6lj1cuFgGPN+WhkzTpdZMFyhNmTU4Pa61RDHbfLYR2/88QcTBzARiZ1lJM
         uFrhSmaGsfgWvFIvqxiTLlcxNFzxylZgb5Cu2aKf9vwZbNnsF/uytoZ/bHaGRhzLYi+x
         Jc0XvimdnBebu8EECNkr57xkkOM9RyG4Lq+6B8yCA3DcmnmgqMsHLZKK7SAkQAMOB4qN
         BKhgiPkFmgnSS6hmAgQA7UpdG3ZCWL0dI+QIlV8M45mHPG39jpDZIhPeIoXgD86i565h
         I0LZ+D/23jtZbMcEon79j8mBovWdgVFlBF0DFqCpWik+xmlk/ainlEdHyGYMSEZbVVRw
         zOzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YxIK2DuS;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bm26-20020a05620a199a00b007752bd6a25bsi3270261qkb.320.2023.09.28.16.18.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YxIK2DuS;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695943104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHL/skch3O5y6l+up3a0CvHT3tJgOE/wMIIHZaKvcek=;
	b=YxIK2DuSR8WOms+bvI3D4sfBgEVnZSlNBd8HrSGuAhKMh/gknSo2nHHFuhnDWWSVuNgfDC
	h+SlIeBjfNO202qy2DEQKI2UzbBBckA1taNOOIGoSPBG8mazsO5xfjJ8DB4qo2TQybLq4d
	JejPlpkLNJKATEOSJzmVnKxvHKghth4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-WEsyYtwDOfuYvu99_q2OCQ-1; Thu, 28 Sep 2023 19:18:22 -0400
X-MC-Unique: WEsyYtwDOfuYvu99_q2OCQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1c0e161e18fso550855ad.1
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 16:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695943101; x=1696547901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHL/skch3O5y6l+up3a0CvHT3tJgOE/wMIIHZaKvcek=;
        b=PIfNIJcKTq5Idi4yT7ThULkpNFItNVk+cW7Qsd5a42Mv3oFaKuAPi9+qxhTC9cU7+X
         LyvRs5OuH2SE5s+JCqBQwAHMGMijrb9evULvAn6hBFHi/5uobtHSJjW5wQNs0yJsH03V
         FzIgfAbxZiJXitYccxCiLI3ODtO23Gtyl7E9KTYsvZzHC7+cqMRimgEcg9eNW1ZLf8Ld
         CZH5VVUM6fvUXKZHyD9425KtKtF2Txu6XQarD2+1fPzwbPwW3eE2WobvdTIUC6AjlURt
         tGrc3m38+0PetE1Z7FRpIQg8qb22jDybhSsBdB6LLkF1NDYKuYPA+AqKRywufmfagiD7
         p70w==
X-Gm-Message-State: AOJu0Yz6PsHMWsI5WQvPeztrmO7pV1OBrr3zK40PeAW0r2xmPtyjoN6V
	5475LUu8EwkMsbhd/EC49Q4YtgoxZnQsYWQqsi43YfRCmpmJQOQCMOykj5DuoUC5WmcupR3wXkg
	0Sn52zBMhCk/tnbEr
X-Received: by 2002:a17:902:ce84:b0:1c5:7d49:570e with SMTP id f4-20020a170902ce8400b001c57d49570emr4556860plg.29.1695943100870;
        Thu, 28 Sep 2023 16:18:20 -0700 (PDT)
X-Received: by 2002:a17:902:ce84:b0:1c5:7d49:570e with SMTP id f4-20020a170902ce8400b001c57d49570emr4556825plg.29.1695943100447;
        Thu, 28 Sep 2023 16:18:20 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b001c74718f2f3sm30453plg.119.2023.09.28.16.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 16:18:19 -0700 (PDT)
Message-ID: <550271cb-c415-f98e-afb4-d62df70c3ffb@redhat.com>
Date: Fri, 29 Sep 2023 09:18:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 18/37] arm/virt: Make ARM vCPU *present* status
 ACPI *persistent*
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-19-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-19-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XlDQsobpn2E4

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> ARM arch does not allow CPUs presence to be changed [1] after kernel has booted.
> Hence, firmware/ACPI/Qemu must ensure persistent view of the vCPUs to the Guest
> kernel even when they are not present in the QoM i.e. are unplugged or are
> yet-to-be-plugged
> 
> References:
> [1] Check comment 5 in the bugzilla entry
>     Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   cpus-common.c         |  6 ++++++
>   hw/arm/virt.c         |  7 +++++++
>   include/hw/core/cpu.h | 20 ++++++++++++++++++++
>   3 files changed, 33 insertions(+)
> 

hmm, it's another CPU state. There are 4 CPU states, plus other 3 CPU states:
possible, present, enabled. Now we're having always-present state. I think
those CPU states can be squeezed into the previous present state. What we
need is to ensure all possible vCPUs are present from the beginning. How
are to do something like below?

/*
  * The flag is set for all possible vCPUs in hw/arm/virt.c::virt_possible_cpu_arch_ids()
  * The idea is the flag is managed by specific board because the always-present is
  * the special requirements from hw/arm/virt board.
  */
#define CPU_ARCH_ID_FLAG_ALWAYS_PRESENT   (1UL << 0)
typedef struct CPUArchId {
     uint64_t  flags;
       :
}

static inline bool machine_has_possible_cpu(int index);
static inline bool mahine_has_present_cpu(int index)
{
     if (!machine_has_possible_cpu(inde)) {
         return false;
     }

     if (!ms->possible_cpus->cpus[index].flags & CPU_ARCH_ID_FLAG_ALWAYS_PRESENT) {
        return false;
     }

     return true;
}

static inline bool machine_has_enabled_cpu(int index)
{
     CPUState *cs;

     if (!machine_has_present_cpu(index)) {
         return false;
     }

     /* I'm thinking of cpu.enabled can be replaced by another
      * flag in struct CPUArchID::flags due to the fact:
      * The vCPU's states are managed by board and changed at
      * creation time or hotplug handlers.
      */
     cs = CPUSTATE(ms->possible_cpus->cpus[i].cpu);
     if (!cs || !cpu.enabled) {
         return false;
     }

     return true;
}

> diff --git a/cpus-common.c b/cpus-common.c
> index 24c04199a1..d64aa63b19 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -128,6 +128,12 @@ bool qemu_enabled_cpu(CPUState *cpu)
>       return cpu && !cpu->disabled;
>   }
>   
> +bool qemu_persistent_cpu(CPUState *cpu)
> +{
> +    /* cpu state can be faked to the guest via acpi */
> +    return cpu->acpi_persistent;
> +}
> +
>   uint64_t qemu_get_cpu_archid(int cpu_index)
>   {
>       MachineState *ms = MACHINE(qdev_get_machine());
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cbb6199ec6..f1bee569d5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3006,6 +3006,13 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>           return;
>       }
>       virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
> +
> +    /*
> +     * To give persistent presence view of vCPUs to the guest, ACPI might need
> +     * to fake the presence of the vCPUs to the guest but keep them disabled.
> +     * This shall be used during the init of ACPI Hotplug state and hot-unplug
> +     */
> +     cs->acpi_persistent = true;
>   }
>   
>   static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index b2201a98ee..dab572c9bd 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -425,6 +425,13 @@ struct CPUState {
>        * By default every CPUState is enabled as of now across all archs.
>        */
>       bool disabled;
> +    /*
> +     * On certain architectures, to give persistent view of the 'presence' of
> +     * vCPUs to the guest, ACPI might need to fake the 'presence' of the vCPUs
> +     * but keep them ACPI disabled to the guest. This is done by returning
> +     * _STA.PRES=True and _STA.Ena=False for the unplugged vCPUs in QEMU QoM.
> +     */
> +    bool acpi_persistent;
>       /* TODO Move common fields from CPUArchState here. */
>       int cpu_index;
>       int cluster_index;
> @@ -814,6 +821,19 @@ bool qemu_present_cpu(CPUState *cpu);
>    */
>   bool qemu_enabled_cpu(CPUState *cpu);
>   
> +/**
> + * qemu_persistent_cpu:
> + * @cpu: The vCPU to check
> + *
> + * Checks if the vCPU state should always be reflected as *present* via ACPI
> + * to the Guest. By default, this is False on all architectures and has to be
> + * explicity set during initialization.
> + *
> + * Returns: True if it is ACPI 'persistent' CPU
> + *
> + */
> +bool qemu_persistent_cpu(CPUState *cpu);
> +
>   /**
>    * qemu_get_cpu_archid:
>    * @cpu_index: possible vCPU for which arch-id needs to be retreived

Thanks,
Gavin
