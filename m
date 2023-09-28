Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2900455ejc;
        Thu, 28 Sep 2023 16:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFfQZs0onRlzkdpEdT9WfzJ2z2ZqaoPgyQ5pnWGJuRRKsW30CTK58I/qqT2P0uuTigYo3S
X-Received: by 2002:a2e:9cd5:0:b0:2c0:afd:e7ed with SMTP id g21-20020a2e9cd5000000b002c00afde7edmr2625008ljj.10.1695945497935;
        Thu, 28 Sep 2023 16:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695945497; cv=none;
        d=google.com; s=arc-20160816;
        b=aahVJPznBuQR8WeeSjAW6Ydd+ksVnImEPne1iL51Nt2cGDzSV+136tGjQziAAGhkOl
         a64oRkRLpXbt3Uu0/EpIBeF+EGzg5bfsdhUcl3mlwY4KIoDJDqd+pGn6pIXkJje130Fe
         uCBlof90S+RGoPR1sZQNFsoQXGP87LjEF0oqCK8RgWcFztdK3zoilEcw+2DaGUDK/IkG
         5F7zS4kyFP3/MZ05dobSPiPA/NJ9ma/yLZ3BwuhMwxsjifChj90TpZvzbkQGGFIzev4v
         zJ22FF1mqmLO4da3+GsfgUC8O7UomEh+p4nfoxsDO50QRwGMz2khkJyadCV3+wCMagxm
         KYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VX1d3q6Mugy9iSjU/rsXPw/uPvDUi4/RHWQI229dwM8=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=dUy6YlD1e4Z+DKIfSUVgObNh2M7SKmQ63RP3sF71qugakk98ok9/+g2sEkcmdGWqLU
         mfNO5Liz43dk9HxXs2gyzCOZEx1ArKQOt/EzBJ874VHfq0BpSaJqb2iVNCzE5UE14Chz
         IeOGFb8EXXwHbf2mFCWK0TeY8VIDF5Uya2Tz5/8ixgpNsCzuCKDIMNLY+4bXCG8NqRS/
         Eqfn9y0nawpEGqi9ODfvLAmRoKZTZ8LjE00k3OtIWe+e5JAadMOEybJeQZtfZHkDHZwn
         VxDjmpO1m+6vGjmP1WQE9j9lWyhDJuBCWuXyC05sxGDv7Z2iAzi+oOHIZaMVlQbKq4nf
         C92w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OFj6aPl5;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m12-20020a2eb6cc000000b002bcc4339152si7593264ljo.290.2023.09.28.16.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OFj6aPl5;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695945496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VX1d3q6Mugy9iSjU/rsXPw/uPvDUi4/RHWQI229dwM8=;
	b=OFj6aPl5eEDTZLk162Zzmll3Zr5BHIl1mkLyCzIZRFDzfu6+NEfTLNS3jBwytno0cVPXpT
	fbCoJhY33+bXBFzDwRh7A3+EONXs9u0h2szBBbm3be/k3AJqq07NT54avvpiSapYE5ONbi
	evGZU5OSTHDarpn5OwClVI36H3U3jqs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-AMZPu-g8P0efrmbHgro2IQ-1; Thu, 28 Sep 2023 19:58:14 -0400
X-MC-Unique: AMZPu-g8P0efrmbHgro2IQ-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-565ece76be4so16493028a12.2
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 16:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695945494; x=1696550294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VX1d3q6Mugy9iSjU/rsXPw/uPvDUi4/RHWQI229dwM8=;
        b=GPR6vytl2qKDnN9NvXQJlDZTtK4Ev9MTX+t2LkUwvsGdJn+QhJ7l9GVIvNLDDf2boA
         FjpbCEXZBESHL4nX2Ow9GEpwvwP+Z/8zzgaX3Y2MuzddyDe/3CjetOhxj4bka0vk1OOu
         PXQP0p97KSGuWY7tkKvNe6NcCDBTBUlb2ptVITPhGbkPmqL0B7wJlyKgPTtnt5mNkOLn
         nB7rp85k0fCqPgP+OwIpkneI+4o6ETg3A5WMlhfjCDevffbiPA1hmHcVmYlHdnHW4ha+
         OWl2VxQm/LMVSyXYk8bTLuUYQ1vNrVM6PXpdj3T2HnGoKCs9+/TwNuZOCXprlU2amPvf
         BFTg==
X-Gm-Message-State: AOJu0YyoLomzNbfstZsgM1AIxNZe+M1CuVrHoS2ts58Joz6QqmLfbcLd
	0qe9Z/OSvzCJdfjyd1aoepxnNIATjrE18SCZCXlkt36PSG1lhZ2lRHpkpWUUQ9MbSQefVpH7ejT
	6kbUTRdxfUIsWvDlc
X-Received: by 2002:a05:6a20:8f1d:b0:161:7a0c:3c37 with SMTP id b29-20020a056a208f1d00b001617a0c3c37mr2946137pzk.5.1695945493741;
        Thu, 28 Sep 2023 16:58:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:8f1d:b0:161:7a0c:3c37 with SMTP id b29-20020a056a208f1d00b001617a0c3c37mr2946120pzk.5.1695945493342;
        Thu, 28 Sep 2023 16:58:13 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id d24-20020aa78158000000b0068fc2fe4612sm13939445pfn.194.2023.09.28.16.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 16:58:12 -0700 (PDT)
Message-ID: <c45acbe4-f454-f6a0-923b-75ca1e790c03@redhat.com>
Date: Fri, 29 Sep 2023 09:57:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 23/37] arm/virt: Release objects for *disabled*
 possible vCPUs after init
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
 <20230926100436.28284-24-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-24-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: N3h3Ps/0trNT

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> During machvirt_init(), QOM ARMCPU objects are also pre-created along with the
> corresponding KVM vCPUs in the host for all possible vCPUs. This necessary
> because of the architectural constraint, KVM restricts the deferred creation of
> the KVM vCPUs and VGIC initialization/sizing after VM init. Hence, VGIC is
> pre-sized with possible vCPUs.
> 
> After initialization of the machine is complete disabled possible KVM vCPUs are
> then parked at the per-virt-machine list "kvm_parked_vcpus" and we release the
> QOM ARMCPU objects for the disabled vCPUs. These shall be re-created at the time
> when vCPU is hotplugged again. QOM ARMCPU object is then re-attached with
> corresponding parked KVM vCPU.
> 
> Alternatively, we could've never released the QOM CPU objects and kept on
> reusing. This approach might require some modifications of qdevice_add()
> interface to get old ARMCPU object instead of creating a new one for the hotplug
> request.
> 
> Each of the above approaches come with their own pros and cons. This prototype
> uses the 1st approach.(suggestions are welcome!)
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f1bee569d5..3b068534a8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1965,6 +1965,7 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>   {
>       CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
>       int max_cpus = MACHINE(vms)->smp.max_cpus;
> +    MachineState *ms = MACHINE(vms);
>       bool aarch64, steal_time;
>       CPUState *cpu;
>       int n;
> @@ -2025,6 +2026,37 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>               }
>           }
>       }
> +
> +    if (kvm_enabled() || tcg_enabled()) {
> +        for (n = 0; n < possible_cpus->len; n++) {
> +            cpu = qemu_get_possible_cpu(n);
> +
> +            /*
> +             * Now, GIC has been sized with possible CPUs and we dont require
> +             * disabled vCPU objects to be represented in the QOM. Release the
> +             * disabled ARMCPU objects earlier used during init for pre-sizing.
> +             *
> +             * We fake to the guest through ACPI about the presence(_STA.PRES=1)
> +             * of these non-existent vCPUs at VMM/qemu and present these as
> +             * disabled vCPUs(_STA.ENA=0) so that they cant be used. These vCPUs
> +             * can be later added to the guest through hotplug exchanges when
> +             * ARMCPU objects are created back again using 'device_add' QMP
> +             * command.
> +             */
> +            /*
> +             * RFC: Question: Other approach could've been to keep them forever
> +             * and release it only once when qemu exits as part of finalize or
> +             * when new vCPU is hotplugged. In the later old could be released
> +             * for the newly created object for the same vCPU?
> +             */
> +            if (!qemu_enabled_cpu(cpu)) {
> +                CPUArchId *cpu_slot;
> +                cpu_slot = virt_find_cpu_slot(ms, cpu->cpu_index);
> +                cpu_slot->cpu = NULL;
> +                object_unref(OBJECT(cpu));
> +            }
> +        }
> +    }
>   }
>   

Needn't we release those CPU instances for hve and qtest? Besides, I think it's
hard for reuse those objects because they're managed by QOM, which is almost
transparent to us, correct?

>   static void virt_cpu_set_properties(Object *cpuobj, const CPUArchId *cpu_slot,

Thanks,
Gavin
