Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6102CCD6E45
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 09:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wStb3-0002JO-4y; Fri, 29 May 2026 05:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wStb0-0002Ix-Es
 for qemu-arm@nongnu.org; Fri, 29 May 2026 05:33:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wStax-0008KI-Ax
 for qemu-arm@nongnu.org; Fri, 29 May 2026 05:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780047213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzVvQDlHzFry+ATKB9quLBcwO9zlGSX7p6LYOTJ0G9Y=;
 b=bai/AZinSBRJKZZpXYQiIOPr/A3Zj+/pn6b0v3OoUFbe8+n7MP9Wm4N9R0fW4nl9PNYfjd
 SkYgoCEonjgjr3mlnRolKDyOwfrNmXMKuKMbI8nSVcQpzDj20F/AZCsxnnA2U5xXx85rTv
 nmslijIwAno6SRnfDtxc0L859f8VhqQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-7Ag97IeNN_SWT46NCkjvnw-1; Fri, 29 May 2026 05:33:30 -0400
X-MC-Unique: 7Ag97IeNN_SWT46NCkjvnw-1
X-Mimecast-MFC-AGG-ID: 7Ag97IeNN_SWT46NCkjvnw_1780047209
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-45eee3f9f03so1017500f8f.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 02:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047209; x=1780652009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mzVvQDlHzFry+ATKB9quLBcwO9zlGSX7p6LYOTJ0G9Y=;
 b=a7GqOgHShh35NOPk3OohXeYsVPmRQl9X6rAuI0FV0SFpCGPmcAy8YVxEUHRPENwVkP
 ftESTkgxQ415XoMiNH/FsKoMv/JR/ACF4N+FCgjdlE4TV77CDdgC8HwDWdyTJdMEQWFX
 Z1KpRT5fmOk8LjfDS/qKcL62oQL5LOVodpCJHOupPtZJ6B9q5IVKcseF6T2Eibw//raD
 EIwc4lRVzmCKicqx3ZOJn6OoJj3T7V+Wjs5igBVrkm5by/I21DIJySF9GZutxnC8Y+xe
 AXS+pxeUrMHne+FZ2kswVgdM/wzS2450whHodR4+oVRtB5Pzh4g7hu7ijmK8E3m/6ps0
 tzGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/fCkBRYnbeU+NvLS7IoWuC+r1ZUG5DaGblBsZZKBp5shXTs8Px2sPHLFjTaL4lnWInOkplmw2kGg==@nongnu.org
X-Gm-Message-State: AOJu0YyOepN5bZ9Vi1pKAbmVKjfHV8uhZS2vA++EeoF3JI29W93O4mfk
 zahU9uzY0IfpRlfIFQvyPMyDRBnS17nWBFImJZPcjN9tC8KBTJgC+g1yR72uMdGdVdRL4bDkpt3
 MsFWZbo23WNhAfztscv49j910zrmEq1KpqE0AuaGECaucCmVTsiSkNw==
X-Gm-Gg: Acq92OGNH9gQ8s5gw3ldO1gwCD3m+nGCJp5k0gtvxK2NwpYprQ0tSGEs1MbMPE4zp43
 lne1eyLEHfuQyZSKscNh215kUmVKviiyjiIBuHwsU2RZ4Pd3OHq+H1zMyo2/tSe/V+GeGj1RRyW
 gK4E8y7cw0C+SCXEKAXbFcA4ClXwFoVgkubLSBJBVyJEMPvdalLxVkh1ydr3/mF3TbB+iHBa9zU
 PJIvv7FgmHjA3A2fC4Gaz/yzk7/O2hv7Lrsty7+mJK0Khwno6peCVvUTC+shdeFEMWvTo1L90ph
 cXAij05RgVIi9xYYmmJFtYThUnPGbyq8xBal8xbcRUKZLlSVZtFFREfBn/FlWMbWxoa/qXAoS5m
 PQiIjMw9ZTjENNLQi
X-Received: by 2002:a5d:64e4:0:b0:45e:ea2a:dd79 with SMTP id
 ffacd0b85a97d-45ef13fd959mr3870142f8f.4.1780047208692; 
 Fri, 29 May 2026 02:33:28 -0700 (PDT)
X-Received: by 2002:a5d:64e4:0:b0:45e:ea2a:dd79 with SMTP id
 ffacd0b85a97d-45ef13fd959mr3870089f8f.4.1780047208261; 
 Fri, 29 May 2026 02:33:28 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34bd896sm2243375f8f.14.2026.05.29.02.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:33:27 -0700 (PDT)
Date: Fri, 29 May 2026 11:33:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v7 3/5] hw/arm/virt: Remove the lower bound of HighMem
 IO Regions
Message-ID: <20260529113326.0ed22e12@imammedo>
In-Reply-To: <20260528-virt-v7-3-42c4d18620b8@rsg.ci.i.u-tokyo.ac.jp>
References: <20260528-virt-v7-0-42c4d18620b8@rsg.ci.i.u-tokyo.ac.jp>
 <20260528-virt-v7-3-42c4d18620b8@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _tVRIShP7ysq9GZ91AqGpqzka0n4vBbHUDIWNIGQnJY_1780047209
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, 28 May 2026 00:05:43 +0900
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:

> Remove the lower bound of the Highmem IO Regions' addresses for the
> latest machine version to increase the chance to fit the regions in the
> PA space.
> 
> The lower bound was especially problematic when using virt-install on
> Apple M2. virt-install 5.0.0 adds multiple pcie-root-port devices that
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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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


