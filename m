Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12FDCD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 13:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPhL9-000528-3A; Wed, 20 May 2026 09:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wPhL8-00051m-DA
 for qemu-arm@nongnu.org; Wed, 20 May 2026 09:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wPhL6-0004iN-IK
 for qemu-arm@nongnu.org; Wed, 20 May 2026 09:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779285119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bmWERXMLXC3OvENsaGbZ8IdksW5Rs5cYZtgXlt7EfY=;
 b=CvbxF3t5tpc28CymxB6n17yy738/fIJlLIsGQ1d8V24wA9NKVI3uAqerQ/QjkTVOlNLsOU
 J5JE/RtKPP9mo+kmy1jd75JNJgA6ibjBIqYXudVtrs/rvo45nqPX4FYxiRVOolGJ7ufLh0
 Oj3gXpF4wLqOT3m4jDxoxULpEXEl/WM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-apQAfNM4NSSL3I8lsrkGEQ-1; Wed, 20 May 2026 09:51:56 -0400
X-MC-Unique: apQAfNM4NSSL3I8lsrkGEQ-1
X-Mimecast-MFC-AGG-ID: apQAfNM4NSSL3I8lsrkGEQ_1779285115
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-45e736cac42so4391252f8f.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 06:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779285115; x=1779889915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2bmWERXMLXC3OvENsaGbZ8IdksW5Rs5cYZtgXlt7EfY=;
 b=EndLOfIi8OlxmTxAcp2AWJrzeWebgvtaBj1olqS5tf7r9OnjLjvfLyhlR5Vo9RAkqj
 +AyoaK/28p10NsBrKVY7cokRhPZx2tSSN+/ODllEGeJiKsjGnpvnhL4DSjc9oX1WwDdP
 kODg83fEnh/SZ50MkR3335AGhO80qJj1YhB30eZcDaHljiFDx6yh/8Pgs1wEcQTtIpec
 GvLOhMhZHzNdDLYWMlA6VMq2wWFWYpYjNzlaec0Wn+eveutCEj+1T2efEmPy/TnHg1em
 Oyxr4vAKJve0izlyuWThXSlbfL+HWrz9IlzNH94j84X5DLz31hT3kxQ9tq9acmM0MfMS
 KD3g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8U5iWUzL8ubCv2BpWDYnmwnaCuYoIUN3Nq85KzoNG7nHcnsuwwnnEKvCUsPtqhur5kbVWUANFCGw==@nongnu.org
X-Gm-Message-State: AOJu0YzOWvlBOFAeWIBEie2O9AJQ9OpP4pdmZAc7xQO1eVJGaVcX748n
 ZZh6ch4dcQVqhijVFytzog1iB11BBjHgw0k2RJtNWV8ubKVFL95bA3/cdXL7UzjbuJDHLEuJBBS
 D0WVrJ9Pfz13GGko3Vnq2canmxZMF86+BSbMZd7eXcreFyhKVF7g/MA==
X-Gm-Gg: Acq92OGkXM49RYWYw1A4k+HnJI0yJSfbG9i7hCQO5F/1lTazoSqYJ11QMAIHQZtKNs1
 Fw2zjIOzC7in62iYGRTdTncOyGfd+i9t0rpdQvjMy+5vhekOHJaOJwvW9YqiQ9/JFvWk5N8vM2l
 sKxAG4G/IcoUdTuGhgxUC3zdVMN9ZMFeEpZSpAvTW4ixEVoRa0msWK0MRd34o9iDNws5JT58LLH
 s41/9R8YPG6WDBZ89mXnRyptTZo0ztvdrXVaxvcXJF2kMsr0eMkdccYcwsssZxdYrplpB1Mpqs8
 3hM/vgSPqdHAyx0JdOyxZIe1YVR/vH+lZ77EZMC3PuKH5cVRShSqjElgPGjSgwx01ayNpW9c+c5
 1figPhw==
X-Received: by 2002:a05:6000:603:b0:455:7d77:1d25 with SMTP id
 ffacd0b85a97d-45e5c5fd588mr40938420f8f.27.1779285114594; 
 Wed, 20 May 2026 06:51:54 -0700 (PDT)
X-Received: by 2002:a05:6000:603:b0:455:7d77:1d25 with SMTP id
 ffacd0b85a97d-45e5c5fd588mr40938340f8f.27.1779285114029; 
 Wed, 20 May 2026 06:51:54 -0700 (PDT)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17a22sm54749476f8f.22.2026.05.20.06.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 06:51:53 -0700 (PDT)
Date: Wed, 20 May 2026 15:51:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 3/4] hw/arm/virt: Remove the lower bound of HighMem
 IO Regions
Message-ID: <20260520155152.3652a6e9@imammedo>
In-Reply-To: <20260520-virt-v6-3-d96180454fdf@rsg.ci.i.u-tokyo.ac.jp>
References: <20260520-virt-v6-0-d96180454fdf@rsg.ci.i.u-tokyo.ac.jp>
 <20260520-virt-v6-3-d96180454fdf@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: odj2XeCNbkme6M5loKZPTUmYj1bC0_p-aCF2xCrwDog_1779285115
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 18:56:32 +0900
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:

> Remove the lower bound of the Highmem IO Regions' addresses for the
> latest machine version to increase the chance to fit the regions in the
> PA space.
> 
> The lower bound was especially problematic when using virt-install on
> Apple M2. virt-install 5.0.0 adds multiple pcie-root-port devices that

it looks like with this patch everything would move down,
with 'small' but, VIRT_HIGH_PCIE_MMIO that still won't fit into M2 PA and
will get disabled.
Is it intended (perhaps it should be mentioned in patch)


> require sufficient space in the ECAM region. However, the Highmem ECAM
> region did not fit in the limited PA space on the hardware, and the ECAM
> region size was limited to 16 MiB. If virt-install had added more than
> 16 devices to the root bridge, the region overflowed, which prevented
> edk2-stable202505 from scanning PCI devices, including the boot disk,
> causing boot failures.
> 
> Ideally, a virtual machine with more than 16 devices added to the root
> bridge should just work so that users and management layers do not have
> to care whether they use constrained hardware.
> 
> The base address of the Highmem IO Regions was fixed when commit
> f90747c4e8fb ("hw/arm/virt: GICv3 DT node with one or two redistributor
> regions") added the first Highmem IO Region. Later, commit 957e32cffa57
> ("hw/arm/virt: Dynamic memory map depending on RAM requirements")
> allowed moving the Highmem IO Regions to higher addresses to accommodate
> RAM more than 255 GiB, but the lower bound remained to keep the legacy
> memory map.
> 
> Remove the lower bound for the latest machine version to accommodate
> more devices with the root bridge. Keeping the lower bound for the old
> machine versions ensures the compatibility is still maintained.
> 
> The hardcoded memory map in tests/qtest/libqos/generic-pcihost.c is also
> updated.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/hw/arm/virt.h                |  1 +
>  hw/arm/virt.c                        | 17 +++++++++++------
>  tests/qtest/libqos/generic-pcihost.c |  2 +-
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 3ba33b4bd274..6c8ba8f3185b 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -142,6 +142,7 @@ typedef enum VirtGICType {
>  
>  struct VirtMachineClass {
>      MachineClass parent;
> +    hwaddr min_highmem_base;
>      bool no_tcg_its;
>      bool no_highmem_compact;
>      bool no_kvm_steal_time;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b090233893c5..78a85a966ad7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -229,8 +229,7 @@ static const MemMapEntry base_memmap[] = {
>   * Highmem IO Regions: This memory map is floating, located after the RAM.
>   * Each MemMapEntry base (GPA) will be dynamically computed, depending on the
>   * top of the RAM, so that its base get the same alignment as the size,
> - * ie. a 512GiB entry will be aligned on a 512GiB boundary. If there is
> - * less than 256GiB of RAM, the floating area starts at the 256GiB mark.
> + * ie. a 512GiB entry will be aligned on a 512GiB boundary.
>   * Note the extended_memmap is sized so that it eventually also includes the
>   * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>   * index of base_memmap).
> @@ -2479,6 +2478,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>  static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      hwaddr base, device_memory_base, device_memory_size, memtop;
>      int i;
>  
> @@ -2505,8 +2505,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      /*
>       * We compute the base of the high IO region depending on the
>       * amount of initial and device memory. The device memory start/size
> -     * is aligned on 1GiB. We never put the high IO region below 256GiB
> -     * so that if maxram_size is < 255GiB we keep the legacy memory map.
> +     * is aligned on 1GiB.
>       * The device region size assumes 1GiB page max alignment per slot.
>       */
>      device_memory_base =
> @@ -2524,8 +2523,8 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>          error_report("maxmem/slots too huge");
>          exit(EXIT_FAILURE);
>      }
> -    if (base < vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES) {
> -        base = vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
> +    if (base < vmc->min_highmem_base) {
> +        base = vmc->min_highmem_base;
>      }
>  
>      /* We know for sure that at least the memory fits in the PA space */
> @@ -4367,6 +4366,12 @@ static void virt_machine_11_0_options(MachineClass *mc)
>      virt_machine_11_1_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_11_0, hw_compat_11_0_len);
>      vmc->hvf_no_kernel_irqchip_default = true;
> +
> +    /*
> +     * Do not put the high IO region below 256GiB so that if maxram_size is
> +     * < 255GiB we keep the legacy memory map.
> +     */
> +    vmc->min_highmem_base = base_memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
>  }
>  DEFINE_VIRT_MACHINE(11, 0)
>  
> diff --git a/tests/qtest/libqos/generic-pcihost.c b/tests/qtest/libqos/generic-pcihost.c
> index b77617524cac..287e8445ec5b 100644
> --- a/tests/qtest/libqos/generic-pcihost.c
> +++ b/tests/qtest/libqos/generic-pcihost.c
> @@ -210,7 +210,7 @@ void qpci_init_generic(QGenericPCIBus *qpci, QTestState *qts,
>      qpci->bus.pio_limit = 0x10000;
>      qpci->bus.mmio_alloc_ptr = 0x10000000;
>      qpci->bus.mmio_limit = 0x2eff0000;
> -    qpci->ecam_alloc_ptr = 0x4010000000;
> +    qpci->ecam_alloc_ptr = 0x90000000;
>  
>      qpci->obj.get_driver = qpci_generic_get_driver;
>  }
> 


