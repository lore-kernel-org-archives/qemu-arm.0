Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1925166ejb;
        Mon, 9 Oct 2023 05:20:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGQAZC5X7JSnyU9d9RnRogY1oiKLcsn/VIjgKKcAxvJWEKScoiSOSIgfEYsdceq0Sx4Wic
X-Received: by 2002:a2e:8505:0:b0:2c0:eb3:3200 with SMTP id j5-20020a2e8505000000b002c00eb33200mr13037311lji.16.1696854053730;
        Mon, 09 Oct 2023 05:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696854053; cv=none;
        d=google.com; s=arc-20160816;
        b=prve2u3f0Lx1KodG6wG4XyE/KWbIx2NiPrNtb0SI0Zd6XczBqXk2GsZ7Jvb6P575zn
         uSziE/GwCuMvXsISfjQouNGuQxtL3aNgORH+ufYi77/nixK1bljLP7Q+SFCUbpPkxspn
         2y6yhfuExgWo8OjpEyEvmLEMqyivkfpSb/kOcXT8HZFzPxUI/br0agejxkZL0ipnbcof
         Fa0dH5tcMkeAm1PtlDDwJUgZwNjZfqWM6lfNXP8BPVDmG/jf95ean26myfZu5w2F1KWr
         cS7qpd0ztMPxPpKnJEpbCU8Zo+pIS7sw+zsH0vs6bbitWxC7WVPSP0As2TMnaQEqgkj6
         h/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject
         :organization:from:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=XV3UtU1e17ThaCU8FwkJff/Ub39aiHlBD69v7s4+WPg=;
        fh=GPxWsKePQQOQbx3DUz1WcTM7+aHXsm9W/SdNx32dskg=;
        b=EpJybInl46B9ghd0EnBcIlIHqKGACg9SIMAgakE3sBbKWQL6Q2tu9nDuEYdnwkyJeU
         THNdn7zH9lJQZRsxokU7rvoyASm/dDRX5b0x1ioBYJTms13TIPcK7gszM/NhiTuSAQ7g
         Rhkv4WPikuPO8+xytE3v8UP68C+vi750do1ISItRhqjWJpVHnLV2BlBt9ozk76S4II26
         5CvMUPN2rJYeqJr8U6hs8ZQn/WfEqmYDxMXNVkw+hnUzPAuplPabfxYE5gfgmjGKBfPZ
         NCBKXOt55qJ51bsZqvigpaBlBPc+iOmI0EpBCesoluAwejW0loQxfK9yFmOvj2QG7fPT
         /D4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsoV2GT0;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p26-20020a2e805a000000b002c0045e4280si7987103ljg.102.2023.10.09.05.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsoV2GT0;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696854052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XV3UtU1e17ThaCU8FwkJff/Ub39aiHlBD69v7s4+WPg=;
	b=NsoV2GT0SW+Co3OornyefLRN2IRB2+aaefCmIVYx3kQbr+I764U1yeZMakMCBdzc13SbMI
	41ns108nQnIdipgOJhMcI1GhkgWOv+ErjWdKWKHJUcNPAhzdqTwFCu5D9/L+Hv0jp3LzzI
	jAiLax6QXIz/tZpnFP949n8gxoEQApQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-2U91iLRSOpWWKN4X-SytQQ-1; Mon, 09 Oct 2023 08:20:51 -0400
X-MC-Unique: 2U91iLRSOpWWKN4X-SytQQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31fd48da316so2896146f8f.3
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 05:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854050; x=1697458850;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XV3UtU1e17ThaCU8FwkJff/Ub39aiHlBD69v7s4+WPg=;
        b=RtcURzgZ7kYFqMpZcjQVLdt3utCOgW+LecwYAS31BhMiqiIGGJ5EFh56jaNpsK/MWW
         xvUhQqBVsoyAjJ44yUnm+yE0vA4Gvcb6DmRGB7FwjRfdz5SZZsid1DhrCS9eq2woF96A
         H7wkYPcnS83lxEDNY64yzGSSb8MgnURxq9eQGkrjAT/vlYZLajVFIxG+7IBGX08A/7UN
         sqr/9RaWGtes1QjTIkNbPQWjqUZUkDKE385wgw10QLR2k5EWiQ2dCmZRqyC8yFOsp9b4
         BUKtsN6a7MNapK9eG8xqN4+GXWej1+81H+agMwaJy5JQoQoAKp9xA1g6iFwE7gMfgv6/
         8rVg==
X-Gm-Message-State: AOJu0YyI29t0CmL6qhSFeY3d/qNMLcgScTEibDW0hP4EFF1w7BeW976I
	l9qM/IXovlsCn+TVKy8UOuAJryNAMTxpAVd4tBZzNz8arRDulxsktP4uZvomlazInHqlNZ/HQdy
	aU5f8FjzL4A4a+mYZ
X-Received: by 2002:a5d:4ac6:0:b0:324:885f:f806 with SMTP id y6-20020a5d4ac6000000b00324885ff806mr12939641wrs.56.1696854049942;
        Mon, 09 Oct 2023 05:20:49 -0700 (PDT)
X-Received: by 2002:a5d:4ac6:0:b0:324:885f:f806 with SMTP id y6-20020a5d4ac6000000b00324885ff806mr12939624wrs.56.1696854049495;
        Mon, 09 Oct 2023 05:20:49 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548? (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de. [2003:cb:c733:6400:ae10:4bb7:9712:8548])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c025300b00401d8181f8bsm13295153wmj.25.2023.10.09.05.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:20:49 -0700 (PDT)
Message-ID: <a02eae26-6018-6f5c-1b82-e6061544022b@redhat.com>
Date: Mon, 9 Oct 2023 14:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-2-salil.mehta@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH V3 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
In-Reply-To: <20231009112812.10612-2-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: iUgO5EY5HeOA

On 09.10.23 13:28, Salil Mehta wrote:
> KVM vCPU creation is done once during the initialization of the VM when Qemu
> thread is spawned. This is common to all the architectures.
> 
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> corresponding KVM vCPU object in the Host KVM is not destroyed and its
> representative KVM vCPU object/context in Qemu is parked.
> 
> Refactor common logic so that some APIs could be reused by vCPU Hotplug code.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

[...]

>   
>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
> @@ -395,19 +434,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>   
>       trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>   
> -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
> +    ret = kvm_create_vcpu(cpu);
>       if (ret < 0) {
> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
> +        error_setg_errno(errp, -ret,
> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",

Unrelated change.

>                            kvm_arch_vcpu_id(cpu));
>           goto err;
>       }
>   
> -    cpu->kvm_fd = ret;
> -    cpu->kvm_state = s;
> -    cpu->vcpu_dirty = true;
> -    cpu->dirty_pages = 0;
> -    cpu->throttle_us_per_full = 0;
> -
>       mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>       if (mmap_size < 0) {
>           ret = mmap_size;
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index 399aaeb0ec..08e2dc253f 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
>   kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
>   kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
>   kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "creating KVM cpu: cpu_index: %d arch vcpu-id: %lu"
> +kvm_get_vcpu(unsigned long arch_cpu_id) "unparking KVM vcpu: arch vcpu-id: %lu"
> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "destroy vcpu: cpu_index: %d arch vcpu-id: %lu"
> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "parking KVM vcpu: cpu_index: %d arch vcpu-id: %lu"

It's a bit confusing that there is now

1) create (create new or return parked)
2) destroy (cleanup + park)
3) park (park only)

Why would one use 2) instead of 3) or the other way around? But I 
suspect that kvm_destroy_vcpu() is only supposed to be a KVM-internal 
helper ...

>   kvm_irqchip_commit_routes(void) ""
>   kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
>   kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index ee9025f8e9..57bd8f8fd6 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -464,6 +464,20 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>   
>   int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>                                          hwaddr *phys_addr);
> +/**
> + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
> + * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/created.
> + *
> + * @returns: 0 when success, errno (<0) when failed.
> + */
> +int kvm_create_vcpu(CPUState *cpu);
> +/**
> + * kvm_park_vcpu - Gets a parked KVM vCPU if it exists


^ I suspect that description is wrong.

-- 
Cheers,

David / dhildenb
