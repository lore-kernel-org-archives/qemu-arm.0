Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2919506dye;
        Mon, 30 Jun 2025 22:18:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWH4Lynaln3wSAZJcre6FnnjKtCakPkva300ZVk/B23yp6VNmrZ+4LX9+Pml+WkJXhKz5D4ghq4axXmHw==@linaro.org
X-Google-Smtp-Source: AGHT+IH24N0rCSyZzki8v5+mY+Z7GMEaaz37oC1qAF19SHuXDcunTjJAtbOPakJ5ckVxQRKyCwBi
X-Received: by 2002:a05:620a:25cf:b0:7d3:f42a:123e with SMTP id af79cd13be357-7d4439b8a4amr2847085685a.54.1751347099966;
        Mon, 30 Jun 2025 22:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751347099; cv=none;
        d=google.com; s=arc-20240605;
        b=UIyDxvy4QcEuSPKb2AhS6kI247LfzQds0h4XDcgE5UOBA1CO4QKOES0MAYaO+MXzTT
         HJyAbjI0UmyQOmyk7TX3yGCsS7JMW02F7WDvYHm7D5+odUAZEL3FcTy5UrjAUt2Br/ay
         /1bhzUz+o1EjUMuce2gnWU5oIGQdtGtlugXT+FGLi9H0H0XPGwSBV/GYhBfVoA48GY5C
         kEKW9XJqkwChkEGYqOiOvsvFFU0ucK3lop4Op0vzqFzd1ehDKiNjO99MD6RWjUsCae1b
         wNBd9YIoGa6yadIhIBdz9MURSKngA0fgnwOnMLk+C8fX8cwzDh0u9KEqe2C8HYtelAjM
         KsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GP0IvbFuGzYX0dGCbJyf5OR8k9o+SbLFNi5hmpHXPEU=;
        fh=dBwbhwtFPwB4vEi6LJOLp3hfJBIebfhbmxNYXSd9RmQ=;
        b=YuLvkyVpP0yrY7mzKRF0oN03bEIRdu0Rjh1P1vz24tr4GctRN33OD6cOwBwMdyN+J2
         a7xSJ9IPVhtoYnD0rt63xVKJcFd3nwnwvPpO+oAwgw1zEm1pbO+owQRg1dFY57qvxoYh
         PitO6wPPcUxbKN3nOBiaZxOe517rrATxz6lWoNNDA1GZ9PAnYqX4b+rgXFiHStI6m+tM
         ye6pAI0zLtw1G5fYYSiD29zsQHuCzfPPvxQ9AQHjTtNvnR5Gs5tcI15u+K7vRi66wVpt
         YW1jeDmXTNfzxzNSeUHRZan86hYiWIxx3Czbmn+Ro1OMV/LxyT1GrTm+mtB1eRRiCGdQ
         5b2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQFIUM3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4431a3cf6si1119795585a.132.2025.06.30.22.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 22:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQFIUM3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWTNI-0005XV-4x; Tue, 01 Jul 2025 01:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uWTNF-0005Wx-G9
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 01:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uWTNA-00047T-C9
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 01:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751347054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GP0IvbFuGzYX0dGCbJyf5OR8k9o+SbLFNi5hmpHXPEU=;
 b=KQFIUM3Vr6/XG33rb+vqvfURdCQzU6CTLVMhP7NOE1eshV6NwBm/NnShxkE42+zRKbo3BJ
 2ZF2OKfdglKBy7CEJlYEF0xaAhDi5RfQMGmkHUPpP2e0YO9PC6WKT7OCCsARc3vjhgZbNa
 TkeDUtAyFOCgtaz+gFM63bwNsSZWXt8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-7YgZgijoPXGTzM7qHxqNXg-1; Tue, 01 Jul 2025 01:17:31 -0400
X-MC-Unique: 7YgZgijoPXGTzM7qHxqNXg-1
X-Mimecast-MFC-AGG-ID: 7YgZgijoPXGTzM7qHxqNXg_1751347050
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d7de4ae3so24715515e9.2
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 22:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751347050; x=1751951850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GP0IvbFuGzYX0dGCbJyf5OR8k9o+SbLFNi5hmpHXPEU=;
 b=pgXqxPgDGW+I2uvj9VxNAXhQ0PmhC9G59G5Y32ni9QJ8o1gqOCrknDhcrLskXtRz0q
 JKCGgHhBFafk4jBMAZy4pDAZkMA435ibNV9nAMCHJzWl28oi+e/F6ivHDKNs8bhptQR4
 rJs9z1dlzA40gKJZUEcvgU4DY10zyDVPMDsaF8GTQklSBjbNnGmbVbN842+WdXDIeAW5
 A3SfV53gYzDmyupj1Ea9yKKsG7EznqoeFMFMK2LkTrGCxyxkKq7+qPj7qYvrxoc8QTVT
 QOsOAgMWQB3I4sEhvCxJjchzGk3syLYKJo6YjZQs5ccLfoDAmPc8yybm7ieWdmpPMdG0
 RZKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQBufmdzGhRIyUl8PLp0uMx7DQl/6omlTcmtRNNoPzMH9orLG6/vHDxnK/S76UxdtjIN+4oOMeag==@nongnu.org
X-Gm-Message-State: AOJu0YxWXB/JQIX4iCXQJlOMO3kJB8QctqTCTSCYmuP7anPdbP+7TIFR
 h4ebcIwgKG1FS+r8gSlxBKgeBMrcCP6Vh2OREpffLnxBlHMBS1QtJVAxI+kI6j5XPAN4ue4sMoJ
 GMWyuhlkhvNYMG2TauLAfZIRI0bT4Ed2iNmi3HZIJBn6oNN+SavFwpg==
X-Gm-Gg: ASbGncsZCxGW0m3/KrqofaIupA0WRdZ/Q3mz+QK0wBf/YkB1bfCQM3FMNCLJZhmbFoy
 P8oW0IChIuPz46wzQs8kiEMyHt9q2pmiWLYFLStXORS31OBSQLDdJHWZcc1LV5J0XbOams9auC/
 vzQwxbYSTvnhoYdf52XFLB82imJyS5ViBZXlG/I6+QpquD3UyjvSWo3utzf6FBMenQBnmMoiCCX
 3blwxl5M/uyMsqIn15zrPrP/xd3FUF8InOg/1z0airAyYd4Be4FCZpszVINRbilc5DqF4L/yO2Q
 YGyj6W8J368CeSAthH5XvHhcF+y/8A0cnB8l46SX+oxWf+RN4H/cV/9i9khzX/6x
X-Received: by 2002:a05:600c:3b8c:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-45396072f4cmr107127335e9.5.1751347050301; 
 Mon, 30 Jun 2025 22:17:30 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8c:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-45396072f4cmr107127155e9.5.1751347049843; 
 Mon, 30 Jun 2025 22:17:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7098sm11896245f8f.4.2025.06.30.22.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 22:17:29 -0700 (PDT)
Message-ID: <9bbaa0bb-cf32-48f2-aff6-6484285496f0@redhat.com>
Date: Tue, 1 Jul 2025 07:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hw/i386: Add the ramfb romfile compatibility
To: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250701030549.2153331-1-shahuang@redhat.com>
 <20250701030549.2153331-3-shahuang@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250701030549.2153331-3-shahuang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yPfet-HJVDMVAWDtQoRZN6Z1yCN57OxrktFHCo1u-C8_1751347050
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WyKt4slrrCms

Hi,

On 7/1/25 5:05 AM, Shaoqin Huang wrote:
> Set the "use-legacy-x86-rom" property to false by default, and only set
> it to true on x86 since only x86 will need it.
> 
> At the same time, set the "use-legacy-x86-rom" property to true on those
> historical versioned machine types in order to avoid the memory layout
> being changed.
> 
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>  hw/core/machine.c             |  2 ++
>  hw/display/ramfb-standalone.c |  2 +-
>  hw/i386/pc_piix.c             | 10 ++++++++++
>  hw/i386/pc_q35.c              |  3 +++
>  hw/vfio/pci.c                 |  2 +-
>  5 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 63c6ef93d2..349aec1e0d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -46,6 +46,8 @@ GlobalProperty hw_compat_9_2[] = {
>      { "migration", "multifd-clean-tls-termination", "false" },
>      { "migration", "send-switchover-start", "off"},
>      { "vfio-pci", "x-migration-multifd-transfer", "off" },
> +    { "ramfb", "use-legacy-x86-rom", "true"},
> +    { "vfio-pci", "use-legacy-x86-rom", "true" },
why 9.2? The 10.0 machine type should also apply the previous "true"
default setting. To me the new default shall only affect the latest 10.1
machine type.
>  };
>  const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
>  
> diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
> index af1175bf96..ddbf42f181 100644
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
>  static void ramfb_class_initfn(ObjectClass *klass, void *data)
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6c91e2d292..4a8bbc0e28 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -49,6 +49,7 @@
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "exec/memory.h"
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
> @@ -477,6 +485,8 @@ static void pc_i440fx_machine_options(MachineClass *m)
>                                     pc_set_south_bridge);
>      object_class_property_set_description(oc, "x-south-bridge",
>                                       "Use a different south bridge than PIIX3");
> +    compat_props_add(m->compat_props,
> +                     pc_piix_compat_defaults, pc_piix_compat_defaults_len);
>  }
>  
>  static void pc_i440fx_machine_10_0_options(MachineClass *m)
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index fd96d0345c..f6d89578d0 100644
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
I hope we do not omit any other machine that would actually need ramfb
rom. At the moment we take care of q35 and  piix. Anyone aware of any
other user?

Thanks

Eric
>  };
>  static const size_t pc_q35_compat_defaults_len =
>      G_N_ELEMENTS(pc_q35_compat_defaults);
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ff0d93fae0..a529500b70 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3564,7 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
>  
>  static const Property vfio_pci_dev_nohotplug_properties[] = {
>      DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
> -    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
> +    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, false),
>      DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
>                              ON_OFF_AUTO_AUTO),
>  };

