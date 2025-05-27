Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4833091njc;
        Tue, 27 May 2025 06:58:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHogSaGg7ZH3nY1MEZkif0pupQxEO1gCtIGjmf9oB5xGGa6EPc54j2Nm0kXnr3t9lv/AnOlydxyRuutQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHPDHXlwku76689ntJgkDpxYf35bM6nhNxAkE5oInSN73qE5zj96NbHpPT9QSn3ZlBdHY3
X-Received: by 2002:a17:903:44c:b0:22e:3b65:9286 with SMTP id d9443c01a7336-23414fc7372mr146827535ad.49.1748354317136;
        Tue, 27 May 2025 06:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748354317; cv=none;
        d=google.com; s=arc-20240605;
        b=bVIjfmjZQkvyCFGtScZcZuOhSZVLa89bybVi2jdlm5yXZol+NoSAu+OLI8JEgNYiNj
         s02iEvnZChk4Ol1j+1I+B0SpKMsFWn0Z+dr0zKyxOf4fSsvCLYiCkJHXoquDa8oK0Tjw
         54nIZDJ+oGw4yZOcgIQmCnwPv9cjc4jMqc4wvQyCY4zn7nxgCcnMk1YMENxN6jXBk+0q
         fFy0P47dqr2ROHORrKHCLGW9dh5L8yThpewdk6bzF2Nl0Be6PkIBJvit27RxqA3LqyQi
         BpvFm2/5fjtO22UiVNFffP6cE9JqZwaezU17+fiB7180Mp1ZMDqTjyMfmYc6vuLfNy4K
         q23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=9RfskbJ/6t5P19T9joHCP9S1OtUd5AIqA1Wk+AehjMc=;
        fh=uyYnseE4rwj3XC4uK8RhsHxamEMstLVZl95Upe7GxKk=;
        b=NDV3RHWrlR73knSXVJ4a5lc49t/kp14VwShNuXqyW+Qpp92xTqNft45TrdoALlkflC
         PA/mhCpecvZYXO0+jUWoImIAx0Ylq1t+/pOudBg0r1Xle1yUiLBWpYLCCO1dSbxAWJk+
         W+1WyrnxR0P+FLC/2weRA4qsizCmnslTwdUZdfXD4RsECCeFYQWWoPelCH3tfetrb2rg
         EwAmR2c7hXK9UtPU8XcPf7ZUCtV03/l3iY0SuV7kqF8H9uYYmrjHBpxeQc3PjIM/9Ekl
         3JZmmUrU6D+CvuXkg+jjWOWi4P8q7MkYeiZPUkMPBZV3GhMdKWSVXeH3THWQmB/KfkZQ
         TERw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KEKeeyRT;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-2347ee589a4si43955495ad.359.2025.05.27.06.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KEKeeyRT;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748354316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RfskbJ/6t5P19T9joHCP9S1OtUd5AIqA1Wk+AehjMc=;
	b=KEKeeyRTAlIRvxCNKvH0mK5WtUQA9gkt1wsBAejhXQ3QXzDIARaX8dJbtC1khwmhuU/Sxx
	XsZgM470A3iIj0PSs5mmf6m4Ip2bDvUm61d7rHd4/lWOMImppqV+42iMHROFM/KxpxsLHX
	ZnTYTAdIWLfY9PT2qeg0yevkod9zf2E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-Vd_RG1LoMgiHqGHzzaLzTw-1; Tue, 27 May 2025 09:58:34 -0400
X-MC-Unique: Vd_RG1LoMgiHqGHzzaLzTw-1
X-Mimecast-MFC-AGG-ID: Vd_RG1LoMgiHqGHzzaLzTw_1748354314
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-44059976a1fso16827925e9.1
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354313; x=1748959113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RfskbJ/6t5P19T9joHCP9S1OtUd5AIqA1Wk+AehjMc=;
        b=PRJuQ7VasqKAsejX24U7NXGHwPzvYLuz5wObhF87AoIhm+ye7CnUHl7QWAqkOjh14w
         6ADzy9vsVd+TUZhsYpKaVcoLdfG1EEeEMyLTGryszQK4hCuqQzabNxctfBCOm9SQtpk5
         V9jcFsbZ6qhIN95r8xIFNAnvdQVKUe+cbkZQjlQ44jNaLNu00an7l9nCal2QdLihWF7U
         viJMa4Jd3jSXSQuBmYpAop9SFL0aEH7yFpHXXAHnf61/7GNv0Ex3esMLhIpVXO3T0+0o
         Ahe64kh/uYdhKPm3NxczZgrGThwF9pDuS1fnyVT/BUcagngOrXjmMRGaZi5H20fIdbkN
         t9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVmJP0/UddjC96xu8J3KAPG5f3U642WRNYPkxrhlnkX2vVR2LXJuhrruOTmi+Ncf48Yw9zExHJzM8VjnA==@linaro.org
X-Gm-Message-State: AOJu0Yy30/Q4H8GmWY6Kb/IitsQ4zWbJolkwTXx82MqTYj3wR1WSfAcQ
	XdJXXHt5hH0HSM09nu0NbnjO/mrycfXio01QaJAj97PAfX73P4zLvU64qco6jzXZRt5TOeesYjT
	myLtYgmdR+JVjy0Wa9BOrVB4Wrtz3Grm/89t8yYa+xvZfsQhGqyhrmgddDg==
X-Gm-Gg: ASbGnct+t3YZhS2ccCevy+1w+hU5cerXu3JUjj855PYF+dE4Hb38XdXtsiPGFoMn5GZ
	NmuURiX58crvOC40TP/scpCJVk9XXg2mwOMaJh4Q6QMvvM+c9YUSnf9Fs73/xECFZEV3v9RiJ0U
	o/naYlDHeibspA/hYW1U0ZZnaypohatUHShmIramDaoLtPHiXhgjwq/L8EnrnlDDaPHbn9tn4Uv
	QfO6ZkcRrZ6Df1y/mHVaazvrUkvPoAmOomuZpj3ehvfc0Z4KJMspC0zn5CMgkK+zS4bpGkIeFq1
	5O1rvvO4dgyYSWJOjYqUfwn0bhJZk2vs
X-Received: by 2002:a05:600c:1e02:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-44d5c54c831mr98070525e9.26.1748354313498;
        Tue, 27 May 2025 06:58:33 -0700 (PDT)
X-Received: by 2002:a05:600c:1e02:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-44d5c54c831mr98070225e9.26.1748354313100;
        Tue, 27 May 2025 06:58:33 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm264883555e9.36.2025.05.27.06.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:58:32 -0700 (PDT)
Date: Tue, 27 May 2025 15:58:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 15/25] hw/i386/acpi-build: Introduce and use
 acpi_get_pci_host
Message-ID: <20250527155831.45fcd421@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-16-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-16-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o2ugOnAgceqqlrRk2yj1HhC_MCzpFI6xA2UDm2qJxaw_1748354314
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: QrHE9dPJiHde

On Tue, 27 May 2025 09:40:17 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> pcihp acpi_set_pci_info() generic code currently uses
> acpi_get_i386_pci_host() to retrieve the pci host bridge.
> 
> Let's rename acpi_get_i386_pci_host into acpi_get_pci_host and
> move it in pci generic code.
> 
> The helper is augmented with the support of ARM GPEX.
> 
> Also instead of using the machine child property to retrieve
> the PCI host bridge, we search for the actual object type using
> object_resolve_type_unambiguous().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> 
> ---
> 
> v1 -> v2
> - described the fact we changed the implementation of
>   acpi_get_pci_host() in the commit msg.
> ---
>  include/hw/acpi/pci.h |  2 ++
>  hw/acpi/pci.c         | 20 ++++++++++++++++++++
>  hw/acpi/pcihp.c       |  3 ++-
>  hw/i386/acpi-build.c  | 24 ++++--------------------
>  4 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index 4dca22c0e2..310cbd02db 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -41,4 +41,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>  
>  void build_srat_generic_affinity_structures(GArray *table_data);
>  
> +Object *acpi_get_pci_host(void);
> +
>  #endif
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index d511a85029..4191886ebe 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -26,6 +26,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
>  #include "qom/object_interfaces.h"
> +#include "qom/object.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/acpi/aml-build.h"
> @@ -33,6 +34,9 @@
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci/pci_device.h"
>  #include "hw/pci/pcie_host.h"
> +#include "hw/pci-host/i440fx.h"
> +#include "hw/pci-host/q35.h"
> +#include "hw/pci-host/gpex.h"
>  
>  /*
>   * PCI Firmware Specification, Revision 3.0
> @@ -301,3 +305,19 @@ void build_srat_generic_affinity_structures(GArray *table_data)
>      object_child_foreach_recursive(object_get_root(), build_acpi_generic_port,
>                                     table_data);
>  }
> +
> +Object *acpi_get_pci_host(void)
> +{
> +    Object *host;
> +
> +    host = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE, NULL);
> +    if (host) {
> +        return host;
> +    }
> +    host = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE, NULL);
> +    if (host) {
> +        return host;
> +    }
> +    host = object_resolve_type_unambiguous(TYPE_GPEX_HOST, NULL);
> +    return host;

while it will work, it's getting ridiculous.
(it's not likely to affect performance but if it can be helped,
I'd rather avoid searching)

Can we just reuse host bridge bus in stored in  pcihp state?
aka we do pass root_bus to acpi_pcihp_init() and then there is
AcpiPciHpState::root

then there are other places that call acpi_get_i386_pci_host()
to get root bus, can't we just get it from machine state that
callers get and pass it down as an argument? 


> +}
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 942669ea89..d800371ddc 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -36,6 +36,7 @@
>  #include "hw/pci-bridge/xio3130_downstream.h"
>  #include "hw/i386/acpi-build.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pci.h"
>  #include "hw/pci/pci_bus.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
> @@ -102,7 +103,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>  static void acpi_set_pci_info(bool has_bridge_hotplug)
>  {
>      static bool bsel_is_set;
> -    Object *host = acpi_get_i386_pci_host();
> +    Object *host = acpi_get_pci_host();
>      PCIBus *bus;
>      BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
>                        .has_bridge_hotplug = has_bridge_hotplug };
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index fe8bc62c03..6feb99e9eb 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -269,27 +269,11 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
>  #endif
>  }
>  
> -/*
> - * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
> - * On i386 arch we only have two pci hosts, so we can look only for them.
> - */
> -Object *acpi_get_i386_pci_host(void)
> -{
> -    PCIHostState *host;
> -
> -    host = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
> -    if (!host) {
> -        host = PCI_HOST_BRIDGE(object_resolve_path("/machine/q35", NULL));
> -    }
> -
> -    return OBJECT(host);
> -}
> -
>  static void acpi_get_pci_holes(Range *hole, Range *hole64)
>  {
>      Object *pci_host;
>  
> -    pci_host = acpi_get_i386_pci_host();
> +    pci_host = acpi_get_pci_host();
>  
>      if (!pci_host) {
>          return;
> @@ -1245,7 +1229,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>      sb_scope = aml_scope("\\_SB");
>      {
> -        Object *pci_host = acpi_get_i386_pci_host();
> +        Object *pci_host = acpi_get_pci_host();
>  
>          if (pci_host) {
>              PCIBus *pbus = PCI_HOST_BRIDGE(pci_host)->bus;
> @@ -1306,7 +1290,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
>          bool has_pcnt;
>  
> -        Object *pci_host = acpi_get_i386_pci_host();
> +        Object *pci_host = acpi_get_pci_host();
>          PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
>  
>          scope = aml_scope("\\_SB.PCI0");
> @@ -1946,7 +1930,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      Object *pci_host;
>      QObject *o;
>  
> -    pci_host = acpi_get_i386_pci_host();
> +    pci_host = acpi_get_pci_host();
>      if (!pci_host) {
>          return false;
>      }
