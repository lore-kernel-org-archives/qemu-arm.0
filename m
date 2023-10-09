Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1996859ejb;
        Mon, 9 Oct 2023 07:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHBOC9I9gzXVcG3DSRKPiE93pQpb7Drny1W7wqlwLrpSj97MDtCNn+IrUqySASkivZTwtn
X-Received: by 2002:a05:620a:2012:b0:775:8e72:164b with SMTP id c18-20020a05620a201200b007758e72164bmr15893166qka.42.1696860674274;
        Mon, 09 Oct 2023 07:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696860674; cv=none;
        d=google.com; s=arc-20160816;
        b=elEFh3Drep7LBOxRQS4LMq4yEa2FZTYrqsygsJOGG5/UxUR7DSGm2TPgDXeAlg7Eaa
         6QS6/JRF/X4wrp6sLqXOux8cOG3yWKVIxSejcO5Xuc9x8xVNt1NTxQFaI2LQI+yxycId
         W1wk5c1WzwSmVS/4JcaSPDIDyJdDtfEocbhT2imsmUXRHj/7TDPYcqHIi+cK/pdB+7tb
         rCD9bM9yVFWjDkTBirFamyr27+O1GPewd4lmeQhAftY4UDyRgJbwH1Vnqle7KZszdAgS
         3aq9Enzto+g6/MTqJSLobLa4J1wHCRYvWz0yLrG/G7mwe0dwt30yunquRFS5Sn44RFWd
         FVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject
         :organization:from:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=LxlXWmITfzST20kPRPo6Pmoy2PQ26O72HSJaXVgs8lQ=;
        fh=B6hYtw/BbyOqu6OjGRBKzIZ+XNWqkJzkX6KeV9DY8XU=;
        b=Y1eXaLtYpm2h2CYXktBUqO6Rvb67ddBMmc4SOjBpo88INEDRf16LjPLuEUUMMPR4Of
         K7SCkdtGnABWGzHPUP03+zk+95wKuJGDzPrHD7pUUDec3hsmMiS9c3JoHCzEPMBmKUJU
         ykZU+y3LxAL7RYGpfodJ2FPuCPbJupnok5qq3CEJTD1COkYM+TDhBCbLfjaRuFxPzu0i
         OzjZb2XskLQwfe13c+hs9MD8t5h77bcgPMJQ2+Ho3xxDoBEpDBmWWhMzUt2kFa6NEstp
         1g9/4ARCEyVMPLPLInTufKu4piYyQl5acGxO324wI1AExcvU4pEDZl2v6A9cpZ7jw0P1
         UwCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=At7maO5b;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ay44-20020a05620a17ac00b0076da4734528si6354431qkb.357.2023.10.09.07.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=At7maO5b;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696860673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxlXWmITfzST20kPRPo6Pmoy2PQ26O72HSJaXVgs8lQ=;
	b=At7maO5baVLHkgDWXOp49xdnb2hDFoZ4K1pLTiDm72QZHusg+F3cHjiZoJZwRTNXdeCw+u
	t3gIqW0b3EWTtMacBXmHZ+EecoxvGtYan1j5egBQnl/GHSAiy5EwlkqXo3RfQiLVPZzHHm
	NAJ1UqJoW2zgSSC0/DwCnUQR9E0T/II=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-tZfNClpvPEWQaLGd_LoRcw-1; Mon, 09 Oct 2023 10:11:11 -0400
X-MC-Unique: tZfNClpvPEWQaLGd_LoRcw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-323334992fbso3228541f8f.1
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 07:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860670; x=1697465470;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxlXWmITfzST20kPRPo6Pmoy2PQ26O72HSJaXVgs8lQ=;
        b=AWwa467KRlxPH2oTDSL8PRoM3hC7WbRBgXC1kGNUdJXZyQ/ubYxO+hc0XeXSK1+fl6
         svJc5uwOJo4xeauPoDQg6KqMKs8WMBxmpyurS+19OXIttcSzMpPeg+ZMZF8/bu1/XWVN
         cU2d426zSSLY4rQCV2sNuTFQas7uUMUZ0MQHWnG4hrSTaNiOYCUzECRBEBlbWSOZEl48
         6OR180FErs2whJX78fGM6n/5gvsgQnxzTeE5mQOZDwOtzlw9/TfWtCw2S6ijfgplO3QW
         yrlS4nMdIogQgZiffJHvHnip1RRgZ9mQEaA5MYQMRtlPZ16oCVFN4Ush8ssTLEflrePK
         KtDg==
X-Gm-Message-State: AOJu0Ywkg/p9Cpo63AxluL/KmOlIkxuzhYWAROrda1lsKR3YmMwcqTOa
	3sPB+TpTw9lY568iyPyVEgdxk9jZz7TO0AxmNMO+qvIkRgi7o+7X32yw2BZmitQ7gJF7eMdZA9j
	yvN24m+gxWvaP1AT5
X-Received: by 2002:a5d:46cf:0:b0:31f:8e7c:6ebe with SMTP id g15-20020a5d46cf000000b0031f8e7c6ebemr12959034wrs.5.1696860669651;
        Mon, 09 Oct 2023 07:11:09 -0700 (PDT)
X-Received: by 2002:a5d:46cf:0:b0:31f:8e7c:6ebe with SMTP id g15-20020a5d46cf000000b0031f8e7c6ebemr12959014wrs.5.1696860669084;
        Mon, 09 Oct 2023 07:11:09 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548? (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de. [2003:cb:c733:6400:ae10:4bb7:9712:8548])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm9819678wrp.89.2023.10.09.07.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:11:08 -0700 (PDT)
Message-ID: <ae2e0fc1-7967-2bae-e4fa-b4d886ba4671@redhat.com>
Date: Mon, 9 Oct 2023 16:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
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
 "philmd@linaro.org" <philmd@linaro.org>,
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
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-2-salil.mehta@huawei.com>
 <a02eae26-6018-6f5c-1b82-e6061544022b@redhat.com>
 <63f8e47efcd045b1b8481f6fd427c4b1@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH V3 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
In-Reply-To: <63f8e47efcd045b1b8481f6fd427c4b1@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Sy2r5ZzKIgtN

On 09.10.23 15:42, Salil Mehta wrote:
> Hi David,
> Thanks for the review.
> 
>> From: David Hildenbrand <david@redhat.com>
>> Sent: Monday, October 9, 2023 1:21 PM
>> To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
>> Cc: maz@kernel.org; jean-philippe@linaro.org; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; lpieralisi@kernel.org;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> imammedo@redhat.com; andrew.jones@linux.dev; philmd@linaro.org;
>> eric.auger@redhat.com; oliver.upton@linux.dev; pbonzini@redhat.com;
>> mst@redhat.com; will@kernel.org; gshan@redhat.com; rafael@kernel.org;
>> alex.bennee@linaro.org; linux@armlinux.org.uk;
>> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
>> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
>> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
>> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
>> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
>> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.com>
>> Subject: Re: [PATCH V3 01/10] accel/kvm: Extract common KVM vCPU
>> {creation,parking} code
>>
>> On 09.10.23 13:28, Salil Mehta wrote:
>>> KVM vCPU creation is done once during the initialization of the VM when Qemu
>>> thread is spawned. This is common to all the architectures.
>>>
>>> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
>>> corresponding KVM vCPU object in the Host KVM is not destroyed and its
>>> representative KVM vCPU object/context in Qemu is parked.
>>>
>>> Refactor common logic so that some APIs could be reused by vCPU Hotplug code.
>>>
>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>
>> [...]
>>
>>>
>>>    int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>> @@ -395,19 +434,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>>
>>>        trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>>
>>> -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>>> +    ret = kvm_create_vcpu(cpu);
>>>        if (ret < 0) {
>>> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
>>> +        error_setg_errno(errp, -ret,
>>> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
>>
>> Unrelated change.
> 
> 
> It is related. I think you missed kvm_get_vcpu -> kvm_create_vcpu change
> in the string.

Indeed, I did :)

> 
> 
>>>                             kvm_arch_vcpu_id(cpu));
>>>            goto err;
>>>        }
>>>
>>> -    cpu->kvm_fd = ret;
>>> -    cpu->kvm_state = s;
>>> -    cpu->vcpu_dirty = true;
>>> -    cpu->dirty_pages = 0;
>>> -    cpu->throttle_us_per_full = 0;
>>> -
>>>        mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>>>        if (mmap_size < 0) {
>>>            ret = mmap_size;
>>> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
>>> index 399aaeb0ec..08e2dc253f 100644
>>> --- a/accel/kvm/trace-events
>>> +++ b/accel/kvm/trace-events
>>> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
>>>    kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
>>>    kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
>>>    kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
>>> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "creating KVM cpu: cpu_index: %d arch vcpu-id: %lu"
>>> +kvm_get_vcpu(unsigned long arch_cpu_id) "unparking KVM vcpu: arch vcpu-id: %lu"
>>> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "destroy vcpu: cpu_index: %d arch vcpu-id: %lu"
>>> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "parking KVM vcpu: cpu_index: %d arch vcpu-id: %lu"
>>
>> It's a bit confusing that there is now
>>
>> 1) create (create new or return parked)
>> 2) destroy (cleanup + park)
>> 3) park (park only)
>>
>> Why would one use 2) instead of 3) or the other way around? But I
>> suspect that kvm_destroy_vcpu() is only supposed to be a KVM-internal
>> helper ...
> 
> kvm_destroy_vcpu is more than just parking:
> 
> 1. Arch destroy vcpu
> 2. Unmap cpu->kvm_run
> 3. Parking logic
> 
> To support virtual CPU Hotplug on ARM platforms we pre-create all
> the KVM vCPUs but their corresponding Qemu threads are not spawned
> (and hence cpu->kvm_run is not mapped). Unplugged vCPUs remains
> parked in the list. Hence, only step-3 is required.

IIUC, your current flow is going to be

1) Create
2) Park
3) Create [which ends up reusing the parked VCPU]
4) Destroy [when unplugging the CPU]

If that's the case, that API really is suboptimal.

What speaks against an API that models 1) and 2) in a single step

kvm_precreate_vcpu
kvm_create_vcpu
kvm_destroy_vcpu

One could even make kvm_create_vcpu() fail on ARM if the VCPU hasn't 
been pre-created.

Or did I get it all wrong? :)

-- 
Cheers,

David / dhildenb
