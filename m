Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6911677wrx;
        Fri, 22 Feb 2019 04:46:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZZGGjUkD9RG7+8G2BudXci5f48eECvmg0x131Npt37mrmMKlt2uB+Io6Rkp6WyXh/blVXt
X-Received: by 2002:a25:505:: with SMTP id 5mr1996683ybf.267.1550839564897;
        Fri, 22 Feb 2019 04:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550839564; cv=none;
        d=google.com; s=arc-20160816;
        b=hSjcvz1556qF4jYGYGZTV7FugEZ1rj/x7yrOGtDF/4JyUtSPwIqF3Ld0UZ4MG9zgdD
         IzDs/Xn3sv/Hkv+jsslRyubojO+wAB4TZDKQSKKMjmTk9vbh5BF0md8b0liPJOpf54kB
         IcEpOypinWzG2N/yHYsbZpMam2Caf9tR183NXAyrF3TjLP1U0jPLF3ovfxpZyb7ilxVh
         PPzKCUMRZKjOfZm4Eu0B73HSxj/oP2cIWYoyYdrt1WriC5RFVqu2a6W31z2HZ5clMAF3
         BB0wieUDS9a5ErHHec4j+boeWWGQVSAdL9V4eBrjNIExCy7nqD0h5FyZqMv21x2NeMeu
         VXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=EgltqyUyb5PjgOe+5Jh1i9IFeOirDcOBnS7aIPzgEIE=;
        b=JT4xzqBgBKw3ngmBEYSymmUPmBZ6YH6n2t6zAwio1C0SgvN92b9jkqpaDcCukOLbO9
         hAX4gKbAVePpgsKAepqclWkwlhuIuQnIhlqwJ7dPQuRIilDztn7RFRWe+axlGkKO3ByQ
         cvVItxrrhzLYpfZ7ySMRj3OqorGkrk6slYql5d7ZCsEprSRuTOcg7a9zMgIfhMkXwWEG
         6lKcyG3IRjB6Zw/jmacLGCIGffmonQctgZSlsHQAgLgaC7694lDOtJRrBA4N9lyrzB5j
         HI2wMh3XNjArBM8hYUay3z0KJGG++EhlX0DAKfGIO6KdpXAG4Be1OnIy6C4vG9bu51Au
         uHfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n81si790892ywb.129.2019.02.22.04.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 04:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxADM-0002lY-EH
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 07:46:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxADE-0002lI-Tn
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 07:45:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxACz-0004Nk-RP
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 07:45:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxACw-0003yd-7g; Fri, 22 Feb 2019 07:45:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36522307DA31;
	Fri, 22 Feb 2019 12:45:24 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEBB21001E96;
	Fri, 22 Feb 2019 12:45:17 +0000 (UTC)
Date: Fri, 22 Feb 2019 13:45:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222134516.575288c2@redhat.com>
In-Reply-To: <20190220224003.4420-9-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-9-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 22 Feb 2019 12:45:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 08/17] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 57WjYRVXHqGm

On Wed, 20 Feb 2019 23:39:54 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This patch implements the machine class kvm_type() callback.
> It returns the number of bits requested to implement the whole GPA
> range including the RAM and IO regions located beyond.
> The returned value in passed though the KVM_CREATE_VM ioctl and
> this allows KVM to set the stage2 tables dynamically.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v6 -> v7:
> - Introduce RAMBASE and rename add LEGACY_ prefix in that patch
> - use local variables with explicit names in virt_set_memmap:
>   device_memory_base, device_memory_size
> - add an extended_memmap field in the class
> 
> v5 -> v6:
> - add some comments
> - high IO region cannot start before 256GiB
> ---
>  hw/arm/virt.c         | 50 ++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h |  2 ++
>  2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9db602457b..ad3a0ad73d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1437,7 +1437,14 @@ static void machvirt_init(MachineState *machine)
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      bool aarch64 = true;
>  
> -    virt_set_memmap(vms);
> +    /*
> +     * In accelerated mode, the memory map is computed in kvm_type(),
> +     * if set, to create a VM with the right number of IPA bits.
> +     */
> +
> +    if (!mc->kvm_type || !kvm_enabled()) {
> +        virt_set_memmap(vms);
> +    }
>  
>      /* We can probe only here because during property set
>       * KVM is not available yet
> @@ -1814,6 +1821,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>      return NULL;
>  }
>  
> +/*
> + * for arm64 kvm_type [7-0] encodes the requested number of bits
> + * in the IPA address space
> + */
> +static int virt_kvm_type(MachineState *ms, const char *type_str)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(ms);
> +    int max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms);
> +    int requested_pa_size;
> +
> +    /* we freeze the memory map to compute the highest gpa */
> +    virt_set_memmap(vms);
> +
> +    requested_pa_size = 64 - clz64(vms->highest_gpa);
> +
> +    if (requested_pa_size > max_vm_pa_size) {
> +        error_report("-m and ,maxmem option values "
> +                     "require an IPA range (%d bits) larger than "
> +                     "the one supported by the host (%d bits)",
> +                     requested_pa_size, max_vm_pa_size);
> +       exit(1);
> +    }
> +    /*
> +     * By default we return 0 which corresponds to an implicit legacy
> +     * 40b IPA setting. Otherwise we return the actual requested PA
> +     * logsize
> +     */
> +    return requested_pa_size > 40 ? requested_pa_size : 0;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1838,6 +1875,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>      hc->plug = virt_machine_device_plug_cb;
> @@ -1909,6 +1947,12 @@ static void virt_instance_init(Object *obj)
>                                      "Valid values are none and smmuv3",
>                                      NULL);
>  
> +    if (vmc->no_extended_memmap) {
> +        vms->extended_memmap = false;
> +    } else {
> +        vms->extended_memmap = true;
> +    }
> +
>      vms->irqmap = a15irqmap;
>  }
>  
> @@ -1939,8 +1983,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 0)
>  
>  static void virt_machine_3_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>      virt_machine_4_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
> +
> +    /* extended memory map is enabled from 4.0 onwards */
> +    vmc->no_extended_memmap = true;
That's probably was asked in v6,
do we really need this knob?

>  }
>  DEFINE_VIRT_MACHINE(3, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index acad0400d8..7798462cb0 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -106,6 +106,7 @@ typedef struct {
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
>      bool no_highmem_ecam;
> +    bool no_extended_memmap;
>  } VirtMachineClass;
>  
>  typedef struct {
> @@ -135,6 +136,7 @@ typedef struct {
>      hwaddr highest_gpa;
>      hwaddr device_memory_base;
>      hwaddr device_memory_size;
> +    bool extended_memmap;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

