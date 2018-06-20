Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1012490wrq;
        Wed, 20 Jun 2018 10:15:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ0s8tHu/BcEYHyr6Ua6NAXN/S9Wv0IUO01mJe5m4v4eygEa/nJbp3W7KeJolsj033Orenr
X-Received: by 2002:a0c:93ec:: with SMTP id g41-v6mr19516079qvg.243.1529514921280;
        Wed, 20 Jun 2018 10:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529514921; cv=none;
        d=google.com; s=arc-20160816;
        b=VohzP0JpnvqYfn+BSfs6F4v0nlXrUk7YFjB5oYBGSVPlgPuxVCOJB6GfxG2xwayRJX
         7dKohU7XlUvu7/vhovyU8CdcgfCg5CtFCU0wEWHAJOM+I/WTv5uUKW+hSE0xrCOA/45f
         FUgI4ynjYs5ykiSfpDKgKAUtNR2Cw1Ow1Q7748zjDVDLJpk6pvwFpNOlxZJUVtKrD/T2
         8LPv86+LfXOBOUKv6Mr7C0zggSWTo0Z+70XAi4tdWSBYWOi8X0zo7mxg6xI2vZ+UuQ8r
         mPETBGzfKT5v2zGNzywhm4QfGz3gbyNOP2uIk+GUynG2ksX0dN6BgLHCWFbRBsvvxaIR
         mD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=radw+dy7TjMWWAmZLwsplyrHir0hYXY3Ine4lVYs73k=;
        b=YCreNyJVJHdvR8Hlu3hmVWUChCqjC5VXLGlPHSOYTXKUgs25tGQfROMSXH5vcMjR2b
         VOdw41RXcbx75uyLLw64OXV98LGt1JdqMaTCpWdc9Bqeb+M7FEdCooqr+wj08AebeGGf
         dIczhI/ONyjXplXfjdUX3gJswUWU6QD1QBBUb5Jf+MeOH2sKZqgVap0BFI2k9huEM0B6
         lNm1UDD/G/67FAy5Wrny7QthKQ9boVaZVCbrmA4tG/lwgmHKPdEZwxDlsuO6isDn5JoI
         BDkGc7xtk3g+nI+dFYE1rGQqUSa1Jnc8iDhZV5Dp7B87qntzXLbfCdmK0loeryhsv5VN
         M5VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si2640054qtk.400.2018.06.20.10.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 10:15:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVghU-0005Ol-RH
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 13:15:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fVghO-0005O3-2j
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 13:15:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1fVghK-0003pb-RU
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 13:15:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59674 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1fVghK-0003p4-LY; Wed, 20 Jun 2018 13:15:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E20E34021CC1;
	Wed, 20 Jun 2018 17:15:09 +0000 (UTC)
Received: from work-vm (ovpn-117-189.ams2.redhat.com [10.36.117.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 664282026D6B;
	Wed, 20 Jun 2018 17:15:07 +0000 (UTC)
Date: Wed, 20 Jun 2018 18:15:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180620171504.GR2549@work-vm>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529500053-21704-6-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 20 Jun 2018 17:15:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 20 Jun 2018 17:15:09 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC 5/6] hw/arm/virt: support kvm_type property
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
	agraf@suse.de, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7nFnQzHeIvR3

* Eric Auger (eric.auger@redhat.com) wrote:
> The kvm-type property currently is used to pass
> a user parameter to KVM_CREATE_VM. This matches
> the way KVM/ARM expects to pass the max_vm_phys_shift
> parameter.
> 
> This patch adds the support or the kvm-type property in
> machvirt and also implements the machine class kvm_type()
> callback so that it either returns the kvm-type value
> provided by the user or returns the max_vm_phys_shift
> exposed by KVM.
> 
> for instance, the usespace can use the following option to
> instantiate a 42b IPA guest: -machine kvm-type=42

Without saying if this is better or worse, it is different from x86,
where we have the number of physical address bits as a -cpu parameter
rather than a machine parameter, e.g.

   qemu-system-x86_64 -M pc,accel=kvm -cpu SandyBridge,phys-bits=36
or
   qemu-system-x86_64 -M pc,accel=kvm -cpu SandyBridge,host-phys-bits=true

our machine types can override the default value though.

One other complication (that I don't know if it applies to ARM) is that
TCG only supports phys-bits=40, so we refuse a TCG run with an
explicitly set phys-bits!=40.

Dave

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c         | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 45 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index dd92ab9..1700556 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1585,6 +1585,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>      }
>  }
>  
> +static char *virt_get_kvm_type(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return g_strdup(vms->kvm_type);
> +}
> +
> +static void virt_set_kvm_type(Object *obj, const char *value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    g_free(vms->kvm_type);
> +    vms->kvm_type = g_strdup(value);
> +}
> +
>  static CpuInstanceProperties
>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  {
> @@ -1646,6 +1661,31 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>      return NULL;
>  }
>  
> +static int virt_kvm_type(MachineState *ms, const char *type_str)
> +{
> +    int max_vm_phys_shift, ret = 0;
> +    uint64_t type;
> +
> +    if (!type_str) {
> +        max_vm_phys_shift = kvm_get_max_vm_phys_shift(ms);
> +        if (max_vm_phys_shift < 0) {
> +            goto out;
> +        }
> +    } else {
> +        type = g_ascii_strtoll(type_str, NULL, 0);
> +        type &= 0xFF;
> +        max_vm_phys_shift = (int)type;
> +        if (max_vm_phys_shift < 40 || max_vm_phys_shift > 52) {
> +            warn_report("valid kvm-type type values are within [40, 52]:"
> +                        " option is ignored and VM is created with 40b IPA");
> +            goto out;
> +        }
> +    }
> +    ret = max_vm_phys_shift;
> +out:
> +    return ret;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1668,6 +1708,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>      hc->plug = virt_machine_device_plug_cb;
> @@ -1756,6 +1797,9 @@ static void virt_3_0_instance_init(Object *obj)
>                                      "Valid values are none and smmuv3",
>                                      NULL);
>  
> +    object_property_add_str(obj, "kvm-type",
> +                            virt_get_kvm_type, virt_set_kvm_type, NULL);
> +
>      vms->memmap = a15memmap;
>      vms->irqmap = a15irqmap;
>  }
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4ac7ef6..2674ce7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -118,6 +118,7 @@ typedef struct {
>      uint32_t msi_phandle;
>      uint32_t iommu_phandle;
>      int psci_conduit;
> +    char *kvm_type;
>  } VirtMachineState;
>  
>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> -- 
> 2.5.5
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
