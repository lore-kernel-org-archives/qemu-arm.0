Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4805655ejd;
        Mon, 22 Apr 2024 23:44:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsqONqVjUEt0U3iScxJmyAS/Xwo5Ux6Pu+UZ5BYPOasOQjgzinVVeJUhhaeSeR8Fu882W51tDdabQY/iKUiYVPkHU9xMRE
X-Google-Smtp-Source: AGHT+IHEmzBpqtrCJ86dixAR4NwuDK735DaRykU8qlFyCp+qSMk99Faf8dZgkshqIMoxEeQd3Gbi
X-Received: by 2002:a05:6871:2b1f:b0:238:fd65:5415 with SMTP id dr31-20020a0568712b1f00b00238fd655415mr15346578oac.37.1713854694002;
        Mon, 22 Apr 2024 23:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713854693; cv=none;
        d=google.com; s=arc-20160816;
        b=Sm4xA9kF+yPLNhJkEXd+7lTIfUOMhcV2WKB8OpA7ZGQ0pGuFj4T5UBUCNdc494ebxk
         dIOo3iSSKi1VKtIi/p4KPu1LvNDDYbcVnTjk3ij1i2OwNIW2RyPee08x0E0/V28etZPm
         HAT0jnYzPt03jcQjrLxWmofaA9Ld6P2urpCtvmwaUlCjoWsEE8qf3cMjC9tNBhyY8QPn
         DPG0emYZ3/6RJ2hd0oSC8u/8/rD/NmKqcg/jBvq/kWMS5rCLFnnWnFhFDyFtcfwBD+n3
         7LBjis9/rISnKXjCi0HHY4F9H78mGlonhytQ2cnc1TYM/UJjweeMPWcxex5p2aCbW2LU
         DdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:date:message-id
         :dkim-signature;
        bh=ZrjOb216+rdvyS46PGoogQDn00wZym9tP+jid8ZkOhk=;
        fh=7lGew1JT/0aLEtOtJB/m6JnezwORvC6MXqAg3OXLUcE=;
        b=0gJpVbBArbETC4gIzdiN6cFU49EEcoZEP7NxobnbHTCzAHLdlfnrVU7oqL6Ow2sw1b
         sq3aAwALZ7M2v+/6oZJtunxEbLM2Z2bNFJL0uP2wid/cfdY+PAyI0C3ynzXLmQ+8JDdn
         4nwAXOmwitbzOgKabQCH/tvP6r5SLtPU2AiJaNRkF+PkukfUo0WTZ/UEudkbozLIRu5i
         EJxM8nPgXxP9wut1SuDsCde/h+0JaOpNnN8Wupo0bpR3e/1df+QwgdR5m1BoKUzJ+l1P
         ETPSCA6dPOvQbC6g0weUn3MRzbIGpZKyVq6bcHoRshyNDhNKgmgI0xj/9jjcqzgsyJsl
         lKMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=toLuemMt;
       spf=pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=harshpb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <harshpb@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id ns10-20020a056870ac8a00b002399d9be10fsi2846699oab.97.2024.04.22.23.44.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Apr 2024 23:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=toLuemMt;
       spf=pass (google.com: domain of harshpb@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=harshpb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43N5UlaF004693;
	Tue, 23 Apr 2024 06:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZrjOb216+rdvyS46PGoogQDn00wZym9tP+jid8ZkOhk=;
 b=toLuemMt1ovTYBPCyjzilrLzxLSoJjYAEocnK9Yuxr0aMfMwBtC89SvtxtemlSxenrBb
 9YeaAP6dji+6t7S3L5U8s9pIZTBXclwiZ9O5TVG9kxVrjOn5aVOZUDlrw9yczXbtAV2g
 QvYCdgrAGE8s+e7Y09TmnWW5+oLiNQzH91N+CtSK//8y16v3bW25QP398ZC66RQ7HHmo
 QETVy/zxb1cbD4FEfK9bK5yum+16+gEpO1wVx1AjDcxZPAlRd5ZTusD0wtcYygxP2nzj
 BYWigayQ5S0gyUjWJvb5f1i+sPXq2Qd5BJqwwDdCwHIdOrg7qcY4N9DDbfZ953wYMSpl Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xp6mpr59y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 06:44:35 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43N6iYXW013678;
	Tue, 23 Apr 2024 06:44:34 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xp6mpr59u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 06:44:34 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43N63XpD028341;
	Tue, 23 Apr 2024 06:44:33 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr2bnap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 06:44:33 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43N6iTxB62783744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Apr 2024 06:44:32 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B20FB5805D;
	Tue, 23 Apr 2024 06:44:29 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7947A58056;
	Tue, 23 Apr 2024 06:44:19 +0000 (GMT)
Received: from [9.109.243.194] (unknown [9.109.243.194])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 Apr 2024 06:44:19 +0000 (GMT)
Message-ID: <06856e51-181a-4cb4-853a-e97cdde14bc0@linux.ibm.com>
Date: Tue, 23 Apr 2024 12:14:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU {creation,
 parking} code
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
        lpieralisi@kernel.org, peter.maydell@linaro.org,
        richard.henderson@linaro.org, imammedo@redhat.com,
        andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
        eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
        mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
        alex.bennee@linaro.org, linux@armlinux.org.uk,
        darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
        vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
        miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
        wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
        jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
        linuxarm@huawei.com, Vaibhav Jain <vaibhav@linux.ibm.com>,
        sbhat@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-2-salil.mehta@huawei.com>
 <ca178aae-82b9-4150-9965-50d968787d23@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <ca178aae-82b9-4150-9965-50d968787d23@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kg-dQqiyxWWsleJqEKQkTdnbPWG4eKDh
X-Proofpoint-ORIG-GUID: PUAVHozwP6Ubq_839JhsBoS9OgYUDHFe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_04,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404230018
X-TUID: xcfXd+uUHjZi

+ Nick

Hi Salil,
I have posted a patch [1] for ppc which based on this refactoring patch.
I see there were some comments from Vishnu on this patch.
Are we expecting any further updates on this patch before merge?

Thanks
Harsh

[1] 
https://lore.kernel.org/qemu-devel/a0f9b2fc-4c8a-4c37-bc36-26bbaa627fec@linux.ibm.com/T/#u

On 3/22/24 13:45, Harsh Prateek Bora wrote:
> + Vaibhav, Shiva
> 
> Hi Salil,
> 
> I came across your patch while trying to solve a related problem on 
> spapr. One query below ..
> 
> On 3/12/24 07:29, Salil Mehta via wrote:
>> KVM vCPU creation is done once during the vCPU realization when Qemu 
>> vCPU thread
>> is spawned. This is common to all the architectures as of now.
>>
>> Hot-unplug of vCPU results in destruction of the vCPU object in QOM 
>> but the
>> corresponding KVM vCPU object in the Host KVM is not destroyed as KVM 
>> doesn't
>> support vCPU removal. Therefore, its representative KVM vCPU 
>> object/context in
>> Qemu is parked.
>>
>> Refactor architecture common logic so that some APIs could be reused 
>> by vCPU
>> Hotplug code of some architectures likes ARM, Loongson etc. Update 
>> new/old APIs
>> with trace events instead of DPRINTF. No functional change is intended 
>> here.
>>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
>>   accel/kvm/trace-events |  5 +++-
>>   include/sysemu/kvm.h   | 16 +++++++++++
>>   3 files changed, 69 insertions(+), 16 deletions(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index a8cecd040e..3bc3207bda 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
>>   #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
>>   static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
>> +static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
>>   static inline void kvm_resample_fd_remove(int gsi)
>>   {
>> @@ -314,14 +315,53 @@ err:
>>       return ret;
>>   }
>> +void kvm_park_vcpu(CPUState *cpu)
>> +{
>> +    struct KVMParkedVcpu *vcpu;
>> +
>> +    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>> +
>> +    vcpu = g_malloc0(sizeof(*vcpu));
>> +    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>> +    vcpu->kvm_fd = cpu->kvm_fd;
>> +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>> +}
>> +
>> +int kvm_create_vcpu(CPUState *cpu)
>> +{
>> +    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
>> +    KVMState *s = kvm_state;
>> +    int kvm_fd;
>> +
>> +    trace_kvm_create_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>> +
>> +    /* check if the KVM vCPU already exist but is parked */
>> +    kvm_fd = kvm_get_vcpu(s, vcpu_id);
>> +    if (kvm_fd < 0) {
>> +        /* vCPU not parked: create a new KVM vCPU */
>> +        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
>> +        if (kvm_fd < 0) {
>> +            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", 
>> vcpu_id);
>> +            return kvm_fd;
>> +        }
>> +    }
>> +
>> +    cpu->kvm_fd = kvm_fd;
>> +    cpu->kvm_state = s;
>> +    cpu->vcpu_dirty = true;
>> +    cpu->dirty_pages = 0;
>> +    cpu->throttle_us_per_full = 0;
>> +
>> +    return 0;
>> +}
>> +
>>   static int do_kvm_destroy_vcpu(CPUState *cpu)
>>   {
>>       KVMState *s = kvm_state;
>>       long mmap_size;
>> -    struct KVMParkedVcpu *vcpu = NULL;
>>       int ret = 0;
>> -    trace_kvm_destroy_vcpu();
>> +    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>       ret = kvm_arch_destroy_vcpu(cpu);
>>       if (ret < 0) {
>> @@ -347,10 +387,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>>           }
>>       }
>> -    vcpu = g_malloc0(sizeof(*vcpu));
>> -    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>> -    vcpu->kvm_fd = cpu->kvm_fd;
>> -    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
>> +    kvm_park_vcpu(cpu);
>>   err:
>>       return ret;
>>   }
>> @@ -371,6 +408,8 @@ static int kvm_get_vcpu(KVMState *s, unsigned long 
>> vcpu_id)
>>           if (cpu->vcpu_id == vcpu_id) {
>>               int kvm_fd;
>> +            trace_kvm_get_vcpu(vcpu_id);
>> +
>>               QLIST_REMOVE(cpu, node);
>>               kvm_fd = cpu->kvm_fd;
>>               g_free(cpu);
>> @@ -378,7 +417,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long 
>> vcpu_id)
>>           }
>>       }
>> -    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
>> +    return -ENOENT;
>>   }
>>   int kvm_init_vcpu(CPUState *cpu, Error **errp)
>> @@ -389,19 +428,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>       trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>> -    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>> +    ret = kvm_create_vcpu(cpu);
>>       if (ret < 0) {
>> -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu 
>> failed (%lu)",
>> +        error_setg_errno(errp, -ret,
>> +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
>>                            kvm_arch_vcpu_id(cpu));
> 
> If a vcpu hotplug fails due to failure with kvm_create_vcpu ioctl,
> current behaviour would be to bring down the guest as errp is
> &error_fatal. Any thoughts on how do we ensure that a failure with
> kvm_create_vcpu ioctl for hotplugged cpus (only) doesnt bring down the
> guest and fail gracefully (by reporting error to user on monitor?)?
> 
> regards,
> Harsh
>>           goto err;
>>       }
>> -    cpu->kvm_fd = ret;
>> -    cpu->kvm_state = s;
>> -    cpu->vcpu_dirty = true;
>> -    cpu->dirty_pages = 0;
>> -    cpu->throttle_us_per_full = 0;
>> -
>>       mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>>       if (mmap_size < 0) {
>>           ret = mmap_size;
>> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
>> index a25902597b..5558cff0dc 100644
>> --- a/accel/kvm/trace-events
>> +++ b/accel/kvm/trace-events
>> @@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd 
>> %d, type 0x%x, arg %p"
>>   kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to 
>> retrieve ONEREG %" PRIu64 " from KVM: %s"
>>   kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to 
>> set ONEREG %" PRIu64 " to KVM: %s"
>>   kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d 
>> id: %lu"
>> +kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d 
>> id: %lu"
>> +kvm_get_vcpu(unsigned long arch_cpu_id) "id: %lu"
>> +kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d 
>> id: %lu"
>> +kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d 
>> id: %lu"
>>   kvm_irqchip_commit_routes(void) ""
>>   kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s 
>> vector %d virq %d"
>>   kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
>> @@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
>>   kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" 
>> pages (took %"PRIi64" us)"
>>   kvm_dirty_ring_reaper_kick(const char *reason) "%s"
>>   kvm_dirty_ring_flush(int finished) "%d"
>> -kvm_destroy_vcpu(void) ""
>>   kvm_failed_get_vcpu_mmap_size(void) ""
>>   kvm_cpu_exec(void) ""
>>   kvm_interrupt_exit_request(void) ""
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index fad9a7e8ff..2ed928aa71 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -435,6 +435,22 @@ void kvm_set_sigmask_len(KVMState *s, unsigned 
>> int sigmask_len);
>>   int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>>                                          hwaddr *phys_addr);
>> +/**
>> + * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
>> + * @cpu: QOM CPUState object for which KVM vCPU has to be 
>> fetched/created.
>> + *
>> + * @returns: 0 when success, errno (<0) when failed.
>> + */
>> +int kvm_create_vcpu(CPUState *cpu);
>> +
>> +/**
>> + * kvm_park_vcpu - Park QEMU KVM vCPU context
>> + * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to 
>> be parked.
>> + *
>> + * @returns: none
>> + */
>> +void kvm_park_vcpu(CPUState *cpu);
>> +
>>   #endif /* NEED_CPU_H */
>>   void kvm_cpu_synchronize_state(CPUState *cpu);
