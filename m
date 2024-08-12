Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp691636njh;
        Mon, 12 Aug 2024 01:16:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZehWjdTSXyMPdXuw0Snyke1rPGeBNVrMwcj8Oga8y8PUgnCtOLAHUuXGwqizjmTykhLxVGb2O+MuvvA==@linaro.org
X-Google-Smtp-Source: AGHT+IHSpWsMRtCfFrsH3RpCT8a5vzg/YA63V8VcbrUfvSNE/NymDtsv6hdrXcfkXZnFUtTADBTk
X-Received: by 2002:a05:6214:4383:b0:6bb:b1d4:6b38 with SMTP id 6a1803df08f44-6bd78d03bb8mr82304766d6.11.1723450563416;
        Mon, 12 Aug 2024 01:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723450563; cv=none;
        d=google.com; s=arc-20160816;
        b=v82+EYVxbwDCshfQx7T/FmMMqcA++rD+xzx/jzE3X514DnyUiKDMLV1ukIXP4Eja/J
         cL5F7EZRnHrARqmLkt+a7sGzQuCKQ6VKrLBqspugBN6lxzj0Ptlz+xEa4TZkj31y3aHb
         S0lc7Tq066PZHTEAR46yFaN837SOkVvh/OoF//oC7TF1bKcmrxD0nkwTLJUff9dTQiVT
         CnQu08sS1y0TKsNbjohClY7j74aVTfBEyv+ZpZ+S44hwzyaumxXmK2t6e6Mwhu7CQTDR
         VEFZbaj6xDSksa/NkYsUK0r3l6jTpyXiVIVzQ+uCOfnuBA4+qjpGIKG9RM+FVOmkz4sE
         f0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=xoL7wwtFd86vAPLugXd+UlC7FcHiJVd/NyfCXHrp6VI=;
        fh=cYtcJUdnAaJvE6rPCmxMJ1/9fd5r4xxmyA/3RTrSAz0=;
        b=bqENyiAoNGzCdITy7nrgLH7/Gahz7VmrX1q2h9Hxk/mjN0dujsv6gZ6zG8anAC9vK5
         2/LrCRmLmeX3xQIDIdFWTyBoA/fMskNQVR3kN2z5NCnZ3xUwHIlHG75EtYRE6lm044rP
         iYvj578J99R1R5VzcMx8qDYVtT5n65UL3PX8AyJP7I+vElNzNVYigTMM3atHySvPAaan
         KcpWn+W4mmJAhQxpYBvo3+PGXsML308CNdpH9tf7bMNfSMHD8rIo9s+ssL4CC4aS0UaI
         qSfzIjlJdrvMdagXzmTgXtWprkm9CDE5B3ENs1UpRZKCMshdDgNUCQOhjMEI0TLTVCSN
         K/7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hsWjPlfS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82c8ba4esi55162596d6.164.2024.08.12.01.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 01:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hsWjPlfS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723450563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xoL7wwtFd86vAPLugXd+UlC7FcHiJVd/NyfCXHrp6VI=;
	b=hsWjPlfSgNzZEk5nsJAiWooCOW/P83f6q/yftjOD+ToKDU7rKt1U++Vb6x6sFfYffvbIRh
	BkAtgLEpy2m2P0h/Qy/jtkfK3lN7FMZw9Yl6s+lpPGilL0iPcQPhlL5V8HF6juNf1X4N0x
	3ZdHiggf1z7D9G8unOZ1iW8sI1qceso=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-HqrEfDeDN3ylABMTw3shLw-1; Mon, 12 Aug 2024 04:16:00 -0400
X-MC-Unique: HqrEfDeDN3ylABMTw3shLw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42820c29a76so33830585e9.2
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 01:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723450559; x=1724055359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoL7wwtFd86vAPLugXd+UlC7FcHiJVd/NyfCXHrp6VI=;
        b=TUtuKLVYB9BhcKHaa1Z5i4Fj8lSF2dsd1eClUdDrYobBFYElbe8xcuLRK60j7FQC+P
         7yUR5EV2j1Gq24YuoV7rsgsFuJ7suraCqPywSEbR0v4AWQHnl9RHaIZaRCzkNDdsHRMW
         xPyQje92YZLs+lpTEY/P75w+ToCld8g9cKlv3fcjXcn6JPYvjKOOn2/j1YfBuD3bDMMM
         ROqjO1W8K4rJMe06T8f2dbVtHJqTDTrldFmj8R5S7U5qfxXTb1dxMcJxLpUwO4oOgNUT
         VYTkhXU6vR8kj1xPcmUpX8h8hY3QY3zDEh2bbsu6RkUlnpD83AjgXiVr0QcFGY12SqTJ
         CXmg==
X-Forwarded-Encrypted: i=1; AJvYcCWxtnIih4A8kEbzN2E6v2D9KAQ9TIKmSmlyLbZdxCcYi+hcrhAdY9hMkaZSdglpe9clbJrdp5kMzI0GnQ==@linaro.org
X-Gm-Message-State: AOJu0Yxj7e4HMgCqgulCFOR5n6PT0pIKBTZLl7wJsKnIkigzgj30dtEf
	9jt/ReMiyXs5n8FHEqyHOI9+qz9SxW2BO8sfxr++Uqvt+GKQYvmpYOX/VYEbnJtih7i06pmeM4Y
	BtgXIKz2NdHctPe6mJBJCS+f/tIRF2btdmiCzNcXneR3Nxy9e6p6LbQ==
X-Received: by 2002:a05:600c:548b:b0:428:c0a:27ea with SMTP id 5b1f17b1804b1-429c3a1bc92mr51096525e9.12.1723450559277;
        Mon, 12 Aug 2024 01:15:59 -0700 (PDT)
X-Received: by 2002:a05:600c:548b:b0:428:c0a:27ea with SMTP id 5b1f17b1804b1-429c3a1bc92mr51096225e9.12.1723450558634;
        Mon, 12 Aug 2024 01:15:58 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c77370b0sm94098375e9.32.2024.08.12.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 01:15:57 -0700 (PDT)
Date: Mon, 12 Aug 2024 10:15:56 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org, npiggin@gmail.com,
 harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com
Subject: Re: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
Message-ID: <20240812101556.1a395712@imammedo.users.ipa.redhat.com>
In-Reply-To: <11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<20240613233639.202896-2-salil.mehta@huawei.com>
	<11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 1V290QSz2GS/

On Mon, 12 Aug 2024 14:35:56 +1000
Gavin Shan <gshan@redhat.com> wrote:

> On 6/14/24 9:36 AM, Salil Mehta wrote:
> > This shall be used to store user specified topology{socket,cluster,core,thread}
> > and shall be converted to a unique 'vcpu-id' which is used as slot-index during
> > hot(un)plug of vCPU.
> > 
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > ---
> >   hw/arm/virt.c         | 10 ++++++++++
> >   include/hw/arm/virt.h | 28 ++++++++++++++++++++++++++++
> >   target/arm/cpu.c      |  4 ++++
> >   target/arm/cpu.h      |  4 ++++
> >   4 files changed, 46 insertions(+)
> >   
> 
> Those 4 properties are introduced to determine the vCPU's slot, which is the index
> to MachineState::possible_cpus::cpus[]. From there, the CPU object or instance is
> referenced and then the CPU's state can be further determined. It sounds reasonable
> to use the CPU's topology to determine the index. However, I'm wandering if this can
> be simplified to use 'cpu-index' or 'index' for a couple of facts: (1) 'cpu-index'

Please, don't. We've spent a bunch of time to get rid of cpu-index in user
visible interface (well, old NUMA CLI is still there along with 'new' topology
based one, but that's the last one).

> or 'index' is simplified. Users have to provide 4 parameters in order to determine
> its index in the extreme case, for example "device_add host-arm-cpu, id=cpu7,socket-id=1,
> cluster-id=1,core-id=1,thread-id=1". With 'cpu-index' or 'index', it can be simplified
> to 'index=7'. (2) The cold-booted and hotpluggable CPUs are determined by their index
> instead of their topology. For example, CPU0/1/2/3 are cold-booted CPUs while CPU4/5/6/7
> are hotpluggable CPUs with command lines '-smp maxcpus=8,cpus=4'. So 'index' makes
> more sense to identify a vCPU's slot.
cpu-index have been used for hotplug with x86 machines as a starting point
to implement hotplug as it was easy to hack and it has already existed in QEMU.

But that didn't scale as was desired and had its own issues.
Hence the current interface that majority agreed upon.
I don't remember exact arguments anymore (they could be found qemu-devel if needed)
Here is a link to the talk that tried to explain why topo based was introduced.
  http://events17.linuxfoundation.org/sites/events/files/slides/CPU%20Hot-plug%20support%20in%20QEMU.pdf


> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 3c93c0c0a6..11fc7fc318 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2215,6 +2215,14 @@ static void machvirt_init(MachineState *machine)
> >                             &error_fatal);
> >   
> >           aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
> > +        object_property_set_int(cpuobj, "socket-id",
> > +                                virt_get_socket_id(machine, n), NULL);
> > +        object_property_set_int(cpuobj, "cluster-id",
> > +                                virt_get_cluster_id(machine, n), NULL);
> > +        object_property_set_int(cpuobj, "core-id",
> > +                                virt_get_core_id(machine, n), NULL);
> > +        object_property_set_int(cpuobj, "thread-id",
> > +                                virt_get_thread_id(machine, n), NULL);
> >   
> >           if (!vms->secure) {
> >               object_property_set_bool(cpuobj, "has_el3", false, NULL);
> > @@ -2708,6 +2716,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >   {
> >       int n;
> >       unsigned int max_cpus = ms->smp.max_cpus;
> > +    unsigned int smp_threads = ms->smp.threads;
> >       VirtMachineState *vms = VIRT_MACHINE(ms);
> >       MachineClass *mc = MACHINE_GET_CLASS(vms);
> >   
> > @@ -2721,6 +2730,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >       ms->possible_cpus->len = max_cpus;
> >       for (n = 0; n < ms->possible_cpus->len; n++) {
> >           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> > +        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
> >           ms->possible_cpus->cpus[n].arch_id =
> >               virt_cpu_mp_affinity(vms, n);
> >     
> 
> Why @vcpus_count is initialized to @smp_threads? it needs to be documented in
> the commit log.
> 
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index bb486d36b1..6f9a7bb60b 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -209,4 +209,32 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
> >               vms->highmem_redists) ? 2 : 1;
> >   }
> >   
> > +static inline int virt_get_socket_id(const MachineState *ms, int cpu_index)
> > +{
> > +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> > +
> > +    return ms->possible_cpus->cpus[cpu_index].props.socket_id;
> > +}
> > +
> > +static inline int virt_get_cluster_id(const MachineState *ms, int cpu_index)
> > +{
> > +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> > +
> > +    return ms->possible_cpus->cpus[cpu_index].props.cluster_id;
> > +}
> > +
> > +static inline int virt_get_core_id(const MachineState *ms, int cpu_index)
> > +{
> > +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> > +
> > +    return ms->possible_cpus->cpus[cpu_index].props.core_id;
> > +}
> > +
> > +static inline int virt_get_thread_id(const MachineState *ms, int cpu_index)
> > +{
> > +    assert(cpu_index >= 0 && cpu_index < ms->possible_cpus->len);
> > +
> > +    return ms->possible_cpus->cpus[cpu_index].props.thread_id;
> > +}
> > +
> >   #endif /* QEMU_ARM_VIRT_H */
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 77f8c9c748..abc4ed0842 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -2582,6 +2582,10 @@ static Property arm_cpu_properties[] = {
> >       DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
> >                           mp_affinity, ARM64_AFFINITY_INVALID),
> >       DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
> > +    DEFINE_PROP_INT32("socket-id", ARMCPU, socket_id, 0),
> > +    DEFINE_PROP_INT32("cluster-id", ARMCPU, cluster_id, 0),
> > +    DEFINE_PROP_INT32("core-id", ARMCPU, core_id, 0),
> > +    DEFINE_PROP_INT32("thread-id", ARMCPU, thread_id, 0),
> >       DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
> >       /* True to default to the backward-compat old CNTFRQ rather than 1Ghz */
> >       DEFINE_PROP_BOOL("backcompat-cntfrq", ARMCPU, backcompat_cntfrq, false),
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index c17264c239..208c719db3 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1076,6 +1076,10 @@ struct ArchCPU {
> >       QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
> >   
> >       int32_t node_id; /* NUMA node this CPU belongs to */
> > +    int32_t socket_id;
> > +    int32_t cluster_id;
> > +    int32_t core_id;
> > +    int32_t thread_id;
> >   
> >       /* Used to synchronize KVM and QEMU in-kernel device levels */
> >       uint8_t device_irq_level;  
> 
> Thanks,
> Gavin
> 
