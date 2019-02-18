Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2111531wrx;
        Mon, 18 Feb 2019 02:07:39 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaxafuawLZuk5VB959yC+ECHU0xTnoECzrtgbHAj0TGGGm2O2aGw+RtOZqXqh/XmZDmPzHH
X-Received: by 2002:a81:110d:: with SMTP id 13mr18418344ywr.343.1550484459678;
        Mon, 18 Feb 2019 02:07:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550484459; cv=none;
        d=google.com; s=arc-20160816;
        b=A+LabWOLKPRw9QBSQYd/hMkQUI3RUom/1rCn3Dcg5ljrQn+kJJhdeCkSaQlYZ0PWwG
         me5C64hYQbGtG1IeITAHUjuJE1mGhTVGWh1T7OQRaVcLUUU4AJqdO2+pwZsvgMCaXN9d
         IuxH2uXnWUgyoeO4MaofEoien3P4PfFLnBhOh91dRM29FVmUQHKBrGZolp9xOUhc4Cw6
         6teDwyB+KJeRW50GnPgj0zBG5Xh9aBlPae4xsZXOjEHXwXbQIo9IYl+u/KNI16q1Glec
         huWXCbinZbw1tcWA8s2gTGbv5F47kfVq8+t4WNY06ITszljcLlzBsJDLGfV+qn2C8Za/
         JYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=75r1qcoGMdc7z0YV4+u8MoSCVw32ItZonH7EJqFDDW4=;
        b=H5k/cwMTik9bitPYtuKC7KAaCYKvH3yEopSRR7MkGUkESPlmU0iLclcUt1d8MWjqIX
         iGRaDTezcbdR8s4usITSoll/A2DMdK4gMAnd8DmKnT+LHmHDwqqiZ+remn/nz1LOLjGa
         4hfaGZzFn+bkb3lf3VxnxWyq5vue/zApWBHqna4cScJJD6RD9MQaW7aH0DzPSbPjK5yX
         9jOtfBqTOLAcV6r1b9cFA8b+jo4LCLbFkuz1i4TsSDschZ9kGCqz8HI5kXdT2hoT47UU
         B+QTBBv8e4kUh4mwOQThtIhWlFtU7YaFwxJDFKVLu6LVHxgSuu59IWI1DfsPD443QQ3H
         mKAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si7218804ywx.434.2019.02.18.02.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 02:07:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvfpr-0007k0-2l
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 05:07:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvfpg-0007jt-6g
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 05:07:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvfpa-0002Qn-Oq
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 05:07:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gvfpY-0002Q7-3u; Mon, 18 Feb 2019 05:07:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7253258E3E;
	Mon, 18 Feb 2019 10:07:18 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-41.ams2.redhat.com
	[10.36.112.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B6DE67612;
	Mon, 18 Feb 2019 10:07:04 +0000 (UTC)
Date: Mon, 18 Feb 2019 11:07:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190218110701.7349c698@Igors-MacBook-Pro.local>
In-Reply-To: <20190205173306.20483-10-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-10-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 18 Feb 2019 10:07:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 09/18] hw/arm/virt: Implement
 kvm_type function for 4.0 machine
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
X-TUID: 8mY5g7X6uNxO

On Tue,  5 Feb 2019 18:32:57 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This patch implements the machine class kvm_type() callback.
> It returns the max IPA shift needed to implement the whole GPA
> range including the RAM and IO regions located beyond.
> The returned value in passed though the KVM_CREATE_VM ioctl and
> this allows KVM to set the stage2 tables dynamically.
> 
> At this stage the RAM limit still is limited to 255GB.
> 
> Setting all the existing highmem IO regions beyond the RAM
> allows to have a single contiguous RAM region (initial RAM and
> possible hotpluggable device memory). That way we do not need
> to do invasive changes in the EDK2 FW to support a dynamic
> RAM base.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v5 -> v6:
> - add some comments
> - high IO region cannot start before 256GiB
> ---
>  hw/arm/virt.c         | 52 +++++++++++++++++++++++++++++++++++++++++--
>  include/hw/arm/virt.h |  2 ++
>  2 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2b15839d0b..b90ffc2e5d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1366,6 +1366,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  
>  static void virt_set_memmap(VirtMachineState *vms)
>  {
> +    MachineState *ms = MACHINE(vms);
>      hwaddr base;
>      int i;
>  
> @@ -1375,7 +1376,17 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i] = a15memmap[i];
>      }
>  
> -    vms->high_io_base = 256 * GiB; /* Top of the legacy initial RAM region */
> +    /*
> +     * We now compute the base of the high IO region depending on the
> +     * amount of initial and device memory. The device memory start/size
> +     * is aligned on 1GiB. We never put the high IO region below 256GiB
> +     * so that if maxram_size is < 255GiB we keep the legacy memory map
> +     */
> +    vms->high_io_base = ROUND_UP(GiB + ms->ram_size, GiB) +
> +                        ROUND_UP(ms->maxram_size - ms->ram_size, GiB);
> +    if (vms->high_io_base < 256 * GiB) {
> +        vms->high_io_base = 256 * GiB;
> +    }
>      base = vms->high_io_base;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> @@ -1386,6 +1397,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> +    vms->highest_gpa = base - 1;
>  }
>  
>  static void machvirt_init(MachineState *machine)
> @@ -1402,7 +1414,9 @@ static void machvirt_init(MachineState *machine)
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      bool aarch64 = true;
>  
> -    virt_set_memmap(vms);
> +    if (!vms->extended_memmap) {
> +        virt_set_memmap(vms);
> +    }
>  
>      /* We can probe only here because during property set
>       * KVM is not available yet
> @@ -1784,6 +1798,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>      return NULL;
>  }
>  
> +/*
> + * for arm64 kvm_type [7-0] encodes the IPA size shift
> + */
> +static int virt_kvm_type(MachineState *ms, const char *type_str)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(ms);
> +    int max_vm_phys_shift = kvm_arm_get_max_vm_phys_shift(ms);
> +    int max_pa_shift;
> +
> +    vms->extended_memmap = true;
> +
> +    virt_set_memmap(vms);
> +
> +    max_pa_shift = 64 - clz64(vms->highest_gpa);
> +
> +    if (max_pa_shift > max_vm_phys_shift) {
> +        error_report("-m and ,maxmem option values "
> +                     "require an IPA range (%d bits) larger than "
> +                     "the one supported by the host (%d bits)",
> +                     max_pa_shift, max_vm_phys_shift);
> +       exit(1);
> +    }
> +    /*
> +     * By default we return 0 which corresponds to an implicit legacy
> +     * 40b IPA setting. Otherwise we return the actual requested IPA
> +     * logsize
> +     */
> +    return max_pa_shift > 40 ? max_pa_shift : 0;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1808,6 +1852,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>      hc->plug = virt_machine_device_plug_cb;
> @@ -1911,6 +1956,9 @@ static void virt_machine_3_1_options(MachineClass *mc)
>  {
>      virt_machine_4_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
> +
> +    /* extended memory map is enabled from 4.0 onwards */
> +    mc->kvm_type = NULL;
it's quite confusing, you have vms->extended_memmap and mc->kvm_type and
the later for some reason enables device memory.

to me it seems that both are not related, device memory should work just fine
without kvm nor dynamic IPA (within TCG supported limits).

I'd make extended_memmap virt machine class member the will enable pc-dimm support
and then it add checks for supported IPA range on top

>  }
>  DEFINE_VIRT_MACHINE(3, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 3dc7a6c5d5..c88f67a492 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -132,6 +132,8 @@ typedef struct {
>      uint32_t iommu_phandle;
>      int psci_conduit;
>      hwaddr high_io_base;
> +    hwaddr highest_gpa;
> +    bool extended_memmap;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

