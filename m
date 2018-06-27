Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6128790wrq;
        Wed, 27 Jun 2018 05:02:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcTwGkSX+giTwgwphnnLZ0InGKMW97sc3R+j96aHQqU63tqcoKCxWy5Cfmj8J19sNCFHifQ
X-Received: by 2002:a37:8547:: with SMTP id h68-v6mr4824121qkd.340.1530100951472;
        Wed, 27 Jun 2018 05:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530100951; cv=none;
        d=google.com; s=arc-20160816;
        b=Mblj98QTeILh/Gz6S7jC51r5ujusemLqSjwDRzls09UVOQmgbJLvZcVzrVKv+VPE2X
         BkevKY0k5aBZZiOyXA0zEPXWwJdjVLr4sJzpf/T9uEc9aml62nYWyWxmT2LHEz/5u2Wn
         BxsnxV65yZ0VDoW5XSOiURfc3aq3E9tJV+TQYke9h1hmB0uSlIu90JK8rYxg3X6Vqs9u
         eTZZ9JaQtBvKIC+FP7Go7gtPmXsgfZ2MYphEoKi8MVqiqmqbMFa9xoFDXCslfADjPUpS
         hzb3bpTXsIuFqZyh2hlWzliKZsFQxzx5sXloLrOsPanwHi0cjXh/bLlWSQQsxDZqK99R
         HFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=7AKpSDTaVNj8eoZBnR1rAOzFhy9IgFQC6REgSSZy4CM=;
        b=yPXHJAgZFsW4ICqC2nwjia3wdaGZppAm1DXCD+lO9Nz7GMGbDQawe1yxpmRg2dwewL
         41jGCECu7IG2M2gRMBtYTmoIPdDHIH/Rz9i24JepHBizVR6r+GeLRkRn2IQ6j4MWUhDx
         6GvsGJXjj375kB4RtmUOLLGECRvC2lU62prKfmqDimmhXyEGKIfJPEnSrKEspFf8MEND
         imRWxqHhnIVOzCXYM30ZpHtUG7JMwjD6jv+RpKE2EAAeDOey2fsOfVhrssr5Yfh8FPWY
         MdUTda9FCGkMZfcbtBFiF9bieyHOqG9SyiB0k7kB2jY41uhKunZ+JJt8fMVbiFJac39T
         Hz2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j65-v6si3754996qkc.74.2018.06.27.05.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 05:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY99Y-0001YF-Or
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 08:02:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fY99F-0001TN-9P
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 08:02:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fY995-00008Q-6i
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 08:02:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49894 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fY995-00007d-0R; Wed, 27 Jun 2018 08:01:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A44D405A004;
	Wed, 27 Jun 2018 12:01:58 +0000 (UTC)
Received: from work-vm (ovpn-117-222.ams2.redhat.com [10.36.117.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F5FD2156888;
	Wed, 27 Jun 2018 12:01:56 +0000 (UTC)
Date: Wed, 27 Jun 2018 13:01:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180627120153.GF2423@work-vm>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
	<20180620171504.GR2549@work-vm>
	<f0fbc258-c27f-a1c2-722b-34f75644fb36@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0fbc258-c27f-a1c2-722b-34f75644fb36@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 27 Jun 2018 12:01:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 27 Jun 2018 12:01:58 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 5/6] hw/arm/virt: support kvm_type
 property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, suzuki.poulose@arm.com,
	qemu-devel@nongnu.org, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4w5VOs/0mVns

* Auger Eric (eric.auger@redhat.com) wrote:
> Hi David,
> 
> On 06/20/2018 07:15 PM, Dr. David Alan Gilbert wrote:
> > * Eric Auger (eric.auger@redhat.com) wrote:
> >> The kvm-type property currently is used to pass
> >> a user parameter to KVM_CREATE_VM. This matches
> >> the way KVM/ARM expects to pass the max_vm_phys_shift
> >> parameter.
> >>
> >> This patch adds the support or the kvm-type property in
> >> machvirt and also implements the machine class kvm_type()
> >> callback so that it either returns the kvm-type value
> >> provided by the user or returns the max_vm_phys_shift
> >> exposed by KVM.
> >>
> >> for instance, the usespace can use the following option to
> >> instantiate a 42b IPA guest: -machine kvm-type=42
> > 
> > Without saying if this is better or worse, it is different from x86,
> > where we have the number of physical address bits as a -cpu parameter
> > rather than a machine parameter, e.g.
> > 
> >    qemu-system-x86_64 -M pc,accel=kvm -cpu SandyBridge,phys-bits=36
> > or
> >    qemu-system-x86_64 -M pc,accel=kvm -cpu SandyBridge,host-phys-bits=true
> > 
> > our machine types can override the default value though.
> 
> My understanding is this phys-bits is used to refine the model of the
> CPU. For a given CPU, it is implementation defined how much physical and
> virtual bits are supported. So it can vary. The guest then can query the
> properties of the CPU using CPUID and when setting eax=0x80000008, it
> then retrieves the max physical and virtual address space supported by
> this CPU.
> 
> On ARM there is such capability register, named
> ID_AA64MMFR0_EL1 where PARange field indicates the implemented physical
> address size. No equivalent for the virtual range.
> 
> arm/internals.h implements arm_pamax(ARMCPU *cpu)
> It decodes cpu->id_aa64mmfr0. This later is hardcoded for A57, A53, ...
> So as far as I understand, we don't have a way to refine this reg
> through cmd line, as we have on x86. But if we were to support this
> feature, then phys_bits would be cpu->id_aa64mmfr0.parange.
> 
> However what we are trying to achieve in this series is different. We
> don't want to refine the vCPU itself. We want to query and force KVM to
> support a given intermediate physical address (IPA) range. This means
> configure KVM to support a given stage 2 MMU configuration. As a
> correlate this means supporting the corresponding GPA range. KVM's
> capability to support a given IPA range depends on
> - physical CPU ID_AA64MMFR0_EL1.PARange
> - host kernel config
> - host kernel page table limitations
> 
> So the kernel API proposed in [1] allows to query the max IPA KVM
> support (through a /dev/kvm iotcl) and this series then does a
> KVM_CREATE_VM with a type argument that matches the returned value. So
> to me this rather looks as a VM attribute, which from a qemu perspective
> would turn out to be a machine option. Then whether we should directly
> use the kvm_type option is arguable. on spapr kvm_type typically encodes
> the HV or PR. I understand this selects different kvm modules. Here we
> want to use a kvm supporting up to 48b IPA for instance.

OK, my only worry is that management layers are going to see this
differently for different architectures, where it feels like it's
basically the same thing.

Note on x86, while I don't think there's a host kernel restriction on
phys-bits/GPA, there is the restriction of the host CPU, so if setting
it to anything other than host-phys-bits there does need to be some
probing somewhere.

> > 
> > One other complication (that I don't know if it applies to ARM) is that
> > TCG only supports phys-bits=40, so we refuse a TCG run with an
> > explicitly set phys-bits!=40.
> 
> The new capability to support selectable GPA range only applies to
> accelerated mode. I did not check if kvm-type option can be used in TCG
> mode ;-)

Yes, I think all I did was add an error check to warn/fail if you try
and set it wrongly.

Dave

> Thanks
> 
> Eric
> > 
> > Dave
> > 
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  hw/arm/virt.c         | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >>  include/hw/arm/virt.h |  1 +
> >>  2 files changed, 45 insertions(+)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index dd92ab9..1700556 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -1585,6 +1585,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
> >>      }
> >>  }
> >>  
> >> +static char *virt_get_kvm_type(Object *obj, Error **errp)
> >> +{
> >> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >> +
> >> +    return g_strdup(vms->kvm_type);
> >> +}
> >> +
> >> +static void virt_set_kvm_type(Object *obj, const char *value, Error **errp)
> >> +{
> >> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >> +
> >> +    g_free(vms->kvm_type);
> >> +    vms->kvm_type = g_strdup(value);
> >> +}
> >> +
> >>  static CpuInstanceProperties
> >>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> >>  {
> >> @@ -1646,6 +1661,31 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
> >>      return NULL;
> >>  }
> >>  
> >> +static int virt_kvm_type(MachineState *ms, const char *type_str)
> >> +{
> >> +    int max_vm_phys_shift, ret = 0;
> >> +    uint64_t type;
> >> +
> >> +    if (!type_str) {
> >> +        max_vm_phys_shift = kvm_get_max_vm_phys_shift(ms);
> >> +        if (max_vm_phys_shift < 0) {
> >> +            goto out;
> >> +        }
> >> +    } else {
> >> +        type = g_ascii_strtoll(type_str, NULL, 0);
> >> +        type &= 0xFF;
> >> +        max_vm_phys_shift = (int)type;
> >> +        if (max_vm_phys_shift < 40 || max_vm_phys_shift > 52) {
> >> +            warn_report("valid kvm-type type values are within [40, 52]:"
> >> +                        " option is ignored and VM is created with 40b IPA");
> >> +            goto out;
> >> +        }
> >> +    }
> >> +    ret = max_vm_phys_shift;
> >> +out:
> >> +    return ret;
> >> +}
> >> +
> >>  static void virt_machine_class_init(ObjectClass *oc, void *data)
> >>  {
> >>      MachineClass *mc = MACHINE_CLASS(oc);
> >> @@ -1668,6 +1708,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
> >>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> >>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> >>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> >> +    mc->kvm_type = virt_kvm_type;
> >>      assert(!mc->get_hotplug_handler);
> >>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> >>      hc->plug = virt_machine_device_plug_cb;
> >> @@ -1756,6 +1797,9 @@ static void virt_3_0_instance_init(Object *obj)
> >>                                      "Valid values are none and smmuv3",
> >>                                      NULL);
> >>  
> >> +    object_property_add_str(obj, "kvm-type",
> >> +                            virt_get_kvm_type, virt_set_kvm_type, NULL);
> >> +
> >>      vms->memmap = a15memmap;
> >>      vms->irqmap = a15irqmap;
> >>  }
> >> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >> index 4ac7ef6..2674ce7 100644
> >> --- a/include/hw/arm/virt.h
> >> +++ b/include/hw/arm/virt.h
> >> @@ -118,6 +118,7 @@ typedef struct {
> >>      uint32_t msi_phandle;
> >>      uint32_t iommu_phandle;
> >>      int psci_conduit;
> >> +    char *kvm_type;
> >>  } VirtMachineState;
> >>  
> >>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> >> -- 
> >> 2.5.5
> >>
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
