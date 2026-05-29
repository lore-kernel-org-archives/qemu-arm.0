Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F7ACD6E45
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 09:40:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wStgt-0003qM-AQ; Fri, 29 May 2026 05:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wStgr-0003pZ-Hc
 for qemu-arm@nongnu.org; Fri, 29 May 2026 05:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wStgp-00010s-5O
 for qemu-arm@nongnu.org; Fri, 29 May 2026 05:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780047578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kHOh6RHIu/LfZ0VHkFa0m0hxbzuqnecKZuzAlcJRxQ=;
 b=MEJ+khtv/3QhRa27FC5VMamMvTkNAVMsUdoOzL6N9XjagD8mrpheMyewlaO7iS1nQ/j5Ft
 wqLuMNaBt+P16AgMmfrr3WUtvSPjbzEyKWlFOxZxIWWbtplCPBiItjwqINQBMlFuBi925G
 eqt200GXwbIAvuyKW2OboraZb+ICNz8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-44RLk9xfNMW-dJ5QY7o0gA-1; Fri, 29 May 2026 05:39:34 -0400
X-MC-Unique: 44RLk9xfNMW-dJ5QY7o0gA-1
X-Mimecast-MFC-AGG-ID: 44RLk9xfNMW-dJ5QY7o0gA_1780047573
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4904ee02e72so58446545e9.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 02:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047573; x=1780652373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5kHOh6RHIu/LfZ0VHkFa0m0hxbzuqnecKZuzAlcJRxQ=;
 b=Hn6ERFzjl9ouIv5wdtM12D/kvxMBAIMb51//5KRnYoY9vNq16BzC0ECKnIBpgMtof0
 6LTWnIbJoixSyZZmi357rU0Vmh2SWpJX4iFWJOKJKUJLsHmXgq7hgq2cVmiRBaK7hUiv
 ZSDHiJAtx7Zwh+HlVmvBjARgKIBxKSwHUHnIMOYDxBV3sKav2QqgRdYc/3xHmsYIKvjk
 GAIQ6UZzrp9jKAFpBqei1my4iiZsjVlcFAliu6518v6GFEgZJQ23aZ/GUNA+2It9gG2T
 3tsyoCnckcoSXe2U5ZlpJy+IkQjussbV8wGQ4h5XcwtxEEx3lzh9VePaBptB1F5Is1Jx
 OhhQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/H4TZa4eTYVWSwCKY5g7rZMvsijHYkYWfnioOg/mgAdBR4YLQ1UAo0AA4XT/oJWdlisp8a/enm7Q==@nongnu.org
X-Gm-Message-State: AOJu0YxTFH1s47BWCfJChE/C1oP/wA/Hc1aZzJp/EQd+J8qdTqr9oioC
 OGuJ8xcIU1pUiFMn+TYehovj+jABue8SgXVKXazwMCc/DsJ5unzpCvBWsIKvisTMZdJUx0LXjkO
 d08n2znVTCaAQtdgnCMBG02uUQwg225q8WIHy6KzzzSfPDz2o7SKDtw==
X-Gm-Gg: Acq92OFejou8U78Li76el9smzqIOMXNS19KQAqBJ6fWaBzbJqaYcZl4OgfdxLLQGhme
 UUy+9Zq0g8bA9lvOMZzZINmraofWc2P31TGB1cG0hVqDgT6+P8eZCnhKjSC6vKRouSJmqp+vRat
 3CgERpWY1PO7ldVV60upO49a7d3OX/1SY+q0GaGUHeyOUyVNL28nBaOe4WCrgkBIBF34HCI+ZuK
 t4PdCuW5pBJZUtcC4zGRtN/jiKJDd891KXpg6acSlURwbV5b5zk0/dK+w0db5w7O6N1XIMMQiSz
 xn4vpdSh5F9rU6+wwEo0hjhWO3r9cTB8mxcdXJEffFEIgrT8QeE8I8/X8EmhYyGkO6BfC7zhaNQ
 yypA4P1nk1jUDkTDa
X-Received: by 2002:a05:600c:1546:b0:490:4b89:5359 with SMTP id
 5b1f17b1804b1-4909c091a23mr39603435e9.1.1780047572962; 
 Fri, 29 May 2026 02:39:32 -0700 (PDT)
X-Received: by 2002:a05:600c:1546:b0:490:4b89:5359 with SMTP id
 5b1f17b1804b1-4909c091a23mr39602885e9.1.1780047572515; 
 Fri, 29 May 2026 02:39:32 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09be7fsm11008615e9.7.2026.05.29.02.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:39:32 -0700 (PDT)
Date: Fri, 29 May 2026 11:39:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>
Subject: Re: [PATCH v7 4/5] hw/arm/virt: Relax the lower bound of HighMem
 MMIO region size
Message-ID: <20260529113930.2d455981@imammedo>
In-Reply-To: <20260528-virt-v7-4-42c4d18620b8@rsg.ci.i.u-tokyo.ac.jp>
References: <20260528-virt-v7-0-42c4d18620b8@rsg.ci.i.u-tokyo.ac.jp>
 <20260528-virt-v7-4-42c4d18620b8@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TWEAsVt6oZpovKz27ls87jwLJDRcMIC09mQkjvqp9MQ_1780047573
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 28 May 2026 00:05:44 +0900
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:

> Relax the lower bound of the HighMem MMIO region size to make it more
> likely that the region fits in the PA space.
> 
> The lower bound was especially problematic on Apple M2. The current
> lower bound, 512 GiB, is too big to fit in the limited PA space on the
> hardware. That makes the HighMem MMIO region unavailable and limits the
> PCIe MMIO space to the base MMIO region. The base MMIO region is not big
> enough to contain a large hostmem window configured for virtio-gpu-gl-pci
> with DRM native context, for example.
> 
> Relax the lower bound to 64 KiB, matching the memory map comment that
> says "devices should generally be placed at multiples of 0x10000, to
> accommodate guests using 64K pages." Also, automatically lower the
> default HighMem MMIO region size to fit in the PA space for the latest
> machine version; the older machine versions retain the previous default
> HighMem MMIO region size for compatibility.

How useful/practical 64K window would be?
Should it be reasonably large (like 64Mb or similar), or mirror lower windows size?
CCing Gerd,
to look at it from firmware POV.

wrt 64K magic value, it opencoded in several places. I'd use a macro for that.

> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  docs/system/arm/virt.rst |  2 +-
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt.c            | 22 ++++++++++++++--------
>  3 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index f811e662d68d..c8284ce2fa0e 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -149,7 +149,7 @@ highmem-mmio
>  
>  highmem-mmio-size
>    Set the high memory region size for PCI MMIO. Must be a power of 2 and
> -  greater than or equal to the default size (512G).
> +  greater than or equal to 64 KiB.
>  
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 6c8ba8f3185b..7aa289d3936f 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -143,6 +143,7 @@ typedef enum VirtGICType {
>  struct VirtMachineClass {
>      MachineClass parent;
>      hwaddr min_highmem_base;
> +    hwaddr high_pcie_mmio_size;
>      bool no_tcg_its;
>      bool no_highmem_compact;
>      bool no_kvm_steal_time;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 78a85a966ad7..dd97b0dd6a42 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -222,8 +222,7 @@ static const MemMapEntry base_memmap[] = {
>  };
>  
>  /* Update the docs for highmem-mmio-size when changing this default */
> -#define DEFAULT_HIGH_PCIE_MMIO_SIZE_GB 512
> -#define DEFAULT_HIGH_PCIE_MMIO_SIZE (DEFAULT_HIGH_PCIE_MMIO_SIZE_GB * GiB)
> +#define MAX_DEFAULT_HIGH_PCIE_MMIO_SIZE (512 * GiB)
>  
>  /*
>   * Highmem IO Regions: This memory map is floating, located after the RAM.
> @@ -249,7 +248,7 @@ static MemMapEntry extended_memmap[] = {
>      [VIRT_CXL_HOST] =           { 0x0, 64 * KiB * 16 }, /* 16 UID */
>      [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>      /* Second PCIe window */
> -    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, DEFAULT_HIGH_PCIE_MMIO_SIZE },
> +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 0 },
>      /* Any CXL Fixed memory windows come here */
>  };
>  
> @@ -2448,9 +2447,14 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>          region_enabled = virt_get_high_memmap_enabled(vms, i);
> -        region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> +        if (i == VIRT_HIGH_PCIE_MMIO && !region_size) {
> +            region_size = CLAMP(pow2floor(BIT_ULL(pa_bits) - base),
> +                                64 * KiB, MAX_DEFAULT_HIGH_PCIE_MMIO_SIZE);
> +        }
> +
> +        region_base = ROUND_UP(base, region_size);
>          vms->memmap[i].base = region_base;
>          vms->memmap[i].size = region_size;
>  
> @@ -3340,11 +3344,9 @@ static void virt_set_highmem_mmio_size(Object *obj, Visitor *v,
>          return;
>      }
>  
> -    if (size < DEFAULT_HIGH_PCIE_MMIO_SIZE) {
> -        char *sz = size_to_str(DEFAULT_HIGH_PCIE_MMIO_SIZE);
> +    if (size < 64 * KiB) {
>          error_setg(errp, "highmem-mmio-size cannot be set to a lower value "
> -                         "than the default (%s)", sz);
> -        g_free(sz);
> +                         "than 64 KiB");
>          return;
>      }
>  
> @@ -4271,6 +4273,8 @@ static void virt_instance_init(Object *obj)
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>  
> +    extended_memmap[VIRT_HIGH_PCIE_MMIO].size = vmc->high_pcie_mmio_size;
> +
>      /* EL3 is disabled by default on virt: this makes us consistent
>       * between KVM and TCG for this board, and it also allows us to
>       * boot UEFI blobs which assume no TrustZone support.
> @@ -4372,6 +4376,8 @@ static void virt_machine_11_0_options(MachineClass *mc)
>       * < 255GiB we keep the legacy memory map.
>       */
>      vmc->min_highmem_base = base_memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
> +
> +    vmc->high_pcie_mmio_size = MAX_DEFAULT_HIGH_PCIE_MMIO_SIZE;
>  }
>  DEFINE_VIRT_MACHINE(11, 0)
>  
> 


