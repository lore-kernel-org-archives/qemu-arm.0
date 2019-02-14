Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1263718wrp;
        Thu, 14 Feb 2019 09:51:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib61rxBX3tcktJPswRt1zWamgzY9yYkPPvWNuU2iR4L51MeCUwMHtM5+MveJSOGEz6kUiSQ
X-Received: by 2002:a81:9183:: with SMTP id i125mr4269518ywg.175.1550166696332;
        Thu, 14 Feb 2019 09:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550166696; cv=none;
        d=google.com; s=arc-20160816;
        b=yntrIjA5jFtD6zRKeZ6f6vUU1Vmz3UQU2E0aNe/w4hVr/30ahVPK9q5rxwKJO0fl2/
         8oAzzxFupH+JMUDhisXG0FoHpDc0nxWJYPelwvAqSZaHi2vN9Ey1VRkJV3OKuocE0ikm
         bM482c6ahiPQqqwPnMAVXPCN1AapdDfvKZ0oF5++dWcE6DmgT4x+Ac890Z70SKGT65yS
         PR/CM2U1AdEc2eKhE2g2Ciyk92VFtiSDYF7W3Ioj1835CWh/uyKrdeZ0twS8NaG6TtP0
         gQ8LHJb9X71TEgCd8iFlZrAN2cy59cKq8+uG7QW5js9PXxEfq7Rmc/Nqeo7mJn0QE3GX
         kYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UxpbvJr6racs21cBw7xb3oerq5W8+03mrpixJTrPEmM=;
        b=LxLVO3/aQfO9x+mg8rjjiktVYlJBSKx62gNCQpXHa3r47ZrdHU+8y4+DmU2G3uA4yS
         2Nyq8cwaehu4Mq2rJRFAVLqVmJJyjlZRSD2FcenLbvJaCo2ECnT/bEjtG/8JN7tmNEbE
         JLZPrQ7ABZy8XLGK5Fx9feTTZLAbNJ4jMU+hxvk8hqU85U2BGVncHNiwLSbgnKD3wRvb
         aWTWzUsYnhcq7y10iprPVDnuudRu5+LDvr2uLEz+gphbLOEUsOgTFhK/jKaOyVF854Be
         mzwgTJUEHzPxfPNHzLYbrX5f5uawf6AkYdPfs2XZXeHyxV7N2dVPrOBh+si6NhIxYZk/
         bibg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JYUx3I9g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v190si1929875ywf.283.2019.02.14.09.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 09:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JYUx3I9g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guLAd-0006B9-M1
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 12:51:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guL4m-0002Xb-2z
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:45:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKpl-00060h-HM
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:30:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKpk-0005zW-Vz
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 12:30:01 -0500
Received: by mail-ot1-x341.google.com with SMTP id 32so11780726ota.12
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 09:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UxpbvJr6racs21cBw7xb3oerq5W8+03mrpixJTrPEmM=;
	b=JYUx3I9gzf3xIwnmYuj3Xzgcazjp2dYg0Yc5Q0+2qxKW0ZYzHHSymJF8Yizvasq54W
	93Fz39L2OHoikMMKFqhdpHRq6pBXXceURwuzTPFr/1RbX2JvTcnK/jyMphdIiJgZS/4K
	UO53ZlXg++rZyCxvLdG5U8gfSwdDmYTcUoFtpjPXDSyuJTRpCucLdSrxmidyhJL3InjP
	9fuDFzXUaqrXfLvI0c4y+XnmGnB4UkOT7OZw6pGZmMjE0fCAxkyvTdGQiiQ+MhR0bcOY
	BW5CJGgRnnqXOJJuj92hAMIeSFm5ePQznpIqQFwXfTbPuv4QHEQFkzAxE99xQO9vJogC
	NoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UxpbvJr6racs21cBw7xb3oerq5W8+03mrpixJTrPEmM=;
	b=T7I72fGd6x3RkjToMfR9w7Qd6gvzQAzY88BWM6S3uUX1lJtA+bKG1ZKyL233yG+E/Z
	AnezyVjcajMNMfrbSvij0lPMV+gGD81GLRqE7E3iVmuSGXCqYznu++0kAdNpvIt8xlaY
	XB2xtiF6LykacJOYr7hLTNRRQgXLiFncoDhkry2++XmMM6Y9sTOhh7rHK/LxSgBMEXCg
	DAlw4sjTsfpiCVBpYqH0EyQ+C9xmKJfnfJ+9HCcmsHpkz171qJJ1z04R2qnrB0fLuNkf
	AA8PJcjQmpw+3qatKfyRQ2FA/+xfNRMNSnL/PRLnbnZxoaWSGn42/PjcR/rRQWi/hb6D
	PvoA==
X-Gm-Message-State: AHQUAuajFk0hxrgAqU++FN9Vw3DssCUjTtpIxnY+QgV2aF1LajW0UtnB
	pOclHdpefgjsGCmDn2gZ94bVuZGexBlRXwxiImPi1Q==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr3043077otc.238.1550165399982; 
	Thu, 14 Feb 2019 09:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-10-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-10-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 17:29:48 +0000
Message-ID: <CAFEAcA-d1nMJkFpWmbVD7i=FF8C8irzNkLpOukkGx4=i=g_MTQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v6 09/18] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vy3t77pbnVqu

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
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

I don't understand this expression...

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

Presumably we should have some equivalent check for TCG, so
that we don't let the user create a setup which wants more
bits of physical address than the TCG CPU allows ?

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

When is there a difference between setting this to NULL,
and setting it to virt_kvm_type but having the memory
size be <= 256GiB ?

If there isn't any difference, why can't we just let the
pre-4.0 versions behave like the new ones? No existing
VM setup will have > 256GB of memory, so as long as there's
no behaviour change for the <=256GB case we don't need to
take special effort to ensure that the >256GB case continues
to give an error message, do we ?

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
> --
> 2.20.1

thanks
-- PMM
