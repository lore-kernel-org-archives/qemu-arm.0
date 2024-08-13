Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp981302njh;
        Mon, 12 Aug 2024 18:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGE+1o6z5QORmPuKcKdj7WwkBR/Q6/UOxzgP/JOqcKEvJ7paYsvJeduUppxpCiw7tEr1BvWPTwtYjeisndhI4ZW6WwB+ih
X-Google-Smtp-Source: AGHT+IGh6S84p3BXIQtgdOStLR0LNdAGBiPGoAwpoqGkImhVHXxp57s0+ZXe4IRzl8edNqb0RtJ2
X-Received: by 2002:a05:622a:5a08:b0:451:a092:6423 with SMTP id d75a77b69052e-45349895291mr27073411cf.10.1723511840566;
        Mon, 12 Aug 2024 18:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723511840; cv=none;
        d=google.com; s=arc-20160816;
        b=u8PTd7tbrtCFpkOJkkdsqw51t+S0u3y2erxZt8aNDdDANai4TuAO0idJpfy8yLTSQI
         Y/hH1wakcOocIv6bM3q9e18JU+RlCn6O0/aRXOuTa70wUJPrq/VLvaMxKKqhEsmuybTt
         ZmgrzeLjBPjbfQ3WX9aMXvEbVRamUCol0B8htXpbVEh9JpwsbH35bEzaLSxQHxaqDEwA
         7vE2mTb98Ea/YLUfOKs74e0uspKlNj4W2ZMa35Bud/442Az23kIFCtQ0Fv9BvW/4D0CS
         0MQnydlM+qqTXMnhNu5Do7RlQLhMnNu6giot2MjmH688Kz8P64K6DBDTqTOT4qwie7NQ
         OZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R/NzavlB9aam14kH4Hp/v1TfseVW/xmMR2ba+MwAhng=;
        fh=TV/oBgRxtOhT0R0CJXGq93ZZCgZLXn3T9jbYN+AfMyw=;
        b=wwdLriGmcbjR+sRTJs+4gpHxsRIgPOW4NpnNBuiIxtV2PjWsx2pMTvI8BzwOcUN4IY
         /rWosWbNMDqAsbJIU6EIE6RdDoG/DcX3vEhbLn4tRH6NUVWwKFEbC/mjFsY9Ttd4+lpB
         sLEUD/OEX4aZVb/ihINwCkwG5mWFX6DGNhoABcbLxL3Uq7BUAJOekUr9SuJUWbH6OIux
         G59vmlAf83Etsope8RhW1hkPZWgz7qH79wToPluPigxqjmmDvgei0IzvQ57dlray7YPU
         dr1gY71Hx2hc0U6zMcnl0AOxDi0JhJMG4+bCJpSczUIt8Gkr6JXcuz3VRCxonnupcAJs
         5FLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VtzyCJPf;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c1c7fc4si71622881cf.171.2024.08.12.18.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:17:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VtzyCJPf;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723511840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/NzavlB9aam14kH4Hp/v1TfseVW/xmMR2ba+MwAhng=;
	b=VtzyCJPfPXlMblTyx+7MyWGgKDJ1rKpRAWTakouv+vyWExzKOhfmMmqa1kao3dhGuZzDri
	drXkQq9uxbbnhHWr71czm5FN3uNqVKEEBTF2kjPVLKpQMtC90O5evaZAH3nEukppwPnOYj
	O3HAeAhIcylrQ6gaaD+IJm950msQ6RI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-7cxjBHwvOsiobAbT6zRIAA-1; Mon, 12 Aug 2024 21:17:18 -0400
X-MC-Unique: 7cxjBHwvOsiobAbT6zRIAA-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1fd8677380dso49732335ad.2
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 18:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723511837; x=1724116637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/NzavlB9aam14kH4Hp/v1TfseVW/xmMR2ba+MwAhng=;
        b=C/SGg8dYOQ99TSN3E6dbUAiV2rZD5xUC9adb9y76Dm1iE601crHSAH/Q7Bh5MQ4vR6
         jPo9I1clVqSIkerb7xV1ci/49d2F9h+VtrLbLAwz/8sFBhmEG6TImulDJaJa3Xx9d7yf
         QiY55XYM8OXwHT5rEx07ocwTjzmPYIcRqURqahUz5az+B4P2/0bvZc98Wn/BAj4wCEQW
         dz0J9Gm8dJsPEi9HQW9PLDANhbM9XU2tQ66qolSYpacnjGtN8CFMkgZ1Qo8RLfBBu5KD
         i+h03cfv25yB/paOHfM53I6S9O+K/sLg0qUM+8TV3nBY1uka/airCx0hTCeqMvZDJPOY
         +Zeg==
X-Forwarded-Encrypted: i=1; AJvYcCUi489rBNVn3VwVzPZ2sShgS1Ws7hWPyS7dIdXtCad5NcUSP6zFqCmQedL4TpsTRVgRkQmTvehnKxuxKb2+nCs/vz/oQP9R
X-Gm-Message-State: AOJu0YxHqDQopg09r1lNiTw+X3CL98jngPzQNYM2KWDdmPaO1Kuykw3e
	3oKQpFZMKf8RHmjx+vlWce/+bILZYxs3zStRqWgg8cZrh/uObZnvaF3kGyUjeOMp73hcK+kd0QM
	3RgcHLX1ra+L4yRYrldvF2ed9WJnHeVcSeBf0Y8eIrEzx5wocVcxmGg==
X-Received: by 2002:a17:903:24f:b0:1fc:2ee3:d460 with SMTP id d9443c01a7336-201ca18316bmr24913865ad.35.1723511837362;
        Mon, 12 Aug 2024 18:17:17 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:1fc:2ee3:d460 with SMTP id d9443c01a7336-201ca18316bmr24913655ad.35.1723511836900;
        Mon, 12 Aug 2024 18:17:16 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1ba02bsm2779345ad.229.2024.08.12.18.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 18:17:16 -0700 (PDT)
Message-ID: <51dc0813-7dc9-4927-a24b-bd718be54e46@redhat.com>
Date: Tue, 13 Aug 2024 11:17:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 17/29] arm/virt: Release objects for *disabled*
 possible vCPUs after init
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-18-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-18-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: n9Dx2O0qtO+6

On 6/14/24 9:36 AM, Salil Mehta wrote:
> During `machvirt_init()`, QOM ARMCPU objects are pre-created along with the
> corresponding KVM vCPUs in the host for all possible vCPUs. This is necessary
> due to the architectural constraint that KVM restricts the deferred creation of
> KVM vCPUs and VGIC initialization/sizing after VM initialization. Hence, VGIC is
> pre-sized with possible vCPUs.
> 
> After the initialization of the machine is complete, the disabled possible KVM
> vCPUs are parked in the per-virt-machine list "kvm_parked_vcpus," and we release
> the QOM ARMCPU objects for the disabled vCPUs. These will be re-created when the
> vCPU is hotplugged again. The QOM ARMCPU object is then re-attached to the
> corresponding parked KVM vCPU.
> 
> Alternatively, we could have chosen not to release the QOM CPU objects and kept
> reusing them. This approach might require some modifications to the
> `qdevice_add()` interface to retrieve the old ARMCPU object instead of creating
> a new one for the hotplug request.
> 
> Each of these approaches has its own pros and cons. This prototype uses the
> first approach (suggestions are welcome!).
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9d33f30a6a..a72cd3b20d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2050,6 +2050,7 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>   {
>       CPUArchIdList *possible_cpus = vms->parent.possible_cpus;
>       int max_cpus = MACHINE(vms)->smp.max_cpus;
> +    MachineState *ms = MACHINE(vms);
>       bool aarch64, steal_time;
>       CPUState *cpu;
>       int n;
> @@ -2111,6 +2112,37 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
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

It's probably hard to keep those ARMCPU objects forever. First of all, one vCPU
can be hot-added first and then hot-removed afterwards. With those ARMCPU objects
kept forever, the syntax of 'device_add' and 'device_del' become broken at least.
The ideal mechanism would be to avoid instanciating those ARMCPU objects and
destroying them soon. I don't know if ms->possible_cpus->cpus[] can fit and how
much efforts needed.

Thanks,
Gavin

>   
>   static void virt_cpu_set_properties(Object *cpuobj, const CPUArchId *cpu_slot,
