Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E988C83F17
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Jul 2025 21:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ub3qH-0004OV-Rf; Sun, 13 Jul 2025 17:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ub3qF-0004Lt-Pj
 for qemu-arm@nongnu.org; Sun, 13 Jul 2025 17:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ub3qD-0005aY-Fj
 for qemu-arm@nongnu.org; Sun, 13 Jul 2025 17:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752440551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H1APcDbDmqwKK/Ovis7X/z3JXmnMCYjKvi40inkbcWE=;
 b=KOnx8p6IadHDDztG2+Vx3zcyeK26sMKPNKCaSL+8IIOXKDMq5dN3aN17P3S8LL1VFjb275
 XRgFzqruf/plos7ZeSz41kt+pek3cVcILTrbtpVZioiMLhPvSem8MZ4VxaoE6sGjQ015Of
 zzXhypkSWoKqZnjWMYKIQo3/8Tmb8iw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-MmytIlfGNfClUlm5i5qyKA-1; Sun, 13 Jul 2025 17:02:30 -0400
X-MC-Unique: MmytIlfGNfClUlm5i5qyKA-1
X-Mimecast-MFC-AGG-ID: MmytIlfGNfClUlm5i5qyKA_1752440549
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4e9252ba0so2080340f8f.0
 for <qemu-arm@nongnu.org>; Sun, 13 Jul 2025 14:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752440549; x=1753045349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1APcDbDmqwKK/Ovis7X/z3JXmnMCYjKvi40inkbcWE=;
 b=AaidnVoA/CstWvSsdp4pu8Lim6OF+if0rhIFHOsslVXHWYU41CgefK9gB15pR3EVAu
 cCmARECzmkmZNd1XxfQj3W4V1r9cL2Vs5C7FRD8MQPKdfChrzT8gKJCcKvWmmVBO06xf
 1J78tfAEFN7AHCbDUNXE8iEqty92Ss7SwxJx0cTgsO+2xzTXYxNnvGQY0W641tIOC7Xj
 lup3c5AGotg6H5jwNjoZH7COU3eHOeilKR5J3TfKV9f5ag0QuGpO/C+M88vYUDl7+WTK
 jImnGJt0UajwsZ2gObdz4qdwvUfPJvQL+49kGDV3/5gQk1899de2tMkVrlXTKCBFL+H5
 xsfw==
X-Gm-Message-State: AOJu0Yx6QUf8fjdShx81UD/Q75byf0TWVLiEfmzUlhM4UyofEjMP+n64
 EI1EgyeJIHiMU2FqO8QasRsRtAT7cM9fZRLlnwW4CZJEVpN52s6YYuHSddLXvkJ1dKrjgM2lI9q
 rI9FniMFK2x+rvSMkiZVmEALKbhHhBJMfIIBTqqT34j7OFfygPjME+A==
X-Gm-Gg: ASbGncsnEjFbLNnmssA25dGd9GcpFBMTeqU8/dg6OY9t+li2yyEUHmavlPgrxnS4DiQ
 P8JV18sU0Z7h0TTr247kfqO1Mx6BmJhuQeJDtvF5uaiaSqz5IGHluUVieQqIYoN6fIQZ6s9oA5k
 CpoiUkVc0Pji9tkcq59JbiMZg1frOBMcxDzGtkqgqvn/mlOu7oAt+V7H2C1tJ3N5f0l0gJYYNVY
 XQ18Hj6OZ2yBKx6dMPZ2Syppw1lu+Pls81y5gPaMFC+IvxNV9fgCXCF0ct0F3gyAMUU0aTl9xbA
 VIW2GAov/bdxrK34fAvIpFKdJPcZ7mmz
X-Received: by 2002:a05:6000:43d7:b0:3a5:2ef8:34f0 with SMTP id
 ffacd0b85a97d-3b5f188e1f9mr6578361f8f.22.1752440548682; 
 Sun, 13 Jul 2025 14:02:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4MBvVq0zuO0v6G3Y0jfYDFalaDIn5ezEx8DsBqjDrZo70zzi9kD3LNvuIxk6Xt/HVzXEi/w==
X-Received: by 2002:a05:6000:43d7:b0:3a5:2ef8:34f0 with SMTP id
 ffacd0b85a97d-3b5f188e1f9mr6578353f8f.22.1752440548222; 
 Sun, 13 Jul 2025 14:02:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50ded8csm150062335e9.20.2025.07.13.14.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 14:02:27 -0700 (PDT)
Date: Sun, 13 Jul 2025 17:02:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 2/2] hw/i386: Add the ramfb romfile compatibility
Message-ID: <20250713170200-mutt-send-email-mst@kernel.org>
References: <20250704030315.2181235-1-shahuang@redhat.com>
 <20250704030315.2181235-3-shahuang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250704030315.2181235-3-shahuang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AZ94xEADXt-1XDCb7F3wQoEtil1T8D8JihW5Pls7Cow_1752440549
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jul 03, 2025 at 11:03:15PM -0400, Shaoqin Huang wrote:
> ramfb is a sysbus device so it can only used for machine types where it
> is explicitly enabled:
> 
>   # git grep machine_class_allow_dynamic_sysbus_dev.*TYPE_RAMFB_DEVICE
>   hw/arm/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> 		  TYPE_RAMFB_DEVICE);
>   hw/i386/microvm.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> 		  TYPE_RAMFB_DEVICE);
>   hw/i386/pc_piix.c:    machine_class_allow_dynamic_sysbus_dev(m,
> 		  TYPE_RAMFB_DEVICE);
>   hw/i386/pc_q35.c:    machine_class_allow_dynamic_sysbus_dev(m,
> 		  TYPE_RAMFB_DEVICE);
>   hw/loongarch/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
> 		  TYPE_RAMFB_DEVICE);
>   hw/riscv/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc,
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
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>

i386 things look fine.

Acked-by: Michael S. Tsirkin <mst@redhat.com>



> ---
>  hw/core/machine.c             |  2 ++
>  hw/display/ramfb-standalone.c |  2 +-
>  hw/i386/microvm.c             |  3 +++
>  hw/i386/pc_piix.c             | 10 ++++++++++
>  hw/i386/pc_q35.c              |  3 +++
>  hw/vfio/pci.c                 |  2 +-
>  6 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e869821b22..a7043e2a34 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,8 @@
>  
>  GlobalProperty hw_compat_10_0[] = {
>      { "scsi-hd", "dpofua", "off" },
> +    { "ramfb", "use-legacy-x86-rom", "true"},
> +    { "vfio-pci", "use-legacy-x86-rom", "true" },
>  };
>  const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
>  
> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
> index 725aef9896..b20a7c57b3 100644
> --- a/hw/display/ramfb-standalone.c
> +++ b/hw/display/ramfb-standalone.c
> @@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
>  
>  static const Property ramfb_properties[] = {
>      DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, false),
>  };
>  
>  static void ramfb_class_initfn(ObjectClass *klass, const void *data)
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index e0daf0d4fc..6666db9e4f 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -49,6 +49,7 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/usb/xhci.h"
> +#include "hw/vfio/pci.h"
>  
>  #include "elf.h"
>  #include "kvm/kvm_i386.h"
> @@ -633,6 +634,8 @@ GlobalProperty microvm_properties[] = {
>       * so reserving io space is not going to work.  Turn it off.
>       */
>      { "pcie-root-port", "io-reserve", "0" },
> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>  };
>  
>  static void microvm_class_init(ObjectClass *oc, const void *data)
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index ea7572e783..8ec8d8ae6d 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -49,6 +49,7 @@
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "system/memory.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/vfio/pci.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "system/xen.h"
> @@ -77,6 +78,13 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
>  static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
>  #endif
>  
> +static GlobalProperty pc_piix_compat_defaults[] = {
> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
> +};
> +static const size_t pc_piix_compat_defaults_len =
> +    G_N_ELEMENTS(pc_piix_compat_defaults);
> +
>  /*
>   * Return the global irq number corresponding to a given device irq
>   * pin. We could also use the bus number to have a more precise mapping.
> @@ -482,6 +490,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
>                                     pc_set_south_bridge);
>      object_class_property_set_description(oc, "x-south-bridge",
>                                       "Use a different south bridge than PIIX3");
> +    compat_props_add(m->compat_props,
> +                     pc_piix_compat_defaults, pc_piix_compat_defaults_len);
>  }
>  
>  static void pc_i440fx_machine_10_1_options(MachineClass *m)
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 33211b1876..0096eef6f4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -45,6 +45,7 @@
>  #include "hw/i386/pc.h"
>  #include "hw/i386/amd_iommu.h"
>  #include "hw/i386/intel_iommu.h"
> +#include "hw/vfio/pci.h"
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/ide/pci.h"
> @@ -67,6 +68,8 @@
>  
>  static GlobalProperty pc_q35_compat_defaults[] = {
>      { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
> +    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
> +    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
>  };
>  static const size_t pc_q35_compat_defaults_len =
>      G_N_ELEMENTS(pc_q35_compat_defaults);
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index f4fa8a5610..604b337389 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3710,7 +3710,7 @@ static const TypeInfo vfio_pci_dev_info = {
>  
>  static const Property vfio_pci_dev_nohotplug_properties[] = {
>      DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, false),
>      DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
>                              ON_OFF_AUTO_AUTO),
>  };
> -- 
> 2.40.1


