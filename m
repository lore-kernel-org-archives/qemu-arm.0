Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00920C83F1A
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Jul 2025 18:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucT2F-0007ay-SV; Thu, 17 Jul 2025 14:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ucQOk-0003Ds-VU
 for qemu-arm@nongnu.org; Thu, 17 Jul 2025 11:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ucQOh-0003lz-SG
 for qemu-arm@nongnu.org; Thu, 17 Jul 2025 11:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752765585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pRRfHkPxSG1WD7a6TYHyhVWoJ2Z6ZIRszt5R3FmQEQ8=;
 b=XoXb1fhvJEeZdx+fMimqgvT9yGlS4bUB5BwjSDygGQRcH+AlVxjiYvMtagvW7QFPQID1kv
 77C/QPQ/4k35Se/WADs8bHNhlyvV+fHKqDwXqMqii6zzAJ+O4ScSJSi3DVIV+b6HaZbsej
 ADWGtboZd9XrHSUypogAAa3SIX3eqnc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-UDXQ6gE4MJKHqfuTVQIADA-1; Thu, 17 Jul 2025 11:19:43 -0400
X-MC-Unique: UDXQ6gE4MJKHqfuTVQIADA-1
X-Mimecast-MFC-AGG-ID: UDXQ6gE4MJKHqfuTVQIADA_1752765581
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4538a2f4212so5415695e9.2
 for <qemu-arm@nongnu.org>; Thu, 17 Jul 2025 08:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752765581; x=1753370381;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRRfHkPxSG1WD7a6TYHyhVWoJ2Z6ZIRszt5R3FmQEQ8=;
 b=H/XMFp/SbQ01jGRsLxuG07M5s2EM5gE/dlnKgMVXu9Mf0chrb4bnyqV02HGPFqGbeN
 k1RZODKwAzn4K0VElX+xIQl3+0Lznf39ojUtTCPFUfoSoAb0mm5ceXCtDfBJf0B+QJSP
 lfLrNTQh01+hA5ogMTEyxJA/kCZ7FspAGHuZNL7r1udoF5Er9EfulougDuMxPfZD+zrE
 6We/ON7/t4rxHKvreeLC28JOpiqyv5UySrLm5FxabTJIDBqX+nwALKtUdH6XwbZi5CMW
 SwkQqBLdqpj9iUHwLGVSirpo33NRltj/Z9GtHJUSAKxtnJGKwT/j/m9LI8jPTbO+ILtT
 qt+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDNOTC+NMTKvP7mFQslgS5hMdhrmfFaKv7pUaQaWyjw46SOla/tBktyqbaFiiTL5/R74OJzCFFJA==@nongnu.org
X-Gm-Message-State: AOJu0YwskDcoYKWFiqlvRux4X2K/Zhe5izhI7Q/PL9g01usCrqPzPqD7
 guH43wule05331WfixrZQkRWPWFHHAlP9KH68d1zSZHmE3kQ18x4GcUCvNtpD9lPGE7X+ZfIwx+
 zVQTBMCHAl0tdVkyZHriVCDpmbNv7zB37CHEk+N60x81YtQY2KOYRyg==
X-Gm-Gg: ASbGncts0N/cmst8U6Yu9m4JB0dvSaPtnQN7Hx+GOqa3NCB1zGopV9Xwl5dm4zMx4ba
 cFgDHd7guJYFUqlafG37esRmNoGs28UmELnpbgYkdPCxBmdLqOt8RAkrtB3t2bZNV9REkEYq0XJ
 Igyr9xytc0j+Xy80Fn60wL1nxxDnn68LJXuI0EPdwx+OmJljzCcZeGEyZ1MVrsyGpbfREUkQ/tD
 Y/XPkI9MY5RTHTCGBSfJyA9JDpCz6owtAWYj+lriX61k77uIN3ZARSmq3/vOwvOOCEkzXJObWBp
 wwZkhTkovjdUrBCa8y7mXbEfF4s1yRs+dXIVPSXKTeb9CAZ5l8f0LAGdep4tuLp92/A2BDfLxWU
 =
X-Received: by 2002:a05:6000:2310:b0:3b6:463:d85d with SMTP id
 ffacd0b85a97d-3b613e6009bmr3055015f8f.11.1752765580925; 
 Thu, 17 Jul 2025 08:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQe8LE5IaN4lyboztQke3bp19Hf9mbmW7l5UlHyw1w4I55QdVXdWz+wehHtypnE6ku3jlIKQ==
X-Received: by 2002:a05:6000:2310:b0:3b6:463:d85d with SMTP id
 ffacd0b85a97d-3b613e6009bmr3054973f8f.11.1752765580267; 
 Thu, 17 Jul 2025 08:19:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:266c:b13b:afd7:40fd?
 ([2a01:e0a:165:d60:266c:b13b:afd7:40fd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d867sm21213967f8f.61.2025.07.17.08.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 08:19:39 -0700 (PDT)
Message-ID: <82b710eb-5d37-4e03-ad04-5218b0927a38@redhat.com>
Date: Thu, 17 Jul 2025 17:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/3] hw/i386: Add the ramfb romfile compatibility
To: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eauger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20250717100941.2230408-1-shahuang@redhat.com>
 <20250717100941.2230408-4-shahuang@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250717100941.2230408-4-shahuang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gZWXicqhWvZUrcxz6uuSq850yrF9QNjwHuwdLHhSeoE_1752765581
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/17/25 12:09, Shaoqin Huang wrote:
> ramfb is a sysbus device so it can only used for machine types where it
> is explicitly enabled:
> 
>    # git grep machine_class_allow_dynamic_sysbus_dev.*TYPE_RAMFB_DEVICE
>    hw/arm/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> 		  TYPE_RAMFB_DEVICE);
>    hw/i386/microvm.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> 		  TYPE_RAMFB_DEVICE);
>    hw/i386/pc_piix.c:    machine_class_allow_dynamic_sysbus_dev(m,
> 		  TYPE_RAMFB_DEVICE);
>    hw/i386/pc_q35.c:    machine_class_allow_dynamic_sysbus_dev(m,
> 		  TYPE_RAMFB_DEVICE);
>    hw/loongarch/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> 		  TYPE_RAMFB_DEVICE);
>    hw/riscv/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> 		  TYPE_RAMFB_DEVICE);
> 
> So these six are the only machine types we have to worry about.
> 
> The three x86 machine types (pc, q35, microvm) will actually use the rom
> (when booting with seabios).
> 
> For arm/riscv/loongarch virt we want to disable the rom.
> 
> This patch sets ramfb romfile option to false by default, except for x86
> machines types (pc, q35, microvm) which need the rom file when booting
> with seabios and machine types <= 10.0 (handling the case of arm virt,
> for compat reasons).
> 
> At the same time, set the "use-legacy-x86-rom" property to true on those
> historical versioned machine types in order to avoid the memory layout
> being changed.
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   hw/core/machine.c             |  2 ++
>   hw/display/ramfb-standalone.c |  2 +-
>   hw/i386/microvm.c             |  3 +++
>   hw/i386/pc_piix.c             | 10 ++++++++++
>   hw/i386/pc_q35.c              |  3 +++
>   hw/vfio/pci.c                 |  2 +-
>   6 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e869821b22..a7043e2a34 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,8 @@
>   
>   GlobalProperty hw_compat_10_0[] = {
>       { "scsi-hd", "dpofua", "off" },
> +    { "ramfb", "use-legacy-x86-rom", "true"},
> +    { "vfio-pci", "use-legacy-x86-rom", "true" },
>   };
>   const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
>   
> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
> index 82d8c69f89..72b2071aed 100644
> --- a/hw/display/ramfb-standalone.c
> +++ b/hw/display/ramfb-standalone.c
> @@ -64,7 +64,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>   static const Property ramfb_properties[] = {
>       DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
>       DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState,
> -                     use_legacy_x86_rom, true),
> +                     use_legacy_x86_rom, false),
>   };
>   
>   static void ramfb_class_initfn(ObjectClass *klass, const void *data)
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index e0daf0d4fc..d90b69a162 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -49,6 +49,7 @@
>   #include "hw/acpi/generic_event_device.h"
>   #include "hw/pci-host/gpex.h"
>   #include "hw/usb/xhci.h"
> +#include "hw/vfio/types.h"
>   
>   #include "elf.h"
>   #include "kvm/kvm_i386.h"
> @@ -633,6 +634,8 @@ GlobalProperty microvm_properties[] = {
>        * so reserving io space is not going to work.  Turn it off.
>        */
>       { "pcie-root-port", "io-reserve", "0" },
> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },

you could use the string literal "vfio-pci" directly here instead
of the TYPE_VFIO_PCI define and avoid the extra vfio header file.

Thanks,

C.




>   };
>   
>   static void microvm_class_init(ObjectClass *oc, const void *data)
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index ea7572e783..6b829ad9fb 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -49,6 +49,7 @@
>   #include "hw/i2c/smbus_eeprom.h"
>   #include "system/memory.h"
>   #include "hw/acpi/acpi.h"
> +#include "hw/vfio/types.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "system/xen.h"
> @@ -77,6 +78,13 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
>   static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
>   #endif
>   
> +static GlobalProperty pc_piix_compat_defaults[] = {
> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
> +};
> +static const size_t pc_piix_compat_defaults_len =
> +    G_N_ELEMENTS(pc_piix_compat_defaults);
> +
>   /*
>    * Return the global irq number corresponding to a given device irq
>    * pin. We could also use the bus number to have a more precise mapping.
> @@ -482,6 +490,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
>                                      pc_set_south_bridge);
>       object_class_property_set_description(oc, "x-south-bridge",
>                                        "Use a different south bridge than PIIX3");
> +    compat_props_add(m->compat_props,
> +                     pc_piix_compat_defaults, pc_piix_compat_defaults_len);
>   }
>   
>   static void pc_i440fx_machine_10_1_options(MachineClass *m)
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 33211b1876..01f4f73713 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -45,6 +45,7 @@
>   #include "hw/i386/pc.h"
>   #include "hw/i386/amd_iommu.h"
>   #include "hw/i386/intel_iommu.h"
> +#include "hw/vfio/types.h"
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/display/ramfb.h"
>   #include "hw/ide/pci.h"
> @@ -67,6 +68,8 @@
>   
>   static GlobalProperty pc_q35_compat_defaults[] = {
>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },>   };>   static const size_t pc_q35_compat_defaults_len =
>       G_N_ELEMENTS(pc_q35_compat_defaults);
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 6547a95ccd..b4923e4710 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3711,7 +3711,7 @@ static const TypeInfo vfio_pci_dev_info = {
>   static const Property vfio_pci_dev_nohotplug_properties[] = {
>       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
>       DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice,
> -                     use_legacy_x86_rom, true),
> +                     use_legacy_x86_rom, false),
>       DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
>                               ON_OFF_AUTO_AUTO),
>   };


