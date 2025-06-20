Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp858885njc;
        Fri, 20 Jun 2025 05:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCCX/jw8kM/MFFSvNbgGPE/x7e0OgWvTHBkrQdHjHcQKfdF68BsSCNeaqHLCFF4aLdFpLf93JXn/I+Pw==@linaro.org
X-Google-Smtp-Source: AGHT+IFeItUdnieUxMjkK5DfWknWdga5waPvQPY2CcV28S0ik+XlEGDrJhmInf95gRoykeD+sR3i
X-Received: by 2002:a05:6214:e4a:b0:6fa:ccb6:6036 with SMTP id 6a1803df08f44-6fd0a591efbmr46643786d6.35.1750423107283;
        Fri, 20 Jun 2025 05:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750423107; cv=none;
        d=google.com; s=arc-20240605;
        b=eDhDP1INKTcRlP9v/yN3qE41XdSPKNP4a3ur9J6nr7aPdfv+YhtYBMLKz2YZXwfkBH
         0EXL7jqCI9bKnPI5DVu+xao9hzWRYntik21Upk8W6D4g8TY1gNsLPqtKruqnrUfPyTMz
         6RT8nk4HCAV64cubOnOmkbOhO/nOuRS3Nyia/JQybHrr1sDTPUUr52V6hX9tzrDBtF0c
         0NJS+E/iTLYMN9GmZ6lzr8D3XGFEg+9UxSlW8a3UHfPteHmDpvOpAI/D6ggJqFU0sLmU
         4E8UgvJY39jdys9zjTe/FUccRt9cfzABVtiCwyP5jjSNpSHwE20ibKnAdQzCvV/SP+vi
         VvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=C3bLo7hIKrLc57/oF3Sb/Ap/DFpOsCGkOd7xZprMPlc=;
        fh=vkbtge4XRr44LhjHDpCGBYmJL+mEClHGoQMtMLo1SKc=;
        b=Ecqg8RDq+M50r6JOtP7hFJAudGij/IBeKFIJreB0KYvbwtW9PWPR4sa7dtK53B960s
         Xne+ZQZUgsJBZBtIJUYeZLnQvY2yiHSBfS2FB7blYX8s8NKrHZqcFVImBZZWqrh6KZiM
         pm0/bVVqvN4+OyUniU6gcgSHoBCpFlajiw0mDZQ4lec3kkp0PlHL6A00lRLN4EzXNomj
         nc8dEi00rMFVaI3egXfqqgMhXZwuoSUnwFB88syUJoGjgCcOKZb6J68SS0mirf/uhuQ1
         NMopCghBFNwBOyymHmpoEzKxgzWkvYHVHhOe9K7zxvj/oq2ygxfxrsgHkIWQMsNr0XUy
         BJyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NnXrDqcB;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a20399si161224185a.589.2025.06.20.05.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NnXrDqcB;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750423106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3bLo7hIKrLc57/oF3Sb/Ap/DFpOsCGkOd7xZprMPlc=;
	b=NnXrDqcBmJ2R3ijLnQhRj9NlnTKPdCPegD06hwElxsvEnGllOST/Zoi4GuSSbC155fxKWi
	6O3sLFprWMBpYfYXraz62v4ywSA3APls/35qRDwmqb/MHBWaSXScWRkXgrEOq0A4VGLw5J
	QxjgwvstyBlVIjZKKEwEYfM1yq05S00=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-XXA5gFzYPCOoqV_GhdqfIQ-1; Fri, 20 Jun 2025 08:38:25 -0400
X-MC-Unique: XXA5gFzYPCOoqV_GhdqfIQ-1
X-Mimecast-MFC-AGG-ID: XXA5gFzYPCOoqV_GhdqfIQ_1750423104
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso10694325e9.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750423104; x=1751027904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3bLo7hIKrLc57/oF3Sb/Ap/DFpOsCGkOd7xZprMPlc=;
        b=YlpIEzBIVHSYhu0CaFkwWbYbj+m+0Lw5jsn6bHAgguK8gmzD4TygXLtEPCKBNBIR4D
         POsQ0oYYYMu+ldodyUBlMGp8Px0hOZmOqe5UTNmUqM9YEg3jaoztmeI1G5dL4FuW1AQr
         nmH/NUGVIiVAxhdIoc0e+cqTLk6sjrpV6Z5AWotJq/V1td1ts5mmaQnGw19kHX4q+qDJ
         FzJ4BDN5PBjCfxFuQlXbzzbcBIfkN8RQMGB5GvzLUSJEN/bTEUhar2q2BNFlPvsVgiYX
         5QKivGpb08Lf2zxNmaldTuznbjM9YUazJooGaFrwqJ6peCaAu30eaCh4uBzGmtxAGBI1
         G9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRycQx/hRobZx8aupJ3yMhBNZdyTb3/XlUda1ayMT/dWSplCdkcTmlUotk5XLoJggRNAM5Ml4YLGAyXQ==@linaro.org
X-Gm-Message-State: AOJu0Yzy4mpPIqVoW/9iZQ3HkGGmOwHuegLr0KNviEvGMd9gmKGufUmd
	PS9Z97yMhkdol9PHQZsBkn3hIgGD6KKVCoup2WLwEJVLEgWcTKta950RdIu6iRuEHC/Ry8BmHWC
	pXrzmBcQP6yTxFanOYbx284N1OS/kSttKd75l/ATAv8xX8t47eznKy1NctA==
X-Gm-Gg: ASbGncu/KgtJce5zKjwFIyoN8vme4qoKnTwyPUU1/cOUrNWUOD7z/gs+0J3U3RnVY9e
	ZzdEYM7kDoi+yp4oDLHNkP65OG0iC0PJH9m/JrabDOFXzvEmT1WAJqs0UrefDkuXTOjtqucJTei
	zAPKbly7Qraik+ZWfDsnJ4dCLAAyBxLPS8OpzESbeNXoop6dCaty2JBI0Ta3mc4kpJHaD8KemPN
	KIEHZDyUQOZV2vs4kL6rB+IeSJd1VNi3FiBzhSEYQLBXW2+IVkC5QeBNfdApuLZJapKKCfCVwJq
	BT/aZCuD7emz
X-Received: by 2002:a05:600c:314f:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-453656c313fmr22699725e9.28.1750423104495;
        Fri, 20 Jun 2025 05:38:24 -0700 (PDT)
X-Received: by 2002:a05:600c:314f:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-453656c313fmr22699495e9.28.1750423104075;
        Fri, 20 Jun 2025 05:38:24 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d133175bsm1975804f8f.92.2025.06.20.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:38:23 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:38:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 17/29] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
Message-ID: <20250620143822.7ab69038@fedora>
In-Reply-To: <20250620103538.000021c1@huawei.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-18-eric.auger@redhat.com>
	<20250620103538.000021c1@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Keq9lVsHKNVkJkP5tI17mUgUAwkq8HXlReqHydvRc18_1750423104
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: j/i/z2HCfkY5

On Fri, 20 Jun 2025 10:35:38 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Mon, 16 Jun 2025 11:46:46 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > Modify the DSDT ACPI table to enable ACPI PCI hotplug.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > 
> > ---
> > v2 -> v3:
> > - use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
> > - use cihp_state->use_acpi_hotplug_bridge  
> 
> pcihp_state
> 
> Takes a bit of searching to find the various bits of the
> same support on x86 but this seems to match up.
> Exactly when things are built does vary but not I think
> in a way that matters.  e.g. I think on x86 the
> EDSM stuff is built whether or not we have pcihp enabled
> whereas here you've made it conditional on using acpi
> hp.  Perhaps a tiny bit more description on that would be
> useful if you do a v4?

edsm should be built regardless of pcihp
(well intention was there, whether I messed it up or not I don't know)

idea is that non hotplug ports can have a static acpi-index,
so it doesn't depend on pcihp.

> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> 
> > ---
> >  include/hw/acpi/pcihp.h  |  2 ++
> >  include/hw/arm/virt.h    |  1 +
> >  hw/arm/virt-acpi-build.c | 22 ++++++++++++++++++++++
> >  hw/arm/virt.c            |  2 ++
> >  hw/arm/Kconfig           |  2 ++
> >  5 files changed, 29 insertions(+)
> > 
> > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > index 5506a58862..9ff548650b 100644
> > --- a/include/hw/acpi/pcihp.h
> > +++ b/include/hw/acpi/pcihp.h
> > @@ -38,6 +38,8 @@
> >  #define ACPI_PCIHP_SEJ_BASE 0x8
> >  #define ACPI_PCIHP_BNMR_BASE 0x10
> >  
> > +#define ACPI_PCIHP_SIZE 0x0018
> > +
> >  typedef struct AcpiPciHpPciStatus {
> >      uint32_t up;
> >      uint32_t down;
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 9a1b0f53d2..0ed2e6b732 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -79,6 +79,7 @@ enum {
> >      VIRT_ACPI_GED,
> >      VIRT_NVDIMM_ACPI,
> >      VIRT_PVTIME,
> > +    VIRT_ACPI_PCIHP,
> >      VIRT_LOWMEMMAP_LAST,
> >  };
> >  
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index d7547c8d3b..a2e58288f8 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -34,6 +34,7 @@
> >  #include "hw/core/cpu.h"
> >  #include "hw/acpi/acpi-defs.h"
> >  #include "hw/acpi/acpi.h"
> > +#include "hw/acpi/pcihp.h"
> >  #include "hw/nvram/fw_cfg_acpi.h"
> >  #include "hw/acpi/bios-linker-loader.h"
> >  #include "hw/acpi/aml-build.h"
> > @@ -809,6 +810,8 @@ static void
> >  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  {
> >      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> > +    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
> > +    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
> >      Aml *scope, *dsdt;
> >      MachineState *ms = MACHINE(vms);
> >      const MemMapEntry *memmap = vms->memmap;
> > @@ -868,6 +871,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  
> >      aml_append(dsdt, scope);
> >  
> > +    if (pcihp_state->use_acpi_hotplug_bridge) {
> > +        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
> > +
> > +        aml_append(pci0_scope, aml_pci_edsm());
> > +        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
> > +                               memmap[VIRT_ACPI_PCIHP].base);
> > +        build_append_pcihp_resources(pci0_scope,
> > +                                     memmap[VIRT_ACPI_PCIHP].base,
> > +                                     memmap[VIRT_ACPI_PCIHP].size);
> > +
> > +        /* Scan all PCI buses. Generate tables to support hotplug. */
> > +        build_append_pci_bus_devices(pci0_scope, vms->bus);
> > +        if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
> > +            build_append_pcihp_slots(pci0_scope, vms->bus);
> > +        }
> > +        build_append_notification_callback(pci0_scope, vms->bus);
> > +        aml_append(dsdt, pci0_scope);
> > +    }
> > +
> >      /* copy AML table into ACPI tables blob */
> >      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> >    
> 
