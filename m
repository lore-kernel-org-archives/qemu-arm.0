Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp828912njc;
        Fri, 20 Jun 2025 04:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWciEU9wLf+WbI3wB2yl/6ZekonV85i97lfGimmOOHvJOHltNdaV6uweL1jP1faLA7fbs84VKekCw6/Sw==@linaro.org
X-Google-Smtp-Source: AGHT+IErY4GitHqSNl7IzUW+k8c0YB0/dOOW/uTd/1du4TNfnA5O5RgyVsN8Nbtkyy0wADtLXaXW
X-Received: by 2002:a05:6214:54c5:b0:6e8:f433:20a8 with SMTP id 6a1803df08f44-6fd0a4683f0mr37402036d6.9.1750420121084;
        Fri, 20 Jun 2025 04:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750420121; cv=none;
        d=google.com; s=arc-20240605;
        b=bbc+Om7zeD/oFEqH8Jpj3GWIY1I/S6PfEJqOWgd9ZEcpgUtJB+kxHJYYO37pbpQqfs
         O12PI+VhI4BvYIzhwxsf9qr+zHCRUcA+YM5cyEUY65uJTYnjYoVuWONAAdt/ezMITgwG
         vCCtPiSK/AFIlQ0C50ar2zYa4su2tfo2sYCLJCYnqWsYASqTzZVnDy/dbFExwWsvu49r
         AfiHXJ2XhiCAaxwCmcbXa4MMLPIKcPPH5OgkQPls8xdV0ojsfzcYCxA8mSK1AaI7MiqJ
         gJ69V+0lva60MhxyChakfHefuXl0HD2wXElc7Gwy+EPkbfcVUY76uMz9jVrYMNT9xY1Q
         6p/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=nrtutyhe3vPjXSe4x5cAA5qlcu9MfmOyH4uCxbGo/+A=;
        fh=vhAXch0GaOOzDafz2usGm4bdRY/IaJUYY2ryk9mtuaM=;
        b=Y0rbRrBChM9eMhvn1a5IV65ZpfQwJsJNdbgBpJQyu2y5TmKdMKR79JbGdoZ0pKz8gg
         YSre1ShHtGgtRyimraBGyBrt8e8eIgG0cye3UcHiDJrZVKA2N3X2rd/urEV/deEJ0RFc
         CkeFaPfsl76otTfRR++3ZWPJDK6ngZdlhe2THyXT5sg/ahDGCDuBmnbqI8Y2LG08jXup
         M8DyOv35uDmASSXBMO7PQqWymek/XLpf6Vk5bPw1Nlz4W83lIvHntxCG/0JskZe0xOmD
         zqD8R6pGW66w8R6wnhFYoo4icKFOApgrzQb5kIbBMhhlpAzRLi0oekOUndLAnThWSKAG
         XUNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jb8F0EGM;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd0959b2basi18670406d6.377.2025.06.20.04.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jb8F0EGM;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750420120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrtutyhe3vPjXSe4x5cAA5qlcu9MfmOyH4uCxbGo/+A=;
	b=Jb8F0EGMOW+METDZa+q2ycOUrxl4lWJCO14ILUtpPUeiE0KKRNjMoVjILZh5oGxIdAtFYz
	lp+wO8pudy4O/YoprnzHsJ7j4OHxc6Xz6VoEz4KMZGPEZbeSpDmROwM5z7rcg9uH8Q6W5m
	NgDsKOadJmCIQvfdB6vC6J6C5stBD68=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-F6CokMh2N86BAHfWFhkhAg-1; Fri, 20 Jun 2025 07:48:39 -0400
X-MC-Unique: F6CokMh2N86BAHfWFhkhAg-1
X-Mimecast-MFC-AGG-ID: F6CokMh2N86BAHfWFhkhAg_1750420119
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so420645f8f.3
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 04:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750420118; x=1751024918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrtutyhe3vPjXSe4x5cAA5qlcu9MfmOyH4uCxbGo/+A=;
        b=Phxi6BxT3iPSseTRhDJYOqnTCiKy0zcISwhZfqcecOy/dDiExT9hUWREdvBZNUN5M5
         mNgiOEbzJaPvM5LDZ3MNsFOhSInjUMJfXSTmQba4olwrOP8+3zViHKdSg2lZHL91+YR6
         AhdbvQ4TJbFlBUrnwiAUsqsp1d/1jHZw753cDk01uNUUtPWyuhDCj5VBByAahTHrYcUw
         SjfBFedXlw768ZuwLXVC0UGP/OmCUh0eMdXjY3xpSs8BrQc+sPEBafAMqIp5TUwwYmBo
         s3gr5KJDboL1PPdKnskjHw9OXTG8Ve8rHRUENmBeRZ+g2OIQRy3MSprH+v9k1Zh2G3AX
         dS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE2TXx+2auvH90HPwEt9nPmKO3gp8mCpoGbDbiCu2+yRgXeXegyE4MVEou6eICky2XYtKAzReHZ6gl/w==@linaro.org
X-Gm-Message-State: AOJu0YxVBhOihmmdjFo65O1WHB5RexRKuFF0TlBpj39LiINYhtJgcewH
	WFRxxbPMmJF6gOWvulZHL90QBd+8aajK+FJn99xuCqj1F+LfFk2bFkyM6sqxPJRqpYZ2uJ7jftv
	G45GdEKSCjDuOJXmVSE96HyXQD61N+J9LH/h9X4pSJV3vDuhBniDDftly6Q==
X-Gm-Gg: ASbGncuqcX6Rxt9Tm67pS0i9AVGDkGWaJQn6Hl5UFvYrV3/QLZCrvU/sp6ytrDuj6Iq
	/vm6Crn62SIYuubUrbVRMUjUTBAb0wFwOjuA/ruiSVGfxIR3n46tZT1u0zCgexGldj3gwCKXTen
	zj6799+MTCFMgq1qofvBlQmfZc9on1xApkoLJP77cBv4mKNYJiZts3bsMY4LzPGLA4hngix2irp
	m+nBbQpCIc7naAo5VMLor501EVLnFsSLJvZwoIZmb4PaJ/FSQv99BuoZzzGaT6st934gyCDPljm
	i0WbEqdju1q5
X-Received: by 2002:a05:6000:18a4:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a6d12bb700mr2313673f8f.1.1750420118504;
        Fri, 20 Jun 2025 04:48:38 -0700 (PDT)
X-Received: by 2002:a05:6000:18a4:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a6d12bb700mr2313648f8f.1.1750420118109;
        Fri, 20 Jun 2025 04:48:38 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19e7dsm1905605f8f.38.2025.06.20.04.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:48:37 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:48:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 06/29] hw/pci-host/gpex-acpi: Split host bridge OSC
 and DSM generation
Message-ID: <20250620134836.5f467b6e@fedora>
In-Reply-To: <20250616094903.885753-7-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-7-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oHLuF1DT8kbLjoD5AzWr-KnMb7dqKrDAKisb8oMXt_M_1750420119
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: N19BbKBuQCmf

On Mon, 16 Jun 2025 11:46:35 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
> it appends the _OSC method but in fact it also appends the _DSM method
> for the host bridge. Let's split the function into two separate ones
> and let them return the method Aml pointer instead. This matches the
> way it is done on x86 (build_q35_osc_method). In a subsequent patch
> we will replace the gpex method by the q35 implementation that will
> become shared between ARM and x86.
> 
> acpi_dsdt_add_host_bridge_methods is a new top helper that generates
> both the _OSC and _DSM methods.

I'd get rid of wrapper, but it's not something that worth to fight over,
so

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> We take the opportunity to move SUPP and CTRL in the _osc method
> that use them.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - moved
>     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
>     aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
>   into the _osc function. (Jonathan)
>   hence discarded Gustavo's and Igor's R-bs
> ---
>  hw/pci-host/gpex-acpi.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index f34b7cf25e..80fc2bf032 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -50,14 +50,12 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>      }
>  }
>  
> -static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
> +static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
>  {
> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
> -
> -    /* Declare an _OSC (OS Control Handoff) method */
> -    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> -    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
> +    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
>      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> +    aml_append(method, aml_name_decl("SUPP", aml_int(0)));
> +    aml_append(method, aml_name_decl("CTRL", aml_int(0)));
>      aml_append(method,
>          aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
>  
> @@ -103,9 +101,13 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>                                 aml_name("CDW1")));
>      aml_append(elsectx, aml_return(aml_arg(3)));
>      aml_append(method, elsectx);
> -    aml_append(dev, method);
> +    return method;
> +}
>  
> -    method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
> +static Aml *build_host_bridge_dsm(void)
> +{
> +    Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
> +    Aml *UUID, *ifctx, *ifctx1, *buf;
>  
>      /* PCI Firmware Specification 3.0
>       * 4.6.1. _DSM for PCI Express Slot Information
> @@ -124,7 +126,15 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>      byte_list[0] = 0;
>      buf = aml_buffer(1, byte_list);
>      aml_append(method, aml_return(buf));
> -    aml_append(dev, method);
> +    return method;
> +}
> +
> +static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
> +                                              bool enable_native_pcie_hotplug)
> +{
> +    /* Declare an _OSC (OS Control Handoff) method */
> +    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> +    aml_append(dev, build_host_bridge_dsm());
>  }
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> @@ -193,7 +203,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              if (is_cxl) {
>                  build_cxl_osc_method(dev);
>              } else {
> -                acpi_dsdt_add_pci_osc(dev, true);
> +                acpi_dsdt_add_host_bridge_methods(dev, true);
>              }
>  
>              aml_append(scope, dev);
> @@ -268,7 +278,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      }
>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>  
> -    acpi_dsdt_add_pci_osc(dev, true);
> +    acpi_dsdt_add_host_bridge_methods(dev, true);
>  
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
